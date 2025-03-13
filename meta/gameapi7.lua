-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--设置网格列表开启/禁用跳过隐藏控件
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
---@param enable boolean # 是否启用
function GameAPI.set_ui_gridview_skip_invisible_enable(role, comp_uid, enable) end

--设置网格列表启用/禁止下拉回弹
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
---@param enable boolean # 是否启用
function GameAPI.set_ui_gridview_bounce_enabled(role, comp_uid, enable) end

--设置界面控件的父控件
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param parent_uid string # 父控件uid
---@param keep_pos? boolean # 保持位置
---@param keep_rotation? boolean # 保持旋转
---@param keep_scale? boolean # 保持缩放
function GameAPI.set_ui_comp_parent(role, comp_uid, parent_uid, keep_pos, keep_rotation, keep_scale) end

--设置列表启用/禁止滚动
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param enable boolean # 是否启用
function GameAPI.set_ui_scrollview_scroll(role, comp_uid, enable) end

--视频控件开始播放视频
---@param role py.Role # 玩家
---@param url string # url
---@param ease_in_time? number # 淡入时长
---@param ease_out_time? number # 淡出时长
---@param ease_type? integer # 曲线类型
---@param is_loop? boolean # 循环播放
function GameAPI.play_ui_video(role, url, ease_in_time, ease_out_time, ease_type, is_loop) end

--视频控件开始播放视频
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param url string # url
---@param ease_in_time? number # 淡入时长
---@param ease_out_time? number # 淡出时长
---@param ease_type? integer # 曲线类型
---@param is_loop? boolean # 循环播放
function GameAPI.play_ui_video_comp(role, comp_uid, url, ease_in_time, ease_out_time, ease_type, is_loop) end

--视频控件停止播放视频
---@param role py.Role # 玩家
function GameAPI.stop_ui_video(role) end

--视频控件设置音量
---@param role py.Role # 玩家
---@param volume number # 音量
function GameAPI.set_ui_video_volume(role, volume) end

--UI播放特效
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param effect_id string # 特效id
---@param is_loop? boolean # 是否循环
function GameAPI.set_ui_effect_id(role, comp_name, effect_id, is_loop) end

--设置特效控件的背景颜色
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_ui_effect_background_color(role, comp_name, r, g, b, a) end

--设置特效控件的背景颜色
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_ui_effect_background_color_norm(role, comp_name, r, g, b, a) end

--设置特效控件的镜头视野
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param fov number # fov
function GameAPI.set_ui_effect_camera_fov(role, comp_name, fov) end

--设置特效控件的镜头坐标
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
---@param z number # z
function GameAPI.set_ui_effect_camera_pos(role, comp_name, x, y, z) end

--设置特效控件的镜头旋转
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param pitch number # pitch
---@param roll number # roll
---@param yaw number # yaw
function GameAPI.set_ui_effect_camera_rotation(role, comp_name, pitch, roll, yaw) end

--设置模型控件的镜头模式
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param camera_mod integer # 镜头模式
function GameAPI.set_ui_effect_camera_mode(role, comp_name, camera_mod) end

--设置特效控件的镜头焦点
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
---@param z number # z
function GameAPI.set_ui_effect_focus_pos(role, comp_name, x, y, z) end

--设置特效控件的播放速度
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param play_speed number # 播放速度
function GameAPI.set_ui_effect_play_speed(role, comp_name, play_speed) end

--【异步】获取魔法效果控件绑定的魔法效果
---@param comp_id string # 控件uid
---@return py.ModifierEntity # 魔法效果
function GameAPI.get_ui_comp_modifier(comp_id) end

--设置文本字体
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param font_name string # 字体
function GameAPI.set_ui_text_font_name(role, comp_name, font_name) end

--获取鼠标是否悬浮在UI上
---@param role py.Role # 玩家
function GameAPI.get_is_cursor_blocked_by_ui(role) end

--世界坐标转小地图坐标
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param x number # x
---@param y number # y
function GameAPI.get_minimap_node_pos_from_world_pos(role, comp_name, x, y) end

--获取ui坐标的x坐标
---@param point py.FUIPoint # 坐标
function GameAPI.get_ui_point_x(point) end

--获取ui坐标的y坐标
---@param point py.FUIPoint # 坐标
function GameAPI.get_ui_point_y(point) end

--世界坐标转小地图坐标
---@param pos py.Point # point
---@param comp_name string # 控件uid
function GameAPI.get_mini_map_node_pos_point_from_world_pos(pos, comp_name) end

--设置小地图跟随单位
---@param role py.Role # player
---@param unit py.Unit # 跟随单位
---@param view_range number # 视野范围
function GameAPI.set_mini_map_follow_unit(role, unit, view_range) end

--设置小地图右键寻路可用性
---@param comp_name string # 控件uid
---@param enabled boolean # enabled
function GameAPI.set_mini_map_move_enabled(comp_name, enabled) end

--根据图片的透明区域设置小地图点击范围
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param texture py.Texture # 图片
function GameAPI.api_enable_mini_map_alpha_click_range(role, comp_name, texture) end

--关闭根据图片的透明区域设置小地图点击范围
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
function GameAPI.api_disable_mini_map_alpha_click_range(role, comp_name) end

--在小地图上播放序列帧
---@param world_pos py.Point # 世界坐标
---@param sequence_resource py.Sequence # 序列帧资源
---@param source_player py.Role # 发送信号的玩家
---@param visible_type py.SignalVisibleType # 可见类型
---@param scale? py.Fixed # 缩放
---@param offset_percent_x? py.Fixed # X方向偏移百分比
---@param offset_percent_y? py.Fixed # Y方向偏移百分比
function GameAPI.create_frame_sequence_on_mini_map(world_pos, sequence_resource, source_player, visible_type, scale, offset_percent_x, offset_percent_y) end

--在单位的小地图头像上创建序列帧动画
---@param unit py.Unit # 单位
---@param sequence_resource py.Sequence # 序列帧资源
---@param is_loop boolean # 是否循环播放
---@param duration py.Fixed # 持续时间
function GameAPI.create_sequence_on_unit_mini_map_icon(unit, sequence_resource, is_loop, duration) end

--设置单位的序列帧类型的小地图头像
---@param unit py.Unit # 单位
---@param sequence_resource py.Sequence # 序列帧资源
---@param is_loop boolean # 是否循环播放
function GameAPI.set_unit_mini_map_sequence_icon(unit, sequence_resource, is_loop) end

--设置单位的序列帧类型的敌方小地图头像
---@param unit py.Unit # 单位
---@param sequence_resource py.Sequence # 序列帧资源
---@param is_loop boolean # 是否循环播放
function GameAPI.set_unit_enemy_mini_map_sequence_icon(unit, sequence_resource, is_loop) end

--设置小地图头像的旋转
---@param role py.Role # 玩家
---@param comp_name py.Unit # 单位
---@param rotation py.Fixed # Rotation
function GameAPI.set_mini_map_icon_rotation(role, comp_name, rotation) end

