local counter = y3.util.counter()

---@class Trigger
---@field private _event Event
---@field private _callback Trigger.CallBack
---@field private _event_args? any[]
---@overload fun(event: Event, event_args: any[], callback: Trigger.CallBack): self
local M = Class 'Trigger'

---@class Trigger: GCObject
Extends('Trigger', 'GCObject')

---@alias Trigger.CallBack fun(...): ...

---@param event Event
---@param event_args? any[]
---@param callback Trigger.CallBack
---@return self
function M:constructor(event, event_args, callback)
    self._event = event
    self._callback = callback
    self._id = counter()
    self._event_args = event_args
    event:add_trigger(self)
    return self
end

M.type = 'trigger'
---@private
M._enable = true
---@private
M._id = 0

function M:__tostring()
    return ('{trigger|%d}'):format(self._id)
end

--禁用触发器
function M:disable()
    self._enable = false
end

function M:enable()
    self._enable = true
end

---@return boolean
function M:is_enable()
    return self._enable
end

---@param args any[]
---@return boolean
function M:is_match_args(args)
    if not args then
        return true
    end
    if not self._event_args then
        return false
    end
    for i = 1, #args do
        local fire_arg = args[i]
        local event_arg = self._event_args[i]
        if fire_arg ~= event_arg then
            return false
        end
    end
    return true
end

-- 运行触发器，最多能返回4个返回值
---@param ... any
---@return any, any, any, any
function M:execute(...)
    if self:GCObjectIsRemoved() then
        return
    end
    if self._enable then
        local suc, a, b, c, d = xpcall(self._callback, log.error, self, ...)
        if suc then
            return a, b, c, d
        end
    end
end

function M:remove()
    if self:GCObjectIsRemoved() then
        return
    end
    self:GCObjectMarkRemoved()
    self._event:remove_trigger(self)
end
