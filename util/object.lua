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

M.lock_count_map = setmetatable({}, {
    __mode = 'k',
    __index = function (t, k)
        t[k] = 0
        return 0
    end,
})
M.call_stack_map = setmetatable({}, {
    __mode = 'k',
    __index = function (t, k)
        t[k] = {}
        return t[k]
    end,
})

---@param otype string
---@param mname string
---@param key any
---@param lock_obj any
---@param arg1 any
---@param arg2 any
function M.callMethod(otype, mname, key, lock_obj, arg1, arg2)
    local def  = M[otype][key]
    local func = def[mname]
    if not func then
        return
    end
    if not lock_obj then
        xpcall(func, log.error, arg1, arg2)
        return
    end
    local stack = M.call_stack_map[lock_obj]
    if M.lock_count_map[key] > 0 then
        stack[#stack+1] = function ()
            M.callMethod(otype, mname, key, lock_obj, arg1, arg2)
        end
        return
    end
    M.lock_count_map[key] = M.lock_count_map[key] + 1
    xpcall(func, log.error, arg1, arg2)
    M.lock_count_map[key] = M.lock_count_map[key] - 1
    if #stack > 0 and M.lock_count_map[key] == 0 then
        table.remove(stack, 1)()
    end
end

y3.game:event('单位-创建', function (trg, data)
    M.callMethod('unit', 'on_create', data.unit:get_key(), data.unit, data.unit)
end)

y3.game:event('单位-移除', function (trg, data)
    M.callMethod('unit', 'on_remove', data.unit:get_key(), data.unit, data.unit)
end)

return M
