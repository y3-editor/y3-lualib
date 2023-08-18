---@class ObjectEvent
---@field private object_event_manager? EventManager
---@overload fun(): self
local M = Class 'ObjectEvent'

-- 注册对象的引擎事件
---@param event_type y3.Const.EventType
---@param ... any
---@return Trigger
function M:event(event_type, ...)
    if not self.object_event_manager then
        self.object_event_manager = New 'EventManager' (self)
    end
    local extra_args, callback = y3.game:subscribe_event(event_type, ...)
    local trigger = self.object_event_manager:event(event_type, extra_args, callback)
    return trigger
end

local function event_notify(event_name, extra_args, lua_params)
    
end

return {
    event_notify = event_notify,
}