--设置UI迷雾控件遮罩大小
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param m integer # M
---@param n integer # N
function GameAPI.set_ui_fog_table_size(role, comp_uid, m, n) end

--设置UI迷雾控件遮罩表格
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param table py.Table # 遮罩表格
function GameAPI.set_ui_fog_by_table(role, comp_uid, table) end

--设置UI迷雾控件视野半径
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param radius integer # 视野半径
function GameAPI.set_ui_fog_vision_radius(role, comp_uid, radius) end

--获取本地玩家语言
---@return string # language
function GameAPI.get_local_player_language() end

--设置UI模型控件光照颜色
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param r number # R
---@param g number # G
---@param b number # B
function GameAPI.set_ui_model_sun_color(player, comp_name, r, g, b) end

--设置UI模型控件光照方向
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param rotation number # 纬度
---@param longitude number # 经度
function GameAPI.set_ui_model_sun_direction(player, comp_name, rotation, longitude) end

--获取玩家摇杆的激活状态
---@param role py.Role # 玩家
---@param comp_name string # UI控件
---@return boolean # 是否激活
function GameAPI.api_get_joystick_move_state(role, comp_name) end

--获取摇杆移动方向
---@param role py.Role # 玩家
---@param comp_name string # UI控件
---@return string # language
function GameAPI.api_get_joystick_move_direction(role, comp_name) end

--获取摇杆移动的力度
---@param role py.Role # 玩家
---@param comp_name string # UI控件
---@return string # language
function GameAPI.api_get_joystick_move_percent(role, comp_name) end

--设置UI世界聊天发送频道
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param channel integer # 频道
function GameAPI.set_ui_world_chat_box_send_channel(player, comp_name, channel) end

--设置UI世界聊天接收频道
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param channel integer # 频道
function GameAPI.set_ui_world_chat_box_recv_channel(player, comp_name, channel) end

--屏蔽世界聊天发送频道
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param channel integer # 频道
function GameAPI.ban_ui_world_chat_box_send_channel(player, comp_name, channel) end

--屏蔽世界聊天接收频道
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param channel integer # 频道
function GameAPI.ban_ui_world_chat_box_recv_channel(player, comp_name, channel) end

--设置图片保持原尺寸
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param size_adaptive boolean # 保持原尺寸
function GameAPI.set_ui_image_size_adaptive(role, comp_uid, size_adaptive) end

--设置不同状态下的按钮九宫值
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param btn_status integer # 按钮状态
---@param x_left integer # x
---@param x_right integer # y
---@param y_top integer # width
---@param y_bottom integer # height
function GameAPI.set_ui_btn_status_cap_insets(role, comp_name, btn_status, x_left, x_right, y_top, y_bottom) end

--设置文本渐变色
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
---@param hex1? string # hex
---@param a1? number # A
---@param hex2? string # hex
---@param a2? number # A
---@param hex3? string # hex
---@param a3? number # A
---@param hex4? string # hex
---@param a4? number # A
---@param enable? boolean # enable
function GameAPI.set_ui_text_gradient_color(role, comp_uid, hex1, a1, hex2, a2, hex3, a3, hex4, a4, enable) end

--添加富文本文字到输入框
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param text string # 文字
---@param color string # 颜色
---@param is_bold? boolean # 是否加粗
---@param is_underline? boolean # 是否下划线
---@param data? string # 回调数据
function GameAPI.add_rich_text_text_to_chat_box(role, comp_uid, text, color, is_bold, is_underline, data) end

--添加富文本图片到输入框
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param image_id py.Texture # 图片
function GameAPI.add_rich_text_pic_to_chat_box(role, comp_uid, image_id) end

--获取UI横向分辨率
---@return integer # 分辨率
function GameAPI.get_ui_resolution_x() end

--获取UI纵向分辨率
---@return integer # 分辨率
function GameAPI.get_ui_resolution_y() end

--镜头控件-设置镜头控件绑定镜头
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param camera_id py.Camera # 镜头
function GameAPI.set_ui_camera_binding(role, comp_uid, camera_id) end

--镜头控件-设置遮罩贴图
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param mask_texture integer # 图片id
function GameAPI.set_ui_camera_mask_texture(role, comp_uid, mask_texture) end

--复制控件文本到剪贴板
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param index1? integer # 起始索引
---@param index2? integer # 结束索引
function GameAPI.copy_ui_text_to_clipboard(role, comp_uid, index1, index2) end

--裁切节点-设置裁切节点的图片蒙版
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param stencil_texture integer # 图片id
function GameAPI.set_clipping_node_stencil_texture(role, comp_uid, stencil_texture) end

--裁切节点-设置裁切节点开启反向裁切
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param is_inverted boolean # 是否反向裁切
function GameAPI.set_clipping_node_inverted(role, comp_uid, is_inverted) end

--获取属性名
---@param attr_key string # 属性key
---@return string # 属性名
function GameAPI.api_get_attr_name(attr_key) end

--获取建造消耗
---@param entity_no py.UnitKey # 单位物编ID
---@param res_key py.RoleResKey # 玩家属性
---@return py.Fixed # 消耗数值
function GameAPI.get_build_res_cost(entity_no, res_key) end

--设置建造消耗
---@param entity_no py.UnitKey # 单位物编ID
---@param res_key py.RoleResKey # 玩家属性
---@param val py.Fixed # 消耗数值
function GameAPI.set_build_res_cost(entity_no, res_key, val) end

--获取建造时间
---@param entity_no py.UnitKey # 单位物编ID
---@return py.Fixed # 建造时间
function GameAPI.get_build_time(entity_no) end

--设置建造时间
---@param entity_no py.UnitKey # 单位物编ID
---@param build_time py.Fixed # 建造时间
function GameAPI.set_build_time(entity_no, build_time) end

--获取建造进度
---@param unit py.Unit # 单位
---@return py.Fixed # 建造进度
function GameAPI.get_construction_progress(unit) end

--设置建造进度
---@param unit py.Unit # 单位
---@param progress py.Fixed # 建造进度
function GameAPI.set_construction_progress(unit, progress) end

--获取建造速率
---@param unit py.Unit # 单位
---@return py.Fixed # 建造速率
function GameAPI.get_construction_factor(unit) end

--设置建造速率
---@param unit py.Unit # 单位
---@param factor py.Fixed # 建造速率
function GameAPI.set_construction_factor(unit, factor) end

--取消单位建造
---@param unit py.Unit # 单位
---@param return_res? boolean # 是否返还资源
function GameAPI.cancel_construction(unit, return_res) end

--取消建筑升级
---@param unit py.Unit # 单位
---@param return_res? boolean # 是否返还资源
function GameAPI.cancel_build_upgrade(unit, return_res) end

--开始建筑升级
---@param unit py.Unit # 单位
---@param upgrade_entity_no py.UnitKey # 目标单位物编ID
---@param keep_custom_kv_tag? boolean # 是否保留自定义kv
function GameAPI.start_build_upgrade(unit, upgrade_entity_no, keep_custom_kv_tag) end

