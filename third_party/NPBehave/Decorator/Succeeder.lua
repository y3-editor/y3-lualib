---@class NPBehave.Decorator.Succeeder : NPBehave.Decorator.Decorator
---@overload fun(decoratee: NPBehave.Node): self
local Succeeder = Class(NPBehave.ClassName.Succeeder)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.Succeeder: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.Succeeder, superName, function(self, super, ...)
    local decoratee = ...
    super("Succeeder", decoratee)
end)

---@param decoratee NPBehave.Node
---@return self
function Succeeder:__init(decoratee)
    return self
end

---override<br>
---@protected
function Succeeder:DoStart()
    self.Decoratee:Start()
end

---override<br>
---@protected
function Succeeder:DoCancel()
    self.Decoratee:CancelWithoutReturnResult()
end

---override<br>
---@protected
function Succeeder:DoChildStopped(child, result)
    self:Stopped(true)
end