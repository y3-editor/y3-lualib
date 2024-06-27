local stringFormat = string.format
---@class NPBehave.Decorator.Service
---@overload fun(interval: number, service: fun(), decoratee: NPBehave.Node, randomVariation: number): self
local Service = Class("NPBehave.Decorator.Service")
local superName = "NPBehave.Decorator.Decorator"

---@class NPBehave.Decorator.Service: NPBehave.Decorator.Decorator
Extends('NPBehave.Decorator.Service', superName, function(self, super, ...)
    local interval, service, decoratee, randomVariation = ...
    super("Service", decoratee)
end)

---@param interval? number 间隔时间, 默认为 `-1.0` (每帧都执行)
---@param service fun() 服务函数
---@param decoratee NPBehave.Node 被装饰的节点
---@param randomVariation? number 随机方差, 默认为 `interval * 0.05`
---@return self
function Service:__init(interval, service, decoratee, randomVariation)
    self._serviceMethod = service
    self._interval = interval or -1.0
    self._randomVariation = randomVariation or interval * 0.05;

    if self._interval > 0.0 then
        self.Label = stringFormat("%s...%s", self._interval - self._randomVariation,
            self._interval + self._randomVariation)
    else
        self.Label = "every tick"
    end
    return self
end

---override<br>
---@protected
function Service:DoStart()
    if self._interval <= 0 then
        self.Clock:AddUpdateObserver(self:bind(self._serviceMethod))
        self._serviceMethod()
    elseif self._randomVariation <= 0 then
        self.Clock:AddTimer(self._interval, -1, self:bind(self._serviceMethod))
        self._serviceMethod()
    else
        self:InvokeServiceMethodWithRandomVariation()
    end
    self.Decoratee:Start()
end

---override<br>
---@protected
function Service:DoCancel()
    self.Decoratee:CancelWithoutReturnResult()
end

---override<br>
---@protected
function Service:DoChildStopped(child, result)
    if self._interval <= 0 then
        self.Clock:RemoveUpdateObserver(self:bind(self._serviceMethod))
    elseif self._randomVariation <= 0 then
        self.Clock:RemoveTimer(self:bind(self._serviceMethod))
    else
        self.Clock:RemoveTimer(self:bind(self.InvokeServiceMethodWithRandomVariation))
    end
    self:Stopped(result)
end

---带随机变化的调用服务方法
---@private
function Service:InvokeServiceMethodWithRandomVariation()
    self._serviceMethod()
    self.Clock:AddTimer(self._interval, 0, self:bind(self.InvokeServiceMethodWithRandomVariation), self._randomVariation)
end

return Service