--获取建筑升级列表
---@param unit py.Unit # 单位
---@return py.Table # 可升级的单位编号一维表
function GameAPI.get_build_upgrade_list(unit) end

--设置建筑升级列表
---@param unit py.Unit # 单位
---@param lua_table py.Table # 单位编号一维表
function GameAPI.set_build_upgrade_list(unit, lua_table) end

--获取建筑升级进度
---@param unit py.Unit # 单位
---@return py.Fixed # 进度
function GameAPI.get_build_upgrade_progress(unit) end

--设置建筑升级进度
---@param unit py.Unit # 单位
---@param progress py.Fixed # 进度
function GameAPI.set_build_upgrade_progress(unit, progress) end

--获取建筑升级速率
---@param unit py.Unit # 单位
---@return py.Fixed # 速率
function GameAPI.get_build_upgrade_factor(unit) end

--设置建筑升级速率
---@param unit py.Unit # 单位
---@param factor py.Fixed # 速率
function GameAPI.set_build_upgrade_factor(unit, factor) end

--开启WAR3仇恨系统：反击、救援行为过程中不再产生新的指令，其索敌通过扩展索敌范围实现
---@param b boolean # 开关
function GameAPI.set_enable_war3_threat_group(b) end

--开启WAR3中警戒强制返回特性：处于警戒状态下追逐敌人超过一定时间没有攻击到后强制移动回初始点（返回期间不攻击）
---@param b boolean # 开关
function GameAPI.set_enable_war3_caution_force_return(b) end

--开启仿WAR3的AI特性，详见set_enable_war3_threat_group、set_enable_war3_caution_force_return
---@param b boolean # 开关
function GameAPI.set_enable_war3_ai_features(b) end

--设置索敌目标。在【即将尝试索敌】或【发现目标】事件中修改索敌目标。在【即将尝试索敌】中指定目标可以跳过后续内置索敌从而节省一定性能，而在【发现目标】中修改索敌目标则不能
---@param target py.Unit # 目标
function GameAPI.set_cur_ai_target(target) end

--[性能]限制单次索敌遍历数量上限，对性能有提升。开启后索敌不再完整遍历检查警戒范围内的所有目标，而是在找到最多该数量个单位后直接退出遍历，以当前最优目标作为最终目标。可能导致索敌到的单位不是实际最优的（有其他单位距离更近、仇恨等级更高的没有被遍历到）。如果玩法对索敌准确性要求不高且性能压力较大，则建议开启。（多人游戏时需要保持同步）
---@param limit integer # 上限。小于等于0则不开启
function GameAPI.set_target_search_limit(limit) end

--[性能]限制最小索敌间隔帧数，对性能有提升。开启后，单位的每两次完整索敌之间需要间隔一定时间，期间单位会尽可能保持上个目标（除非上个目标无效了）。可能导致单位索敌更新不及时，如果玩法对索敌准确性要求不高/微操比重不高且性能压力较大，则建议开启。（多人游戏时需要保持同步）
---@param interval integer # 间隔帧数。小于等于0则不开启。（游戏默认30帧为1秒）
function GameAPI.set_search_target_keep_frame(interval) end

--[性能]简化警戒范围检测，对性能有提升。开启后会导致特定场景下索敌准确性降低（敌方单位之间移速差距较大且进出警戒范围频繁），大部分情况下副作用不明显，建议视情况开启。（多人游戏时需要保持同步）
---@param enable boolean # 是否开启
function GameAPI.set_enable_simple_attack_sensor(enable) end

--[性能]统一范围检测判定方式为碰撞半径检测，对性能有提升。由于历史原因，光环和商店的范围判定是不考虑单位自身碰撞半径的，而警戒和攻击范围的判定是考虑单位碰撞半径的，同时存在两套判定规则在一定程度上增加了性能消耗。开启此开关后会使上述的范围判定全都考虑自身碰撞半径，这样可以简化Y3内部的实现，使得游戏性能得到提升。出于兼容性考虑，此开关默认关闭。如果判断此改动无副作用的话，建议开启。（多人游戏时需要保持同步）
---@param enable boolean # 是否开启
function GameAPI.set_enable_new_sensor_rule(enable) end

--[性能]启用动态范围检测刷新频率，对性能有提升。开启后游戏会动态根据当前场上单位数量等因素调整范围检测刷新频率，避免因为计算量过大/频率过高而导致游戏卡顿。副作用为单位的警戒响应、魔法效果光环进出判定的即时性会略微降低，但如果游戏性能问题相比起来更严重，则建议开启。（多人游戏时需要保持同步）
---@param enable boolean # 是否开启
function GameAPI.set_enable_dynamic_sensor_tick_gap(enable) end

--[性能]一键设置警戒范围上限。警戒范围默认无上限，但是过大的警戒范围会增加性能消耗，尤其当这样的单位数量较多时，性能会以n^2的速度下降。这个接口可以用于一键设置警戒范围上限，游戏内的实际值会采用该值和物编配置中的较小值。一般来说警戒范围不宜超过5000。（多人游戏时需要保持同步）
---@param limit py.Fixed # 值(厘米)
function GameAPI.set_alarm_range_limit(limit) end

--[性能]限制单位AI tick量。该数值用于在单位数量较多时限制每帧tick的单位数量，避免游戏卡顿。数值越低，允许每帧tick的单位数量越少，越利于减轻游戏卡顿，但是副作用是单位的响应灵敏性会降低/攻击间隔增大。默认初始值为6000，一般来说在单位量级小于1000时副作用体感不会很明显。如果游戏卡顿可以尝试调低该值。（多人游戏时需要保持同步）
---@param limit integer # 值（初始默认值为6000）
function GameAPI.set_ai_tick_limit(limit) end

--[性能]设置索敌时是否忽略威胁优先级。默认关闭，开启后索敌时的目标优先级排序将仅考虑距离，不再考虑目标的威胁程度。开启后对于警戒范围内有大量潜在目标时的索敌性能会有极大性能提升，如果地图玩法对于威胁优先级没有严格需求则建议开启
---@param enable boolean # 是否开启
function GameAPI.set_ai_ignore_threat_priority(enable) end

--阻止单位拾取物品
---@param unit_id py.UnitID # UnitID
---@param slot_type py.SlotType # SlotType
function GameAPI.stop_unit_pick_item(unit_id, slot_type) end

--返回拾取物品的目标栏位
---@param unit_id py.ItemID # ItemID
---@param slot_type py.SlotType # SlotType
---@return py.SlotType # 目标栏位
function GameAPI.get_pick_item_slot(unit_id, slot_type) end

--获取单位某个技能位的技能类型
---@param unit_key py.UnitKey # 单位类型
---@param abilityType py.AbilityType # 技能类型
---@param abilityIndex py.AbilityIndex # 技能槽位
---@return py.AbilityKey # 技能类型
function GameAPI.api_get_abilityKey_by_unitkey(unit_key, abilityType, abilityIndex) end

