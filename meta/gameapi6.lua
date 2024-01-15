-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--保存玩家设置
---@param role py.Role # 玩家
function GameAPI.save_game_setting(role) end

--获取本地玩家
---@return py.Role # 玩家
function GameAPI.get_client_role() end

--设置鼠标移动镜头模式
---@param role py.Role # 玩家
---@param value boolean # 开启/关闭
function GameAPI.set_mouse_move_camera_mode(role, value) end

--设置鼠标移动镜头速度
---@param role py.Role # 玩家
---@param value number # 移动速度
function GameAPI.set_mouse_move_camera_speed(role, value) end

--设置键盘移动镜头速度
---@param role py.Role # 玩家
---@param value number # 移动速度
function GameAPI.set_key_move_camera_speed(role, value) end

--修改玩家主控单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.change_highlight_unit_of_role(role, unit) end

--玩家主控单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.set_highlight_unit_of_role(role, unit) end

--获取玩家主控单位
---@param role py.Role # 玩家
function GameAPI.get_highlight_unit_of_role(role) end

--获取本局游戏环境
---@return py.StartMode # 游戏环境
function GameAPI.api_get_start_mode() end

--攻击类型判断
---@param attack_type0 integer # 攻击类型
---@param attack_type1 integer # 攻击类型
---@return boolean # 攻击类型判断
function GameAPI.api_check_attack_type(attack_type0, attack_type1) end

--护甲类型判断
---@param armor_type0 integer # 护甲类型
---@param armor_type1 integer # 护甲类型
---@return boolean # 护甲类型判断
function GameAPI.api_check_armor_type(armor_type0, armor_type1) end

--天气系统开关
---@param weatherID integer # 天气ID
---@param time number # 时间
---@param intensity number # 强度
function GameAPI.set_weahter_enable(weatherID, time, intensity) end

--获取玩家平台头像
---@param role py.Role # 玩家
---@return integer # 图片ID
function GameAPI.get_role_platform_icon(role) end

--获取玩家平台模型
---@param role py.Role # 玩家
---@return py.ModelKey # 模型编号
function GameAPI.get_role_platform_model(role) end

--创建界面模块
---@param role py.Role # 玩家
---@param distance_max number # 高度上限值
function GameAPI.set_camera_distance_max(role, distance_max) end

--退出游戏
---@param role py.Role # 玩家
function GameAPI.exit_game(role) end

--创建一个物理投射物
---@param p_key py.ProjectileKey # 投射物编号
---@param position py.FVector3 # 位置
---@param rotation? py.FVector3 # 朝向
---@param owner_unit_or_player? py.Unit # 所属单位
---@param duration? py.Fixed # 持续时间
---@return py.ProjectileEntity # 创建出的投射物
function GameAPI.create_physics_projectile_in_scene(p_key, position, rotation, owner_unit_or_player, duration) end

--获取单位类型的模型
---@param unit_key py.UnitKey # 单位类型编号
---@return py.ModelKey # 模型编号
function GameAPI.api_get_unit_type_model(unit_key) end

--获取单位类型的分类
---@param unit_key py.UnitKey # 单位类型编号
---@return integer # 类型
function GameAPI.api_get_unit_type_category(unit_key) end

--玩家本地图平台等级排行榜玩家名称
---@param rank integer # 排名
---@return string # 玩家名称
function GameAPI.api_get_role_name_of_rank(rank) end

--玩家本地图平台等级排行榜玩家等级
---@param rank integer # 排名
---@return integer # 玩家等级
function GameAPI.api_get_role_level_of_rank(rank) end

--遍历物品类型的物品合成材料
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_compose_item_res_of_item_name(item_key) end

--遍历物品类型的玩家合成材料
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_compose_role_attr_of_item_name(item_key) end

--玩家组内随机一个玩家
---@param roles py.RoleGroup # 玩家组
---@return py.Role # 玩家
function GameAPI.get_random_role_in_role_group(roles) end

--玩家组内第一个玩家
---@param roles py.RoleGroup # 玩家组
---@return py.Role # 第一个玩家
function GameAPI.get_first_role_in_group(roles) end

--玩家组内最后一个玩家
---@param roles py.RoleGroup # 玩家组
---@return py.Role # 最后一个玩家
function GameAPI.get_last_role_in_group(roles) end

--遍历物品类型的单位属性
---@param item_key py.ItemKey # 物品类型
function GameAPI.iter_unit_attr_of_item_name(item_key) end

--遍历物品的单位属性
---@param item py.Item # 物品
function GameAPI.iter_unit_attr_of_item(item) end

--设置血条图片
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param image_id py.Texture # 图片
---@param role? py.Role # 玩家
function GameAPI.set_billboard_picture(unit, node_name, image_id, role) end

