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
        if not self.constructor then
            return self
        end
        return self:constructor(...)
    end

    M._classes[name] = class

    local mt = setmetatable(class, {
        __call = function (self, ...)
            if not self.alloc then
                return self
            end
            return self:alloc(...)
        end,
    })

    local superClass = M._classes[super]
    if superClass then
        assert(class ~= superClass, ('class %q can not inherit itself'):format(name))
        mt.__index = superClass

        class.__superCall = superClass.__call
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

    local instance = setmetatable({}, class)

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

---@param obj table
---@return function superConstructor
function M.super(obj)
    return function (...)
        return obj:__superCall(...)
    end
end

return M
