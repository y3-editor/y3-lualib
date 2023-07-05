---@class Game
local M = Class 'Game'

---@private
M._event_object = {'<GAME_EVENT_OBJECT>'}

-- 注册全局事件，必须在脚本初始化时调用
---@param event_type y3.Const.EventType
---@param callback fun(trg: Trigger, data: table)
---@return Trigger
function M:event(event_type, callback)
    local event_manager = y3.py_event_sub.event_register(M._event_object, event_type)
    local trg = event_manager:event(event_type, callback)
    return trg
end
