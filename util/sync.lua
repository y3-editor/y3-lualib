-- 将本地数据同步给所有玩家
---@class Sync
local M = Class 'Sync'

---@private
M.syncMap = {}

-- 发送本地的信息，使用 `onSync` 来同步接受数据  
-- 请在本地环境中使用此函数
---@param id string # 以 `$` 开头的 id 保留为内部使用
---@param data Serialization.SupportTypes
function M.send(id, data)
    local bin = y3.dump.encode(data)
    broadcast_lua_msg(id, bin)
end

-- 同步接收数据，回调函数在同步后执行  
-- 同一个 id 只能注册一个回调函数，后注册的会覆盖前面的
---@param id string
---@param callback fun(data: Serialization.SupportTypes, source: Player)
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
    xpcall(callback, log.error, value, data.player)
end)

return M
