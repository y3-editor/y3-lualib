local template = y3.object.unit[134274912] -- 以关羽作为模板

---@type EditorObject.Unit[]
local new_units = {}

for i = 1, 5 do
    new_units[i] = template:new()
    new_units[i].data.name = '新建单位' .. tostring(i)
    print('创建了新的单位物编：', new_units[i].key, new_units[i].data.name)
end

y3.game:event('键盘-按下', y3.const.KeyboardKey['SPACE'], function (trg, data)
    for _, unit in ipairs(new_units) do
        y3.player(1):create_unit(unit.key)
    end
end)
