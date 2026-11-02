-- 将本地数据同步给所有玩家
---@class Sync
local M = Class 'Sync'

---@package
M.speedLimit = 4096 -- 每帧最多同步4096字节的数据
---@package
M.syncLimit = 1024 * 1024 -- 不允许同步超过1M的数据
---@package
M.queue = {} -- 当前等待同步的数据队列，[id, bin]

---@package
---@type thread
M.syncWorker = nil -- 用于分段发送数据的worker（协程）

---@private
M.syncMap = {}

---@package
M.syncLocalCount = 0
---@package
M.syncLocalCallbackMap = {}

---@package
M.syncPartsLocalCount = 0
---@package
M.syncPartsMap = y3.util.multiTable(2)

---@package
---@type boolean?
M.singleMode = nil

local totoal_broadcast_count = 0
local function broadcast_with_log(tag, data)
    broadcast_lua_msg(tag, data)
    totoal_broadcast_count = totoal_broadcast_count + #data
    log.debug('总计发送数据量: ', totoal_broadcast_count)
end

---@package
M.pausePollInterval = 0.1 -- 追帧期间轮询广播状态的间隔（客户端时钟，不依赖逻辑帧推进）

-- 客户端同步广播状态探测（只读），返回 0=可发 / 1=追帧暂缓 / 2=观战·录像不参与
-- 判据与引擎广播守卫一致（broadcast_msg_member.broadcast_custom_msg）：
--   观战/录像 → 2；在线 owner.server 且 owner.is_forbid_operation → 1（覆盖普通堆积与追帧恢复）；否则 0
---@class py.GameAPI
---@field pyexec fun(code: string): integer
---@field sync_broadcast_state fun(): integer

---@type fun(code: string): integer
local pyexec = rawget(_G, 'GameAPI') and GameAPI.pyexec
if pyexec then
    pyexec [===[
from commons.black_box.api.game_api import GameAPI

def sync_broadcast_state(self, _warned=[False]):
	try:
		from _G import G
		from commons.black_box.consts.game_consts import WatchModeConsts
		from frame_sync.client.flags import FsClientFlags
		bb = G.black_box
		if bb.IsPlayingVideo() or WatchModeConsts.LAUNCHED_AS_WATCHER or FsClientFlags.IS_WATCH_MODE:
			return 2
		owner = bb.owner
		if owner and owner.server and owner.is_forbid_operation:
			return 1
		return 0
	except Exception as e:
		if not _warned[0]:
			_warned[0] = True
			print('[sync.lua] sync_broadcast_state failed, allowing send: %s' % e)
		return 0


GameAPI.sync_broadcast_state = sync_broadcast_state
]===]
end

-- 读取同步广播状态；读不到一律按“可发”处理，保持原有行为（纯单机、无 GameAPI 环境不受影响）
local broadcastStateWarned = false
local function warnBroadcastStateOnce(msg)
    if broadcastStateWarned then
        return
    end
    broadcastStateWarned = true
    log.warn('sync.lua', '读取同步广播状态失败，按可发处理: %s' % tostring(msg))
end

---@return integer # 0=可发 1=追帧暂缓 2=观战/录像不参与
local function readBroadcastState()
    local api = rawget(_G, 'GameAPI')
    if not api then
        return 0
    end
    local fn = api.sync_broadcast_state
    if not fn then
        warnBroadcastStateOnce('GameAPI.sync_broadcast_state 不存在（pyexec 未生效）')
        return 0
    end
    local ok, state = pcall(fn)
    if not ok then
        warnBroadcastStateOnce(state)
        return 0
    end
    local num = tonumber(state)
    if num == nil then
        warnBroadcastStateOnce('返回值非数字: ' .. tostring(state))
        return 0
    end
    return math.tointeger(num) or 0
end

