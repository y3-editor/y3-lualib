-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--移除特效
---@param sfx_entity py.LinkSfx # 特效
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
function GameAPI.remove_link_sfx(sfx_entity, immediately, use_sys_d_destroy_way) end

--设置特效是否显示
---@param sfx_entity py.LinkSfx # 特效
---@param b_show boolean # 是否显示
function GameAPI.enable_link_sfx_show(sfx_entity, b_show) end

--设置链接特效
---@param sfx_entity py.LinkSfx # 特效
---@param role py.Role # 玩家
---@param b_visible boolean # 开关
function GameAPI.enable_link_sfx_visible(sfx_entity, role, b_visible) end

--设置特效
---@param sfx_entity py.Sfx # 特效
---@param role py.Role # 玩家
---@param b_visible boolean # 开关
function GameAPI.enable_sfx_visible(sfx_entity, role, b_visible) end

--创建特效到点
---@param sfx_id py.SfxKey # 特效编号
---@param point py.Point # 点
---@param face_angle number # 面向角度
---@param scale number # 缩放比例
---@param height number # 高度
---@param duration number # 持续时间
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_point(sfx_id, point, face_angle, scale, height, duration, immediately, use_sys_d_destroy_way) end

--创建特效到单位附加点
---@param sfx_id py.SfxKey # 特效编号
---@param unit py.Unit # 单位
---@param socket string # 单位挂接点
---@param b_follow_rotate boolean # 是否跟随单位旋转
---@param b_follow_scale boolean # 是否跟随单位缩放
---@param scale? number # 缩放比例
---@param duration? number # 持续时间
---@param angle? number # 角度
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_unit(sfx_id, unit, socket, b_follow_rotate, b_follow_scale, scale, duration, angle, immediately, use_sys_d_destroy_way) end

--创建特效到单位附加点（跟随旋转使用枚举）
---@param sfx_id py.SfxKey # 特效编号
---@param unit py.Unit # 单位
---@param socket string # 单位挂接点
---@param rotate_type integer # 跟随旋转方式
---@param b_follow_scale boolean # 是否跟随单位缩放
---@param scale? number # 缩放比例
---@param duration? number # 持续时间
---@param angle? number # 角度
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@param detach? boolean # 是否脱离单位
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_unit_new(sfx_id, unit, socket, rotate_type, b_follow_scale, scale, duration, angle, immediately, use_sys_d_destroy_way, detach) end

--删除特效
---@param sfx_entity? py.Sfx # 特效
---@param immediately? boolean # 立即移除表现
---@param use_sys_d? boolean # 删除时是否读取系统默认特效
function GameAPI.delete_sfx(sfx_entity, immediately, use_sys_d) end

--设置特效旋转
---@param sfx_entity py.Sfx # 特效
---@param rotate_x number # x轴旋转
---@param rotate_y number # y轴旋转
---@param rotate_z number # z轴旋转
function GameAPI.set_sfx_rotate(sfx_entity, rotate_x, rotate_y, rotate_z) end

--设置特效朝向
---@param sfx_entity py.Sfx # 特效
---@param face_angle number # 朝向
function GameAPI.set_sfx_angle(sfx_entity, face_angle) end

--设置特效颜色
---@param sfx_entity py.Sfx # 特效
---@param x number # x
---@param y number # y
---@param z number # z
---@param w number # w
function GameAPI.set_sfx_color(sfx_entity, x, y, z, w) end

--设置特效颜色(HEX)
---@param sfx_entity py.Sfx # 特效
---@param color string # hex
---@param w number # w
function GameAPI.set_sfx_color_hex(sfx_entity, color, w) end

--设置特效缩放
---@param sfx_entity py.Sfx # 特效
---@param scale_x number # x轴缩放
---@param scale_y number # y轴缩放
---@param scale_z number # z轴缩放
function GameAPI.set_sfx_scale(sfx_entity, scale_x, scale_y, scale_z) end

--设置特效高度
---@param sfx_entity py.Sfx # 特效
---@param height number # 高度
function GameAPI.set_sfx_height(sfx_entity, height) end

--设置特效到点
---@param sfx_entity py.Sfx # 特效
---@param point py.Point # 点
---@param fluent_move? boolean # 平滑移动
function GameAPI.set_sfx_position(sfx_entity, point, fluent_move) end

--设置特效动画速度
---@param sfx_entity py.Sfx # 特效
---@param speed number # 动画速度
function GameAPI.set_sfx_animation_speed(sfx_entity, speed) end

--设置特效持续时间
---@param sfx_entity py.Sfx # 特效
---@param duration number # 持续时间
function GameAPI.set_sfx_duration(sfx_entity, duration) end

--播放屏幕特效
---@param sfx_key py.SfxKey # 特效编号
---@param keep_time number # 持续时间
---@param role? py.Role # 玩家
---@param render_after_post? boolean # 是否后处理之后渲染
function GameAPI.add_sfx_to_camera(sfx_key, keep_time, role, render_after_post) end

--播放屏幕特效并返回特效实体
---@param sfx_key py.SfxKey # 特效编号
---@param keep_time number # 持续时间
---@param role? py.Role # 玩家
---@param render_after_post? boolean # 是否后处理之后渲染
---@param immediately? boolean # 是否立即删除
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.Sfx # 特效
function GameAPI.add_sfx_to_camera_with_return(sfx_key, keep_time, role, render_after_post, immediately, use_sys_d_destroy_way) end

--震动屏幕
---@param role py.Role # 玩家
---@param period number # 震动周期
---@param amplitude_vector py.FVector3 # 振幅大小
---@param increase_vector py.FVector3 # 增幅值
---@param keep_time number # 震动持续时间
function GameAPI.start_shake(role, period, amplitude_vector, increase_vector, keep_time) end

--链接特效路径转字符串
---@param val py.SfxKey # 特效编号
---@return string # 字符串
function GameAPI.link_sfx_key_to_str(val) end

--字符串转链接特效路径
---@param val string # 字符串
---@return py.SfxKey # 特效编号
function GameAPI.str_to_link_sfx_key(val) end

--特效转字符串
---@param obj py.Sfx # 特效
---@return string # 字符串
function GameAPI.sfx_to_str(obj) end

--粒子特效路径转字符串
---@param val py.SfxKey # 特效编号
---@return string # 字符串
function GameAPI.particle_sfx_key_to_str(val) end

--字符串转粒子特效路径
---@param val string # 特效编号
---@return py.SfxKey # 特效编号
function GameAPI.str_to_particle_sfx_key(val) end

--链接特效转字符串
---@param obj py.LinkSfx # 链接特效
---@return string # 字符串
function GameAPI.link_sfx_to_str(obj) end

--get_table
---@param table_name string # table_name
---@return py.Table # table
function GameAPI.get_table(table_name) end

--set_table_value
---@param table py.Table # table
---@param value py.Actor # value
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
---@param key4 string # key4
---@param key5 string # key5
---@param value_convert_func string # value_convert_func
function GameAPI.set_table_value(table, value, key1, key2, key3, key4, key5, value_convert_func) end

--table_has_key
---@param table py.Table # table
---@param key string # key
---@return boolean # bool
function GameAPI.table_has_key(table, key) end

--get_table_var
---@param table py.Table # table
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
---@param key4 string # key4
---@param key5 string # key5
---@param default_value py.Actor # default
---@param value_convert_func string # value_convert_func
---@param extra_info? py.Dict # extra_info(for debug)
---@return py.Actor # value
function GameAPI.get_table_var(table, key1, key2, key3, key4, key5, default_value, value_convert_func, extra_info) end

--remove_table_value
---@param table py.Table # table
---@param key1 string # key1
---@param key2 string # key2
---@param key3 string # key3
---@param key4 string # key4
---@param key5 string # key5
function GameAPI.remove_table_value(table, key1, key2, key3, key4, key5) end

--remove_table_value_n
---@param table py.Table # table
---@param n integer # N
function GameAPI.remove_table_value_n(table, n) end

--insert_table_value
---@param table py.Table # table
---@param value py.Actor # value
---@param value_convert_func string # value_convert_func
---@param pos integer # pos
function GameAPI.insert_table_value(table, value, value_convert_func, pos) end

--get_new_table
---@return py.Table # table
function GameAPI.get_new_table() end

--clear_table
---@param table py.Table # table
function GameAPI.clear_table(table) end

--encrypt_table
---@param table py.Table # table
function GameAPI.encrypt_table(table) end

--get_copy_of_table
---@param table py.Table # table
---@return py.Table # table
function GameAPI.get_copy_of_table(table) end

--dump_table
---@param table py.Table # table
function GameAPI.dump_table(table) end

--get_table_length
---@param table py.Table # table
---@return integer # length
function GameAPI.get_table_length(table) end

--表 - 是否为空表
---@param table py.Table # table
---@return boolean # 是否为空
function GameAPI.is_table_empty(table) end

--get_iter_table_value_by_type
---@param item py.List # table iter item
---@param default_value py.Actor # default
---@param value_convert_func string # value_convert_func
---@return py.Actor # value
function GameAPI.get_iter_table_value(item, default_value, value_convert_func) end

--table迭代器
---@param t py.Table # TAB
---@return py.Iterator # Python迭代器
function GameAPI.table_iterator(t) end

--table迭代器（保序）
---@param t py.Table # TAB
---@return py.Iterator # Python迭代器
function GameAPI.ordered_table_iterator(t) end

--table迭代器
---@param t py.Table # TAB
---@param ordered? boolean # 是否仅遍历数组部分（保序）
---@return py.Iterator # Python迭代器
function GameAPI.table_iterator_new(t, ordered) end

--serialize_to_string
---@param table py.Table # table
---@return string # value
function GameAPI.serialize_to_string(table) end

--unserialize_by_string
---@param lua string # lua
---@return py.Table # table
function GameAPI.unserialize_by_string(lua) end

--sort_table_by
---@param table py.Table # table
---@param key string # key
---@param order py.TableOrder # order
---@param save_as? py.Table # save_as
function GameAPI.sort_table_by(table, key, order, save_as) end

--调试-Dialog窗口输出帧计时器信息
---@param show_tasks boolean # 显示任务
function GameAPI.dbg_dialog_print_frame_timer_info(show_tasks) end

--获取最近创建的计时器
---@return py.Timer # 计时器
function GameAPI.get_last_created_timer() end

--开启计时器
---@param name string # 计时器名称
---@param once boolean # 是否单次
---@param interval py.Fixed # 时间
---@param context py.Dict # 上下文
---@param desc string # 描述
function GameAPI.start_timer(name, once, interval, context, desc) end

--关闭计时器
---@param name string # 计时器名称
function GameAPI.stop_timer(name) end

--开启计时器（新）
---@param time_delay py.Fixed # 延迟时间
---@param repeat_count integer # 循环次数
---@param run_at_start boolean # 启动时立即运行
---@param timer_callback function # 回调函数
---@param context py.Dict # 上下文
---@param desc string # 描述
---@return py.Timer # 计时器编号
function GameAPI.run_lua_timer(time_delay, repeat_count, run_at_start, timer_callback, context, desc) end

--计时器是否正在运行
---@param timer_id py.Timer # 计时器编号
---@return boolean # 是否合法
function GameAPI.is_timer_valid(timer_id) end

--删除计时器
---@param timer_id py.Timer # 计时器编号
function GameAPI.delete_timer(timer_id) end

--暂停计时器
---@param timer_id py.Timer # 计时器编号
function GameAPI.pause_timer(timer_id) end

--恢复计时器
---@param timer_id py.Timer # 计时器编号
function GameAPI.resume_timer(timer_id) end

--设置计时器剩余次数
---@param timer_id py.Timer # 计时器编号
---@param count integer # 剩余次数
function GameAPI.timer_set_left_count(timer_id, count) end

--设置计时器剩余时间
---@param timer_id py.Timer # 计时器编号
---@param time py.Fixed # 剩余时间
function GameAPI.timer_set_left_time(timer_id, time) end

--设置计时器间隔时间
---@param timer_id py.Timer # 计时器编号
---@param time py.Fixed # 间隔时间
function GameAPI.timer_set_interval_time(timer_id, time) end

--设置帧计时器间隔帧数
---@param timer_id py.Timer # 计时器编号
---@param frame integer # 间隔帧数
function GameAPI.timer_set_interval_frame(timer_id, frame) end

--获取计时器设置的时间
---@param timer_id py.Timer # 计时器
---@return py.Fixed # 时间
function GameAPI.get_timer_time_out_time(timer_id) end

--获取计时器经过的时间
---@param timer_id py.Timer # 计时器
---@return py.Fixed # 时间
function GameAPI.get_timer_elapsed_time(timer_id) end

--获取计时器剩余时间
---@param timer_id py.Timer # 计时器
---@return py.Fixed # 时间
function GameAPI.get_timer_remaining_time(timer_id) end

--获取计时器初始计数
---@param timer_id py.Timer # 计时器
---@return integer # 次数
function GameAPI.get_timer_init_count(timer_id) end

--获取计时器剩余计数
---@param timer_id py.Timer # 计时器
---@return integer # 次数
function GameAPI.get_timer_remaining_count(timer_id) end

--获取独立计时器当前计时秒数
---@param name string # 倒计时名称
---@return py.Fixed # 计时秒数
function GameAPI.get_actor_timer_run_time(name) end

--获取当前到期的计时器
---@param timer_id py.Timer # 计时器
---@return py.Timer # 计时器
function GameAPI.get_current_expired_timer(timer_id) end

--计时器是否存在
---@param timer_id py.Timer # 计时器编号
---@return boolean # 是否合法
function GameAPI.timer_is_exist(timer_id) end

--添加定时回调
---@param interval py.Fixed # 间隔时间
---@param is_repeat boolean # 是否重复
---@param func function # 回调
---@param desc? string # 描述
---@return integer # timer_id
function GameAPI.add_timer(interval, is_repeat, func, desc) end

--取消定时回调
---@param timer_id integer # timer_id
function GameAPI.cancel_timer(timer_id) end

--游戏当前昼夜时间
---@return py.Fixed # 时间
function GameAPI.get_cur_day_and_night_time() end

--设置昼夜游戏时间
---@param time py.Fixed # 时间（0-24）
function GameAPI.set_day_and_night_time(time) end

--设置昼夜游戏时间的流逝速度（倍数）
---@param time_multiple py.Fixed # 倍数，非负数
function GameAPI.set_day_and_night_time_speed(time_multiple) end

--设置昼夜游戏时间的流逝速度（百分比）
---@param time_per py.Fixed # 百分比，非负数
function GameAPI.set_day_and_night_time_speed_per(time_per) end

--打开/关闭时间流逝
---@param flag boolean # 布尔值
function GameAPI.open_or_close_time_speed(flag) end

--创建人造时间，并持续一段时间
---@param create_time py.Fixed # 创建的时间
---@param time_delay py.Fixed # 持续的时间
function GameAPI.create_day_and_night_human_time(create_time, time_delay) end

--点与点的角度
---@param p1 py.Point # 点
---@param p2 py.Point # 目标点
---@return py.Fixed # 角度
function GameAPI.get_points_angle(p1, p2) end

--点与点的距离
---@param p1 py.Point # 点
---@param p2 py.Point # 目标点
---@return py.Fixed # 距离
function GameAPI.get_points_dis(p1, p2) end

--获取当前点的地面高度
---@param point py.Point # 点
---@return py.Fixed # 地面高度
function GameAPI.get_point_ground_height(point) end

--获取当前点的碰撞类型
---@param point py.Point # 点
---@return integer # 碰撞类型
function GameAPI.get_point_ground_collision(point) end

--获取当前点的视野隔断类型
---@param point py.Point # 点
---@return integer # 隔断类型
function GameAPI.get_point_view_block_type(point) end

--判断点是否在区域内
---@param point py.FVector3 # 点
---@param area py.Area # 区域
---@return boolean # 点是否在区域中
function GameAPI.judge_point_in_area(point, area) end

--判断点是否在正方形内
---@param point py.FVector3 # 点
---@param center py.FVector3 # 中心点
---@param width py.Fixed # 正方形边长
---@return boolean # 点是否在正方形中
function GameAPI.judge_point_in_rec(point, center, width) end

--给区域添加tag
---@param area py.Area # 区域
---@param tag string # tag
function GameAPI.add_area_tag(area, tag) end

--给区域移除tag
---@param area py.Area # 区域
---@param tag string # tag
function GameAPI.remove_area_tag(area, tag) end

--给路径添加tag
---@param road py.Road # 路径
---@param tag string # tag
function GameAPI.add_road_tag(road, tag) end

--给路径移除tag
---@param road py.Road # 路径
---@param tag string # tag
function GameAPI.remove_road_tag(road, tag) end

--圆形区域是否拥有某tags
---@param area py.Area # 区域
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.if_cir_area_has_tag(area, tag) end

--矩形区域是否拥有某tags
---@param area py.Area # 区域
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.if_rect_area_has_tag(area, tag) end

--路径是否拥有某tags
---@param road py.Road # 路径
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.if_road_has_tag(road, tag) end

--根据tag获取对应的圆形区域
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_cir_areas_by_tag(tag) end

