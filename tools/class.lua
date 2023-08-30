---@class Class
local M = {}

---@private
---@type table<string, Class.Base>
M._classes = {}

---@private
---@type table<string, Class.Data>
M._classData = {}

---@private
M._errorHandler = error

---@class Class.Base
---@field public  __init  fun(self: any, ...)
---@field public  __del   fun(self: any)
---@field public  __alloc fun(self: any)
---@field package __call  fun(self: any, ...)

---@class Class.Data
---@field name        string
---@field extendsMap  table<string, boolean>
---@field superCache  table<string, fun(...)>
---@field superClass? Class.Base
local Data = {}

---@private
---@param name string
---@return Class.Data
function M.getData(name)
    if not M._classData[name] then
        M._classData[name] = setmetatable({
            name       = name,
            extendsMap = {},
            superCache = {},
        }, { __index = Data })
    end
    return M._classData[name]
end

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
        M.runInit(self, name, ...)
        return self
    end

    M._classes[name] = class

    local mt = {
        __call = function (self, ...)
            if not self.__alloc then
                return self
            end
            return self:__alloc(...)
        end,
    }
    setmetatable(class, mt)

    local superClass = M._classes[super]
    if superClass then
        if class == superClass then
            M._errorHandler(('class %q can not inherit itself'):format(name))
        end
        mt.__index = superClass

        local data = M.getData(name)
        data.superClass = superClass
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
    if not class then
        M._errorHandler(('class %q not found'):format(name))
    end

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
    if not name then
        M._errorHandler('can not delete undeclared class')
    end

    M.runDel(obj, name)
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

---@param name string
---@return fun(...)
function M.super(name)
    local data = M.getData(name)
    return data:getSuperCall(name)
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
    if not class then
        M._errorHandler(('class %q not found'):format(name))
    end
    local extends = M._classes[extendsName]
    if not extends then
        M._errorHandler(('class %q not found'):format(extendsName))
    end
    if type(init) ~= 'nil' and type(init) ~= 'function' then
        M._errorHandler(('init must be nil or function'))
    end
    for k, v in pairs(extends) do
        if not k:match '^__' then
            if class[k] ~= nil then
                M._errorHandler(('"%s.%s" is already defined'):format(name, k))
            end
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
        if not extends.__init then
            return
        end
        local info = debug.getinfo(extends.__init, 'u')
        if info.nparams <= 1 then
            return
        end
        M._errorHandler(('must call super for extends "%s"'):format(extendsName))
    end
end

---@private
---@param obj table
---@param name string
---@param ... any
function M.runInit(obj, name, ...)
    local class = M._classes[name]
    local extendsCalls = M._extendsCalls[name]
    if extendsCalls then
        for _, call in ipairs(extendsCalls) do
            if call.init then
                call.init(obj, function (...)
                    M.runInit(obj, call.name, ...)
                end)
            else
                M.runInit(obj, call.name)
            end
        end
    end
    if class.__init then
        class.__init(obj, ...)
    end
end

---@private
---@param obj table
---@param name string
function M.runDel(obj, name)
    local class = M._classes[name]
    local extendsCalls = M._extendsCalls[name]
    if extendsCalls then
        for _, call in ipairs(extendsCalls) do
            M.runDel(obj, call.name)
        end
    end
    if class.__del then
        class.__del(obj)
    end
end

---@param errorHandler fun(msg: string)
function M.setErrorHandler(errorHandler)
    M._errorHandler = errorHandler
end

---@param name string
---@return fun(...)
function Data:getSuperCall(name)
    if not self.superCache[name] then
        local class = M._classes[name]
        if not class then
            M._errorHandler(('class %q not found'):format(name))
        end
        local super = self.superClass
        if not super then
            M._errorHandler(('class %q not inherit from any class'):format(name))
        end
        ---@cast super -?
        self.superCache[name] = function (...)
            local k, obj = debug.getlocal(2, 1)
            if k ~= 'self' then
                M._errorHandler(('`%s()` must be called by the class'):format(name))
            end
            super.__call(obj,...)
        end
    end
    return self.superCache[name]
end

return M
