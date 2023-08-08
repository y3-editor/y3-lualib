---@class GCHost
---@field private _gccontainer GC
local GCHost = Class 'GCHost'

function GCHost:constructor()
    self._gccontainer = New 'GC' ()
end

function GCHost:destructor()
    self._gccontainer:remove()
end

-- 将一个对象的生命周期与自己绑定，
-- 当自己被移除时，也会移除该对象。
---@generic T: table
---@param obj T
---@return T
function GCHost:addGC(obj)
    return self._gccontainer:add(obj)
end

---@class GC
---@field private objects table[]
---@field private removed boolean
---@overload fun(): self
local GC = Class 'GC'

---@private
GC.max = 10

---@return self
function GC:constructor()
    self.objects = {}
    return self
end

function GC:destructor()
    for _, obj in ipairs(self.objects) do
        Delete(obj)
    end
end

function GC:remove()
    Delete(self)
end

---@generic T: table
---@param obj T
---@return T
function GC:add(obj)
    -- TODO 插件BUG
    ---@cast obj table
    if not IsValid(obj) then
        Delete(obj)
        return nil
    end
    self.objects[#self.objects+1] = obj
    if #self.objects > self.max then
        self:zip()
    end
    return obj
end

function GC:zip()
    local objects = self.objects
    local index = 1
    for _ = 1, #objects do
        local obj = objects[index]
        if not obj then
            break
        end
        if not IsValid(obj) then
            if index == #objects then
                objects[#objects] = nil
                break
            end
            objects[index] = objects[#objects]
        else
            index = index + 1
        end
    end
    self.max = math.max(#objects * 1.5, 10)
end

return GC
