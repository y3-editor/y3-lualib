--[[
    UI 框架入口

    负责：
    1. 定义全局 GamePlay 表
    2. 加载并初始化所有 Manager
    3. 注册游戏初始化事件，启动各 Manager

    使用方法：
    UI 框架随 y3-lualib 自动加载，无需手动引入。

    架构说明：
    - 所有业务逻辑挂载到 GamePlay 表
    - Manager 间通过 GamePlay.xxx 相互引用
    - 热重载时可通过 GamePlay = nil 一键清理
]]

----------------------------
-- 定义全局 GamePlay 表
----------------------------
---@class GamePlay
---@field uiMgr UIManager UI管理器
---@field event EventBus 全局事件总线
if not GamePlay then
    GamePlay = {}
end

----------------------------
-- 加载 UI 框架
----------------------------
include 'y3.ui_framework.base.init'
include 'y3.ui_framework.UIManager'

----------------------------
-- 实例化 Manager（顺序重要：被依赖的放前面）
----------------------------

-- 事件总线（最先初始化，其他模块可能依赖它）
GamePlay.event = New "EventBus" ()

-- UI 管理器
GamePlay.uiMgr = New "UIManager" ()

log.info("[UI Framework] GamePlay 初始化完成")
log.info("[UI Framework] - GamePlay.event: " .. tostring(GamePlay.event ~= nil))
log.info("[UI Framework] - GamePlay.uiMgr: " .. tostring(GamePlay.uiMgr ~= nil))

----------------------------
-- 游戏启动初始化
----------------------------
y3.game:event('游戏-初始化', function(trg, data)
    log.info("[UI Framework] 收到 '游戏-初始化' 事件")

    -- 检查 uiMgr 是否实例化
    if not GamePlay or not GamePlay.uiMgr then
        log.error("[UI Framework] GamePlay.uiMgr 未实例化！请检查 ui_framework/init.lua")
        return
    end

    -- 启动 UI 管理器
    log.info("[UI Framework] 启动 GamePlay.uiMgr:start()")
    GamePlay.uiMgr:start()
    log.info("[UI Framework] UIManager 启动完成")

    -- TODO: 在此处添加你的游戏初始化逻辑
end)

log.info("[UI Framework] UI 框架加载完成")