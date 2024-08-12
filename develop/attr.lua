---@class Develop.Attr
---@overload fun(unit: Unit, attr: y3.Const.UnitAttr):Develop.Attr
local M = Class 'Develop.Attr'

---@class Develop.Attr.API
local API = {}

---@class Develop.Attr: GCHost
Extends('Develop.Attr', 'GCHost')

---@param unit Unit
---@param attr y3.Const.UnitAttr
function M:__init(unit, attr)
    self.unit = unit
    self.attr = attr
end

function M:__del()
    
end

---@alias Develop.Attr.Condition fun(unit: Unit, value: number): boolean

---@param str string
---@return Develop.Attr.Condition?
---@return string?
local function compileConditionString(str)
    local firstToken = str:match('^%s*([=<>~]+)')
    if not firstToken then
        str = '== ' .. str
    end
    local code = [[local unit, value = ...;return value ]] .. str:gsub('`([^`]+)`', [[unit:get_attr('%1')]])
    local f, err = load(code, '=<ignore>', 't', _ENV)
    if f then
        return f, str
    else
        ---@cast err -?
        err = err:gsub('.-%d:', '')
        return f, err
    end
end

---@alias Develop.Attr.Accept number | string | Develop.Attr.Condition

---@alias Develop.Attr.Watch.Callback fun(attr: Develop.Attr, watch: Develop.Attr.Watch, oldValue: number)

---@class Develop.Attr.Watch
---@field trigger Trigger
---@field condition? Develop.Attr.Condition
---@field callback fun(attr: Develop.Attr, watch: Develop.Attr.Watch)
---@field attr Develop.Attr
---@field conditionStr? string
---@overload fun(attr: Develop.Attr, value: Develop.Attr.Accept, callback: Develop.Attr.Watch.Callback): Develop.Attr.Watch
local Watch = Class 'Develop.Attr.Watch'

---@param attr Develop.Attr
---@param value Develop.Attr.Accept
---@param callback Develop.Attr.Watch.Callback
function Watch:__init(attr, value, callback)
    self.attr = attr
    self.condition, self.conditionStr = API.compileCondition(value)
    self.callback = callback
    self.isSatisfied = self.condition(attr.unit, attr.unit:get_attr(attr.attr))

    local unit = attr.unit
    self.trigger = unit:event('单位-属性变化', y3.const.UnitAttr[attr.attr], function (trg, data)
        local suc, result = xpcall(self.condition, log.error, unit, unit:get_attr(attr.attr))
        if not suc then
            trg:remove()
            return
        end
        local ok = not self.isSatisfied and result
        self.isSatisfied = result
        if ok then
            callback(attr, self, data.old_float_attr_value)
        end
    end)
end

function Watch:__del()
    self.trigger:remove()
end

function Watch:remove()
    Delete(self)
end

---监控属性变化，当属性从“不满足条件”变化为“满足条件”时触发回调
---@param value Develop.Attr.Accept # 表达式，如 `>= 100`，``` == `最大生命` ```
---@param callback Develop.Attr.Watch.Callback # 回调函数
---@return Develop.Attr.Watch
function M:watch(value, callback)
    local watch = New 'Develop.Attr.Watch' (self, value, callback)
    self:bindGC(watch)
    return watch
end

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@return Develop.Attr
function API.create(unit, attr)
    return New 'Develop.Attr' (unit, attr)
end

---@param value Develop.Attr.Accept
---@return Develop.Attr.Condition?
---@return string?
function API.compileCondition(value)
    if type(value) == 'function' then
        return value, nil
    end
    if type(value) == 'number' then
        return function (unit, v)
            return v == value
        end, ('== %.2f'):format(value)
    end
    if type(value) == 'string' then
        local f, msg = compileConditionString(value)
        return f, msg
    end
    error('不支持的条件类型' .. type(value))
end

return API