--设置血条文本
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param text string # 文本
---@param role? py.Role # 玩家
---@param font? string # 字体
function GameAPI.set_billboard_text(unit, node_name, text, role, font) end

--设置血条可见性
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param visible boolean # 可见性
---@param role? py.Role # 玩家
function GameAPI.set_billboard_visible(unit, node_name, visible, role) end

--设置血条进度
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param progress number # 进度
---@param role? py.Role # 玩家
function GameAPI.set_billboard_progress(unit, node_name, progress, role) end

--玩家完全退出游戏（大厅完全退出游戏）
---@param role py.Role # 玩家
function GameAPI.lobby_exit_game(role) end

--对话框显隐
---@param role py.Role # 玩家
---@param dialog integer # 对话框
---@param flag boolean # 是否显示
function GameAPI.DialogDisplay(role, dialog, flag) end

--对话框添加按钮
---@param dialog integer # 对话框
---@param text string # 按钮文本
---@param hot_key integer # 热键
function GameAPI.DialogAddButton(dialog, text, hot_key) end

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

--创建多面板
function GameAPI.CreateMultiboard() end

--删除多面板
---@param multi_board_id integer # 多面板
function GameAPI.DestroyMultiboard(multi_board_id) end

--获取最后创建的多面板
function GameAPI.GetLastCreatedMultiboard() end

--多面板显隐
---@param multi_board_id integer # 多面板
---@param visible boolean # 显隐
function GameAPI.MultiboardDisplay(multi_board_id, visible) end

--多面板模式显示/隐藏
---@param visible boolean # 显隐
function GameAPI.MultiboardSuppressDisplay(visible) end

--多面板最大化/最小化
---@param multi_board_id integer # 多面板
---@param flag string # 最大化/最小化
function GameAPI.MultiboardMinimize(multi_board_id, flag) end

--清空多面板
---@param multi_board_id integer # 多面板
function GameAPI.MultiboardClear(multi_board_id) end

--设置多面板标题
---@param multi_board_id integer # 多面板
---@param text string # 标题
function GameAPI.MultiboardSetTitleText(multi_board_id, text) end

--多面板设置标题颜色
---@param multi_board_id integer # 多面板
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.MultiboardSetTitleTextColor(multi_board_id, r, g, b, a) end

--设置多面板行数
---@param multi_board_id integer # 多面板
---@param count string # 行数
function GameAPI.MultiboardSetRowCount(multi_board_id, count) end

--设置多面板列数
---@param multi_board_id integer # 多面板
---@param count string # 列数
function GameAPI.MultiboardSetColumnCount(multi_board_id, count) end

--多面板获取指定项目
---@param multi_board_id integer # 多面板
---@param row integer # 行
---@param column integer # 列
function GameAPI.MultiboardGetItem(multi_board_id, row, column) end

--多面板设置指定项目显示风格
---@param item_id integer # 项目
---@param text_visible boolean # 文字显隐
---@param icon_visible boolean # 图标显隐
function GameAPI.MultiboardSetItemStyle(item_id, text_visible, icon_visible) end

--多面板设置指定项目文字
---@param item_id integer # 项目
---@param text string # 文字
function GameAPI.MultiboardSetItemValue(item_id, text) end

--多面板设置指定项目文字颜色
---@param item_id integer # 项目
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.MultiboardSetItemValueColor(item_id, r, g, b, a) end

--多面板设置指定项目宽度
---@param item_id integer # 项目
---@param width number # 宽度
function GameAPI.MultiboardSetItemWidth(item_id, width) end

--多面板设置所有项目显示风格
---@param multi_board_id integer # 项目
---@param text_visible boolean # 文字显隐
---@param icon_visible boolean # 图标显隐
function GameAPI.MultiboardSetItemsStyle(multi_board_id, text_visible, icon_visible) end

--多面板设置所有项目文字
---@param multi_board_id integer # 项目
---@param text string # 文字
function GameAPI.MultiboardSetItemsValue(multi_board_id, text) end

--多面板设置所有项目文字颜色
---@param multi_board_id integer # 项目
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.MultiboardSetItemsValueColor(multi_board_id, r, g, b, a) end

--多面板设置所有项目宽度
---@param multi_board_id integer # 多面板
---@param width number # 宽度
function GameAPI.MultiboardSetItemsWidth(multi_board_id, width) end

--多面板获取行数
---@param multi_board_id integer # 多面板
function GameAPI.MultiboardGetRowCount(multi_board_id) end

--多面板获取列数
---@param multi_board_id integer # 多面板
function GameAPI.MultiboardGetColumnCount(multi_board_id) end

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
