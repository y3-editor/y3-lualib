---@class NPBehave.Task.Wait : NPBehave.Task.Task
---@overload fun(name: string): self
local Wait = Class(NPBehave.ClassName.Wait)
local superName = NPBehave.ClassName.Task

---@class NPBehave.Task.Wait: NPBehave.Task.Task
Extends(NPBehave.ClassName.Wait, superName, function(self, super, ...)
    super("Wait")
end)


---@class NPBehave.Task.Wait.Data
---@field seconds? number
---@field randomVariance? number
---@field blackboardKey? string
---@field callback? fun(): number



---@param data NPBehave.Task.Wait.Data
---@return self
function Wait:__init(data)
    self._seconds = data.seconds or -1
    self._randomVariance = data.randomVariance
    self._blackboardKey = data.blackboardKey
    self._callback = data.callback
    return self
end

---override<br>
---@protected
function Wait:DoStart()
    local seconds = self._seconds
    if seconds < 0 then
        if self._blackboardKey then
            seconds = self.Blackboard:Get(self._blackboardKey)
        elseif self._callback then
            seconds = self._callback()
        end
    end
    if seconds < 0 then
        seconds = 0
    end
    if self._randomVariance >= 0 then
        self.Clock:AddTimer(seconds, 0, self:bind(self.OnTimer), self._randomVariance)
    else
        self.Clock:AddTimer(seconds, 0, self:bind(self.OnTimer))
    end
end

---override<br>
---@protected
function Wait:DoCancel()
    self.Clock:RemoveTimer(self:bind(self.OnTimer))
    self:Stopped(false)
end

function Wait:OnTimer()
    self.Clock:RemoveTimer(self:bind(self.OnTimer))
    self:Stopped(true)
end
