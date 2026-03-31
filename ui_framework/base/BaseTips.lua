---@class BaseTips : GCHost
---@field _root UI Tips根节点
---@field _localPlayer Player 本地玩家
---@field _localPlayerId integer 本地玩家ID
---@field _pos integer[]|nil 固定位置（nil则跟随鼠标）
---@field _isAttached boolean 是否已完成 attach
local M = Class 'BaseTips'

-- 继承 GCHost，与 BasePanel / LocalUILogic 保持一致
Extends("BaseTips", "GCHost")

---初始化Tips（由外部调用一次）
---@param uiNode? string UUID或路径
function M:attach(uiNode)
    if not uiNode or self._isAttached then
        return
    end
    self._localPlayer = y3.player.get_by_handle(GameAPI.get_client_role())
    self._localPlayerId = 1
    self._root = y3.ui.get_by_handle(self._localPlayer, uiNode)
    self._isAttached = true

    -- 调用子类 on_init
    self:on_init(self._root, self._localPlayer)
end

---子类重写：初始化（attach 后只执行一次）
---对应 LocalUILogic:on_init
---@param ui UI Tips根节点
---@param local_player Player 本地玩家
function M:on_init(ui, local_player) end

---子类重写：每次显示/刷新时调用
---对应 LocalUILogic:on_refresh
---@param data? table
function M:on_refresh(data) end

---子类重写：隐藏时调用
---@param data? table
function M:on_hide(data)
    self:_hideRoot()
end

---显示Tips
---@param data? table 传递给 on_refresh 的数据
function M:show(data)
    if self._root then
        self._root:set_visible(true)
    end
    self:on_refresh(data)
end

---隐藏Tips
---@param data? table 传递给 on_hide 的数据
function M:hide(data)
    self:on_hide(data)
end

---判断Tips是否打开
---@return boolean
function M:isOpen()
    if self._root == nil then
        return false
    end
    return self._root:is_visible()
end

---内部隐藏根节点
function M:_hideRoot()
    if self._root == nil then
        return
    end
    self._root:set_visible(false)
end

---设置坐标（简单模式）
---传入nil则跟随鼠标，否则固定到指定位置
---@param pos? integer[] {x, y}
function M:setPoint(pos)
    self._pos = pos
    local preX = self._localPlayer:get_mouse_ui_x_percent()
    local preY = self._localPlayer:get_mouse_ui_y_percent()
    local x, y = 0, 1
    if preX > 0.5 then
        x = 1
    end
    if preY < 0.5 then
        y = 0
    end
    if not self._pos then
        self._root:set_anchor(x, y)
        self._root:set_follow_mouse(true, 5, 5)
    else
        self._root:set_anchor(0.5, 1)
        self._root:set_pos(self._pos[1], self._pos[2])
    end
end

---设置坐标（根据触发UI的位置动态调整）
---会根据UI位置自动选择显示在四个方向之一，避免超出屏幕
---@param ui UI 触发tips的UI元素
---@param offset? number[] 偏移量 [x偏移, y偏移]，默认为 [0, 0]
function M:setPointByUI(ui, offset)
    offset = offset or { 0, 0 }
    self._root:set_follow_mouse(false)

    -- 获取触发UI的信息
    local uiX = ui:get_absolute_x()
    local uiY = ui:get_absolute_y()
    local uiWidth = ui:get_real_width()
    local uiHeight = ui:get_real_height()

    -- 获取UI在屏幕上的百分比位置
    local mouseXPercent = uiX / y3.ui.get_window_width()
    local mouseYPercent = uiY / y3.ui.get_window_height()

    -- 根据位置判断tips显示方向 (分为四个象限)
    local direction
    local isLeft = mouseXPercent < 0.5
    local isTop = mouseYPercent < 0.5

    if isLeft and isTop then
        direction = "right_down" -- 左上 > 右下
    elseif not isLeft and isTop then
        direction = "left_down"  -- 右上 > 左下
    elseif isLeft and not isTop then
        direction = "right_up"   -- 左下 > 右上
    else
        direction = "left_up"    -- 右下 > 左上
    end

    -- 四个方向的参数配置
    local directions = {
        right_down = {
            tipsX = function() return uiX + uiWidth / 2 + offset[1] end,
            tipsY = function() return uiY - uiHeight / 2 - offset[2] end,
            anchorX = 0,
            anchorY = 0
        },
        left_down = {
            tipsX = function() return uiX - uiWidth / 2 - offset[1] end,
            tipsY = function() return uiY - uiHeight / 2 - offset[2] end,
            anchorX = 1,
            anchorY = 0
        },
        right_up = {
            tipsX = function() return uiX + uiWidth / 2 + offset[1] end,
            tipsY = function() return uiY + uiHeight / 2 + offset[2] end,
            anchorX = 0,
            anchorY = 1
        },
        left_up = {
            tipsX = function() return uiX - uiWidth / 2 - offset[1] end,
            tipsY = function() return uiY + uiHeight / 2 + offset[2] end,
            anchorX = 1,
            anchorY = 1
        }
    }

    local dirConfig = directions[direction]
    local tipsX = dirConfig.tipsX()
    local tipsY = dirConfig.tipsY()

    self._root:set_anchor(dirConfig.anchorX, dirConfig.anchorY)
    self._root:set_absolute_pos(tipsX, tipsY)
end

return M