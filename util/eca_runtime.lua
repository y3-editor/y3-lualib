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

function M.tointeger(v)
    return math.tointeger(v) or 0
end

function M.string(...)
    local n = select('#', ...)
    if n == 0 then
        return ''
    elseif n == 1 then
        return ... or ''
    elseif n == 2 then
        local a, b = ...
        return (a or '') .. (b or '')
    else
        local buf = {}
        for i = 1, n do
            buf[i] = select(i, ...) or ''
        end
        return table.concat(buf)
    end
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
    if v == nil then
        return nil
    end
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

---@param args? table<string, any>
---@return table<string, any>
function V:new(args)
    local variables = self.variables
    if not args then
        args = {}
    end
    args[VAR_SYMBOLE] = variables
    return setmetatable(args, new_mt)
end

---@param params { _master: Storage }
---@return table<string, any>
function V:with(params)
    local master = params._master
    return master:storage_get('group_variables')
        or master:storage_set('group_variables', self:new())
end

return M
