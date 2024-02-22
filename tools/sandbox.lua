---@class SandBox
local M = {}
M.__index = M

local function make_env()
    local env = {}
    env._G = env
    env._VERSION = _VERSION
    env.assert = assert
    env.collectgarbage = collectgarbage
    env.error = error
    env.getmetatable = getmetatable
    env.ipairs = ipairs
    env.next = next
    env.pairs = pairs
    env.pcall = pcall
    env.print = print
    env.rawequal = rawequal
    env.rawget = rawget
    env.rawlen = rawlen
    env.rawset = rawset
    --env.require = require
    env.select = select
    env.setmetatable = setmetatable
    env.tonumber = tonumber
    env.tostring = tostring
    env.type = type
    env.xpcall = xpcall

    env.coroutine = {}
    env.coroutine.close = coroutine.close
    env.coroutine.create = coroutine.create
    env.coroutine.isyieldable = coroutine.isyieldable
    env.coroutine.resume = coroutine.resume
    env.coroutine.running = coroutine.running
    env.coroutine.status = coroutine.status
    env.coroutine.wrap = coroutine.wrap
    env.coroutine.yield = coroutine.yield

    env.math = {}
    env.math.abs = math.abs
    env.math.acos = math.acos
    env.math.asin = math.asin
    env.math.atan = math.atan
    env.math.ceil = math.ceil
    env.math.cos = math.cos
    env.math.deg = math.deg
    env.math.exp = math.exp
    env.math.floor = math.floor
    env.math.fmod = math.fmod
    env.math.huge = math.huge
    env.math.log = math.log
    env.math.max = math.max
    env.math.maxinteger = math.maxinteger
    env.math.min = math.min
    env.math.mininteger = math.mininteger
    env.math.modf = math.modf
    env.math.pi = math.pi
    env.math.rad = math.rad
    env.math.random = math.random
    env.math.randomseed = math.randomseed
    env.math.sin = math.sin
    env.math.sqrt = math.sqrt
    env.math.tan = math.tan
    env.math.tointeger = math.tointeger
    env.math.type = math.type
    env.math.ult = math.ult

    env.os = {}
    env.os.clock = os.clock
    env.os.date = os.date
    env.os.difftime = os.difftime
    env.os.time = os.time

    env.package = {}
    env.package.config = package.config
    env.package.loaded = {}
    env.package.preload = {}
    env.package.path = '?.lua;?/init.lua'
    env.package.searchers = {}
    env.package.searchpath = package.searchpath

    env.string = {}
    env.string.byte = string.byte
    env.string.char = string.char
    env.string.dump = string.dump
    env.string.find = string.find
    env.string.format = string.format
    env.string.gmatch = string.gmatch
    env.string.gsub = string.gsub
    env.string.len = string.len
    env.string.lower = string.lower
    env.string.match = string.match
    env.string.pack = string.pack
    env.string.packsize = string.packsize
    env.string.rep = string.rep
    env.string.reverse = string.reverse
    env.string.sub = string.sub
    env.string.unpack = string.unpack
    env.string.upper = string.upper

    env.table = {}
    env.table.concat = table.concat
    env.table.insert = table.insert
    env.table.move = table.move
    env.table.pack = table.pack
    env.table.remove = table.remove
    env.table.sort = table.sort
    env.table.unpack = table.unpack

    env.utf8 = {}
    env.utf8.char = utf8.char
    env.utf8.charpattern = utf8.charpattern
    env.utf8.codepoint = utf8.codepoint
    env.utf8.codes = utf8.codes
    env.utf8.len = utf8.len
    env.utf8.offset = utf8.offset

    return env
end

---@private
function M:make_searcher()
    local searchers = package.searchers
    local prefix_name = self.prefix_name
    return function (name)
        if prefix_name then
            name = prefix_name .. '.' .. name
        end
        local msg = ''
        for _, searcher in ipairs(searchers) do
            local f, extra = searcher(name)
            if type(f) == 'function' then
                return f, extra
            elseif type(f) == 'string' then
                msg = msg .. f
            end
        end
        return msg
    end
end

---@private
function M:make_preload()
    local preload = self.env.package.preload
    return function (name)
        assert(type(preload) == "table", "'package.preload' must be a table")
        if preload[name] == nil then
            return ("\n\tno field package.preload['%s']"):format(name)
        end
        return preload[name]
    end
end

---@private
function M:make_require(searchers, loaded)
    local env = self.env
    searchers = searchers or env.package.searchers
    loaded = loaded or env.package.loaded
    local function search_loader(name)
        local msg = ''
        for _, searcher in ipairs(searchers) do
            local f, extra = searcher(name)
            if type(f) == 'function' then
                return f, extra
            elseif type(f) == 'string' then
                msg = msg .. f
            end
        end
        error(("module '%s' not found:%s"):format(name, msg))
    end
    return function (name)
        assert(type(name) == "string", ("bad argument #1 to 'require' (string expected, got %s)"):format(type(name)))
        local p = loaded[name]
        if p ~= nil then
            return p
        end
        local f, extra = search_loader(name)
        if debug.getupvalue(f, 1) == '_ENV' then
            debug.setupvalue(f, 1, env)
        end
        local res = f(name, extra)
        if res == nil then
            res = true
        end
        loaded[name] = res
        return res
    end
end

---@package
---@param sandbox_name string
---@param prefix_name? string
function M:init(sandbox_name, prefix_name)
    ---@type string
    self.name = sandbox_name
    ---@type string?
    self.prefix_name = prefix_name
    ---@type table
    self.env = make_env()
    self.env.package.searchers[1] = self:make_preload()
    self.env.package.searchers[2] = self:make_searcher()
    self.env.require = self:make_require()
end

function M:require(name)
    local require = self:make_require(package.searchers, package.loaded)
    return require(name)
end

---@param name string
---@param prefix_name? string
---@return SandBox
return function (name, prefix_name)
    local sandbox = setmetatable({}, M)
    sandbox:init(name, prefix_name)
    return sandbox
end
