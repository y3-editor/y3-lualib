---@class Helper
local M = Class 'Helper'

---@param py_list py.List
---@param wrapper? fun(py_object: any): any
---@return any[]
function M.unpack_list(py_list, wrapper)
    --打个tuple的补丁 todo: 去掉
    local t = {}
    if not py_list then
        return t
    end
    local name = getmetatable(py_list).__name
    if name == "LuaList" then
        for _, py_obj in pairs(py_list) do
            local lua_obj = wrapper and wrapper(py_obj) or py_obj
            t[#t+1] = lua_obj
        end
    else
        for i = 0, python_len(py_list) - 1 do
            local py_obj = python_index(py_list, i)
            local lua_obj = wrapper and wrapper(py_obj) or py_obj
            t[#t+1] = lua_obj
        end
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

---@param n? y3.Number | any
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
---@param mark? table
---@return any
local function as_lua(v, recursive, mark)
    local tp = type(v)
    if tp == 'table' then
        if recursive then
            mark = mark or {}
            if mark[v] ~= nil then
                return v
            end
            mark[v] = true
            for k, vv in pairs(v) do
                v[k] = as_lua(vv, true, mark)
            end
        end
    elseif tp == 'userdata' then
        local mt = getmetatable(v)
        local name = mt and mt.__name
        if name == 'LuaFix32' then
            v = v:float()
        elseif name == 'xDouble' then
            v = v:float()
        elseif name == 'POBJECT' then
            local suc, res = pcall(M.py_to_table, v)
            if suc then
                v = as_lua(res, recursive, mark)
            end
        end
    end
    return v
end

---@param v any
---@param recursive? boolean
---@return any
function M.as_lua(v, recursive)
    return as_lua(v, recursive)
end

local function as_py(v, mark)
    local tp = type(v)
    if tp == 'table' then
        mark = mark or {}
        if mark[v] ~= nil then
            if mark[v] == false then
                error('元组不支持循环引用！')
            end
            return mark[v]
        end
        mark[v] = false
        if #v > 0 then
            v = y3.util.map(v, function (nv)
                return as_py(nv, mark)
            end)
            v = M.py_tuple(v)
            mark[v] = v
        else
            mark[v] = M.py_dict()
            for k, vv in pairs(v) do
                mark[v][k] = as_py(vv, mark)
            end
            v = mark[v]
        end
    end
    return v
end

function M.as_py(v)
    return as_py(v)
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

---@param t? any[]
---@return py.Tuple
function M.py_tuple(t)
    if not pytuple then
        error('需要编辑器2月版本更新后才可使用此功能！')
    end
    local set
    if t then
        set = pydict()
        for _, v in ipairs(t) do
            set[v] = true
        end
    end
    return pytuple(set)
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

---@param tuple py.Tuple
---@return table
function M.tuple_to_table(tuple)
    local t = {}
    for i = 0, python_len(tuple) - 1 do
        t[i+1] = python_index(tuple, i)
    end
    return t
end

---@param py_object any
---@return table
function M.py_to_table(py_object)
    if python_len(py_object) > 0 then
        return M.tuple_to_table(py_object)
    else
        return M.dict_to_table(py_object)
    end
end

function M.table_to_py(t)
    if #t > 0 then
        return M.py_tuple(t)
    else
        return M.py_dict(t)
    end
end

return M
