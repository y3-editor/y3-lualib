-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GlobalAPI
GlobalAPI = {}

--清空标签
---@param actor py.Actor # Actor
function GlobalAPI.api_clear_tag(actor) end

--空api
function GlobalAPI.api_do_nothing() end

--清空自定义键值
---@param actor py.Actor # Actor
function GlobalAPI.api_clear_kv(actor) end

--判断Actor是否有Tag
---@param actor py.Actor # Actor
---@param tag string # Tag标签
---@return boolean # 是否有tag
function GlobalAPI.has_tag(actor, tag) end

--判断Actor是否有kv
---@param kvbase py.Actor # Actor
---@param key string # kv
---@return boolean # 是否有tag
function GlobalAPI.api_has_kv_any(kvbase, key) end

--字符串A是否包含字符串B
---@param str_a string # str
---@param str_b string # str
---@return boolean # 是否包含
function GlobalAPI.is_str_include_other(str_a, str_b) end

--使能Actor身上的触发器
---@param actor py.Actor # Actor
---@param trigger_id py.TriggerID # 触发器id
---@param enabled boolean # 使能
function GlobalAPI.set_actor_trigger_enabled(actor, trigger_id, enabled) end

--触发Actor身上的触发器
---@param actor py.Actor # actor
---@param trigger_id py.TriggerID # 触发器id
function GlobalAPI.trigger_actor_trigger(actor, trigger_id) end

--注册Actor上的触发器并生效
---@param actor py.Actor # actor
---@param conf_id py.TriggerID # 触发器配置id
---@param context py.Dict # 上下文
---@return py.DynamicTriggerInstance # 动态触发器实例
function GlobalAPI.reg_actor_trigger(actor, conf_id, context) end

--注销Actor上的触发器
---@param actor py.Actor # actor
---@param trigger_id py.DynamicTriggerInstance # 动态触发器实例
function GlobalAPI.unreg_actor_trigger(actor, trigger_id) end

--创建一个扇形
---@param radius py.Fixed # 半径
---@param angle py.Fixed # 角度
---@param yaw number # 朝向
---@return py.Shape # 扇形对象
function GlobalAPI.create_sector_shape(radius, angle, yaw) end

--创建一个圆形
---@param radius py.Fixed # 半径
---@return py.Shape # 圆形对象
function GlobalAPI.create_circular_shape(radius) end

--创建一个矩形
---@param width py.Fixed # 长
---@param length py.Fixed # 宽
---@param yaw number # 朝向
---@param offset_x_ratio? py.Fixed # 偏移x
---@param offset_y_ratio? py.Fixed # 偏移y
---@return py.Shape # 矩形对象
function GlobalAPI.create_rectangle_shape(width, length, yaw, offset_x_ratio, offset_y_ratio) end

--创建一个环形
---@param small_r py.Fixed # 小圆半径
---@param big_r py.Fixed # 大圆半径
---@return py.Shape # 环形对象
function GlobalAPI.create_annular_shape(small_r, big_r) end

--坐标值转化为FVector3
---@param x py.Fixed # x
---@param z py.Fixed # y
---@param y? py.Fixed # z
---@return py.FVector3 # FVector3
function GlobalAPI.coord_to_point(x, z, y) end

--三维坐标值转化为FVector3
---@param x py.Fixed # x
---@param y py.Fixed # y
---@param z py.Fixed # z
---@return py.FVector3 # FVector3
function GlobalAPI.float_to_vector3(x, y, z) end

--返回三维向量的X
---@param vector py.FVector3 # 三维向量
---@return py.Fixed # X
function GlobalAPI.get_vector3_x(vector) end

--返回三维向量的Y
---@param vector py.FVector3 # 三维向量
---@return py.Fixed # Y
function GlobalAPI.get_vector3_y(vector) end

--返回三维向量的Z
---@param vector py.FVector3 # 三维向量
---@return py.Fixed # Z
function GlobalAPI.get_vector3_z(vector) end

--三维坐标值转化为FRotation
---@param x py.Fixed # x
---@param y py.Fixed # y
---@param z py.Fixed # z
---@return py.FVector3 # FVector3
function GlobalAPI.float_to_rotation(x, y, z) end

