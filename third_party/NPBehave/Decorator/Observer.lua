---@class NPBehave.Decorator.Observer : NPBehave.Decorator.Decorator
---@overload fun(onStart: fun(), onStop: fun(result: boolean), decoratee: NPBehave.Node): self
local Observer = Class(NPBehave.ClassName.Observer)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.Observer: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.Observer, superName, function(self, super, ...)
    local onStart, onStop, decoratee = ...
    super("Observer", decoratee)
end)

---@param onStart fun()
---@param onStop fun(result: boolean)
---@param decoratee NPBehave.Node
---@return self
function Observer:__init(onStart, onStop, decoratee)
    self._onStart = onStart
    self._onStop = onStop
    return self
end

---override<br>
---@protected
function Observer:DoStart()
    self._onStart()
    self.Decoratee:Start()
end

---override<br>
---@protected
function Observer:DoCancel()
    self.Decoratee:CancelWithoutReturnResult()
end

---override<br>
---@protected
function Observer:DoChildStopped(child, result)
    self._onStop(result)
    self:Stopped(result)
end