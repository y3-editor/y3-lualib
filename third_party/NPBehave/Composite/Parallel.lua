---@class NPBehave.Composite.Parallel
---@overload fun(successPolicy: NPBehave.Enum.ParallelPolicy, failurePolicy: NPBehave.Enum.ParallelPolicy, ...: NPBehave.Node): self
local Parallel = Class(NPBehave.ClassName.Parallel)
local superName = NPBehave.ClassName.Composite

---@class NPBehave.Composite.Parallel: NPBehave.Composite.Composite
Extends(NPBehave.ClassName.Parallel, superName, function(self, super, ...)
    local args = { select(3, ...) }
    super("Parallel", table.unpack(args))
end)

--TODO 待验证


---@param successPolicy NPBehave.Enum.ParallelPolicy
---@param failurePolicy NPBehave.Enum.ParallelPolicy
---@param ... NPBehave.Node[]
---@return self
function Parallel:__init(successPolicy, failurePolicy, ...)
    self._successPolicy = successPolicy
    self._failurePolicy = failurePolicy
    local children = { ... }
    self._childrenCount = #children
    self._runningCount = 0
    self._succeededCount = 0
    self._failedCount = 0
    ---@type {[NPBehave.Node]: boolean}
    self._childrenResults = {}
    self._successState = false
    self._childrenAborted = false
    return self
end

---override<br>
---@protected
function Parallel:DoStart()
    for _, child in ipairs(self.Children) do
        assert(child.CurrentState == NPBehave.Enum.NodeState.Inactive)
    end

    self._childrenAborted = false
    self._runningCount = 0
    self._succeededCount = 0
    self._failedCount = 0
    for _, child in ipairs(self.Children) do
        self._runningCount = self._runningCount + 1
        child:Start()
    end
end

---override<br>
---@protected
function Parallel:DoCancel()
    assert(self._runningCount + self._succeededCount + self._failedCount == self._childrenCount)

    for _, child in ipairs(self.Children) do
        if child.IsActive then
            child:CancelWithoutReturnResult()
        end
    end
end

---override<br>
---@protected
---@param child NPBehave.Node
---@param result boolean
function Parallel:DoChildStopped(child, result)
    self._runningCount = self._runningCount - 1
    if result then
        self._succeededCount = self._succeededCount + 1
    else
        self._failedCount = self._failedCount + 1
    end
    self._childrenResults[child] = result

    local allChildrenStarted = self._runningCount + self._succeededCount + self._failedCount == self._childrenCount
    if allChildrenStarted then
        if self._runningCount == 0 then
            if not self._childrenAborted then
                if self._failurePolicy == NPBehave.Enum.ParallelPolicy.One and self._failedCount > 0 then
                    self._successState = false
                elseif self._successPolicy == NPBehave.Enum.ParallelPolicy.One and self._succeededCount > 0 then
                    self._successState = true
                elseif self._successPolicy == NPBehave.Enum.ParallelPolicy.All and self._succeededCount == self._childrenCount then
                    self._successState = true
                else
                    self._successState = false
                end
            end
            self:Stopped(self._successState)
        elseif not self._childrenAborted then
            assert(self._succeededCount ~= self._childrenCount)
            assert(self._failedCount ~= self._childrenCount)

            if self._failurePolicy == NPBehave.Enum.ParallelPolicy.One and self._failedCount > 0 then
                self._successState = false
                self._childrenAborted = true
            elseif self._successPolicy == NPBehave.Enum.ParallelPolicy.One and self._succeededCount > 0 then
                self._successState = true
                self._childrenAborted = true
            end

            if self._childrenAborted then
                for _, currentChild in ipairs(self.Children) do
                    if currentChild.IsActive then
                        currentChild:CancelWithoutReturnResult()
                    end
                end
            end
        end
    end
end

---@override
---@param abortForChild NPBehave.Node
---@param immediateRestart boolean
function Parallel:StopLowerPriorityChildrenForChild(abortForChild, immediateRestart)
    if immediateRestart then
        assert(not abortForChild.IsActive)
        if self._childrenResults[abortForChild] then
            self._succeededCount = self._succeededCount - 1
        else
            self._failedCount = self._failedCount - 1
        end
        self._runningCount = self._runningCount + 1
        abortForChild:Start()
    else
        error("在并行节点上所有子节点都具有相同的优先级, 如果将 false 传递给`immediateRestart`, 该方法不会执行任何操作! ")
    end
end
