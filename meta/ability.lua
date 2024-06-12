-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.Ability
local Ability = {}

--获取技能字符串属性
---@param attr py.AbilityStrAttr # 标记名
---@return string? # 字符串属性
function Ability:api_get_str_attr(attr) end

--设置技能字符串属性
---@param attr py.AbilityStrAttr # 标记名
---@param value string # 字符串值
function Ability:api_set_str_attr(attr, value) end

--设置技能名字
---@param value string # 字符串值
function Ability:api_set_name(value) end

--获取技能拥有者
---@return py.Unit? # 技能拥有者
function Ability:api_get_owner() end

--获取技能拥有者id
---@return py.UnitID? # 技能拥有者id
function Ability:api_get_owner_id() end

--获取技能类型
---@return py.AbilityType? # 技能类型
function Ability:api_get_type() end

--获取技能类型
---@return py.AbilityIndex? # 技能序号
function Ability:api_get_ability_index() end

--获取技能拥有者
---@return py.AbilitySeq? # 技能Seq
function Ability:api_get_ability_seq() end

--获取技能释放类型
---@return py.AbilityCastType? # 技能释放类型
function Ability:api_get_ability_cast_type() end

--获取技能全局唯一id
---@return integer? # 技能全局唯一id
function Ability:api_get_ability_global_id() end

--移除技能
function Ability:api_remove() end

--获取技能的等级
---@return integer? # 技能等级
function Ability:api_get_level() end

--是否拥有标记
---@param tag string # 标记名
---@return boolean? # 是否有标记
function Ability:has_tag(tag) end

--移除键值对
---@param k string # 键
function Ability:api_remove_kv(k) end

--计算公式类型KV
---@param k string # 键
---@return py.Fixed? # 值
function Ability:api_calc_ability_formula_kv(k) end

--添加定时器
---@param time py.Fixed # 定时时长
---@param callback function # 超时函数
function Ability:add_timer(time, callback) end

--技能对象是否拥有目标
---@param runtime_id? integer # runtime_id
---@return boolean? # 技能对象是否拥有目标
function Ability:api_has_target(runtime_id) end

--获取技能释放的位置
---@param runtime_id? integer # runtime_id
---@return py.FPoint? # 技能释放的位置
function Ability:api_get_release_position(runtime_id) end

--获取技能释放的方向
---@param runtime_id? integer # runtime_id
---@return py.Fixed? # 技能释放的方向
function Ability:api_get_release_direction(runtime_id) end

--获取技能实数属性值
---@param attr string # 属性名
---@return py.Fixed? # 实数属性值
function Ability:api_get_float_attr(attr) end

--获取技能整数属性值
---@param attr string # 属性名
---@return integer? # 整数属性值
function Ability:api_get_int_attr(attr) end

--获取技能布尔属性值
---@param attr string # 属性名
---@return boolean? # 布尔属性值
function Ability:api_get_bool_attr(attr) end

--获取技能释放范围
---@return py.Fixed? # 释放范围
function Ability:api_get_ability_cast_range() end

--设置技能释放范围
---@param value py.Fixed # 释放范围
function Ability:api_set_ability_cast_range(value) end

--设置技能的建造朝向
---@param value py.Fixed # 建造朝向
function Ability:api_set_ability_build_rotate(value) end

--设置技能的建造目标类型(build_id)
---@param new_build_id py.UnitKey # 单位物编ID
function Ability:api_set_ability_build_id(new_build_id) end

--设置技能的限制建造区域
---@param area py.Area # 区域对象
function Ability:api_set_ability_build_area(area) end

--设置扇形指示器半径
---@param value py.Fixed # 指示器半径
function Ability:api_set_ability_sector_radius(value) end

--设置扇形指示器角度
---@param value py.Fixed # 指示器角度
function Ability:api_set_ability_sector_angle(value) end

--设置箭头/多段指示器宽度
---@param value py.Fixed # 释放范围
function Ability:api_set_ability_arrow_width(value) end

--设置箭头/多段指示器长度
---@param value py.Fixed # 释放范围
function Ability:api_set_ability_arrow_length(value) end

--设置圆形指示器半径
---@param value py.Fixed # 释放范围
function Ability:api_set_ability_circle_radius(value) end

--设置技能指示器类型
---@param pointer_type integer # 指示器类型
function Ability:api_set_ability_pointer_type(pointer_type) end

--获取技能指示器类型
---@return integer? # 指示器类型
function Ability:api_get_ability_skill_pointer() end

--设置技能图标
---@param icon_id integer # 图标
function Ability:api_set_ability_icon(icon_id) end

--获取技能玩家属性消耗
---@param attr string # 玩家属性名
---@return py.Fixed? # 玩家属性消耗
function Ability:api_get_ability_player_attr_cost(attr) end

--设置技能玩家属性消耗
---@param attr string # 玩家属性名
---@param value py.Fixed # 玩家属性消耗
function Ability:api_set_ability_player_attr_cost(attr, value) end

--增加技能玩家属性消耗
---@param attr string # 玩家属性名
---@param value py.Fixed # 玩家属性消耗
function Ability:api_add_ability_player_attr_cost(attr, value) end

--设置技能等级
---@param level integer # 技能等级
function Ability:api_set_level(level) end

--学习技能
function Ability:api_learn_ability() end

--增加技能等级
---@param level integer # 技能等级
function Ability:api_add_level(level) end

--增量修改技能实数属性值
---@param attr string # 属性名
---@param value py.Fixed # 实数属性值
function Ability:api_add_float_attr(attr, value) end

