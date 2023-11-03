-- 请先在界面编辑器中放置一张图片 `panel_1.image_1`

y3.game:event('游戏-初始化', function ()
    -- 只能在初始化事件之后才能获取到UI
    local ui = y3.ui.get_ui(y3.player(1), 'panel_1.image_1')

    -- 给UI添加事件，当鼠标移入时，发送UI事件
    ui:add_event('鼠标-移入', '测试事件', {
        custom = '自定义数据',
    })

    -- 按下空格时也主动发送UI事件
    y3.game:event('键盘-按下', y3.const.KeyboardKey['SPACE'], function ()
        ui:send_event('测试事件')
    end)
end)

-- 接收UI事件
y3.game:event('界面-消息', '测试事件', function (trg, data)
    print('界面消息：', data.data.custom)
end)
