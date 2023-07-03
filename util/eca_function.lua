---@class ECABind
Bind = {}

---@class ECAFunction
---@field call_name string
---@field params {key: string, type: string}[]
---@field returns {key: string, type: string}[]
---@field func function
---@overload fun(name: string): self
local M = Class 'ECAFunction'

function M:__tostring()
    return string.format('{ECAFunction|%s}'
        , self.call_name
    )
end

---@private
---@param ... any
---@return ...
function M:_unpack_params(...)
    local param_list = {...}
    for i, param in ipairs(self.params) do
        local py_value = param_list[i]
        local ok, lua_value = xpcall(y3.py_converter.py_to_lua, log.error, param.type, py_value)
        if not ok then
            return
        end
        param_list[i] = lua_value
    end
    return table.unpack(param_list, 1, #self.params)
end

---@private
---@param ok boolean
---@param ... any
---@return ...
function M:_pack_returns(ok, ...)
    if not ok then
        return nil
    end
    if #self.returns == 0 then
        return nil
    end
    local ok2, ret_value = xpcall(y3.py_converter.lua_to_py, log.error, self.returns[1].type, ...)
    if not ok2 then
        return nil
    end
    return ret_value
end

---@param name string
---@return self
function M:constructor(name)
    self.call_name  = name
    self.params     = {}
    self.returns    = {}
    return self
end

--添加参数
---@param key string
---@param type_name string
---@return self
function M:with_param(key, type_name)
    table.insert(self.params, {
        key  = key,
        type = y3.py_converter.get_py_type(type_name),
    })
    return self
end

--添加返回值
---@param key string
---@param type_name string
---@return self
function M:with_return(key, type_name)
    table.insert(self.returns, {
        key  = key,
        type = y3.py_converter.get_py_type(type_name),
    })
    return self
end

--执行的函数
---@param func function
function M:call(func)
    self.func = func
    Bind[self.call_name] = function (...)
        return self:_pack_returns(xpcall(self.func, log.error, self:_unpack_params(...)))
    end
end

return M
