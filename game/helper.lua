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
        py_list.append(py_obj)
    end
    return py_list
end

return M
