local assert = assert
---@class NPBehave.Decorator.WaitForCondition : NPBehave.Decorator.Decorator
---@overload fun(condition: fun():boolean, checkInterval: number, randomVariance: number, decoratee: NPBehave.Node): self
local WaitForCondition = Class(NPBehave.ClassName.WaitForCondition)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.WaitForCondition: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.WaitForCondition, superName, function(self, super, ...)
    local condition, checkInterval, randomVariance, decoratee = ...
    super("WaitForCondition", decoratee)

end)

---@param condition fun():boolean
---@param checkInterval? number
---@param randomVariance? number
---@param decoratee NPBehave.Node
---@return self
function WaitForCondition:__init(condition, checkInterval, randomVariance, decoratee)
    self._condition = condition
    self._checkInterval = checkInterval or 0.0
    self._checkVariance = randomVariance or 0.0
    self.Label = "" .. (checkInterval - randomVariance) .. "..." .. (checkInterval + randomVariance) .. "s"
    return self
end

---override<br>
---@protected
function WaitForCondition:DoStart()
    if not self._condition() then
        self.Clock:AddTimer(self._checkInterval, -1, self:bind(self.CheckCondition) , self._checkVariance)
    else
        self.Decoratee:Start()
    end
end

function WaitForCondition:CheckCondition()
    if self._condition() then
        self.Clock:RemoveTimer(self:bind(self.CheckCondition))
        self.Decoratee:Start()
    end
end

---override<br>
---@protected
function WaitForCondition:DoCancel()
    self.Clock:RemoveTimer(self:bind(self.CheckCondition))
    if self.Decoratee.IsActive then
        self.Decoratee:CancelWithoutReturnResult()
    else
        self:Stopped(false)
    end
end

---override<br>
---@protected
function WaitForCondition:DoChildStopped(child, result)
    assert(self.CurrentState ~= NPBehave.Enum.NodeState.Inactive)
    self:Stopped(result)
end