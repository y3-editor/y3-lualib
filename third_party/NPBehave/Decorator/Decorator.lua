local superName = "NPBehave.Container"

---@class NPBehave.Decorator.Decorator: NPBehave.Container
---@field protected Decoratee NPBehave.Node
---@field package __super NPBehave.Container
---@overload fun(name: string, decoratee: NPBehave.Node): self
local Decorator = Class(NPBehave.ClassName.Decorator, superName, function(self, super, ...)
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
    Decorator.__super.SetRoot(self, rootNode)
    self.Decoratee:SetRoot(rootNode)
end

---override<br>
---@param composite NPBehave.Composite.Composite
function Decorator:ParentCompositeStopped(composite)
    Decorator.__super.ParentCompositeStopped(self, composite)
    self.Decoratee:ParentCompositeStopped(composite);
end

return Decorator
