---这个库仅用于ECA转Lua时用于支持ECA的写法，
---如果一开始就是用Lua开发的可以使用更好的写法。
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

local array_meta = { __index = function (t, k)
    if k == nil then
        return nil
    end
    local v = t._default
    t[k] = v
    return v
end }

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

return M