--[性能] 设置是否开启空闲时lua自动gc逻辑，默认关闭lua-gc，帧率空闲时进行LUA_GCSTEP; 设置为False后可以自行控制lua-gc
---@param enable boolean # 是否开启
function GameAPI.set_enable_auto_lua_gc(enable) end

--单位组取交集
---@param unit_group1 py.UnitGroup # 单位组1
---@param unit_group2 py.UnitGroup # 单位组2
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_intersect(unit_group1, unit_group2) end

--单位组取差集
---@param unit_group1 py.UnitGroup # 单位组1
---@param unit_group2 py.UnitGroup # 单位组2
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_diff(unit_group1, unit_group2) end

--获取技能类型的释放技能
---@param ability_key py.AbilityKey # 技能物编
---@return py.AbilityCastType # 技能释放类型
function GameAPI.api_get_ability_type_cast_type(ability_key) end

--设置单次建造的模拟状态
---@param idx py.AbilityReleaseId # 整数索引值
---@param is_dry_run boolean # 是否仅模拟
function GameAPI.set_use_skill_dry_run_state(idx, is_dry_run) end

--整数转技能类型
---@param num integer # 整数
---@return py.AbilityKey # 技能物编
function GameAPI.get_ability_type_by_int(num) end

--根据技能唯一ID获取技能实例
---@param ability_global_id integer # ID
---@return py.Ability # 技能
function GameAPI.get_ability_by_ability_global_id(ability_global_id) end

--得到区域内的投射物id列表
---@param area py.Area # 区域对象
---@return py.ProjectileGroup # 物品组
function GameAPI.get_projectile_group_in_area(area) end

--得到投射物类型对应的投射物组
---@param key py.ProjectileKey # 投射物类型
---@return py.ProjectileGroup # 物品组
function GameAPI.get_projectile_group_by_key(key) end

--添加投射物到投射物组
---@param Projectile py.ProjectileEntity # 投射物
---@param Projectile_group py.ProjectileGroup # 投射物组
function GameAPI.add_projectile_to_group(Projectile, Projectile_group) end

--获取投射物的所属玩家
---@param project py.ProjectileEntity # 投射物
---@return py.Role # 玩家
function GameAPI.get_role_of_projectile(project) end

--改变投射物所属玩家
---@param projectile py.ProjectileEntity # 投射物
---@param player py.Actor # 玩家
function GameAPI.change_projectile_owner_player(projectile, player) end

--创建空投射物组
---@return py.ProjectileGroup # 投射物组
function GameAPI.create_projectile_group() end

--获取投射物组数量
---@param projectile_group py.ProjectileGroup # 投射物组
---@return integer # 数量
function GameAPI.get_projectile_group_nums(projectile_group) end

--投射物组取交集
---@param group1 py.ProjectileGroup # 投射物组1
---@param group2 py.ProjectileGroup # 投射物组2
---@return py.ProjectileGroup # 投射物组
function GameAPI.get_projectile_group_intersection(group1, group2) end

--投射物组取差集
---@param group1 py.ProjectileGroup # 投射物组1
---@param group2 py.ProjectileGroup # 投射物组2
---@return py.ProjectileGroup # 投射物组
function GameAPI.get_projectile_group_diff(group1, group2) end

--设置装饰物显隐
---@param deco_id py.DecoID # 装饰物ID
---@param visible boolean # 是否显隐
function GameAPI.set_deco_visible(deco_id, visible) end

--设置装饰物对玩家显隐
---@param deco_id py.DecoID # 装饰物ID
---@param player py.Role # 玩家
---@param visible boolean # 是否显隐
function GameAPI.set_deco_visible_new(deco_id, player, visible) end

--装饰物替换模型贴图
---@param deco_id py.DecoID # 装饰物ID
---@param material_id integer # 材质 id
---@param layer_id integer # layer id
---@param texture py.Texture # 贴图
function GameAPI.set_deco_texture(deco_id, material_id, layer_id, texture) end

--创建装饰物
---@param point py.FVector3 # 位置
---@param deco_type py.DecoKey # 装饰物类型
---@param angle py.Fixed # 角度
---@param height_offset? py.Fixed # 高度
---@return py.DecoID # 创建出的装饰物id
function GameAPI.create_deco(point, deco_type, angle, height_offset) end

--删除装饰物
---@param deco_id py.DecoID # 装饰物id
function GameAPI.delete_deco(deco_id) end

--设置鼠标挂接物
---@param _type integer # 类型
---@param entity_no integer # 模型/特效id
---@param role py.Role # 玩家
function GameAPI.set_mouse_follower(_type, entity_no, role) end

--取消鼠标挂接物
---@param role py.Role # 玩家
function GameAPI.cancel_mouse_follower(role) end

--设置鼠标挂接物的偏移
---@param role py.Role # 玩家
---@param offset_x number # 偏移X
---@param offset_y number # 偏移Y
---@param offset_z number # 偏移Z
function GameAPI.set_mouse_follower_offset(role, offset_x, offset_y, offset_z) end

--设置鼠标挂接物的旋转角度
---@param role py.Role # 玩家
---@param rotation_x number # X
---@param rotation_y number # Y
---@param rotation_z number # Z
function GameAPI.set_mouse_follower_rotation(role, rotation_x, rotation_y, rotation_z) end

--设置鼠标挂接物的缩放比列
---@param role py.Role # 玩家
---@param scale_x number # X
---@param scale_y number # Y
---@param scale_z number # Z
function GameAPI.set_mouse_follower_scale(role, scale_x, scale_y, scale_z) end

--设置鼠标挂接物的动画速度
---@param role py.Role # 玩家
---@param anim_speed number # 速度
function GameAPI.set_mouse_follower_anim_speed(role, anim_speed) end

--设置鼠标挂接物模型播放动画
---@param role py.Role # 玩家
---@param anim_name string # 动画名
---@param anim_speed? number # 动画速率
---@param start_time? number # 开始时间
---@param end_time? number # 结束时间
---@param is_loop? boolean # 是否循环播放
---@param is_back_to_default? boolean # 是否回到默认动画
function GameAPI.set_mouse_follower_model_anim(role, anim_name, anim_speed, start_time, end_time, is_loop, is_back_to_default) end

--设置建造指示器移动格子数
---@param x py.RoleID # 玩家ID
---@param y py.UnitGroup # 单位组
function GameAPI.set_build_pointer_move_grids(x, y) end

--设置建造指示器移动格子数偏移
---@param x integer # X偏移
---@param y integer # Y偏移
function GameAPI.set_build_pointer_move_grids_offset(x, y) end

--当前是否为观战模式
---@return boolean # 是否为观战模式
function GameAPI.is_in_watch_mode() end

--获取当前被观战的玩家
---@return py.RoleID # 被观战玩家
function GameAPI.get_cur_watching_player() end

--获取观战状态
---@return py.WatchingModeStatus # 观战模式状态
function GameAPI.get_watching_mode_status() end

