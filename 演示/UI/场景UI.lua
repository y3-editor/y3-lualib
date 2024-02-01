--假定你在场景UI中有一个叫做“血条”的UI

y3.游戏:事件("单位-创建", function(trg, data)
    --创建任意单位后，给这个单位绑定一个场景UI
    local scene_ui = y3.场景.创建到单位挂接点("血条", y3.玩家(1), data.unit, "head")
    --当单位被移除后，移除这个场景UI
    data.unit:bindGC(scene_ui)
end)
