---@class NPBehave.Decorator.Repeater : NPBehave.Decorator.Decorator
---@overload fun(loopCount: number, decoratee: NPBehave.Node): self
local Repeater = Class(NPBehave.ClassName.Repeater)
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Decorator.Repeater: NPBehave.Decorator.Decorator
Extends(NPBehave.ClassName.Repeater, superName, function(self, super, ...)
    local loopCount, decoratee = ...
    super("Repeater", decoratee)
end)

---@param loopCount number 执行装饰器的次数, `-1`为无限重复.
---@param decoratee NPBehave.Node
---@return self
function Repeater:__init(loopCount, decoratee)
    self._loopCount = loopCount
    self._currentLoop = 0
    return self
end

---override<br>
---@protected
function Repeater:DoStart()
    if self._loopCount ~= 0 then
        self._currentLoop = 0
        self.Decoratee:Start()
    else
        self:Stopped(true)
    end
end

---override<br>
---@protected
function Repeater:DoCancel()
    self.Clock:RemoveTimer(self:bind(self.RestartDecorator))

    if self.Decoratee.IsActive then
        self.Decoratee:CancelWithoutReturnResult()
    else
        self:Stopped(false)
    end
end

---override<br>
---@protected
function Repeater:DoChildStopped(child, result)
    if result then
        if self.IsStopRequested or (self._loopCount > 0 and self._currentLoop + 1 >= self._loopCount) then
            self:Stopped(true)
        else
            self.Clock:AddTimer(0, 0, self:bind(self.RestartDecorator))
        end
    else
        self:Stopped(false)
    end
end

function Repeater:RestartDecorator()
    self.Decoratee:Start()
end
