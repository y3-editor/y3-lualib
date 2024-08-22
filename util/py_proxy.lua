---@class PyProxy
local M = Class 'PyProxy'

local RAW  = {'<RAW>'}
local DEAD = {'<DEAD>'}
local ISEXISTS = {'<ISEXISTS>'}

local dummy = function () end
local return_true = function () return true end

local proxyMT = { __index = function (self, key)
    local raw = self[RAW]
    local f = raw[key]
    local tp = type(f)
    if tp == 'function' then
        local function middleman(_, ...)
            if self[DEAD] and not self[ISEXISTS](raw) then
                return nil
            end
            return f(raw, ...)
        end
        self[key] = middleman
        return middleman
    end
    if tp == 'userdata' then
        local mt = getmetatable(f)
        if not mt then
            return f
        end
        local call = mt.__call
        if not call then
            return f
        end
        local function middleman(_, ...)
            if self[DEAD] and not self[ISEXISTS](raw) then
                return nil
            end
            return call(f, raw, ...)
        end
        self[key] = middleman
        return middleman
    end
    if tp == 'nil' then
        if self[DEAD] and not self[ISEXISTS](raw) then
            return dummy
        end
    end
    return f
end }

local cachedMap = setmetatable({}, { __mode = 'k' })

---@generic T
---@param handle T
---@param is_exists? fun(handle: T): boolean
---@return T
function M.wrap(handle, is_exists)
    local p = cachedMap[handle]
    if not p then
        if type(handle) ~= 'userdata' then
            return handle
        end
        ---@cast handle any
        p = setmetatable({
            [RAW]      = handle,
            [DEAD]     = is_exists and not is_exists(handle) or false,
            [ISEXISTS] = is_exists or return_true,
        }, proxyMT)
        cachedMap[handle] = p
    end
    return p
end

---@generic T
---@param handle T
---@return T
function M.unwrap(handle)
    if type(handle) == 'table' then
        return handle[RAW] or handle
    end
    return handle
end

function M.kill(phandle)
    if phandle[DEAD] == false then
        phandle[DEAD] = true
    end
end

---@generic T
---@param handle T
---@return T?
function M.fetch(handle)
    return cachedMap[handle]
end

return M
