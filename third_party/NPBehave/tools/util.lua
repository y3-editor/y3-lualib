---@class FuncUtil
---@overload fun(): self
local FuncUtil = Class 'FuncUtil'


---函数绑定到对象
---@param func fun(...)
---@return function
function FuncUtil:bind(func)
    if not self.funcBindCache then
        self.funcBindCache = {}
    end
    if not self.funcBindCache[func] then
        self.funcBindCache[func] = function(...) return func(self, ...) end
    end
    return self.funcBindCache[func]
end

---@return table
function OrderedTable()
    local mt = {}
    local first = {}
    local last = first
    local count = 0
    local nextKey, prevKey = {}, {}
    local orig = {}

    function mt.__len(self) return count end

    function mt:__index(key) return orig[key] end

    function mt:__newindex(key, value)
        if value == nil then
            if orig[key] ~= nil then -- delete key
                local pk = prevKey[key]
                local nk = nextKey[key]
                if nk == nil then -- key == last
                    last = pk
                else
                    prevKey[nk] = pk
                end
                nextKey[pk] = nk

                count = count - 1
                nextKey[key] = nil
                prevKey[key] = nil
            end
        elseif orig[key] == nil then -- is new key
            nextKey[last] = key
            prevKey[key] = last
            last = key
            count = count + 1
        end
        orig[key] = value
    end

    function mt.__pairs(self)
        local key = first
        return function()
            key = nextKey[key]
            return key, orig[key]
        end
    end

    return setmetatable({}, mt)
end

return {
    FuncUtil = FuncUtil,
    OrderedTable = OrderedTable
}
