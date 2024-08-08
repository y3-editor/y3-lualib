---@class Develop.Attr
---@overload fun(unit: Unit, attr: y3.Const.UnitAttr):Develop.Attr
local M = Class 'Develop.Attr'

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

---@private
---@param value number | string | Develop.Attr.Condition
---@return Develop.Attr.Condition
function M:compileCondition(value)
    if type(value) == 'function' then
        return value
    end
    if type(value) == 'number' then
        return function (v)
            return v == value
        end
    end
    if type(value) == 'string' then
        local firstToken = value:match('^%s*([=<>~]+)')
        if not firstToken then
            value = '== ' .. value
        end
        local code = [[local _u, _v = ...;return _v ]] .. value:gsub('`([^`]+)`', [[_u:get_attr('%1')]])
        local f, err = load(code, code, 't', _ENV)
        if not f then
            error('属性表达式错误：' .. err)
        end
        return f
    end
    error('不支持的条件类型' .. type(value))
end

---监控属性变化，当属性从“不满足条件”变化为“满足条件”时触发回调
---@param value number | string | Develop.Attr.Condition # 表达式，如 `>= 100`，``` == `最大生命` ```
---@param callback fun(attr: Develop.Attr) # 回调函数
---@return Trigger
function M:watch(value, callback)
    local condition = self:compileCondition(value)
    local isSatisfied = condition(self.unit, self.unit:get_attr(self.attr))
    local trg = self.unit:event('单位-属性变化', y3.const.UnitAttr[self.attr], function (trg, data)
        local suc, result = xpcall(condition, log.error, self.unit, self.unit:get_attr(self.attr))
        if not suc then
            trg:remove()
            return
        end
        local ok = not isSatisfied and result
        isSatisfied = result
        if ok then
            callback(self)
        end
    end)
    self:bindGC(trg)
    return trg
end

---@class Develop.Attr.API
local API = {}

---@param unit Unit
---@param attr y3.Const.UnitAttr
---@return Develop.Attr
function API.create(unit, attr)
    return New 'Develop.Attr' (unit, attr)
end

return API
