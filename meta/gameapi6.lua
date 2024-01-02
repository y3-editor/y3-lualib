-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--对话框添加按钮
---@param dialog integer # 对话框
---@param text string # 按钮文本
---@param hot_key integer # 热键
function GameAPI.DialogAddButtonBJ(dialog, text, hot_key) end

--对话框添加按钮-有热键
---@param dialog integer # 对话框
---@param text string # 按钮文本
---@param hot_key integer # 热键
function GameAPI.DialogAddButtonWithHotkey(dialog, text, hot_key) end

--对话框添加按钮-有热键
---@param dialog integer # 对话框
---@param text string # 按钮文本
---@param hot_key integer # 热键
function GameAPI.DialogAddButtonWithHotkeyBJ(dialog, text, hot_key) end

--对话框设置文本
---@param dialog integer # 对话框
---@param text string # 对话框文本
function GameAPI.DialogSetMessage(dialog, text) end

--获取上一次创建的按钮
function GameAPI.GetLastCreatedButton() end

--获取上一次点击的按钮
function GameAPI.GetClickedButton() end

--创建计时器框
---@param timer_id integer # 计时器
function GameAPI.CreateTimerDialog(timer_id) end

--获取上一次创建的计时器
function GameAPI.GetLastCreatedTimer() end

--获取上一次创建的计时器框
function GameAPI.GetLastCreatedTimerDialog() end

--计时器设置标题
---@param timer_id integer # 计时器
---@param text string # 计时器标题
function GameAPI.TimerDialogSetTitle(timer_id, text) end

--计时器框显隐
---@param timer_id integer # 计时器框
---@param flag boolean # 是否显示
function GameAPI.TimerDialogDisplay(timer_id, flag) end

--开始计时器
---@param timer_id integer # 计时器
---@param timeout integer # 计时器时间
---@param periodic boolean # 是否循环
---@param func integer # 回调函数
function GameAPI.TimerStart(timer_id, timeout, periodic, func) end

--停止计时器
---@param timer_id integer # 计时器
function GameAPI.DestroyTimerDialog(timer_id) end

--对玩家显示文本消息(自动限时)
---@param role py.Role # 玩家
---@param x number # x位移
---@param y number # y位移
---@param message string # 文本
function GameAPI.DisplayTextToPlayer(role, x, y, message) end

--对玩家显示文本消息(指定时间)
---@param role py.Role # 玩家
---@param x number # x位移
---@param y number # y位移
---@param duration number # 指定时间
---@param message string # 文本
function GameAPI.DisplayTimedTextFromPlayer(role, x, y, duration, message) end

--显示装载界面
function GameAPI.DisplayLoadDialog() end