--返回旋转的Roll
---@param vector py.FRotation # Rotation
---@return py.Fixed # X
function GlobalAPI.get_rotation_roll(vector) end

--返回旋转的YAW
---@param vector py.FRotation # Rotation
---@return py.Fixed # Y
function GlobalAPI.get_rotation_yaw(vector) end

--返回旋转的PITCH
---@param vector py.FRotation # Rotation
---@return py.Fixed # Z
function GlobalAPI.get_rotation_pitch(vector) end

--整数迭代器，最大迭代次数不超过2^20
---@param num integer # 迭代次数
---@return py.Int32Iterator # Python迭代器
function GlobalAPI.int_iterator(num) end

--整数迭代器
---@param start integer # 计数从start开始
---@param stop integer # 计数到stop结束
---@param step? integer # 步长
---@return py.Int32Iterator # Python迭代器
function GlobalAPI.int_iterator2(start, stop, step) end

--整数迭代器
---@param start integer # 计数从start开始
---@param stop integer # 计数到stop结束
---@param step? integer # 步长
---@return py.Int32Iterator # Python迭代器
function GlobalAPI.int_iterator3(start, stop, step) end

--列表索引迭代器
---@param l py.List # 列表
---@return py.Iterator # Python迭代器
function GlobalAPI.list_index_iterator(l) end

--table迭代器(废弃)
---@param l py.Table # TAB
---@return py.Iterator # Python迭代器
function GlobalAPI.table_iterator(l) end

--get_iter_table_key_str
---@param item py.List # table iter item
---@return string # key str
function GlobalAPI.get_iter_table_key_str(item) end

--get_iter_table_key_int
---@param item py.List # table iter item
---@return integer # key int
function GlobalAPI.get_iter_table_key_int(item) end

--Int32运算
---@param v1 integer # x
---@param op string # operator(+,-,*,/,%)
---@param v2 integer # y
---@return integer # 返回值
function GlobalAPI.int32_arithmetic_operation(v1, op, v2) end

--Int32自增1
---@param int_value integer # x
---@return integer # 返回值
function GlobalAPI.int32_plus_one(int_value) end

--Int32取较小值
---@param int_value1 integer # x1
---@param int_value2 integer # x2
---@return integer # 返回值
function GlobalAPI.int32_min(int_value1, int_value2) end

--Int32取较大值
---@param int_value1 integer # x1
---@param int_value2 integer # x2
---@return integer # 返回值
function GlobalAPI.int32_max(int_value1, int_value2) end

--点向方向偏移
---@param point py.FVector3 # 起始点
---@param angle py.Fixed # 方向角度
---@param dis py.Fixed # 偏移距离
---@return py.FVector3 # 返回值
function GlobalAPI.get_point_offset_vector(point, angle, dis) end

--int64转换字符串
---@param val integer # 值
---@return string # 字符串
function GlobalAPI.int64_to_str(val) end

--to_str_default
---@param val py.Actor # 值
---@return string # 字符串
function GlobalAPI.to_str_default(val) end

--删除键值对
---@param kvbase py.KVBase # 键值对容器
---@param key string # 键名
function GlobalAPI.api_remove_kv(kvbase, key) end

--获取单位编号池内单位编号数量
---@param pool py.UnitKeyPool # 单位编号池
---@return integer # 单位编号数量
function GlobalAPI.get_unit_key_pool_num(pool) end

--两点之间距离
---@param p1 py.FPoint # 目标点
---@param p2 py.FPoint # 起始点
---@return py.Fixed # 距离
function GlobalAPI.plane_range_between_2_point(p1, p2) end

--整数转定点数
---@param i integer # 整数
---@return py.Fixed # 定点数
function GlobalAPI.int32_to_fixed(i) end

--实数近似比较(4位小数)
---@param a py.Fixed # 定点数1
---@param op string # 比较符
---@param b py.Fixed # 定点数2
---@return boolean # 结果
function GlobalAPI.fix32_equal_with_precision(a, op, b) end

--定点数转整数
---@param f py.Fixed # 定点数
---@return integer # 整数
function GlobalAPI.fixed_to_int32(f) end

