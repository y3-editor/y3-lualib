---@class Helper
local M = Class 'Helper'

---@param py_list py.List
---@param wrapper? fun(py_object: any): any
---@return any[]
function M.unpack_list(py_list, wrapper)
    local t = {}
    for i = 0, python_len(py_list) - 1 do
        local py_obj = python_index(py_list, i)
        local lua_obj = wrapper and wrapper(py_obj) or py_obj
        t[#t+1] = lua_obj
    end
    return t
end

---@param lua_list any[]
---@param unwrapper? fun(lua_object: any): any
---@return py.DynamicTypeMeta[]
function M.pack_list(lua_list, unwrapper)
    local py_list = {}
    for i = 1, #lua_list do
        local lua_obj = lua_list[i]
        local py_obj = unwrapper and unwrapper(lua_obj) or lua_obj
        py_list[#py_list+1] = py_obj
    end
    return py_list
end

---@param n number | py.Fixed | nil
---@return number?
function M.tonumber(n)
    if not n then
        return nil
    end
    if type(n) == 'number' then
        return n
    else
        return n:float()
    end
end

---@param v any
---@param recursive? boolean
---@return any
function M.as_lua(v, recursive)
    local tp = type(v)
    if tp == 'table' then
        if recursive then
            for k, vv in pairs(v) do
                v[k] = M.as_lua(vv, true)
            end
        end
    elseif tp == 'userdata' then
        local mt = getmetatable(v)
        local name = mt and mt.__name
        if name == 'LuaFix32' then
            v = v:float()
        end
    end
    return v
end

return M
