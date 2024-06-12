-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.Destructible
local Destructible = {}

--移动可破坏物到点
---@param point py.Point # 点
function Destructible:api_transmit(point) end

--杀死可破坏物
---@param unit py.Unit # 凶手单位
function Destructible:api_kill(unit) end

--使可破坏物枯竭
---@param unit py.Unit # 采集单位
function Destructible:api_set_dest_dry(unit) end

--删除可破坏物
function Destructible:api_delete() end

--复活可破坏物
---@param point py.Point # 复活点
function Destructible:api_revivie(point) end

--显示隐藏可破坏物
---@param is_show boolean # 是否显示
function Destructible:api_show_hide(is_show) end

--设置可破坏物生命值
---@param hp_value py.Fixed # 生命值
function Destructible:api_set_hp(hp_value) end

--设置可破坏物最大生命值
---@param hp_value py.Fixed # 最大生命值
function Destructible:api_set_max_hp(hp_value) end

--设置可破坏物的名称
---@param name string # 名称
function Destructible:api_set_name(name) end

--设置可破坏物的资源数量
---@param num integer # 资源数量
function Destructible:api_set_source_num(num) end

--设置可破坏物的大小
---@param x py.Fixed # x大小
---@param y py.Fixed # y大小
---@param z py.Fixed # z大小
function Destructible:api_set_scale(x, y, z) end

--设置可破坏物的角度
---@param angle py.Fixed # 角度
function Destructible:api_set_face_angle(angle) end

--获取可破坏物的整型属性
---@param attr_name string # 属性名称
---@return integer? # 整数类型返回值
function Destructible:api_get_int_attr(attr_name) end

--获取可破坏物的编号
---@return py.DestructibleKey? # 可破坏物编号
function Destructible:api_get_key() end

--获取可破坏物的字符串属性
---@param attr_name string # 属性名称
---@return string? # 字符串类型返回值
function Destructible:api_get_str_attr(attr_name) end

--设置可破坏物的字符串属性
---@param attr_name string # 属性名称
---@param value string # 属性取值
function Destructible:api_set_str_attr(attr_name, value) end

--获取可破坏物的布尔值属性
---@param attr_name string # 属性名称
---@return boolean? # 布尔类型返回值
function Destructible:api_get_bool_attr(attr_name) end

--获取可破坏物的浮点数属性
---@param attr_name string # 属性名称
---@return py.Fixed? # 浮点类型返回值
function Destructible:api_get_float_attr(attr_name) end

--获取可破坏物所属阵营id
---@return py.CampID? # 阵营ID
function Destructible:api_get_camp_id() end

--获取可破坏物位置
---@return py.FVector3? # 单位位置
function Destructible:api_get_position() end

--获取可破坏物的id
---@return py.DestructibleID? # 可破坏物id
function Destructible:api_get_id() end

--获取可破坏物的x轴缩放
---@return number? # 缩放的值
function Destructible:api_get_x_scale() end

--获取可破坏物的y轴缩放
---@return number? # 缩放的值
function Destructible:api_get_y_scale() end

--获取可破坏物的z轴缩放
---@return number? # 缩放的值
function Destructible:api_get_z_scale() end

--获取可破坏物的旋转角度
---@return number? # 角度值
function Destructible:api_get_angle() end

--获取可破坏物模型
---@return py.ModelKey? # 模型编号
function Destructible:api_get_dest_model() end

--可破坏物能否被技能指示器选中
---@return boolean? # 布尔值
function Destructible:api_is_ability_target() end

--可破坏物能否被普通攻击
---@return boolean? # 布尔值
function Destructible:api_is_attacked() end

--可破坏物能否被选中
---@return boolean? # 布尔值
function Destructible:api_is_selected() end

--可破坏物能否被采集
---@return boolean? # 布尔值
function Destructible:api_is_collected() end

--可破坏物是否可见
---@return boolean? # 布尔值
function Destructible:api_is_visible() end

--可破坏物是否存活
---@return boolean? # 布尔值
function Destructible:api_is_alive() end

--获取可破坏物的当前资源
---@return integer? # 布尔值
function Destructible:api_get_dest_cur_source_nums() end

--获取可破坏物的最大资源
---@return integer? # 布尔值
function Destructible:api_get_dest_max_source_nums() end

--获取可破坏物的玩家属性
---@return py.RoleResKey? # 玩家属性
function Destructible:api_get_role_res_of_dest() end

--获取可破坏物的物品类型
---@return py.ItemKey? # 物品类型
function Destructible:api_get_item_type_of_dest() end

--获取可破坏物的面向角度
---@return py.Fixed? # 可破坏物的面向角度
function Destructible:api_get_dest_face_angle() end

--获取可破坏物的高度
---@return py.Fixed? # 可破坏物的高度
function Destructible:api_get_dest_height_offset() end

--复活可破坏物
function Destructible:api_revivie_new() end

--设置可破坏物能否被技能指示器选中
---@param bool_value boolean # 布尔值
function Destructible:api_set_dest_is_ability_target(bool_value) end

--设置可破坏物能否被普通攻击
---@param bool_value boolean # 布尔值
function Destructible:api_set_dest_is_attacked(bool_value) end

--设置可破坏物能否被选中
---@param bool_value boolean # 布尔值
function Destructible:api_set_dest_is_selected(bool_value) end

--设置可破坏物能否被采集
---@param bool_value boolean # 布尔值
function Destructible:api_set_dest_is_collected(bool_value) end

--可破坏物添加标签
---@param tag string # TAG
function Destructible:api_add_tag(tag) end

--可破坏物移除标签
---@param tag string # TAG
function Destructible:api_remove_tag(tag) end

--设置可破坏物能的当前资源个数
---@param sp_value py.Fixed # 资源数
function Destructible:api_set_cur_source_nums(sp_value) end

--设置可破坏物能的最大资源个数
---@param sp_value py.Fixed # 资源数
function Destructible:api_set_max_source_nums(sp_value) end

--增加可破坏物能的当前生命值
---@param delta py.Fixed # 当前生命值
function Destructible:api_add_hp_cur_value(delta) end

--增加可破坏物能的最大生命值
---@param delta py.Fixed # 最大生命值
function Destructible:api_add_hp_max_value(delta) end

--增加可破坏物能的当前资源个数
---@param delta py.Fixed # 当前资源数
function Destructible:api_add_sp_cur_value(delta) end

--增加可破坏物能的最大资源个数
---@param delta py.Fixed # 最大资源数
function Destructible:api_add_sp_max_value(delta) end

--可破坏物播放动画
---@param name string # 动画名称
---@param init_time? number # 开始时间(s)
---@param end_time? number # 结束时间(s)，正数 -1 表示不结束
---@param loop? boolean # 是否循环
---@param rate? number # 播放倍率
function Destructible:api_play_animation(name, init_time, end_time, loop, rate) end

--可破坏物停止播放动画
---@param name string # 动画名称
function Destructible:api_stop_animation(name) end

--可破坏物替换模型
---@param target_model py.ModelKey # 目标模型编号
function Destructible:api_replace_model(target_model) end

--取消可破坏物替换模型
---@param target_model py.ModelKey # 目标模型名字
function Destructible:api_cancel_replace_model(target_model) end

--设置可破坏物的高度
---@param height_value py.Fixed # 高度值
function Destructible:api_set_height_offset(height_value) end

--增加可破坏物的高度
---@param delta py.Fixed # 高度变化值
function Destructible:api_add_height_offset(delta) end
