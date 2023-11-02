-- 游戏启动后会自动运行此文件
y3.config.log.toGame = true

y3.game:event('游戏-初始化', function (trg, data)
    print('Hello, Y3!')
end)