--根据tag获取对应的矩形区域
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_rect_areas_by_tag(tag) end

--根据tag获取对应的不规则区域
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_polygon_areas_by_tag(tag) end

--根据tag获取对应的路径
---@param tag string # tag
---@return py.List # 列表
function GameAPI.get_roads_by_tag(tag) end

--获取不规则区域顶点列表
---@param poly_area py.PolyArea # 不规则区域
---@return py.List # 顶点列表
function GameAPI.get_poly_area_point_list(poly_area) end

--通过路点返回点
---@param road_point py.DynamicTypeMeta # 路点
---@return py.FVector3 # 点
function GameAPI.get_point_by_road_point(road_point) end

--创建矩形区域
---@param point py.FVector3 # 左下方起始点
---@param width py.Fixed # 宽
---@param height py.Fixed # 高
---@return py.RecArea # 矩形区域
function GameAPI.create_new_rec_area(point, width, height) end

--创建矩形区域
---@param center py.FVector3 # 中心点
---@param width py.Fixed # 宽
---@param height py.Fixed # 高
---@return py.RecArea # 矩形区域
function GameAPI.create_rect_area_by_center(center, width, height) end

--创建矩形区域
---@param point_begin py.Point # 起始点
---@param point_end py.Point # 终点
---@return py.RecArea # 矩形区域
function GameAPI.create_rec_area_from_two_points(point_begin, point_end) end

--创建圆形区域
---@param point py.FVector3 # 中心点
---@param radius py.Fixed # 半径
---@return py.CirArea # 圆形区域
function GameAPI.create_new_cir_area(point, radius) end

--创建多边形区域
---@param point0 py.Point # 点
---@param point1 py.Point # 点
---@param point2 py.Point # 点
---@param point3? py.Point # 点
---@param point4? py.Point # 点
---@param point5? py.Point # 点
---@param point6? py.Point # 点
---@param point7? py.Point # 点
---@return py.PolyArea # 多边形区域
function GameAPI.create_polygon_area(point0, point1, point2, point3, point4, point5, point6, point7) end

--创建多边形区域(新)
---@param point0 py.Point # 点
---@param point1 py.Point # 点
---@param point2 py.Point # 点
---@param point3? py.Point # 点
---@param point4? py.Point # 点
---@param point5? py.Point # 点
---@param point6? py.Point # 点
---@param point7? py.Point # 点
---@param point8? py.Point # 点
---@param point9? py.Point # 点
---@param point10? py.Point # 点
---@param point11? py.Point # 点
---@param point12? py.Point # 点
---@return py.PolyArea # 多边形区域
function GameAPI.create_polygon_area_new(point0, point1, point2, point3, point4, point5, point6, point7, point8, point9, point10, point11, point12) end

--设置圆形区域大小
---@param area py.CirArea # 圆形区域
---@param radius py.Fixed # 半径
function GameAPI.set_cir_area_radius(area, radius) end

--获取圆形区域半径
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 半径
function GameAPI.get_circle_area_radius(area) end

--获取圆形区域内最小X坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最小的X坐标
function GameAPI.get_circle_area_min_x(area) end

--获取圆形区域内最小y坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最小的Y坐标
function GameAPI.get_circle_area_min_y(area) end

--获取圆形区域内最大X坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最大的X坐标
function GameAPI.get_circle_area_max_x(area) end

--获取圆形区域内最大y坐标
---@param area py.CirArea # 圆形区域
---@return py.Fixed # 最大的Y坐标
function GameAPI.get_circle_area_max_y(area) end

--设置矩形区域大小
---@param area py.RecArea # 矩形区域
---@param length py.Fixed # 长
---@param width py.Fixed # 宽
function GameAPI.set_rect_area_radius(area, length, width) end

--获取矩形区域内最小X坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最小的X坐标
function GameAPI.get_rect_area_min_x(area) end

--获取矩形区域内最小Y坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最小的Y坐标
function GameAPI.get_rect_area_min_y(area) end

--获取矩形区域内最大X坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最大的X坐标
function GameAPI.get_rect_area_max_x(area) end

--获取矩形区域内最大Y坐标
---@param area py.RecArea # 矩形区域
---@return py.Fixed # 最大的Y坐标
function GameAPI.get_rect_area_max_y(area) end

--获取可用地图范围
---@return py.RecArea # 区域
function GameAPI.get_usable_map_range() end

--通过区域ID返回矩形区域
---@param res_id py.AreaID # 区域ID
---@return py.RecArea # 矩形区域
function GameAPI.get_rec_area_by_res_id(res_id) end

--通过区域ID返回圆形区域
---@param res_id py.AreaID # 区域ID
---@return py.CirArea # 圆形区域
function GameAPI.get_circle_area_by_res_id(res_id) end

--通过区域ID返回自定义多边形区域
---@param res_id py.AreaID # 区域ID
---@return py.PolyArea # 多边形区域
function GameAPI.get_polygon_area_by_res_id(res_id) end

--最近创建的矩形区域
---@return py.RecArea # 矩形区域
function GameAPI.get_rec_area_last_created() end

--点是否在矩形区域内
---@param point py.FPoint # 点
---@param area py.RecArea # 矩形区域
---@return boolean # 点是否在矩形区域内
function GameAPI.judge_point_in_rec_area(point, area) end

--点是否在圆形区域内
---@param point py.FPoint # 点
---@param area py.CirArea # 圆形区域
---@return boolean # 点是否在圆形区域内
function GameAPI.judge_point_in_cir_area(point, area) end

--点是否在不规则区域内
---@param point py.FPoint # 点
---@param area py.CirArea # 不规则区域
---@return boolean # 点是否在不规则区域内
function GameAPI.judge_point_in_polygon_area(point, area) end

--通过资源id返回点
---@param res_id integer # 资源ID
---@return py.FPoint # 点
function GameAPI.get_point_by_res_id(res_id) end

--获取区域内单位数量
---@param area py.Area # 区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_area(area) end

--矩形区域内单位数量
---@param area py.RecArea # 矩形区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_rec_area(area) end

--圆形区域内单位数量
---@param area py.CirArea # 圆形区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_cir_area(area) end

--不规则区域内单位数量
---@param area py.PolyArea # 不规则区域
---@return integer # 单位数量
function GameAPI.get_unit_num_in_poly_area(area) end

--矩形区域内所有未销毁单位单位
---@param area py.RecArea # 矩形区域
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_in_rec_area(area) end

--圆形区域内所有未销毁单位
---@param area py.CirArea # 圆形区域
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_in_cir_area(area) end

--不规则区域内所有未销毁单位
---@param area py.CirArea # 不规则区域
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_group_in_poly_area(area) end

--矩形区域内所有物品
---@param area py.RecArea # 矩形区域
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_rec_area(area) end

--圆形区域内所有物品
---@param area py.CirArea # 圆形区域
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_cir_area(area) end

--不规则区域内所有物品
---@param area py.PolyArea # 不规则区域
---@return py.ItemGroup # 物品组
function GameAPI.get_item_group_in_poly_area(area) end

--删除区域
---@param area py.Area # 区域
function GameAPI.remove_area(area) end

--获得区域天气
---@param area py.Area # 区域
---@return integer # 天气类型
function GameAPI.get_area_weather(area) end

--设置区域天气
---@param area py.Area # 区域
---@param weather_type integer # 天气类型
function GameAPI.update_area_weather(area, weather_type) end

--设置点碰撞
---@param point py.Point # 点
---@param is_add boolean # 添加/去除
---@param ground_channel boolean # 地面碰撞
---@param air_channel boolean # 飞行碰撞
function GameAPI.set_point_collision(point, is_add, ground_channel, air_channel) end

--设置区域碰撞
---@param area py.Area # 区域
---@param is_add boolean # 添加/去除
---@param ground_channel boolean # 地面碰撞
---@param air_channel boolean # 飞行碰撞
function GameAPI.set_area_collision(area, is_add, ground_channel, air_channel) end

--编辑区域碰撞
---@param area py.Area # 区域
---@param collision_layer integer # 碰撞类型
---@param is_add boolean # 添加/去除
function GameAPI.edit_area_collision(area, collision_layer, is_add) end

--编辑区域视野阻挡
---@param area py.Area # 区域
---@param fov_block_type integer # 视野阻挡类型
---@param is_add boolean # 添加/去除
function GameAPI.edit_area_fov_block(area, fov_block_type, is_add) end

--获取区域的场景ID
---@param area py.Area # 区域
---@return integer # 场景ID
function GameAPI.get_area_resource_id(area) end

--获取路径的场景ID
---@param road py.Road # 路径
---@return integer # 场景ID
function GameAPI.get_road_resource_id(road) end

--声音转字符串
---@param obj py.SoundEntity # 声音对象
---@return string # 字符串
function GameAPI.sound_entity_to_str(obj) end

--声音类型转字符串
---@param obj py.AudioKey # 音效编号
---@return string # 字符串
function GameAPI.audio_key_to_str(obj) end

--字符串转声音类型
---@param obj string # 字符串
---@return py.AudioKey # 音效编号
function GameAPI.str_to_audio_key(obj) end

--注册区域的附近语音频道
---@param area py.Area # 区域
function GameAPI.reg_sound_area(area) end

--反注册区域的附近语音频道
---@param area py.Area # 区域
function GameAPI.unreg_sound_area(area) end

--设置附近语音的区域模式开关
---@param b boolean # 区域模式开关
function GameAPI.set_nearby_voice_mode(b) end

--设置玩家发言频道
---@param role py.Role # 玩家
---@param channel integer # 频道
function GameAPI.set_audio_chat_channel(role, channel) end

--播放音乐
---@param role py.Role # 玩家
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
---@param fade_in_time? number # 淡入时间
---@param fade_out_time? number # 淡出时间
---@return py.SoundEntity # 声音对象
function GameAPI.play_sound_for_player(role, sid, loop, fade_in_time, fade_out_time) end

--对目标播放音乐
---@param unit_key py.UnitKey # 单位编号
---@param camp_target py.RoleRelation # 玩家关系
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
function GameAPI.play_sound_for_role_relation(unit_key, camp_target, sid, loop) end

--播放3d音乐
---@param role py.Role # 玩家
---@param sid py.AudioKey # 乐曲编号
---@param position py.Point # 播放位置
---@param height number # 高度
---@param fade_in_time? number # 淡入时间
---@param fade_out_time? number # 淡出时间
---@param ensure_play? boolean # 确保播放
---@param loop? boolean # 是否循环
---@return py.SoundEntity # 声音对象
function GameAPI.play_3d_sound_for_player(role, sid, position, height, fade_in_time, fade_out_time, ensure_play, loop) end

--跟随单位播放3d音乐
---@param role py.Role # 玩家
---@param sid py.AudioKey # 乐曲编号
---@param unit py.Unit # 单位
---@param fade_in_time? number # 淡入时间
---@param fade_out_time? number # 淡出时间
---@param ensure_play? boolean # 确保播放
---@param loop? boolean # 是否循环
---@param offset_x? number # 偏移x
---@param offset_y? number # 偏移y
---@param offset_z? number # 偏移z
---@return py.SoundEntity # 声音对象
function GameAPI.follow_object_play_3d_sound_for_player(role, sid, unit, fade_in_time, fade_out_time, ensure_play, loop, offset_x, offset_y, offset_z) end

--停止播放音乐
---@param role py.Role # 玩家
---@param sound py.SoundEntity # 声音
---@param immediately_stop? boolean # 是否立即停止
function GameAPI.stop_sound(role, sound, immediately_stop) end

--播放控制
---@param role py.Role # 玩家
---@param sound py.SoundEntity # 声音
---@param play_operation integer # 播放操作
function GameAPI.sound_play_controller(role, sound, play_operation) end

--设置玩家的声音接收器跟随镜头射线与地面焦点
---@param role py.Role # 玩家
---@param camera_ray_direction py.CameraRayDirection # 相机射线方向
function GameAPI.set_player_listener_to_follow_intersection_of_camera_ray_and_ground(role, camera_ray_direction) end

--设置玩家的声音接收器跟随单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.set_player_listener_to_follow_unit(role, unit) end

--设置背景音乐开关
---@param role py.Role # 玩家
---@param value boolean # 打开/关闭
function GameAPI.open_background_music(role, value) end

--设置战斗音乐开关
---@param role py.Role # 玩家
---@param value boolean # 打开/关闭
function GameAPI.open_battle_music(role, value) end

--设置背景音乐音量
---@param role py.Role # 玩家
---@param value integer # 音量
function GameAPI.set_background_music_volume(role, value) end

--设置战斗音效音量
---@param role py.Role # 玩家
---@param value integer # 音量
function GameAPI.set_battle_music_volume(role, value) end

--设置声音音量
---@param player py.Role # 玩家
---@param sound py.SoundEntity # 声音
---@param volume integer # 音量
function GameAPI.set_sound_volume(player, sound, volume) end

--通过场景声音ID返回场景声音
---@param res_id py.SceneSoundID # 场景声音ID
---@return py.SceneSound # 场景声音
function GameAPI.get_scene_sound_by_res_id(res_id) end

--播放场景声音
---@param scene_sound py.SceneSound # 场景声音
function GameAPI.play_scene_sound(scene_sound) end

--停止场景声音
---@param scene_sound py.SceneSound # 场景声音
function GameAPI.stop_scene_sound(scene_sound) end

--设置场景声音是否循环
---@param scene_sound py.SceneSound # 场景声音
---@param loop boolean # 是否循环
function GameAPI.set_scene_sound_loop(scene_sound, loop) end

--设置场景声音衰减距离
---@param scene_sound py.SceneSound # 场景声音
---@param min_dist number # 衰减距离
function GameAPI.set_scene_sound_min_dist(scene_sound, min_dist) end

--设置场景声音静音距离
---@param scene_sound py.SceneSound # 场景声音
---@param max_dist number # 静音距离
function GameAPI.set_scene_sound_max_dist(scene_sound, max_dist) end

--设置场景声音是否暂停
---@param scene_sound py.SceneSound # 场景声音
---@param paused boolean # 是否暂停
function GameAPI.set_scene_sound_pause(scene_sound, paused) end

--获取初始化背景音乐开关状态
---@return boolean # value
function GameAPI.get_bgm_state() end

--获取初始化战斗音效开关状态
---@return boolean # value
function GameAPI.get_battle_bgm_state() end

--获取初始化背景音乐音量
---@return integer # value
function GameAPI.get_bgm_volume() end

--获取初始化战斗音效音量
---@return integer # value
function GameAPI.get_battle_volume() end

--获取当前游戏模式
---@return py.GameMode # 游戏模式
function GameAPI.get_game_mode() end

--暂停游戏
function GameAPI.pause_game() end

--为玩家结束游戏
---@param role py.Role # 玩家
---@param result string # 战斗结果
---@param show boolean # 显示结束面板
---@param send? boolean # 是否上传玩家排行榜分数
---@param score? integer # 排行榜分数
---@param accumulate? boolean # 是否累积计算分数
function GameAPI.set_melee_result_by_role(role, result, show, send, score, accumulate) end

--结束玩家游戏
---@param role py.Role # 玩家
---@param result string # 战斗结果
---@param comp_uid string # 控件uid
---@param send? boolean # 是否上传玩家排行榜分数
---@param score? integer # 排行榜分数
---@param accumulate? boolean # 是否累积计算分数
function GameAPI.set_melee_result_by_role_2(role, result, comp_uid, send, score, accumulate) end

--上传玩家排行榜分数
---@param role py.Role # 玩家
---@param score integer # 排行榜分数
---@param accumulate? boolean # 是否累积计算分数
function GameAPI.upload_role_billboard_score(role, score, accumulate) end

--结束游戏
---@param player_results? py.Dict # 玩家结算信息
function GameAPI.game_end(player_results) end

--申请开始下一轮
---@param fast_restart? boolean # 是否快速重置
function GameAPI.request_new_round(fast_restart) end

--切换至关卡
---@param level_id_str py.Map # 关卡ID
function GameAPI.request_switch_level(level_id_str) end

--获取当前关卡
---@return py.Map # 当前关卡
function GameAPI.get_current_level() end

--获取当前地图的指定key的存档值
---@param key string # 指定的全局存档key值
---@return integer # 全局存档值
function GameAPI.get_global_map_archive(key) end

--获取当前地图的指定key的字符串型存档值
---@param key string # 指定的全局存档key值
---@return string # 字符串型全局存档值
function GameAPI.get_global_map_str_archive(key) end

--获取地图全局指定key存档的第n名玩家的昵称
---@param rank_key string # key值
---@param num integer # 第n名
---@return string # 昵称
function GameAPI.get_rank_player_nickname(rank_key, num) end

--获取地图全局指定key存档的第n名玩家的存档值
---@param rank_key string # key值
---@param num integer # 第n名
---@return integer # 存档值
function GameAPI.get_rank_player_global_archive_value(rank_key, num) end

--获取玩家指定的个人存档栏位的第n名玩家的昵称
---@param archive_key integer # 玩家存档栏位
---@param num integer # 第n名
---@return string # 昵称
function GameAPI.get_archive_rank_player_nickname(archive_key, num) end

