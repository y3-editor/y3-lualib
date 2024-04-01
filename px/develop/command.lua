y3.游戏:事件("键盘-抬起", y3.const.KeyboardKey["RSHIFT"], function(trg, data)
    if y3.游戏.是否为调试模式() then
        y3.重载.reload()
        return
    end
end)
