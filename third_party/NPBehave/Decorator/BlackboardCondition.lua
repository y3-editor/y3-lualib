---@class NPBehave.Decorator.BlackboardCondition
---@overload fun(key: string, op: NPBehaveOperator, value: any, stopsOnChange: NPBehaveStops, decoratee: NPBehave.Node): self
local BlackboardCondition = Class(NPBehaveClassName.BlackboardCondition)
local superName = NPBehaveClassName.ObservingDecorator

---@class NPBehave.Decorator.BlackboardCondition: NPBehave.Decorator.ObservingDecorator
Extends(NPBehaveClassName.BlackboardCondition, superName, function(self, super, ...)
    local key, op, value, stopsOnChange, decoratee = ...
    super("BlackboardCondition", stopsOnChange, decoratee)
end)
---@class NPBehave.Decorator.BlackboardCondition: FuncUtil
Extends(NPBehaveClassName.BlackboardCondition, "FuncUtil")

---@param key string
---@param op NPBehaveOperator
---@param value? any
---@param stopsOnChange NPBehaveStops
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
    self.RootNode.Blackboard:AddObserver(self._key, self:bind(self.OnValueChanged))
end

---override<br>
---@protected
function BlackboardCondition:StopObserving()
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
    if self._op == NPBehaveOperator.AlwaysTrue then
        return true
    end

    if not self.RootNode.Blackboard:IsSet(self._key) then
        return self._op == NPBehaveOperator.IsNotSet
    end

    local o = self.RootNode.Blackboard:Get(self._key)

    if self._op == NPBehaveOperator.IsSet then
        return true
    elseif self._op == NPBehaveOperator.IsEqual then
        return o == self._value
    elseif self._op == NPBehaveOperator.IsNotEqual then
        return o ~= self._value
    elseif self._op == NPBehaveOperator.IsGreaterOrEqual then
        if type(o) == "number" then
            return o >= self._value
        else
            assert(false, "Type not comparable: " .. type(o))
            return false
        end
    elseif self._op == NPBehaveOperator.IsGreater then
        if type(o) == "number" then
            return o > self._value
        else
            assert(false, "Type not comparable: " .. type(o))
            return false
        end
    elseif self._op == NPBehaveOperator.IsSmallerOrEqual then
        if type(o) == "number" then
            return o <= self._value
        else
            assert(false, "Type not comparable: " .. type(o))
            return false
        end
    elseif self._op == NPBehaveOperator.IsSmaller then
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