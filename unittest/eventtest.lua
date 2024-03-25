---@class UnitTest.EventObject
---@overload fun(): self
local M = Class 'UnitTest.EventObject'

---@class UnitTest.EventObject: CustomEvent
Extends('UnitTest.EventObject', 'CustomEvent')

do
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

do
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

do
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

do
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

do
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

do
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
