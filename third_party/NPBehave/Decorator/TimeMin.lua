---@class NPBehave.Decorator.TimeMin : NPBehave.Decorator.Decorator
---@overload fun(limit: number, decoratee: NPBehave.Node, waitOnFailure: boolean, randomVariation: number): self
local TimeMin = Class(NPBehave.ClassName.TimeMin)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.TimeMin: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.TimeMin, superName, function(self, super, ...)
    local limit, decoratee, waitOnFailure, randomVariation = ...
    super("TimeMin", decoratee)
end)

---@param limit number
---@param randomVariation? number
---@param waitOnFailure boolean
---@param decoratee NPBehave.Node
---@return self
function TimeMin:__init(limit, randomVariation, waitOnFailure, decoratee)
    self._limit = limit
    self._randomVariation = randomVariation or limit * 0.05
    self._waitOnFailure = waitOnFailure or false
    self._isLimitReached = false
    self._isDecorateeDone = false
    self._isDecorateeSuccess = false
    assert(limit > 0, "limit 必须大于 0")
    return self
end

---override<br>
---@protected
function TimeMin:DoStart()
    self._isDecorateeDone = false
    self._isDecorateeSuccess = false
    self._isLimitReached = false
    self.Clock:AddTimer(self._limit, 0, self:bind(self.TimeoutReached), self._randomVariation)
    self.Decoratee:Start()
end

---override<br>
---@protected
function TimeMin:DoCancel()
    if self.Decoratee.IsActive then
        self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
        self._isLimitReached = true
        self.Decoratee:CancelWithoutReturnResult()
    else
        self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
        self:Stopped(false)
    end
end

---override<br>
---@protected
function TimeMin:DoChildStopped(child, result)
    self._isDecorateeDone = true
    self._isDecorateeSuccess = result
    if self._isLimitReached or (not result and not self._waitOnFailure) then
        self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
        self:Stopped(self._isDecorateeSuccess)
    else
        assert(self.Clock:HasTimer(self:bind(self.TimeoutReached)))
    end
end

function TimeMin:TimeoutReached()
    self._isLimitReached = true
    if self._isDecorateeDone then
        self:Stopped(self._isDecorateeSuccess)
    else
        assert(self.Decoratee.IsActive)
    end
end
