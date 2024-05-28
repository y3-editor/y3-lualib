-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--判断单位敌对关系
---@param unit1 py.Unit # 单位
---@param unit2 py.Unit # 单位
---@return boolean # 是否敌对
function GameAPI.is_enemy(unit1, unit2) end

--判断单位友军关系
---@param unit1 py.Unit # 单位
---@param unit2 py.Unit # 单位
---@return boolean # 是否友军
function GameAPI.is_ally(unit1, unit2) end

--玩家或单位是否拥有单位的可见性
---@param role_or_unit py.Role # 玩家
---@param unit py.Unit # 单位
---@return boolean # 是否可见
function GameAPI.get_visibility_of_unit(role_or_unit, unit) end

--玩家是否加入游戏
---@param role py.Role # 玩家
---@return boolean # 玩家是否加入游戏
function GameAPI.role_in_game(role) end

--玩家是否拥有收费道具
---@param role py.Role # 玩家
---@param no py.StoreKey # 收费道具key
---@return boolean # 玩家是否拥有收费道具
function GameAPI.role_has_store_item(role, no) end

--玩家下载存档是否回调
---@param role py.Role # 玩家
---@return boolean # 玩家下载存档是否回调
function GameAPI.has_download_save_data_callback(role) end

--获取最近创建的物品
---@return py.Item # 物品对象
function GameAPI.get_last_created_item() end

--创建物品
---@param position py.FVector3 # 位置
---@param num integer # 数量
---@param eid py.ItemKey # 物品编号
---@param player py.Role # 所属玩家
function GameAPI.create_items(position, num, eid, player) end

--根据id获取物品
---@param id py.ItemID # 物品ID
---@return py.Item # 物品
function GameAPI.get_item(id) end

--根据物品id获取物品
---@param item_unit_id integer # unit_id
---@return py.Item # 物品
function GameAPI.get_item_by_unit_id(item_unit_id) end

--获取物品配置名称
---@param key py.ItemKey # item_id
---@return string # 物品名称
function GameAPI.get_item_conf_name(key) end

--创建单个物品
---@param position py.FVector3 # 位置
---@param item_key py.ItemKey # 物品编号
---@param player py.Role # 所属玩家
---@param lua_table? py.Table # 用户自定义配置表
---@return py.Item # 创建出的物品
function GameAPI.create_item_by_id(position, item_key, player, lua_table) end

--根据ID获取图片
---@param icon_id integer # 图片ID
---@return py.Texture # 图片
function GameAPI.get_texture_by_icon_id(icon_id) end

--根据图片获取ID
---@param texture py.Texture # 图片
---@return integer # 图片ID
function GameAPI.get_icon_id_by_texture(texture) end

--刷新触发器
function GameAPI.refresh_triggers() end

--激活Lua动态触发器
---@param lua_conf py.Dict # Lua触发器
function GameAPI.enable_global_lua_trigger(lua_conf) end

--根据预设id获取可破坏物
---@param dest_unit_id py.DestructibleID # 预设可破坏物unit_id
---@return py.Destructible # 可破坏物
function GameAPI.get_dest_by_id(dest_unit_id) end

--获取可破坏物类型
---@param dest py.Destructible # 可破坏物
---@return py.DestructibleKey # 可破坏物类型
function GameAPI.get_dest_type(dest) end

--判断可破坏物是否在区域中
---@param dest_id py.Destructible # 可破坏物
---@param area py.Area # 区域
---@return boolean # 布尔值
function GameAPI.is_dest_in_area(dest_id, area) end

--创建可破坏物
---@param location py.FVector3 # 位置
---@param dest_key py.DestructibleKey # 物品编号
---@param angle py.Fixed # 面向角度
---@param size number # 大小
---@return py.Destructible # 创建出的可破坏物
function GameAPI.create_destructible(location, dest_key, angle, size) end

--创建可破坏物
---@param dest_key py.DestructibleKey # 物品编号
---@param location py.FVector3 # 位置
---@param angle py.Fixed # 面向角度
---@param scale_x? py.Fixed # 缩放x
---@param scale_y? py.Fixed # 缩放y
---@param scale_z? py.Fixed # 缩放z
---@param height_offset? py.Fixed # 高度
---@param lua_table? py.Table # 用户自定义配置表
---@return py.Destructible # 创建出的可破坏物
function GameAPI.create_destructible_new(dest_key, location, angle, scale_x, scale_y, scale_z, height_offset, lua_table) end

--获取区域内的可破坏物列表
---@param area py.Area # 区域对象
---@param sort_type? py.SortType # 筛选规则
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_area(area, sort_type) end

--获取点范围内的可破坏物列表
---@param point py.Point # 区域对象
---@param rng number # 半径
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_point_rng(point, rng) end

--获取不同形状范围内的可破坏物列表
---@param point py.Point # 区域对象
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 筛选规则
---@return py.List # 可破坏物列表
function GameAPI.get_all_dest_in_shapes(point, shape, sort_type) end

--创建镜头
---@param focus_point py.FVector3 # 点
---@param dis number # 焦距
---@param focus_y? number # 焦点高度
---@param yaw? number # yaw
---@param pitch? number # pitch
---@param fov? number # fov
---@return integer # 镜头ID
function GameAPI.add_camera_conf(focus_point, dis, focus_y, yaw, pitch, fov) end

--应用镜头配置
---@param role py.Role # 玩家
---@param conf_id py.Camera # 镜头配置
---@param duration number # 过渡时间
---@param slope_mode? integer # 镜头移动类型
function GameAPI.apply_camera_conf(role, conf_id, duration, slope_mode) end

--线性移动镜头(时间)
---@param role py.Role # 玩家
---@param point py.FVector3 # 点
---@param duration py.Fixed # 持续时间
---@param acc integer # 加速度
function GameAPI.camera_linear_move_duration(role, point, duration, acc) end

--线性移动镜头(初速度)
---@param role py.Role # 玩家
---@param point py.FVector3 # 点
---@param speed py.Fixed # 初速度
---@param acc integer # 加速度
function GameAPI.camera_linear_move_speed(role, point, speed, acc) end

--让镜头看向某点（镜头位置不变）
---@param role py.Role # 玩家
---@param point py.FVector3 # 点
---@param move_time? py.Fixed # 时间
function GameAPI.camera_look_at(role, point, move_time) end

--设置镜头参数roll
---@param role py.Role # 玩家
---@param roll py.Fixed # 滚动角
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_roll(role, roll, move_time) end

--设置镜头参数pitch
---@param role py.Role # 玩家
---@param pitch py.Fixed # 俯仰角
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_pitch(role, pitch, move_time) end

--设置镜头跟随单位缓动
---@param role py.Role # 玩家
---@param enable boolean # 缓动开关
---@param inertia_coeff? py.Fixed # 缓动速率
function GameAPI.set_follow_placer_enable_inertia(role, enable, inertia_coeff) end

--设置镜头参数yaw
---@param role py.Role # 玩家
---@param yaw py.Fixed # 导航角
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_yaw(role, yaw, move_time) end

--设置镜头角度参数
---@param role py.Role # 玩家
---@param rotate_type py.CameraRotate # 角度类型
---@param angle py.Fixed # 角度值
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_rotate(role, rotate_type, angle, move_time) end

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

--设置镜头参数distance
---@param role py.Role # 玩家
---@param distance py.Fixed # 焦点距离
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_param_distance(role, distance, move_time) end

