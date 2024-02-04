local template = y3.物编.unit[134274912].data.dodge_rate -- 以关羽作为模板

---@type EditorObject.Unit[]
local new_units = {}



for i = 1, 5 do
    new_units[i] = template:new()
    new_units[i].data.name = "新建单位" .. tostring(i)
    print("创建了新的单位物编：", new_units[i].key, new_units[i].data.name)
end

y3.游戏:事件("键盘-按下", y3.const.KeyboardKey["SPACE"], function(trg, data)
    for _, unit in ipairs(new_units) do
        y3.玩家(1):创建单位(unit.key)
    end
end)
