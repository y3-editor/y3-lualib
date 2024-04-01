-- 请先在界面编辑器中放置一张图片 `panel_1.image_1`

y3.游戏:事件("游戏-初始化", function()
    -- 只能在初始化事件之后才能获取到UI
    local ui = y3.控件.get_ui(y3.玩家(1), "panel_1.image_1")

    -- 给UI添加事件，当鼠标移入时，发送UI事件
    ui:add_event("鼠标-移入", "测试事件", {
        custom = "自定义数据",
    })

    -- 按下空格时也主动发送UI事件
    y3.游戏:事件("键盘-按下", y3.const.KeyboardKey["SPACE"], function()
        ui:send_event("测试事件")
    end)
end)

-- 接收UI事件
y3.游戏:事件("界面-消息", "测试事件", function(trg, data)
    print("界面消息：", data.自定义数据.custom)
end)
