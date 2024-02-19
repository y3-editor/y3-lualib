---@class NPBehave.Decorator.ObservingDecorator
---@field StartObserving fun() abstract
---@field StopObserving fun() abstract
---@field IsConditionMet fun() abstract
---@overload fun(name: string, stopsOnChange: NPBehaveStops, decoratee: NPBehave.Node): self
local ObservingDecorator = Class(NPBehaveClassName.ObservingDecorator)
local superName = NPBehaveClassName.Decorator

---@class NPBehave.Decorator.ObservingDecorator: NPBehave.Decorator.Decorator
Extends(NPBehaveClassName.ObservingDecorator, superName, function(self, super, ...)
    local name, _, decoratee = ...
    super(name, decoratee)
end)


---@param name string
---@param stopsOnChange NPBehaveStops
---@param decoratee NPBehave.Node
---@return self
function ObservingDecorator:__init(name, stopsOnChange,  decoratee)
    self.StopsOnChange = stopsOnChange
    self._isObserving =  false;
    return self
end

---override<br>
---@protected
function ObservingDecorator:DoStart()
    if self.StopsOnChange ~= NPBehaveStops.None then
        if not self._isObserving then
            self._isObserving = true
            self:StartObserving()
        end
    end

    if not self:IsConditionMet() then
        self:Stopped(false)
    else
        self.Decoratee:Start()
    end
end
---override<br>
---@protected
function ObservingDecorator:DoCancel()
    self.Decoratee:CancelWithoutReturnResult()
end

---override<br>
---@protected
---@param child NPBehave.Node
---@param result boolean
function ObservingDecorator:DoChildStopped(child, result)
    assert(self.CurrentState ~= NPBehaveNodeState.Inactive)
    if self.StopsOnChange == NPBehaveStops.None or self.StopsOnChange == NPBehaveStops.Self then
        if self._isObserving then
            self._isObserving = false
            self:StopObserving()
        end
    end
    self:Stopped(result)
end

---override<br>
---@protected
---@param parentComposite NPBehave.Composite.Composite
function ObservingDecorator:DoParentCompositeStopped(parentComposite)
    if self._isObserving then
        self._isObserving = false
        self:StopObserving()
    end
end

---protected
function ObservingDecorator:Evaluate()
    -- 自身活跃且值为监听的黑板值不满足条件, 则停止自身
    if self.IsActive and not self:IsConditionMet() then
        if self.StopsOnChange == NPBehaveStops.Self or self.StopsOnChange == NPBehaveStops.Both or self.StopsOnChange == NPBehaveStops.ImmediateRestart then
            -- Debug.Log( this.key + " stopped self ")
            self:CancelWithoutReturnResult()
        end
    -- 自身不活跃且值为监听的黑板值满足条件, 则停止其他
    elseif not self.IsActive and self:IsConditionMet() then
        if self.StopsOnChange == NPBehaveStops.LowerPriority or self.StopsOnChange == NPBehaveStops.Both or self.StopsOnChange == NPBehaveStops.ImmediateRestart or self.StopsOnChange == NPBehaveStops.LowerPriorityImmediateRestart then
            -- Debug.Log( this.key + " stopped other ")
            local parentNode = self.ParentNode
            ---@type NPBehave.Node
            local childNode = self
            
            while parentNode ~= nil and not ClassTool.isInstanceOf(parentNode, NPBehaveClassName.Composite) do
                childNode = parentNode
                parentNode = parentNode.ParentNode
            end
            assert(parentNode ~= nil, "Stops 仅在附加到父组合时才有效.")
            assert(childNode ~= nil)
            if ClassTool.isInstanceOf(parentNode, NPBehaveClassName.Parallel) then
                assert(self.StopsOnChange == NPBehaveStops.ImmediateRestart, "在并行节点上，所有子节点具有相同的优先级，因此在这种情况下不支持 Stops.LowerPriority 或 Stops.Both!")
            end
            if self.StopsOnChange == NPBehaveStops.ImmediateRestart or self.StopsOnChange == NPBehaveStops.LowerPriorityImmediateRestart then
                if self._isObserving then
                    self._isObserving = false
                    self:StopObserving()
                end
            end
            local parentComposite = ClassTool.isInstanceOf(parentNode, NPBehaveClassName.Composite) and parentNode or nil
            if parentComposite ~= nil then
                ---@cast parentComposite NPBehave.Composite.Composite
                parentComposite:StopLowerPriorityChildrenForChild(childNode, self.StopsOnChange == NPBehaveStops.ImmediateRestart or self.StopsOnChange == NPBehaveStops.LowerPriorityImmediateRestart)
            end
        end
    end
end