--旋转镜头俯仰角（角度，时间）
---@param role py.Role # 玩家
---@param angle py.Fixed # 角度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_pitch_angle_duration(role, angle, duration) end

--旋转镜头俯仰角（角速度，时间）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_pitch_speed_duration(role, angle_speed, duration) end

--旋转镜头俯仰角（角速度，角度）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param angle py.Fixed # 角度
function GameAPI.camera_rotate_pitch_speed_angle(role, angle_speed, angle) end

--旋转镜头导航角（角度，时间）
---@param role py.Role # 玩家
---@param angle py.Fixed # 角度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_yaw_angle_duration(role, angle, duration) end

--旋转镜头导航角（角速度，时间）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_yaw_speed_duration(role, angle_speed, duration) end

--旋转镜头导航角（角速度，角度）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param angle py.Fixed # 角度
function GameAPI.camera_rotate_yaw_speed_angle(role, angle_speed, angle) end

--旋转镜头滚角（角度，时间）
---@param role py.Role # 玩家
---@param angle py.Fixed # 角度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_roll_angle_duration(role, angle, duration) end

--旋转镜头滚角（角速度，时间）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param duration py.Fixed # 时间
function GameAPI.camera_rotate_roll_speed_duration(role, angle_speed, duration) end

--旋转镜头滚角（角速度，角度）
---@param role py.Role # 玩家
---@param angle_speed py.Fixed # 角速度
---@param angle py.Fixed # 角度
function GameAPI.camera_rotate_roll_speed_angle(role, angle_speed, angle) end

--镜头摇晃xy
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 摇晃幅度
---@param speed py.Fixed # 摇晃速率
---@param duration py.Fixed # 持续时间
---@param t integer # 摇晃方式
function GameAPI.camera_shake_xy(role, amplitude, speed, duration, t) end

--镜头摇晃z
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 摇晃幅度
---@param speed py.Fixed # 摇晃速率
---@param duration py.Fixed # 持续时间
function GameAPI.camera_shake_z(role, amplitude, speed, duration) end

--镜头摇晃xy
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 摇晃幅度
---@param speed py.Fixed # 摇晃速率
---@param duration py.Fixed # 持续时间
---@param shake_mode integer # 摇晃方式
function GameAPI.camera_shake(role, amplitude, speed, duration, shake_mode) end

--镜头带衰减震动
---@param role py.Role # 玩家
---@param amplitude py.Fixed # 震动幅度
---@param decay py.Fixed # 衰减速率
---@param frequency py.Fixed # 频率
---@param duration py.Fixed # 持续时间
---@param shake_type integer # 震动方式
function GameAPI.camera_shake_with_decay(role, amplitude, decay, frequency, duration, shake_type) end

--镜头限制移动区域
---@param role py.Role # 玩家
---@param area py.Area # 限制区域
---@param clear_mover? boolean # 超出区域是否停止mover
function GameAPI.camera_limit_area(role, area, clear_mover) end

--镜头限制移动区域
---@param role py.Role # 玩家
function GameAPI.camera_limit_area_close(role) end

--镜头跟随某个单位
---@param role py.Role # 玩家
---@param unit py.Unit # 跟随单位
---@param offset_x? number # 偏移距离x
---@param offset_y? number # 偏移距离y
---@param offset_height? number # 偏移高度
function GameAPI.camera_set_follow_unit(role, unit, offset_x, offset_y, offset_height) end

--镜头tps跟随某个单位
---@param role py.Role # 玩家
---@param unit py.Unit # 跟随单位
---@param sensitive? number # 灵敏度
---@param pitch? number # 俯仰角
---@param yaw? number # 偏航角
---@param offset_x? number # 偏移距离x
---@param offset_y? number # 偏移距离y
---@param offset_z? number # 偏移高度
---@param distance? number # 摄像机距离
function GameAPI.camera_set_tps_follow_unit(role, unit, sensitive, pitch, yaw, offset_x, offset_y, offset_z, distance) end

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

--取消镜头tps跟随单位
---@param role py.Role # 玩家
function GameAPI.camera_cancel_tps_follow_unit(role) end

--将玩家相机解除绑定
---@param role py.Role # 玩家
function GameAPI.camera_cancel_follow_unit(role) end

--本地镜头在跟随状态
---@return boolean # 是否跟随
function GameAPI.camera_is_following_target() end

--设置玩家镜头焦点高度
---@param role py.Role # 玩家
---@param y py.Fixed # 高度
---@param move_time? py.Fixed # 时间
function GameAPI.camera_set_focus_y(role, y, move_time) end

--设置玩家相机允许移动
---@param role py.Role # 玩家
function GameAPI.camera_set_move_enable(role) end

--设置玩家相机禁止移动
---@param role py.Role # 玩家
function GameAPI.camera_set_move_not_enable(role) end

--设置第三人称跟随镜头鼠标控制开关
---@param role py.Role # 玩家
---@param enable boolean # 开关
function GameAPI.set_tps_mode_ctrl(role, enable) end

--获取本地玩家镜头的实数属性
---@param attr_name string # 属性名
---@return py.Fixed # 属性值
function GameAPI.get_camera_attr_real_num(attr_name) end

--获取本地玩家镜头的整数属性
---@param attr_name string # 属性名
---@return integer # 属性值
function GameAPI.get_camera_attr_integer(attr_name) end

--向玩家正上方显示提示信息
---@param role py.Role # 玩家
---@param seconds? number # 持续时间
---@param text string # 信息
---@param localize? boolean # 多语言转化
function GameAPI.api_show_text(role, seconds, text, localize) end

--向玩家显示多语言信息
---@param role py.Role # 玩家
---@param text string # 显示信息
---@param second py.Fixed # 持续时间, 单位秒
---@param localize? boolean # 多语言转化
function GameAPI.show_tips_text(role, text, second, localize) end

--API测试记录日志并可选显示
---@param text string # 信息
---@param seconds py.Fixed # 持续时间, 单位秒
---@param show boolean # 是否在屏幕显示
function GameAPI.api_test_log_msg(text, seconds, show) end

--API测试显示UI信息
---@param text string # 信息
---@param seconds py.Fixed # 持续时间, 单位秒
function GameAPI.api_test_show_msg_tip(text, seconds) end

--API测试-向Log添加Assert结果
---@param is_pass boolean # 是否通过
---@param info_str string # 信息
function GameAPI.api_test_add_log_assert_result(is_pass, info_str) end

--Dialog窗口输出信息
---@param type integer # 窗口等级
---@param text string # 打印信息
---@param trigger_info? py.Dict # 字典
function GameAPI.print_to_dialog(type, text, trigger_info) end

--向玩家显示单位对话
---@param unit py.Unit # 单位
---@param role py.Role # 玩家
---@param text string # 信息
---@param second py.Fixed # 持续时间
---@param localize? boolean # 多语言转化
function GameAPI.show_unit_text_to_role(unit, role, text, second, localize) end

--向玩家左下角显示信息
---@param role py.Role # 玩家
---@param text string # 信息
---@param localize? boolean # 多语言转化
function GameAPI.show_msg_to_role(role, text, localize) end

--按阵营显示游戏结束信息
---@param camp_id py.CampID # 阵营编号
---@param result string # 结束信息
function GameAPI.show_game_end_ui_by_camp_id(camp_id, result) end

--调试-绘制球形
---@param x py.Fixed # x坐标
---@param y py.Fixed # y坐标
---@param z py.Fixed # z坐标
---@param radius py.Fixed # 半径
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
function GameAPI.debug_draw_sphere(x, y, z, radius, duration, color) end