--模拟指定玩家
---@param role py.Role # 模拟的玩家
function GameAPI.set_watcher_simulate_player(role) end

--禁用/启用切换被观战玩家按键
---@param enable boolean # 是否可以切换被观战玩家
function GameAPI.enable_switch_watch_player_shortcut(enable) end

--获取玩家选中的单个单位
---@param role_id py.RoleID # 玩家ID
function GameAPI.api_get_select_unit_single(role_id) end

--获取玩家选中的第一个单位
---@param role_id py.RoleID # 玩家ID
function GameAPI.api_get_select_unit_first(role_id) end

--获取玩家选中单位组(单位ID列表)
---@param role_id py.RoleID # 玩家ID
function GameAPI.api_get_select_unit_group(role_id) end

--获取玩家是否按下命令队列按键
---@param role py.RoleID # 玩家ID
---@return boolean # 是否按下
function GameAPI.is_command_queue_key_down(role) end

--获取命令队列功能是否开启
---@return boolean # 是否开启
function GameAPI.is_command_queue_enabled() end

--玩家组取交集
---@param group1 py.RoleGroup # 玩家组1
---@param group2 py.RoleGroup # 玩家组2
---@return py.RoleGroup # 玩家组
function GameAPI.api_get_role_group_intersection(group1, group2) end

--玩家组取差集
---@param group1 py.RoleGroup # 玩家组1
---@param group2 py.RoleGroup # 玩家组2
---@return py.RoleGroup # 玩家组
function GameAPI.api_get_role_group_diff(group1, group2) end

--查询副本信息
---@return py.Table # 副本信息
function GameAPI.get_dungeon_info() end

--距离最近的带标签单位
---@param position py.Point # 位置
---@param tag_idx integer # 标签ID
---@param check_alive boolean # 检查存活
---@return py.UnitID # 单位ID
function GameAPI.get_h_nearest_unit_with_quick_tag(position, tag_idx, check_alive) end

--获取带标签的单位id列表
---@param tag_idx integer # 标签ID
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_ids_with_quick_tag(tag_idx) end

--平台外部服务器设置接口
---@param aes_key string # AESKey
---@param public_key string # PublicKey
---@param external_url string # ExternalUrl
function GameAPI.init_external_http_config(aes_key, public_key, external_url) end

--平台外部连接登录
---@param api_path string # 外部API路径
---@param external_data string # 自定义数据
---@return boolean # 调用结果
function GameAPI.platform_http_login(api_path, external_data) end

--平台外部http请求
---@param api string # 外部API路径
---@param is_post boolean # 是否是post请求
---@param data string # body数据
---@param disable_in_connect? boolean # 是否禁用在connect中
---@return string # 调用结果
function GameAPI.platform_http_request(api, is_post, data, disable_in_connect) end

--读取服务器随机数的值
---@param role py.Role # 玩家
---@param archive_id string # 随机存档id
---@return integer # 随机数的值
function GameAPI.get_random_archive_value(role, archive_id) end

--读取服务器随机数的时间戳
---@param role py.Role # 玩家
---@param archive_id string # 随机存档id
---@return integer # 时间戳
function GameAPI.get_random_archive_timestamp(role, archive_id) end

--读取服务器随机数的组id
---@param role py.Role # 玩家
---@param archive_id string # 随机存档id
---@return integer # 组id
function GameAPI.get_random_archive_group_id(role, archive_id) end

--获取指定只读随机存档的每日剩余次数
---@param role py.Role # 玩家
---@param group_id integer # 组id
---@return integer # 剩余次数
function GameAPI.get_random_archive_daily_remain(role, group_id) end

--获取指定只读随机存档的每局剩余次数
---@param role py.Role # 玩家
---@param group_id integer # 组id
---@return integer # 剩余次数
function GameAPI.get_random_archive_game_remain(role, group_id) end

--获取存档剩余次数
---@param role py.Role # 玩家
---@param archive_key integer # 整数存档
---@return integer # 存档剩余值
function GameAPI.get_role_map_archive_limit(role, archive_key) end

--获取当前地图AI随机种子
---@return integer # 随机种子
function GameAPI.api_get_ai_random_seed() end

--设置下个场景的初始化镜头
---@param camera py.Camera # 镜头配置
function GameAPI.api_set_preload_cam(camera) end

--设置镜头跟随单位缓动
---@param role py.Role # 玩家
---@param enable boolean # 缓动开关
---@param inertia_coeff? py.Fixed # 缓动速率
function GameAPI.set_follow_placer_enable_inertia(role, enable, inertia_coeff) end

--设置镜头碰撞参数
---@param role py.Role # 玩家
---@param enable_collider boolean # 碰撞开关
---@param MinDist number # 最小焦距
---@param SmoothRatio? number # 过度速率
function GameAPI.camera_set_param_collide(role, enable_collider, MinDist, SmoothRatio) end

--设置镜头碰撞参数
---@param role py.Role # 玩家
---@param radius number # 最小焦距
function GameAPI.camera_set_param_collide_radius(role, radius) end

--设置tps镜头pitch上限
---@param role py.Role # 玩家
---@param pitch number # tps pitch上限
function GameAPI.set_tps_camera_pitch_max(role, pitch) end

--设置tps镜头pitch下限
---@param role py.Role # 玩家
---@param pitch number # tps pitch下限
function GameAPI.set_tps_camera_pitch_min(role, pitch) end

--设置tps镜头fov
---@param role py.Role # 玩家
---@param fov number # tps fov
function GameAPI.set_tps_camera_fov(role, fov) end

--镜头景深功能
---@param enable boolean # 景深开关
---@param dist number # 景深开始距离
---@param region number # 景深大小
---@param near_trans_region number # 近处过渡距离
---@param far_trans_region number # 远处过渡距离
function GameAPI.set_camera_dof(enable, dist, region, near_trans_region, far_trans_region) end

--世界坐标转换屏幕坐标
---@param world_pos py.Point # 世界坐标
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_camera_pos_2d(world_pos) end

--世界坐标转换屏幕边缘坐标
---@param world_pos py.Point # 世界坐标
---@param delta_dis py.Fixed # 定点数
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_screen_edge_pos_2d(world_pos, delta_dis) end

--获取本地玩家镜头焦点
---@return py.FVector3 # 镜头焦点
function GameAPI.get_local_player_camera_focus() end

--获取字符串的md5值
---@param original_str string # 原始字符串
---@return string # md5值
function GameAPI.api_get_string_md5(original_str) end

--生成RSA密钥对
---@return py.List # 公钥和私钥
function GameAPI.generate_rsa_keys() end

--使用公钥加密消息
---@param public_key string # 公钥
---@param message string # 原始消息
---@return string # 加密后的消息
function GameAPI.rsa_encrypt_message(public_key, message) end

--使用私钥解密消息
---@param private_key string # 私钥
---@param encrypted_message string # 加密后的消息
---@return string # 解密后的消息
function GameAPI.rsa_decrypt_message(private_key, encrypted_message) end

