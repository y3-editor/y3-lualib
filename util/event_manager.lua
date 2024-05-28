---@class EventManager
---@field private object table
---@field private event_map table<string, Event>
---@field private stack_list? LinkedTable
---@field private disable_once_triggers? Trigger[]
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
    trigger.event_manager = self
    return trigger
end

---@param trigger Trigger
function M:disable_trigger_once(trigger)
    if not self.disable_once_triggers then
        self.disable_once_triggers = {}
    end
    self.disable_once_triggers[#self.disable_once_triggers+1] = trigger
end

function M:recover_disable_once()
    if not self.disable_once_triggers then
        return
    end
    for _, trigger in ipairs(self.disable_once_triggers) do
        trigger:recover_disable_once()
    end
    self.disable_once_triggers = nil
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

function M:make_stack_overflow_error(last_events)
    local msg = {}
    msg[#msg+1] = '事件死循环！'
    msg[#msg+1] = '最后10个事件为：'
    msg[#msg+1] = table.concat(last_events, ' -> ')
    error(table.concat(msg, '\n'))
end

---@private
function M:release_stack()
    if self.fire_lock ~= 0 then
        return
    end
    local list = self.stack_list
    if not list
    or list:getSize() == 0 then
        ---@diagnostic disable-next-line: invisible
        self:recover_disable_once()
        return
    end
    self.fire_lock = self.fire_lock + 1
    for _ = 1, 10000 do
        local box = list:getHead()
        if not box then
            self.fire_lock = self.fire_lock - 1
            ---@diagnostic disable-next-line: invisible
            self:recover_disable_once()
            return
        end
        list:pop(box)
        self:raw_notify(table.unpack(box, 1, box.n))
    end
    --跑到这里说明有死循环，走异常处理
    local last_events = {}
    --探测最后10个事件
    for i = 1, 10 do
        local box = list:getHead()
        if not box then
            break
        end
        list:pop(box)
        self:raw_notify(table.unpack(box, 1, box.n))
        local event_name = box[1]
        last_events[i] = event_name
    end
    self.fire_lock = self.fire_lock - 1
    ---@diagnostic disable-next-line: invisible
    self:recover_disable_once()
    list:reset()
    self:make_stack_overflow_error(last_events)
end

---@private
---@param event_name Event.Name
---@param event_args any[]?
---@param ... any
function M:raw_notify(event_name, event_args, ...)
    local event = self.event_map[event_name]
    if not event then
        return
    end
    event:notify(event_args, ...)
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
    self:release_stack()
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
    self:release_stack()
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
