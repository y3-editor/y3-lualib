---@class NPBehave.Decorator.Decorator
---@field protected Decoratee NPBehave.Node
---@overload fun(name: string, decoratee: NPBehave.Node): self
local Decorator = Class(NPBehaveClassName.Decorator)
local superName = "NPBehave.Container"
---@class NPBehave.Decorator.Decorator: NPBehave.Container
Extends(NPBehaveClassName.Decorator, superName, function(self, super, ...)
    local name = ...
    super(name)
end)


---@param name string
---@param decoratee NPBehave.Node
---@return self
function Decorator:__init(name, decoratee)
    self.Decoratee = decoratee
    self.Decoratee:SetParent(self)
    return self
end

---override<br>
---@param rootNode NPBehave.Root
function Decorator:SetRoot(rootNode)
    ClassGet(superName)
        .SetRoot(self, rootNode)
    self.Decoratee:SetRoot(rootNode)
end

---override<br>
---@param composite NPBehave.Composite.Composite
function Decorator:ParentCompositeStopped(composite)
    ClassGet(superName)
        .ParentCompositeStopped(self, composite)
    self.Decoratee:ParentCompositeStopped(composite);
end

return Decorator
