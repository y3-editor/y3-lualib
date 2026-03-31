---@class BasePanel
---@field _panelObj UI 面板根节点
---@field _controls table<string, UI> 表键为控件名值为控件本身（以"_"开头的控件）
---@field _localPlayer Player 本地玩家
---@field _localPlayerId integer 本地玩家ID
---@field _name string 界面名称
---@field _isAttached boolean 是否已完成 attach
---@field _eventHandlers table<string, function[]> 事件监听器
---@field _gcHost GCHost 生命周期垃圾回收宿主
local M = Class "BasePanel"

---@return self
function M:__init()
    self._panelObj = nil
    self._controls = {}
    self._isAttached = false
    self._eventHandlers = {}
    self._localPlayerId = nil
    self._localPlayer = nil
    self._gcHost = New "GCHost" ()
    return self
end

---获取本地玩家（延迟初始化）
---@return Player
function M:getLocalPlayer()
    if not self._localPlayer then
        self._localPlayer = y3.player.get_by_handle(GameAPI.get_client_role())
    end
    return self._localPlayer
end

---获取本地玩家ID（延迟初始化）
---@return integer
function M:getLocalPlayerId()
    if not self._localPlayerId then
        self._localPlayerId = 1
    end
    return self._localPlayerId
end

---递归查找所有以'_'开头的子控件，并自动绑定到 self 上
---@param parent UI 父控件
function M:findAllUnderscoreControls(parent)
    local children = parent:get_childs()
    for _, child in pairs(children) do
        local controlName = child:get_name()
        if y3.util.stringStartWith(controlName, "_") then
            self._controls[controlName] = child
        end
        -- 递归查找子控件的子控件
        self:findAllUnderscoreControls(child)
    end
end

---获取控件（根据控件名）
---@param name string 控件名（以"_"开头）
---@return UI|nil
function M:getControl(name)
    local control = self._controls[name]
    if control == nil then
        log.warn("Error: Failed to get control for " .. name)
        return nil
    end
    return control
end

---判断界面是否打开
---@return boolean
function M:isOpen()
    if self._panelObj then
        return self._panelObj:is_visible()
    end
    return false
end

---隐藏根节点（初始化时使用）
function M:_hideRoot()
    if self._panelObj then
        self._panelObj:set_visible(false)
    end
end

----------------------------
-- 生命周期钩子（对齐 lualib LocalUILogic）
-- 子类应重写这些方法
----------------------------

---子类重写：初始化（attach 后只执行一次）
---对应 LocalUILogic:on_init
---@param ui UI 界面根节点
---@param local_player Player 本地玩家
function M:on_init(ui, local_player) end

---子类重写：每次打开/刷新时调用
---对应 LocalUILogic:on_refresh
---@param ... any 打开时传入的参数
function M:on_refresh(...) end

---子类重写：隐藏时调用
---@param ... any 关闭时传入的参数
function M:on_hide(...) end

---子类重写：销毁时调用
function M:on_destroy() end

----------------------------
-- 内部生命周期方法（由 UIManager 调用）
----------------------------

---内部附着：绑定 UI 节点并执行初始化（由 UIManager 调用）
---对应 LocalUILogic:attach 的逻辑
---@param ui UI|string 界面根节点或UUID字符串
function M:attach(ui)
    if self._isAttached then
        return
    end

    -- 防御性初始化：确保关键字段存在
    self._controls = self._controls or {}
    self._eventHandlers = self._eventHandlers or {}
    self._gcHost = self._gcHost or New "GCHost" ()

    -- 支持传入 UUID 字符串
    if type(ui) == "string" then
        local localPlayer = self:getLocalPlayer()
        ui = y3.ui.get_by_handle(localPlayer, ui)
        if not ui then
            log.error("[BasePanel] attach: 无法通过 UUID 获取 UI")
            return
        end
    end

    self._panelObj = ui

    -- 递归查找所有以'_'开头的子控件
    self:findAllUnderscoreControls(ui)

    -- 自动绑定控件到 self（以 _ 开头的字段）
    for name, control in pairs(self._controls) do
        self[name] = control
    end

    local localPlayer = self:getLocalPlayer()

    -- 调用子类 on_init
    self:on_init(ui, localPlayer)

    self._isAttached = true
end

---内部打开（由 UIManager 调用）
---@param ... any 传递给 on_refresh 的参数
function M:open(...)
    if not self._panelObj then
        log.warn("[BasePanel] open: panelObj is nil")
        return
    end

    self._panelObj:set_visible(true)

    -- 调用子类 on_refresh
    self:on_refresh(...)
end

---内部关闭（由 UIManager 调用）
function M:close()
    if not self._panelObj then
        return
    end

    self._panelObj:set_visible(false)

    -- 调用子类 on_hide
    self:on_hide()
end

