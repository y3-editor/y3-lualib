---@class Pool
---@field private pool table<any, integer>
---@overload fun(): self
local M = Class 'Pool'

function M:constructor()
    self.pool = {}
    return self
end

-- 添加对象
---@param obj any
---@param w? integer
function M:add(obj, w)
    self.pool[obj] = (self.pool[obj] or 0) + (w or 1)
end

-- 移除对象
---@para obj any
function M:del(obj)
    self.pool[obj] = nil
end

-- 是否包含对象
---@param obj any
---@return boolean
function M:has(obj)
    return self.pool[obj] ~= nil
end

-- 获取对象的权重
---@param obj any
---@return integer
function M:get_weight(obj)
    return self.pool[obj] or 0
end

-- 修改对象的权重
---@param obj any
---@param w integer
function M:set_weight(obj, w)
    assert(self.pool[obj])
    self.pool[obj] = w
end

-- 增加对象的权重
---@param obj any
---@param w integer
function M:add_weight(obj, w)
    assert(self.pool[obj])
    self.pool[obj] = self.pool[obj] + w
end

-- 清空池
function M:clear()
    self.pool = {}
end

-- 随机抽取一个对象
---@param filter? fun(obj: any): boolean
---@return any
function M:random(filter)
    local valid = {}
    local total = 0

    for obj, w in pairs(self.pool) do
        if not filter or filter(obj) == true then
            valid[#valid+1] = obj
            total = total + w
        end
    end

    if total == 0 then
        return nil
    end

    local r = math.random(total)
    local sum = 0
    for i = 1, #valid do
        local obj = valid[i]
        sum = sum + self.pool[obj]
        if sum >= r then
            return obj
        end
    end

    error('unreachable')
end

-- 抽取多个随机对象，不重复
---@param num integer
---@param filter? fun(obj: any): boolean
---@return any[]
function M:random_n(num, filter)
    local results = {}
    local mark = {}
    for i = 1, num do
        local obj = self:random(function (obj)
            if mark[obj] then
                return false
            end
            if filter and not filter(obj) then
                return false
            end
            return true
        end)
        if not obj then
            break
        end
        results[i] = obj
        mark[obj] = true
    end
    return results
end