--调试-绘制圆柱
---@param point py.Point # 底部中心点
---@param radius py.Fixed # 半径
---@param height py.Fixed # 高度
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
function GameAPI.debug_draw_cylinder(point, radius, height, duration, color) end

--调试-绘制立方体
---@param rect py.RecArea # 矩形区域
---@param height py.Fixed # 高度
---@param duration? py.Fixed # 持续时间
---@param color? string # 绘制颜色
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
function GameAPI.debug_draw_polyline(point1_x, point1_y, point1_z, point2_x, point2_y, point2_z, duration, color) end

--范围内随机整数
---@param min_num integer # 最小值
---@param max_num integer # 最大值
---@return integer # 随机整数
function GameAPI.get_random_int(min_num, max_num) end

--范围内随机定点数
---@param min_num py.Fixed # 最小值
---@param max_num py.Fixed # 最大值
---@return py.Fixed # 随机定点数
function GameAPI.get_random_fixed(min_num, max_num) end

--保底伪随机数Roll点
---@param event_name string # 事件名
---@param event_odds number # 期望概率(百分数)
---@return boolean # 布尔值
function GameAPI.api_get_pseudo_random(event_name, event_odds) end

--随机角度
---@return py.Fixed # 随机定点数
function GameAPI.get_random_angle() end

--计算公式类型KV
---@param actor py.Actor # 公式所属对象
---@param k string # key
---@return py.Fixed # 值
function GameAPI.api_calc_formula_kv(actor, k) end

--单位组内所有状态的单位数量
---@param unit_group py.UnitGroup # 单位组
---@return integer # 单位数量
function GameAPI.get_unit_group_num(unit_group) end

--遍历时过滤单位组
---@param unit_group py.UnitGroup # 单位组
---@return py.UnitGroup # 单位组
function GameAPI.refresh_unit_group(unit_group) end

--遍历时过滤投射物组
---@param proj_group py.UnitGroup # 投射物组
---@return py.UnitGroup # 投射物组
function GameAPI.refresh_projectile_group(proj_group) end

--遍历时过滤物品组
---@param item_group py.ItemGroup # 物品组
---@return py.ItemGroup # 物品组
function GameAPI.refresh_item_group(item_group) end

--单位组某状态的单位数量
---@param unit_group py.UnitGroup # 单位组
---@param status string # 状态名称
---@return integer # 单位数量
function GameAPI.get_state_unit_num_in_group(unit_group, status) end

--单位组中特定单位编号的单位数量
---@param unit_group py.UnitGroup # 单位组
---@param unit_key py.UnitKey # 单位编号
---@return integer # 无符号整型
function GameAPI.get_num_of_unit_key_in_group(unit_group, unit_key) end

--删除单位组中某种单位
---@param unit_group py.UnitGroup # 单位组
---@param unit_key py.UnitKey # 单位编号
function GameAPI.remove_unit_in_group_by_key(unit_group, unit_key) end

--删除单位组中某个单位
---@param unit_group py.UnitGroup # 单位组
---@param unit py.Unit # 单位
function GameAPI.remove_unit_in_group(unit_group, unit) end

--设置单位组中单位选中
---@param unit_group_id py.UnitGroup # 单位组
function GameAPI.set_unit_group_selected(unit_group_id) end

--单位编号池添加单位编号
---@param pool py.UnitKeyPool # 单位编号池
---@param key py.UnitKey # 单位编号
---@param pro py.Fixed # 定点数
function GameAPI.unit_key_pool_add_key(pool, key, pro) end

--单位编号池删除单位编号
---@param pool py.UnitKeyPool # 单位编号池
---@param key py.UnitKey # 单位编号
function GameAPI.unit_key_pool_rem_key(pool, key) end

--单位编号池返回单位编号
---@param pool py.UnitKeyPool # 单位编号池
---@return py.UnitKey # 单位编号
function GameAPI.get_unit_key_from_pool(pool) end

--获取单位预设库配置的图标路径
---@param key py.UnitKey # 单位编号
---@return string # 图标
function GameAPI.get_unit_key_icon(key) end

--获取物品预设库配置的图标路径
---@param key py.ItemKey # 物品编号
---@return string # 图标
function GameAPI.get_item_key_icon(key) end

--获取单位预设库配置的图片路径
---@param key py.UnitKey # 单位编号
---@param pic_type string # 图片类型
---@return string # 图片
function GameAPI.get_unit_key_pic(key, pic_type) end

--获取单位预设库配置的类型为字符串的属性
---@param unit_key py.UnitKey # 单位编号
---@param attr string # 属性名称
---@return string # 字符串属性值
function GameAPI.get_unit_key_str(unit_key, attr) end

--获取单位预设库配置的类型为实数的属性
---@param unit_key py.UnitKey # 单位编号
---@param attr string # 属性名称
---@return py.Fixed # 实数属性值
function GameAPI.get_unit_key_fixed(unit_key, attr) end

--根据UID获取预设库配置的图标路径
---@param icon_uid string # 图标唯一ID
---@return string # 图标
function GameAPI.get_icon_by_uid(icon_uid) end

--获取技能预设库配置的图标路径
---@param key py.AbilityKey # 技能编号
---@return string # 图标
function GameAPI.get_ability_key_icon(key) end

--变量长度
---@param var py.List # 变量
---@return integer # 变量长度
function GameAPI.len_of_var(var) end

--请求购买
---@param player py.Role # 玩家
---@param goods_id string # 物品ID
function GameAPI.request_buy_mall_coin(player, goods_id) end

--获取三维属性的slave系数
---@param pri string # 三维属性
---@param slave string # slave属性
---@return py.Fixed # slave系数
function GameAPI.get_slave_coeff(pri, slave) end

--设置三维属性的slave系数
---@param pri string # 三维属性
---@param slave string # slave属性
---@param coeff py.Fixed # slave系数
function GameAPI.set_slave_coeff(pri, slave, coeff) end

--攻击类型和防御类型对应的伤害系数
---@param attack_idx integer # 攻击类型
---@param armor_idx integer # 防御类型
---@return py.Fixed # 伤害系数
function GameAPI.get_damage_ratio(attack_idx, armor_idx) end

--设置攻击类型和防御类型对应的伤害系数
---@param attack_idx integer # 攻击类型
---@param armor_idx integer # 防御类型
---@param damage_ratio py.Fixed # 伤害系数
function GameAPI.set_damage_ratio(attack_idx, armor_idx, damage_ratio) end

--应用伤害
---@param source_unit? py.Unit # 伤害者
---@param ability? py.Ability # 来源关联技能
---@param target_unit? py.Unit # 单位或者物品
---@param damage_type? integer # 伤害类型
---@param damage? py.Fixed # 伤害值
---@param jump_word? boolean # 是否跳字
---@param extra_context? py.Actor # extra_data
---@param as_normal_hit? boolean # 视为普攻
---@param critical? boolean # 必定暴击
---@param no_miss? boolean # 无视闪避
---@param hit_sfx? py.SfxKey # 受击特效
---@param hit_socket string # 挂接点
---@param harm_text_enum string # 跳字枚举
---@param jump_word_track? integer # 跳字轨迹
---@param attack_type? integer # 攻击类型
function GameAPI.apply_damage(source_unit, ability, target_unit, damage_type, damage, jump_word, extra_context, as_normal_hit, critical, no_miss, hit_sfx, hit_socket, harm_text_enum, jump_word_track, attack_type) end

