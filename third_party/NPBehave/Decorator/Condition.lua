---@class NPBehave.Decorator.Condition : NPBehave.Decorator.ObservingDecorator
---@overload fun(condition: fun():boolean, stopsOnChange: NPBehave.Enum.Stops, decoratee: NPBehave.Node, checkInterval: number, randomVariance: number): self
local Condition = Class(NPBehave.ClassName.Condition)
local superName = NPBehave.ClassName.ObservingDecorator

---@class NPBehave.Decorator.Condition: NPBehave.Decorator.ObservingDecorator
Extends(NPBehave.ClassName.Condition, superName, function(self, super, ...)
    local condition, stopsOnChange, decoratee, checkInterval, randomVariance = ...
    super("Condition", stopsOnChange, decoratee)
end)



---@param condition fun():boolean
---@param stopsOnChange NPBehave.Enum.Stops
---@param decoratee NPBehave.Node
---@param checkInterval? number
---@param randomVariance? number
---@return self
function Condition:__init(condition, stopsOnChange, decoratee, checkInterval, randomVariance)
    self._condition = condition
    self._checkInterval = checkInterval or 0.0
    self._checkVariance = randomVariance or 0.0
    return self
end

---override<br>
---@protected
function Condition:StartObserving()
    self.RootNode.Clock:AddTimer(self._checkInterval, -1, self:bind(self.Evaluate), self._checkVariance)
end

---override<br>
---@protected
function Condition:StopObserving()
    self.RootNode.Clock:RemoveTimer(self:bind(self.Evaluate))
end

---override<br>
---@protected
---@return boolean
function Condition:IsConditionMet()
    return self._condition()
end
