---@class NPBehave.Composite.Composite
---@field protected Children? NPBehave.Node[]
---@field StopLowerPriorityChildrenForChild fun(self: self, child: NPBehave.Node, immediateRestart: boolean) abstract<br>
---@overload fun(name: string, children: NPBehave.Node[]): self
local Composite = Class("NPBehave.Composite.Composite")
local superName = "NPBehave.Container"
---@class NPBehave.Composite.Composite: NPBehave.Container
Extends('NPBehave.Composite.Composite', superName, function(self, super, ...)
    local name = ...
    super(name)
end)

---@param name string
---@param ... NPBehave.Node
---@return self
function Composite:__init(name, ...)
    -- 转换为数组
    self.Children = {...}
    for _, node in ipairs(self.Children) do
        node:SetParent(self)
    end
    return self
end

---override<br>
---@param rootNode NPBehave.Root
function Composite:SetRoot(rootNode)
    ClassGet(superName)
        .SetRoot(self, rootNode)
    for _, node in ipairs(self.Children) do
        node:SetRoot(rootNode)
    end
end


---override<br>
---@param success boolean
function Composite:Stopped(success)
    for _, child in ipairs(self.Children) do
        child:ParentCompositeStopped(self)
    end
    ClassGet(superName)
        .Stopped(self, success)
end

return Composite
