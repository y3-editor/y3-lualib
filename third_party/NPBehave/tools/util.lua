local pairs = pairs
local tableInsert = table.insert
local tableSort = table.sort

---@class NPBehave.Tool.MethodDecorator
---@overload fun(): self
local MethodDecorator = Class 'NPBehave.Tool.MethodDecorator'

---@class NPBehave.Tool.BindCallback
---@overload fun(...):any

---函数绑定到对象
---@param func fun(...)
---@return NPBehave.Tool.BindCallback
function MethodDecorator:bind(func)
    if not self.funcBindCache then
        self.funcBindCache = {}
    end
    if not self.funcBindCache[func] then
        self.funcBindCache[func] = function(...) return func(self, ...) end
    end
    return self.funcBindCache[func]
end

---@class SortedDictionary -- 排序字典, 支持通过索引设置键值对, 但不支持通过索引获取键值对.
---@field dictionary table<any, any>
---@overload fun():SortedDictionary
SortedDictionary = Class("SortedDictionary")

-- 构造函数
function SortedDictionary:__init()
    self.dictionary = {}
    return self
end

-- 添加或更新键值对
---@param key any
---@param value any
function SortedDictionary:add(key, value)
    self.dictionary[key] = value
end

-- 移除键值对
---@param key any
function SortedDictionary:remove(key)
    self.dictionary[key] = nil
end

-- 获取值
---@param key any
---@return any
function SortedDictionary:get(key)
    return self.dictionary[key]
end

-- 检查是否包含键
---@param key any
---@return boolean
function SortedDictionary:containsKey(key)
    return self.dictionary[key] ~= nil
end

-- 获取排序后的键列表
function SortedDictionary:getSortedKeys()
    local keys = {}
    for key in pairs(self.dictionary) do
        tableInsert(keys, key)
    end
    tableSort(keys)
    return keys
end

-- 获取有序迭代器
---@return fun():any, any
function SortedDictionary:SortedPairs()
    local sortedKeys = self:getSortedKeys()
    local i = 0
    local n = #sortedKeys
    return function()
        i = i + 1
        if i <= n then
            local key = sortedKeys[i]
            return key, self.dictionary[key]
        end
    end
end

function SortedDictionary:__newindex(key, value)
    --@ 将键值对存储到字典中
    if rawget(self, "dictionary") then
        rawset(self.dictionary, key, value)
    elseif key == "dictionary" then
        rawset(self, key, value)
    end
end
