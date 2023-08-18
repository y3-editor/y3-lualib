local event_configs = require 'y3.meta.eventconfig'
local event_datas   = require 'y3.meta.event'

---@class ObjectEvent
---@field private object_event_manager? EventManager
---@overload fun(): self
local M = Class 'ObjectEvent'

-- 注册对象的引擎事件
---@param event_name string
---@param ... any
---@return Trigger
function M:event(event_name, ...)
    if not self.object_event_manager then
        self.object_event_manager = New 'EventManager' (self)
    end
    local extra_args, callback = self:subscribe_event(event_name, ...)
    local trigger = self.object_event_manager:event(event_name, extra_args, callback)
    return trigger
end

---@param event_name string
---@param ... any
---@return any[]?
---@return Trigger.CallBack
function M:subscribe_event(event_name, ...)
    local config = event_configs.config[event_name]
    if not config or config.object ~= y3.class.type(self) then
        error('此事件无法作为对象事件：' .. tostring(event_name))
    end

    local nargs = select('#', ...)
    local extra_args
    ---@type Trigger.CallBack
    local callback
    if nargs == 1 then
        callback = ...
    elseif nargs > 1 then
        extra_args = {...}
        callback = extra_args[nargs]
        extra_args[nargs] = nil
    else
        error('缺少回调函数！')
    end

    -- 检查将对象还原到事件参数中
    for i, param in ipairs(config.params) do
        if param.type == config.object then
            if not extra_args then
                extra_args = {}
            end
            table.insert(extra_args, i, self)
            break
        end
    end

    y3.py_event_sub.event_register(event_name, extra_args)
    return extra_args, callback
end

local function event_notify(event_name, extra_args, lua_params)
    local config = event_configs.config[event_name]
    if not config or not config.object then
        return
    end
    local datas = event_datas[config.key]
    for _, data in ipairs(datas) do
        if data.lua_type == config.object then
            local obj = lua_params[data.lua_name]
            ---@type EventManager?
            local event_manager = obj.object_event_manager
            if event_manager then
                event_manager:dispatch(event_name, extra_args, lua_params)
            end
            break
        end
    end
end

return {
    event_notify = event_notify,
}
