-- 将本地数据同步给所有玩家
---@class Sync
local M = Class 'Sync'

---@private
M.syncMap = {}

M.syncLocalCount = 0
M.syncLocalCallbackMap = {}

---@package
---@type boolean?
M.singleMode = nil

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
        local bin = y3.dump.encode({
            id    = id,
            count = M.syncLocalCount,
            value = data,
        })
        broadcast_lua_msg('$sync_proxy', bin)
    else
        local bin = y3.dump.encode(data)
        broadcast_lua_msg(id, bin)
    end
end

-- 同步接收数据，回调函数在同步后执行  
-- 同一个 id 只能注册一个回调函数，后注册的会覆盖前面的
---@param id string
---@param callback async fun(data: Serialization.SupportTypes, source: Player)
function M.onSync(id, callback)
    M.syncMap[id] = callback
end

y3.game:event('游戏-接收广播信息', function (trg, data)
    local id = data.broadcast_lua_msg_id
    local callback = M.syncMap[id]
    if not callback then
        return
    end
    local suc, value = pcall(y3.dump.decode, data.broadcast_lua_msg_content)
    if not suc then
        return
    end
    y3.await.call(function ()
        xpcall(callback, log.error, value, data.player)
    end)
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

return M