--获取玩家指定的个人存档栏位的第n名玩家昵称的后缀id
---@param archive_key integer # 玩家存档栏位
---@param num integer # 第n名
---@return string # 后缀id
function GameAPI.get_archive_rank_player_tag(archive_key, num) end

--获取玩家指定的个人存档栏位的第n名玩家的存档值
---@param archive_key integer # 玩家存档栏位
---@param num integer # 第n名
---@return integer # 存档值
function GameAPI.get_archive_rank_player_archive_value(archive_key, num) end

--调整逻辑帧率
---@param fps integer # 目标帧率
function GameAPI.api_change_logic_fps(fps) end

--开启软暂停
function GameAPI.api_soft_pause_game() end

--关闭软暂停
function GameAPI.api_soft_resume_game() end

--上传埋点数据
---@param role py.Role # 玩家
---@param op_key string # 埋点Key
---@param op_cnt integer # 次数
function GameAPI.api_upload_user_tracking_data(role, op_key, op_cnt) end

--记录自定义日志，用于定位不同步
---@param log string # 日志内容
---@return boolean # 返回值恒定为True
function GameAPI.add_detail_log(log) end

--开启/关闭不同步详细日志。默认关闭。这个是总开关，关了这个之后别的设置接口都不生效了了，但性能最好。
---@param enable? boolean # 是否开启
function GameAPI.api_set_enable_detail_snapshot(enable) end

--设置某些日志的堆栈记录详细等级。
---@param level? integer # 等级
function GameAPI.api_set_snapshot_traceback_level(level) end

--开启/关闭timer不同步检测日志。默认关闭。开启后可以检测出哪里多创建了ECA计时器，但计时器不一致并不一定代表着实际游戏内容不同步（比如计时器回调里只做表现层修改就是安全的）
---@param enable? boolean # 是否开启
function GameAPI.api_set_enable_timer_snapshot(enable) end

--开启/关闭ECA不同步检测日志。默认关闭，开销较高。可通过参数过滤掉一些安全的API以防止误报，例如创建特效、UI操作等
---@param enable boolean # 是否开启
---@param filter_mode? integer # 过滤模式,默认1 剔除模式（不记录filter_set中指定的api）或者0 包含模式（仅记录filter_set中指定的api）
---@param filter_set? py.Table # 过滤集合，默认为{"client_only", "client_possible"}。可传入想要剔除/包含的API（取决于上个参数），如{"client_only", "client_possible", "GameAPI:print_to_dialog, "GameAPI:get_function_return_value"}。client_only和client_possible为官方确认安全/较安全的API集合，即在{使用得当的情况下}即使调用次数不一致也不会影响游戏核心逻辑，通常可以将其加入剔除集合中以避免误报
---@return string # 开启结果
function GameAPI.api_set_enable_eca_snapshot(enable, filter_mode, filter_set) end

--设置不同步详细日志级别。越详细越利于定位不同步产生点,但性能消耗会增高
---@param tag integer # mask用于控制开启哪些日志，0xFFFFFFFF全部开启，默认开启16+32。各bit含义>> 1：运动器tick，2：运动器碰撞检测，4：寻路回调，8：寻路坐标更新，16：血量变化，32：坐标瞬变
function GameAPI.api_set_detail_snapshot_enable_tag(tag) end

--本地玩家编号
---@return py.RoleID # 玩家编号
function GameAPI.get_owner_role_id() end

--本地玩家鼠标位置
---@return py.Point # 鼠标位置
function GameAPI.get_local_player_pointing_pos() end

--本地玩家鼠标屏幕位置X
---@return integer # 鼠标屏幕位置X
function GameAPI.get_local_player_ui_pos_x() end

--本地玩家鼠标屏幕位置Y
---@return integer # 鼠标屏幕位置Y
function GameAPI.get_local_player_ui_pos_y() end

--本地玩家鼠标屏幕位置X的窗口占比
---@return number # 占比值
function GameAPI.get_local_role_ui_x_per() end

--本地玩家鼠标屏幕位置y的窗口占比
---@return number # 占比值
function GameAPI.get_local_role_ui_y_per() end

--本地玩家摄像机朝向
---@return py.Point # 摄像机朝向
function GameAPI.get_local_player_camera_direction() end

--本地玩家摄像机中心射线检测
---@return py.Point # 交点
function GameAPI.get_local_player_camera_center_raycast() end

--获取游戏开始时间戳
---@return integer # 游戏开始时间戳
function GameAPI.get_game_init_time_stamp() end

--获取本地时间戳
---@return integer # 本地时间戳
function GameAPI.get_local_time_stamp() end

--添加本地计时器
---@param delay number # 延迟
---@param callback function # 回调
---@return integer # 计时器编号
function GameAPI.add_local_timer(delay, callback) end

--添加本地循环计时器
---@param interval number # 间隔
---@param callback function # 回调
---@return integer # 计时器编号
function GameAPI.add_local_repeat_timer(interval, callback) end

--取消本地计时器
---@param timer_id integer # 计时器编号
function GameAPI.cancel_local_timer(timer_id) end

--强制开启/关闭鼠标同步
---@param enable boolean # 开关
function GameAPI.force_enable_mouse_sync(enable) end

--强制开启/关闭按键同步
---@param enable boolean # 开关
function GameAPI.force_enable_keyboard_sync(enable) end

--强制开启/关闭镜头同步
---@param enable boolean # 开关
function GameAPI.force_enable_camera_sync(enable) end

--设置本地相机聚焦位置
---@param position py.Vector3 # 位置
function GameAPI.set_local_camera_focus_position(position) end

--启动云信并绑定对象
---@param role py.Role # 玩家
---@param entity py.Unit # 单位
function GameAPI.init_bind_nim(role, entity) end

--启用/禁用垂直同步
---@param enable boolean # 开启
function GameAPI.api_set_v_sync(enable) end

--设置本地改键
---@param key py.KeyboardKey # 原始按键
---@param target_key py.KeyboardKey # 目标按键
function GameAPI.api_set_local_mapping_key(key, target_key) end

--取消本地改键
---@param key py.KeyboardKey # 原始按键
function GameAPI.api_cancel_local_mapping_key(key) end

--清空本地改键
function GameAPI.api_clear_local_mapping_key() end

--设置是否使用内置本地改键方案
---@param enable boolean # 是否使用
function GameAPI.api_set_builtin_key_control_enable(enable) end

--判断是否使用内置键盘控制
---@return boolean # 布尔值
function GameAPI.api_is_builtin_key_control_enable() end

--设置玩家镜头模式
---@param role py.Role # 玩家
---@param cam_mod py.CameraMode # 镜头模式
---@param ortho_scale? number # 正交缩放
function GameAPI.api_set_role_camera_mode(role, cam_mod, ortho_scale) end

--玩家镜头是否正在播放动画
---@param role py.Role # 玩家
---@return boolean # 是否播放动画
function GameAPI.is_cameraIS_playing_timeline(role) end

--播放镜头动画
---@param role py.Role # 玩家
---@param camline_id py.CamlineID # 镜头TimelineID
function GameAPI.play_camera_timeline(role, camline_id) end

--停止播放镜头动画
---@param role py.Role # 玩家
function GameAPI.stop_camera_timeline(role) end

--设置对象的菲涅尔效果开关
---@param log_obj py.Actor # 对象
---@param visible boolean # 开关
function GameAPI.api_set_obj_fresnel_visible(log_obj, visible) end

--设置对象的菲涅尔效果
---@param log_obj py.Actor # 对象
---@param color_r? integer # R
---@param color_g? integer # G
---@param color_b? integer # B
---@param alpha? number # alpha
---@param exp? number # exp
---@param strength? number # strength
function GameAPI.api_set_obj_fresnel_parameters(log_obj, color_r, color_g, color_b, alpha, exp, strength) end

--获取对象的菲涅尔指数
---@param log_obj py.Actor # 对象
---@return py.Fixed # 指数
function GameAPI.api_get_obj_fresnel_exp(log_obj) end

--获取对象的菲涅尔强度
---@param log_obj py.Actor # 对象
---@return py.Fixed # 强度
function GameAPI.api_get_obj_fresnel_color_strength(log_obj) end

--设置模型加载范围
---@param focus_distance number # 范围
function GameAPI.set_focus_distance(focus_distance) end

--设置画质
---@param role py.Role # 玩家
---@param quality string # 画质
function GameAPI.set_image_quality(role, quality) end

--获取初始化游戏画质
---@return string # value
function GameAPI.get_graphics_quality() end

--设置画风
---@param role py.Role # 玩家
---@param post_style_type py.PostEffect # 画风
---@param color_r? integer # R
---@param color_g? integer # R
---@param color_b? integer # R
---@param depth_scale? number # 描边
---@param intensity? number # 强度
function GameAPI.set_post_effect(role, post_style_type, color_r, color_g, color_b, depth_scale, intensity) end

--级联阴影开关
---@param is_enable boolean # 开关
function GameAPI.set_cascaded_shadow_enable(is_enable) end

--级联阴影层数
---@param levels integer # 层数
function GameAPI.set_dynamic_shadow_cascades(levels) end

--级联阴影距离
---@param distance number # 距离
function GameAPI.set_dynamic_shadow_distance_movable_light(distance) end

--阴影距离
---@param distance number # 距离
function GameAPI.set_cascaded_shadow_distance(distance) end

--获取级联阴影状态
---@return boolean # 状态
function GameAPI.get_cascaded_shadow_enable() end

--获取级联阴影层数
---@return integer # 层数
function GameAPI.get_dynamic_shadow_cascades() end

--获取级联阴影距离
---@return py.Fixed # 距离
function GameAPI.get_dynamic_shadow_distance_movable_light() end

--获取阴影距离
---@return py.Fixed # 距离
function GameAPI.get_cascaded_shadow_distance() end

--获取光源Float属性
---@param light py.Light # 光源
---@param attr_name string # 属性名
---@return py.Fixed # 值
function GameAPI.get_light_float_attr_value(light, attr_name) end

--设置光源是否产生阴影
---@param light py.Light # 光源
---@param value boolean # 值
function GameAPI.set_light_cast_shadow_attr_value(light, value) end

--获取光源是否产生阴影
---@param light py.Light # 光源
---@return boolean # 值
function GameAPI.get_light_cast_shadow_attr_value(light) end

--根据局部雾ID返回局部雾
---@param res_id py.FogID # 雾ID
---@return py.Fog # 雾
function GameAPI.get_fog_res_by_res_id(res_id) end

--修改雾效属性
---@param fog py.Fog # 雾
---@param op_flag integer # 默认参数
---@param yaw? number # 朝向
---@param pos_x? number # 位置x
---@param pos_y? number # 位置y
---@param pos_z? number # 位置z
---@param scale_x? number # 缩放x
---@param scale_y? number # 缩放y
---@param scale_z? number # 缩放z
---@param color_r? number # 颜色r
---@param color_g? number # 颜色g
---@param color_b? number # 颜色b
---@param density? number # 浓度
---@param flow_speed? number # 流速
function GameAPI.set_fog_attr(fog, op_flag, yaw, pos_x, pos_y, pos_z, scale_x, scale_y, scale_z, color_r, color_g, color_b, density, flow_speed) end

--修改雾效属性新
---@param fog py.Fog # 雾
---@param fog_attr string # 雾效属性
---@param value number # 值
function GameAPI.set_fog_attr_new(fog, fog_attr, value) end

--为玩家开关全局视野
---@param enable boolean # 开关
function GameAPI.enable_fow_for_player(enable) end

--设置小地图替代图片
---@param role py.Role # 玩家
---@param image_id integer # 图片id
function GameAPI.change_mini_map_img(role, image_id) end

--设置小地图替代图片(图片类型)
---@param role py.Role # 玩家
---@param image_id py.Texture # 图片
function GameAPI.change_mini_map_img_with_icon(role, image_id) end

--设置小地图颜色显示模式
---@param role py.Role # 玩家
---@param color_type integer # 显示模式
function GameAPI.change_mini_map_color_type(role, color_type) end

--开启小地图迷雾显示
---@param role py.Role # 玩家
---@param enable integer # 显示模式
function GameAPI.enable_player_mini_map_fog_img(role, enable) end

--开启绘制单位路径线
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.enable_unit_path_drawing(role, unit) end

--关闭绘制单位路径线
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.disable_unit_path_drawing(role, unit) end

--设置小地图显示区域
---@param role py.Role # 玩家
---@param rect_area py.RecArea # 矩形区域
function GameAPI.set_min_map_show_area(role, rect_area) end

--关闭localplayer的表现层跳字
---@param is_close boolean # 是否关闭
function GameAPI.set_local_player_jump_word_close(is_close) end

--仅显示本地玩家跳字
---@param is_show boolean # 是否开启
function GameAPI.only_show_local_player_jump_word(is_show) end

--设置对象的基础材质属性
---@param logic_obj py.Actor # 逻辑对象
---@param color_r? integer # R
---@param color_g? integer # G
---@param color_b? integer # B
---@param color_a? integer # A
---@param base_model_opacity? integer # model_opacity
function GameAPI.api_change_obj_base_color(logic_obj, color_r, color_g, color_b, color_a, base_model_opacity) end

--设置镜头是否跟随地形高度浮动
---@param enable boolean # 开关
---@param detect_range? integer # 检测范围
function GameAPI.set_camera_floating_with_terrain(enable, detect_range) end

--修改某点的地形纹理
---@param position py.Point # 指定点
---@param texture_type integer # 纹理类型
---@param radius integer # 范围
---@param area_shape integer # 区域类型
function GameAPI.modify_point_texture(position, texture_type, radius, area_shape) end

--修改某点的地形高度
---@param position py.Point # 指定点
---@param terrain_height integer # 高度
---@param radius integer # 范围
---@param area_shape integer # 区域类型
function GameAPI.modify_point_height(position, terrain_height, radius, area_shape) end

--替换区域中的指定地形纹理
---@param area py.Area # 区域
---@param texture_type integer # 纹理类型
---@param new_texture_type integer # 新纹理类型
function GameAPI.replace_point_texture(area, texture_type, new_texture_type) end

--获取纹理类型
---@param position py.Point # 点
---@return integer # 纹理类型
function GameAPI.get_texture_type(position) end

--获取指定点的纹理类型
---@param position py.Point # 点
---@return integer # 纹理类型
function GameAPI.get_point_texture(position) end

--修改玩家的地表纹理
---@param role py.Role # 玩家
---@param bool_value boolean # 布尔值
function GameAPI.set_local_terrain_visible(role, bool_value) end

--修改材质属性
---@param obj py.Actor # 对象
---@param material_id integer # 材质id
---@param r_value number # R
---@param g_value number # G
---@param b_value number # B
---@param intensity? number # 强度
---@param alpha? number # 透明度
function GameAPI.set_material_param(obj, material_id, r_value, g_value, b_value, intensity, alpha) end

--为玩家设置滤镜效果
---@param role py.Role # 玩家
---@param value integer # id
function GameAPI.set_role_color_grading(role, value) end

--设置分辨率
---@param role py.Role # 玩家
---@param x_resolution number # 横向分辨率
---@param y_resolution number # 纵向分辨率
function GameAPI.set_screen_resolution(role, x_resolution, y_resolution) end

--设置窗口
---@param role py.Role # 玩家
---@param window_type string # 样式
function GameAPI.set_window_type(role, window_type) end

--开关目标点的草丛
---@param enable boolean # 开关
---@param point py.Point # 点
function GameAPI.set_grass_enable_by_pos(enable, point) end

--获取初始化窗口类别
---@return string # value
function GameAPI.get_window_mode() end

--获取初始化横向分辨率
---@return integer # value
function GameAPI.get_game_x_resolution() end

--获取初始化纵向分辨率
---@return integer # value
function GameAPI.get_game_y_resolution() end

--当前窗体横向尺寸
---@return integer # value
function GameAPI.get_window_real_x_size() end

--当前窗体纵向尺寸
---@return integer # value
function GameAPI.get_window_real_y_size() end

--获取屏幕横向分辨率
---@return integer # value
function GameAPI.get_screen_x_resolution() end

--获取屏幕纵向分辨率
---@return integer # value
function GameAPI.get_screen_y_resolution() end

--判断玩家单位类型前置条件满足需求
---@param player py.Role # 玩家
---@param unity_key py.UnitKey # 单位类型
---@return boolean # 是否满足
function GameAPI.check_unit_key_precondition(player, unity_key) end

--判断玩家物品类型前置条件满足需求
---@param player py.Role # 玩家
---@param item_key py.ItemKey # 物品类型
---@return boolean # 是否满足
function GameAPI.check_item_key_precondition(player, item_key) end

--判断玩家科技类型前置条件满足需求
---@param player py.Role # 玩家
---@param tech_key py.TechKey # 科技类型
---@return boolean # 是否满足
function GameAPI.check_tech_key_precondition(player, tech_key) end

--判断玩家技能类型前置条件满足需求
---@param player py.Role # 玩家
---@param ability_key py.AbilityKey # 技能类型
---@return boolean # 是否满足
function GameAPI.check_ability_key_precondition(player, ability_key) end

