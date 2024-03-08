---@class NPBehave.Decorator.TimeMax : NPBehave.Decorator.Decorator
---@overload fun(limit: number, randomVariation: number, waitForChildButFailOnLimitReached: boolean, decoratee: NPBehave.Node): self
local TimeMax = Class(NPBehave.ClassName.TimeMax)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.TimeMax: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.TimeMax, superName, function(self, super, ...)
    local limit, randomVariation, waitForChildButFailOnLimitReached, decoratee = ...
    super("TimeMax", decoratee)
end)

---@param limit number 限制
---@param randomVariation? number 随机变化
---@param waitForChildButFailOnLimitReached boolean 等待子进程但达到限制失败
---@param decoratee NPBehave.Node 装饰节点
---@return self
function TimeMax:__init(limit, randomVariation, waitForChildButFailOnLimitReached, decoratee)
    self._limit = limit
    self._randomVariation = randomVariation or limit * 0.05
    self._waitForChildButFailOnLimitReached = waitForChildButFailOnLimitReached
    self._isLimitReached = false
    assert(limit > 0, "limit 必须大于 0")
    return self
end

---override<br>
---@protected
function TimeMax:DoStart()
    self._isLimitReached = false
    self.Clock:AddTimer(self._limit, 0, self:bind(self.TimeoutReached), self._randomVariation)
    self.Decoratee:Start()
end

---override<br>
---@protected
function TimeMax:DoCancel()
    self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
    if self.Decoratee.IsActive then
        self.Decoratee:CancelWithoutReturnResult()
    else
        self:Stopped(false)
    end
end

---override<br>
---@protected
function TimeMax:DoChildStopped(child, result)
    self.Clock:RemoveTimer(self:bind(self.TimeoutReached))
    if self._isLimitReached then
        self:Stopped(false)
    else
        self:Stopped(result)
    end
end

function TimeMax:TimeoutReached()
    if not self._waitForChildButFailOnLimitReached then
        self.Decoratee:CancelWithoutReturnResult()
    else
        self._isLimitReached = true
        assert(self.Decoratee.IsActive)
    end
end
