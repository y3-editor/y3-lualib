---@class Player
---@field package _selecting_unit? Unit
---@field package _selecting_group? UnitGroup
local M = Class 'Player'

---@return Unit?
function M:get_selecting_unit()
    return self._selecting_unit
end

---@return UnitGroup?
function M:get_selecting_unit_group()
    return self._selecting_group
end

y3.game:event('选中-单位', function (trg, data)
    data.player._selecting_unit = data.unit
    data.player._selecting_group = nil
end)

y3.game:event('选中-单位组', function (trg, data)
    data.player._selecting_unit = data.unit_group_id_list:get_first()
    data.player._selecting_group = data.unit_group_id_list
end)

y3.game:event('选中-取消', function (trg, data)
    data.player._selecting_unit = nil
    data.player._selecting_group = nil
end)
