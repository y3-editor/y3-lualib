---@class UIManager
---@field _allView table<string, BasePanel> 管理所有的界面
---@field _allBaseView table<string, BaseView> 管理所有的视图控制器
---@field _allTips table<string, BaseTips> 管理所有的提示界面
---@field _uiStack string[] UI栈（用于ESC关闭）
---@field _uiLock table<string, any> 锁定状态
---@overload fun():self
local M = Class "UIManager"

local UIConst = require "y3.ui_framework.UIConst"

----------------------------
-- 界面枚举（从 UIConst 同步）
----------------------------
M.Popup = UIConst.Popup
M.Hud = UIConst.Hud
M.Menu = UIConst.Menu
M.Tips = UIConst.Tips
M.UUID = UIConst.UUID

----------------------------
-- 互斥与ESC配置
----------------------------
M.MutualParent = {}
M.Mutual = UIConst.Mutual or {}
M.NoEsc = UIConst.NoEsc or {}

----------------------------
-- 锁定配置
----------------------------
M.LockFrame = 300   -- 默认锁定帧数
M.CDFrame = 1       -- 解锁后CD帧数
M.Strength = {
    [1] = 1,
    [2] = 5,
    [3] = 15,
}

---@return self
function M:__init()
    self._allView = {}
    self._allBaseView = {}
    self._allTips = {}
    self._uiStack = {}
    self._uiLock = {}
    return self
end

---启动UI管理器（游戏初始化时调用）
function M:start()
    self:initUI()
end

---初始化所有界面
function M:initUI()
    local uiClasses = { self.Popup, self.Hud, self.Menu }

    for _, uiList in pairs(uiClasses) do
        for uiName in pairs(uiList) do
            -- 尝试实例化界面类
            local success, instance = pcall(function()
                return New(uiName)()
            end)
            if success and instance then
                self._allView[uiName] = instance
            else
                log.warn("UIManager: Failed to create UI class: " .. uiName)
            end
        end
    end

    -- 初始化 Tips
    for uiName in pairs(M.Tips) do
        local uuid = M.UUID[uiName]
        if uuid then
            local success, instance = pcall(function()
                return New(uiName)()
            end)
            if success and instance then
                self._allTips[uiName] = instance
                -- attach 代替旧的 baseInit + initHide
                instance:attach(uuid)
                instance:_hideRoot()
            else
                log.warn("UIManager: Failed to create Tips class: " .. uiName)
            end
        end
    end

    -- 构建互斥映射
    for key, NameData in pairs(M.Mutual) do
        for _, name in ipairs(NameData) do
            M.MutualParent[name] = key
        end
    end
end

----------------------------
-- 界面控制
----------------------------

---显示界面（支持多参数）
---@param viewName string 界面名
---@param ... any 传递给 on_refresh 的参数
function M:openUI(viewName, ...)
    self:hideMutual(viewName)
    local panel = self._allView[viewName]
    if panel then
        -- 先初始化（如果还没 attach）
        if not panel._isAttached then
            log.info("[UIManager] 初始化界面: " .. viewName)

            -- 获取 UI 控件
            local localPlayer = panel:getLocalPlayer()
            local uuid = self:getUUID(viewName)
            local ui = nil

            if uuid then
                ui = y3.ui.get_by_handle(localPlayer, uuid)
                if not ui then
                    log.error("[UIManager] 无法通过 UUID 获取 UI: " .. viewName .. ", UUID: " .. uuid)
                    return
                end
            else
                local uiPath = self:getUIPath(viewName)
                ui = y3.ui.get_ui(localPlayer, uiPath)
                if not ui then
                    log.error("[UIManager] 无法通过路径获取 UI: " .. viewName .. ", Path: " .. uiPath)
                    return
                end
            end

            -- attach：绑定 UI 节点并执行 on_init
            panel:attach(ui)
            log.info("[UIManager] 界面 attach 完成: " .. viewName)
        end

        -- 调用 open（内部会 set_visible + on_refresh）
        log.info("[UIManager] 打开界面: " .. viewName)
        panel:open(...)

        -- 如果是弹窗，加入栈中
        for dlgName in pairs(self.Popup) do
            if dlgName == viewName then
                self:uiStackInsert(viewName)
                break
            end
        end

        -- 通过事件总线广播界面打开事件
        if GamePlay.event then
            GamePlay.event:emit("ui:open", viewName)
            GamePlay.event:emit("ui:open:" .. viewName)
        end
    else
        log.warn("[UIManager] 界面未找到: " .. viewName)
    end
end

---关闭界面
---@param viewName string
function M:closeUI(viewName)
    local panel = self._allView[viewName]
    if panel then
        -- 调用 close（内部会 set_visible(false) + on_hide）
        panel:close()
        -- 从栈中移除
        for i = #self._uiStack, 1, -1 do
            if self._uiStack[i] == viewName then
                table.remove(self._uiStack, i)
                break
            end
        end

        -- 通过事件总线广播界面关闭事件
        if GamePlay.event then
            GamePlay.event:emit("ui:close", viewName)
            GamePlay.event:emit("ui:close:" .. viewName)
        end
    else
        log.info("UIManager: UI " .. viewName .. " not found")
    end
end

---关闭栈顶界面（ESC响应）
function M:closeTopUI()
    if #self._uiStack == 0 then
        return
    end
    local topIndex = #self._uiStack
    local viewName = self._uiStack[topIndex]
    self:closeUI(viewName)
