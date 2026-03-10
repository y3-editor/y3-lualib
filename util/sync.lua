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
    return y3.await.call(function ()
        local limit = M.speedLimit
        local idleCount = 0

        ---@async
        local function waitNextFrame()
            y3.await.yield(function (resume)
                y3.ltimer.wait_frame(1, resume)
            end)
            limit = M.speedLimit
        end

        while true do
            local current = table.remove(M.queue, 1)
            if not current then
                idleCount = idleCount + 1
                if idleCount > 10 then
                    break
                end
                waitNextFrame()
                goto continue
            end
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
                for i = 2, 10000 do
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
            end
            ::continue::
        end
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
---@param callback async fun(data: Serialization.SupportTypes, source: Player)
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