--攻击伤害绝对值
---@param damage py.Fixed # 伤害值
---@return py.Fixed # 伤害绝对值
function GameAPI.get_hurt_damage(damage) end

--设置当前攻击伤害的数值
---@param damage py.Fixed # 伤害值
function GameAPI.set_cur_damage(damage) end

--获取当次攻击是否闪避
---@param damage_result_state integer # damage_result_state
---@return boolean # 伤害绝对值
function GameAPI.get_cur_damage_is_miss(damage_result_state) end

--设置当前是否闪避
---@param is_miss boolean # 是否闪避
function GameAPI.set_cur_damage_is_miss(is_miss) end

--设置当前治疗的数值
---@param value py.Fixed # 治疗值
function GameAPI.set_cur_cure_value(value) end

--获取当次攻击是否暴击
---@param damage_result_state integer # damage_result_state
---@return boolean # 是否暴击
function GameAPI.get_cur_damage_is_critical(damage_result_state) end

--设置当前是否暴击
---@param is_critical boolean # 是否暴击
function GameAPI.set_cur_damage_is_critical(is_critical) end

--启动行为树
---@param unit py.Unit # 单位
---@param tree_name string # 行为树名称
---@param tree_args py.Dict # 行为树参数
function GameAPI.assign_behavior_tree(unit, tree_name, tree_args) end

--停止一棵行为树
---@param unit py.Unit # 单位
---@param tree_name string # 行为树名称
function GameAPI.stop_behavior_tree(unit, tree_name) end

--停止所有行为树
---@param unit py.Unit # 单位
function GameAPI.stop_all_behavior_tree(unit) end

--运行一次行为树
---@param unit py.Unit # 单位
---@param tree_name string # 行为树名称
---@param tree_args py.Dict # 行为树参数
function GameAPI.run_behavior_tree_once(unit, tree_name, tree_args) end

--预设库单位删除键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键值名称
function GameAPI.unit_key_del_kv(unit_key, key) end

--预设库技能删除键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键值名称
function GameAPI.ability_key_del_kv(ability_key, key) end

--预设库物品删除键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键值名称
function GameAPI.item_key_del_kv(item_key, key) end

--设置物品商品售价
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 售价
function GameAPI.set_item_buy_price(item_no, res_type, price) end

--设置物品商品出售资源获得
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 出售资源获得
function GameAPI.set_item_sell_price(item_no, res_type, price) end

--设置单位商品售价
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 售价
function GameAPI.set_unit_buy_price(entity_no, res_type, price) end

--设置单位商品出售资源获得
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@param price number # 出售资源获得
function GameAPI.set_unit_sell_price(entity_no, res_type, price) end

--获取物品商品售价
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 售价
function GameAPI.get_item_buy_price(item_no, res_type) end

--获取物品商品出售资源获得
---@param item_no py.ItemKey # 物品编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 出售资源获得
function GameAPI.get_item_sell_price(item_no, res_type) end

--获取单位商品售价
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 售价
function GameAPI.get_unit_buy_price(entity_no, res_type) end

--获取单位商品出售资源获得
---@param entity_no py.UnitKey # 单位编号
---@param res_type py.RoleResKey # 资源类型
---@return py.Fixed # 出售资源获得
function GameAPI.get_unit_sell_price(entity_no, res_type) end

--返回矩形区域中心点
---@param rec py.RecArea # 矩形区域
---@return py.FVector3 # 中心点
function GameAPI.get_rec_center_point(rec) end

--返回圆形区域中心点
---@param cir py.CirArea # 圆形区域
---@return py.FVector3 # 中心点
function GameAPI.get_circle_center_point(cir) end

--返回矩形区域内随机点
---@param area py.RecArea # 矩形区域
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_rec_area(area) end

--返回圆形区域内随机点
---@param area py.CirArea # 圆形区域
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_circular_area(area) end

--返回圆形范围内随机点
---@param point py.FVector3 # 圆心
---@param radius py.Fixed # 半径
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_circular(point, radius) end

--返回多边形区域内随机点
---@param area py.PolyArea # 不规则区域
---@return py.FVector3 # 随机点
function GameAPI.get_random_point_in_poly_area(area) end

--最近创建的圆型区域
---@return py.CirArea # 圆型区域
function GameAPI.get_cir_area_last_created() end

--通过资源id返回路径
---@param res_id integer # 资源ID
---@return py.Road # 路径
function GameAPI.get_road_point_list_by_res_id(res_id) end

--在某点创建一条路径
---@param point py.Point # 点
---@return py.Road # 路径
function GameAPI.create_road_point_list(point) end

--移除路径
---@param road py.Road # 路径
function GameAPI.remove_road_point_list(road) end

--给路径添加点
---@param road py.Road # 路径
---@param num integer # 序号
---@param point py.Point # 点
function GameAPI.add_road_point(road, num, point) end

--移除路径点
---@param road py.Road # 路径
---@param num integer # 序号
function GameAPI.remove_road_point(road, num) end

--获取路径的【起点】
---@param road_point_list py.Road # 路径
---@return py.FVector3 # 起点
function GameAPI.get_road_point_start_point(road_point_list) end

--获取路径的【终点】
---@param road_point_list py.Road # 路径
---@return py.FVector3 # 终点
function GameAPI.get_road_point_end_point(road_point_list) end

--获取路径的【随机点】
---@param road_point_list py.Road # 路径
---@return py.FVector3 # 随机点
function GameAPI.get_road_point_random_point(road_point_list) end

--获取某点的最近路径
---@param point py.Point # 位置
---@return py.Road # 路径
function GameAPI.get_nearest_road_point_list_by_pos(point) end

--获取某路径偏移后的路径
---@param origin_roads py.Road # 原始路径
---@param offset py.Fixed # 偏移距离
---@return py.Road # 路径
function GameAPI.get_road_point_list_by_offset(origin_roads, offset) end

--获取某路径循环n次后的路径
---@param point_list py.Road # 原始路径
---@param n integer # 循环次数
---@return py.Road # 路径
function GameAPI.get_road_point_list_loop(point_list, n) end

--获取两路径拼接后的路径
---@param pl1 py.Road # 原始路径
---@param pl2 py.Road # 原始路径
---@return py.Road # 路径
function GameAPI.get_road_point_list_join(pl1, pl2) end

--获取某路径反转后的路径
---@param point_list py.Road # 原始路径
---@return py.Road # 路径
function GameAPI.get_road_point_list_inversion(point_list) end

--获取路径中点的数量
---@param road_point_list py.Road # 路径
---@return integer # 数量
function GameAPI.get_road_point_num(road_point_list) end

--最近创建单位实体
---@return py.Unit # 单位实体
function GameAPI.get_last_created_unit() end

--最近创建子触发器
---@return integer # 子触发器ID
function GameAPI.get_last_created_trigger() end

--最近创建投射物
---@return py.Unit # 投射物
function GameAPI.get_last_created_projectile() end

--得到区域内的单位id列表
---@param area py.Area # 区域对象
---@return py.List # 单位ID列表
function GameAPI.get_unit_group_in_area(area) end

--获取区域内玩家所有单位id列表
---@param area py.Area # 区域对象
---@param role py.Role # 玩家
---@return py.UnitGroup # 单位id列表
function GameAPI.get_unit_group_belong_to_player_in_area(area, role) end

--得到区域内的物品对象id列表
---@param area py.Area # 区域对象
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_area(area) end

