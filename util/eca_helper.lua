---@class ECAHelper
local M = {}

--注册ECA函数
--
--可以使用该功能让lua函数在ECA中被调用。
---@param name string
---@return ECAFunction
function M.def(name)
    return New 'ECAFunction' (name)
end

return M
