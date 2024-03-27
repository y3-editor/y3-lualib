---@class Pool
---@field private pool table<any, integer>
---@overload fun(): self
local M = Class 'Pool'

function M:__init()
    ---@private
    self.pool = {}
    ---@private
    self.order = {}
    return self
end

-- 添加对象
---@param obj any
---@param w? integer
function M:add(obj, w)
    if self.pool[obj] then
        self.pool[obj] = self.pool[obj] + (w or 1)
    else
        self.pool[obj] = w or 1
        self.order[#self.order+1] = obj
    end
end

-- 移除对象，请勿在遍历的过程中移除对象
---@param obj any
function M:del(obj)
    self.pool[obj] = nil
    for i, v in ipairs(self.order) do
        if v == obj then
            self.order[i] = self.order[#self.order]
            self.order[#self.order] = nil
            break
        end
    end
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
    self.order = {}
end

-- 随机抽取一个对象
---@param filter? fun(obj: any): boolean
---@return any
function M:random(filter)
    local valid = {}
    local total = 0

    for _, obj in ipairs(self.order) do
        if not filter or filter(obj) == true then
            valid[#valid+1] = obj
            total = total + self.pool[obj]
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

-- 显示池的内容，仅用于调试
---@return string
function M:dump()
    local buf = {}
    for i, obj in ipairs(self.order) do
        buf[i] = ('%s: %d'):format(tostring(obj), self.pool[obj])
    end
    return table.concat(buf, '\n')
end

-- 遍历池的对象
---@return fun(): any, integer
function M:pairs()
    local i = 0
    return function ()
        i = i + 1
        local obj = self.order[i]
        return obj, self.pool[obj]
    end
end