--获取指定形状内的所有物品
---@param point py.Point # 区域对象
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 排序类型
---@return py.ItemGroup # 物品组
function GameAPI.get_all_items_in_shapes(point, shape, sort_type) end

--向ui发送附带dict的事件
---@param s string # 事件名称
---@param args py.Dict # 参数
function GameAPI.send_ui_global_event_with_info_dict(s, args) end

--新建空单位组
---@return py.UnitGroup # 单位组
function GameAPI.create_unit_group() end

--添加单位到单位组
---@param unit py.Unit # 单位
---@param unit_group py.UnitGroup # 单位组
function GameAPI.add_unit_to_group(unit, unit_group) end

--批量设置全局触发器数组变量
---@param table py.List # 组合列表，格式为[[数组变量名称，类型（'INTEGER', 'BOOLEAN', 'FLOAT', 'STRING'），列表值（[值，值，......]）],[.....]]
function GameAPI.set_trigger_table_list_variable(table) end

--通过分割字符串设置字符串数组
---@param key py.List # 字符串数组
---@param actor py.Actor # 类型提示
---@param content string # 分割内容
---@param split string # 分割符
function GameAPI.set_trigger_str_list_by_split(key, actor, content, split) end

--创建全局触发器数组变量
---@param key string # 数组变量名称
---@param var_type string # 值类型
---@param arr_val py.List # 列表型值
function GameAPI.create_trigger_list_variable(key, var_type, arr_val) end

--单位编号是否拥有tag
---@param key py.UnitKey # 单位编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.unit_key_has_tag(key, tag) end

--物品编号是否拥有tag
---@param key py.ItemKey # 物品编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.item_key_has_tag(key, tag) end

--技能编号是否拥有tag
---@param key py.AbilityKey # 技能编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.ability_key_has_tag(key, tag) end

--效果编号是否拥有tag
---@param key py.AbilityKey # 技能编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.modifier_key_has_tag(key, tag) end

--投射物编号是否拥有tag
---@param key py.AbilityKey # 投射物编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.projectile_key_has_tag(key, tag) end

--可破坏物编号是否拥有tag
---@param key py.DestructibleKey # 可破坏物编号
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.dest_key_has_tag(key, tag) end

--单位实体是否存在
---@param unit? py.Unit # 单位实体
---@return boolean # 布尔值
function GameAPI.unit_is_exist(unit) end

--效果实体是否存在
---@param modifier? py.ModifierEntity # 效果实体
---@return boolean # 布尔值
function GameAPI.modifier_is_exist(modifier) end

--投射物实体是否存在
---@param projectile? py.ProjectileEntity # 投射物
---@return boolean # 布尔值
function GameAPI.projectile_is_exist(projectile) end

--技能实体是否存在
---@param ability? py.Ability # 技能
---@return boolean # 布尔值
function GameAPI.ability_is_exist(ability) end

--可破坏物是否存在
---@param destructible? py.Destructible # 可破坏物
---@return boolean # 布尔值
function GameAPI.destructible_is_exist(destructible) end

--图片是否存在
---@param item? py.Item # 图片key
---@return boolean # 布尔值
function GameAPI.item_is_exist(item) end

--单位组是否存在
---@param unit_group py.UnitGroup # 单位组
---@return boolean # 是否存在
function GameAPI.unit_group_is_exist(unit_group) end

--玩家组是否存在
---@param role_group py.RoleGroup # 玩家组
---@return boolean # 是否存在
function GameAPI.role_group_is_exist(role_group) end

--特效是否存在
---@param sfx py.Sfx # 特效
---@return boolean # 是否存在
function GameAPI.sfx_is_exist(sfx) end

--点是否存在
---@param point py.Point # 点
---@return boolean # 是否存在
function GameAPI.point_is_exist(point) end

--路径是否存在
---@param point_list py.Road # 路径
---@return boolean # 是否存在
function GameAPI.point_list_is_exist(point_list) end

--圆形区域是否存在
---@param circle_area py.CirArea # 圆形区域
---@return boolean # 是否存在
function GameAPI.circle_area_is_exist(circle_area) end

--矩形区域是否存在
---@param rect_area py.RecArea # 矩形区域
---@return boolean # 是否存在
function GameAPI.rect_area_is_exist(rect_area) end

--镜头是否存在
---@param camera py.Camera # 镜头
---@return boolean # 是否存在
function GameAPI.camera_is_exist(camera) end

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

--获取技能最大等级
---@param ability py.Ability # 技能
---@return integer # 最大等级
function GameAPI.get_ability_max_level(ability) end

--列表中返回随机整数个元素组成的列表
---@param list1 py.List # 列表
---@param n integer # 整数个
---@return py.List # 随机生成的列表
function GameAPI.random_list_from_list(list1, n) end

--震动设备
---@param role py.Role # 玩家
---@param time py.Fixed # 震动时间
function GameAPI.shake_phone(role, time) end

--为<玩家>输入排行榜<分数>
---@param role py.Role # 玩家
---@param score integer # 战斗内排行榜分数
function GameAPI.set_role_rank_score(role, score) end

--单位触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.unit_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--技能触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.ability_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--效果触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.modifier_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--投射物触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.projectile_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--物品触发器向全局触发器发送事件, 附带信息
---@param event_name string # 事件名称
---@param i integer # 整型值
---@param f py.Fixed # 定点型值
---@param b boolean # 布尔型值
---@param s string # 字符串型值
---@param p py.Point # 浮点数点型值
---@param u? py.Unit # 单位对象
function GameAPI.item_send_global_event_with_info(event_name, i, f, b, s, p, u) end

--获取[玩家]的玩家昵称
---@param role py.Role # 玩家
---@return string # 玩家昵称
function GameAPI.get_player_nick_name(role) end

--获取[玩家]的玩家全量昵称
---@param role py.Role # 玩家
---@return string # 玩家全量昵称
function GameAPI.get_player_full_nick_name(role) end

--获取[玩家]的玩家aid
---@param role py.Role # 玩家
---@return string # 玩家aid
function GameAPI.get_player_plat_aid(role) end

--获取[玩家]的玩家图像
---@param role py.Role # 玩家
---@return string # 玩家图像
function GameAPI.get_player_icon(role) end

--筛选单位删除状态
---@param unit? py.Unit # 单位
---@return py.Unit # 有效单位对象
function GameAPI.filter_unit_status(unit) end

--为玩家打开收费道具商店
---@param role py.Role # 玩家
function GameAPI.open_charge_item_store_for_role(role) end

--当前游戏运行时间
---@return py.Fixed # 时间
function GameAPI.get_cur_game_time() end

--检查点到点是否联通
---@param unit py.Unit # 寻路单位
---@param pointa py.Point # 起点
---@param pointb py.Point # 终点
---@return boolean # 是否联通
function GameAPI.can_point_reach_point(unit, pointa, pointb) end

--检测点是否和单位碰撞
---@param unit py.Unit # 单位
---@param point py.Point # 点
---@param radius number # 范围
---@return boolean # 是否碰撞
function GameAPI.unit_can_collide_with_point(unit, point, radius) end

--通过技能序列号获取技能
---@param unit py.Unit # 单位
---@param ability_seq py.AbilitySeq # 技能序列号
---@return py.Ability # 技能对象
function GameAPI.api_get_ability_by_seq(unit, ability_seq) end

--通过单位编号+技能序列号获取技能
---@param unit_id py.UnitID # 单位ID
---@param ability_seq py.AbilitySeq # 技能序列号
---@return py.Ability # 技能对象
function GameAPI.api_get_ability_by_unit_and_seq(unit_id, ability_seq) end