--获取技能类型的前置条件列表
---@param ability_key py.AbilityKey # 技能类型
---@return py.List # 前置条件列表
function GameAPI.get_ability_key_precondition_list(ability_key) end

--获取单位类型的前置条件列表
---@param unit_key py.UnitKey # 单位类型
---@return py.List # 前置条件列表
function GameAPI.get_unit_key_precondition_list(unit_key) end

--获取物品类型的前置条件列表
---@param item_key py.ItemKey # 物品类型
---@return py.List # 前置条件列表
function GameAPI.get_item_key_precondition_list(item_key) end

--获取前置条件遍历到的单位类型
---@param iter_data py.Actor # 数据
---@return py.UnitKey # 单位类型
function GameAPI.get_pre_condition_iter_unit_key(iter_data) end

--获取前置条件遍历到的科技类型
---@param iter_data py.Actor # 数据
---@return py.TechKey # 科技类型
function GameAPI.get_pre_condition_iter_tech_key(iter_data) end

--获取前置条件遍历到的单位标签
---@param iter_data py.Actor # 数据
---@return string # 单位标签
function GameAPI.get_pre_condition_iter_unit_tag(iter_data) end

--获取前置条件遍历到的科技标签
---@param iter_data py.Actor # 数据
---@return string # 科技标签
function GameAPI.get_pre_condition_iter_tech_tag(iter_data) end

--获取单位单位类型前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key py.UnitKey # 查询的单位类型
---@return integer # 需求值
function GameAPI.get_unit_type_unit_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取单位单位标签前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key string # 查询的单位标签
---@return integer # 需求值
function GameAPI.get_unit_type_unit_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取单位科技类型前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key py.TechKey # 查询的科技类型
---@return integer # 需求值
function GameAPI.get_unit_type_tech_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取单位科技标签前置条件的需求值
---@param source_item_key py.UnitKey # 检测的单位
---@param target_item_key string # 查询的科技标签
---@return integer # 需求值
function GameAPI.get_unit_type_tech_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能单位类型前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key py.UnitKey # 查询的单位类型
---@return integer # 需求值
function GameAPI.get_ability_type_unit_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能单位标签前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key string # 查询的单位标签
---@return integer # 需求值
function GameAPI.get_ability_type_unit_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能科技类型前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key py.TechKey # 查询的科技类型
---@return integer # 需求值
function GameAPI.get_ability_type_tech_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取技能科技标签前置条件的需求值
---@param source_item_key py.AbilityKey # 检测的技能
---@param target_item_key string # 查询的科技标签
---@return integer # 需求值
function GameAPI.get_ability_type_tech_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品单位类型前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key py.UnitKey # 查询的单位类型
---@return integer # 需求值
function GameAPI.get_item_type_unit_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品单位标签前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key string # 查询的单位标签
---@return integer # 需求值
function GameAPI.get_item_type_unit_tag_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品科技类型前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key py.TechKey # 查询的科技类型
---@return integer # 需求值
function GameAPI.get_item_type_tech_key_pre_condition_require_count(source_item_key, target_item_key) end

--获取物品科技标签前置条件的需求值
---@param source_item_key py.ItemKey # 检测的物品
---@param target_item_key string # 查询的科技标签
---@return integer # 需求值
function GameAPI.get_item_type_tech_tag_pre_condition_require_count(source_item_key, target_item_key) end

--设置控件适配
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param direction integer # 方向
---@param offset number # offset
function GameAPI.set_ui_comp_adapt_option(role, comp_name, direction, offset) end

--使玩家触发界面事件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param event_name string # 事件名
function GameAPI.trigger_ui_event(role, comp_name, event_name) end

--控制控件跟随鼠标
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_follow boolean # 是否跟随
---@param offset_x? number # 偏移x
---@param offset_y? number # 偏移y
function GameAPI.set_ui_comp_follow_mouse(role, comp_name, is_follow, offset_x, offset_y) end

--获得坐标是否在控件内
---@param role py.Role # 玩家
---@param x number # x
---@param y number # y
---@param comp_name string # 控件uid
---@return boolean # 是否在其中
function GameAPI.pos_in_comp_box(role, x, y, comp_name) end

--设置模型控件的镜头模式
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param camera_mod integer # 镜头模式
function GameAPI.set_model_comp_camera_mod(role, comp_uid, camera_mod) end

--设置不同状态下的按钮文本
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param btn_status integer # 按钮状态
---@param btn_text string # 文本
function GameAPI.set_ui_btn_status_string(role, comp_uid, btn_status, btn_text) end

--设置不同状态下的按钮图片
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param btn_status integer # 按钮状态
---@param btn_image integer # 图片
function GameAPI.set_ui_btn_status_image(role, comp_uid, btn_status, btn_image) end

--设置列表控件的布局方式
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param scrollview_type integer # 布局方式
function GameAPI.set_ui_scrollview_type(role, comp_uid, scrollview_type) end

--设置列表控件的尺寸是否跟随子控件变化
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param flag boolean # 布尔值
function GameAPI.set_ui_scrollview_size_change_according_children(role, comp_uid, flag) end

--设置图片颜色
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_ui_image_color(role, comp_uid, r, g, b, a) end

--设置图片颜色(hex)
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
---@param color string # hex
---@param a number # A
function GameAPI.set_ui_image_color_hex(role, comp_uid, color, a) end

--界面-获取控件的真实长度
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
function GameAPI.get_role_ui_comp_real_width(role, comp_uid) end

--界面-获取控件的真实高度
---@param role py.Role # 玩家
---@param comp_uid string # 控件名
function GameAPI.get_role_ui_comp_real_height(role, comp_uid) end

--界面-获取玩家鼠标真实x坐标
---@param role py.Role # 玩家
function GameAPI.get_role_real_mouse_x(role) end

--界面-获取玩家鼠标真实y坐标
---@param role py.Role # 玩家
function GameAPI.get_role_real_mouse_y(role) end

--设置当前聊天框控件
---@param role py.Role # 玩家
---@param comp_uid string # 聊天框id
function GameAPI.set_cur_chatbox(role, comp_uid) end

--界面组件是否存在
---@param ui_comp string # 界面组件名称
---@return boolean # 是否存在
function GameAPI.ui_comp_is_exist(ui_comp) end

--显示ui组件并播放动画
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param anim_name? string # 动画名
function GameAPI.show_ui_comp_animation(role, comp_name, anim_name) end

--隐藏ui组件并播放动画
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param anim_name? string # 动画名
function GameAPI.hide_ui_comp_animation(role, comp_name, anim_name) end

--设置ui组件坐标
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_pos(role, comp_name, x, y) end

--设置ui组件坐标没有转化
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_pos_no_trans(role, comp_name, x, y) end

--设置ui组件缩放
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param width number # width
---@param height number # height
function GameAPI.set_ui_comp_scale(role, comp_name, width, height) end

--设置ui组件尺寸
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param width number # width
---@param height number # height
function GameAPI.set_ui_comp_size(role, comp_name, width, height) end

--设置ui组件深度
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param z_order integer # z_order
function GameAPI.set_ui_comp_z_order(role, comp_name, z_order) end

--设置ui组件图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_image(role, comp_name, image_id) end

--设置ui列表组件间距
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param margin integer # 间距
function GameAPI.set_ui_comp_margin(role, comp_name, margin) end

--设置ui组件图片(图片类型)
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id py.Texture # 图片
function GameAPI.set_ui_comp_image_with_icon(role, comp_name, image_id) end

--设置ui组件序列帧
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id py.Sequence # 图片
function GameAPI.set_ui_comp_sequence(role, comp_name, image_id) end

--播放序列帧
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param loop? py.Sequence # 图片
---@param space? boolean # 循环
---@param start_frame? number # 间隔
---@param end_frame? integer # 开始帧
function GameAPI.play_ui_comp_sequence(role, comp_name, loop, space, start_frame, end_frame) end

--停止播放序列帧
---@param role py.Role # 玩家
---@param comp_name string # 控件名
function GameAPI.stop_ui_comp_sequence(role, comp_name) end

--设置进度条最大值
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param max_value number # 最大值
function GameAPI.set_progress_bar_max_value(role, comp_name, max_value) end

--设置进度条当前值
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param current_value number # 当前值
---@param time? number # 渐变时间
function GameAPI.set_progress_bar_current_value(role, comp_name, current_value, time) end

--设置ui开启/关闭
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param current_value boolean # 是否开启
function GameAPI.set_ui_comp_enable(role, comp_name, current_value) end

--设置ui显示/隐藏
---@param role py.Role # 玩家
---@param visible boolean # 显/隐
---@param comp_name string # 控件名
function GameAPI.set_ui_comp_visible(role, visible, comp_name) end

--设置ui文本颜色
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_ui_comp_font_color(role, comp_name, r, g, b, a) end

--设置ui文本颜色(HEX)
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param color string # hex
---@param a number # A
function GameAPI.set_ui_comp_font_color_hex(role, comp_name, color, a) end

--设置ui文本
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param content string # 文本
function GameAPI.set_ui_comp_text(role, comp_name, content) end

--设置ui文本大小
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param size integer # 文本大小
function GameAPI.set_ui_comp_font_size(role, comp_name, size) end

--设置输入框获得焦点
---@param role py.Role # 玩家
---@param comp_name string # 控件名
function GameAPI.set_input_field_focus(role, comp_name) end

--设置输入框失去焦点
---@param role py.Role # 玩家
---@param comp_name string # 控件名
function GameAPI.set_input_field_not_focus(role, comp_name) end

--播放UI控件时间轴动画
function GameAPI.play_ui_comp_anim() end

--停止UI控件时间轴动画
---@param role py.Role # 玩家
---@param anim_id py.UIAnimKey # UI动画
function GameAPI.stop_ui_comp_anim(role, anim_id) end

--绑定技能实体到控件
---@param role py.Role # 玩家
---@param ability py.Ability # 技能对象
---@param comp_name string # 控件名
function GameAPI.set_skill_on_ui_comp(role, ability, comp_name) end

--解绑技能实体到控件
---@param role py.Role # 玩家
---@param ability py.Ability # 技能对象
---@param comp_name string # 控件名
function GameAPI.unbind_skill_on_ui_comp(role, ability, comp_name) end

--设置控件透明度
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param opacity number # 透明度
function GameAPI.set_ui_comp_opacity(role, comp_name, opacity) end

--绑定对象到BUFF控件
---@param role py.Role # 玩家
---@param unit py.Unit # 单位对象
---@param comp_name string # 控件名
---@param effect? integer # BUFF效果类型
function GameAPI.set_buff_on_ui_comp(role, unit, comp_name, effect) end

--绑定物品实体到道具栏控件
---@param role py.Role # 玩家
---@param item py.Item # 物品对象
---@param comp_name string # 控件名
function GameAPI.set_item_on_ui_comp(role, item, comp_name) end

--设置道具栏控件类型和槽位号
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param slot_type py.SlotType # 类型
---@param slot_index integer # 槽位id
function GameAPI.set_ui_comp_slot(role, comp_name, slot_type, slot_index) end

--设置道具栏控件类型和槽位号
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param unit py.Unit # 单位
---@param slot_type py.SlotType # 类型
---@param slot_index integer # 槽位id
function GameAPI.set_ui_comp_unit_slot(role, comp_name, unit, slot_type, slot_index) end

--设置预设主界面UI显隐
---@param role py.Role # 玩家
---@param visible boolean # 显隐
function GameAPI.set_prefab_ui_visible(role, visible) end

--播放/停止技能按钮激活动效
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param play boolean # 播放/停止
function GameAPI.set_skill_btn_action_effect(role, comp_name, play) end

--设置按钮快捷键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_btn_short_cut(role, comp_name, btn) end

--设置按钮辅助键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_btn_func_short_cut(role, comp_name, btn) end

--设置技能按钮智能施法快捷键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_skill_btn_smart_cast_key(role, comp_name, btn) end

--设置技能按钮智能施法辅助键
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param btn integer # 按键ID
function GameAPI.set_skill_btn_func_smart_cast_key(role, comp_name, btn) end

--设置UI模型控件ID
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param model_id py.Model # 模型id
function GameAPI.set_ui_model_id(role, comp_name, model_id) end

--设置UI模型控件单位
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param model_unit py.Unit # 单位
---@param clone_effect? boolean # 继承特效
---@param clone_attach? boolean # 继承挂接模型
---@param clone_material? boolean # 继承材质变化
function GameAPI.set_ui_model_unit(role, comp_name, model_unit, clone_effect, clone_attach, clone_material) end

--播放魔法效果表现到模型控件
---@param modifier_key py.ModifierKey # 魔法效果类型
---@param modifier_state integer # 播放枚举
---@param role py.Role # 玩家
---@param comp_name string # 控件名
function GameAPI.set_modifier_on_ui_model(modifier_key, modifier_state, role, comp_name) end

--设置玩家的商店控件的目标商店单位
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param shop_unit py.Unit # 商店单位
---@param index py.Unit # 页签索引
function GameAPI.set_shop_comp_bind_shop_unit(role, comp_name, shop_unit, index) end

--设置玩家的合成控件的参数并刷新
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param item_id py.ItemID # 合成目标物品id
---@param shop_unit py.Unit # 商店单位
---@param buy_unit py.Unit # 购买单位
function GameAPI.set_compose_comp_refresh(role, comp_name, item_id, shop_unit, buy_unit) end

--设置ui模型控件背景色
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_show_room_background_color(role, comp_name, r, g, b, a) end

--设置Showroom的fov
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param fov number # fov
function GameAPI.change_showroom_fov(role, comp_name, fov) end

--设置Showroom的camera pos
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
---@param z number # z
function GameAPI.change_showroom_cposition(role, comp_name, x, y, z) end

--设置Showroom的camera rotation
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param pitch number # pitch
---@param roll number # roll
---@param yaw number # yaw
function GameAPI.change_showroom_crotation(role, comp_name, pitch, roll, yaw) end

--设置grid_view的子item数量
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param count integer # 子节点数量
function GameAPI.set_grid_view_item_count(role, comp_name, count) end

--获得gridview的子控件
---@param comp_name string # 控件名
---@param index integer # 索引
---@return string # 子控件
function GameAPI.get_grid_view_item(comp_name, index) end

--设置控件旋转
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param rotation number # 角度
function GameAPI.set_ui_comp_rotation(role, comp_name, rotation) end

--设置控件是否拦截
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param swallow boolean # 是否拦截点击
function GameAPI.set_ui_comp_swallow(role, comp_name, swallow) end

--设置控件是否可拖动
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param can_drag boolean # 是否可拖动
function GameAPI.set_ui_comp_drag(role, comp_name, can_drag) end

--设置控件世界坐标
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_world_pos(role, comp_name, x, y) end

--设置控件世界旋转
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param rotation number # rotation
function GameAPI.set_ui_comp_world_rotation(role, comp_name, rotation) end

--设置控件世界缩放
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param scale_x number # scale_x
---@param scale_y number # scale_y
function GameAPI.set_ui_comp_world_scale(role, comp_name, scale_x, scale_y) end

--获取当前玩家控件相对位置x
---@param comp_name string # 控件名
---@return py.Fixed # x
function GameAPI.get_ui_comp_pos_x(comp_name) end

--获取当前玩家控件相对位置y
---@param comp_name string # 控件名
---@return py.Fixed # y
function GameAPI.get_ui_comp_pos_y(comp_name) end

--获取当前玩家控件绝对位置x
---@param comp_name string # 控件名
---@return py.Fixed # x
function GameAPI.get_ui_comp_world_pos_x(comp_name) end

--获取当前玩家控件绝对位置y
---@param comp_name string # 控件名
---@return py.Fixed # y
function GameAPI.get_ui_comp_world_pos_y(comp_name) end

--获取当前玩家控件相对旋转
---@param comp_name string # 控件名
---@return py.Fixed # rotation
function GameAPI.get_ui_comp_rotation(comp_name) end

--获取当前玩家控件绝对旋转
---@param comp_name string # 控件名
---@return py.Fixed # rotation
function GameAPI.get_ui_comp_world_rotation(comp_name) end

--获取当前玩家控件相对缩放x
---@param comp_name string # 控件名
---@return py.Fixed # scale_x
function GameAPI.get_ui_comp_scale_x(comp_name) end

--获取当前玩家控件相对缩放y
---@param comp_name string # 控件名
---@return py.Fixed # scale_y
function GameAPI.get_ui_comp_scale_y(comp_name) end

--获取当前玩家控件绝对缩放x
---@param comp_name string # 控件名
---@return py.Fixed # scale_x
function GameAPI.get_ui_comp_world_scale_x(comp_name) end

--获取当前玩家控件绝对缩放y
---@param comp_name string # 控件名
---@return py.Fixed # scale_y
function GameAPI.get_ui_comp_world_scale_y(comp_name) end

--创建ui控件
---@param role py.Role # 玩家
---@param comp_name string # 父节点
---@param comp_type integer # 控件类型
---@return string # 控件uid
function GameAPI.create_ui_comp(role, comp_name, comp_type) end

