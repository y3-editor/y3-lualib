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

---@param n? y3.Number
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

---@param n? y3.Number
---@return 'number' | 'Fix32' | 'XDouble' | nil
function M.number_type(n)
    local tp = type(n)
    if tp == 'number' then
        return 'number'
    elseif tp == 'userdata' then
        if n['__name'] == 'LuaFix32' then
            return 'Fix32'
        end
        if n['__name'] == 'xDouble' then
            return 'XDouble'
        end
    end
    return nil
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
        elseif name == 'xDouble' then
            v = v:float()
        end
    end
    return v
end

---@param t? table
---@return py.Dict
function M.py_dict(t)
    local dict = GlobalAPI.lua_get_python_empty_dict()
    if t then
        for k, v in pairs(t) do
            dict[k] = v
        end
    end
    return dict
end

---将py.Dict转换为table
---@param dict py.Dict
---@return table
function M.dict_to_table(dict)
    local keys = {}
    for k in python.iter(dict) do
        keys[#keys+1] = k
    end
    table.sort(keys)
    local t = {}
    for _, k in ipairs(keys) do
        t[k] = dict[k]
    end
    return t
end

return M
