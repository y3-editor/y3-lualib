local counter = y3.util.counter()

--触发器
---@class Trigger
---@field private _event Event
---@field private _callback Trigger.CallBack
---@field private _event_args? any[]
---@field private _include_name? string | false
---@field private _on_remove? function
---@field private _disable_once? boolean
---@field event_manager EventManager?
---@overload fun(event: Event, event_args: any[], callback: Trigger.CallBack): self
local M = Class 'Trigger'

---@alias Trigger.CallBack fun(trg: Trigger, ...): any, any, any, any


M.all_triggers = setmetatable({}, y3.util.MODE_V)

---@param event Event
---@param event_args? any[]
---@param callback Trigger.CallBack
---@return self
function M:__init(event, event_args, callback)
    self._event = event
    self._callback = callback
    self._id = counter()
    self._event_args = event_args
    event:add_trigger(self)
    M.all_triggers[self._id] = self
    return self
end

function M:__del()
    self._event:remove_trigger(self)
    if self._on_remove then
        self._on_remove()
    end
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

--在本次事件中禁用此触发器
function M:disable_once()
    self._disable_once = true
    if self.event_manager then
        self.event_manager:disable_trigger_once(self)
    end
end

function M:recover_disable_once()
    self._disable_once = nil
end

-- 检查事件的参数与触发器的参数是否匹配，
-- 允许事件的参数数量多余触发器的参数数量。
---@param fire_args any[]?
---@return boolean
function M:is_match_args(fire_args)
    local event_args = self._event_args
    local event_type = type(event_args)

    -- 如果类型不同直接返回false
    if event_type ~= type(fire_args) then
        return false
    end

    -- 如果不是table 直接判断值是不是相等
    if event_type ~= "table" then
        return event_args == fire_args
    end

    -- 判断是不是Y3实例, 如果是, 返回对象是否相等
    ---@diagnostic disable-next-line: undefined-field
    if event_args.__name then
        return event_args == fire_args
    end
    
    -- 最后在假定是数组进行判断
    local fire_args_n = fire_args and #fire_args or 0
    local event_args_n = event_args and #event_args or 0
    -- 事件参数数量多余触发器参数数量，肯定不匹配，返回false
    if fire_args_n < event_args_n then
        return false
    end
    -- 说明任何参数都匹配，直接返回true
    if event_args_n <= 0 then
        return true
    end
    -- 既然触发器参数大于0，且事件参数大于等于触发器参数，
    -- 那么他们都不会是nil了
    ---@cast event_args -nil
    ---@cast fire_args -nil
    for i = 1, event_args_n do
        local event_arg = event_args[i]
        local fire_arg = fire_args[i]
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
    if not IsValid(self) then
        return
    end
    if not self._enable
    or self._disable_once then
        return
    end
    local suc, a, b, c, d = xpcall(self._callback, log.error, self, ...)
    if suc then
        return a, b, c, d
    end
end

function M:remove()
    Delete(self)
end

---@return string?
function M:get_include_name()
    if not self._include_name then
        self._include_name = y3.reload.getIncludeName(self._callback) or false
    end
    return self._include_name or nil
end

---@private
function M:on_remove(callback)
    self._on_remove = callback
end

--添加标签
---@param tag any
function M:add_tag(tag)
    if not self._tags then
        ---@private
        self._tags = {}
    end
    self._tags[tag] = true
end

--是否有标签
---@param tag any
---@return boolean
function M:has_tag(tag)
    if not self._tags then
        return false
    end
    return self._tags[tag] ~= nil
end

--移除标签
---@param tag any
function M:remove_tag(tag)
    if not self._tags then
        return
    end
    self._tags[tag] = nil
end

return M
