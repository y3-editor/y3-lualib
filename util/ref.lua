--[[
维护引擎对象的生命状态
目前策略如下：

1. 引擎对象第一次进Lua时，生成对应的Lua对象并添加强引用
2. 引擎对象被引擎回收后，将Lua对象加入待回收队列
3. 待回收队列至少5秒后，将Lua对象从强引用改为弱引用
--]]

---@class Ref
---@overload fun(className: string, new: (fun(key: Ref.ValidKeyType, ...): any)): self
local M = Class 'Ref'

---@alias Ref.ValidKeyType any

-- 至少在这个时间之后才会释放引用
---@private
M.unrefTimeAtLeast = 5
-- 是否允许弱引用
---@private
M.allowWeakRef = false

---@type table<string, Ref[]>
M.all_managers = {}

---@generic T: string
---@param className `T`
---@param new fun(key: Ref.ValidKeyType, ...): T
function M:__init(className, new)
    -- 用于管理的对象类名
    ---@private
    self.className = className
    -- 创建新对象的方法
    ---@private
    self.newMethod = new
    -- 强引用
    ---@private
    self.strongRefMap = {}
    ---@private
    self.strongSize = 0
    -- 弱引用
    ---@private
    self.weakRefMap = setmetatable({}, y3.util.MODE_V)
    -- 待删除列表（青年代）
    ---@private
    self.waitingListYoung = {}
    -- 待删除列表（老年代）
    ---@private
    self.waitingListOld = {}

    if not M.all_managers[className] then
        M.all_managers[className] = setmetatable({}, y3.util.MODE_V)
    end
    table.insert(M.all_managers[className], self)
    self:checkDeleted()
end

---获取指定key的对象，如果不存在，则使用所有的参数创建并返回
---@param key Ref.ValidKeyType
---@param ... any
---@return any
function M:get(key, ...)
    if not key then
        return nil
    end
    local obj = self:fetch(key)
    if obj then
        return obj
    end
    obj = self.newMethod(key, ...)
    self.strongRefMap[key] = obj
    self.weakRefMap[key] = nil
    self.strongSize = self.strongSize + 1
    return obj
end

---获取指定key
---@param key Ref.ValidKeyType
---@return any
function M:fetch(key)
    local strongRefMap = self.strongRefMap
    if strongRefMap[key] then
        return strongRefMap[key]
    end
    if self.allowWeakRef then
        local weakRefMap = self.weakRefMap
        if weakRefMap[key] then
            return weakRefMap[key]
        end
    end
    return nil
end

---移除指定的key
---@param key Ref.ValidKeyType
function M:remove(key)
    self.waitingListYoung[key] = true
    self.waitingListOld[key] = nil

    -- 只有在第一次移除引用时才会开始计时，这样可以错峰（大概？）
    if not self.updateTimer then
        ---@private
        self.updateTimer = y3.ltimer.loop(self.unrefTimeAtLeast, function ()
            self:updateWaitingList()
            if not next(self.waitingListOld) then
                self.updateTimer:remove()
                self.updateTimer = nil
            end
        end)
    end
end

---@private
function M:updateWaitingList()
    local young     = self.waitingListYoung
    local old       = self.waitingListOld
    local strongRef = self.strongRefMap
    local weakRef   = self.weakRefMap

    -- 遍历老年代，将老年代的对象改为弱引用
    for key in pairs(old) do
        local obj = strongRef[key]
        if obj then
            strongRef[key] = nil
            weakRef[key] = obj
            self.strongSize = self.strongSize - 1
        end
        old[key] = nil
    end

    -- 将青年代升级为老年代
    self.waitingListOld   = young
    self.waitingListYoung = old -- 这里复用了一下已被清空的上次老年代
end

local index = 0

---@private
function M:checkDeleted()
    index = index + 1
    local lastSize = self.strongSize
    local lastID = nil
    local strongRefMap = self.strongRefMap
    y3.ltimer.wait(index * 0.2, function ()
        y3.ltimer.loop(5, function ()
            local delta = self.strongSize - lastSize
            lastSize = self.strongSize
            if not strongRefMap[lastID] then
                lastID = nil
            end
            for _ = 1, delta * 2 + 10 do
                local id, obj = next(strongRefMap, lastID)
                lastID = id
                if not id then
                    break
                end
                if obj.is_destroyed and obj:is_destroyed() then
                    obj:remove()
                end
            end
        end)
    end)
end

return M
