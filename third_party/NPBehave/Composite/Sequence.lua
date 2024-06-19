local ipairs = ipairs
local assert = assert
local superName = NPBehave.ClassName.Composite

---@class NPBehave.Composite.Sequence: NPBehave.Composite.Composite
---@field package __super NPBehave.Composite.Composite
---@overload fun(...: NPBehave.Node): self
local Sequence = Class(NPBehave.ClassName.Sequence, superName, function(self, super, ...)
    super("Sequence", ...)
end)


function Sequence:__init(children)
    self._currentIndex = 0
    return self
end

---override<br>
---@protected
function Sequence:DoStart()
    for _, child in ipairs(self.Children) do
        assert(child.CurrentState == NPBehave.Enum.NodeState.Inactive)
    end

    self._currentIndex = 0

    self:ProcessChildren()
end

---override<br>
---@protected
function Sequence:DoCancel()
    self.Children[self._currentIndex]:CancelWithoutReturnResult()
end

---override<br>
---@protected
---@param child NPBehave.Node
---@param result boolean
function Sequence:DoChildStopped(child, result)
    if result then
        self:ProcessChildren()
    else
        self:Stopped(false)
    end
end

function Sequence:ProcessChildren()
    self._currentIndex = self._currentIndex + 1
    if self._currentIndex <= #self.Children then
        if self.IsStopRequested then
            self:Stopped(false)
        else
            self.Children[self._currentIndex]:Start()
        end
    else
        self:Stopped(true)
    end
end

---@override
---@param abortForChild NPBehave.Node
---@param immediateRestart boolean
function Sequence:StopLowerPriorityChildrenForChild(abortForChild, immediateRestart)
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
function Sequence:__tostring()
    ---@diagnostic disable-next-line: invisible
    return Sequence.__super:__tostring() .. "[" .. self._currentIndex .. "]"
end
