-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--获取单位编号SITE_STATE键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_unit_key_site_state_kv(unit_key, key) end

--获取物品编号SITE_STATE键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_item_key_site_state_kv(item_key, key) end

--获取技能编号SITE_STATE键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_ability_key_site_state_kv(ability_key, key) end

--获取魔法效果特效编号SITE_STATE键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_modifier_key_site_state_kv(modifier_key, key) end

--获取特效编号SITE_STATE键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_projectile_key_site_state_kv(projectile_key, key) end

--获取可破坏物编号SITE_STATE键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_destructible_key_site_state_kv(destructible_key, key) end

--获取科技编号SITE_STATE键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_tech_key_site_state_kv(tech_key, key) end

--获取图片SITE_STATE键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_icon_id_site_state_kv(icon_id, key) end

--获取逻辑物理组件类型SITE_STATE键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_physics_entity_key_site_state_kv(physics_entity_key, key) end

--获取SITE_STATE键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.SITE_STATE # 键值
function GameAPI.get_kv_pair_value_site_state(kvbase, key) end

--获取单位编号COIN_CURRENCY键值对
---@param unit_key py.UnitKey # 单位编号
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_unit_key_coin_currency_kv(unit_key, key) end

--获取物品编号COIN_CURRENCY键值对
---@param item_key py.ItemKey # 物品编号
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_item_key_coin_currency_kv(item_key, key) end

--获取技能编号COIN_CURRENCY键值对
---@param ability_key py.AbilityKey # 技能编号
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_ability_key_coin_currency_kv(ability_key, key) end

--获取魔法效果特效编号COIN_CURRENCY键值对
---@param modifier_key py.ModifierKey # 魔法效果编号
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_modifier_key_coin_currency_kv(modifier_key, key) end

--获取特效编号COIN_CURRENCY键值对
---@param projectile_key py.ProjectileKey # 特效编号
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_projectile_key_coin_currency_kv(projectile_key, key) end

--获取可破坏物编号COIN_CURRENCY键值对
---@param destructible_key py.DestructibleKey # 可破坏物编号
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_destructible_key_coin_currency_kv(destructible_key, key) end

--获取科技编号COIN_CURRENCY键值对
---@param tech_key py.TechKey # 科技编号
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_tech_key_coin_currency_kv(tech_key, key) end

--获取图片COIN_CURRENCY键值对
---@param icon_id py.Texture # 图片
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_icon_id_coin_currency_kv(icon_id, key) end

--获取逻辑物理组件类型COIN_CURRENCY键值对
---@param physics_entity_key py.PhysicsEntityKey # 逻辑物理组件类型
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_physics_entity_key_coin_currency_kv(physics_entity_key, key) end

--获取COIN_CURRENCY键值对
---@param kvbase py.KVBase # 自定义键值载体
---@param key string # 键名称
---@return py.COIN_CURRENCY # 键值
function GameAPI.get_kv_pair_value_coin_currency(kvbase, key) end

--获取全局触发器UI_CHAT_SEND_CHANNEL非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_chat_send_channel(key) end

--获取触发器UI_CHAT_SEND_CHANNEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_chat_send_channel(actor, key) end

--获取全局触发器UI_CHAT_SEND_CHANNEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_chat_send_channel(key, index) end

--获取触发器UI_CHAT_SEND_CHANNEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_chat_send_channel(actor, key, index) end

--获取全局触发器UI_CHAT_SEND_CHANNEL数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_chat_send_channel(key) end

--获取触发器UI_CHAT_SEND_CHANNEL 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_chat_send_channel(actor, key) end

--获取全局触发器UI_CHAT_RECV_CHANNEL非数组变量
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_variable_ui_chat_recv_channel(key) end

--获取触发器UI_CHAT_RECV_CHANNEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return integer # 值
function GameAPI.get_trigger_actor_variable_ui_chat_recv_channel(actor, key) end

--获取全局触发器UI_CHAT_RECV_CHANNEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_variable_ui_chat_recv_channel(key, index) end

--获取触发器UI_CHAT_RECV_CHANNEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return integer # 值
function GameAPI.get_trigger_list_actor_variable_ui_chat_recv_channel(actor, key, index) end

--获取全局触发器UI_CHAT_RECV_CHANNEL数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_ui_chat_recv_channel(key) end

--获取触发器UI_CHAT_RECV_CHANNEL 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_ui_chat_recv_channel(actor, key) end

