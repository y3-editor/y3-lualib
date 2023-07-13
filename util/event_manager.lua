---@class EventManager
---@field private object table
---@field private event_map table<string, Event>
---@overload fun(object: table): self
local M = Class 'EventManager'

---@private
M.fire_lock = 0

---@param object table
---@return self
function M:constructor(object)
    self.object = object
    self.event_map = {}
    return self
end

---@param event_name Event.Name # Lua框架使用的事件名
---@param event_args? any[]
---@param callback Trigger.CallBack
---@return Trigger
function M:event(event_name, event_args, callback)
    local event = self.event_map[event_name]
    if not event then
        event = New 'Event' (event_name)
        self.event_map[event_name] = event
    end
    local trigger = New 'Trigger' (event, event_args, callback)
    return trigger
end

---@param event_name Event.Name
---@param event_args? any[]
---@return boolean
function M:has_event(event_name, event_args)
    local event = self.event_map[event_name]
    if not event then
        return false
    end
    if event_args then
        return event:has_matched_trigger(event_args)
    end
    return true
end

---@param event_name Event.Name
---@param ... any
---@return any, any, any, any
function M:dispatch(event_name, ...)
    local event = self.event_map[event_name]
    if not event then
        return
    end
    self.fire_lock = self.fire_lock + 1
    local a, b, c, d = event:dispatch(...)
    self.fire_lock = self.fire_lock - 1
    return a, b, c, d
end

---@param event_name Event.Name
---@param ... any
function M:notify(event_name, ...)
    local event = self.event_map[event_name]
    if not event then
        return
    end
    self.fire_lock = self.fire_lock + 1
    event:notify(...)
    self.fire_lock = self.fire_lock - 1
end

---@param event_name Event.Name
---@param event_args any[]
---@param ... any
function M:notify_with_args(event_name, event_args, ...)
    local event = self.event_map[event_name]
    if not event then
        return
    end
    self.fire_lock = self.fire_lock + 1
    event:notify_with_args(event_args, ...)
    self.fire_lock = self.fire_lock - 1
end

function M:is_firing()
    return self.fire_lock > 0
end
