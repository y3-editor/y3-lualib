---@class Game
local M = Class 'Game'

---@class Game: CustomEvent
Extends('Game', 'CustomEvent')

---@private
M.event_manager = New 'EventManager' ()

-- 注册引擎事件
---@param event_type y3.Const.EventType
---@param ... any
---@return Trigger
function M:event(event_type, ...)
    local extra_args, callback, unsubscribe = self:subscribe_event(event_type, ...)
    local trg = self.event_manager:event(event_type, extra_args, callback)
    ---@diagnostic disable-next-line: invisible
    trg:on_remove(unsubscribe)
    return trg
end

---@return EventManager
function M:get_event_manager()
    return self.event_manager
end

---@param event_type y3.Const.EventType
---@param ... any
---@return any[]?
---@return Trigger.CallBack
---@return function Unsubscribe
function M:subscribe_event(event_type, ...)
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

    y3.py_event_sub.event_register(event_type, extra_args)

    local unsubscribe = function ()
        y3.py_event_sub.event_unregister(event_type, extra_args)
    end

    return extra_args, callback, unsubscribe
end

local function event_notify(event_name, extra_args, lua_params)
    M.event_manager:dispatch(event_name, extra_args, lua_params)
end

return {
    event_notify = event_notify,
}
