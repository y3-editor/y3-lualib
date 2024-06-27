local tableInsert = table.insert
local tableRemove = table.remove
local pairs = pairs
local ipairs = ipairs
---@class NPBehave.Blackboard
---@field private _parentBlackboard? NPBehave.Blackboard
---@overload fun(clock: NPBehave.Clock, parent?: NPBehave.Blackboard): NPBehave.Blackboard
local Blackboard = Class("NPBehave.Blackboard")

---@class NPBehave.Blackboard: NPBehave.Tool.MethodDecorator
Extends('NPBehave.Blackboard', "NPBehave.Tool.MethodDecorator")

---@enum NPBehaveBlackboardType
local NPBehaveBlackboardType = {
    Add = "Add",
    Remove = "Remove",
    Change = "Change",
}

---@private
---@class NPBehave.Blackboard.Notification
---@field public key string
---@field public type NPBehaveBlackboardType
---@field public value any

---创建一个通知结构体
---@param key string 键
---@param type NPBehaveBlackboardType 类型
---@param value any 值
---@return NPBehave.Blackboard.Notification
local function Notification(key, type, value)
    ---@type NPBehave.Blackboard.Notification
    return {
        key = key,
        type = type,
        value = value
    }
end

---@param clock NPBehave.Clock
---@param parent? NPBehave.Blackboard
---@return self
function Blackboard:__init(clock, parent)
    self._clock = clock
    ---@type {[string]: any}
    self._data = {}
    ---@type {[string]: fun(type: NPBehaveBlackboardType, value: any)[]}
    self._observers = {} -- 观察者, 实际执行的函数
    self._isNotifying = false
    ---@type {[string]: fun(type: NPBehaveBlackboardType, value: any)[]}
    self._addObservers = {}
    ---@type {[string]: fun(type: NPBehaveBlackboardType, value: any)[]}
    self._removeObservers = {}
    ---@type NPBehave.Blackboard.Notification[] 通知
    self._notifications = {}
    ---@type NPBehave.Blackboard.Notification[] 调度通知
    self._notificationsDispatch = {}
    self._parentBlackboard = parent or nil
    ---@type {[NPBehave.Blackboard]: boolean} 模拟`hashset`
    self._children = {}
    return self
end

---启用黑板
function Blackboard:Enable()
    if self._parentBlackboard then
        self._parentBlackboard._children[self] = true
    end
end

---禁用黑板
function Blackboard:Disable()
    if self._parentBlackboard then
        self._parentBlackboard._children[self] = nil
    end
    if self._clock then
        self._clock:RemoveTimer(self:bind(self.NotifyObservers))
    end
end

---设置键值
---@param key string
---@param value any
function Blackboard:Set(key, value)
    if self._parentBlackboard and self._parentBlackboard:IsSet(key) then
        self._parentBlackboard:Set(key, value)
    else
        if not self._data[key] then
            self._data[key] = value
            tableInsert(self._notifications, Notification(key, NPBehaveBlackboardType.Add, value))
            self._clock:AddTimer(0, 0, self:bind(self.NotifyObservers))
        else
            if (self._data[key] == nil and value ~= nil) or (self._data[key] ~= nil and self._data[key] ~= value) then
                self._data[key] = value
                tableInsert(self._notifications, Notification(key, NPBehaveBlackboardType.Change, value))
                self._clock:AddTimer(0, 0, self:bind(self.NotifyObservers))
            end
        end
    end
end

---检查键是否已设置
---@param key string
---@return boolean
function Blackboard:IsSet(key)
    return self._data[key] ~= nil or (self._parentBlackboard and self._parentBlackboard:IsSet(key)) or false
end

---取消设置键值
---@param key string
function Blackboard:Unset(key)
    if self._data[key] then
        self._data[key] = nil
        tableInsert(self._notifications, Notification(key, NPBehaveBlackboardType.Remove, nil))
        self._clock:AddTimer(0, 0, self:bind(self.NotifyObservers))
    end
end

