local byte = string.byte
local max = 0x7fffffff

---@class SDBMHash
---@overload fun(): SDBMHash
local M = Class 'SDBMHash'

function M:__init()
    ---@private
    self.cache = {}
end

---@param str string
---@return integer
function M:rawHash(str)
    local id = 0
    for i = 1, #str do
        local b = byte(str, i, i)
        id = id * 65599 + b
    end
    return id & max
end

---@param str string
---@return integer
function M:hash(str)
    local id = self:rawHash(str)
    local other = self.cache[id]
    if other == nil or str == other then
        self.cache[id] = str
        self.cache[str] = id
        return id
    else
        log.warn(('哈希碰撞：[%s] -> [%s]: [%d]'):format(str, other, id))
        for i = 1, max do
            local newId = (id + i) % max
            if not self.cache[newId] then
                self.cache[newId] = str
                self.cache[str] = newId
                return newId
            end
        end
        error(('哈希碰撞解决失败：[%s] -> [%s]: [%d]'):format(str, other, id))
    end
end

function M:setCache(t)
    self.cache = t
end

function M:getCache()
    return self.cache
end

---@private
M.instance = New 'SDBMHash' ()

---@param str string
---@return integer
return function (str)
    return M.instance:hash(str)
end