end

---判断界面是否打开
---@param viewName string
---@return boolean
function M:isUIOpen(viewName)
    if self._allView[viewName] then
        return self._allView[viewName]:isOpen()
    elseif self._allTips[viewName] then
        return self._allTips[viewName]:isOpen()
    else
        return false
    end
end

---判断是否有弹窗打开
---@return boolean
function M:isExistUIOpen()
    return #self._uiStack > 0
end

---关闭所有弹窗
---@param uiNameExcept? string 排除的界面名
function M:closeAllPopup(uiNameExcept)
    for uiName in pairs(M.Popup) do
        if self._allView[uiName] and self._allView[uiName]:isOpen() then
            if uiName ~= uiNameExcept then
                self:closeUI(uiName)
            end
        end
    end
end

---@private
---将界面加入栈
---@param viewName string
function M:uiStackInsert(viewName)
    -- 检查是否在 NoEsc 列表中
    for _, name in ipairs(self.NoEsc) do
        if viewName == name then
            return
        end
    end
    table.insert(self._uiStack, viewName)
end

---@private
---隐藏互斥界面
---@param viewName string
function M:hideMutual(viewName)
    if M.MutualParent[viewName] then
        local parent_name = M.MutualParent[viewName]
        for _, uiName in ipairs(M.Mutual[parent_name]) do
            if self:isUIOpen(uiName) and viewName ~= uiName then
                self:closeUI(uiName)
            end
        end
    end
end

----------------------------
-- Tips 控制
----------------------------

---显示Tips
---@param tipsName string
---@param param? table 参数表
function M:showTips(tipsName, param)
    if not tipsName or not self._allTips[tipsName] then
        return
    end
    self._allTips[tipsName]:show(param)
end

---隐藏Tips
---@param tipsName string
---@param param? table 参数表
function M:hideTips(tipsName, param)
    if not tipsName or not self._allTips[tipsName] then
        return
    end
    self._allTips[tipsName]:hide(param)
end

----------------------------
-- 控制器访问
----------------------------

---获取界面控制器（BasePanel）
---@param uiName string
---@return BasePanel|nil
function M:getUICtrl(uiName)
    return self._allView[uiName]
end

---获取视图控制器（BaseView）
---@param uiName string
---@return BaseView|nil
function M:getUIViewCtrl(uiName)
    return self._allBaseView[uiName]
end

---设置视图控制器
---@param uiName string
---@param ctrl BaseView
function M:setUIViewCtrl(uiName, ctrl)
    self._allBaseView[uiName] = ctrl
end

---获取界面UUID
---@param uiName string
---@return string|nil
function M:getUUID(uiName)
    return M.UUID[uiName]
end

---获取界面路径
---@param uiName string
---@return string
function M:getUIPath(uiName)
    if UIConst.Path and UIConst.Path[uiName] then
        return UIConst.Path[uiName]
    end
    if M.Popup[uiName] then
        return M.Popup[uiName]
    end
    if M.Hud[uiName] then
        return M.Hud[uiName]
    end
    if M.Menu[uiName] then
        return M.Menu[uiName]
    end
    return "?"
end

---清理所有界面
function M:clear()
    for key, value in pairs(self._allView) do
        value:destroy()
    end
    self._allView = {}
    self._allBaseView = {}
    self._uiStack = {}
end

----------------------------
-- 锁定机制（防连点）
----------------------------

---锁定按钮
---@param str string 锁定标识
function M:lock(str)
    if self._uiLock[str] then
        self._uiLock[str]:remove()
    end
    self._uiLock[str] = y3.ltimer.wait_frame(self.LockFrame, function()
        self._uiLock[str] = nil
    end)
end

---解锁按钮
---@param str string 锁定标识
function M:unlock(str)
    if self._uiLock[str] then
        self._uiLock[str]:remove()
    end
    self._uiLock[str] = y3.ltimer.wait_frame(self.CDFrame, function()
        self._uiLock[str] = nil
    end)
end

---判断是否锁定
---@param str string 锁定标识
---@return boolean
function M:islock(str)
    return self._uiLock[str] ~= nil
end

---自动解锁（带强度）
---@param str string 锁定标识
---@param strength? number 锁定强度 1-1，2-5,3-15
function M:autoLock(str, strength)
    strength = strength or 1
    local time = self.Strength[strength] or self.Strength[1]
    self:lock(str)
    y3.ltimer.wait_frame(time, function()
        self:unlock(str)
    end)
end

----------------------------
-- 按钮图标工具
----------------------------

---设置按钮图片（根据类型）
---@param ui UI 按钮控件
---@param btnType string 按钮类型（对应 UIConst.BtnIcon 的 key）
function M:setBtnIconByType(ui, btnType)
    if not UIConst.BtnIcon[btnType] or not UIConst.BtnIcon[btnType].nml then
        return
    end
    local baseIcon = UIConst.BtnIcon[btnType].nml
    ui:set_btn_status_image(1, UIConst.BtnIcon[btnType].nml)
    ui:set_btn_status_image(2, UIConst.BtnIcon[btnType].hov or baseIcon)
    ui:set_btn_status_image(3, UIConst.BtnIcon[btnType].sel or baseIcon)
    ui:set_btn_status_image(4, UIConst.BtnIcon[btnType].dis or baseIcon)
end

return M