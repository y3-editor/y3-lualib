-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.Item
local Item = {}

--获取物品编号
---@return py.ItemKey? # 物品编号
function Item:api_get_key() end

--设置物品名称
---@param name string # 物品名称
function Item:set_name(name) end

--获取物品名称
---@return string? # 物品名称
function Item:get_name() end

--获取物品配置名称
---@return string? # 物品名称
function Item:api_get_conf_name() end

--设置物品描述
---@param desc string # 物品描述
function Item:api_set_desc(desc) end

--获取物品描述
---@return string? # 物品描述
function Item:api_get_desc() end

--获取物品配置描述
---@return string? # 物品描述
function Item:api_get_conf_desc() end

--获取物品类型
---@return integer? # 物品类型
function Item:api_get_type() end

--获取物品等级
---@return integer? # 物品等级
function Item:api_get_level() end

--设置物品等级
---@param level integer # 等级
function Item:api_set_level(level) end

--丢弃物品
---@param pos py.FPoint # 点
---@param stack_cnt? integer # 数量
function Item:api_drop_self(pos, stack_cnt) end

--从单位身上移除物品
function Item:api_remove() end

--设置物品出售
---@param sale_state boolean # 可否出售
function Item:api_set_sale_state(sale_state) end

--设置物品堆叠数
---@param stack_cnt integer # 堆叠数
function Item:api_set_stack_cnt(stack_cnt) end

--设置物品充能数
---@param charge_cnt integer # 充能数
function Item:api_set_charge_cnt(charge_cnt) end

--设置物品最大充能数
---@param max_charge integer # 最大充能数
function Item:api_set_max_charge(max_charge) end

--物品实体所在位置(若在玩家身上返回玩家位置)
---@return py.FVector3? # 物品位置
function Item:api_get_position() end

--物品是否在场景中
---@return boolean? # 是否在场景中
function Item:api_is_in_scene() end

--获取物品堆叠数
---@return integer? # 堆叠数
function Item:api_get_stack_cnt() end

--获取物品堆叠类型
---@return integer? # 堆叠类型
function Item:api_get_stack_type() end

--获取物品充能数
---@return integer? # 充能数
function Item:api_get_charge_cnt() end

--获取物品充能数
---@return integer? # 最大充能数
function Item:api_get_max_charge() end

--设置物品丢弃
---@param can_drop boolean # 可否丢弃
function Item:api_set_droppable(can_drop) end

--设置物品出售
---@param can_sell boolean # 可否丢弃
function Item:api_set_sellable(can_sell) end

--设置物品生命值
---@param hp number # 生命值
function Item:api_set_hp(hp) end

--获取物品丢弃
---@return boolean? # 可否丢弃
function Item:api_get_droppable() end

--获取物品出售
---@return boolean? # 可否出售
function Item:api_get_sellable() end

--获取物品生命值
---@return py.Fixed? # 生命值
function Item:api_get_hp() end

--设置物品附加属性
---@param attr_element_field string # 属性名
---@param attr_key string # 属性成分名
---@param val number # 属性值
function Item:api_set_attr(attr_element_field, attr_key, val) end

--增加物品附加属性
---@param attr_element_field string # 属性名
---@param attr_key string # 属性成分名
---@param delta number # 属性值
function Item:api_change_attr(attr_element_field, attr_key, delta) end

--获取物品附加属性
---@param attr_element_field string # 属性成分名
---@param attr_key string # 属性名
---@return py.Fixed? # 属性值
function Item:api_get_attr(attr_element_field, attr_key) end

--设置物品所有者
---@param creator py.Role # 所有者
function Item:api_set_creator(creator) end

--获得物品所有者
---@return py.Role? # 所有者
function Item:api_get_creator() end

--获得物品拥有者
---@return py.Unit? # 拥有者
function Item:api_get_owner() end

--添加物品堆叠数
---@param cnt integer # 堆叠数
function Item:api_add_stack(cnt) end

