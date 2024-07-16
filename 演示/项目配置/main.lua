-- 游戏启动后会自动运行此文件

--在开发模式下，将日志打印到游戏中
if y3.game.is_debug_mode() then
    y3.config.log.toGame = true
    y3.config.log.level  = 'debug'
else
    y3.config.log.toGame = false
    y3.config.log.level  = 'info'
end

y3.game:event('游戏-初始化', function (trg, data)
    print('Hello, Y3!')
end)

y3.timer.loop(5, function (timer, count)
    print('每5秒显示一次文本，这是第' .. tostring(count) .. '次')
end)

y3.game:event('键盘-按下', y3.const.KeyboardKey['SPACE'], function ()
    print('你按下了空格键！')
end)