---获取键值
---@param key string
---@return any?
function Blackboard:Get(key)
    if self._data[key] then
        return self._data[key]
    elseif self._parentBlackboard then
        return self._parentBlackboard:Get(key)
    else
        return nil
    end
end

---@param list table
---@param value any
---@return boolean
local function ListContains(list, value)
    for _, v in ipairs(list) do
        if v == value then
            return true
        end
    end
    return false
end

---添加观察者
---@param key string
---@param observer fun(type: NPBehaveBlackboardType, value: any)
function Blackboard:AddObserver(key, observer)
    local observers = self:GetObserverList(self._observers, key)
    if not self._isNotifying then
        if not ListContains(observers, observer) then
            tableInsert(observers, observer)
        end
    else
        if not ListContains(observers, observer) then
            local addObservers = self:GetObserverList(self._addObservers, key)
            if not ListContains(addObservers, observer) then
                tableInsert(addObservers, observer)
            end
        end

        local removeObservers = self:GetObserverList(self._removeObservers, key)
        for i, v in ipairs(removeObservers) do
            if v == observer then
                tableRemove(removeObservers, i)
                break
            end
        end
    end
end

---移除观察者
---@param key string
---@param observer fun(type: NPBehaveBlackboardType, value: any)
function Blackboard:RemoveObserver(key, observer)
    local observers = self:GetObserverList(self._observers, key)
    if not self._isNotifying then
        for i, v in ipairs(observers) do
            if v == observer then
                tableRemove(observers, i)
                break
            end
        end
    else
        local removeObservers = self:GetObserverList(self._removeObservers, key)
        if not ListContains(removeObservers, observer) then
            if ListContains(observers, observer) then
                tableInsert(removeObservers, observer)
            end
        end

        local addObservers = self:GetObserverList(self._addObservers, key)
        for i, v in ipairs(addObservers) do
            if v == observer then
                tableRemove(addObservers, i)
                break
            end
        end
    end
end

---通知观察者
function Blackboard:NotifyObservers()
    if #self._notifications == 0 then
        return
    end

    self._notificationsDispatch = {}
    for _, notification in ipairs(self._notifications) do
        tableInsert(self._notificationsDispatch, notification)
    end
    for child in pairs(self._children) do
        for _, notification in ipairs(self._notifications) do
            tableInsert(child._notifications, notification)
        end
        child._clock:AddTimer(0, 0, child:bind(self.NotifyObservers))
    end
    self._notifications = {}

    self._isNotifying = true
    for _, notification in ipairs(self._notificationsDispatch) do
        if not self._observers[notification.key] then
            -- print("1 do not notify for key:" .. notification.key .. " value: " .. notification.value)
            goto continue
        end

        local observers = self:GetObserverList(self._observers, notification.key)
        for _, observer in ipairs(observers) do
            --TODO 实现或许要换成`list`类
            if self._removeObservers[notification.key] and ListContains(self._removeObservers[notification.key], observer) then
                goto continue
            end
            observer(notification.type, notification.value)
        end
        ::continue::
    end

    for key in pairs(self._addObservers) do
        local observers = self:GetObserverList(self._observers, key)
        for _, observer in ipairs(self._addObservers[key]) do
            tableInsert(observers, observer)
        end
    end
    for key in pairs(self._removeObservers) do
        local observers = self:GetObserverList(self._observers, key)
        for _, action in pairs(self._removeObservers[key]) do
            for i, observer in ipairs(observers) do
                if observer == action then
                    tableRemove(observers, i)
                    break
                end
            end
        end
    end
    self._addObservers = {}
    self._removeObservers = {}

    self._isNotifying = false
end

---获取观察者列表
---@param target {[string]: fun(type: NPBehaveBlackboardType, value: any)[]}
---@param key string
---@return fun(type: NPBehaveBlackboardType, value: any)[]
function Blackboard:GetObserverList(target, key)
    local observers = target[key]
    if not observers then
        observers = {}
        target[key] = observers
    end
    return observers
end

return Blackboard
