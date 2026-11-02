require 'y3.unittest.eventhead'

do
    ---@type any[]
    local filters = { 0, 1, true, false, '过滤参数', New 'UnitTest.EventObject' () }
    for _, filter in ipairs(filters) do
        local o = New 'UnitTest.EventObject' ()
        local count = 0
        local normalCount = 0

        local trigger = o:event_on('过滤测试', filter, function (_, value)
            assert(value == '回调参数')
            count = count + 1
            o:event_notify('普通测试')
            return false, '返回参数', nil, 4
        end)
        o:event_on('普通测试', function ()
            normalCount = normalCount + 1
        end)

        local manager = o:get_custom_event_manager()
        assert(manager)
        assert(trigger:is_match_args(filter))
        assert(not trigger:is_match_args(-1))
        assert(manager:has_event('过滤测试', filter))
        assert(not manager:has_event('过滤测试', -1))

        manager:notify('过滤测试', -1, '回调参数')
        assert(count == 0)
        manager:notify('过滤测试', filter, '回调参数')
        assert(count == 1)
        assert(normalCount == 1)
        assert(not manager:is_firing())
        o:event_notify('普通测试')
        assert(normalCount == 2)

        local a, b, c, d = manager:dispatch('过滤测试', filter, '回调参数')
        assert(a == false)
        assert(b == '返回参数')
        assert(c == nil)
        assert(d == 4)
        assert(count == 2)
        assert(normalCount == 3)
        assert(not manager:is_firing())
        o:event_notify('普通测试')
        assert(normalCount == 4)
    end
end

do --基本功能
    local o = New 'UnitTest.EventObject' ()

    local count = 0

    o:event_on('测试', function ()
        count = count + 1
    end)

    o:event_notify('测试')

    assert(count == 1)

    o:event_dispatch('测试')

    assert(count == 2)
end

do --notify的结算队列
    local o = New 'UnitTest.EventObject' ()

    local r = {}

    o:event_on('测试1', function ()
        r[#r+1] = 1
        o:event_notify('测试2')
        r[#r+1] = 3
    end)

    o:event_on('测试2', function ()
        r[#r+1] = 2
    end)

    o:event_notify('测试1')

    assert(#r == 3)
    assert(r[1] == 1)
    assert(r[2] == 3)
    assert(r[3] == 2)
end

do --dispatch插入结算
    local o = New 'UnitTest.EventObject' ()

    local r = {}

    o:event_on('测试1', function ()
        r[#r+1] = 1
        o:event_dispatch('测试2')
        r[#r+1] = 3
    end)

    o:event_on('测试2', function ()
        r[#r+1] = 2
    end)

    o:event_notify('测试1')

    assert(#r == 3)
    assert(r[1] == 1)
    assert(r[2] == 2)
    assert(r[3] == 3)
end

do --事件注册参数匹配规则
    local o = New 'UnitTest.EventObject' ()

    local r = {}

    o:event_on('测试', {1}, function ()
        r[#r+1] = 1
    end)

    o:event_on('测试', {1, 2}, function ()
        r[#r+1] = 2
    end)

    o:event_on('测试', {1, 2, 3}, function ()
        r[#r+1] = 3
    end)

    o:event_on('测试', {1, 2, 3, 4}, function ()
        r[#r+1] = 4
    end)

    o:event_notify_with_args('测试', {1 ,2, 3})

    assert(#r == 3)
    assert(r[1] == 1)
    assert(r[2] == 2)
    assert(r[3] == 3)
end

do --事件回调参数
    local o = New 'UnitTest.EventObject' ()

    local r = {}

    o:event_on('测试1', function (trg, ...)
        r[#r+1] = { ... }
        o:event_notify('测试2', 4, 5, 6)
        r[#r+1] = { ... }
    end)

    o:event_on('测试2', function (trg, ...)
        r[#r+1] = { ... }
    end)

    o:event_notify('测试1', 1, 2, 3)

    assert(y3.util.equal(r, {
        {1, 2, 3},
        {1, 2, 3},
        {4, 5, 6},
    }))
end

do --同时包含注册参数和回调参数
    local o = New 'UnitTest.EventObject' ()

    local r = {}

    o:event_on('测试', {1}, function (trg, ...)
        r[#r+1] = {1, ... }
    end)

    o:event_on('测试', {1, 2}, function (trg, ...)
        r[#r+1] = {2, ...}
    end)

    o:event_on('测试', {1, 2, 3}, function (trg, ...)
        r[#r+1] = {3, ...}
    end)

    o:event_on('测试', {1, 2, 3, 4}, function (trg, ...)
        r[#r+1] = {4, ...}
    end)

    o:event_notify_with_args('测试', {1 ,2, 3}, 1, 2, 3)

    assert(y3.util.equal(r, {
        {1, 1, 2, 3},
        {2, 1, 2, 3},
        {3, 1, 2, 3},
    }))
end
