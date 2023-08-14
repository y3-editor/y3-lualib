---@class Reload
local M = {}

---@private
---@type table<string, string>
M.includedNameMap = {}

---@private
---@type string[]
M.includedNames = {}

-- 类似于 `require` ，但是会在重载时重新加载文件。
---@param name string
---@return any
function M.include(name)
    local suc, result, path = xpcall(require, log.error, name)
    if not suc then
        return false
    end
    if not M.includedNameMap[name] then
        if not path then
            error(('不能混用 `require` 与 `include` 加载 "%s"'):format(name))
        end
        M.includedNameMap[name] = path
        M.includedNames[#M.includedNames+1] = name
    end
    return result
end

-- 进行重载
---@param logger? fun(str: string)
function M.reload(logger)
    logger = logger or print
end

return M