-- 观战/录像：清空待发数据与本地 done 回调。
-- 引擎在该状态下本就不会把广播发出去，回包不会再来，done 只能丢弃（不能伪造成成功）
local function dropPendingSync()
    for i = #M.queue, 1, -1 do
        M.queue[i] = nil
    end
    for count in pairs(M.syncLocalCallbackMap) do
        M.syncLocalCallbackMap[count] = nil
    end
end

---@package
---@return boolean
function M.isSingleMode()
    if M.singleMode ~= nil then
        return M.singleMode
    end
    local count = 0
    for player in y3.player_group.get_all_players():pairs() do
        if player:need_sync() then
            count = count + 1
            if count > 1 then
                y3.ltimer.wait(60, function ()
                    M.singleMode = nil
                end)
                M.singleMode = false
                return false
            end
        end
    end
    M.singleMode = true
    return true
end

local function startWorker(dispose)
    ---@async
    local function run()
        local limit = M.speedLimit
        local idleCount = 0

        ---@async
        local function waitNextFrame()
            y3.await.yield(function (resume)
                y3.ltimer.wait_frame(1, resume)
            end)
            limit = M.speedLimit
        end

        -- 等到允许发送为止：state==1（追帧/断线恢复）期间只用客户端时钟轮询等待，
        -- 期间不消耗发送预算、不丢弃已出队对象，恢复后继续按原顺序与限速发送。
        -- 返回 false 表示当前是观战/录像（state==2），调用方应丢弃队列并退出 worker。
        ---@async
        ---@return boolean
        local function waitSendable()
            local state = readBroadcastState()
            while state == 1 do
                y3.await.yield(function (resume)
                    y3.ctimer.wait(M.pausePollInterval, resume)
                end)
                state = readBroadcastState()
            end
            return state ~= 2
        end

        while true do
            -- 队列空则只做原来的空转退出，不做状态轮询
            if not M.queue[1] then
                idleCount = idleCount + 1
                if idleCount > 10 then
                    break
                end
                waitNextFrame()
                goto continue
            end
            -- 每次实际 broadcast 之前检查，先检查再出队，避免取出来又丢掉
            if not waitSendable() then
                dropPendingSync()
                break
            end
            local current = table.remove(M.queue, 1)
            local id, bin = current[1], current[2]
            if limit >= #bin then
                limit = limit - #bin
                broadcast_with_log(id, bin)
                goto continue
            elseif #bin > M.syncLimit then
                log.error('sync.lua', '同步数据过大，id: {%s}, 长度: {%s}' % { id, #bin })
            else
                local index = M.syncPartsLocalCount + 1
                M.syncPartsLocalCount = index
                broadcast_with_log('$sync_part', y3.dump.encode {
                    index = index,
                    part  = 1,
                    data  = bin:sub(1, limit)
                })
                local nextStart = limit + 1
                waitNextFrame()
                local aborted = false
                for i = 2, 10000 do
                    -- 分片中途也要检查：追帧暂停时保留剩余分片，恢复后接着发
                    if not waitSendable() then
                        aborted = true
                        break
                    end
                    local currentEnd = nextStart + limit - 1
                    if currentEnd >= #bin then
                        broadcast_with_log('$sync_part', y3.dump.encode {
                            id    = id, -- 标记传输完毕
                            index = index,
                            part  = i,
                            data  = bin:sub(nextStart),
                            --hash  = y3.hash(bin),
                        })
                        limit = limit - (#bin - nextStart + 1)
                        break
                    else
                        broadcast_with_log('$sync_part', y3.dump.encode {
                            index = index,
                            part  = i,
                            data  = bin:sub(nextStart, currentEnd)
                        })
                        nextStart = currentEnd + 1
                        waitNextFrame()
                    end
                end
                if aborted then
                    dropPendingSync()
                    break
                end
            end
            ::continue::
        end
    end

    ---@async
    return y3.await.call(function ()
        y3.await.sleep(0)
        xpcall(run, log.error)
        dispose()
    end)
end

---@param id string
---@param bin string
local function broadcast_with_limit(id, bin)
    M.queue[#M.queue+1] = { id, bin }
    if M.syncWorker then
        return
    end
    ---@async
    M.syncWorker = startWorker(function ()
        M.syncWorker = nil
    end)
end

-- 发送本地的信息，使用 `onSync` 来同步接受数据  
-- 请在本地环境中使用此函数
---@generic T: Serialization.SupportTypes
---@param id string # 以 `$` 开头的 id 保留为内部使用
---@param data? T # 如果包含对象，需要在类上实现 `__encode` 和 `__decode` 方法
---@param done? async fun(data: T)
function M.send(id, data, done)
    if not y3.config.sync.send_in_single_mode and M.isSingleMode() then
        ---@async
        y3.await.call(function ()
            y3.await.sleep(0.01)
            ---@async
            y3.player.with_local(function (local_player)
                local callback = M.syncMap[id]
                if callback then
                    xpcall(callback, log.error, data, local_player)
                end
                if done then
                    done(data)
                end
            end)
        end)
        return
    end
    -- 观战/录像客户端不参与同步广播：直接丢弃，不入队列，也不登记 done（不能伪造成功）
    if readBroadcastState() == 2 then
        return
    end
    if done then
        M.syncLocalCount = M.syncLocalCount + 1
        M.syncLocalCallbackMap[M.syncLocalCount] = done
        local bin = y3.dump.encode {
            id    = id,
            count = M.syncLocalCount,
            value = data,
        }
        broadcast_with_limit('$sync_proxy', bin)
    else
        local bin = y3.dump.encode(data)
        broadcast_with_limit(id, bin)
    end
end

-- 同步接收数据，回调函数在同步后执行  
-- 同一个 id 只能注册一个回调函数，后注册的会覆盖前面的
---@param id string
---@param callback async fun(data: any, source: Player)
function M.onSync(id, callback)
    M.syncMap[id] = callback
end

local function resolveBroadCast(id, content, player)
    local callback = M.syncMap[id]
    if not callback then
        return
    end
    local suc, value = pcall(y3.dump.decode, content)
    if not suc then
        log.warn('同步数据解码失败：', id, value)
        return
    end
    y3.await.call(function ()
        xpcall(callback, log.error, value, player)
    end)
end

y3.game:event('游戏-接收广播信息', function (trg, data)
    resolveBroadCast(data.broadcast_lua_msg_id, data.broadcast_lua_msg_content, data.player)
end)

---@param data table
---@param source Player
M.onSync('$sync_proxy', function (data, source)
    y3.await.call(function ()
        local id    = data.id
        local count = data.count
        local value = data.value
        local callback = M.syncMap[id]
        if callback then
            xpcall(callback, log.error, value, source)
        end
        y3.player.with_local(function (local_player)
            if source ~= local_player then
                return
            end
            local done = M.syncLocalCallbackMap[count]
            M.syncLocalCallbackMap[count] = nil
            if done then
                xpcall(done, log.error, value)
            end
        end)
    end)
end)

---@param data table
---@param source Player
M.onSync('$sync_part', function (data, source)
    local index = data.index
    local part  = data.part
    local pid   = source:get_id()
    local cache = M.syncPartsMap[pid][index]
    if not cache then
        cache = {
            id    = nil,
            len   = nil,
            parts = {},
        }
        M.syncPartsMap[pid][index] = cache
    end
    cache.parts[part] = data.data
    if data.id then
        cache.id  = data.id
        cache.len = data.part
        --cache.hash = data.hash
    end
    if not cache.id then
        return
    end
    -- 是否填充完毕？
    for i = 1, cache.len do
        if cache.parts[i] == nil then
            return
        end
    end

    M.syncPartsMap[pid][index] = nil

    local bin = table.concat(cache.parts)
    --assert(cache.hash == y3.hash(bin), 'hash 不匹配')
    resolveBroadCast(cache.id, bin, source)
end)

return M
