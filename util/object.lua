-- 物体编辑器
---@class Editor.Object
local M = Class 'Editor.Object'

---@type table<any, Editor.Object.Unit>
M.unit = y3.util.defaultTable(function ()
    return New 'Editor.Object.Unit' ()
end)

---@class Editor.Object.Unit
---@field on_create? fun(unit: Unit) # 单位创建后执行
---@field on_remove? fun(unit: Unit) # 单位移除后执行
local Unit = Class 'Editor.Object.Unit'

---@package
---@param method string
---@param key py.UnitKey
---@param ... any
function Unit.callMethod(method, key, ...)
    local ou = M.unit[key]
    local fun = ou[method]
    if not fun then
        return
    end
end

---@param otype string
---@param mname string
---@param key any
---@param ... any
function M.callMethod(otype, mname, key, ...)
    local obj  = M[otype][key]
    local func = obj[mname]
    if not func then
        return
    end
    xpcall(func, log.error, ...)
end

y3.game:event('单位-创建', function (trg, data)
    M.callMethod('unit', 'on_create', data.unit:get_key(), data.unit)
end)

y3.game:event('单位-移除', function (trg, data)
    M.callMethod('unit', 'on_remove', data.unit:get_key(), data.unit)
end)

return M
