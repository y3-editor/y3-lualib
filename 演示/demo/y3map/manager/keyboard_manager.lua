local M = {}

---焦点单位
---@param player Player
function M:focus_unit(player)
    local unit = player:get_all_units():get_first()
    y3.camera.linear_move_by_time(player, unit:get_point(), 1, y3.const.CameraMoveMode['DEC'])
end

---选择单位
---@param player Player
function M:select_unit(player)
    local unit = player:get_all_units():get_first()
    player:select_unit(unit)
    unit:set_select_effect_visible(true)
end

---@param key string
---@param player Player
local function deal_key_down(key, player)
    print('当前按下的键：' .. key)
    if key == 'SPACE' then
        M:focus_unit(player)
    elseif key == 'F1' then
        M:select_unit(player)
    end
end

function M:init()
    for key, value in pairs(y3.const.KeyboardKey) do
        y3.game:event('键盘-按下', value, function(trg, data)
            local local_player = y3map.global:get_local_player()
            if local_player == data.player then
                deal_key_down(key, data.player)
            end
        end)
    end
end

return M
