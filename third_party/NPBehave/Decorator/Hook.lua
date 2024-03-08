---@class NPBehave.Decorator.Hook : NPBehave.Decorator.Decorator
---@overload fun(onStart: fun(), decoratee: NPBehave.Node): self
local Hook = Class(NPBehave.ClassName.Hook)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.Hook: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.Hook, superName, function(self, super, ...)
    local onStart, decoratee = ...
    super("Hook", decoratee)
end)

---@param onStart fun()
---@param decoratee NPBehave.Node
---@return self
function Hook:__init(onStart, decoratee)
    self._onStart = onStart
    return self
end

---override<br>
---@protected
function Hook:DoStart()
    self._onStart()
    self.Decoratee:Start()
end

---override<br>
---@protected
function Hook:DoCancel()
    self.Decoratee:CancelWithoutReturnResult()
end

---override<br>
---@protected
function Hook:DoChildStopped(child, result)
    self:Stopped(result)
end