--获取【单位组】中伤害排名【整数】的单位实体
---@param unit_group py.UnitGroup # 单位组
---@param rank integer # 排名
---@return py.Unit # 单位
function GameAPI.get_damage_statistic_rank_unit(unit_group, rank) end

--获取选择圈缩放
---@param unit py.Unit # 单位
---@return py.Fixed # 缩放
function GameAPI.get_select_circle_scale(unit) end

--删除模型
---@param model py.Model # 模型
function GameAPI.delete_model_entity(model) end

--创建展示模型，面向点，朝向实数
---@param model_res_id py.ModelKey # 模型名称
---@param position py.Point # 点
---@param rotation number # 朝向
---@return py.Model # 模型
function GameAPI.create_model_on_point(model_res_id, position, rotation) end

--创建模型
---@param model_key py.ModelKey # 模型编号
---@param pos py.FPoint # 点
---@param face py.Fixed # 朝向
---@return py.Model # 模型
function GameAPI.create_model_in_scene(model_key, pos, face) end

--销毁模型
---@param model? py.Model # 模型
function GameAPI.destroy_model_in_scene(model) end

--返回指定物品名字的字符串属性值
---@param key py.ItemKey # 物品编号
---@param name string # 属性名
---@return string # 字符
function GameAPI.get_item_key_str_attr(key, name) end

--强制踢出玩家
---@param role py.Role # 玩家
---@param reason string # 踢出理由
function GameAPI.role_force_quit(role, reason) end

--设置矩形区域内视野情况
---@param rect_area py.RecArea # 矩形区域
---@param player py.Role # 玩家
---@param is_vision boolean # 布尔变量
---@param is_vision_true boolean # 布尔变量
---@return py.RecArea # 矩形区域
function GameAPI.set_rect_vision_visibility(rect_area, player, is_vision, is_vision_true) end

--设置区域内视野情况
---@param area py.Area # 区域
---@param player py.Role # 玩家
---@param fog_state integer # 迷雾状态
---@param is_vision_true boolean # 布尔变量
function GameAPI.set_fog_state(area, player, fog_state, is_vision_true) end

--设置圆形区域内视野情况
---@param circle_area py.CirArea # 圆形区域
---@param player py.Role # 玩家
---@param is_vision boolean # 布尔变量
---@param is_vision_true boolean # 布尔变量
---@return py.CirArea # 圆形区域
function GameAPI.set_circle_vision_visibility(circle_area, player, is_vision, is_vision_true) end

--设置多边形区域内视野情况
---@param poly_area py.PolyArea # 多边形区域
---@param player py.Role # 玩家
---@param is_vision boolean # 布尔变量
---@param is_vision_true boolean # 布尔变量
---@return py.PolyArea # 多边形区域
function GameAPI.set_poly_vision_visibility(poly_area, player, is_vision, is_vision_true) end

--创建随机池
---@return py.RandomPool # 随机池
function GameAPI.create_random_pool() end

--设置随机池指定整数权重
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整型
---@param weight integer # 整型
function GameAPI.set_random_pool_value(random_pool, value, weight) end

--随机池增加指定整数权重
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整型
---@param increment integer # 整型
function GameAPI.increase_random_pool_value(random_pool, value, increment) end

--随机池移除指定整数
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整型
function GameAPI.remove_random_pool_value(random_pool, value) end

--从随机池中获取一个随机整数
---@param random_pool py.RandomPool # 随机池
---@param remain? boolean # 布尔
---@return integer # 整数
function GameAPI.get_bitrary_random_pool_value(random_pool, remain) end

--获取随机池中指定整数的权重概率
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整数
---@return number # 权重概率
function GameAPI.get_random_pool_probability(random_pool, value) end

--获取随机池中指定整数的权重概率
---@param random_pool py.RandomPool # 随机池
---@return integer # 总权重
function GameAPI.get_random_pool_all_weight(random_pool) end

--获取随机池中的整数数量
---@param random_pool py.RandomPool # 随机池
---@return integer # 整数数量
function GameAPI.get_random_pool_size(random_pool) end

--复制随机池
---@param random_pool py.RandomPool # 随机池
---@return py.RandomPool # 随机池
function GameAPI.copy_random_pool(random_pool) end

--成长属性
---@param entity_no py.UnitKey # 单位编号
---@param attr string # 属性名
---@return py.Fixed # 属性值
function GameAPI.api_get_attr_growth(entity_no, attr) end

--设置成长属性
---@param entity_no py.UnitKey # 单位编号
---@param attr string # 属性名
---@param value py.Fixed # 属性值
function GameAPI.api_set_attr_growth(entity_no, attr, value) end

--获取某个随机池的列表
---@param random_pool py.RandomPool # 随机池
---@return integer # 整数
function GameAPI.get_all_random_pool_value(random_pool) end

--获取某个随机池中指定整数的权重
---@param random_pool py.RandomPool # 随机池
---@param value integer # 整数
---@return integer # 整数
function GameAPI.get_random_pool_pointed_weight(random_pool, value) end

--翻译字符串
---@param string string # 字符串
---@return string # 翻译后的字符串
function GameAPI.get_text_config(string) end

--发送触发器自定义事件
---@param event_name string # 自定义事件名称
---@param p1 integer # 参数1
---@param p2 integer # 参数2
---@param p3 integer # 参数3
---@param p4 integer # 参数4
---@param p5 integer # 参数5
function GameAPI.send_custom_event(event_name, p1, p2, p3, p4, p5) end

--获取icon图标的图片id
---@param parameter py.Actor # 对象
---@return integer # 图片id
function GameAPI.get_icon_id(parameter) end

--获取技能icon图标的图片id
---@param key py.AbilityKey # 技能编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_ability_type(key) end

--获取物品icon图标的图片id
---@param key py.ItemKey # 物品编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_item_type(key) end

--获取单位icon图标的图片id
---@param key py.UnitKey # 单位编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_unit_type(key) end

--获取魔法效果icon图标的图片id
---@param key py.ModifierKey # 魔法效果编号
---@return integer # 图片id
function GameAPI.get_icon_id_by_buff_type(key) end

--获取魔法效果类型图标的可见性
---@param key py.ModifierKey # 魔法效果编号
---@return boolean # 布尔值
function GameAPI.is_show_on_ui_by_buff_type(key) end

--生成漂浮文字
---@param point py.Point # 点
---@param text_type string # 跳字枚举
---@param value string # 跳字内容
---@param player_group py.RoleGroup # 玩家组
---@param jump_word_track? integer # 跳字轨迹
function GameAPI.create_harm_text(point, text_type, value, player_group, jump_word_track) end

--生成漂浮文字
---@param point py.Point # 点
---@param text_type string # 跳字枚举
---@param value string # 跳字内容
---@param player_group py.RoleGroup # 玩家组
---@param jump_word_track? integer # 跳字轨迹
function GameAPI.create_harm_text_ex(point, text_type, value, player_group, jump_word_track) end

--玩家是否按下按键
---@param role py.Role # 玩家
---@param key py.KeyboardKey # 键盘按键
---@return boolean # 按下状态
function GameAPI.player_key_is_pressed(role, key) end

--玩家鼠标位置
---@param role py.Role # 玩家
---@return py.Point # 鼠标位置
function GameAPI.get_player_pointing_pos(role) end

--玩家鼠标屏幕位置X
---@param role py.Role # 玩家
---@return integer # 鼠标屏幕位置X
function GameAPI.get_player_ui_pos_x(role) end

