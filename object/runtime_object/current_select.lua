---@class Player
---@field package _selecting_unit? Unit
---@field package _selecting_group? UnitGroup
---@field package _local_selecting_unit? Unit
---@field package _local_selecting_group? UnitGroup
local M = Class 'Player'

---获取选中的单位（同步）
---@return Unit?
function M:get_selecting_unit()
    return self._selecting_unit
end

---获取选中的单位组（同步）
---@return UnitGroup?
function M:get_selecting_unit_group()
    return self._selecting_group
end

---获取本地选中的单位（本地）
---@return Unit?
function M:get_local_selecting_unit()
    return self._local_selecting_unit
end

---获取本地选中的单位组（本地）
---@return UnitGroup?
function M:get_local_selecting_unit_group()
    return self._local_selecting_group
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

y3.game:event('本地-选中-单位', function (trg, data)
    data.player._local_selecting_unit = data.unit
    data.player._local_selecting_group = nil
end)

y3.game:event('本地-选中-单位组', function (trg, data)
    data.player._local_selecting_unit = data.unit_group_id_list:get_first()
    data.player._local_selecting_group = data.unit_group_id_list
end)

y3.game:event('本地-选中-取消', function (trg, data)
    data.player._local_selecting_unit = nil
    data.player._local_selecting_group = nil
end)