--查找指定名字的UI控件
---@param role py.Role # 玩家
---@param comp_name string # 节点名字
---@return string # 控件uid
function GameAPI.get_ui_comp_id_by_name(role, comp_name) end

--创建并绑定ui控件事件
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@return string # 事件名
function GameAPI.create_ui_comp_event(role, comp_uid, event_type) end

--创建并绑定ui控件事件(指定事件名)
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@param name string # 自定义事件名
---@return string # 事件名
function GameAPI.create_ui_comp_event_ex(role, comp_uid, event_type, name) end

--新版创建并绑定ui控件事件(指定事件名),不再传入玩家，同时支持普通控件和动态创建控件
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@param name string # 自定义事件名
---@param user_data string # 自定义数据
---@return string # 事件名
function GameAPI.create_ui_comp_event_ex_ex(comp_uid, event_type, name, user_data) end

--创建并绑定ui控件事件(指定事件名)
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@param name string # 自定义事件名
---@return string # 事件名
function GameAPI.create_ui_comp_event_ex_no_check(role, comp_uid, event_type, name) end

--获取场景ui中的控件
---@param scene_node_entity py.SceneNode # 场景点
---@param comp_path string # 控件路径
---@return string # 控件名
function GameAPI.get_ui_comp_in_scene_ui(scene_node_entity, comp_path) end

--获取场景ui中的控件
---@param scene_node_entity py.SceneNode # 场景点
---@param comp_uid string # 模板控件uid
---@return string # uid
function GameAPI.get_ui_comp_in_scene_ui_ex(scene_node_entity, comp_uid) end

--通过控件+路径获得ui控件
---@param role py.Role # 玩家
---@param comp_name string # 父节点
---@param path string # 路径
---@return string # 控件uid
function GameAPI.get_comp_by_path(role, comp_name, path) end

--通过绝对路径获得ui控件
---@param role py.Role # 玩家
---@param path string # 路径
---@return string # 控件uid
function GameAPI.get_comp_by_absolute_path(role, path) end

--播放ui动效
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@param fx_id integer # 控件动效工程id
---@param ani_name string # 动效名
---@param loop? boolean # 循环
function GameAPI.play_ui_comp_fx(role, uid, fx_id, ani_name, loop) end

--播放spine动画
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@param fx_id py.Spine # 控件动效工程id
---@param ani_name string # 动效名
---@param loop? boolean # 循环
function GameAPI.play_ui_spine(role, uid, fx_id, ani_name, loop) end

--ui模型控件播放动画
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@param anim string # 动画名
---@param play_speed? number # 动画速率
---@param begin_t? number # 开始时间
---@param end_t? number # 结束时间
---@param loop? boolean # 是否循环
---@param return_idle? boolean # 是否回到默认动画
function GameAPI.play_ui_model_anim(role, uid, anim, play_speed, begin_t, end_t, loop, return_idle) end

--设置ui组件悬浮态图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_suspend_image(role, comp_name, image_id) end

--设置ui组件按下态图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_press_image(role, comp_name, image_id) end

--设置ui组件禁用态图片
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id integer # 图片id
function GameAPI.set_ui_comp_disabled_image(role, comp_name, image_id) end

--清空下拉框
---@param role py.Role # 玩家
---@param comp_id string # 下拉框
function GameAPI.clear_combo_box(role, comp_id) end

--添加下拉框选项
---@param role py.Role # 玩家
---@param comp_id string # 下拉框
---@param text string # 名称
---@param value string # 值
function GameAPI.add_combo_item(role, comp_id, text, value) end

--设置下拉框默认文本
---@param role py.Role # 玩家
---@param comp_id string # 下拉框
---@param text string # 默认文本
function GameAPI.set_combo_text(role, comp_id, text) end

--获取下拉框当前值
---@param comp_id string # 下拉框
---@return string # value
function GameAPI.get_combo_box_cur_value(comp_id) end

--获取滑动条当前值
---@param comp_id string # 滑动条
---@return py.Fixed # value
function GameAPI.get_slider_cur_percent(comp_id) end

--设置滑动条当前值
---@param role py.Role # 玩家
---@param comp_id string # 滑动条
---@param value number # value
function GameAPI.set_slider_cur_percent(role, comp_id, value) end

--获得控件宽度
---@param comp_id string # UI控件
---@return integer # width
function GameAPI.get_ui_comp_width(comp_id) end

--获得控件高度
---@param comp_id string # UI控件
---@return integer # height
function GameAPI.get_ui_comp_height(comp_id) end

--设置ui按钮是否开启多态
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param is_open boolean # 是否开启
function GameAPI.set_ui_comp_bar_status(role, comp_name, is_open) end

--设置UI控件模型焦点
---@param player py.Role # 玩家
---@param comp_name string # UI控件
---@param x number # x
---@param y number # y
---@param z number # z
function GameAPI.set_ui_model_focus_pos(player, comp_name, x, y, z) end

--获取ui控件的子控件
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@return py.List # 子控件uid
function GameAPI.get_ui_comp_children(role, uid) end

--获取ui控件的子控件
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@return py.List # 子控件uid
function GameAPI.get_ui_comp_children_no_check(role, uid) end

--获取ui控件的名称
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return string # 控件名
function GameAPI.get_ui_comp_name(role, comp_name) end

--解绑绑定控件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
function GameAPI.unbind_ui_comp(role, comp_name) end

--绑定单位属性或者全局变量到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param attr_or_var string # 属性名
---@param precision? integer # 保留小数精度
function GameAPI.set_ui_comp_bind_attr(role, ui_comp, ui_comp_attr, attr_or_var, precision) end

--绑定单位属性或者全局变量到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param attr_or_var string # 属性名
---@param precision? integer # 保留小数精度
function GameAPI.set_ui_comp_bind_var(role, ui_comp, ui_comp_attr, attr_or_var, precision) end

--解绑界面控件属性绑定
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
function GameAPI.ui_comp_unbind(role, ui_comp, ui_comp_attr) end

--界面控件属性绑定指定单位
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param unit py.Unit # 单位
function GameAPI.ui_comp_bind_unit(role, ui_comp, unit) end

--界面控件属性动态绑定主控单位
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
function GameAPI.ui_comp_bind_ctrl_unit(role, ui_comp) end

--获取界面控件的父控件
---@param role py.Role # 玩家
---@param comp_uid string # 界面控件
---@return string # 父控件
function GameAPI.get_ui_comp_parent(role, comp_uid) end

--绑定玩家属性到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param bind_role py.Role # 玩家
---@param attr_or_var string # 玩家属性key
---@param precision? integer # 保留小数精度
function GameAPI.set_ui_comp_bind_player_prop(role, ui_comp, ui_comp_attr, bind_role, attr_or_var, precision) end

--设置控件文本对齐方式
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param align_type integer # 对齐方式
function GameAPI.set_ui_comp_align(role, comp_name, align_type) end

--注册界面控件播放指定动效回调
---@param role py.Role # 玩家
---@param uid string # 控件uid
---@param fx_id integer # 控件动效工程id
---@param ani_name string # 动效名
---@param frame integer # 播放动效回调帧数
---@param handler string # 回调句柄
function GameAPI.register_ui_comp_fx_cb(role, uid, fx_id, ani_name, frame, handler) end

--创建界面模块
---@param role py.Role # 玩家
---@param prefab_id string # 预设uid
---@param comp_name string # 父控件
---@return string # 控件uid
function GameAPI.create_ui_prefab_instance(role, prefab_id, comp_name) end

--删除界面控件
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
function GameAPI.del_ui_comp(role, comp_name) end

--开启字体大小跟随内容自适应
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_open boolean # 开启/关闭
function GameAPI.set_ui_comp_text_adaptive(role, comp_name, is_open) end

--绑定技能cd到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param ability py.Ability # 技能实体对象
function GameAPI.set_ui_comp_bind_ability_cd(role, ui_comp, ui_comp_attr, ability) end

--绑定魔法效果cd到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param modifier py.ModifierEntity # 技能实体对象
function GameAPI.set_ui_comp_bind_modifier_cd(role, ui_comp, ui_comp_attr, modifier) end

--开启/禁用发送聊天功能
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param enabled boolean # 开关
function GameAPI.set_chat_send_enabled(role, ui_comp, enabled) end

--显示/不显示玩家聊天
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param chat_role py.Role # 玩家
---@param is_show boolean # 开关
function GameAPI.set_player_chat_show(role, ui_comp, chat_role, is_show) end

--清理聊天
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
function GameAPI.clear_player_chat_panel(role, ui_comp) end

--发送聊天给玩家
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param target_role py.Role # 玩家
---@param context string # 内容
function GameAPI.send_chat_to_role(role, ui_comp, target_role, context) end

--删除界面预制实例
---@param ui_prefab_ins string # 控件名
function GameAPI.del_ui_prefab(ui_prefab_ins) end

--获得玩家控件显隐性
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return boolean # 是否显示
function GameAPI.get_ui_comp_visible(role, comp_name) end

--设置玩家的声音主单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.set_role_micro_unit(role, unit) end

--关闭【玩家】的附近语音聊天
---@param role py.Role # 玩家
function GameAPI.close_role_micro_unit(role) end

--设置【玩家】的同阵营语音聊天收听开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_camp_sound_switch(role, is_open) end

--设置【玩家】的同阵营语音聊天发言开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_camp_micro_switch(role, is_open) end

--设置【玩家】的附近语音聊天发言开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_nearby_micro_switch(role, is_open) end

--设置【玩家】的附近语音聊天收听开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_nearby_sound_switch(role, is_open) end

--设置【玩家】的所有人语音聊天收听开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_all_sound_switch(role, is_open) end

--设置【玩家】的所有人语音聊天发言开关为【布尔】
---@param role py.Role # 玩家
---@param is_open boolean # 开关
function GameAPI.set_role_all_micro_switch(role, is_open) end

--设置聊天控件的频道为同盟或者所有人
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_ally boolean # 是否为同盟
function GameAPI.set_ui_comp_chat_channel(role, comp_name, is_ally) end

--设置界面控件锚点
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param x number # x
---@param y number # y
function GameAPI.set_ui_comp_anchor(role, comp_name, x, y) end

--设置界面控件九宫开关
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param switch boolean # 开关
function GameAPI.set_ui_comp_scale_9_enable(role, comp_name, switch) end

--设置界面控件九宫值
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param x_left integer # x
---@param x_right integer # y
---@param y_top integer # width
---@param y_bottom integer # height
function GameAPI.set_ui_comp_cap_insets(role, comp_name, x_left, x_right, y_top, y_bottom) end

--设置ui控件绑定公式
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param format_str string # 公式
function GameAPI.set_ui_comp_bind_format(role, comp_name, format_str) end

--设置列表滚动到百分比位置
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param percent number # 百分比
function GameAPI.set_list_view_percent(role, comp_name, percent) end

--获得玩家的界面模块实例
---@param role py.Role # 玩家
---@param uid string # 界面模块实例uid
---@return py.UIPrefabIns # 界面模块实例
function GameAPI.get_ui_prefab_ins(role, uid) end

--获得界面控件所属的界面模块实例(如果是的话)
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return py.UIPrefabIns # 界面预制体实例
function GameAPI.get_ui_comp_prefab(role, comp_name) end

--设置字体大小跟随内容自适应最小值(需要重新设置文本生效)
---@param role py.Role # 玩家
---@param min_value integer # 最小值
function GameAPI.set_ui_comp_text_adaptive_min_size(role, min_value) end

--通过预制实例+路径获得ui控件
---@param prefab_ins py.UIPrefabIns # 预制
---@param path string # 路径
---@return string # 控件uid
function GameAPI.get_ui_prefab_child_by_path(prefab_ins, path) end

--获得玩家输入框文本内容
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return string # 文本内容
function GameAPI.get_input_field_content(role, comp_name) end

--设置动画移动
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_x number # 开始x
---@param start_y number # 开始y
---@param end_x number # 结束x
---@param end_y number # 结束y
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_pos(role, comp_name, start_x, start_y, end_x, end_y, duration, ease_type) end

--设置动画透明度
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_alpha number # 开始alpha
---@param end_alpha number # 结束alpha
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_opacity(role, comp_name, start_alpha, end_alpha, duration, ease_type) end

--设置动画缩放
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_x number # 开始x
---@param start_y number # 开始y
---@param end_x number # 结束x
---@param end_y number # 结束y
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_scale(role, comp_name, start_x, start_y, end_x, end_y, duration, ease_type) end

--设置动画旋转
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param start_rotation number # 开始旋转
---@param end_rotation number # 结束旋转
---@param duration number # 持续时间
---@param ease_type? integer # 曲线类型
function GameAPI.set_ui_comp_anim_rotate(role, comp_name, start_rotation, end_rotation, duration, ease_type) end

--设置使用物品操作方式
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param use_operation integer # 操作方式
function GameAPI.set_equip_slot_use_operation(role, comp_uid, use_operation) end

--设置拖拽物品操作方式
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param drag_operation integer # 操作方式
function GameAPI.set_equip_slot_drag_operation(role, comp_uid, drag_operation) end

--获取轮播图当前图片索引
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@return integer # 索引值
function GameAPI.get_page_view_current_index(role, comp_uid) end

--获取轮播图点击图片索引
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@return integer # 索引值
function GameAPI.get_page_view_click_index(role, comp_uid) end

--获取复选框当前选中状态
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@return boolean # 当前选中状态
function GameAPI.get_checkbox_selected(role, comp_name) end

--设置复选框当前选中状态
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param is_selected boolean # 选中状态
function GameAPI.set_checkbox_selected(role, comp_name, is_selected) end

--界面-设置屏幕坐标对应的世界坐标点
---@param x number # x
---@param y number # y
function GameAPI.set_world_point_by_ui_screen_point(x, y) end

--界面-设置屏幕坐标对应的世界坐标高度
---@param x number # x
---@param y number # y
function GameAPI.set_world_height_by_ui_screen_point(x, y) end

--界面-获取屏幕坐标对应的世界坐标点
---@return py.Point # 坐标
function GameAPI.get_world_point_by_ui_screen_point() end

--界面-获取屏幕坐标对应的世界坐标高度
---@return number # 高度
function GameAPI.get_world_height_by_ui_screen_point() end

--界面-获取标签页控件当前选中页索引
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@return number # 索引
function GameAPI.get_tab_widget_current_index(role, comp_uid) end

--界面-获取控件路径
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@return string # 路径
function GameAPI.get_ui_comp_path(role, comp_uid) end

--live2d控件播放动画
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param motion_name string # 动画名称
---@param ith? integer # 序号
---@param priority? integer # 优先级
---@param loop? boolean # 是否延续之前的播放
function GameAPI.play_live2d_anim(role, comp_uid, motion_name, ith, priority, loop) end

--live2d控件停止播放动画
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param motion_name string # 动画名称
---@param ith integer # 序号
function GameAPI.stop_live2d_anim(role, comp_uid, motion_name, ith) end

--live2d设置模型
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param model_id py.Live2d # live2d资源
function GameAPI.set_live2d_model_id(role, comp_uid, model_id) end

--live2d设置表情
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param expression string # 表情名称
function GameAPI.set_live2d_expression(role, comp_uid, expression) end

--live2d设置背景色
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param r number # R
---@param g number # G
---@param b number # B
---@param a number # A
function GameAPI.set_live2d_background_color(role, comp_name, r, g, b, a) end

--界面-删除界面事件
---@param comp_uid string # 控件uid
---@param event_type integer # 控件事件类型
---@param name string # 自定义事件名
function GameAPI.del_ui_comp_event(comp_uid, event_type, name) end

--创建新单位物编
---@param old_entity_no py.UnitKey # 单位物编
---@return py.UnitKey # 单位物编key
function GameAPI.create_unit_editor_data(old_entity_no) end

--设置相机透视射线的焦点单位
---@param role py.Role # 所属玩家
---@param unit py.Unit # 单位
function GameAPI.set_camera_perspective_ray_unit(role, unit) end

--create_spine
---@param ientity py.Unit # ientity
---@param spine string # spine
---@param vertical? boolean # vertical
---@param rate? number # rate
function GameAPI.create_spine(ientity, spine, vertical, rate) end

--单位属性m转cm
---@param attr string # 属性名
---@param value py.Fixed # 属性值
---@return py.Fixed # 属性值
function GameAPI.convert_unit_attr_m2cm(attr, value) end

--获取属性名
---@param attr_key string # 属性key
---@return string # 属性名
function GameAPI.api_get_attr_name(attr_key) end

--创建新技能物编
---@param old_entity_no py.AbilityKey # 技能物编
---@return py.AbilityKey # 技能物编
function GameAPI.create_ability_editor_data(old_entity_no) end

--获取技能类型的释放技能
---@param ability_key py.AbilityKey # 技能物编
---@return py.AbilityCastType # 技能释放类型
function GameAPI.api_get_ability_type_cast_type(ability_key) end

--创建新投射物物编
---@param old_entity_no py.ProjectileKey # 投射物物编
---@return py.ProjectileKey # 投射物物编
function GameAPI.create_projectile_editor_data(old_entity_no) end

