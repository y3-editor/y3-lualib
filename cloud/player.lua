-- 云端玩家数据落到 Y3：y3.cloud.player
-- 收到 Player.GetAll 应答与 Player.Sync 广播后逐项写入；业务设置钩子后改为交给钩子

---@class Cloud.Player
local M = {}

---@type fun(player: Player, name: string, value: number): boolean?
local hook

---@param role_id integer
---@param values table<string, number>
local function apply_attribute(role_id, values)
    if type(values) ~= 'table' then
        return
    end

    local player = y3.player.get_by_id(role_id)
    if not player then
        return
    end

    for name, value in pairs(values) do
        local handled = hook and hook(player, name, value)
        if not handled then
            player:set(name, value)
        end
    end
end

---@param data any
local function on_sync(data)
    local players = data and data.attribute
    if type(players) ~= 'table' then
        return
    end
    for role_id, values in pairs(players) do
        apply_attribute(role_id, values)
    end
end

y3.cloud.rpc.register('Player.Sync', on_sync)

local function pull()
    y3.cloud.rpc.request('Player.GetAll', nil, function (suc, data, err)
        if not suc then
            log.warn('y3.cloud.player: request failed, ' .. tostring(err))
            return
        end
        on_sync(data)
    end)
end

y3.cloud.on_ready(pull)

---设置属性钩子；返回 true 表示已由钩子处理，该属性不再写入 Y3
---@param callback fun(player: Player, name: string, value: number): boolean?
function M.set_player_hook(callback)
    hook = callback
end

y3.cloud.player = M