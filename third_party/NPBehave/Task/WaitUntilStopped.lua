---@class NPBehave.Task.WaitUntilStopped
---@overload fun(successWhenStopped?: boolean): self
local WaitUntilStopped = Class("NPBehave.Task.WaitUntilStopped")

local superName = "NPBehave.Task.Task"
---@class NPBehave.Task.WaitUntilStopped: NPBehave.Task.Task
Extends('NPBehave.Task.WaitUntilStopped', superName, function(self, super, ...)
    super("WaitUntilStopped")
end)

---@param successWhenStopped? boolean
---@return self
function WaitUntilStopped:__init(successWhenStopped)
    self._successWhenStopped = successWhenStopped or false
    return self
end

---@protected
function WaitUntilStopped:DoCancel()
    self:Stopped(self._successWhenStopped);
end

return WaitUntilStopped
