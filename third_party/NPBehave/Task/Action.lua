local assert = assert
---@class NPBehave.Task.Action
---@overload fun(data: NPBehave.Task.Action.InitParam): self
local Action = Class("NPBehave.Task.Action")

local superName = "NPBehave.Task.Task"
---@class NPBehave.Task.Action: NPBehave.Task.Task
Extends('NPBehave.Task.Action', superName, function(self, super, ...)
    super("Action")
end)

---@enum NPBehaveTaskActionResult
local NPBehaveTaskActionResult = {
    Success = "Success",
    Failed = "Failed",
    Blocked = "Blocked",
    Progress = "Progress"
}

---@enum NPBehaveTaskActionRequest
local NPBehaveTaskActionRequest = {
    Start = "Start",
    Update = "Update",
    Cancel = "Cancel"
}


---@class NPBehave.Task.Action.InitParam
---@field action? fun()
---@field multiFrameFunc? fun(param: boolean): NPBehaveTaskActionResult
---@field multiFrameFunc2? fun(param: NPBehaveTaskActionRequest): NPBehaveTaskActionResult
---@field singleFrameFunc? fun(): boolean

---@param data NPBehave.Task.Action.InitParam
---@return self
function Action:__init(data)
    self._singleFrameFunc = data.singleFrameFunc
    self._multiFrameFunc = data.multiFrameFunc
    self._multiFrameFunc2 = data.multiFrameFunc2
    self._action = data.action
    self._bWasBlocked = false
    return self
end

---override<br>
---@protected
function Action:DoStart()
    if self._action ~= nil then
        self._action()
        self:Stopped(true)
    elseif self._multiFrameFunc ~= nil then
        local result = self._multiFrameFunc(false)
        if result == NPBehaveTaskActionResult.Progress then
            self.RootNode.Clock:AddUpdateObserver(self:bind(self.OnUpdateFunc))
        elseif result == NPBehaveTaskActionResult.Blocked then
            self._bWasBlocked = true
            self.RootNode.Clock:AddUpdateObserver(self:bind(self.OnUpdateFunc))
        else
            self:Stopped(result == NPBehaveTaskActionResult.Success)
        end
    elseif self._multiFrameFunc2 ~= nil then
        local result = self._multiFrameFunc2(NPBehaveTaskActionRequest.Start)
        if result == NPBehaveTaskActionResult.Progress then
            self.RootNode.Clock:AddUpdateObserver(self:bind(self.OnUpdateFunc2))
        elseif result == NPBehaveTaskActionResult.Blocked then
            self._bWasBlocked = true
            self.RootNode.Clock:AddUpdateObserver(self:bind(self.OnUpdateFunc2))
        else
            self:Stopped(result == NPBehaveTaskActionResult.Success)
        end
    elseif self._singleFrameFunc ~= nil then
        self:Stopped(self._singleFrameFunc())
    end
end

---@private
function Action:OnUpdateFunc()
    local result = self._multiFrameFunc(false)
    if result ~= NPBehaveTaskActionResult.Progress and result ~= NPBehaveTaskActionResult.Blocked then
        self.RootNode.Clock:RemoveUpdateObserver(self:bind(self.OnUpdateFunc))
        self:Stopped(result == NPBehaveTaskActionResult.Success)
    end
end

---@private
function Action:OnUpdateFunc2()
    local result = self._multiFrameFunc2(self._bWasBlocked and NPBehaveTaskActionRequest.Start or
        NPBehaveTaskActionRequest.Update)
    if result == NPBehaveTaskActionResult.Blocked then
        self._bWasBlocked = true
    elseif result == NPBehaveTaskActionResult.Progress then
        self._bWasBlocked = false
    else
        self.RootNode.Clock:RemoveUpdateObserver(self:bind(self.OnUpdateFunc2))
        self:Stopped(result == NPBehaveTaskActionResult.Success)
    end
end

---override<br>
---@protected
function Action:DoCancel()
    if self._multiFrameFunc ~= nil then
        local result = self._multiFrameFunc(true)
        assert(result ~= NPBehaveTaskActionResult.Progress,
            "The Task has to return Result.SUCCESS, Result.FAILED/BLOCKED after being cancelled!")
        self.RootNode.Clock:RemoveUpdateObserver(self:bind(self.OnUpdateFunc))
        self:Stopped(result == NPBehaveTaskActionResult.Success)
    elseif self._multiFrameFunc2 ~= nil then
        local result = self._multiFrameFunc2(NPBehaveTaskActionRequest.Cancel)
        assert(result ~= NPBehaveTaskActionResult.Progress,
            "The Task has to return Result.SUCCESS or Result.FAILED/BLOCKED after being cancelled!")
        self.RootNode.Clock:RemoveUpdateObserver(self:bind(self.OnUpdateFunc2))
        self:Stopped(result == NPBehaveTaskActionResult.Success)
    else
        assert(false, "DoStop called for a single frame action on " .. tostring(self))
    end
end

return Action
