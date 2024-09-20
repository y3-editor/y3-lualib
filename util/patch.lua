local OFix32 = Fix32

local cache = setmetatable({}, {
    __mode = 'v',
    __index = function (self, n)
        local v
        if math.type(n) == 'integer' then
            v = OFix32(0.0 + n)
        else
            v = OFix32(n)
        end
        self[n] = v
        return v
    end
})

---@param luaNumber number | string
---@return py.Fixed Fixed
function Fix32(luaNumber)
    return cache[luaNumber]
end