--调试-绘制球形
---@param x py.Fixed # x坐标
---@param y py.Fixed # y坐标
---@param z py.Fixed # z坐标
---@param radius py.Fixed # 半径
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@return integer # 绘制id
function GameAPI.debug_draw_sphere(x, y, z, radius, duration, color) end

--调试-绘制圆柱
---@param point py.Point # 底部中心点
---@param radius py.Fixed # 半径
---@param height py.Fixed # 高度
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@return integer # 绘制id
function GameAPI.debug_draw_cylinder(point, radius, height, duration, color) end

--调试-绘制立方体
---@param rect py.RecArea # 矩形区域
---@param height py.Fixed # 高度
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@return integer # 绘制id
function GameAPI.debug_draw_box(rect, height, duration, color) end

--调试-绘制线段
---@param point1_x py.Fixed # x1坐标
---@param point1_y py.Fixed # y1坐标
---@param point1_z py.Fixed # z1坐标
---@param point2_x py.Fixed # x2坐标
---@param point2_y py.Fixed # y2坐标
---@param point2_z py.Fixed # z2坐标
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@return integer # 绘制id
function GameAPI.debug_draw_polyline(point1_x, point1_y, point1_z, point2_x, point2_y, point2_z, duration, color) end

--调试-删除绘制
---@param shape_id integer # 绘制id
function GameAPI.delete_debug_draw(shape_id) end

--调试-绘制区域-圆形
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 圆形
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@param attach_unit? py.Unit # 挂接单位
---@return integer # 绘制id
function GameAPI.debug_draw_filter_area_circular(pos, shape, duration, color, attach_unit) end

--调试-绘制区域-扇形
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 扇形
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@param attach_unit? py.Unit # 挂接单位
---@return integer # 绘制id
function GameAPI.debug_draw_filter_area_sector(pos, shape, duration, color, attach_unit) end

--调试-绘制区域-环形
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 环形
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@param attach_unit? py.Unit # 挂接单位
---@return integer # 绘制id
function GameAPI.debug_draw_filter_area_annular(pos, shape, duration, color, attach_unit) end

--调试-绘制区域-矩形
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 矩形
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
---@param attach_unit? py.Unit # 挂接单位
---@return integer # 绘制id
function GameAPI.debug_draw_filter_area_rect(pos, shape, duration, color, attach_unit) end

--打开uimodule
---@param model_id integer # modelid
function GameAPI.open_ui_module_panel(model_id) end

--初始化玩家图鉴
---@param role py.Role # 玩家
---@param table py.Table # 图鉴表
function GameAPI.init_user_card_panel(role, table) end

--初始化玩家图鉴
---@param role py.Role # 玩家
---@param filter_type string # 類型
function GameAPI.filter_user_card_panel(role, filter_type) end

--设置特效到三维坐标
---@param sfx_entity py.Sfx # 特效
---@param point py.FVector3 # 位置
---@param fluent_move? boolean # 平滑移动
function GameAPI.set_sfx_position_3d(sfx_entity, point, fluent_move) end

--修改游戏速度
---@param time_scale py.Fixed # name
function GameAPI.api_change_time_scale(time_scale) end

--开关profile功能
---@param enable boolean # enable
function GameAPI.api_enable_profile(enable) end

--创建单位
---@param key py.UnitKey # 单位编号
---@param pos py.FVector3 # 位置
---@param angle py.Fixed # 朝向
---@param role_or_unit py.Role # 所属玩家
---@param lua_table? py.Table # 用户自定义配置表
---@return py.Unit # 创建出的单位
function GameAPI.create_unit_new(key, pos, angle, role_or_unit, lua_table) end

--创建本地单位
---@param key py.UnitKey # 单位编号
---@param pos py.FVector3 # 位置
---@param face py.Fixed # 朝向
---@return py.LocalUnit # 创建出的单位
function GameAPI.create_local_unit(key, pos, face) end

--创建幻象
---@param clone_unit py.Unit # 复制目标
---@param caller_unit py.Unit # 召唤者
---@param role py.Role # 玩家
---@param pos py.FVector3 # 位置
---@param angle py.Fixed # 朝向
---@param clone_hp_mp? boolean # 是否继承生命与魔法
---@param clone_items? boolean # 是否继承物品
function GameAPI.create_illusion_new(clone_unit, caller_unit, role, pos, angle, clone_hp_mp, clone_items) end

--新建空玩家组
---@return py.RoleGroup # 玩家组
function GameAPI.create_role_group() end

--根据单位ID获取本地单位
---@param unit_id py.LocalUnitID # 单位id
---@return py.LocalUnit # 本地单位
function GameAPI.get_local_unit_by_id(unit_id) end

--直接返回装饰物id
---@param deco_id py.DecoID # 装饰物id
---@return py.DecoID # 装饰物id
function GameAPI.get_deco_by_id(deco_id) end

--创建角色顶光到单位挂接点
---@param unit py.Unit # 单位
---@param socket_name string # 挂节点
---@param pos_offset_y? py.Fixed # 起点偏移高度
---@param target? py.Actor # 朝向目标
---@param target_offset_y? py.Fixed # 朝向目标偏移高度
---@param need_shadow? boolean # 是否产生阴影
---@return py.SpotLight # 方向光源
function GameAPI.create_character_top_light_to_unit_socket(unit, socket_name, pos_offset_y, target, target_offset_y, need_shadow) end

--本地单位组内第一个单位
---@param units py.LocalUnitGroup # 单位组
---@return py.LocalUnit # 第一个单位
function GameAPI.get_first_unit_in_local_group(units) end

--本地单位组内最后一个单位
---@param units py.LocalUnitGroup # 单位组
---@return py.LocalUnit # 最后一个单位
function GameAPI.get_last_unit_in_local_group(units) end

--本地单位组内单位数量
---@param unit_group py.LocalUnitGroup # 单位组
---@return integer # 单位数量
function GameAPI.get_local_unit_group_num(unit_group) end

--遍历时过滤物品组
---@param item_group py.ItemGroup # 物品组
---@return py.ItemGroup # 物品组
function GameAPI.refresh_item_group(item_group) end

--删除本地单位组中某个单位
---@param unit_group py.LocalUnitGroup # 单位组
---@param unit py.LocalUnit # 单位
function GameAPI.remove_unit_in_local_group(unit_group, unit) end

--返回圆形范围内随机点
---@param point py.FVector3 # 圆心
---@param radius py.Fixed # 半径
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_circular(point, radius) end

--获取指定形状内的所有物品新
---@param point py.Point # 区域对象
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 排序类型
---@param filter_ability? py.Ability # 筛选技能
---@return py.ItemGroup # 物品组
function GameAPI.get_all_items_in_shapes_new(point, shape, sort_type, filter_ability) end

--新建空单位组
---@return py.UnitGroup # 单位组
function GameAPI.create_unit_group() end

