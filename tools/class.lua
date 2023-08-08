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
        M.runConstructor(self, name, ...)
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

-- 析构一个实例
---@param obj table
function M.delete(obj)
    if obj.__deleted__ then
        return
    end
    obj.__deleted__ = true
    local name = obj.__class__
    assert(name, 'can not delete undeclared class')

    M.runDesctructor(obj, name)
end

-- 获取类的名称
---@param obj table
---@return string?
function M.type(obj)
    return obj.__class__
end

-- 判断一个实例是否有效
---@param obj table
---@return boolean
function M.isValid(obj)
    return obj.__class__
       and not obj.__deleted__
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
            assert(k == 'self', ('`%s()` must be called by the class'):format(name))
            super.__call(self,...)
        end
    end
    return M._superCache[name]
end

---@private
M._extendsCalls = {}

---@generic Class: string
---@generic Extends: string
---@param name `Class`
---@param extendsName `Extends`
---@param init? fun(self: Class, super: Extends)
function M.extends(name, extendsName, init)
    local class = M._classes[name]
    assert(class, ('class %q not found'):format(name))
    local extends = M._classes[extendsName]
    assert(extends, ('class %q not found'):format(extendsName))
    assert(type(init) == 'nil' or type(init) == 'function', ('init must be nil or function'))
    for k, v in pairs(extends) do
        if not k:match '^__'
        and k ~= 'constructor'
        and k ~= 'destructor'
        and k ~= 'alloc' then
            assert(class[k] == nil, ('"%s.%s" is already defined'):format(name, k))
            class[k] = v
        end
    end
    if not M._extendsCalls[name] then
        M._extendsCalls[name] = {}
    end
    table.insert(M._extendsCalls[name], {
        init = init,
        name = extendsName,
    })
    -- 检查是否需要显性初始化
    if not init then
        if not extends.constructor then
            return
        end
        local info = debug.getinfo(extends.constructor, 'u')
        if info.nparams <= 1 then
            return
        end
        error(('must call super for extends "%s"'):format(extendsName))
    end
end

---@private
---@param obj table
---@param name string
---@param ... any
function M.runConstructor(obj, name, ...)
    local class = M._classes[name]
    local extendsCalls = M._extendsCalls[name]
    if extendsCalls then
        for _, call in ipairs(extendsCalls) do
            if call.init then
                call.init(obj, function (...)
                    M.runConstructor(obj, call.name, ...)
                end)
            else
                M.runConstructor(obj, call.name)
            end
        end
    end
    if class.constructor then
        class.constructor(obj, ...)
    end
end

---@private
---@param obj table
---@param name string
function M.runDesctructor(obj, name)
    local class = M._classes[name]
    local extendsCalls = M._extendsCalls[name]
    if extendsCalls then
        for _, call in ipairs(extendsCalls) do
            M.runDesctructor(obj, call.name)
        end
    end
    if class.destructor then
        class.destructor(obj)
    end
end

return M
