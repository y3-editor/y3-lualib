local assert = assert
local superName = NPBehave.ClassName.Decorator

---@class NPBehave.Root: NPBehave.Decorator.Decorator
---@field private _blackboard NPBehave.Blackboard
---@field Blackboard NPBehave.Blackboard `__getter`
---@field private _clock NPBehave.Clock
---@field Clock NPBehave.Clock `__getter`
---@field package __super NPBehave.Decorator.Decorator
---@overload fun(mainNode: NPBehave.Node, blackboard: NPBehave.Blackboard, clock: NPBehave.Clock): self
local Root = Class("NPBehave.Root", superName, function(self, super, ...)
    local mainNode = ...
    super("Root", mainNode)
end)


---@diagnostic disable-next-line: undefined-field
Root.__getter.Blackboard = function(self)
    ---@cast self NPBehave.Root
    ---@diagnostic disable-next-line: invisible
    return self._blackboard
end

---@diagnostic disable-next-line: undefined-field
Root.__getter.Clock = function(self)
    ---@cast self NPBehave.Root
    ---@diagnostic disable-next-line: invisible
    return self._clock
end


---@param mainNode NPBehave.Node
---@param blackboard? NPBehave.Blackboard
---@param clock? NPBehave.Clock
---@return self
function Root:__init(mainNode, blackboard, clock)
    clock = clock or NPBehave.Context.Clock;
    blackboard = blackboard or New("NPBehave.Blackboard")(clock);
    self._blackboard = blackboard;
    self._clock = clock;
    self:SetRoot(self);
    return self
end

---@param rootNode NPBehave.Root
function Root:SetRoot(rootNode)
    assert(self == rootNode, "Root节点只能设置为自己的根节点")
    Root.__super.SetRoot(self, rootNode)
end

---override<br>
---@protected
function Root:DoStart()
    self._blackboard:Enable()
    self.Decoratee:Start()
end

---override<br>
---@protected
function Root:DoCancel()
    if self.Decoratee.IsActive then
        self.Decoratee:CancelWithoutReturnResult()
    else
        self._clock:RemoveTimer(self.Decoratee:bind(self.Decoratee.Start))
    end
end

---override<br>
---@protected
function Root:DoChildStopped(node, success)
    if not self.IsStopRequested then
        -- 等待一`tick`, 防止无休止的递归
        self._clock:AddTimer(0, 0, self.Decoratee:bind(self.Start))
    else
        self._blackboard:Disable()
        self:Stopped(success)
    end
end

return Root
