-- 当对象移除时会调用 `self:remove()` 方法
---@class GCObject
---@field remove? fun(self: self)
---@field package _GCObjectRemoved boolean
---@overload fun(): self
local GCObject = Class 'GCObject'

---@package
function GCObject:_GCObjectRemove()
    if self._GCObjectRemoved then
        return
    end
    self._GCObjectRemoved = true
    local onRemove = self.remove
    if not onRemove then
        return
    end
    xpcall(onRemove, log.error, self)
end

function GCObject:GCObjectMarkRemoved()
    self._GCObjectRemoved = true
end

---@return boolean
function GCObject:GCObjectIsRemoved()
    return self._GCObjectRemoved == true
end

---@class GC
---@field private objects GCObject[]
---@field private removed boolean
---@overload fun(): self
local GC = Class 'GC'

---@class GCHost
---@field private _gccontainer GC
local GCHost = Class 'GCHost'

function GCHost:constructor()
    self._gccontainer = New 'GC' ()
end

---@generic T: GCObject
---@param obj T
---@return T
function GCHost:addGC(obj)
    return self._gccontainer:add(obj)
end

function GCHost:removeGC()
    self._gccontainer:remove()
end

---@class GC: GCObject
Extends('GC', 'GCObject')

---@private
GC.max = 10

---@return self
function GC:constructor()
    self.objects = {}
    return self
end

function GC:remove()
    if self.removed then
        return
    end
    self.removed = true
    for _, obj in ipairs(self.objects) do
        obj:_GCObjectRemove()
    end
end

---@generic T: GCObject
---@param obj T
---@return T
function GC:add(obj)
    -- TODO 插件BUG
    ---@cast obj GCObject
    if self.removed then
        obj:_GCObjectRemove()
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
        if obj._GCObjectRemoved then
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
