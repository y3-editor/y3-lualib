local M = y3.object.unit[134274912] -- 关羽

M.data.name = "这是修改过的名字"

y3.游戏:event("键盘-按下", y3.const.KeyboardKey["SPACE"], function()
    y3.玩家(1):创建单位(134274912)
end)