--玩家鼠标屏幕位置Y
---@param role py.Role # 玩家
---@return integer # 鼠标屏幕位置Y
function GameAPI.get_player_ui_pos_y(role) end

--玩家摄像机朝向
---@param role py.Role # 玩家
---@return py.Point # 摄像机朝向
function GameAPI.get_player_camera_direction(role) end

--玩家摄像机中心射线检测
---@param role py.Role # 玩家
---@return py.Point # 交点
function GameAPI.get_camera_center_raycast(role) end

--玩家鼠标屏幕位置X的窗口占比
---@param role py.Role # 玩家
---@return py.Fixed # 占比值
function GameAPI.get_role_ui_x_per(role) end

--玩家鼠标屏幕位置Y的窗口占比
---@param role py.Role # 玩家
---@return py.Fixed # 占比值
function GameAPI.get_role_ui_y_per(role) end

--返回指定单位类型的名称
---@param unit_key py.UnitKey # 单位类型
---@return string # 描述
function GameAPI.get_unit_name_by_type(unit_key) end

--返回指定单位类型的描述
---@param unit_key py.UnitKey # 单位类型
---@return string # 描述
function GameAPI.get_unit_desc_by_type(unit_key) end

--获取单位类型建造资源消耗属性(玩家属性)
---@param unit_key py.UnitKey # 单位类型
---@param role_res_key py.RoleResKey # 玩家属性
---@return integer # 玩家属性值
function GameAPI.get_role_attr_by_unit_type(unit_key, role_res_key) end

--返回指定可破坏物类型的名称
---@param dest_key py.DestructibleKey # 可破坏物ID
---@return string # 描述
function GameAPI.get_dest_name_by_type(dest_key) end

--返回指定可破坏物类型的描述
---@param dest_key py.DestructibleKey # 可破坏物ID
---@return string # 描述
function GameAPI.get_dest_desc_by_type(dest_key) end

--返回指定投射物类型的名称
---@param projectile_key py.ProjectileKey # 投射物ID
---@return string # 描述
function GameAPI.get_projectile_name_by_type(projectile_key) end

--返回指定投射物类型的描述
---@param projectile_key py.ProjectileKey # 投射物ID
---@return string # 描述
function GameAPI.get_projectile_desc_by_type(projectile_key) end

--返回指定物品类型的描述
---@param item_key py.ItemKey # 物品ID
---@return string # 描述
function GameAPI.get_item_desc_by_type(item_key) end

--返回指定技能类型的描述
---@param ability_key py.AbilityKey # 技能ID
---@return string # 描述
function GameAPI.get_ability_desc_by_type(ability_key) end

--返回指定技能类型的名称
---@param ability_key py.AbilityKey # 技能ID
---@return string # 名称
function GameAPI.get_ability_name_by_type(ability_key) end

--返回指定科技类型的名称
---@param tech_key py.TechKey # 科技ID
---@return string # 名称
function GameAPI.get_tech_name_by_type(tech_key) end

--返回指定科技类型的描述
---@param tech_key py.TechKey # 科技ID
---@return string # 描述
function GameAPI.get_tech_desc_by_type(tech_key) end

--返回指定魔法效果类型的名称
---@param modifier_key py.ModifierKey # 魔法效果ID
---@return string # 描述
function GameAPI.get_modifier_name_by_type(modifier_key) end

--返回指定魔法效果类型的描述
---@param modifier_key py.ModifierKey # 魔法效果ID
---@return string # 描述
function GameAPI.get_modifier_desc_by_type(modifier_key) end

--返回指定物品类型的名字
---@param item_key py.ItemKey # 物品ID
---@return string # 名字
function GameAPI.get_item_name_by_type(item_key) end

--屏蔽全局键盘事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_global_key_event(role, block) end

--屏蔽全局鼠标事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_global_mouse_event(role, block) end

--屏蔽触发器键盘事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_trigger_key_event(role, block) end

--屏蔽触发器鼠标事件
---@param role py.Role # 玩家
---@param block boolean # 是否屏蔽
function GameAPI.block_trigger_mouse_event(role, block) end

--获取玩家属性Icon
---@param res_key py.RoleResKey # 玩家属性
---@return integer # 图片ID
function GameAPI.get_role_res_icon(res_key) end

--获取玩家属性名称
---@param res_key py.RoleResKey # 玩家属性
---@return string # 属性名称
function GameAPI.get_role_res_name(res_key) end

--(调试)绘制网格线
---@param role py.Role # 玩家
---@param start_x number # 起点x
---@param start_y number # 起点y
---@param height number # 高度
---@param space number # 间距
---@param line_count integer # 线数
---@param r integer # r
---@param g integer # g
---@param b integer # b
function GameAPI.draw_grid_polyline(role, start_x, start_y, height, space, line_count, r, g, b) end

--(调试)绘线
---@param point_list py.List # 点
---@param height number # 高度
---@param r integer # r
---@param g integer # g
---@param b integer # b
---@return integer # 索引
function GameAPI.draw_polyline(point_list, height, r, g, b) end

--(调试)绘制矩形
---@param point_list py.List # 点
function GameAPI.draw_box(point_list) end

--(调试)隐藏所有矩形
function GameAPI.hide_all_rect() end

--(调试)清除调试绘线
---@param index integer # 索引
function GameAPI.clear_grid_polyline(index) end

--(调试)设置billboard字体大小
---@param role py.Role # 玩家
---@param size integer # 大小
function GameAPI.set_billboard_font_size(role, size) end

--设置鼠标关闭右键点击移动
---@param b boolean # 开关
function GameAPI.set_mouse_click_control_move(b) end

--遍历所有玩家的资源属性
---@param is_iter_coin_only boolean # 是否遍历货币类型
---@return py.List # 资源属性列表
function GameAPI.iter_role_res(is_iter_coin_only) end

--创建场景点并绑定UI到点
---@param comp_name string # 控件名
---@param point py.Point # 点
---@param visible_dis? number # 可见距离
---@param height_offset? number # 离地高度
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_point(comp_name, point, visible_dis, height_offset) end

--创建场景点并绑定UI到单位
---@param comp_name string # 控件名
---@param player py.Role # 玩家
---@param unit py.Unit # 单位
---@param socket_name string # 挂接点
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_unit(comp_name, player, unit, socket_name, visible_dis) end

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

--创建场景点并绑定UI到三维坐标
---@param comp_name string # 控件名
---@param position py.Vector3 # 三维坐标
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_3d(comp_name, position, visible_dis) end

--创建场景界面到刚体
---@param comp_name string # 控件名
---@param body py.RigidBody # 刚体
---@param offset py.Vector3 # 偏移量
---@param visible_dis? number # 可见距离
---@return py.SceneNode # 场景点
function GameAPI.create_scene_node_on_rigid_body(comp_name, body, offset, visible_dis) end

--设置场景点对玩家的可见距离
---@param scene_node py.SceneNode # 场景点
---@param player py.Role # 玩家
---@param visible_dis number # 可见距离
function GameAPI.set_scene_node_visible_distance(scene_node, player, visible_dis) end

--删除场景点
---@param scene_node_entity py.SceneNode # 场景点
function GameAPI.delete_scene_node(scene_node_entity) end

--单位类型转字符串
---@param val py.UnitKey # 单位编号
---@return string # 字符串
function GameAPI.unit_key_to_str(val) end

--字符串转单位类型
---@param val string # 字符串
---@return py.UnitKey # 单位编号
function GameAPI.str_to_unit_key(val) end