---内部销毁（由 UIManager 调用）
function M:destroy()
    -- 调用子类 on_destroy
    self:on_destroy()

    -- 清理事件
    self._eventHandlers = {}

    -- 销毁 GCHost（自动清理绑定的所有资源）
    if self._gcHost then
        Delete(self._gcHost)
        self._gcHost = nil
    end

    -- 清理控件引用
    self._controls = {}
    self._panelObj = nil
    self._isAttached = false
end

----------------------------
-- 与 y3.local_ui 集成
----------------------------

---绑定资源到生命周期（通过内部 GCHost 管理）
---@param obj any 需要绑定的对象（定时器、触发器等）
---@return any obj 返回传入的对象
function M:bindGC(obj)
    if self._gcHost then
        return self._gcHost:bindGC(obj)
    end
    return obj
end

---创建本地UI逻辑（用于列表等复杂UI）
---@param childPath string 子控件路径
---@return LocalUILogic?
function M:createLocalUI(childPath)
    local child = self._panelObj:get_child(childPath)
    if not child then
        log.warn("Error: Failed to get child for LocalUI: " .. childPath)
        return nil
    end
    local logic = y3.local_ui.create(child)
    self:bindGC(logic)  -- 通过 BasePanel 的 bindGC 代理
    return logic
end

---创建元件逻辑（用于可复用的 UI 组件）
---@param prefabName string 元件名称
---@return LocalUILogic
function M:createPrefabLogic(prefabName)
    return y3.local_ui.prefab(prefabName)
end

----------------------------
-- 点击事件绑定
----------------------------

---绑定点击事件（标准方式）
---@param control UI 控件
---@param callback function 点击回调
function M:bindClick(control, callback)
    if not control then
        log.warn("[BasePanel] bindClick: control is nil")
        return
    end

    ---@diagnostic disable-next-line: param-type-mismatch
    local trigger = control:add_event("左键-点击", function(trg, data)
        if callback then
            callback()
        end
    end)

    if trigger then
        self:bindGC(trigger)
    end
end

---绑定按钮按下事件
---@param control UI 控件
---@param callback function 回调
function M:bindPress(control, callback)
    if not control then return end

    ---@diagnostic disable-next-line: param-type-mismatch
    local trigger = control:add_event("左键-按下", function(trg, data)
        if callback then
            callback()
        end
    end)

    if trigger then
        self:bindGC(trigger)
    end
end

---绑定按钮抬起事件
---@param control UI 控件
---@param callback function 回调
function M:bindRelease(control, callback)
    if not control then return end

    ---@diagnostic disable-next-line: param-type-mismatch
    local trigger = control:add_event("左键-抬起", function(trg, data)
        if callback then
            callback()
        end
    end)

    if trigger then
        self:bindGC(trigger)
    end
end

----------------------------
-- 定时器封装（基于 y3.ctimer 客户端定时器）
----------------------------

---创建循环定时器
---@param interval number 间隔秒数
---@param callback function 回调函数
---@return table 定时器对象（可调用 :remove() 停止）
function M:loop(interval, callback)
    local timer = y3.ctimer.loop(interval, function(t, count, localPlayer)
        if callback then
            callback(t, count)
        end
    end)

    if timer then
        self:bindGC(timer)
    end

    return timer
end

---创建延时定时器
---@param delay number 延迟秒数
---@param callback function 回调函数
---@return table 定时器对象
function M:wait(delay, callback)
    local timer = y3.ctimer.wait(delay, function(t, count, localPlayer)
        if callback then
            callback(t)
        end
    end)

    if timer then
        self:bindGC(timer)
    end

    return timer
end

---创建有限次数循环定时器
---@param interval number 间隔秒数
---@param count integer 执行次数
---@param callback function 回调函数
---@return table 定时器对象
function M:loopCount(interval, count, callback)
    local timer = y3.ctimer.loop_count(interval, count, function(t, c, localPlayer)
        if callback then
            callback(t, c)
        end
    end)

    if timer then
        self:bindGC(timer)
    end

    return timer
end

----------------------------
-- 自定义事件系统
----------------------------

---触发事件
---@param eventName string 事件名
---@param ... any 事件参数
function M:emit(eventName, ...)
    local handlers = self._eventHandlers[eventName]
    if handlers then
        for _, handler in ipairs(handlers) do
            handler(...)
        end
    end
end

---监听事件
---@param eventName string 事件名
---@param callback function 回调函数
---@return function 取消监听的函数
function M:on(eventName, callback)
    if not self._eventHandlers[eventName] then
        self._eventHandlers[eventName] = {}
    end
    table.insert(self._eventHandlers[eventName], callback)

    -- 返回取消函数
    return function()
        self:off(eventName, callback)
    end
end

---取消监听事件
---@param eventName string 事件名
---@param callback? function 指定回调，不传则移除该事件所有监听
function M:off(eventName, callback)
    if not self._eventHandlers[eventName] then
        return
    end

    if callback then
        for i, handler in ipairs(self._eventHandlers[eventName]) do
            if handler == callback then
                table.remove(self._eventHandlers[eventName], i)
                break
            end
        end
    else
        self._eventHandlers[eventName] = nil
    end
end

return M