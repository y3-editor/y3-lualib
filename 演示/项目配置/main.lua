-- 游戏启动后会自动运行此文件
y3.config.log.toGame = true

y3.游戏:事件("游戏-初始化", function(trg, data)
    print("Hello, Y3!")
end)

y3.计时器.循环执行(5, function(timer, count)
    print("每5秒显示一次文本，这是第" .. tostring(count) .. "次")
end)

y3.游戏:事件("键盘-按下", y3.const.KeyboardKey["SPACE"], function()
    print("你按下了空格键！")
end)