--添加物品充能数
---@param cnt integer # 充能数
function Item:api_add_charge(cnt) end

--获取物品缩放
---@return py.Fixed? # 缩放
function Item:api_get_scale() end

--获取物品朝向
---@return py.Fixed? # 朝向角度
function Item:api_get_face_angle() end

--设置物品缩放
---@param scale number # 缩放
function Item:api_set_scale(scale) end

--设置物品位置
---@param point py.Point # 物品位置
function Item:api_set_position(point) end

--设置物品朝向
---@param face_angle number # 物品朝向
function Item:api_set_face_angle(face_angle) end

--是否在区域内
---@param area py.Area # 区域
---@return boolean? # 是否在区域
function Item:api_is_in_area(area) end

--移动物品到点
---@param point py.Point # 点
function Item:api_transmit(point) end

--物品添加标签
---@param tag string # 标签
function Item:api_add_tag(tag) end

--物品删除标签
---@param tag string # 标签
function Item:api_remove_tag(tag) end

--物品是否拥有标签
---@param tag string # 标签
---@return boolean? # 物品是否拥有标签
function Item:api_has_tag(tag) end

--物品移除键值对
---@param k string # 要移除的键
function Item:api_remove_kv(k) end

--获取物品在场景中的对应实体
---@return py.Unit? # 场景中的实体
function Item:api_get_item_unit() end

--获取物品id
---@return py.ItemID? # 物品id
function Item:api_get_id() end

--物品是否在物品栏
---@return boolean? # 是否在物品栏中
function Item:api_is_in_bar() end

--物品是否在背包栏中
---@return boolean? # 是否在背包栏中
function Item:api_is_in_pkg() end

--对物品所属单位的所属玩家关系播放音乐
---@param camp_target py.RoleRelation # 玩家关系
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
function Item:api_play_sound_by_item_for_role_relation(camp_target, sid, loop) end

--获取物品的主动技能
---@return py.Ability? # 技能对象
function Item:api_get_positive_ability() end

--获取物品的被动技能
---@param index? integer # 索引
---@return py.Ability? # 技能对象
function Item:api_get_passive_ability(index) end

--设置物品的图标为图片
---@param icon_id py.Texture # 图标
function Item:api_set_item_icon(icon_id) end

--获取物品的图标
---@return py.Texture? # 图标
function Item:api_get_item_icon() end

--物品所在背包槽位类型
---@return py.SlotType? # 槽位类型
function Item:api_get_item_slot_type() end

--物品所在的格子位置索引
---@return integer? # 格子位置
function Item:api_get_item_slot_idx() end

--物品实例添加被动技能
---@param ability_id py.AbilityKey # 技能id
---@param ability_level integer # 技能等级
function Item:api_item_add_passive_ability(ability_id, ability_level) end

--获取物品的模型
---@return py.ModelKey? # 模型编号
function Item:api_get_item_model() end

--设置物品可见性
---@param is_visible boolean # 是否可见
function Item:api_set_item_visible(is_visible) end

--物品是否可见
---@return boolean? # 是否可见
function Item:api_is_item_visible() end

--物品替换模型
---@param source_model py.ModelKey # 原模型编号
function Item:api_change_model(source_model) end

--取消物品替换模型
---@param target_model py.ModelKey # 目标模型名字
function Item:api_cancel_replace_model(target_model) end

--获取物品购买所需资源
---@param role_res_key py.RoleResKey # 玩家属性key
---@return integer? # 所需资源数量
function Item:api_get_item_res_cnt(role_res_key) end

--获取物品的实数属性
---@param att_key string # 物品实数属性key
---@return py.Fixed? # 实数属性值
function Item:api_get_item_float_attr(att_key) end

--获取物品的整数属性
---@param att_key string # 物品整数属性key
---@return integer? # 整数属性值
function Item:api_get_item_int_attr(att_key) end

--物品是否自动使用
---@return boolean? # 是否自动使用
function Item:api_is_item_auto_use() end
