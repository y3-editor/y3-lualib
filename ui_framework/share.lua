--[[
    UI 框架共享状态（内部模块）

    框架内部模块通过 require 此文件共享 event 和 uiMgr 实例。
    用户不应直接 require 此文件，请使用 y3.ui_manager API。
]]

---@class UIFrameworkShare
---@field event EventBus 全局事件总线
---@field uiMgr UIManager UI管理器
local M = {}

return M