require 'y3.unittest.eventhead'

do --性能测试1
    local o = New 'UnitTest.EventObject' ()

    local count = 0
    for i = 1, 100000 do
        o:event_on('测试', function ()
            count = count + 1
        end)
    end

    local c1 = os.clock()
    o:event_notify('测试')
    local c2 = os.clock()

    assert(count == 100000)

    print('event 性能测试 #1', c2 - c1)
end

do --性能测试2
    local o = New 'UnitTest.EventObject' ()

    local count = 0
    o:event_on('测试', function ()
        count = count + 1
    end)

    local c1 = os.clock()
    for i = 1, 100000 do
        o:event_notify('测试')
    end
    local c2 = os.clock()

    assert(count == 100000)

    print('event 性能测试 #1', c2 - c1)
end

do --性能测试3
    local o = New 'UnitTest.EventObject' ()

    local count = 0
    for i = 1, 100000 do
        o:event_on('测试', { i }, function ()
            count = count + 1
        end)
    end

    local c1 = os.clock()
    for i = 1, 100000 do
        o:event_notify_with_args('测试', { i })
    end
    local c2 = os.clock()

    assert(count == 100000)

    print('event 性能测试 #3', c2 - c1)
end
