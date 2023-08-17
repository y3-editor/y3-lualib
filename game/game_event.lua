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
    y3.py_event_sub.event_register(self.event_manager, event_type, extra_args)
    local trg = self.event_manager:event(event_type, extra_args, callback)
    return trg
end

---@return EventManager
function M:get_event_manager()
    return self.event_manager
end
