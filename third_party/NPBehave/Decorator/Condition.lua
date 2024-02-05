---@class NPBehave.Decorator.Condition : NPBehave.Decorator.ObservingDecorator
---@overload fun(condition: fun():boolean, stopsOnChange: NPBehaveStops, decoratee: NPBehave.Node, checkInterval: number, randomVariance: number): self
local Condition = Class(NPBehaveClassName.Condition)
local superName = NPBehaveClassName.ObservingDecorator

---@class NPBehave.Decorator.Condition: NPBehave.Decorator.ObservingDecorator
Extends(NPBehaveClassName.Condition, superName, function(self, super, ...)
    local condition, stopsOnChange, decoratee, checkInterval, randomVariance = ...
    super("Condition", stopsOnChange, decoratee)
end)
---@class NPBehave.Decorator.BlackboardQuery: FuncUtil
Extends(NPBehaveClassName.Condition, "FuncUtil")


---@param condition fun():boolean
---@param stopsOnChange NPBehaveStops
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
