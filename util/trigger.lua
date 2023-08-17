local counter = y3.util.counter()

---@class Trigger
---@field private _event Event
---@field private _callback Trigger.CallBack
---@field private _event_args? any[]
---@overload fun(event: Event, event_args: any[], callback: Trigger.CallBack): self
local M = Class 'Trigger'

---@alias Trigger.CallBack fun(...): any, any, any, any

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

function M:destructor()
    self._event:remove_trigger(self)
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

-- 检查事件的参数与触发器的参数是否匹配，
-- 允许事件的参数数量多余触发器的参数数量。
---@param fire_args any[]?
---@return boolean
function M:is_match_args(fire_args)
    local event_args = self._event_args
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
    if self._enable then
        local suc, a, b, c, d = xpcall(self._callback, log.error, self, ...)
        if suc then
            return a, b, c, d
        end
    end
end

function M:remove()
    Delete(self)
end

-- 获取触发器回调函数的source信息
---@return string
function M:get_info_source()
    local info = debug.getinfo(self._callback, 'S')
    return info.source
end