--技能槽位转整数
---@param ability_index py.AbilityIndex # 技能槽位
---@return integer # 整数
function GlobalAPI.ability_index_to_int32(ability_index) end

--定点数转字符串
---@param f py.Fixed # 定点数
---@return string # 字符串
function GlobalAPI.fixed_to_str(f) end

--定点FVector3转字符串
---@param f py.FVector3 # FVector3
---@return string # 字符串
function GlobalAPI.fvector3_to_str(f) end

--定点FVector2转字符串
---@param f py.FVector2 # FVector2
---@return string # 字符串
function GlobalAPI.fvector2_to_str(f) end

--浮点数转字符串
---@param f number # 浮点数
---@param num? integer # 保留位数
---@return string # 字符串
function GlobalAPI.float_to_str(f, num) end

--整数转换为字符串
---@param i integer # 整数
---@param num? integer # 保留位数
---@return string # 字符串
function GlobalAPI.int_to_string(i, num) end

--定点数转字符串
---@param f number # 浮点数
---@param num integer # 保留位数
---@param rule? integer # 保留规则
function GlobalAPI.float_to_str_new(f, num, rule) end

--浮点Vector3转字符串
---@param f py.Vector3 # Vector3
---@return string # 字符串
function GlobalAPI.vector3_to_str(f) end

--字符串转Vector3
---@param f string # 字符串
---@return py.Vector3 # Vector3
function GlobalAPI.str_to_vector3(f) end

--浮点Vector2转字符串
---@param f py.Vector2 # Vector2
---@return string # 字符串
function GlobalAPI.vector2_to_str(f) end

--Shape转字符串
---@param f py.Shape # Shape
---@return string # 字符串
function GlobalAPI.shape_to_str(f) end

--动态类型数转字符串
---@param f py.DynamicTypeMeta # 动态类型
---@return string # 字符串
function GlobalAPI.dynamic_to_str(f) end

--int32_to_str
---@param f integer # int32
---@return string # 字符串
function GlobalAPI.int32_to_str(f) end

--布尔型转字符串
---@param f boolean # 布尔值
---@return string # 字符串
function GlobalAPI.bool_to_str(f) end

--整数转字符串
---@param i integer # 整数值
---@return string # 字符串
function GlobalAPI.i2s(i) end

--字符串拼接
---@param s1 string # 字符串
---@param s2 string # 字符串
---@param s3 string # 字符串
---@param s4 string # 字符串
---@param s5 string # 字符串
---@param s6 string # 字符串
---@param s7 string # 字符串
---@param s8 string # 字符串
---@param s9 string # 字符串
---@param s10 string # 字符串
---@return string # 字符串
function GlobalAPI.join_s(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10) end

--字符串拼接
---@param s1 string # 字符串
---@param s2 string # 字符串
---@param s3 string # 字符串
---@param s4 string # 字符串
---@param s5 string # 字符串
---@param s6 string # 字符串
---@param s7 string # 字符串
---@param s8 string # 字符串
---@param s9 string # 字符串
---@param s10 string # 字符串
---@return string # 字符串
function GlobalAPI.join_s_new(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10) end

--开方
---@param base py.Fixed # 开方底
---@param num py.Fixed # 开方次数
---@return py.Fixed # 计算结果
function GlobalAPI.root(base, num) end

--字符串替换
---@param s1 string # 母字符串
---@param old string # 被替换的字符串
---@param new string # 替换目标字符串
---@param num? integer # 最大替换次数
---@return string # 字符串
function GlobalAPI.replace_str(s1, old, new, num) end

--定点数运算
---@param a py.Fixed # x
---@param o string # operator(+,-*,/)
---@param b py.Fixed # y
---@return py.Fixed # 定点数
function GlobalAPI.fixed_arithmetic_operation(a, o, b) end

--三维向量运算
---@param a py.FVector3 # x
---@param o string # operator(+,-)
---@param b py.FVector3 # y
---@return py.FVector3 # 定点数Vector3
function GlobalAPI.vector3_arithmetic_operation(a, o, b) end

--三维向量的长度
---@param vec3 py.FVector3 # x
---@return py.Fixed # 定点数
function GlobalAPI.vector3_length(vec3) end

