---@class EventManager
---@field private object table
---@field private event_map table<string, Event>
---@field private stack_list? LinkedTable
---@overload fun(object: table): self
local M = Class 'EventManager'

---@private
M.fire_lock = 0

---@param object table
---@return self
function M:__init(object)
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

---@private
---@param event_name Event.Name
---@param event_args any[]?
---@param ... any
function M:stack_notify(event_name, event_args, ...)
    if not self.stack_list then
        self.stack_list = New 'LinkedTable' ()
    end
    local box = table.pack(event_name, event_args, ...)
    self.stack_list:pushTail(box)
end

---@private
function M:check_stack()
    if not self.stack_list then
        return
    end
    local box = self.stack_list:getHead()
    if not box then
        return
    end
    self.stack_list:pop(box)
    self:notify(table.unpack(box, 1, box.n))
end

---@param event_name Event.Name
---@param event_args any[]?
---@param ... any
function M:notify(event_name, event_args, ...)
    local event = self.event_map[event_name]
    if not event then
        return
    end
    if self.fire_lock > 0 then
        self:stack_notify(event_name, event_args,...)
        return
    end
    self.fire_lock = self.fire_lock + 1
    event:notify(event_args, ...)
    self.fire_lock = self.fire_lock - 1
    self:check_stack()
end

---@param event_name Event.Name
---@param event_args any[]?
---@param ... any
---@return any, any, any, any
function M:dispatch(event_name, event_args, ...)
    local event = self.event_map[event_name]
    if not event then
        return
    end
    self.fire_lock = self.fire_lock + 1
    local a, b, c, d = event:dispatch(event_args, ...)
    self.fire_lock = self.fire_lock - 1
    return a, b, c, d
end

function M:is_firing()
    return self.fire_lock > 0
end

---@return fun():Trigger?
function M:pairs()
    local triggers = {}
    for _, event in pairs(self.event_map) do
        for trigger in event:pairs() do
            triggers[#triggers+1] = trigger
        end
    end
    local i = 0
    return function ()
        i = i + 1
        local trigger = triggers[i]
        return trigger
    end
end
