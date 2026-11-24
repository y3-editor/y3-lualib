-- 云端玩家属性落到 Y3：y3.cloud.attribute
-- 收到 Player.Attr.GetAll 应答与 Player.Attr.Sync 广播后逐项 Player:set；业务设置钩子后改为交给钩子

---@class Cloud.Attribute
local M = {}

---@type fun(player: Player, name: string, value: number): boolean?
local hook

---设置属性钩子；返回 true 表示已由钩子处理，该属性不再写入 Y3
---@param callback fun(player: Player, name: string, value: number): boolean?
function M.set_player_hook(callback)
    hook = callback
end

---@param role_id integer
---@param values table<string, number>
local function apply(role_id, values)
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
    local players = data and data.players
    if type(players) ~= 'table' then
        return
    end
    for role_id, values in pairs(players) do
        apply(role_id, values)
    end
end

y3.cloud.rpc.register('Player.Attr.Sync', on_sync)

local function pull()
    y3.cloud.rpc.request('Player.Attr.GetAll', nil, function (suc, data, err)
        if not suc then
            log.warn('y3.cloud.attribute: request failed, ' .. tostring(err))
            return
        end
        on_sync(data)
    end)
end

y3.cloud.on_ready(pull)

y3.cloud.attribute = M