--设置技能实数属性值
---@param attr string # 属性名
---@param value py.Fixed # 实数属性值
function Ability:api_set_float_attr(attr, value) end

--增量修改技能整数属性值
---@param attr string # 属性名
---@param value integer # 整数属性值
function Ability:api_add_int_attr(attr, value) end

--设置技能整数属性值
---@param attr string # 属性名
---@param value integer # 整数属性值
function Ability:api_set_int_attr(attr, value) end

--设置技能布尔属性值
---@param attr string # 属性名
---@param value boolean # 布尔属性值
function Ability:api_set_bool_attr(attr, value) end

--阻止当前技能施法
function Ability:api_break_ability_in_cs() end

--获取最近的技能可升级等级
---@return integer? # 等级
function Ability:api_get_ability_nearest_upgradable_unit_level() end

--获取技能编号
---@return py.AbilityKey? # 技能编号
function Ability:api_get_ability_id() end

--是否是近战技能
---@return boolean? # 布尔值
function Ability:api_is_melee_ability() end

--是否是普攻
---@return boolean? # 布尔值
function Ability:api_is_common_atk() end

--是否是被动
---@return boolean? # 布尔值
function Ability:is_passive_ability() end

--获取消耗生命是否致死
---@return boolean? # 消耗生命是否致死
function Ability:api_get_cost_hp_can_die() end

--设置消耗生命是否致死
---@param value boolean # 能否释放
function Ability:api_set_cost_hp_can_die(value) end

--获取生命不足能否施放
---@return boolean? # 生命不足能否施放
function Ability:api_get_can_cast_when_hp_insufficient() end

--设置生命不足能否施放
---@param value boolean # 能否释放
function Ability:api_set_can_cast_when_hp_insufficient(value) end

--获取技能名称
---@return string? # 技能名称
function Ability:api_get_name() end

--设置技能是否受冷却缩减影响
---@param value boolean # 布尔属性值
function Ability:api_set_influenced_by_cd_reduce(value) end

--是否受冷却缩减影响
---@return boolean? # 布尔值
function Ability:api_get_influenced_by_cd_reduce() end

--获取技能的充能层数
---@return integer? # 技能层数
function Ability:api_get_ability_stack() end

--增加技能充能层数
---@param value integer # 充能层数
function Ability:api_add_ability_stack_count(value) end

--设置技能充能层数
---@param value integer # 充能层数
function Ability:api_set_ability_stack_count(value) end

--获取当前技能剩余冷却时间
---@return py.Fixed? # 剩余冷却时间
function Ability:api_get_cd_left_time() end

--技能立即冷却
function Ability:api_immediately_clear_cd() end

--改变技能冷却时间
---@param value py.Fixed # 冷却时间
function Ability:api_change_ability_cd_cold_down(value) end

--设置技能冷却时间
---@param value py.Fixed # 冷却时间
function Ability:api_set_ability_cd(value) end

--增加技能冷却时间
---@param value py.Fixed # 冷却时间
function Ability:api_add_ability_cd(value) end

--从头开始冷却
function Ability:api_restart_cd() end

--改变当次充能时间
---@param value py.Fixed # 冷却时间
function Ability:api_set_ability_cur_stack_cd(value) end

--获取技能当前剩余充能时间
---@return py.Fixed? # 剩余充能时间
function Ability:api_get_stack_cd_left_time() end

--启用技能
function Ability:api_enable() end

--禁用技能
function Ability:api_disable() end

--对技能所属单位的所属玩家关系播放音乐
---@param camp_target py.RoleRelation # 玩家关系
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
function Ability:api_play_sound_by_ability_for_role_relation(camp_target, sid, loop) end

--开关自动施法
---@param b boolean # 开关
function Ability:api_set_autocast_enabled(b) end

--自动施法是否开启
---@return boolean? # 是否开启
function Ability:api_is_autocast_enabled() end

--获取技能绑定的物品
---@return py.Item? # 物品实体
function Ability:api_get_item() end

--技能添加键值对
---@param tag string # TAG
function Ability:api_add_tag(tag) end

--技能移除键值对
---@param tag string # TAG
function Ability:api_remove_tag(tag) end

--清空键值对
function Ability:api_clear_tag() end

--设置是否为永久性技能
---@param is_permanent_ability boolean # 是否为永久性技能
function Ability:api_set_ability_is_permanent(is_permanent_ability) end

--增加技能的筛选单位的tag
---@param tag string # 标签
function Ability:api_add_filter_unit_tag(tag) end

--移除技能的筛选单位的tag
---@param tag string # 标签
---@return string? # 标签
function Ability:api_remove_filter_unit_tag(tag) end

--增加技能的筛选物品的tag
---@param tag string # 标签
function Ability:api_add_filter_item_tag(tag) end

--移除技能的筛选物品的tag
---@param tag string # 标签
---@return string? # 标签
function Ability:api_remove_filter_item_tag(tag) end

--增加技能的筛选可破坏物的tag
---@param tag string # 标签
function Ability:api_add_collection_destructible_tags(tag) end

--移除技能的筛选可破坏物的tag
---@param tag string # 标签
---@return string? # 标签
function Ability:api_remove_collection_destructible_tags(tag) end

--是否可被当前技能筛选
---@param actor py.Actor # 单位/物品/可破坏物
---@return boolean? # 是否可被筛选
function Ability:api_can_be_filtered_by_ability(actor) end