--获取全局触发器GOODS_KEY非数组变量
---@param key string # 变量名称
---@return py.GoodsKey # 值
function GameAPI.get_trigger_variable_goods_key(key) end

--获取触发器GOODS_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.GoodsKey # 值
function GameAPI.get_trigger_actor_variable_goods_key(actor, key) end

--获取全局触发器GOODS_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.GoodsKey # 值
function GameAPI.get_trigger_list_variable_goods_key(key, index) end

--获取触发器GOODS_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.GoodsKey # 值
function GameAPI.get_trigger_list_actor_variable_goods_key(actor, key, index) end

--获取全局触发器GOODS_KEY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_goods_key(key) end

--获取触发器GOODS_KEY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_goods_key(actor, key) end

--获取全局触发器SITE_STATE非数组变量
---@param key string # 变量名称
---@return py.SITE_STATE # 值
function GameAPI.get_trigger_variable_site_state(key) end

--获取触发器SITE_STATE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.SITE_STATE # 值
function GameAPI.get_trigger_actor_variable_site_state(actor, key) end

--获取全局触发器SITE_STATE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SITE_STATE # 值
function GameAPI.get_trigger_list_variable_site_state(key, index) end

--获取触发器SITE_STATE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.SITE_STATE # 值
function GameAPI.get_trigger_list_actor_variable_site_state(actor, key, index) end

--获取全局触发器SITE_STATE数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_site_state(key) end

--获取触发器SITE_STATE 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_site_state(actor, key) end

--获取全局触发器COIN_CURRENCY非数组变量
---@param key string # 变量名称
---@return py.COIN_CURRENCY # 值
function GameAPI.get_trigger_variable_coin_currency(key) end

--获取触发器COIN_CURRENCY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.COIN_CURRENCY # 值
function GameAPI.get_trigger_actor_variable_coin_currency(actor, key) end

--获取全局触发器COIN_CURRENCY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@return py.COIN_CURRENCY # 值
function GameAPI.get_trigger_list_variable_coin_currency(key, index) end

--获取触发器COIN_CURRENCY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@return py.COIN_CURRENCY # 值
function GameAPI.get_trigger_list_actor_variable_coin_currency(actor, key, index) end

--获取全局触发器COIN_CURRENCY数组变量
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_variable_all_coin_currency(key) end

--获取触发器COIN_CURRENCY 组变量数组
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@return py.List # 数组型变量值
function GameAPI.get_trigger_list_actor_variable_all_coin_currency(actor, key) end

--设置全局触发器UI_CHAT_SEND_CHANNEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_chat_send_channel(key, index, value) end

--设置全局触发器UI_CHAT_SEND_CHANNEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_chat_send_channel(actor, key, index, value) end

--设置全局触发器UI_CHAT_SEND_CHANNEL非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_chat_send_channel(key, value) end

--设置全局触发器UI_CHAT_SEND_CHANNEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_chat_send_channel(actor, key, value) end

--设置全局触发器UI_CHAT_RECV_CHANNEL数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_variable_ui_chat_recv_channel(key, index, value) end

--设置全局触发器UI_CHAT_RECV_CHANNEL数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? integer # 值
function GameAPI.set_trigger_list_actor_variable_ui_chat_recv_channel(actor, key, index, value) end

--设置全局触发器UI_CHAT_RECV_CHANNEL非数组变量
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_variable_ui_chat_recv_channel(key, value) end

--设置全局触发器UI_CHAT_RECV_CHANNEL非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? integer # 值
function GameAPI.set_trigger_actor_variable_ui_chat_recv_channel(actor, key, value) end

--设置全局触发器GOODS_KEY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.GoodsKey # 值
function GameAPI.set_trigger_list_variable_goods_key(key, index, value) end

--设置全局触发器GOODS_KEY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.GoodsKey # 值
function GameAPI.set_trigger_list_actor_variable_goods_key(actor, key, index, value) end

--设置全局触发器GOODS_KEY非数组变量
---@param key string # 变量名称
---@param value? py.GoodsKey # 值
function GameAPI.set_trigger_variable_goods_key(key, value) end

--设置全局触发器GOODS_KEY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.GoodsKey # 值
function GameAPI.set_trigger_actor_variable_goods_key(actor, key, value) end

--设置全局触发器SITE_STATE数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SITE_STATE # 值
function GameAPI.set_trigger_list_variable_site_state(key, index, value) end

