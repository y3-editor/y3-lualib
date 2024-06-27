local assert = assert
local type = type
---@class NPBehave.Decorator.BlackboardCondition
---@overload fun(key: string, op: NPBehave.Enum.Operator, value: any, stopsOnChange: NPBehave.Enum.Stops, decoratee: NPBehave.Node): self
local BlackboardCondition = Class(NPBehave.ClassName.BlackboardCondition)
local superName = NPBehave.ClassName.ObservingDecorator

---@class NPBehave.Decorator.BlackboardCondition: NPBehave.Decorator.ObservingDecorator
Extends(NPBehave.ClassName.BlackboardCondition, superName, function(self, super, ...)
    local key, op, value, stopsOnChange, decoratee = ...
    super("BlackboardCondition", stopsOnChange, decoratee)
end)


---@param key string
---@param op NPBehave.Enum.Operator
---@param value? any
---@param stopsOnChange NPBehave.Enum.Stops
---@param decoratee NPBehave.Node
---@return unknown
function BlackboardCondition:__init(key, op, value, stopsOnChange, decoratee)
    self._op = op;
    self._key = key;
    self._value = value;
    self.StopsOnChange = stopsOnChange;
    return self
end

---override<br>
---@protected
function BlackboardCondition:StartObserving()
    ---@diagnostic disable-next-line: param-type-mismatch
    self.RootNode.Blackboard:AddObserver(self._key, self:bind(self.OnValueChanged))
end

---override<br>
---@protected
function BlackboardCondition:StopObserving()
    ---@diagnostic disable-next-line: param-type-mismatch
    self.RootNode.Blackboard:RemoveObserver(self._key, self:bind(self.OnValueChanged))
end

---@private
---@param type NPBehaveBlackboardType
---@param newValue any
function BlackboardCondition:OnValueChanged(type, newValue)
    self:Evaluate()
end

---override<br>
---@protected
---@return boolean
function BlackboardCondition:IsConditionMet()
    if self._op == NPBehave.Enum.Operator.AlwaysTrue then
        return true
    end

    if not self.RootNode.Blackboard:IsSet(self._key) then
        return self._op == NPBehave.Enum.Operator.IsNotSet
    end

    local o = self.RootNode.Blackboard:Get(self._key)

    if self._op == NPBehave.Enum.Operator.IsSet then
        return true
    elseif self._op == NPBehave.Enum.Operator.IsEqual then
        return o == self._value
    elseif self._op == NPBehave.Enum.Operator.IsNotEqual then
        return o ~= self._value
    elseif self._op == NPBehave.Enum.Operator.IsGreaterOrEqual then
        if type(o) == "number" then
            return o >= self._value
        else
            assert(false, "Type not comparable: " .. type(o))
            return false
        end
    elseif self._op == NPBehave.Enum.Operator.IsGreater then
        if type(o) == "number" then
            return o > self._value
        else
            assert(false, "Type not comparable: " .. type(o))
            return false
        end
    elseif self._op == NPBehave.Enum.Operator.IsSmallerOrEqual then
        if type(o) == "number" then
            return o <= self._value
        else
            assert(false, "Type not comparable: " .. type(o))
            return false
        end
    elseif self._op == NPBehave.Enum.Operator.IsSmaller then
        if type(o) == "number" then
            return o < self._value
        else
            assert(false, "Type not comparable: " .. type(o))
            return false
        end
    else
        return false
    end
end

---override<br>
---@return string
function BlackboardCondition:__tostring()
    return "(" .. self._op .. ") " .. self._key .. " ? " .. tostring(self._value)
end

return BlackboardCondition
