---@class NPBehave.Decorator.Cooldown : NPBehave.Decorator.Decorator
---@overload fun(cooldownTime: number, randomVariation: number, startAfterDecoratee: boolean, resetOnFailure: boolean, failOnCooldown: boolean, decoratee: NPBehave.Node): self
local Cooldown = Class(NPBehave.ClassName.Cooldown)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.Cooldown: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.Cooldown, superName, function(self, super, ...)
    local cooldownTime, randomVariation, startAfterDecoratee, resetOnFailure, failOnCooldown, decoratee = ...
    super("TimeCooldown", decoratee)
end)

---@param cooldownTime number
---@param randomVariation number
---@param startAfterDecoratee boolean
---@param resetOnFailure boolean
---@param failOnCooldown boolean
---@param decoratee NPBehave.Node
---@return self
function Cooldown:__init(cooldownTime, randomVariation, startAfterDecoratee, resetOnFailure, failOnCooldown, decoratee)
    assert(cooldownTime > 0, "必须设置冷却时间")
    self._startAfterDecoratee = startAfterDecoratee
    self._cooldownTime = cooldownTime
    self._resetOnFailure = resetOnFailure
    self._randomVariation = randomVariation
    self._failOnCooldown = failOnCooldown
    self._isReady = true
    return self
end

---override<br>
---@protected
function Cooldown:DoStart()
    if self._isReady then
        self._isReady = false
        if not self._startAfterDecoratee then
            self.Clock:AddTimer(self._cooldownTime, 0, self:bind(self.TimeoutReached), self._randomVariation)
        end
        self.Decoratee:Start()
    elseif self._failOnCooldown then
        self:Stopped(false)
    end
end

---override<br>
---@protected
function Cooldown:DoCancel()
    if self.Decoratee.IsActive then
        self._isReady = true
        self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
        self.Decoratee:CancelWithoutReturnResult()
    else
        self._isReady = true
        self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
        self:Stopped(false)
    end
end

---override<br>
---@protected
function Cooldown:DoChildStopped(child, result)
    if self._resetOnFailure and not result then
        self._isReady = true
        self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
    elseif self._startAfterDecoratee then
        self.Clock:AddTimer(self._cooldownTime, 0, self:bind(self.TimeoutReached), self._randomVariation)
    end
    self:Stopped(result)
end

function Cooldown:TimeoutReached()
    if self.IsActive and not self.Decoratee.IsActive then
        self.Clock:AddTimer(self._cooldownTime, 0, self:bind(self.TimeoutReached), self._randomVariation)
        self.Decoratee:Start()
    else
        self._isReady = true
    end
end
