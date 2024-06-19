local assert = assert
---@class NPBehave.Container: NPBehave.Node
---@overload fun(name: string): self
---@field Collapse boolean 崩溃
local Container = Class("NPBehave.Container")

---@class NPBehave.Container: NPBehave.Node
Extends('NPBehave.Container', 'NPBehave.Node', function(self, super, ...)
    super(...)
end)

---@param name string
---@return self
function Container:__init(name)
    return self
end

---@param child NPBehave.Node
---@param succeeded boolean
function Container:ChildStopped(child, succeeded)
    assert(self.currentState ~= NPBehave.Enum.NodeState.Inactive, "容器的子容器在容器处于非活动状态时被停止.")
    self:DoChildStopped(child, succeeded)
end

---abstract<br>
---@param child NPBehave.Node
---@param succeeded boolean
function Container:DoChildStopped(child, succeeded)
    assert(false, "abstract method")
end

return Container
