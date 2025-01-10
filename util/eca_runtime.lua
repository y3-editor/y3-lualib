---这个库仅用于ECA转Lua时用于支持ECA的写法，
---如果一开始就是用Lua开发的可以使用更好的写法。
---@class ECARuntime
local M = {}

local evaluate_cache = {}
function M.evaluate(code, ...)
    local f = evaluate_cache[code]
    if f == nil then
        local func, err = load(code, code, 't', setmetatable({
            args = { ... }
        }, { __index = _G }))
        if not func then
            log.error('evaluate 代码解析失败：', err, code)
        end
        f = func or false
        evaluate_cache[code] = f
    end
    if not f then
        return nil
    end
    return f(...)
end

local array_meta_map = setmetatable({}, { __index = function (t, default)
    local mt
    if type(default) == 'string' and #default > 0 then
        local make_default = assert(load('return ' .. default))
        local tv = make_default()
        local tp = type(tv)
        if tp == 'nil' or tp == 'number' or tp == 'boolean' or tp == 'string' then
            mt = { __index = function (array, k)
                array[k] = tv
                return tv
            end }
        else
            mt = { __index = function (array, k)
                local v = make_default()
                array[k] = v
                return v
            end }
        end
    else
        mt = { __index = function (array, k)
            array[k] = default
            return default
        end }
    end
    t[default] = mt
    return mt
end })

function M.array(default)
    if default == nil then
        return {}
    end
    return setmetatable({}, array_meta_map[default])
end

---@param variables table<string, any>
---@return ECARuntime.VariableSpace
function M.variable(variables)
    return New 'ECARuntime.VariableSpace' (variables)
end

---@class ECARuntime.VariableSpace
local V = Class 'ECARuntime.VariableSpace'

---@param variables table<string, any>
function V:__init(variables)
    self.variables = variables
end

local VAR_SYMBOLE = { 'VAR' }

local new_mt = { __index = function (t, k)
    local v = t[VAR_SYMBOLE][k]
    if type(v) == 'table' then
        -- array
        local mt = getmetatable(v)
        if mt then
            v = setmetatable({}, mt)
        else
            v = {}
        end
    end
    t[k] = v
    return v
end }

---@return table<string, any>
function V:new()
    return setmetatable({ [VAR_SYMBOLE] = self.variables }, new_mt)
end

---@param params { _master: Storage }
---@return table<string, any>
function V:group(params)
    local master = params._master
    return master:storage_get('group_variables')
        or master:storage_set('group_variables', self:new())
end

return M