--三维向量归一化
---@param vec3 py.Vector3 # 三维向量
function GlobalAPI.vector3_normalize(vec3) end

--三维向量的归一化向量
---@param vec3 py.Vector3 # 三维向量
---@return py.Vector3 # 三维向量
function GlobalAPI.get_vector3_normalize(vec3) end

--三维向量乘以标量
---@param vec3 py.Vector3 # 三维向量
---@param scalar py.Vector3 # 标量
function GlobalAPI.vector3_multiply_scalar(vec3, scalar) end

--三维向量转欧拉角
---@param vec3 py.Vector3 # 三维向量
---@return py.FRotation # 欧拉角
function GlobalAPI.vector3_to_euler(vec3) end

--获得三维向量绕轴旋转后的向量
---@param vec3 py.FVector3 # 三维向量
---@param axis py.FVector3 # 旋转轴
---@param angle py.Fixed # 旋转角度
---@return py.FVector3 # 定点数Vector3
function GlobalAPI.vector3_angle_axis(vec3, axis, angle) end

--定点数自增1
---@param fix_value py.Fixed # x
---@return py.Fixed # 定点数
function GlobalAPI.fixed_plus_one(fix_value) end

--取两个定点数最小值
---@param fix_value1 py.Fixed # x1
---@param fix_value2 py.Fixed # x2
---@return py.Fixed # 定点数
function GlobalAPI.fixed_min(fix_value1, fix_value2) end

--取两个定点数最小大值
---@param fix_value1 py.Fixed # x1
---@param fix_value2 py.Fixed # x2
---@return py.Fixed # 定点数
function GlobalAPI.fixed_max(fix_value1, fix_value2) end

--角度计算
---@param a py.Fixed # x
---@param o string # operator(+,-*,/)
---@param b py.Fixed # y
---@return py.Fixed # 定点数
function GlobalAPI.angle_arithmetic_operation(a, o, b) end

--转换度到弧度
---@param d py.Fixed # 角度
---@return py.Fixed # 弧度
function GlobalAPI.degree_to_radian(d) end

--正弦
---@param r py.Fixed # 弧度
---@return py.Fixed # 定点数
function GlobalAPI.radian_sin(r) end

--余弦
---@param r py.Fixed # 弧度
---@return py.Fixed # 定点数
function GlobalAPI.radian_cos(r) end

--正切
---@param r py.Fixed # 弧度
---@return py.Fixed # 定点数
function GlobalAPI.radian_tan(r) end

--反正弦
---@param r py.Fixed # 定点数
---@return py.Fixed # 弧度
function GlobalAPI.radian_asin(r) end

--反余弦
---@param r py.Fixed # 定点数
---@return py.Fixed # 弧度
function GlobalAPI.radian_acos(r) end

--反正切
---@param r py.Fixed # 定点数
---@return py.Fixed # 弧度
function GlobalAPI.radian_atan(r) end

--反正切(Y:X)
---@param y py.Fixed # 定点数
---@param x py.Fixed # 定点数
---@return py.Fixed # 弧度
function GlobalAPI.radian_atan_x_y(y, x) end

--平方根
---@param x py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.sqrt(x) end

--求幂
---@param f py.Fixed # 定点数
---@param n integer # 整数
---@return py.Fixed # 定点数
function GlobalAPI.pow(f, n) end

--求绝对值
---@param f py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.abs(f) end

--求绝对值
---@param number integer # 整数
---@return integer # 整数
function GlobalAPI.int_abs(number) end

--区间
---@param x0 py.Fixed # 定点数
---@param x1 py.Fixed # 定点数
---@param x2 py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.interval(x0, x1, x2) end

--找最近的二次方数
---@param x py.Fixed # 定点数
---@return integer # 二次方数
function GlobalAPI.nearest_quadratic_number(x) end

--最小整数
---@param f py.Fixed # 定点数
---@return integer # 整数
function GlobalAPI.ceil(f) end

--最大整数
---@param f py.Fixed # 定点数
---@return integer # 整数
function GlobalAPI.floor(f) end

--插值
---@param x_from py.Fixed # 定点数
---@param x_to py.Fixed # 定点数
---@param t py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.interpolate(x_from, x_to, t) end

