---@class Event
---@field private event_name Event.Name
---@field private triggers_common LinkedTable
---@field private triggers_with_args? table<any, LinkedTable>
---@field private triggers_custom? table<any, LinkedTable>
---@field private wait_pushing? Trigger[]
---@field private wait_poping?  Trigger[]
---@overload fun(event_name: string): self
local M = Class 'Event'

---@alias Event.Name string

---@private
M.fire_lock = 0

---@param event_name Event.Name
---@return self
function M:__init(event_name)
    self.event_name = event_name
    self.triggers_common = y3.linked_table.create()
    return self
end

---@param trigger Trigger
function M:add_trigger(trigger)
    if self:is_firing() then
        if not self.wait_pushing then
            self.wait_pushing = {}
        end
        self.wait_pushing[#self.wait_pushing+1] = trigger
    else
        self:did_add_trigger(trigger)
    end
end

---@param trigger Trigger
function M:remove_trigger(trigger)
    if self:is_firing() then
        if not self.wait_poping then
            self.wait_poping = {}
        end
        self.wait_poping[#self.wait_poping+1] = trigger
    else
        self:did_remove_trigger(trigger)
    end
end

---@private
---@param trigger Trigger
function M:did_add_trigger(trigger)
    local mode = trigger.event_arg_mode
    local target = trigger.event_arg_target
    if mode == 'none' then
        self.triggers_common:pushTail(trigger)
    elseif mode == 'custom' then
        if not self.triggers_custom then
            self.triggers_custom = {}
        end
        if not self.triggers_custom[target] then
            self.triggers_custom[target] = y3.linked_table.create()
        end
        self.triggers_custom[target]:pushTail(trigger)
    elseif mode == 'array' then
        if not self.triggers_with_args then
            self.triggers_with_args = {}
        end
        if not self.triggers_with_args[target] then
            self.triggers_with_args[target] = y3.linked_table.create()
        end
        self.triggers_with_args[target]:pushTail(trigger)
    end
end

---@private
---@param trigger Trigger
function M:did_remove_trigger(trigger)
    local mode = trigger.event_arg_mode
    local target = trigger.event_arg_target
    if mode == 'none' then
        self.triggers_common:pop(trigger)
    elseif mode == 'custom' then
        if not self.triggers_custom then
            return
        end
        if not self.triggers_custom[target] then
            return
        end
        self.triggers_custom[target]:pop(trigger)
        if self.triggers_custom[target]:getSize() == 0 then
            self.triggers_custom[target] = nil
        end
    elseif mode == 'array' then
        if not self.triggers_with_args then
            return
        end
        if not self.triggers_with_args[target] then
            return
        end
        self.triggers_with_args[target]:pop(trigger)
        if self.triggers_with_args[target]:getSize() == 0 then
            self.triggers_with_args[target] = nil
        end
    end
end

---@private
function M:check_waiting()
    if self.wait_pushing and #self.wait_pushing > 0 then
        for _, trigger in ipairs(self.wait_pushing) do
            self:did_add_trigger(trigger)
        end
        self.wait_pushing = nil
    end
    if self.wait_poping and #self.wait_poping > 0 then
        for _, trigger in ipairs(self.wait_poping) do
            self:did_remove_trigger(trigger)
        end
        self.wait_poping = nil
    end
end

---@private
---@param args? any[]
---@return LinkedTable?
---@return 'none' | 'custom' | 'array'
---@return any
function M:get_target_triggers(args)
    local mode, target = y3.trigger.compute_event_args(args)
    if mode == 'none' then
        return self.triggers_common, mode, target
    elseif mode == 'custom' then
        return self.triggers_custom and self.triggers_custom[target], mode, target
    elseif mode == 'array' then
        return self.triggers_with_args and self.triggers_with_args[target], mode, target
    end
    error('未知的事件参数模式：' .. mode)
end

---@param args? any[]
---@return boolean
function M:has_matched_trigger(args)
    local triggers, mode, target = self:get_target_triggers(args)
    if not triggers then
        return false
    end
    ---@param trigger Trigger
    for trigger in triggers:pairsFast() do
        if trigger:is_match_args(args, mode, target) then
            return true
        end
    end
    return false
end

---@param event_args any[]?
---@param ... any
function M:notify(event_args, ...)
    local triggers, mode, target = self:get_target_triggers(event_args)
    if not triggers then
        return
    end
    self.fire_lock = self.fire_lock + 1
    ---@param trigger Trigger
    for trigger in triggers:pairsFast() do
        if trigger:is_match_args(event_args, mode, target) then
            trigger:execute(...)
        end
    end
    self.fire_lock = self.fire_lock - 1
    self:check_waiting()
end

---@param event_args any[]?
---@param ... any
---@return any, any, any, any
function M:dispatch(event_args, ...)
    local triggers, mode, target = self:get_target_triggers(event_args)
    if not triggers then
        return
    end
    self.fire_lock = self.fire_lock + 1
    ---@param trigger Trigger
    for trigger in triggers:pairsFast() do
        if trigger:is_match_args(event_args, mode, target) then
            local a, b, c, d = trigger:execute(...)
            if a ~= nil then
                self.fire_lock = self.fire_lock - 1
                self:check_waiting()
                return a, b, c, d
            end
        end
    end
    self.fire_lock = self.fire_lock - 1
    self:check_waiting()
end

---@return boolean
function M:is_firing()
    return self.fire_lock > 0
end

---@return fun(): Trigger
function M:pairs()
    ---@type Trigger[]
    local triggers = {}
    for trg in self.triggers_common:pairsFast() do
        triggers[#triggers+1] = trg
    end
    if self.triggers_custom then
        for _, list in pairs(self.triggers_custom) do
            for trg in list:pairsFast() do
                triggers[#triggers+1] = trg
            end
        end
    end
    if self.triggers_with_args then
        for _, list in pairs(self.triggers_with_args) do
            for trg in list:pairsFast() do
                triggers[#triggers+1] = trg
            end
        end
    end

    table.sort(triggers, function(a, b)
        return a:get_id() < b:get_id()
    end)

    local i = 0
    return function()
        i = i + 1
        return triggers[i]
    end
end
