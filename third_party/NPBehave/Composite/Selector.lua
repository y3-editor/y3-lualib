---@class NPBehave.Composite.Selector
---@overload fun(...: NPBehave.Node): self
local Selector = Class(NPBehaveClassName.Selector)
local superName = NPBehaveClassName.Composite

---@class NPBehave.Composite.Selector: NPBehave.Composite.Composite
Extends(NPBehaveClassName.Selector, superName, function(self, super, ...)
    super("Selector", ...)
end)

function Selector:__init(children)
    self._currentIndex = 0
    return self
end

---override<br>
---@protected
function Selector:DoStart()
    for _, child in ipairs(self.Children) do
        assert(child.CurrentState == NPBehaveNodeState.Inactive)
    end

    self._currentIndex = 0

    self:ProcessChildren()
end

---override<br>
---@protected
function Selector:DoCancel()
    self.Children[self._currentIndex]:CancelWithoutReturnResult()
end

---override<br>
---@protected
---@param child NPBehave.Node
---@param result boolean
function Selector:DoChildStopped(child, result)
    if result then
        self:Stopped(true)
    else
        self:ProcessChildren()
    end
end

function Selector:ProcessChildren()
    self._currentIndex = self._currentIndex + 1
    if self._currentIndex <= #self.Children then
        if self.IsStopRequested then
            self:Stopped(false)
        else
            self.Children[self._currentIndex]:Start()
        end
    else
        self:Stopped(false)
    end
end

---@override
---@param abortForChild NPBehave.Node
---@param immediateRestart boolean
function Selector:StopLowerPriorityChildrenForChild(abortForChild, immediateRestart)
    local indexForChild = 1
    local found = false
    for _, currentChild in ipairs(self.Children) do
        if currentChild == abortForChild then
            found = true
        elseif not found then
            indexForChild = indexForChild + 1
        elseif found and currentChild.IsActive then
            if immediateRestart then
                self._currentIndex = indexForChild - 1
            else
                self._currentIndex = #self.Children + 1
            end
            currentChild:CancelWithoutReturnResult()
            break
        end
    end
end

---@override
---@return string
function Selector:__tostring()
    return ClassGet(superName):__tostring() .. "[" .. self._currentIndex .. "]"
end