--创建新可破坏物物编
---@param old_entity_no py.DestructibleKey # 可破坏物物编
---@return py.DestructibleKey # 可破坏物物编
function GameAPI.create_destructible_editor_data(old_entity_no) end

--获取指定对象类型的物编数据
---@param data_type string # 对象类型
---@param key integer # 物编key
---@return py.Dict # 物编数据
function GameAPI.api_get_editor_type_data(data_type, key) end

--设置指定对象类型的物编数据
---@param data_type string # 对象类型
---@param key integer # 物编key
---@param data py.Dict # 物编数据
function GameAPI.api_set_editor_type_data(data_type, key, data) end

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

--lua回调函数测试
---@param callback function # 回调函数
function GameAPI.test_lua_callback(callback) end

--获取玩家的宠物数量
---@param role py.Role # 要获取的目标玩家
---@param callback function # 回调函数
function GameAPI.get_role_pet_count(role, callback) end

--获取宠物属性信息
---@param pet_uid integer # 宠物唯一id
---@param callback function # 回调函数
function GameAPI.get_pet_attr_info(pet_uid, callback) end

--获取宠物当前状态
---@param pet_uid integer # 宠物唯一id
---@param callback function # 回调函数
function GameAPI.get_pet_state(pet_uid, callback) end

--执行宠物睡觉
---@param pet_uid integer # 宠物唯一id
---@param callback function # 回调函数
function GameAPI.pet_sleep(pet_uid, callback) end

--获取玩家选中的单个单位
---@param role_id py.RoleID # 玩家ID
function GameAPI.api_get_select_unit_single(role_id) end

--获取玩家选中的第一个单位
---@param role_id py.RoleID # 玩家ID
function GameAPI.api_get_select_unit_first(role_id) end

--获取玩家选中单位组(单位ID列表)
---@param role_id py.RoleID # 玩家ID
function GameAPI.api_get_select_unit_group(role_id) end

--获取COLLIDER所属的刚体
---@param collider py.Collider # Collider
---@return py.RigidBody # Body
function GameAPI.api_get_collider_body(collider) end

--设置碰撞体的布尔类型属性
---@param collider py.RigidBody # 刚体
---@param attr_name string # 布尔类型属性
---@param value py.Fixed # 值
function GameAPI.api_set_collider_bool_attr(collider, attr_name, value) end

--获取碰撞体的布尔类型属性
---@param collider py.RigidBody # 刚体
---@param attr_name string # 布尔类型属性
function GameAPI.api_get_collider_bool_attr(collider, attr_name) end

--设置碰撞体的实数类型属性
---@param collider py.RigidBody # 刚体
---@param attr_name string # 实数类型属性
---@param value boolean # 值
function GameAPI.api_set_collider_float_attr(collider, attr_name, value) end

--碰撞器的自身碰撞类别是否有指定类型
---@param collider py.Collider # 碰撞器
---@param mask py.Fixed # mask
---@return boolean # 布尔值
function GameAPI.api_is_collider_collision_category(collider, mask) end

--碰撞器的目标碰撞类别是否有指定类型
---@param collider py.Collider # 碰撞器
---@param mask py.Fixed # mask
---@return boolean # 布尔值
function GameAPI.api_is_collider_collide_with_mask(collider, mask) end

--碰撞器的自身碰撞类别是否有玩家
---@param collider py.Collider # 碰撞器
---@return boolean # 布尔值
function GameAPI.api_is_collider_collision_category_player(collider) end

--碰撞器的自身碰撞类别是否有地面
---@param collider py.Collider # 碰撞器
---@return boolean # 布尔值
function GameAPI.api_is_collider_collision_category_floor(collider) end

--获得碰撞器的自身碰撞类别
---@param collider py.Collider # 碰撞器
---@return integer # mask
function GameAPI.api_get_collider_collision_category(collider) end

--获得碰撞器的目标碰撞类别
---@param collider py.Collider # 碰撞器
---@return integer # mask
function GameAPI.api_get_collider_collide_with_mask(collider) end

--设置碰撞器的自身碰撞类别
---@param collider py.Collider # 碰撞器
---@param mask integer # mask
function GameAPI.api_set_collider_collision_category(collider, mask) end

--获得碰撞器的目标碰撞类别
---@param collider py.Collider # 碰撞器
---@param mask integer # mask
function GameAPI.api_set_collider_collide_with_mask(collider, mask) end

--根据jid获取joint
---@param jid integer # joint ID
---@return py.Joint # Joint
function GameAPI.api_get_joint_by_bid(jid) end

--创建固定关节
---@param pos py.FVector3 # 创建位置
---@param body_1 py.RigidBody # 刚体
---@param body_2 py.RigidBody # 刚体
---@param enable_collision? boolean # 检测碰撞
---@return py.RigidBody # Body
function GameAPI.api_create_fixed_joint(pos, body_1, body_2, enable_collision) end

--销毁关节
---@param joint py.Joint # 关节
function GameAPI.api_destroy_joint(joint) end

--根据id获取逻辑物理组件
---@param id integer # 物理组件id
---@return py.PhysicsEntity # PhysicsEntity
function GameAPI.api_get_physics_entity_by_id(id) end

--根据id获取物理组件
---@param comp_id integer # joint ID
---@return py.PhysicsObject # PhysicsObject
function GameAPI.api_get_physics_object_by_id(comp_id) end

--根据名称获取逻辑物理组件中的rigidbody
---@param entity py.PhysicsEntity # 物理组件
---@param name string # 名称
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_physics_entity(entity, name) end

--获取单位或者物理组件的位置
---@param unit py.Actor # 单位或物理组件
---@return py.FVector3 # Position
function GameAPI.api_get_unit_or_physics_entity_pos(unit) end

--射线检测
---@param start_point py.FVector3 # 起点
---@param end_point py.FVector3 # 终点
---@param query_filter? py.PhysicsFilter # 过滤器
---@return py.RigidBodyGroup # 是否有重叠
function GameAPI.api_physics_raycast(start_point, end_point, query_filter) end

--获得射线检测首次碰撞点
---@param start_point py.FVector3 # 起点
---@param end_point py.FVector3 # 终点
---@param query_filter? py.PhysicsFilter # 过滤器
---@return py.FVector3 # 碰撞点
function GameAPI.api_get_physics_raycast_first_point(start_point, end_point, query_filter) end

--设置物理组件可见性(以及是否为生效状态)
---@param physics_object_id py.Actor # 物理组件
---@param is_visible boolean # 是否可见
function GameAPI.api_set_physics_object_activated_and_visible(physics_object_id, is_visible) end

--设置逻辑物理组件可见性(以及是否为生效状态)
---@param entity py.Actor # 物理组件
---@param is_visible boolean # 是否可见
function GameAPI.api_set_physics_entity_activated_and_visible(entity, is_visible) end

--单位/逻辑物理组件之间是否有重叠
---@param entity_1 py.Actor # 单位/逻辑物理组件
---@param entity_2 py.Actor # 单位/逻辑物理组件
---@return boolean # 是否有重叠
function GameAPI.api_check_physics_is_overlapping(entity_1, entity_2) end

--单位/逻辑物理组件之间是否有碰撞
---@param entity_1 py.Actor # 单位/逻辑物理组件
---@param entity_2 py.Actor # 单位/逻辑物理组件
---@return boolean # 是否有重叠
function GameAPI.api_check_physics_is_contacting(entity_1, entity_2) end

--创建物理组件
---@param physics_object_id py.PhysicsObjectKey # 物理组件类型
---@param translation py.FVector3 # 位置
---@param direction py.FVector3 # 朝向
---@return py.PhysicsObject # 物理组件
function GameAPI.api_create_physics_object(physics_object_id, translation, direction) end

--创建逻辑物理组件
---@param physics_entity_id py.PhysicsObjectKey # 物理组件类型
---@param translation py.FVector3 # 位置
---@param direction py.FVector3 # 朝向
---@param scale? py.Fixed # 缩放
function GameAPI.api_create_physics_entity(physics_entity_id, translation, direction, scale) end

--删除物理组件
---@param physics_object_id py.Actor # 逻辑物理组件
function GameAPI.api_del_physics_object(physics_object_id) end

--删除逻辑物理组件
---@param physics_entity py.Actor # 逻辑物理组件
function GameAPI.api_del_physics_entity(physics_entity) end

--逻辑物理组件是否存在
---@param entity? py.PhysicsEntity # 逻辑物理组件
---@return boolean # 布尔值
function GameAPI.api_physics_entity_is_exist(entity) end

--逻辑物理组件中指定刚体的模型播放动画
---@param entity py.PhysicsEntity # 物理组件
---@param body py.RigidBody # 刚体
---@param anim_name string # 动画名称
---@param loop? boolean # 是否循环
---@param play_speed? py.Fixed # 速度
function GameAPI.api_physics_play_animation(entity, body, anim_name, loop, play_speed) end

--获得逻辑物理组件的状态
---@param entity py.PhysicsEntity # 物理组件
---@return py.PhysicsEntityState # 状态
function GameAPI.api_get_physics_entity_state(entity) end

--设置逻辑物理组件状态
---@param entity py.PhysicsEntity # 物理组件
---@param state py.PhysicsEntityState # 状态
function GameAPI.api_set_entity_state(entity, state) end

--设置逻辑物理组件的激活状态
---@param entity py.PhysicsEntity # 物理组件
---@param is_active boolean # 激活状态
---@param visible? boolean # 可见性
function GameAPI.api_set_entity_active(entity, is_active, visible) end

--判断逻辑物理组件是激活状态
---@param entity py.PhysicsEntity # 物理组件
---@return boolean # 激活状态
function GameAPI.api_is_physics_entity_active(entity) end

--判断逻辑物理组件是关闭状态
---@param entity py.PhysicsEntity # 物理组件
---@return boolean # 关闭状态
function GameAPI.api_is_physics_entity_deactive(entity) end

--根据id获得逻辑物理组件
---@param entity_id py.Fixed # id
---@return py.PhysicsEntity # 逻辑物理组件
function GameAPI.api_get_physics_entity(entity_id) end

--设置重力加速度
---@param gravity py.FVector3 # 重力加速度
function GameAPI.api_set_gravity(gravity) end

--创建特效到逻辑物理组件
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param body_name string # 刚体名称
---@param sfx_id py.Fixed # 特效ID
---@param b_follow_rotate? boolean # 是否跟随旋转
---@param b_follow_scale? boolean # 是否跟随缩放
---@param position? py.Vector3 # 偏移
---@param scale? py.Fixed # 缩放
---@param rotation? py.Vector3 # 旋转
---@param duration? py.Fixed # 持续时间
---@param immediately? boolean # 是否播放完移除
---@return py.Sfx # 特效
function GameAPI.api_create_sfx_on_rigid(entity, body_name, sfx_id, b_follow_rotate, b_follow_scale, position, scale, rotation, duration, immediately) end

--获取逻辑物理组件类型
---@param entity py.PhysicsEntity # 逻辑物理组件
---@return integer # 类型
function GameAPI.api_get_physics_entity_type(entity) end

--销毁逻辑物理组件
---@param entity py.PhysicsEntity # 逻辑物理组件
function GameAPI.api_destroy_physics_entity(entity) end

--设置逻辑物理组件旋转（欧拉角）
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param rotation py.FRotation # 欧拉角
function GameAPI.api_physics_entity_set_orientation(entity, rotation) end

--逻辑物理组件是否有指定tag
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.api_physics_entity_has_tag(entity, tag) end

--逻辑物理组件添加tag
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param tag string # tag
function GameAPI.api_physics_entity_add_tag(entity, tag) end

--逻辑物理组件删除tag
---@param entity py.PhysicsEntity # 逻辑物理组件
---@param tag string # tag
function GameAPI.api_physics_entity_remove_tag(entity, tag) end

--世界坐标转换屏幕坐标
---@param world_pos py.Vector3 # 世界坐标
function GameAPI.api_world_pos_to_camera_pos(world_pos) end

--世界坐标转换屏幕边缘坐标
---@param world_pos py.Vector3 # 世界坐标
---@param delta_dis py.Fixed # 定点数
function GameAPI.api_world_pos_to_screen_edge_pos(world_pos, delta_dis) end

--创建物理过滤器
---@param collision_category integer # 自身碰撞标签
---@param collide_with_mask integer # 目标碰撞标签
---@param ignore_trigger boolean # 是否忽略触发器
---@param ignore_non_trigger boolean # 是否忽略非触发器
---@param ignore_static_rb boolean # 是否忽略静态刚体
---@param ignore_dynamic_rb boolean # 是否忽略动态刚体
---@param ignore_kinematic_rb boolean # 是否忽略运动学刚体
---@return py.PhysicsFilter # 过滤器
function GameAPI.api_create_physics_filter(collision_category, collide_with_mask, ignore_trigger, ignore_non_trigger, ignore_static_rb, ignore_dynamic_rb, ignore_kinematic_rb) end

--获取单位的rigidBody
---@param unit py.Unit # 单位
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_unit(unit) end

--设置物理主控单位
---@param unit py.Unit # 单位
---@param ragdoll_collide? boolean # Ragdoll是否碰撞
function GameAPI.set_physics_ctrl_unit(unit, ragdoll_collide) end

--获取物理主控单位
---@param role py.Role # 玩家
---@return py.Unit # 单位
function GameAPI.get_physics_ctrl_unit(role) end

--设置主控单位可见性visual
---@param unit py.Unit # 单位
---@param is_visible boolean # 可见性
---@param only_self? boolean # 仅自己生效
---@param only_self_friend? boolean # 仅自己和友军生效
---@param only_enemy? boolean # 仅对敌军生效
function GameAPI.api_set_cc_visibility(unit, is_visible, only_self, only_self_friend, only_enemy) end

--创建单位
---@param key py.UnitKey # 单位编号
---@param location py.FVector3 # 位置
---@param direction py.FVector3 # 朝向
---@param role_or_unit py.Role # 所属玩家
---@return py.Unit # 创建出的单位
function GameAPI.create_unit_at_vector3(key, location, direction, role_or_unit) end

--单位传送到指定坐标
---@param unit py.Unit # 单位
---@param position py.FVector3 # 目标坐标
---@param clear_speed boolean # 是否清除速度
function GameAPI.api_unit_transmit_3d(unit, position, clear_speed) end

--复活单位
---@param unit py.Unit # 单位
---@param position py.FVector3 # 复活位置
---@param clear_speed boolean # 清除速度
function GameAPI.api_revive_unit_3d(unit, position, clear_speed) end

--获取角色所处状态机节点名称
---@param unit py.Unit # 单位
---@return string # 状态机节点名称
function GameAPI.api_get_character_state_name(unit) end

--让单位lookat镜头
---@param unit py.Unit # 单位
function GameAPI.cc_look_at_camera(unit) end

--让单位lookat目标单位
---@param unit py.Unit # 单位
---@param other_unit py.Unit # 单位
function GameAPI.cc_look_at_other_unit(unit, other_unit) end

--取消单位lookat
---@param unit py.Unit # 单位
function GameAPI.cc_cancel_look_at(unit) end

--获取单位周围的随机单位
---@param unit py.Unit # 单位
---@param radius py.Fixed # 距离
---@return py.Unit # 随机单位
function GameAPI.cc_get_random_unit_around(unit, radius) end

--动画状态机状态判断
---@param state1 py.CcAsmState # 动画机状态
---@param state2 py.CcAsmState # 动画机状态
---@return boolean # 是否相等
function GameAPI.api_check_asm_state(state1, state2) end

--获取单位碰撞盒里最近的抓取单位（测试用）
---@param unit py.Unit # 单位
---@return py.Unit # 距离最近的单位
function GameAPI.api_get_grab_character(unit) end

--抓取技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
function GameAPI.api_grab(source, target) end

--判断 - 是否可以施放暴揍技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
---@param bind string # 绑点名称
---@return boolean # 是否可以施放
function GameAPI.check_catch_other_character(source, target, bind) end

--暴揍技能
---@param source py.Unit # 施法单位
---@param target py.Unit # 目标单位
---@param state integer # 暴揍动作
---@param duration py.Fixed # 持续时间
---@param bind string # 绑点名称
function GameAPI.api_physics_catch(source, target, state, duration, bind) end

--移除手部黏连状态
---@param unit py.Unit # 单位
---@param handtype py.CcHandID # 左手/右手
function GameAPI.api_disconnect_hand(unit, handtype) end

--移除双手的黏连状态
---@param unit py.Unit # 单位
function GameAPI.api_disconnect_both_hands(unit) end

--检查手部是否处于黏连状态
---@param unit py.Unit # 单位
---@param handtype py.CcHandID # 左手/右手
---@return boolean # 是否黏连
function GameAPI.api_check_hand_connection(unit, handtype) end

--主控角色做预定义行为
---@param unit py.Unit # 角色
---@param cc_action py.CcActionID # 预定义行为ID
---@param cc_hand? py.CcHandID # 左手/右手
function GameAPI.cc_do_predefined_action(unit, cc_action, cc_hand) end

