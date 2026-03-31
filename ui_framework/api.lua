--[[
    UI 管理器公开 API

    通过 y3.ui_manager 访问，提供界面注册、控制、事件等功能。
    用户不需要修改 lualib 内部文件，全部通过 API 操作。

    使用示例：
    ```lua
    -- 注册界面
    y3.ui_manager.register_popup("ShopDialog", "xxxxxxxx-xxxx-xxxx")
    y3.ui_manager.register_hud("MainHUD", "yyyyyyyy-yyyy-yyyy")
    y3.ui_manager.register_tips("SmallTips", "zzzzzzzz-zzzz-zzzz")

    -- 控制界面
    y3.ui_manager.open("ShopDialog")
    y3.ui_manager.close("ShopDialog")

    -- 事件总线
    y3.ui_manager.on("gold_change", function(data) ... end)
    y3.ui_manager.emit("gold_change", { gold = 100 })
    ```
]]

local share = require 'y3.ui_framework.share'
local UIConst = require 'y3.ui_framework.UIConst'

---@class y3.UIManagerAPI
local API = {}

----------------------------
-- 界面注册
----------------------------

---注册弹窗界面（可被 ESC 关闭，支持互斥）
---@param name string 界面名（需与 Class 名一致）
---@param uuid string 界面 UUID（从编辑器复制）
function API.register_popup(name, uuid)
    UIConst.Popup[name] = name
    UIConst.UUID[name] = uuid
end

---注册常驻 HUD 界面
---@param name string 界面名
---@param uuid string 界面 UUID
function API.register_hud(name, uuid)
    UIConst.Hud[name] = name
    UIConst.UUID[name] = uuid
end

---注册菜单界面
---@param name string 界面名
---@param uuid string 界面 UUID
function API.register_menu(name, uuid)
    UIConst.Menu[name] = name
    UIConst.UUID[name] = uuid
end

---注册 Tips 界面
---@param name string 界面名
---@param uuid string 界面 UUID
function API.register_tips(name, uuid)
    UIConst.Tips[name] = name
    UIConst.UUID[name] = uuid
end

---配置互斥组（同组内同时只能显示一个）
---@param group_name string 组名
---@param ui_names string[] 界面名列表
function API.set_mutual(group_name, ui_names)
    UIConst.Mutual[group_name] = ui_names
end

---配置不响应 ESC 关闭的界面
---@param names string[] 界面名列表
function API.set_no_esc(names)
    UIConst.NoEsc = names
end

----------------------------
-- 界面控制
----------------------------

---打开界面
---@param name string 界面名
---@param ... any 传递给 on_refresh 的参数
function API.open(name, ...)
    share.uiMgr:openUI(name, ...)
end

---关闭界面
---@param name string 界面名
function API.close(name)
    share.uiMgr:closeUI(name)
end

---关闭栈顶弹窗（ESC 响应）
function API.close_top()
    share.uiMgr:closeTopUI()
end

---关闭所有弹窗
---@param except? string 排除的界面名
function API.close_all_popup(except)
    share.uiMgr:closeAllPopup(except)
end

---判断界面是否打开
---@param name string 界面名
---@return boolean
function API.is_open(name)
    return share.uiMgr:isUIOpen(name)
end

---判断是否有弹窗打开
---@return boolean
function API.has_popup()
    return share.uiMgr:isExistUIOpen()
end

---获取界面控制器（BasePanel 实例）
---@param name string 界面名
---@return BasePanel|nil
function API.get_ctrl(name)
    return share.uiMgr:getUICtrl(name)
end

---获取视图控制器（BaseView 实例）
---@param name string 界面名
---@return BaseView|nil
function API.get_view_ctrl(name)
    return share.uiMgr:getUIViewCtrl(name)
end

----------------------------
-- Tips 控制
----------------------------

---显示 Tips
---@param name string Tips 名称
---@param param? table 参数
function API.show_tips(name, param)
    share.uiMgr:showTips(name, param)
end

---隐藏 Tips
---@param name string Tips 名称
---@param param? table 参数
function API.hide_tips(name, param)
    share.uiMgr:hideTips(name, param)
end

----------------------------
-- 事件总线
----------------------------

---订阅事件
---@param event string 事件名
---@param callback function 回调函数
---@return function unsubscribe 取消订阅函数
function API.on(event, callback)
    return share.event:on(event, callback)
end

---一次性订阅（触发一次后自动取消）
---@param event string 事件名
---@param callback function 回调函数
---@return function unsubscribe 取消订阅函数
function API.once(event, callback)
    return share.event:once(event, callback)
end

---取消订阅
---@param event string 事件名
---@param callback function 回调函数
function API.off(event, callback)
    share.event:off(event, callback)
end

---发布事件
---@param event string 事件名
---@param ... any 参数
function API.emit(event, ...)
    share.event:emit(event, ...)
end

---清空某事件的所有监听
---@param event string 事件名
function API.clear_event(event)
    share.event:clear(event)
end

----------------------------
-- 防连点锁定
----------------------------

---自动锁定（防连点）
---@param key string 锁定标识
---@param strength? number 锁定强度 1/2/3
function API.auto_lock(key, strength)
    share.uiMgr:autoLock(key, strength)
end

---判断是否锁定
---@param key string 锁定标识
---@return boolean
function API.is_locked(key)
    return share.uiMgr:islock(key)
end

return API