local ipairs = ipairs
---@class NPBehave.Decorator.BlackboardQuery : NPBehave.Decorator.ObservingDecorator
---@overload fun(keys: string[], stopsOnChange: NPBehave.Enum.Stops, query: fun():boolean, decoratee: NPBehave.Node): self
local BlackboardQuery = Class(NPBehave.ClassName.BlackboardQuery)
local superName = NPBehave.ClassName.ObservingDecorator

---@class NPBehave.Decorator.BlackboardQuery: NPBehave.Decorator.ObservingDecorator
Extends(NPBehave.ClassName.BlackboardQuery, superName, function(self, super, ...)
    local keys, stopsOnChange, query, decoratee = ...
    super("BlackboardQuery", stopsOnChange, decoratee)
end)


---@param keys string[]
---@param stopsOnChange NPBehave.Enum.Stops
---@param query fun():boolean
---@param decoratee NPBehave.Node
---@return self
function BlackboardQuery:__init(keys, stopsOnChange, query, decoratee)
    self._keys = keys
    self._query = query
    return self
end

---override<br>
---@protected
function BlackboardQuery:StartObserving()
    for _, key in ipairs(self._keys) do
        ---@diagnostic disable-next-line: param-type-mismatch
        self.RootNode.Blackboard:AddObserver(key, self:bind(self.OnValueChanged))
    end
end

---override<br>
---@protected
function BlackboardQuery:StopObserving()
    for _, key in ipairs(self._keys) do
        ---@diagnostic disable-next-line: param-type-mismatch
        self.RootNode.Blackboard:RemoveObserver(key, self:bind(self.OnValueChanged))
    end
end

---@private
---@param type NPBehaveBlackboardType
---@param newValue any
function BlackboardQuery:OnValueChanged(type, newValue)
    self:Evaluate()
end

---override<br>
---@protected
---@return boolean
function BlackboardQuery:IsConditionMet()
    return self._query()
end

function BlackboardQuery:__tostring()
    local keys = ""
    for _, key in ipairs(self._keys) do
        keys = keys .. " " .. key
    end
    return self.Name .. keys
end