--添加单位到本地单位组
---@param unit py.LocalUnit # 单位
---@param unit_group py.LocalUnitGroup # 本地单位组
function GameAPI.add_unit_to_local_group(unit, unit_group) end

--本地单位组是否存在
---@param unit_group py.LocalUnitGroup # 本地单位组
---@return boolean # 是否存在
function GameAPI.local_unit_group_is_exist(unit_group) end

--触发器是否存在
---@param trigger_id py.DynamicTriggerInstance # 动态触发器实例
---@return boolean # 是否存在
function GameAPI.trigger_is_exist(trigger_id) end

--运动器是否存在
---@param mover_id py.Mover # 运动器实例
---@return boolean # 是否存在
function GameAPI.mover_is_exist(mover_id) end

--对象是否存在
---@param obj py.DynamicTypeMeta # 对象
---@return boolean # 是否存在
function GameAPI.common_is_exist(obj) end

--生成漂浮文字
---@param point py.Point # 点
---@param text_type string # 跳字枚举
---@param value string # 跳字内容
---@param player_group py.RoleGroup # 玩家组
---@param jump_word_track? integer # 跳字轨迹
function GameAPI.create_harm_text_ex(point, text_type, value, player_group, jump_word_track) end

--设置场景ui的位置到场景点
---@param scene_node py.SceneNode # 场景点
---@param point py.Point # 点
---@param visible_dis? number # 可见距离
---@param height_offset? number # 离地高度
function GameAPI.set_scene_node_to_point(scene_node, point, visible_dis, height_offset) end

--创建场景点并绑定UI到单位
---@param comp_name string # 控件名
---@param player py.Role # 玩家
---@param unit py.Unit # 单位
---@param socket_name string # 挂接点
---@param socket_offset_follow_model_scale boolean # 挂接点偏移跟随模型缩放
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_unit_ex(comp_name, player, unit, socket_name, socket_offset_follow_model_scale, visible_dis) end

--创建场景点并绑定UI到单位
---@param comp_name string # 控件名
---@param player py.Role # 玩家
---@param unit py.Unit # 单位
---@param socket_name string # 挂接点
---@param socket_offset_follow_model_scale boolean # 挂接点偏移跟随模型缩放
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_unit_new(comp_name, player, unit, socket_name, socket_offset_follow_model_scale, visible_dis) end

--获取本地玩家id
---@return string # 玩家id
function GameAPI.get_client_role_id() end

--玩家是否回流
---@param role py.Role # 玩家
---@return boolean # 是否为回流玩家
function GameAPI.is_returning_player(role) end

--获取玩家上次安利墙的时间
---@param role py.Role # 玩家
---@return integer # 玩家上次安利墙的时间
function GameAPI.get_player_last_recommend_time(role) end

--获取玩家平台头像URL
---@param role py.Role # 玩家
---@return integer # 图片ID
function GameAPI.get_role_platform_url(role) end

--设置血条整体可见性
---@param unit py.Unit # 单位
---@param visibility boolean # 可见性
---@param role? py.Role # 玩家
function GameAPI.set_billboard_overall_visibility(unit, visibility, role) end

--重置血条的整体可见性
---@param unit py.Unit # 单位
---@param role? py.Role # 玩家
function GameAPI.reset_billboard_overall_visibility(unit, role) end

--设置血条中进度条控件的进度条图片
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param icon_id py.Texture # 图片
---@param role? py.Role # 玩家
function GameAPI.set_billboard_picture_group(unit, node_name, icon_id, role) end

--请求购买平台道具
---@param role py.Role # 玩家
---@param store_key py.StoreKey # 平台道具类型
function GameAPI.open_platform_shop(role, store_key) end

--平台道具是否相等
---@param store_key1 py.StoreKey # 平台道具
---@param store_key2 py.StoreKey # 平台道具
---@return boolean # 是否相等
function GameAPI.api_compare_store_key(store_key1, store_key2) end

--上传反作弊数值统计
---@param role py.Role # 玩家
---@param args py.List # 自定义参数
---@return string # 玩家全量昵称
function GameAPI.save_anticheat_data(role, args) end

--剔除字符串内富文本信息
---@param rich_text string # 富文本
---@return string # 普通文本
function GameAPI.get_plain_text_from_rich_text(rich_text) end

--点是否在范围内
---@param check_point py.Point # 待检查的点
---@param center_point py.Point # 中心点
---@param shape py.Shape # 范围
---@return boolean # 布尔值
function GameAPI.api_is_point_in_shape(check_point, center_point, shape) end

--保底伪随机数Roll点
---@param event_name string # 事件名
---@param event_odds number # 期望概率(百分数)
---@return boolean # 布尔值
function GameAPI.api_get_pseudo_random(event_name, event_odds) end

--广播本地消息
---@param msg_id string # msg_id
---@param msg_content string # msg_content
function GameAPI.api_broadcast_msg(msg_id, msg_content) end

--遍历魔法效果的得到特效
---@param modifier_entity py.ModifierEntity # 魔法效果
---@return py.List # 特效idList
function GameAPI.refresh_get_effect_on_modifier(modifier_entity) end

--遍历魔法效果的失去特效
---@param modifier_entity py.ModifierEntity # 魔法效果
---@return py.List # 特效idList
function GameAPI.refresh_loss_effect_on_modifier(modifier_entity) end

--获得遍历到的特效
---@param effect_id string # 特效ID拼接Str
---@return py.Sfx # 特效实体
function GameAPI.get_effect_on_modifier(effect_id) end

--遍历魔法效果的挂接模型
---@param modifier_entity py.ModifierEntity # 魔法效果
---@return py.List # 挂接模型idList
function GameAPI.refresh_attach_model_on_modifier(modifier_entity) end

--获得遍历到的模型
---@param attach_model_id string # 模型ID拼接Str
---@return string # 模型ID拼接Str
function GameAPI.get_attach_model_on_modifier(attach_model_id) end

--背包类型转字符串
---@param slot_type py.SlotType # 背包类型
---@return string # 字符串
function GameAPI.slot_type_to_str(slot_type) end

--挂接模型实体转字符串
---@param attach_model_id string # 模型ID拼接Str
---@return string # 字符串
function GameAPI.attach_model_entity_to_str(attach_model_id) end

--播放动画
---@param attach_model_id string # 模型ID拼接Str
---@param name string # 动画名称
---@param rate? number # 播放倍率
---@param init_time? number # 开始时间(s)
---@param end_time? number # 结束时间(s)，正数 -1 表示不结束
---@param loop? boolean # 是否循环
---@param return_idle? boolean # 播放结束后是否恢复idle
function GameAPI.play_attach_model_animation(attach_model_id, name, rate, init_time, end_time, loop, return_idle) end

--停止播放动画
---@param attach_model_id string # 模型ID拼接Str
---@param name string # 动画名称
function GameAPI.stop_attach_model_animation(attach_model_id, name) end

--获取属性自动恢复间隔
function GameAPI.api_get_autorec_interval() end