--物品类型转字符串
---@param val py.ItemKey # 物品编号
---@return string # 字符串
function GameAPI.item_key_to_str(val) end

--字符串转物品类型
---@param val string # 字符串
---@return py.ItemKey # 物品编号
function GameAPI.str_to_item_key(val) end

--技能类型转字符串
---@param val py.AbilityKey # 技能编号
---@return string # 字符串
function GameAPI.ability_key_to_str(val) end

--字符串转技能类型
---@param val string # 字符串
---@return py.AbilityKey # 技能编号
function GameAPI.str_to_ability_key(val) end

--可破坏物类型转字符串
---@param obj py.DestructibleKey # 可破坏物编号
---@return string # 字符串
function GameAPI.dest_key_to_str(obj) end

--字符串转可破坏物类型
---@param obj string # 字符串
---@return py.DestructibleKey # 可破坏物编号
function GameAPI.str_to_dest_key(obj) end

--投射物类型转字符串
---@param obj py.ProjectileKey # 投射物编号
---@return string # 字符串
function GameAPI.project_key_to_str(obj) end

--字符串转投射物类型
---@param obj string # 字符串
---@return py.ProjectileKey # 投射物编号
function GameAPI.str_to_project_key(obj) end

--科技类型转字符串
---@param val py.TechKey # 科技编号
---@return string # 字符串
function GameAPI.tech_key_to_str(val) end

--字符串转科技类型
---@param val string # 字符串
---@return py.TechKey # 科技编号
function GameAPI.str_to_tech_key(val) end

--模型实体转字符串
---@param obj py.ModelEntity # 模型实体
---@return string # 字符串
function GameAPI.model_entity_to_str(obj) end

--模型类型转字符串
---@param val py.ModelKey # 模型编号
---@return string # 字符串
function GameAPI.model_key_to_str(val) end

--live2d类型转字符串
---@param val py.Live2dKey # live2d编号
---@return string # 字符串
function GameAPI.live2d_key_to_str(val) end

--字符串转模型类型
---@param val string # 字符串
---@return py.ModelKey # 模型编号
function GameAPI.str_to_model_key(val) end

--魔法效果类型转字符串
---@param val py.ModifierKey # 效果编号
---@return string # 字符串
function GameAPI.modifier_key_to_str(val) end

--字符串转魔法效果类型
---@param val string # 字符串
---@return py.ModifierKey # 效果编号
function GameAPI.str_to_modifier_key(val) end

--平台道具类型转字符串
---@param obj py.StoreKey # 平台道具类型
---@return string # 字符串
function GameAPI.store_key_to_str(obj) end

--字符串转平台道具类型
---@param obj string # 字符串
---@return py.StoreKey # 平台道具类型
function GameAPI.str_to_store_key(obj) end

--镜头转字符串
---@param id_value py.Camera # 镜头
---@return string # 字符串
function GameAPI.camera_to_str(id_value) end

--界面组件转字符串
---@param obj string # 组件名称
---@return string # 字符串
function GameAPI.ui_comp_to_str(obj) end

--玩家属性转字符串
---@param val py.RoleResKey # 资源类型
---@return string # 字符串
function GameAPI.role_res_to_str(val) end

--字符串转玩家属性
---@param val string # 字符串
---@return py.RoleResKey # 资源类型
function GameAPI.str_to_role_res(val) end

--单位属性转字符串
---@param val string # 属性名称
---@return string # 字符串
function GameAPI.unit_attr_to_str(val) end

--字符串转单位属性
---@param val string # 字符串
---@return string # 单位属性
function GameAPI.str_to_unit_attr(val) end

--字符串转阵营对象
---@param obj string # 字符串
---@return py.Camp # 阵营对象
function GameAPI.str_to_camp(obj) end

--获取可破坏物类型的模型
---@param dest_key py.DestructibleKey # 字符串
---@return py.ModelKey # 模型编号
function GameAPI.get_model_key_of_dest_key(dest_key) end

--打开/关闭自动施法
---@param player py.Role # 玩家
---@param is_open boolean # 是否打开
function GameAPI.set_smart_cast_ability(player, is_open) end

--设置{玩家}的普攻预览状态为{开启/关闭}
---@param player py.Role # 玩家
---@param is_open boolean # 是否打开
function GameAPI.set_preview_common_atk_range(player, is_open) end

--是否让{玩家}的智能施法使用指示器
---@param player py.Role # 玩家
---@param use_skill_pointer boolean # 是否使用指示器
function GameAPI.set_smart_cast_with_pointer(player, use_skill_pointer) end

--设置快捷键
---@param role py.Role # 玩家
---@param plan integer # 方案
---@param key string # 快捷键key
---@param value1 integer # 键盘码1
---@param value2 integer # 键盘码2
function GameAPI.set_shortcut(role, plan, key, value1, value2) end

--获取快捷键
---@param role py.Role # 玩家
---@param plan integer # 方案
---@param key string # 快捷键key
---@return py.IntList # 键盘码
function GameAPI.get_shortcut(role, plan, key) end

--设置智能施法
---@param role py.Role # 玩家
---@param value boolean # 开启/关闭
function GameAPI.set_simple_cast(role, value) end

--获取智能施法
---@param role py.Role # 玩家
---@return boolean # 是否智能施法
function GameAPI.get_simple_cast(role) end

--获取客户端智能施法
---@param role py.Role # 玩家
---@return boolean # 是否智能施法
function GameAPI.get_client_simple_cast(role) end

--保存编辑器局内设置
---@param role py.Role # 玩家
function GameAPI.save_client_setting(role) end

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

--设置相机最大视距
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
---@param transition_time? number # 过渡时间
function GameAPI.set_billboard_progress(unit, node_name, progress, role, transition_time) end

--设置血条整体可见性
---@param unit py.Unit # 单位
---@param visibility boolean # 可见性
---@param role? py.Role # 玩家
function GameAPI.set_billboard_overall_visibility(unit, visibility, role) end

--设置血条中进度条控件的进度条图片
---@param unit py.Unit # 单位
---@param node_name string # 血条命名
---@param icon_id py.Texture # 图片
---@param role? py.Role # 玩家
function GameAPI.set_billboard_picture_group(unit, node_name, icon_id, role) end

--玩家完全退出游戏（大厅完全退出游戏）
---@param role py.Role # 玩家
function GameAPI.lobby_exit_game(role) end

--请求购买平台道具
---@param role py.Role # 玩家
---@param store_key py.StoreKey # 平台道具类型
function GameAPI.open_platform_shop(role, store_key) end

--获取本地玩家镜头焦点
---@return py.FVector3 # 镜头焦点
function GameAPI.get_local_player_camera_focus() end

--平台道具是否相等
---@param store_key1 py.StoreKey # 平台道具
---@param store_key2 py.StoreKey # 平台道具
---@return boolean # 是否相等
function GameAPI.api_compare_store_key(store_key1, store_key2) end

--世界坐标转换屏幕坐标
---@param world_pos py.Point # 世界坐标
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_camera_pos_2d(world_pos) end

--世界坐标转换屏幕边缘坐标
---@param world_pos py.Point # 世界坐标
---@param delta_dis py.Fixed # 定点数
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_screen_edge_pos_2d(world_pos, delta_dis) end

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

--广播本地消息
---@param msg_id string # msg_id
---@param msg_content string # msg_content
function GameAPI.api_broadcast_msg(msg_id, msg_content) end
