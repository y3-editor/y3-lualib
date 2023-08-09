---@class Reload
local M = {}

---@private
M.includedNames = {}

-- 类似于 `require` ，但是会在重载时重新加载文件。
function M.include(name)
    xpcall(require, log.error, name)
end

return M