--反插值
---@param x_from py.Fixed # 定点数
---@param x_to py.Fixed # 定点数
---@param res_val py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.invert_interpolate(x_from, x_to, res_val) end

--对数10
---@param x py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.log10(x) end

--对数
---@param x1 py.Fixed # 定点数
---@param x2 py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.log(x1, x2) end

--返回组内最大值
---@param l py.List # 列表
---@return py.Fixed # 定点数
function GlobalAPI.get_max_in_list(l) end

--返回组内最小值
---@param l py.List # 列表
---@return py.Fixed # 定点数
function GlobalAPI.get_min_in_list(l) end

--四舍五入
---@param x py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.round(x) end

--返回正负符号
---@param f py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.sign(f) end

--保留X位小数
---@param x py.Fixed # 定点数
---@param num integer # X位小数
---@param b? boolean # 是否四舍五入
---@return py.Fixed # 定点数
function GlobalAPI.round_dec(x, num, b) end

--定点数三角函数运算
---@param o string # method(sin,cos,tan)
---@param a py.Fixed # 定点数
---@return py.Fixed # 定点数
function GlobalAPI.fixed_trigonometric_operation(o, a) end

--玩家组的玩家数量
---@param player_group py.RoleGroup # 玩家组
---@return integer # 玩家数量
function GlobalAPI.get_player_group_num(player_group) end

--获取Actor关联技能
---@param actor py.Actor # Actor
---@return py.Ability # 技能
function GlobalAPI.get_related_ability(actor) end

--为Actor添加定时器
---@param actor py.Actor # actor
---@param name string # 定时器名称
---@param once string # 字符串
---@param interval py.Fixed # 定点数
---@param context py.Dict # 字典
function GlobalAPI.add_actor_timer(actor, name, once, interval, context) end

--关闭Actor计时器
---@param actor py.Actor # actor
---@param name string # 字符串
function GlobalAPI.stop_actor_timer(actor, name) end

--获取FVector3的其中一个值
---@param point py.FVector3 # FVector3
---@param index integer # 序号(0-2)
---@return py.Fixed # 定点数
function GlobalAPI.get_fixed_coord_index(point, index) end

--清空组/数组变量
---@param list1 py.List # 列表
function GlobalAPI.clear_group(list1) end

--数组 - 删除数组条目
---@param dict_var py.List # list var
---@param index integer # index
---@param index_forward? boolean # 索引前移
function GlobalAPI.remove_list_var_item(dict_var, index, index_forward) end

--数组 - 删除数组条目
---@param dict_var py.List # list var
---@param index integer # index
---@param index_forward? boolean # 索引前移
function GlobalAPI.remove_list_var_item_2(dict_var, index, index_forward) end

--数组 - 是否具有索引
---@param dict_var py.List # list var
---@param key integer # key
---@return boolean # 结果
function GlobalAPI.dict_has_key(dict_var, key) end

--数组 - 是否存在元素
---@param dict_var py.List # list var
---@param key py.DynamicTypeMeta # value
---@return boolean # 结果
function GlobalAPI.dict_has_value(dict_var, key) end

--数组 - 是否存在元素
---@param dict_var py.List # list var
---@param key py.DynamicTypeMeta # value
---@param name string # name
---@return boolean # 结果
function GlobalAPI.dict_has_value_special(dict_var, key, name) end

--将第二个列表的值赋值给第一个列表 不改变第一个列表的长度
---@param list1 py.List # 列表
---@param list2 py.List # 列表
function GlobalAPI.set_list_with_length(list1, list2) end

--判断玩家是否在玩家组
---@param role py.Role # 玩家
---@param group py.RoleGroup # 玩家组
---@return boolean # 布尔值
function GlobalAPI.judge_role_in_group(role, group) end

--判断单位是否活着
---@param unit? py.Unit # 单位
---@return boolean # 布尔值
function GlobalAPI.is_unit_alive(unit) end

--获取空的单位编号池
---@return py.UnitKeyPool # 单位编号池
function GlobalAPI.get_empty_unit_key_pool() end

