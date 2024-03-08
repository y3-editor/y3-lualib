---@class NPBehave.Decorator.Random : NPBehave.Decorator.Decorator
---@overload fun(probability: number, decoratee: NPBehave.Node): self
local Random = Class(NPBehave.ClassName.Random)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.Random: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.Random, superName, function(self, super, ...)
    local probability, decoratee = ...
    super("Random", decoratee)
end)

---@param probability number
---@param decoratee NPBehave.Node
---@return self
function Random:__init(probability, decoratee)
    self._probability = probability
    return self
end

---override<br>
---@protected
function Random:DoStart()
    if NPBehave.Context.Platform:GenerateRandom() <= self._probability then
        self.Decoratee:Start()
    else
        self:Stopped(false)
    end
end

---override<br>
---@protected
function Random:DoCancel()
    self.Decoratee:CancelWithoutReturnResult()
end

---override<br>
---@protected
function Random:DoChildStopped(child, result)
    self:Stopped(result)
end