--设置全局触发器SITE_STATE数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.SITE_STATE # 值
function GameAPI.set_trigger_list_actor_variable_site_state(actor, key, index, value) end

--设置全局触发器SITE_STATE非数组变量
---@param key string # 变量名称
---@param value? py.SITE_STATE # 值
function GameAPI.set_trigger_variable_site_state(key, value) end

--设置全局触发器SITE_STATE非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.SITE_STATE # 值
function GameAPI.set_trigger_actor_variable_site_state(actor, key, value) end

--设置全局触发器COIN_CURRENCY数组变量子项
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.COIN_CURRENCY # 值
function GameAPI.set_trigger_list_variable_coin_currency(key, index, value) end

--设置全局触发器COIN_CURRENCY数组 组变量子项
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param index integer # 下标
---@param value? py.COIN_CURRENCY # 值
function GameAPI.set_trigger_list_actor_variable_coin_currency(actor, key, index, value) end

--设置全局触发器COIN_CURRENCY非数组变量
---@param key string # 变量名称
---@param value? py.COIN_CURRENCY # 值
function GameAPI.set_trigger_variable_coin_currency(key, value) end

--设置全局触发器COIN_CURRENCY非数组 组变量
---@param actor py.Actor # 单位实体
---@param key string # 变量名称
---@param value? py.COIN_CURRENCY # 值
function GameAPI.set_trigger_actor_variable_coin_currency(actor, key, value) end

--获取SITE_STATE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.SITE_STATE # 值
function GameAPI.get_site_state_list_value(l, i) end

--设置SITE_STATE数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.SITE_STATE # 值
function GameAPI.set_site_state_list_value(l, i, v) end

--生成n个值为v的SITE_STATE数组
---@param n integer # 长度
---@param v? py.SITE_STATE # 值
---@return py.List # 列表
function GameAPI.get_site_state_n_list(n, v) end

--获取COIN_CURRENCY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.COIN_CURRENCY # 值
function GameAPI.get_coin_currency_list_value(l, i) end

--设置COIN_CURRENCY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.COIN_CURRENCY # 值
function GameAPI.set_coin_currency_list_value(l, i, v) end

--生成n个值为v的COIN_CURRENCY数组
---@param n integer # 长度
---@param v? py.COIN_CURRENCY # 值
---@return py.List # 列表
function GameAPI.get_coin_currency_n_list(n, v) end

--获取GOODS_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return py.GoodsKey # 值
function GameAPI.get_goods_key_list_value(l, i) end

--设置GOODS_KEY数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v py.GoodsKey # 值
function GameAPI.set_goods_key_list_value(l, i, v) end

--生成n个值为v的GOODS_KEY数组
---@param n integer # 长度
---@param v? py.GoodsKey # 值
---@return py.List # 列表
function GameAPI.get_goods_key_n_list(n, v) end

--获取UI_CHAT_SEND_CHANNEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_chat_send_channel_list_value(l, i) end

--设置UI_CHAT_SEND_CHANNEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_chat_send_channel_list_value(l, i, v) end

--生成n个值为v的UI_CHAT_SEND_CHANNEL数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_chat_send_channel_n_list(n, v) end

--获取UI_CHAT_RECV_CHANNEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@return integer # 值
function GameAPI.get_ui_chat_recv_channel_list_value(l, i) end

--设置UI_CHAT_RECV_CHANNEL数组中某项
---@param l py.List # 列表
---@param i integer # 下标
---@param v integer # 值
function GameAPI.set_ui_chat_recv_channel_list_value(l, i, v) end

--生成n个值为v的UI_CHAT_RECV_CHANNEL数组
---@param n integer # 长度
---@param v? integer # 值
---@return py.List # 列表
function GameAPI.get_ui_chat_recv_channel_n_list(n, v) end

--预设库 添加UI_CHAT_SEND_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_chat_send_channel_kv(item_key, key, value) end

--预设库 添加UI_CHAT_RECV_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_ui_chat_recv_channel_kv(item_key, key, value) end

--预设库 添加GOODS_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_goods_key_kv(item_key, key, value) end

--预设库 添加SITE_STATE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_site_state_kv(item_key, key, value) end

--预设库 添加COIN_CURRENCY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_unit_key_coin_currency_kv(item_key, key, value) end

--预设库 添加UI_CHAT_SEND_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_chat_send_channel_kv(item_key, key, value) end

--预设库 添加UI_CHAT_RECV_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_ui_chat_recv_channel_kv(item_key, key, value) end

