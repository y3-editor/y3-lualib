---@class NPBehave.Decorator.Failer : NPBehave.Decorator.Decorator
---@overload fun(decoratee: NPBehave.Node): self
local Failer = Class(NPBehaveClassName.Failer)
local superName = NPBehaveClassName.Decorator

---@class NPBehave.Decorator.Failer: NPBehave.Decorator.Decorator
Extends(NPBehaveClassName.Failer, superName, function(self, super, ...)
    local decoratee = ...
    super("Failer", decoratee)
end)

---@param decoratee NPBehave.Node
---@return self
function Failer:__init(decoratee)
    return self
end

---override<br>
---@protected
function Failer:DoStart()
    self.Decoratee:Start()
end

---override<br>
---@protected
function Failer:DoCancel()
    self.Decoratee:CancelWithoutReturnResult()
end

---override<br>
---@protected
function Failer:DoChildStopped(child, result)
    self:Stopped(false)
end