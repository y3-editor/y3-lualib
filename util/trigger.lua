local counter = y3.util.counter()

---@class Trigger: GCObject
---@field private _event Event
---@field private _callback Trigger.CallBack
---@overload fun(event: Event, callback: Trigger.CallBack): self
local M = Class('Trigger', 'GCObject')

---@alias Trigger.CallBack fun(...): ...

---@param event Event
---@param callback Trigger.CallBack
---@return self
function M:constructor(event, callback)
    self._event = event
    self._callback = callback
    self._id = counter()
    Super(self)(function ()
        self:remove()
    end)
    event:add_trigger(self)
    return self
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

function M:isEnable()
    return self._enable
end

-- 运行触发器，最多能返回4个返回值
---@param ... any
---@return any, any, any, any
function M:execute(...)
    if self:GCObjectIsRemoved() then
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
    if self:GCObjectIsRemoved() then
        return
    end
    self:GCObjectMarkRemoved()
    self._event:remove_trigger(self)
end
