y3.game:event_on('#417修改', 1, function(trg, ...)
    print('只有这里收到了, 整数参数')
end)

y3.game:event_on('#417修改', 2, function(trg, ...)
    print('整数参数')
end)

y3.game:event_on('#417修改', '1', function (trg, ...)
    print('只有这里收到了, 字符串参数')
end)

y3.game:event_on('#417修改', '2', function(trg, ...)
    print('字符串参数')
end)

y3.game:event_on('#417修改', y3.player(1), function(trg, ...)
    print('只有这里收到了,  Y3实例')
end)

y3.game:event_on('#417修改', y3.player(2), function(trg, ...)
    print('Y3实例')
end)




y3.game:event("键盘-按下", y3.const.KeyboardKey["F1"], function(trg, data)
    ---@param args any[]
    ---@param match_func fun(fire_args: any[]?, event_args: any[]?): boolean
    ---@return table
    local function creat_custom_match(args, match_func)
        local custom_match = {
            __eq = function(fire_args, event_args)
                return match_func(fire_args, event_args)
            end
        }
        return setmetatable(args, custom_match)
    end

    ---自定义匹配规则
    ---@param fire_args any[]? 触发器传递的参数
    ---@param event_args any[]? 事件监听的参数
    ---@return boolean
    local function custom_match_rule(fire_args, event_args)
        print(string.format("fire_args: %s, \r\nevent_args: %s", y3.util.dump(fire_args), y3.util.dump(event_args)))
        -- 强制返回`true`，表示匹配成功
        return true
    end


    data.player:event_on('获得', function()
        print('触发获得')
        print('发起移除前')
        data.player:event_notify('移除1', "000 1")
        data.player:event_dispatch('移除1')
        -- 无法匹配
        data.player:event_dispatch_with_args('移除2', { 123 }, "111 1")
        -- 可以匹配
        data.player:event_dispatch_with_args('移除2', creat_custom_match({ 123 }, custom_match_rule), "111 2")
        data.player:event_notify('移除2', "000 2")

        print('发起移除后')
    end)


    data.player:event_on('移除1', function(trg, key)
        print('触发移除 1', key)
    end)

    data.player:event_on('移除2', { 456 }, function(trg, key)
        print('触发移除 2', key)
    end)


    data.player:event_notify('获得')



    y3.game:event_dispatch_with_args('#417修改', 1)
    y3.game:event_dispatch_with_args('#417修改', '1')
    y3.game:event_dispatch_with_args('#417修改', y3.player(1))


end)