--重载角色动画状态
---@param unit py.Unit # 角色
---@param anim_status py.CcAnimationMachineStatus # 动画机节点名字
---@param anim_name string # 动画名
function GameAPI.api_override_anim_status(unit, anim_status, anim_name) end

--判断单位上半身行动受限
---@param unit py.Unit # 单位
---@return boolean # 是否受限
function GameAPI.is_upper_body_limited(unit) end

--投掷技能
---@param unit py.Unit # 施法单位
function GameAPI.api_physics_throw(unit) end

--拾取物品
---@param unit py.Unit # 施法单位
function GameAPI.api_physics_pick_up(unit) end

--拾取指定物品
---@param unit py.Unit # 单位
---@param item py.Unit # 物品
function GameAPI.api_physics_pick_up_item(unit, item) end

--单位丢弃物理道具
---@param unit py.Unit # 单位
function GameAPI.api_physics_drop(unit) end

--施加倒地状态
---@param unit py.Unit # 施加目标
---@param duration py.Fixed # 持续时间
function GameAPI.api_physics_hit_down_unit(unit, duration) end

--获取抓举单位
---@param unit py.Unit # 单位
function GameAPI.api_get_grab_unit(unit) end

--检查是否处于抓举状态
---@param unit py.Unit # 单位
---@return boolean # 是否处于抓举状态
function GameAPI.api_check_grab_state(unit) end

--获取手持物品
---@param unit py.Unit # 单位
function GameAPI.api_get_pick_item(unit) end

--检查是否手持物品
---@param unit py.Unit # 单位
---@return boolean # 是否手持物品
function GameAPI.api_check_physics_unit_pick_item_exist(unit) end

--增加击倒值
---@param unit py.Unit # 单位
---@param down_value py.Fixed # 击倒值
function GameAPI.api_add_unit_down_value(unit, down_value) end

--开始使用手持道具
---@param unit py.Unit # 单位
function GameAPI.api_character_try_begin_use(unit) end

--结束使用手持道具
---@param unit py.Unit # 单位
function GameAPI.api_character_try_end_use(unit) end

--设置动画状态机为物理状态
---@param unit py.Unit # 单位
---@param duration py.Fixed # 持续时间
function GameAPI.api_set_entity_anim_state_machine_physics(unit, duration) end

--获取角色移动速度
---@param unit py.Unit # 单位
---@return py.FVector3 # 速度
function GameAPI.api_physics_unit_get_move_speed(unit) end

--设置单位旋转（欧拉角）
---@param unit py.Unit # 单位
---@param rotation py.FRotation # X
function GameAPI.api_physics_unit_set_orientation(unit, rotation) end

--主控角色做预定义表情
---@param unit py.Unit # 角色
---@param cc_emo py.CcEmo # 预定义表情ID
---@param duration py.Fixed # 表情播放时长
function GameAPI.cc_change_emo(unit, cc_emo, duration) end

--单位切换状态机
---@param unit py.Unit # 单位
---@param state_name string # 状态机名称
function GameAPI.api_asm_jump_to_state(unit, state_name) end

--设置角色squash
---@param unit py.Unit # 角色
---@param squash py.Fixed # squash
function GameAPI.api_set_unit_squash(unit, squash) end

--设置单位移动
---@param unit py.Unit # 单位
---@param move_direction py.MoveDirection # 方向
function GameAPI.api_set_unit_move(unit, move_direction) end

--设置单位停止移动
---@param unit py.Unit # 单位
---@param move_direction py.MoveDirection # 方向
function GameAPI.api_set_unit_stop_move(unit, move_direction) end

--通知改键
---@param enable boolean # 是否使用
function GameAPI.api_notify_custom_key(enable) end

--设置单位跳跃
---@param unit py.Unit # 单位
function GameAPI.api_set_unit_jump(unit) end

--设置单位跑(角色配置的跑步速度)
---@param unit py.Unit # 单位
function GameAPI.api_set_unit_run(unit) end

--设置单位走(角色配置的走路速度)
---@param unit py.Unit # 单位
function GameAPI.api_set_unit_walk(unit) end

--设置单位速度
---@param unit py.Unit # 单位
---@param speed py.Fixed # 速度
function GameAPI.api_set_unit_speed(unit, speed) end

--设置语音指令
---@param is_on boolean # 是否开启
function GameAPI.api_set_audio_cc(is_on) end

--根据bid获取rigidBody
---@param bid integer # body ID
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_by_bid(bid) end

--刚体添加球形碰撞器
---@param body py.RigidBody # 刚体
---@param pos py.FVector3 # pos
---@param radius py.Fixed # radius
---@param euler_angle? py.FVector3 # euler_angle
---@param is_trigger? boolean # is_trigger
function GameAPI.api_add_sphere_collider(body, pos, radius, euler_angle, is_trigger) end

--根据名称获取物理组件中的rigidbody
---@param physics_object py.PhysicsEntity # 物理组件
---@param name string # 名称
---@return py.RigidBody # RigidBody
function GameAPI.api_get_rigid_body_in_physics_object(physics_object, name) end

--获取刚体所属的单位
---@param body py.RigidBody # 刚体
---@return py.Unit # Owner
function GameAPI.api_get_rigid_body_owner_unit(body) end

--获取刚体所属的逻辑物理组件
---@param body py.RigidBody # 刚体
---@return py.PhysicsEntity # Owner
function GameAPI.api_get_rigid_body_owner_physics_entity(body) end

--向刚体施加力
---@param body py.RigidBody # 刚体
---@param force py.Fixed # 力度
---@param direction py.FVector3 # 方向
---@return py.RigidBody # RigidBody
function GameAPI.api_add_force_to_rigid_body(body, force, direction) end

--给刚体叠加速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度的大小
---@param direction py.FVector3 # 速度的方向
---@return py.RigidBody # RigidBody
function GameAPI.api_add_velocity_to_rigid_body(body, speed, direction) end

--获取刚体的位置
---@param body py.RigidBody # 刚体
---@return py.FVector3 # Position
function GameAPI.api_get_rigid_body_pos(body) end

--设置刚体的位置
---@param body py.RigidBody # 刚体
---@param pos py.FVector3 # pos
function GameAPI.api_set_rigid_body_pos(body, pos) end

--设置刚体的朝向
---@param body py.RigidBody # 刚体
---@param direction py.FRotation # direction
function GameAPI.api_set_rigid_body_direction(body, direction) end

--设置刚体的刚体类型
---@param body py.RigidBody # 刚体
---@param body_type string # 刚体类型
function GameAPI.api_set_rigid_body_type(body, body_type) end

--设置刚体的布尔类型属性
---@param body py.RigidBody # 刚体
---@param attr_name string # 布尔类型属性
---@param value boolean # 值
function GameAPI.api_set_rigid_body_bool_attr(body, attr_name, value) end

--设置刚体有效性
---@param body py.RigidBody # 刚体
---@param is_active boolean # 是否有效
function GameAPI.api_set_rigidbody_active(body, is_active) end

--设置刚体模型可见性
---@param body py.PhysicsEntity # 物理组件
---@param visible py.RigidBody # 刚体
function GameAPI.api_set_rigidbody_visible(body, visible) end

--获取刚体有效性
---@param body py.RigidBody # 刚体
---@return boolean # 是否有效
function GameAPI.api_get_rigidbody_active(body) end

--设置刚体速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
function GameAPI.api_set_rigidbody_velocity(body, speed, direction) end

--获得刚体速度
---@param body py.RigidBody # 刚体
---@return py.FVector3 # 速度
function GameAPI.api_get_rigidbody_velocity(body) end

--设置刚体角速度
---@param body py.RigidBody # 刚体
---@param angular_velocity py.FVector3 # 角速度
function GameAPI.api_set_rigidbody_angular_velocity(body, angular_velocity) end

--设置刚体角速度
---@param body py.RigidBody # 刚体
function GameAPI.api_get_rigidbody_angular_velocity(body) end

--获得刚体朝向
---@param body py.RigidBody # 刚体
---@return py.FVector3 # 朝向
function GameAPI.api_get_rigidbody_forward(body) end

--获得范围内的刚体组
---@param position py.FVector3 # 位置
---@param radius number # 半径
---@param collision_category? integer # 自身碰撞类别
---@param collide_with_mask? integer # 目标碰撞类别
---@param ignore_trigger? boolean # 忽略触发器
---@param ignore_non_trigger? boolean # 忽略非触发器
---@param ignore_non_rigid? boolean # 忽略非刚体
---@param ignore_dynamic? boolean # 忽略动态物体
---@param ignore_kinematic? boolean # 忽略运动学物体
---@param ignore_static? boolean # 忽略静态物体
---@param ignore_logic_body? boolean # 忽略逻辑物体
---@param ignore_non_logic_body? boolean # 忽略非逻辑物体
---@return py.RigidBodyGroup # 刚体组
function GameAPI.api_get_rigid_body_group_in_range(position, radius, collision_category, collide_with_mask, ignore_trigger, ignore_non_trigger, ignore_non_rigid, ignore_dynamic, ignore_kinematic, ignore_static, ignore_logic_body, ignore_non_logic_body) end

--替换刚体模型
---@param body py.RigidBody # 刚体
---@param id py.ModelKey # 模型id
function GameAPI.api_replace_rigid_body_model(body, id) end

--还原刚体上一个模型
---@param body py.RigidBody # 刚体
function GameAPI.api_restore_rigid_body_last_model(body) end

--获得刚体中指定名字的碰撞器
---@param body py.RigidBody # 刚体
---@param name string # 碰撞器名字
---@return py.Collider # Collider
function GameAPI.api_get_rigid_body_collider(body, name) end

--刚体是否有指定tag
---@param body py.RigidBody # 刚体
---@param tag string # tag
---@return boolean # 布尔值
function GameAPI.api_is_rigid_has_tag(body, tag) end

--获取刚体质量
---@param body py.RigidBody # 刚体
---@return py.Fixed # 质量
function GameAPI.api_rigid_body_get_mass(body) end

--设置刚体模型缩放
---@param body py.RigidBody # 刚体
---@param scale_x number # x缩放
---@param scale_y number # y缩放
---@param scale_z number # z缩放
function GameAPI.api_rigid_body_set_scale(body, scale_x, scale_y, scale_z) end

--刚体按照指定轴旋转
---@param body py.RigidBody # 刚体
---@param axis py.Vector3 # 轴
---@param angle py.Fixed # 角度
function GameAPI.api_rigid_body_angle_axis(body, axis, angle) end

--扔出刚体
---@param body py.PhysicsEntity # 刚体
---@param start py.Vector3 # 抛出点
---@param forward py.Vector3 # 抛出方向
---@param length py.Fixed # 抛出距离
---@param speed py.Fixed # 水平速度
function GameAPI.api_throw_rigid_body(body, start, forward, length, speed) end

--设置刚体的相对坐标系的速度
---@param body py.RigidBody # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
function GameAPI.api_set_rigid_body_reference_frame_velocity(body, speed, direction) end

--设置刚体绑定目标刚体的相对坐标系
---@param body py.RigidBody # 刚体
---@param target py.RigidBody # 目标刚体
function GameAPI.api_set_rigid_body_add_reference_frame(body, target) end

--设置刚体移除目标刚体的相对坐标系
---@param body py.RigidBody # 刚体
---@param target py.RigidBody # 目标刚体
function GameAPI.api_set_rigid_body_remove_reference_frame(body, target) end

--把刚体的本地坐标转到全局坐标
---@param body py.RigidBody # 刚体
---@param local_pos py.FVector3 # local_pos
function GameAPI.api_transform_local_to_global_coords(body, local_pos) end

--添加刚体到刚体组
---@param body py.Unit # 刚体
---@param group py.RigidBodyGroup # 刚体组
function GameAPI.api_add_rigid_body_to_group(body, group) end

--从刚体组中移除刚体
---@param group py.UnitGroup # 刚体组
---@param body py.Unit # 刚体
function GameAPI.api_remove_rigid_body_in_group(group, body) end

--删除REACTION
---@param reaction py.Reaction # Reaction
function GameAPI.api_delete_reaction(reaction) end

--删除REACTION Group
---@param reactions py.ReactionGroup # ReactionGroup
function GameAPI.api_delete_reaction_group(reactions) end

--刚体增加均匀引力场
---@param body py.PhysicsEntity # 刚体
---@param speed py.Fixed # 速度大小
---@param position py.Vector3 # 力场源点
---@return py.Reaction # 物理Reaction
function GameAPI.api_add_uniform_gravitation_field_to_rigid_body(body, speed, position) end

--刚体增加风场
---@param body py.PhysicsEntity # 刚体
---@param speed py.Fixed # 速度大小
---@param direction py.FVector3 # 速度方向
---@return py.RigidBody # RigidBody
function GameAPI.api_add_wind_force_field_to_rigid_body(body, speed, direction) end

--物理物品抛出
---@param physics_item py.Unit # 物品单位
---@param length py.Fixed # 抛出距离
---@param vel py.Fixed # 水平速度
---@param socket_name string # 出手绑点
function GameAPI.throw_physics_item(physics_item, length, vel, socket_name) end

--获取物理物品的刚体
---@param physics_item py.Unit # 物品单位
function GameAPI.get_physics_item_body_object(physics_item) end

--删除逻辑物理物品
---@param physics_item py.Unit # 物品单位
function GameAPI.api_remove_physics_item(physics_item) end

--逻辑物理物品模型解绑持有者
---@param physics_item py.Unit # 物品单位
function GameAPI.api_physics_item_viewer_detach(physics_item) end

--获取逻辑物理物品绑定技能
---@param physics_item py.Unit # 物品单位
function GameAPI.api_physics_item_get_ability(physics_item) end

--逻辑物理物品创建特效
---@param physics_item py.PhysicsEntity # 物理组件
---@param sfx_id py.Fixed # 特效ID
---@param position py.FVector3 # 位置
---@param duration? py.Fixed # 持续时间
function GameAPI.api_physics_item_create_sfx(physics_item, sfx_id, position, duration) end

--逻辑物理物品播放动画
---@param physics_item py.Unit # 物理组件
---@param anim string # 动画名称
---@param play_speed number # 播放倍率
---@param begin_t number # 开始时间(s)
---@param end_t number # 结束时间(s)，正数 -1 表示不结束
---@param loop boolean # 是否循环
---@param return_idle boolean # 播放结束后是否恢复idle
function GameAPI.api_physics_item_play_animation(physics_item, anim, play_speed, begin_t, end_t, loop, return_idle) end

--单位扔出物理组件
---@param entity py.PhysicsEntity # 物理组件
---@param length py.Fixed # 抛出距离
---@param vel py.Fixed # 水平速度
---@param socket_name string # 出手绑点
function GameAPI.throw_physics_entity(entity, length, vel, socket_name) end

--持有者解绑逻辑物理组件模型
---@param entity py.Unit # 逻辑物理组件
function GameAPI.api_detach_physics_entity_viewer(entity) end

--获得逻辑物理组件的持有者
---@param entity py.PhysicsEntity # 逻辑物理组件
---@return py.Unit # 持有者
function GameAPI.api_get_physics_entity_owner(entity) end

--创建特效到三维坐标
---@param sfx_id py.SfxKey # 特效编号
---@param position py.FVector3 # 位置
---@param direction? py.FVector3 # 朝向
---@param scale? number # 缩放比例
---@param duration? number # 持续时间
---@param immediately? boolean # 是否立即删除
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_point_3d(sfx_id, position, direction, scale, duration, immediately) end

--设置特效到三维坐标
---@param sfx_entity py.Sfx # 特效
---@param point py.FVector3 # 位置
---@param fluent_move? boolean # 平滑移动
function GameAPI.set_sfx_position_3d(sfx_entity, point, fluent_move) end

--埋点
---@param key string # key
---@param value string # value
---@param str1 string # 额外参数1
---@param str2 string # 额外参数2
---@param str3 string # 额外参数3
---@param str4 string # 额外参数4
---@param str5 string # 额外参数5
function GameAPI.report_info(key, value, str1, str2, str3, str4, str5) end

--LUA层初始化参数
---@param time_scale py.Fixed # name
function GameAPI.api_change_time_scale(time_scale) end

--调试暂停
function GameAPI.api_debug_pause() end

--LUA层初始化参数
---@param name string # name
---@param value string # value
---@param if_list boolean # 是否数组
---@return py.Actor # 变量
function GameAPI.init_lua_var(name, value, if_list) end

--从lua设置变量
---@param func_name string # 函数名称
---@param actor py.Actor # actor
---@param key integer # index
---@param index string # key
---@param value string # value
function GameAPI.set_lua_var(func_name, actor, key, index, value) end

--从lua读取变量
---@param func_name string # 函数名称
---@param actor py.Actor # actor
---@param key string # key
---@param index? integer # index
function GameAPI.get_lua_var(func_name, actor, key, index) end

--设置随机数种子
---@param v integer # 随机数种子
function GameAPI.set_random_seed(v) end

--获取随机数种子
---@return integer # 随机数种子
function GameAPI.get_random_seed() end

