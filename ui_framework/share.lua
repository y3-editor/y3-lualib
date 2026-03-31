--[[
    UI 框架共享状态

    所有需要访问 event / uiMgr 的模块通过 require 此文件获取。
    避免使用全局变量，保持模块间解耦。

    使用方法：
    ```lua
    local share = require 'y3.ui_framework.share'
    share.uiMgr:openUI("MyPanel")
    share.event:emit("data_change", data)
    ```
]]

---@class UIFrameworkShare
---@field event EventBus 全局事件总线
---@field uiMgr UIManager UI管理器
local M = {}

return M