--获取路径中某点
---@param road_point_list py.Road # 路径
---@param index integer # 下标
---@return py.FPoint # 点
function GlobalAPI.get_point_in_route(road_point_list, index) end

--点绕Y轴旋转(角度制)
---@param point py.FPoint # 点
---@param angle py.Fixed # 旋转
---@return py.FPoint # 点
function GlobalAPI.get_point_rotate_y(point, angle) end

--字符串转整数
---@param s string # 字符串
---@return integer # 返回值
function GlobalAPI.str_to_int(s) end

--字符串转布尔值
---@param s string # 字符串
---@return boolean # 布尔值
function GlobalAPI.str_to_bool(s) end

--字符串转定点数
---@param s string # 字符串
---@return py.Fixed # 返回值
function GlobalAPI.str_to_fixed(s) end

--删除子字符串
---@param str1 string # 原字符串
---@param sub_str string # 子字符串
---@param only_one boolean # 仅一次
---@return string # 原字符串
function GlobalAPI.delete_sub_str(str1, sub_str, only_one) end

--截取子字符串
---@param str1 string # 原字符串
---@param index1 integer # 左下标
---@param index2 integer # 右下标
---@return string # 截取后字符串
function GlobalAPI.extract_str(str1, index1, index2) end

--获取字符串长度
---@param str1 string # 字符串
---@return integer # 字符串长度
function GlobalAPI.length_of_str(str1) end

--字符串大小写统一
---@param str1 string # 原字符串
---@param is_upper boolean # 是否大写
---@return string # 处理后字符串
function GlobalAPI.str_to_upper_lower(str1, is_upper) end

--子字符串位置
---@param str1 string # 原字符串
---@param sub_str string # 子字符串
---@return integer # 子字符串位置
function GlobalAPI.pos_in_str(str1, sub_str) end

--整数转化为特效类型
---@param integer integer # 整数
---@return py.ProjectileKey # 投射物类型
function GlobalAPI.api_int_to_key(integer) end

--停止对lua gc的控制
function GlobalAPI.api_stop_luagc_control() end

--将投射物类型转化为整数
---@param key py.ProjectileKey # 投射物类型
---@return integer # 整数
function GlobalAPI.api_key_to_int(key) end

--单位命令类型转字符串
---@param val py.UnitCommandType # 单位命令类型
---@return string # 字符串
function GlobalAPI.unit_command_type_to_str(val) end

--字符串转单位命令类型
---@param val string # 字符串
---@return py.UnitCommandType # 单位命令类型
function GlobalAPI.str_to_unit_command_type(val) end

--技能释放类型转字符串
---@param val py.AbilityCastType # 技能释放类型
---@return string # 字符串
function GlobalAPI.ability_cast_type_to_str(val) end

--字符串转技能释放类型
---@param val string # 字符串
---@return py.AbilityCastType # 技能释放类型
function GlobalAPI.str_to_ability_cast_type(val) end

--多边形区域转字符串
---@param obj py.PolyArea # 多边形区域
---@return string # 字符串
function GlobalAPI.poly_area_to_str(obj) end

--投射物组转字符串
---@param obj py.ProjectileGroup # 投射物组
---@return string # 字符串
function GlobalAPI.projectile_group_to_str(obj) end

--玩家关系转字符串
---@param val py.RoleRelation # 玩家关系
---@return string # 字符串
function GlobalAPI.role_relation_to_str(val) end

--字符串转玩家关系
---@param val string # 字符串
---@return py.RoleRelation # 玩家关系
function GlobalAPI.str_to_role_relation(val) end

--单位编号池转字符串
---@param obj py.UnitKeyPool # 单位编号池
---@return string # 字符串
function GlobalAPI.unit_key_pool_to_str(obj) end

--单位分类转字符串
---@param val py.UnitType # 单位类型
---@return string # 字符串
function GlobalAPI.unit_type_to_str(val) end

--字符串转单位分类
---@param val string # 字符串
---@return py.UnitType # 单位类型
function GlobalAPI.str_to_unit_type(val) end

--计时器转字符串
---@param val py.Timer # 计时器
---@return string # 字符串
function GlobalAPI.timer_to_str(val) end