--预设库 添加GOODS_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_goods_key_kv(item_key, key, value) end

--预设库 添加SITE_STATE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_site_state_kv(item_key, key, value) end

--预设库 添加COIN_CURRENCY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_item_key_coin_currency_kv(item_key, key, value) end

--预设库 添加UI_CHAT_SEND_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_chat_send_channel_kv(item_key, key, value) end

--预设库 添加UI_CHAT_RECV_CHANNEL键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_ui_chat_recv_channel_kv(item_key, key, value) end

--预设库 添加GOODS_KEY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_goods_key_kv(item_key, key, value) end

--预设库 添加SITE_STATE键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_site_state_kv(item_key, key, value) end

--预设库 添加COIN_CURRENCY键值对
---@param item_key integer # prefab库ID
---@param key integer # 编号
---@param value string # 键值名称
function GameAPI.set_ability_key_coin_currency_kv(item_key, key, value) end

--获取物品组的数量
---@param item_group py.ItemGroup # 物品组
---@return integer # 物品组数量
function GameAPI.api_get_item_group_length(item_group) end

--设置游戏内物品名称是否常驻显示
---@param permanent_show boolean # 是否常驻显示
function GameAPI.set_item_name_permanent_show_config(permanent_show) end

--在Lua中调用截图功能
---@param path string # LocalData下的相对路径
---@param file_name string # 文件名
---@param width? integer # 图片宽
---@param height? integer # 图片高
function GameAPI.screenshot_func_for_lua(path, file_name, width, height) end

--重设圆形区域中心点和半径
---@param area py.CirArea # 圆形区域
---@param center_point py.Point # 中心点
---@param radius py.Fixed # 半径
function GameAPI.api_reset_cir_area(area, center_point, radius) end

--重设矩形区域起点和终点
---@param area py.RecArea # 矩形区域
---@param point_begin py.Point # 起始点
---@param point_end py.Point # 终点
function GameAPI.api_reset_rect_two_point(area, point_begin, point_end) end

--设置ui组件图片(图片类型)
---@param role py.Role # 玩家
---@param comp_name string # 控件名
---@param image_id py.Texture # 图片
function GameAPI.set_ui_comp_image_with_icon_steam(role, comp_name, image_id) end

--获取玩家steam国区
---@return py.COIN_CURRENCY # steam币种
function GameAPI.get_steam_player_currency() end

--获取玩家商品对应国区价格
---@param goods_id string # 商品ID
---@return number # 价格
function GameAPI.get_steam_goods_price(goods_id) end

--请求服务器购买商品
---@param role py.Role # 玩家
---@param count integer # 商品数量
---@param no string # 商品ID
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_mall_purchase_goods(role, count, no, lua_func, context) end

--steam创建房间
---@param room_name string # 房间名称
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
---@param mode_id? integer # 游戏模式
---@param password? string # 房间密码
function GameAPI.lua_request_server_create_room(room_name, lua_func, context, mode_id, password) end

--steam请求房间列表
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
---@param page_index string # 房间页数
function GameAPI.lua_request_server_room_list_info(lua_func, context, page_index) end

--steam请求加入房间
---@param room_id integer # 房间id
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
---@param password string # 房间密码
function GameAPI.lua_request_server_join_room(room_id, lua_func, context, password) end

--steam请求房间信息
---@param aid integer # 玩家id
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_room_info(aid, lua_func, context) end

--steam请求房间开始游戏
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_room_strat_game(lua_func, context) end

--steam邀请玩家加入房间
---@param aid integer # 玩家id
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_invite_player_join_room(aid, lua_func, context) end

--steam接受房间邀请
---@param aid integer # 玩家id
---@param room_id integer # 房间id
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_reply_room_invite(aid, room_id, lua_func, context) end

--steam交换房间槽位
---@param slot_index integer # 槽位
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_change_room_slot(slot_index, lua_func, context) end

--steam交换房主
---@param aid integer # 玩家id
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_change_owner(aid, lua_func, context) end

--steam退出房间
---@param aid integer # 玩家id
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_exit_room(aid, lua_func, context) end

--steam踢出房间
---@param aid integer # 玩家id
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_kick_from_room(aid, lua_func, context) end

--steam改变位置状态
---@param slot_index integer # 槽位
---@param state integer # 槽位
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_set_site_state(slot_index, state, lua_func, context) end

