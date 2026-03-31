--[[
    UI 常量定义

    所有界面的注册、UUID、互斥、ESC配置、按钮图标等统一在此管理。

    使用方法：
    1. 在对应分类（Popup/Hud/Menu/Tips）中添加界面名
    2. 在 UUID 中填写对应 UI 的 UUID（从编辑器复制）
    3. 如需互斥，在 Mutual 中配置
    4. 如不需要ESC关闭，添加到 NoEsc
]]

---@class UIConst
local UIConst = {}

----------------------------
-- 弹出界面（可ESC关闭、可互斥）
----------------------------
UIConst.Popup = {
    -- 示例:
    -- MyPopup  = "MyPopup",
}

----------------------------
-- 常驻HUD界面
----------------------------
UIConst.Hud = {
    -- 示例:
    -- MainHUD  = "MainHUD",
}

----------------------------
-- 菜单界面
----------------------------
UIConst.Menu = {
    -- 示例:
    -- MainMenu = "MainMenu",
}

----------------------------
-- 悬浮提示（Tips）
----------------------------
UIConst.Tips = {
    -- 示例:
    -- SmallTips = "SmallTips",
}

----------------------------
-- UUID 映射（从编辑器中复制界面UUID）
----------------------------
UIConst.UUID = {
    -- 示例:
    -- MyPopup   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    -- MainHUD   = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    -- SmallTips = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
}

----------------------------
-- 路径映射（可选，如果 UUID 方式不适用）
----------------------------
UIConst.Path = {
    -- 示例:
    -- MyPopup = "ui_prefab/MyPopup",
}

----------------------------
-- 互斥配置（同组内同时只能显示一个）
----------------------------
UIConst.Mutual = {
    -- 示例:
    -- group1 = { "PopupA", "PopupB" },
}

----------------------------
-- 不响应ESC关闭的界面
----------------------------
UIConst.NoEsc = {
    -- 示例:
    -- "LoadingPanel",
}

----------------------------
-- 按钮图标映射（可选）
----------------------------
UIConst.BtnIcon = {
    -- 示例:
    -- confirm = {
    --     nml = 123456,  -- 正常状态图片ID
    --     hov = 123457,  -- 悬停状态图片ID
    --     sel = 123458,  -- 选中状态图片ID
    --     dis = 123459,  -- 禁用状态图片ID
    -- },
}

return UIConst