--创建单位
---@param key py.UnitKey # 单位编号
---@param pos py.FVector3 # 位置
---@param angle py.Fixed # 朝向
---@param role_or_unit py.Role # 所属玩家
---@param lua_table? py.Table # 用户自定义配置表
---@return py.Unit # 创建出的单位
function GameAPI.create_unit(key, pos, angle, role_or_unit, lua_table) end

--改变单位所属玩家
---@param unit py.Unit # 单位
---@param role py.Role # 所属玩家
function GameAPI.change_unit_role(unit, role) end

--改变投射物所属单位
---@param projectile py.ProjectileEntity # 投射物
---@param unit py.Unit # 单位
function GameAPI.change_projectile_owner(projectile, unit) end

--改变投射物所属技能
---@param projectile py.ProjectileEntity # 投射物
---@param related_ability py.Ability # 单位
function GameAPI.change_projectile_ability(projectile, related_ability) end

--修改玩家资源图标
---@param res_key py.RoleResKey # 资源名称
---@param icon_id integer # 图标编号
function GameAPI.change_role_res_icon(res_key, icon_id) end

--修改玩家资源图标(图片类型)
---@param res_key py.RoleResKey # 资源名称
---@param icon_id py.Texture # 图标
function GameAPI.change_role_res_icon_with_icon(res_key, icon_id) end

--移除控制列表中的某个单位
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
function GameAPI.remove_control_unit(role, unit) end

--获取队伍内单位列表
---@param role py.Role # 玩家
---@param team_id integer # 队伍编号
function GameAPI.get_unit_ids_in_team(role, team_id) end

--给队伍添加单位
---@param role py.Role # 玩家
---@param team_id integer # 队伍编号
---@param unit py.Unit # 单位
function GameAPI.add_unit_to_team(role, team_id, unit) end

--从队伍中去除单位
---@param role py.Role # 玩家
---@param team_id integer # 队伍编号
---@param unit py.Unit # 单位
function GameAPI.remove_unit_from_team(role, team_id, unit) end

--创建幻象
---@param clone_unit py.Unit # 复制目标
---@param caller_unit py.Unit # 召唤者
---@param role py.Role # 玩家
---@param pos py.FVector3 # 位置
---@param angle py.Fixed # 朝向
---@param clone_hp_mp? boolean # 是否继承生命与魔法
function GameAPI.create_illusion(clone_unit, caller_unit, role, pos, angle, clone_hp_mp) end

--判断单位是否是幻象单位
---@param unit py.Unit # 单位
---@return boolean # 是否是幻象
function GameAPI.is_unit_illusion(unit) end

--获取幻象召唤者
---@param illusion_unit py.Unit # 幻象单位
---@return py.Unit # 召唤单位
function GameAPI.get_illusion_caller_unit(illusion_unit) end

--在单位的挂接点创建一个投掷物
---@param p_key py.ProjectileKey # 投掷物编号
---@param socket_unit py.Unit # 挂节点所属单位
---@param socket_name string # 挂接点名称
---@param face py.Fixed # 朝向
---@param owner_unit_or_player? py.Actor # 所属单位或玩家
---@param related_ability? py.Ability # 关联技能
---@param visibility? integer # 粒子特效可见性规则
---@param duration? py.Fixed # 持续时间
---@param is_open_duration? boolean # 是否启用持续时间
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.ProjectileEntity # 创建出的投掷物
function GameAPI.create_projectile_on_socket(p_key, socket_unit, socket_name, face, owner_unit_or_player, related_ability, visibility, duration, is_open_duration, immediately, use_sys_d_destroy_way) end

--创建一个投掷物
---@param p_key py.ProjectileKey # 投掷物编号
---@param location py.FVector3 # 位置
---@param face? py.Fixed # 朝向
---@param owner_unit_or_player? py.Unit # 所属单位
---@param related_ability? py.Ability # 关联技能
---@param duration? py.Fixed # 持续时间
---@param is_open_duration? boolean # 是否启用持续时间
---@param height? py.Fixed # 高度
---@param visibility? integer # 粒子特效可见性规则
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.ProjectileEntity # 创建出的投掷物
function GameAPI.create_projectile_in_scene(p_key, location, face, owner_unit_or_player, related_ability, duration, is_open_duration, height, visibility, immediately, use_sys_d_destroy_way) end

--创建一个投掷物
---@param p_key py.ProjectileKey # 投掷物编号
---@param location py.FVector3 # 位置
---@param owner_unit_or_player py.Actor # 所属单位或玩家
---@param face? py.Fixed # 朝向
---@param related_ability? py.Ability # 关联技能
---@param duration? py.Fixed # 持续时间
---@param is_open_duration? boolean # 是否启用持续时间
---@param height? py.Fixed # 高度
---@param visibility? integer # 粒子特效可见性规则
---@param immediately? boolean # 立即移除表现
---@param use_sys_d_destroy_way? boolean # 特效删除的方式是否读表
---@return py.ProjectileEntity # 创建出的投掷物
function GameAPI.create_projectile_in_scene_new(p_key, location, owner_unit_or_player, face, related_ability, duration, is_open_duration, height, visibility, immediately, use_sys_d_destroy_way) end

--新建空玩家组
---@return py.RoleGroup # 玩家组
function GameAPI.create_role_group() end

--将玩家添加到玩家组
---@param role py.Role # 玩家
---@param group py.RoleGroup # 玩家组
function GameAPI.add_role_to_group(role, group) end

--玩家组中删除玩家
---@param role py.Role # 玩家
---@param group py.RoleGroup # 玩家组
function GameAPI.rem_role_from_group(role, group) end

--根据单位ID获取单位
---@param unit_id py.UnitID # 单位id
---@return py.Unit # 单位
function GameAPI.get_unit_by_id(unit_id) end

--根据特效ID获取特效
---@param projectile_id py.ProjectileID # 特效id
---@return py.ProjectileEntity # 特效
function GameAPI.get_projectile_by_id(projectile_id) end

--判断单位是否在单位组
---@param unit py.Unit # 单位
---@param group py.UnitGroup # 单位组
---@return boolean # 是否在单位组
function GameAPI.judge_unit_in_group(unit, group) end

--获取科技图标
---@param tech_key py.TechKey # 科技编号
---@param target_level integer # 等级
---@return py.Texture # 图片
function GameAPI.api_get_tech_icon(tech_key, target_level) end

--设置全局天气
---@param weather_type integer # 天气类型
function GameAPI.update_global_weather(weather_type) end

--获得全局天气
---@return integer # 天气类型
function GameAPI.get_global_weather() end

--打开技能指示器
---@param role py.Role # 玩家
---@param ability py.Ability # 技能
---@param dry_run? boolean # 是否仅模拟不施法
function GameAPI.start_skill_pointer(role, ability, dry_run) end

--关闭技能指示器
---@param role py.Role # 玩家
---@param ability py.Ability # 技能
function GameAPI.stop_skill_pointer(role, ability) end

--打开技能指示器
---@param role py.Role # 玩家
---@param ability py.Ability # 技能
function GameAPI.create_preview_skill_pointer(role, ability) end

--关闭技能指示器
---@param role py.Role # 玩家
function GameAPI.clear_preview_skill_pointer(role) end

--技能类型指示器
---@param ability_id py.AbilityKey # 技能ID
---@return integer # 指示器类型
function GameAPI.get_ability_key_skill_pointer(ability_id) end

--发送信号
---@param role_or_role_id py.RoleID # 玩家ID
---@param signal_type py.SignalType # 信号类型
---@param world_pos py.Point # 位置
---@param visible_type py.SignalVisibleType # 显示类型
function GameAPI.send_signal(role_or_role_id, signal_type, world_pos, visible_type) end

--根据点光源ID返回点光源
---@param res_id py.LightID # 光源ID
---@return py.PointLight # 点光源
function GameAPI.get_point_light_res_by_res_id(res_id) end

--根据方向光源ID返回方向光源
---@param res_id py.LightID # 光源ID
---@return py.SpotLight # 方向光源
function GameAPI.get_spot_light_res_by_res_id(res_id) end

--创建点光源到点
---@param point py.Point # 点
---@param offset_y? py.Fixed # 偏移高度
---@return py.PointLight # 点光源
function GameAPI.create_point_light_to_point(point, offset_y) end

--创建点光源到单位绑点
---@param unit py.Unit # 单位
---@param socket_name string # 挂节点
---@param offset_y? py.Fixed # 偏移高度
---@return py.PointLight # 点光源
function GameAPI.create_point_light_to_unit_socket(unit, socket_name, offset_y) end

--创建方向光源到点
---@param point py.Point # 点
---@param pos_offset_y? py.Fixed # 起点偏移高度
---@param target? py.Actor # 朝向目标
---@param target_offset_y? py.Fixed # 朝向目标偏移高度
---@return py.SpotLight # 方向光源
function GameAPI.create_spot_light_to_point(point, pos_offset_y, target, target_offset_y) end

--创建方向光源到单位绑点
---@param unit py.Unit # 单位
---@param socket_name string # 挂节点
---@param pos_offset_y? py.Fixed # 起点偏移高度
---@param target? py.Actor # 朝向目标
---@param target_offset_y? py.Fixed # 朝向目标偏移高度
---@return py.SpotLight # 方向光源
function GameAPI.create_spot_light_to_unit_socket(unit, socket_name, pos_offset_y, target, target_offset_y) end

--删除光源
---@param light py.Light # 光源
function GameAPI.remove_light(light) end

--设置光源Float属性
---@param light py.Light # 光源
---@param attr_name string # 属性名
---@param value py.Fixed # 值
function GameAPI.set_light_float_attr_value(light, attr_name, value) end

--获取固定单位编号的单位组
---@param unit_key py.UnitKey # 单位编号
---@return py.UnitGroup # 单位组
function GameAPI.get_units_by_key(unit_key) end

--单位组内随机整数个单位
---@param units py.UnitGroup # 单位组
---@param n integer # 随机个数
---@return py.UnitGroup # 随机的单位组
function GameAPI.get_random_n_unit_in_group(units, n) end

--单位组内第一个单位
---@param units py.UnitGroup # 单位组
---@return py.Unit # 第一个单位
function GameAPI.get_first_unit_in_group(units) end

--单位组内最后一个单位
---@param units py.UnitGroup # 单位组
---@return py.Unit # 最后一个单位
function GameAPI.get_last_unit_in_group(units) end

--根据属性值从单位组中取整数个单位
---@param units py.UnitGroup # 单位组
---@param attr string # 属性
---@param rise boolean # 是否升序排列
---@param num integer # 单位个数
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_sort_by_attr(units, attr, rise, num) end

--根据距离从单位组中取整数个单位
---@param units py.UnitGroup # 单位组
---@param point py.FPoint # 点
---@param rise boolean # 是否升序排列
---@param num integer # 单位个数
---@return py.UnitGroup # 单位组
function GameAPI.get_unit_sort_by_position(units, point, rise, num) end

--单位组内随机一个单位
---@param units py.UnitGroup # 单位组
---@return py.Unit # 单位
function GameAPI.get_random_unit_in_unit_group(units) end

--技能类型是否受冷却缩减影响
---@param ability_id py.AbilityKey # 技能类型
---@return boolean # 布尔值
function GameAPI.api_get_influenced_by_cd_reduce(ability_id) end

--技能类型的字符串属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name py.AbilityStrAttr # 字符串属性
---@return string # 字符串
function GameAPI.get_ability_conf_str_attr(ability_id, attr_name) end

--技能类型的布尔属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 布尔属性
---@return boolean # 布尔属性
function GameAPI.get_ability_conf_bool_attr(ability_id, attr_name) end

--技能类型的实数属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 实数属性
---@return py.Fixed # 实数
function GameAPI.get_ability_conf_float_attr(ability_id, attr_name) end

--技能类型的整数属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 整数属性
---@return integer # 实数
function GameAPI.get_ability_conf_int_attr(ability_id, attr_name) end

--技能类型的公式属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 公式属性
---@param level integer # 当前等级
---@param stack_count integer # 当前充能层数
---@param unit_hp_max? py.Fixed # 施法者最大生命值
---@param unit_hp_cur? py.Fixed # 施法者当前生命值
---@return py.Fixed # 实数
function GameAPI.get_ability_conf_formula_attr(ability_id, attr_name, level, stack_count, unit_hp_max, unit_hp_cur) end

--技能类型的公式属性
---@param ability_id py.AbilityKey # 技能类型
---@param attr_name string # 公式属性
---@param level integer # 当前等级
---@param stack_count integer # 当前充能层数
---@param unit? py.Unit # 施法计算单位
---@param return_cm? boolean # 是否返回cm
---@return py.Fixed # 实数
function GameAPI.get_ability_conf_formula_attr_with_unit(ability_id, attr_name, level, stack_count, unit, return_cm) end

--技能选取的目标单位
---@param ability py.Ability # 技能
---@param runtime_id? integer # runtime_id
---@return py.Unit # 单位
function GameAPI.get_target_unit_in_ability(ability, runtime_id) end

--技能选取的目标物品
---@param ability py.Ability # 技能
---@param runtime_id? integer # runtime_id
---@return py.Item # 物品
function GameAPI.get_target_item_in_ability(ability, runtime_id) end

--技能选取的目标可破坏物
---@param ability py.Ability # 技能
---@param runtime_id? integer # runtime_id
---@return py.Destructible # 可破坏物
function GameAPI.get_target_dest_in_ability(ability, runtime_id) end

--筛选范围内单位(废弃)
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 形状
---@return py.UnitGroup # 单位组
function GameAPI.filter_unit_id_list_in_area(pos, shape) end

--筛选范围内单位
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 形状
---@param belong_role_group? py.Role # 属于玩家或玩家组
---@param visible_role? py.Role # 对玩家可见
---@param invisible_role? py.Role # 对玩家不可见
---@param exclude_unit_group? py.UnitGroup # 不在单位组内
---@param with_tag? string # 具有标签
---@param without_tag? string # 不具有标签
---@param entity_no? py.UnitKey # 单位名称
---@param exclude_unit? py.Unit # 排除单位
---@param unit_type? py.UnitType # 单位种类
---@param in_state? integer # 具有状态
---@param not_in_state? integer # 不具有状态
---@param include_dead? boolean # 是否包括死亡单位
---@param max_count? integer # 数量上限
---@param sort_type? py.SortType # 排序类型
---@return py.UnitGroup # 单位组
function GameAPI.filter_unit_id_list_in_area_v2(pos, shape, belong_role_group, visible_role, invisible_role, exclude_unit_group, with_tag, without_tag, entity_no, exclude_unit, unit_type, in_state, not_in_state, include_dead, max_count, sort_type) end

--筛选范围内投射物
---@param pos py.Vector3 # 坐标
---@param shape py.Shape # 形状
---@param sort_type? py.SortType # 排序类型
---@return py.ProjectileGroup # 投射物组
function GameAPI.filter_projectile_id_list_in_area(pos, shape, sort_type) end

--筛选带有tag的投射物
---@param tag string # tag
---@return py.ProjectileGroup # 投射物组
function GameAPI.get_all_projectiles_with_tag(tag) end

--按阵营编号获取阵营对象
---@param camp_id py.CampID # 阵营编号
---@return py.Camp # 阵营对象
function GameAPI.get_camp_by_camp_id(camp_id) end

--按玩家编号获取阵营编号
---@param role_id py.RoleID # 玩家编号
---@return py.Camp # 阵营编号
function GameAPI.get_camp_id_by_role_id(role_id) end

--按玩家编号获取玩家对象
---@param role_id py.RoleID # 玩家编号
---@return py.Role # 玩家
function GameAPI.get_role_by_role_id(role_id) end

--按整型获取玩家对象
---@param role_id integer # 玩家编号
---@return py.Role # 玩家
function GameAPI.get_role_by_int(role_id) end

--获取阵营存活单位数量
---@param camp_id py.CampID # 阵营编号
---@return integer # 单位数量
function GameAPI.get_alive_unit_num_by_camp_id(camp_id) end

--所有玩家
---@return py.RoleGroup # 玩家组
function GameAPI.get_all_role_ids() end

--阵营所有玩家
---@param camp py.Camp # 阵营对象
---@return py.RoleGroup # 玩家组
function GameAPI.get_role_ids_by_camp(camp) end

--特定类型玩家
---@param role_type integer # 玩家类型
---@return py.RoleGroup # 玩家组
function GameAPI.get_role_ids_by_type(role_type) end

--同盟玩家
---@param role py.Role # 玩家
---@return py.RoleGroup # 玩家组
function GameAPI.get_ally_ids_by_role(role) end

--获取某玩家敌对玩家组
---@param role py.Role # 玩家
---@return py.RoleGroup # 玩家组
function GameAPI.get_enemy_ids_by_role(role) end

--获取获胜玩家组
---@return py.RoleGroup # 玩家组
function GameAPI.get_victorious_role_ids() end

--获取失利玩家组
---@return py.RoleGroup # 玩家组
function GameAPI.get_defeated_role_ids() end

--三维属性是否开启
---@return boolean # 是否开启
function GameAPI.api_if_pri_attr_state_open() end

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
---@param event_odds number # 期望概率
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