--单位转字符串
---@param obj py.Unit # 单位
---@return string # 字符串
function GlobalAPI.unit_to_str(obj) end

--单位组转字符串
---@param obj py.UnitGroup # 单位组
---@return string # 字符串
function GlobalAPI.unit_group_to_str(obj) end

--物品转字符串
---@param obj py.Item # 物品对象
---@return string # 字符串
function GlobalAPI.item_to_str(obj) end

--物品组转字符串
---@param obj py.ItemGroup # 物品组
---@return string # 字符串
function GlobalAPI.item_group_to_str(obj) end

--运动器转字符串
---@param obj_id py.Mover # 运动器
---@return string # 字符串
function GlobalAPI.mover_entity_to_str(obj_id) end

--关卡转字符串
---@param obj py.Map # 关卡
---@return string # 字符串
function GlobalAPI.map_to_str(obj) end

--玩家转字符串
---@param obj py.Role # 玩家
---@return string # 字符串
function GlobalAPI.role_to_str(obj) end

--玩家组转字符串
---@param obj py.RoleGroup # 玩家组
---@return string # 字符串
function GlobalAPI.role_group_to_str(obj) end

--玩家状态转字符串
---@param val py.RoleStatus # 玩家状态
---@return string # 字符串
function GlobalAPI.role_status_to_str(val) end

--字符串转玩家状态
---@param val string # 字符串
---@return py.RoleStatus # 玩家状态
function GlobalAPI.str_to_role_status(val) end

--玩家控制者转字符串
---@param val py.RoleType # 玩家控制者类型
---@return string # 字符串
function GlobalAPI.role_type_to_str(val) end

--字符串转玩家控制者
---@param val string # 字符串
---@return py.RoleType # 玩家控制者类型
function GlobalAPI.str_to_role_type(val) end

--技能转字符串
---@param obj py.Ability # 技能对象
---@return string # 字符串
function GlobalAPI.ability_to_str(obj) end

--技能槽位类型转字符串
---@param val py.AbilityType # 技能类型
---@return string # 字符串
function GlobalAPI.ability_type_to_str(val) end

--字符串转技能槽位类型
---@param val string # 技能类型
---@return py.AbilityType # 技能类型
function GlobalAPI.str_to_ability_type(val) end

--矩形区域转字符串
---@param obj py.RecArea # 矩形区域
---@return string # 字符串
function GlobalAPI.rect_area_to_str(obj) end

--圆形区域转字符串
---@param obj py.CirArea # 圆形区域
---@return string # 字符串
function GlobalAPI.circle_area_to_str(obj) end

--路径转字符串
---@param obj py.Road # 路径
---@return string # 字符串
function GlobalAPI.road_to_str(obj) end

--可破坏物转字符串
---@param obj py.Destructible # 可破坏物对象
---@return string # 字符串
function GlobalAPI.dest_to_str(obj) end

--投射物转字符串
---@param obj py.ProjectileEntity # 投掷物对象
---@return string # 字符串
function GlobalAPI.project_to_str(obj) end

--魔法效果转字符串
---@param obj py.ModifierEntity # 魔法效果对象
---@return string # 字符串
function GlobalAPI.modifier_entity_to_str(obj) end

--魔法效果类别转字符串
---@param val py.ModifierType # 魔法效果类别
---@return string # 字符串
function GlobalAPI.modifier_type_to_str(val) end

--字符串转魔法效果类别
---@param val string # 字符串
---@return py.ModifierType # 魔法效果类别
function GlobalAPI.str_to_modifier_type(val) end

--魔法效果影响类型转字符串
---@param val py.ModifierEffectType # 魔法效果影响类别
---@return string # 字符串
function GlobalAPI.modifier_effect_type_to_str(val) end

--字符串转魔法效果影响类型
---@param val string # 字符串
---@return py.ModifierEffectType # 魔法效果影响类别
function GlobalAPI.str_to_modifier_effect_type(val) end

--阵营转字符串
---@param obj py.Camp # 阵营对象
---@return string # 字符串
function GlobalAPI.camp_to_str(obj) end

--随机池转字符串
---@param obj py.RandomPool # 随机池
---@return string # 字符串
function GlobalAPI.random_pool_to_str(obj) end

