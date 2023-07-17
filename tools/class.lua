---@class Class
local M = {}

---@private
M._classes = {}

-- 定义一个类
---@generic T: string
---@param name  `T`
---@param super? string
---@return T
function M.declare(name, super)
    if M._classes[name] then
        return M._classes[name]
    end
    local class = {}
    class.__index = class
    class.__name  = name

    function class:__call(...)
        if not class.constructor then
            return self
        end
        class.constructor(self, ...)
        return self
    end

    M._classes[name] = class

    local mt = {
        __call = function (self, ...)
            if not self.alloc then
                return self
            end
            return self:alloc(...)
        end,
    }
    setmetatable(class, mt)

    local superClass = M._classes[super]
    if superClass then
        assert(class ~= superClass, ('class %q can not inherit itself'):format(name))
        mt.__index = superClass

        class.__super = superClass
    end

    return class
end

-- 获取一个类
---@generic T: string
---@param name `T`
---@return T
function M.get(name)
    return M._classes[name]
end

-- 实例化一个类
---@generic T: string
---@param name `T`
---@return T
function M.new(name)
    local class = M._classes[name]
    assert(class, ('class %q not found'):format(name))

    local instance = setmetatable({
        __class__ = name,
    }, class)

    return instance
end

-- 获取类的名称
---@param obj any
---@return string?
function M.type(obj)
    if type(obj) ~= 'table' then
        return nil
    end
    return obj.__name
end

---@private
M._superCache = {}

---@param name string
---@return fun(...)
function M.super(name)
    if not M._superCache[name] then
        local class = M._classes[name]
        assert(class, ('class %q not found'):format(name))
        local super = class.__super
        assert(super, ('class %q not inherit from any class'):format(name))
        M._superCache[name] = function (...)
            local k, self = debug.getlocal(2, 1)
            assert(k == 'self', ('%s() must be called by the class'):format(name))
            super.__call(self,...)
        end
    end
    return M._superCache[name]
end

return M
