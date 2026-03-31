--[[
    UI 框架入口

    负责：
    1. 加载所有 UI 基础类和 Manager
    2. 在 share 中初始化 event 和 uiMgr
    3. 注册游戏初始化事件，启动 UIManager

    使用方法：
    UI 框架随 y3-lualib 自动加载，无需手动引入。
    需要使用 event / uiMgr 的模块通过 require 'y3.ui_framework.share' 获取。

    ```lua
    local share = require 'y3.ui_framework.share'
    share.uiMgr:openUI("MyPanel")
    share.event:emit("data_change", data)
    ```
]]

----------------------------
-- 加载 UI 框架类定义
----------------------------
include 'y3.ui_framework.base.init'
include 'y3.ui_framework.UIManager'

----------------------------
-- 初始化共享状态
----------------------------
local share = require 'y3.ui_framework.share'

-- 事件总线（最先初始化，其他模块可能依赖它）
share.event = New "EventBus" ()

-- UI 管理器
share.uiMgr = New "UIManager" ()

log.info("[UI Framework] share 初始化完成")
log.info("[UI Framework] - share.event: " .. tostring(share.event ~= nil))
log.info("[UI Framework] - share.uiMgr: " .. tostring(share.uiMgr ~= nil))

----------------------------
-- 游戏启动初始化
----------------------------
y3.game:event('游戏-初始化', function(trg, data)
    log.info("[UI Framework] 收到 '游戏-初始化' 事件")

    if not share.uiMgr then
        log.error("[UI Framework] share.uiMgr 未实例化！")
        return
    end

    log.info("[UI Framework] 启动 share.uiMgr:start()")
    share.uiMgr:start()
    log.info("[UI Framework] UIManager 启动完成")
end)

-- 导出公开 API 到 y3.ui_manager
y3.ui_manager = require 'y3.ui_framework.api'

log.info("[UI Framework] UI 框架加载完成")
