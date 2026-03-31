---@class BaseView : GCHost
---@field _root UI 视图根节点
---@field _isVisible boolean 是否可见
---@field _localPlayer Player 本地玩家
---@field _localPlayerId integer 本地玩家ID
---@field _refresh boolean 是否需要刷新
---@field _isAttached boolean 是否已完成 attach
---@field _controls table<string, UI> 以'_'开头的子控件
local M = Class 'BaseView'

-- 继承 GCHost，与 BasePanel / LocalUILogic 保持一致
Extends("BaseView", "GCHost")

local class = require "y3.tools.class"
local share = require "y3.ui_framework.share"

---初始化视图（由外部调用一次）
---对应 LocalUILogic:attach 的逻辑
---@param uiNode UI UI节点
function M:attach(uiNode)
    if not uiNode or self._isAttached then
        return
    end
    self._root = uiNode
    self._isVisible = false
    self._controls = {}

    -- 获取本地玩家
    self._localPlayer = y3.player.get_by_handle(GameAPI.get_client_role())
    self._localPlayerId = 1

    -- 递归查找以'_'开头的子控件
    self:_findControls(uiNode)

    -- 自动绑定控件到 self
    for name, control in pairs(self._controls) do
        self[name] = control
    end

    -- 自动注册到 UIManager，方便通过 getUIViewCtrl 获取
    local className = class.type(self)
    if className and share.uiMgr then
        share.uiMgr:setUIViewCtrl(className, self)
    end

    self._isAttached = true

    -- 调用子类 on_init
    self:on_init(self._root, self._localPlayer)
end

---@private
---递归查找以'_'开头的子控件
---@param parent UI
function M:_findControls(parent)
    local children = parent:get_childs()
    for _, child in pairs(children) do
        local controlName = child:get_name()
        if y3.util.stringStartWith(controlName, "_") then
            self._controls[controlName] = child
        end
        self:_findControls(child)
    end
end

---子类重写：初始化（attach 后只执行一次）
---对应 LocalUILogic:on_init
---@param ui UI 视图根节点
---@param local_player Player 本地玩家
function M:on_init(ui, local_player) end

---子类重写：每次显示/刷新时调用
---对应 LocalUILogic:on_refresh
---@param data? table
function M:on_refresh(data) end

---子类重写：隐藏时调用
function M:on_hide() end

---子类重写：销毁时调用
function M:on_destroy() end

---显示视图（由外部调用）
---@param data? table
function M:show(data)
    self._isVisible = true
    self._refresh = true
    self._root:set_visible(true)
    self:on_refresh(data)
end

---隐藏视图（由外部调用）
function M:hide()
    self._isVisible = false
    self._root:set_visible(false)
    self:on_hide()
end

---判断视图是否打开
---@return boolean
function M:isOpen()
    return self._isVisible
end

---清理资源
function M:clear()
    self:on_destroy()
    -- GCHost 会自动清理绑定的资源
end

return M