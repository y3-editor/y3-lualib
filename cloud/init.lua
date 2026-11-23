-- 通讯层命名空间：功能按模块挂在 y3.cloud.<name> 下
-- 当前实现：y3.cloud.rpc（请求 / 应答 / 通知）

---@class Cloud
local M = {}

M.rpc = require 'y3.cloud.rpc'

return M
