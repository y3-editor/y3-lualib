local superName = NPBehave.ClassName.Composite

---@class NPBehave.Composite.RandomSelector: NPBehave.Composite.Composite
---@field package __super NPBehave.Composite.Composite
---@overload fun(...: NPBehave.Node): self
local RandomSelector = Class(NPBehave.ClassName.RandomSelector, superName, function(self, super, ...)
    super("Random Selector", ...)
end)

---@param ... NPBehave.Node
---@return self
function RandomSelector:__init(...)
    self._currentIndex = 0
    self._randomizedOrder = {}
    for i = 1, #self.Children do
        self._randomizedOrder[i] = i
    end
    return self
end

---override<br>
---@protected
function RandomSelector:DoStart()
    for _, child in ipairs(self.Children) do
        assert(child.CurrentState == NPBehave.Enum.NodeState.Inactive)
    end

    self._currentIndex = 0

    -- Shuffling
    local n = #self._randomizedOrder
    while n > 1 do
        local k = math.random(n)
        n = n - 1
        self._randomizedOrder[n], self._randomizedOrder[k] = self._randomizedOrder[k], self._randomizedOrder[n]
    end

    self:ProcessChildren()
end

---override<br>
---@protected
function RandomSelector:DoCancel()
    self.Children[self._randomizedOrder[self._currentIndex]]:CancelWithoutReturnResult()
end

---override<br>
---@protected
---@param child NPBehave.Node
---@param result boolean
function RandomSelector:DoChildStopped(child, result)
    if result then
        self:Stopped(true)
    else
        self:ProcessChildren()
    end
end

function RandomSelector:ProcessChildren()
    self._currentIndex = self._currentIndex + 1
    if self._currentIndex <= #self.Children then
        if self.IsStopRequested then
            self:Stopped(false)
        else
            self.Children[self._randomizedOrder[self._currentIndex]]:Start()
        end
    else
        self:Stopped(false)
    end
end

---@override
---@param abortForChild NPBehave.Node
---@param immediateRestart boolean
function RandomSelector:StopLowerPriorityChildrenForChild(abortForChild, immediateRestart)
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
function RandomSelector:__tostring()
    ---@diagnostic disable-next-line: invisible
    return RandomSelector.__super:__tostring() .. "[" .. self._currentIndex .. "]"
end