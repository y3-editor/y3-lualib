---@class Log
local M = Class 'Log'

---@private
---@param level string
---@param stack boolean
---@param ... any
---@return string
function M.build(level, stack, ...)
    local t = table.pack(...)
    for i = 1, t.n do
        t[i] = tostring(t[i])
    end
    local str = table.concat(t, '\t', 1, t.n)
    if stack then
        str = debug.traceback(str, 2)
    end
    str = ('[%s] %s'):format(level, str)
    if level == 'error' or level == 'fatal' then
        GameAPI.print_to_dialog(1, str)
    elseif level == 'warn' then
        GameAPI.print_to_dialog(2, str)
    else
        GameAPI.print_to_dialog(3, str)
    end
    return str
end

---@param ... any
---@return string
function M.info(...)
    return M.build('info', false, ...)
end

---@param ... any
---@return string
function M.debug(...)
    return M.build('debug', false, ...)
end

---@param ... any
---@return string
function M.warn(...)
    return M.build('warn', false, ...)
end

---@param ... any
---@return string
function M.error(...)
    return M.build('error', true, ...)
end

---@param ... any
---@return string
function M.fatal(...)
    return M.build('fatal', true, ...)
end

---@param ... any
---@return string
function M.trace(...)
    return M.build('trace', true, ...)
end

return M