--steam更改房间密码
---@param pass_word string # 密码
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_change_room_password(pass_word, lua_func, context) end

--steam更改房间密码
---@param level_min string # 最小等级
---@param level_max string # 最大等级
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_server_change_room_level_limit(level_min, level_max, lua_func, context) end

--视频控件开始播放视频
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param url string # url
---@param ease_in_time? number # 淡入时长
---@param ease_out_time? number # 淡出时长
---@param ease_type? integer # 曲线类型
---@param is_loop? boolean # 循环播放
function GameAPI.play_ui_video_comp(role, comp_uid, url, ease_in_time, ease_out_time, ease_type, is_loop) end

--设置小地图头像的旋转
---@param role py.Role # 玩家
---@param comp_name py.Unit # 单位
---@param rotation py.Fixed # Rotation
function GameAPI.set_mini_map_icon_rotation(role, comp_name, rotation) end

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

--设置不同状态下的按钮九宫值
---@param role py.Role # 玩家
---@param comp_name string # 控件uid
---@param btn_status integer # 按钮状态
---@param x_left integer # x
---@param x_right integer # y
---@param y_top integer # width
---@param y_bottom integer # height
function GameAPI.set_ui_btn_status_cap_insets(role, comp_name, btn_status, x_left, x_right, y_top, y_bottom) end

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

--[性能]设置索敌时是否忽略威胁优先级。默认关闭，开启后索敌时的目标优先级排序将仅考虑距离，不再考虑目标的威胁程度。开启后对于警戒范围内有大量潜在目标时的索敌性能会有极大性能提升，如果地图玩法对于威胁优先级没有严格需求则建议开启
---@param enable boolean # 是否开启
function GameAPI.set_ai_ignore_threat_priority(enable) end

--获取存档剩余次数
---@param role py.Role # 玩家
---@param archive_key integer # 整数存档
---@return integer # 存档剩余值
function GameAPI.get_role_map_archive_limit(role, archive_key) end

--创建角色顶光到单位挂接点
---@param unit py.Unit # 单位
---@param socket_name string # 挂节点
---@param pos_offset_y? py.Fixed # 起点偏移高度
---@param target? py.Actor # 朝向目标
---@param target_offset_y? py.Fixed # 朝向目标偏移高度
---@param need_shadow? boolean # 是否产生阴影
---@return py.SpotLight # 方向光源
function GameAPI.create_character_top_light_to_unit_socket(unit, socket_name, pos_offset_y, target, target_offset_y, need_shadow) end

--禁用所有的ECA全局触发器
function GameAPI.disable_all_eca_triggers() end

--创建特效到魔法效果挂接模型（跟随旋转使用枚举）
---@param sfx_id py.SfxKey # 特效编号
---@param unit py.ModifierEntity # 魔法效果
---@param editor_model_id py.ModelKey # 挂接模型id
---@param socket string # 单位挂接点
---@param rotate_type integer # 跟随旋转方式
---@param b_follow_scale boolean # 是否跟随单位缩放
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
---@return py.Sfx # 特效
function GameAPI.create_sfx_on_modifier_attach_model(sfx_id, unit, editor_model_id, socket, rotate_type, b_follow_scale, speed, duration, angle, immediately, use_sys_d_destroy_way, detach, show_in_fog, blend_with_fog, scale_x, scale_y, scale_z) end

--整数转单位类型
---@param int_num integer # 整数
---@return py.UnitType # 单位类型
function GameAPI.int_transform_unit_type(int_num) end

--整数转投射物类型
---@param int_num integer # 整数
---@return py.ProjectileKey # 投射物类型
function GameAPI.int_transform_projectile_type(int_num) end

--整数转物品类型
---@param int_num integer # 整数
---@return py.ItemKey # 物品类型
function GameAPI.int_transform_item_type(int_num) end

--整数转魔法效果类型
---@param int_num integer # 整数
---@return py.ModifierType # 魔法效果类型
function GameAPI.int_transform_modifier_type(int_num) end

--整数转技能类型
---@param int_num integer # 整数
---@return py.AbilityKey # 技能类型
function GameAPI.int_transform_ability_type(int_num) end

--整数转科技类型
---@param int_num integer # 整数
---@return py.TechKey # 科技类型
function GameAPI.int_transform_tech_type(int_num) end

--整数转可破坏物类型
---@param int_num integer # 整数
---@return py.DestructibleKey # 可破坏物类型
function GameAPI.int_transform_destruct_type(int_num) end