--获取物编名称/描述多语言key
---@param data_key string # 物编类型
---@param entity_id integer # 物编对象
---@param name_or_desc string # 名称/描述
---@return string # 多语言key
function GameAPI.get_object_multilingual_key(data_key, entity_id, name_or_desc) end

--设置快捷施法
---@param role py.Role # 玩家
---@param is_on boolean # 是否开启
function GameAPI.set_common_atk_quick_cast(role, is_on) end

--创建单位到点闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_unit py.Unit # 起点单位
---@param source_socket string # 起点单位挂接点名称
---@param target_point py.FVector3 # 终点
---@param target_height py.Fixed # 终点高度
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@param show_in_fog? boolean # 迷雾中显示
---@param blend_with_fog? boolean # 迷雾混合
---@param follow_change_position? boolean # 跟随模型缩放改变位置
---@param follow_change_size? boolean # 跟随模型缩放改变尺寸
---@param speed? number # 播放速度
---@param x_scale? number # x轴缩放
---@param y_scale? number # y轴缩放
---@param z_scale? number # z轴缩放
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_unit_to_point1(sfx_res_id, source_unit, source_socket, target_point, target_height, duration, immediately, use_sys_d_destroy_way, show_in_fog, blend_with_fog, follow_change_position, follow_change_size, speed, x_scale, y_scale, z_scale) end

--创建单位到单位闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_unit py.Unit # 起点单位
---@param source_socket string # 起点单位挂接点名称
---@param target_unit py.Unit # 终点单位
---@param target_socket string # 起点单位挂接点名称
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@param show_in_fog? boolean # 迷雾中显示
---@param blend_with_fog? boolean # 迷雾混合
---@param follow_change_position? boolean # 跟随模型缩放改变位置
---@param follow_change_size? boolean # 跟随模型缩放改变尺寸
---@param speed? number # 播放速度
---@param x_scale? number # x轴缩放
---@param y_scale? number # y轴缩放
---@param z_scale? number # z轴缩放
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_unit_to_unit1(sfx_res_id, source_unit, source_socket, target_unit, target_socket, duration, immediately, use_sys_d_destroy_way, show_in_fog, blend_with_fog, follow_change_position, follow_change_size, speed, x_scale, y_scale, z_scale) end

--创建点到单位闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_point py.FVector3 # 起点
---@param source_height py.Fixed # 起点高度
---@param source_unit py.Unit # 终点单位
---@param source_socket string # 起点单位挂接点名称
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@param show_in_fog? boolean # 迷雾中显示
---@param blend_with_fog? boolean # 迷雾混合
---@param speed? number # 播放速度
---@param x_scale? number # x轴缩放
---@param y_scale? number # y轴缩放
---@param z_scale? number # z轴缩放
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_point_to_unit1(sfx_res_id, source_point, source_height, source_unit, source_socket, duration, immediately, use_sys_d_destroy_way, show_in_fog, blend_with_fog, speed, x_scale, y_scale, z_scale) end

--创建点到点闪电特效
---@param sfx_res_id py.SfxKey # 特效编号
---@param source_point py.FVector3 # 起点
---@param source_height py.Fixed # 起点高度
---@param target_point py.FVector3 # 终点
---@param target_height py.Fixed # 终点高度
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@param show_in_fog? boolean # 迷雾中显示
---@param blend_with_fog? boolean # 迷雾混合
---@param speed? number # 播放速度
---@param x_scale? number # x轴缩放
---@param y_scale? number # y轴缩放
---@param z_scale? number # z轴缩放
---@return py.LinkSfx # 特效
function GameAPI.create_link_sfx_from_point_to_point1(sfx_res_id, source_point, source_height, target_point, target_height, duration, immediately, use_sys_d_destroy_way, show_in_fog, blend_with_fog, speed, x_scale, y_scale, z_scale) end

--创建特效到单位附加点（跟随旋转使用枚举）
---@param sfx_id py.SfxKey # 特效编号
---@param unit py.Unit # 单位
---@param socket string # 单位挂接点
---@param rotate_type integer # 跟随旋转方式
---@param speed? number # 播放速度
---@param duration? number # 持续时间
---@param angle? number # 角度
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@param detach? boolean # 是否脱离单位
---@param show_in_fog? boolean # 迷雾里显示
---@param blend_with_fog? boolean # 迷雾混合
---@param scale_x? number # x轴缩放
---@param scale_y? number # y轴缩放
---@param scale_z? number # z轴缩放
---@param follow_change_position? boolean # 跟随模型缩放改变位置
---@param follow_change_scale? boolean # 跟随模型缩放改变尺寸
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_unit_3(sfx_id, unit, socket, rotate_type, speed, duration, angle, immediately, use_sys_d_destroy_way, detach, show_in_fog, blend_with_fog, scale_x, scale_y, scale_z, follow_change_position, follow_change_scale) end

--设置闪电特效缩放
---@param sfx_entity py.LinkSfx # 特效
---@param scale_x number # x轴缩放
---@param scale_y number # y轴缩放
---@param scale_z number # z轴缩放
---@param duration? number # 过渡时间
function GameAPI.set_link_sfx_scale(sfx_entity, scale_x, scale_y, scale_z, duration) end

--设置闪电特效动画速度
---@param sfx_entity py.LinkSfx # 特效
---@param speed number # 动画速度
function GameAPI.set_link_sfx_animation_speed(sfx_entity, speed) end

--【异步】获取本地玩家网格列表当前百分比位置
---@param comp_name string # 控件uid
---@param direction integer # 横向/纵向
---@return number # 百分比
function GameAPI.get_grid_view_percent(comp_name, direction) end

--设置UI迷雾控件模糊度
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param blur integer # 模糊度
function GameAPI.set_ui_fog_blur_radius(role, comp_uid, blur) end

--设置UI迷雾控件迷雾坐标和半径
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param pos_x number # 坐标X
---@param pos_y number # 坐标Y
---@param radius integer # 视野半径
function GameAPI.set_ui_fog_pos_and_radius(role, comp_uid, pos_x, pos_y, radius) end

--设置UI迷雾控件被点击的控件和半径
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param clicked_comp_uid string # 被点击控件uid
---@param radius integer # 视野半径
function GameAPI.set_ui_fog_clicked_comp_and_radius(role, comp_uid, clicked_comp_uid, radius) end

--界面-创建画布
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
function GameAPI.create_layer(role, comp_uid) end

--界面-删除画布
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
function GameAPI.del_layer(role, comp_uid) end

--设置文本删除线
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param enable boolean # 开关
---@param width? integer # 粗细
---@param color? string # hex
---@param alpha? number # A
function GameAPI.set_ui_text_strike_through(role, comp_name, enable, width, color, alpha) end

--设置文本下划线
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param enable boolean # 开关
function GameAPI.set_ui_text_under_line(role, comp_name, enable) end

--设置文本斜体
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param enable boolean # 开关
---@param radius? number # 倾斜程度
function GameAPI.set_ui_text_italics(role, comp_name, enable, radius) end