--键盘按键转字符串
---@param obj py.KeyboardKey # 键盘按键
---@return string # 字符串
function GlobalAPI.keyboard_key_to_str(obj) end

--字符串转键盘按键
---@param obj string # 字符串
---@return py.KeyboardKey # 键盘按键
function GlobalAPI.str_to_keyboard_key(obj) end

--鼠标按键转字符串
---@param obj py.MouseKey # 鼠标按键
---@return string # 字符串
function GlobalAPI.mouse_key_to_str(obj) end

--字符串转鼠标按键
---@param obj string # 字符串
---@return py.MouseKey # 鼠标按键
function GlobalAPI.str_to_mouse_key(obj) end

--鼠标滚轮转字符串
---@param obj py.MouseWheel # 鼠标滚轮
---@return string # 字符串
function GlobalAPI.mouse_wheel_to_str(obj) end

--字符串转鼠标滚轮
---@param obj string # 字符串
---@return py.MouseWheel # 鼠标滚轮
function GlobalAPI.str_to_mouse_wheel(obj) end

--触发器转字符串
---@param obj py.DynamicTypeMeta # 触发器
---@return string # 字符串
function GlobalAPI.trigger_to_str(obj) end

--表转字符串
---@param obj py.Table # 表
---@return string # 字符串
function GlobalAPI.table_to_str(obj) end

--伤害类型转字符串
---@param obj integer # 伤害类型
---@return string # 字符串
function GlobalAPI.damage_type_to_str(obj) end

--字符串转伤害类型
---@param obj string # 字符串
---@return integer # 伤害类型
function GlobalAPI.str_to_damage_type(obj) end

--单位属性类型转字符串
---@param obj string # 属性类型
---@return string # 字符串
function GlobalAPI.unit_attr_type_to_str(obj) end

--字符串转单位属性类型
---@param obj string # 字符串
---@return string # 属性类型
function GlobalAPI.str_to_unit_attr_type(obj) end

--字符串转UI事件
---@param obj string # 字符串
---@return string # UI事件
function GlobalAPI.str_to_ui_event(obj) end

--控件转字符串
---@param obj string # 控件
---@return string # 字符串
function GlobalAPI.comp_to_str(obj) end

--获取本地语言环境
---@return py.LanguageType # 语言环境
function GlobalAPI.get_client_language_type() end

--截取
---@param obj string # 字符串
---@param start integer # start
---@param end_ integer # end
---@return string # str
function GlobalAPI.string_slice(obj, start, end_) end

--取反
---@param v boolean # bool
---@return boolean # bool
function GlobalAPI.bool_not(v) end

--获取返回的服务器时间(年)
---@param v number # float
---@return integer # int
function GlobalAPI.get_year_of_server_timestamp(v) end

--获取返回的服务器时间(月)
---@param v number # float
---@return integer # int
function GlobalAPI.get_month_of_server_timestamp(v) end

--获取返回的服务器时间(日)
---@param v number # float
---@return integer # int
function GlobalAPI.get_day_of_server_timestamp(v) end

--获取返回的服务器时间(小时)
---@param v number # float
---@return integer # int
function GlobalAPI.get_hour_of_server_timestamp(v) end

--随机池结果迭代器
---@param v py.Dict # Result
---@return py.Iterator # Python迭代器
function GlobalAPI.iter_random_pool_result(v) end

--获取服务器随机池执行结果
---@param v integer # int
---@return integer # int
function GlobalAPI.get_random_pool_ret_code(v) end

--获取服务器随机池掉落影响存档槽位
---@param v integer # int
---@return integer # int
function GlobalAPI.get_iter_random_pool_archive_key(v) end

--获取服务器随机池掉落影响存档值
---@param v integer # int
---@return integer # int
function GlobalAPI.get_iter_random_pool_archive_increment(v) end

--还给lua一个空python table
---@return py.Dict # Dict
function GlobalAPI.lua_get_python_empty_dict() end

--时间戳转化为日期
---@param v integer # int
---@return string # str
function GlobalAPI.timestamp_to_str(v) end

--字符串转时间戳
---@param v string # str
---@return integer # int
function GlobalAPI.str_to_timestamp(v) end