--整数转声音类型
---@param int_num integer # 整数
---@return py.AudioKey # 声音类型
function GameAPI.int_transform_sound_type(int_num) end

--请求更改房间名称
---@param room_name string # 房间名称
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_change_room_name(room_name, lua_func, context) end

--steam查询自己的队伍信息
---@param lua_func function # 回调函数
---@param context py.Dict # 回调传参
function GameAPI.lua_request_my_team_info(lua_func, context) end

--创建牵引力方向
---@param target_unit py.Unit # 目标单位
---@param force_angle py.Fixed # 方向角度
---@param speed py.Fixed # 速度
---@param max_speed py.Fixed # 最大速度
---@param min_speed py.Fixed # 最小速度
---@param acc py.Fixed # 加速度
---@return integer # 牵引力对象
function GameAPI.create_force_direction(target_unit, force_angle, speed, max_speed, min_speed, acc) end

--创建牵引力点
---@param target_unit py.Unit # 目标单位
---@param force_point py.Point # 中心点
---@param speed py.Fixed # 速度
---@param max_speed py.Fixed # 最大速度
---@param min_speed py.Fixed # 最小速度
---@param acc py.Fixed # 加速度
---@return integer # 牵引力对象
function GameAPI.create_force_point(target_unit, force_point, speed, max_speed, min_speed, acc) end

--创建牵引力目标
---@param target_unit py.Unit # 目标单位
---@param force_unit py.Unit # 牵引力单位
---@param speed py.Fixed # 速度
---@param max_speed py.Fixed # 最大速度
---@param min_speed py.Fixed # 最小速度
---@param acc py.Fixed # 加速度
---@return integer # 牵引力对象
function GameAPI.create_force_target(target_unit, force_unit, speed, max_speed, min_speed, acc) end

--复制控件文本到剪贴板
---@param role py.Role # 玩家
---@param comp_uid string # 控件uid
---@param index1? integer # 起始索引
---@param index2? integer # 结束索引
function GameAPI.copy_ui_text_to_clipboard(role, comp_uid, index1, index2) end

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

--获取UI横向分辨率
---@return integer # 分辨率
function GameAPI.get_ui_resolution_x() end

--获取UI纵向分辨率
---@return integer # 分辨率
function GameAPI.get_ui_resolution_y() end

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

--根据技能唯一ID获取技能实例
---@param ability_global_id integer # ID
---@return py.Ability # 技能
function GameAPI.get_ability_by_ability_global_id(ability_global_id) end

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

--重置血条的整体可见性
---@param unit py.Unit # 单位
---@param role? py.Role # 玩家
function GameAPI.reset_billboard_overall_visibility(unit, role) end

--请求获取最新排行榜的值
---@param archive_key integer # 玩家存档栏位
---@param lua_func function # 回调函数
function GameAPI.lua_request_get_map_rank(archive_key, lua_func) end

--绑定魔法效果剩余循环周期到玩家界面控件的属性
---@param role py.Role # 玩家
---@param ui_comp string # 控件uid
---@param ui_comp_attr string # 控件属性字段
---@param modifier py.ModifierEntity # 技能实体对象
function GameAPI.set_ui_comp_bind_modifier_cycle(role, ui_comp, ui_comp_attr, modifier) end

--序列化KV
---@param kvbase py.Actor # Actor
---@return string # 序列化结果
function GameAPI.api_serialize_kv(kvbase) end

--反序列化KV
---@param kvbase py.Actor # Actor
---@param json_str string # kv
function GameAPI.api_deserialize_kv(kvbase, json_str) end

--设置玩家点选单位优先级
---@param role py.Role # 玩家
---@param unit_type integer # 单位类型
---@param priority integer # 优先级
function GameAPI.api_set_player_select_unit_priority(role, unit_type, priority) end

--修改对象材质
---@param obj py.Actor # 对象
---@param material_id integer # 材质id
function GameAPI.set_obj_material_param(obj, material_id) end

--小地图 - 设置英雄小地图头像底框
---@param role py.Role # 玩家
---@param unit py.Unit # 单位
---@param image_id py.Texture # 图片id
function GameAPI.api_set_hero_mini_map_frame(role, unit, image_id) end

--【异步】获取本地玩家网格列表当前百分比位置
---@param comp_name string # 控件uid
---@param direction integer # 横向/纵向
---@return number # 百分比
function GameAPI.get_grid_view_percent(comp_name, direction) end

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
