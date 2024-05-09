local function getInnerDebugger()
    local path
    pcall(function ()
        path = require 'log.debugger_path'
    end)
    return path
end

local function dofile(filename)
    local f = assert(io.open(filename))
    local str = f:read "*a"
    f:close()
    return assert(load(str, "=(debugger.lua)"))(filename)
end

local path = getInnerDebugger()
return dofile(path .. "/script/debugger.lua")
