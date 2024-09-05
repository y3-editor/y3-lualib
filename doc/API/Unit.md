# Unit

单位

## add_ability

```lua
(method) Unit:add_ability(type: y3.Const.AbilityType|y3.Const.AbilityTypeAlias, id: py.AbilityKey, slot?: y3.Const.AbilityIndex, level?: integer)
  -> Ability?
```

添加技能

@*param* `type` — 技能类型

@*param* `id` — 物编id

@*param* `slot` — 技能位

@*param* `level` — 等级

```lua
type:
    | '隐藏'
    | '普通'
    | '命令'
    | '英雄'
```
## add_ability_point

```lua
(method) Unit:add_ability_point(skill_point: integer)
```

增加技能点

@*param* `skill_point` — 技能点
## add_attr

```lua
(method) Unit:add_attr(attr_name: string|y3.Const.UnitAttr, value: number, attr_type?: string|y3.Const.UnitAttrType)
```

增加属性

@*param* `attr_name` — 属性名

@*param* `value` — 属性值

@*param* `attr_type` — 属性类型，默认为“增益”
## add_attr_gc

```lua
(method) Unit:add_attr_gc(attr_name: string|y3.Const.UnitAttr, value: number, attr_type: string|y3.Const.UnitAttrType)
  -> GCNode
```

增加属性

@*param* `attr_name` — 属性名

@*param* `value` — 属性值

@*param* `attr_type` — 属性类型
## add_buff

```lua
(method) Unit:add_buff(data: Buff.AddData)
  -> Buff?
```

给单位添加魔法效果
## add_exp

```lua
(method) Unit:add_exp(exp: number)
```

增加经验值

@*param* `exp` — 经验
## add_goods

```lua
(method) Unit:add_goods(tag_name: py.TabName, item_key: py.ItemKey)
```

添加可贩卖的商品

@*param* `tag_name` — 标签名

@*param* `item_key` — 物品id
## add_hp

```lua
(method) Unit:add_hp(hp: number)
```

增加当前生命值

@*param* `hp` — 当前生命值
## add_item

```lua
(method) Unit:add_item(item_id: py.ItemKey, slot_type?: y3.Const.ShiftSlotTypeAlias)
  -> Item?
```

单位添加物品

@*param* `item_id` — 物品id

@*param* `slot_type` — 槽位类型

```lua
slot_type:
    | '物品栏'
    | '背包栏'
```
## add_level

```lua
(method) Unit:add_level(level: integer)
```

增加等级

@*param* `level` — 等级
## add_mp

```lua
(method) Unit:add_mp(mp: number)
```

增加当前魔法值

@*param* `mp` — 当前魔法值
## add_multi_state

```lua
(method) Unit:add_multi_state(state_enum: integer)
```

添加多个状态
使用 `y3.const.UnitEnumState` 中的枚举值

@*param* `state_enum` — 状态
## add_state

```lua
(method) Unit:add_state(state_enum: integer|y3.Const.UnitEnumState)
```

添加状态

@*param* `state_enum` — 状态名
## add_state_gc

```lua
(method) Unit:add_state_gc(state_enum: integer|y3.Const.UnitEnumState)
  -> GCNode
```

添加状态

@*param* `state_enum` — 状态名
## add_tag

```lua
(method) Unit:add_tag(tag: string)
```

添加标签

@*param* `tag` — 标签
## add_tech

```lua
(method) Unit:add_tech(tech_id: py.TechKey)
```

单位添加科技

@*param* `tech_id` — 科技id
## attack_move

```lua
(method) Unit:attack_move(point: Point, range?: number)
  -> py.UnitCommand
```

 命令攻击移动

@*param* `point` — 点

@*param* `range` — 范围

@*return* — 命令
## attack_target

```lua
(method) Unit:attack_target(target: Unit, range: number)
  -> py.UnitCommand
```

 命令攻击目标

@*param* `target` — 目标

@*param* `range` — 范围

@*return* — 命令
## attr_to_name

```lua
function Unit.attr_to_name(key: string)
  -> 属性名字: string
```

单位属性转单位属性名字

@*param* `key` — 属性key
## blink

```lua
(method) Unit:blink(point: Point)
```

传送到点

@*param* `point` — 点
## break_mover

```lua
(method) Unit:break_mover()
```

打断运动器
## buy

```lua
(method) Unit:buy(unit: Unit, tag_num: py.TabIdx, item_key: py.ItemKey)
```

从商店购买商品

@*param* `unit` — 单位

@*param* `tag_num` — 页签id

@*param* `item_key` — 物品id
## can_blink_to

```lua
(method) Unit:can_blink_to(point: Point)
  -> can_teleport: boolean
```

能否传送到点

@*param* `point` — 点

@*return* `can_teleport` — 能否传送到点
## can_visible

```lua
(method) Unit:can_visible(target_unit: Unit)
  -> visibility: boolean
```

是否可见

@*param* `target_unit` — 目标单位

@*return* `visibility` — 目标是否可见
## can_walk_to

```lua
(method) Unit:can_walk_to(start_point: Point, end_point: Point)
  -> is_reach: boolean
```

是否寻路可达

@*param* `start_point` — 起始点

@*param* `end_point` — 终点

@*return* `is_reach` — 是否寻路可达
## cancel_change_animation

```lua
(method) Unit:cancel_change_animation(replace_anim_name: string, bereplace_anim_name: string)
```

取消动画替换

@*param* `replace_anim_name` — 动画名

@*param* `bereplace_anim_name` — 动画名
## cancel_replace_model

```lua
(method) Unit:cancel_replace_model(model_id: py.ModelKey)
```

取消模型替换

@*param* `model_id` — 模型id
## cast

```lua
(method) Unit:cast(ability: Ability, target?: Destructible|Item|Point|Unit, extra_target?: Point)
  -> py.UnitCommand
```

 命令发动技能

@*param* `ability` — 技能

@*param* `target` — 目标

@*param* `extra_target` — 额外目标
## change_animation

```lua
(method) Unit:change_animation(replace_anim_name: string, bereplace_anim_name: string)
```

替换动画

@*param* `replace_anim_name` — 动画名

@*param* `bereplace_anim_name` — 动画名
## change_owner

```lua
(method) Unit:change_owner(player: Player)
```

改变所属玩家

@*param* `player` — 所属玩家
## check_precondition_by_key

```lua
function Unit.check_precondition_by_key(player: Player, unit_key: py.UnitKey)
  -> unit_precondition: boolean
```

单位类型前置条件是否通过

@*param* `player` — 玩家

@*param* `unit_key` — 单位类型

@*return* `unit_precondition` — 单位类型前置条件是否通过
## clear_change_animation

```lua
(method) Unit:clear_change_animation(anim_name: string)
```

重置动画替换

@*param* `anim_name` — 动画名
## command

```lua
(method) Unit:command(command: py.UnitCommand)
```

发布命令

@*param* `command` — 命令
## create_illusion

```lua
function Unit.create_illusion(illusion_unit: Unit, call_unit: Unit, player: Player, point: Point, direction: number, clone_hp_mp: boolean)
  -> Unit?
```

创建幻象

@*param* `illusion_unit` — 幻象复制的单位

@*param* `call_unit` — 召唤单位

@*param* `player` — 玩家

@*param* `point` — 点

@*param* `direction` — 方向

@*param* `clone_hp_mp` — 复制当前的生命值和魔法值
## create_unit

```lua
function Unit.create_unit(owner: Player|Unit, unit_id: py.UnitKey, point: Point, direction: number)
  -> Unit
```

创建单位

@*param* `unit_id` — 单位类型

@*param* `point` — 点

@*param* `direction` — 方向
## custom_event_manager

```lua
EventManager?
```

## damage

```lua
(method) Unit:damage(data: Unit.DamageData)
```

## drop_item

```lua
(method) Unit:drop_item(item: Item, point: Point)
  -> py.UnitCommand
```

 命令丢弃物品
## event

```lua
fun(self: Unit, event: "单位-研发科技", callback: fun(trg: Trigger, data: EventParam.单位-研发科技)):Trigger
```

## event_dispatch

```lua
(method) CustomEvent:event_dispatch(event_name: string, ...any)
  -> any
  2. any
  3. any
  4. any
```

发起自定义事件（回执模式），与通知模式不同，允许插入结算。
可以接受到事件的返回值，有多处注册事件时会按照注册顺序调用，
当任何事件回调返回了非 `nil` 的值后，后续触发器将不再调用。

```lua
Obj:event_on('获取', function (trigger,...)
    print('获取1')
    return 1
end)
Obj:event_on('获取', function (trigger,...)
    print('获取2')
    return 2
end)

local result = Obj:event_dispatch('获取')

print('结果为：', result)
```

以上代码会打印：

```
获取1
结果为：    1
```

## event_dispatch_with_args

```lua
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any, ...any)
  -> any
  2. any
  3. any
  4. any
```

 发起带事件参数的自定义事件（回执模式）
## event_notify

```lua
(method) CustomEvent:event_notify(event_name: string, ...any)
```

发起自定义事件（通知模式），同一个对象身上只会有一个正在执行的事件，
当发生插入结算时，后面的事件会进入队列

```lua
Obj:event_on('获得', function ()
    print('触发获得')
    print('发起移除前')
    Obj:event_notify('移除') -- 实际业务中，可能你获得的buff把你自己杀死了，而死亡会清除buff
    print('发起移除后')
end)

Obj:event_on('移除', function ()
    print('触发移除')
end)

Obj:event_notify('获得')
```

这段代码会打印：

```
触发获得
发起移除前
发起移除后
触发移除
```

## event_notify_with_args

```lua
(method) CustomEvent:event_notify_with_args(event_name: string, args: any[], ...any)
```

 发起带事件参数的自定义事件（通知模式）
## event_on

```lua
(method) CustomEvent:event_on(...any)
  -> Trigger
```

注册自定义事件，当触发时，会执行回调函数。

```lua
Obj:event_on('输入', function (trigger, ...)
    print('触发了输入事件', ...)
end)

Obj:event_notify('输入', '123', '456')
```

以上会打印：

```
触发了输入事件 123 456
```

---

注册时可以指定事件的参数：

```lua
Obj:event_on('输入', {'123'}, function (trigger, ...)
    print('触发了输入事件', ...)
end)

Obj:event_notify('输入', 1) -- 不能触发事件
Obj:event_notify_with_args('输入', {'123'}, 2) -- 可以触发事件
Obj:event_notify_with_args('输入', {'456'}, 3) -- 不能触发事件
Obj:event_notify_with_args('输入', {'123', '666'}, 4) -- 可以触发事件
```

## exchange_item

```lua
(method) Unit:exchange_item(item: Item, type: y3.Const.ShiftSlotTypeAlias, index: integer)
```

 交换物品
 如果目标位置是空的，则相当于把物品移动了过去

@*param* `item` — 物品

@*param* `index` — 槽位

```lua
type:
    | '物品栏'
    | '背包栏'
```
## find_ability

```lua
(method) Unit:find_ability(type: y3.Const.AbilityType|y3.Const.AbilityTypeAlias, id: py.AbilityKey)
  -> ability: Ability?
```

通过技能名寻找技能

@*param* `type` — 技能类型

@*param* `id` — 物编id

@*return* `ability` — 技能

```lua
type:
    | '隐藏'
    | '普通'
    | '命令'
    | '英雄'
```
## find_buff

```lua
(method) Unit:find_buff(buff_key: py.ModifierKey, index?: integer)
  -> Buff?
```

获取单位指定id的魔法效果

@*param* `buff_key` — 魔法效果id

@*param* `index` — 第几个

@*return* — 单位指定类型的魔法效果
## follow

```lua
(method) Unit:follow(target: Unit, refresh_interval?: number, near_offset?: number, far_offset?: number, follow_angle?: number, follow_dead_target?: boolean)
  -> py.UnitCommand
```

 命令跟随单位

@*param* `refresh_interval` — 刷新间隔

@*param* `near_offset` — 跟随距离

@*param* `far_offset` — 重新跟随距离

@*param* `follow_angle` — 跟随角度

@*param* `follow_dead_target` — 是否跟随死亡单位
## get_abilities_by_type

```lua
(method) Unit:get_abilities_by_type(type: y3.Const.AbilityType)
  -> Ability[]
```

获取指定类型的所有技能
## get_ability_by_seq

```lua
(method) Unit:get_ability_by_seq(seq: py.AbilitySeq)
  -> Ability?
```

根据技能序号获取技能
## get_ability_by_slot

```lua
(method) Unit:get_ability_by_slot(type: y3.Const.AbilityType|y3.Const.AbilityTypeAlias, slot: integer)
  -> ability: Ability?
```

获得某个技能位的的技能

@*param* `type` — 技能类型

@*param* `slot` — 技能位

@*return* `ability` — 技能

```lua
type:
    | '隐藏'
    | '普通'
    | '命令'
    | '英雄'
```
## get_ability_point

```lua
(method) Unit:get_ability_point()
  -> hero_ability_point_number: integer
```

获取英雄的技能点数量

@*return* `hero_ability_point_number` — 英雄的技能点数量
## get_affect_techs

```lua
(method) Unit:get_affect_techs()
  -> py.TechKey[]
```

获取单位受到影响的所有科技
## get_alert_range

```lua
(method) Unit:get_alert_range()
  -> alert_range: number
```

获取单位警戒范围

@*return* `alert_range` — 单位警戒范围
## get_all_items

```lua
(method) Unit:get_all_items()
  -> item_group: ItemGroup
```

单位的所有物品

@*return* `item_group` — 所有物品
## get_armor_type

```lua
(method) Unit:get_armor_type()
  -> DAMAGE_ARMOR_TYPE: integer
```

获得护甲类型

@*return* `DAMAGE_ARMOR_TYPE` — 护甲类型
## get_attack_type

```lua
(method) Unit:get_attack_type()
  -> DAMAGE_ATTACK_TYPE: integer
```

获得攻击类型

@*return* `DAMAGE_ATTACK_TYPE` — 攻击类型
## get_attr

```lua
(method) Unit:get_attr(attr_name: y3.Const.UnitAttr, attr_type?: '实际'|'额外'|y3.Const.UnitAttrType)
  -> number
```

获取属性（默认为实际属性）

```lua
attr_type:
    | '实际'
    | '额外'
```
## get_attr_all_ratio

```lua
(method) Unit:get_attr_all_ratio(attr_name: string|y3.Const.UnitAttr)
  -> number
```

获取属性（最终加成）
## get_attr_base

```lua
(method) Unit:get_attr_base(attr_name: string|y3.Const.UnitAttr)
  -> attr_base: number
```

获取单属性（基础）

@*return* `attr_base` — 单位基础属性类型的属性
## get_attr_base_ratio

```lua
(method) Unit:get_attr_base_ratio(attr_name: string|y3.Const.UnitAttr)
  -> number
```

获取属性（基础加成）
## get_attr_bonus

```lua
(method) Unit:get_attr_bonus(attr_name: string|y3.Const.UnitAttr)
  -> number
```

获取属性（增益）
## get_attr_bonus_ratio

```lua
(method) Unit:get_attr_bonus_ratio(attr_name: string|y3.Const.UnitAttr)
  -> number
```

获取属性（增益加成）
## get_attr_growth_by_key

```lua
function Unit.get_attr_growth_by_key(unit_key: py.UnitKey, attr_name: string|y3.Const.UnitAttr)
  -> unit_attribute_growth: number
```

获取单位属性成长

@*return* `unit_attribute_growth` — 单位属性成长
## get_attr_other

```lua
(method) Unit:get_attr_other(attr_name: string|y3.Const.UnitAttr)
  -> number
```

获取属性（额外）

@*param* `attr_name` — 属性名
## get_bar_cnt

```lua
(method) Unit:get_bar_cnt()
  -> slot_number: integer
```

获取单位物品栏的槽位数

@*return* `slot_number` — 单位物品栏的槽位数
## get_buffs

```lua
(method) Unit:get_buffs()
  -> Buff[]
```

获取单位身上的魔法效果

@*return* — 魔法效果表
## get_by_handle

```lua
function Unit.get_by_handle(py_unit: py.Unit)
  -> Unit?
```

通过py层的单位实例获取lua层的单位实例
## get_by_id

```lua
function Unit.get_by_id(id: py.UnitID)
  -> Unit?
```

 根据唯一ID获取单位。
## get_by_res_id

```lua
function Unit.get_by_res_id(res_id: integer)
  -> Unit
```

 获取摆放在场景上的单位
## get_by_string

```lua
function Unit.get_by_string(str: string)
  -> Unit?
```

根据字符串获取单位，字符串是通过 `tostring(Unit)`
或是使用ECA中的“任意变量转化为字符串”获得的。
## get_camp_id

```lua
(method) Unit:get_camp_id()
  -> py.CampID
```

获取单位阵营ID
## get_cancel_alert_range

```lua
(method) Unit:get_cancel_alert_range()
  -> cancel_alert_range: number
```

获取单位取消警戒的范围

@*return* `cancel_alert_range` — 单位取消警戒的范围
## get_collision_radius

```lua
(method) Unit:get_collision_radius()
  -> collision_radius: number
```

获取单位碰撞半径

@*return* `collision_radius` — 单位碰撞半径
## get_common_attack

```lua
(method) Unit:get_common_attack()
  -> Ability?
```

comment 获取普攻技能
## get_custom_event_manager

```lua
(method) CustomEvent:get_custom_event_manager()
  -> EventManager?
```

## get_description

```lua
(method) Unit:get_description()
  -> unit_description: string
```

获取单位的描述

@*return* `unit_description` — 单位的描述
## get_description_by_key

```lua
function Unit.get_description_by_key(unit_key: py.UnitKey)
  -> des: string
```

获取单位类型的描述

@*param* `unit_key` — 单位类型

@*return* `des` — 单位类型的描述
## get_exp

```lua
(method) Unit:get_exp()
  -> exp: integer
```

获取单位当前的经验值

@*return* `exp` — 单位当前的经验值
## get_exp_reward

```lua
(method) Unit:get_exp_reward()
  -> exp: integer
```

获取单位被击杀经验

@*return* `exp` — 单位被击杀经验
## get_facing

```lua
(method) Unit:get_facing()
  -> angle: number
```

获取单位的朝向

@*return* `angle` — 单位的朝向
## get_final_attr

```lua
(method) Unit:get_final_attr(attr_name: string|y3.Const.UnitAttr)
  -> number
```

获取最终属性

@*param* `attr_name` — 属性名
## get_goods_cd

```lua
(method) Unit:get_goods_cd(page: py.TabIdx, index: integer)
  -> cd: number
```

获取商店商品的库存间隔

@*param* `page` — 页签id

@*param* `index` — 序号

@*return* `cd` — 默认间隔时间
## get_goods_key

```lua
(method) Unit:get_goods_key(tag_index: py.TabIdx, item_index: integer)
  -> item: py.ItemKey
```

获取商店的物品id

@*param* `tag_index` — 页签

@*param* `item_index` — 序号

@*return* `item` — 物品类型
## get_goods_remaining_cd

```lua
(method) Unit:get_goods_remaining_cd(page: py.TabIdx, index: integer)
  -> recovery_time: number
```

获取商店商品的剩余恢复时间

@*param* `page` — 页签id

@*param* `index` — 序号

@*return* `recovery_time` — 剩余恢复时间
## get_goods_stack

```lua
(method) Unit:get_goods_stack(tag_index: py.TabIdx, item_key: py.ItemKey)
  -> item_stock: integer
```

获取商店的物品商品库存

@*param* `tag_index` — 页签

@*param* `item_key` — 物品类型

@*return* `item_stock` — 商品库存
## get_height

```lua
(method) Unit:get_height()
  -> height: number
```

获取单位飞行高度

@*return* `height` — 单位飞行高度
## get_hp

```lua
(method) Unit:get_hp()
  -> current_unit_hp: number
```

获取当前生命值

@*return* `current_unit_hp` — 当前生命值
## get_icon

```lua
(method) Unit:get_icon()
  -> image: py.Texture
```

获取单位的头像

@*return* `image` — 单位的头像
## get_icon_by_key

```lua
function Unit.get_icon_by_key(unit_key: py.UnitKey)
  -> image: py.Texture
```

获取单位类型的头像

@*param* `unit_key` — 单位类型

@*return* `image` — 单位类型的头像
## get_id

```lua
(method) Unit:get_id()
  -> integer
```

 获取唯一ID
## get_illusion_owner

```lua
(method) Unit:get_illusion_owner()
  -> unit: Unit?
```

获取幻象的召唤者

@*return* `unit` — 幻象的召唤者
## get_item_by_slot

```lua
(method) Unit:get_item_by_slot(type: y3.Const.ShiftSlotTypeAlias|y3.Const.SlotType, slot: integer)
  -> item: Item?
```

获取单位背包槽位上的物品

@*param* `type` — 槽位类型

@*param* `slot` — 位置

@*return* `item` — 物品

```lua
type:
    | '物品栏'
    | '背包栏'
```
## get_item_type_number_of_unit

```lua
(method) Unit:get_item_type_number_of_unit(item_key: py.ItemKey)
  -> item_type_number: integer
```

获取单位拥有的物品类型数量

@*param* `item_key` — 物品类型id

@*return* `item_type_number` — 物品类型数量
## get_key

```lua
(method) Unit:get_key()
  -> type_id: py.UnitKey
```

获取单位类型的ID

@*return* `type_id` — 单位类型的ID
## get_last_created_unit

```lua
function Unit.get_last_created_unit()
  -> unit: Unit?
```

最后创建的单位

@*return* `unit` — 最后创建的单位
## get_level

```lua
(method) Unit:get_level()
  -> unit_level: integer
```

获取单位等级

@*return* `unit_level` — 单位等级
## get_life_cycle

```lua
(method) Unit:get_life_cycle()
  -> number
```

获取单位剩余生命周期
## get_main_attr

```lua
(method) Unit:get_main_attr()
  -> string
```

获取单位主属性(需要开启复合属性)
## get_model

```lua
(method) Unit:get_model()
  -> model: py.ModelKey
```

获取单位的当前模型

@*return* `model` — 当前模型
## get_model_by_key

```lua
function Unit.get_model_by_key(unit_key: py.UnitKey)
  -> model: py.ModelKey
```

获取单位类型的模型

@*param* `unit_key` — 单位id

@*return* `model` — 模型
## get_mp

```lua
(method) Unit:get_mp()
  -> current_mp: number
```

获取当前魔法值

@*return* `current_mp` — 当前魔法值
## get_name

```lua
(method) Unit:get_name()
  -> unit_name: string
```

获取单位名称

@*return* `unit_name` — 单位名称
## get_name_by_key

```lua
function Unit.get_name_by_key(unit_key: py.UnitKey)
  -> type_name: string
```

获取单位类型名称

@*return* `type_name` — 单位类型名称
## get_nearest_valid_point

```lua
(method) Unit:get_nearest_valid_point()
  -> point: Point
```

获取单位最近的可通行点

@*return* `point` — 单位最近的可通行点
## get_owner

```lua
(method) Unit:get_owner()
  -> player: Player
```

获取单位所属玩家

@*return* `player` — 单位所属玩家
## get_owner_player

```lua
(method) Unit:get_owner_player()
  -> Player
```

 获取所属玩家
## get_parent_unit

```lua
(method) Unit:get_parent_unit()
  -> unit: Unit?
```

获取单位的拥有者（单位）

@*return* `unit` — 单位的拥有者
## get_pkg_cnt

```lua
(method) Unit:get_pkg_cnt()
  -> slot_number: integer
```

获取单位背包栏的槽位数

@*return* `slot_number` — 单位背包栏的槽位数
## get_point

```lua
(method) Unit:get_point()
  -> unit_point: Point
```

获取单位所在点

@*return* `unit_point` — 单位所在点
## get_reward_res

```lua
(method) Unit:get_reward_res(player_attr_name: py.RoleResKey)
  -> player_attr: number
```

获取击杀可获得的资源（玩家属性）

@*param* `player_attr_name` — 玩家属性名

@*return* `player_attr` — 单位被击杀玩家属性
## get_scale

```lua
(method) Unit:get_scale()
  -> model_scale: number
```

获取单位缩放

@*return* `model_scale` — 单位缩放
## get_shield

```lua
(method) Unit:get_shield(shield_type: integer)
  -> shield_value: integer
```

获取单位指定护盾类型的护盾值

@*param* `shield_type` — 护盾类型

@*return* `shield_value` — 护盾类型的护盾值
## get_shop_item_list

```lua
(method) Unit:get_shop_item_list(page: py.TabIdx)
  -> py.ItemKey[]
```

获取所有的商店物品

@*param* `page` — 页签
## get_shop_range

```lua
(method) Unit:get_shop_range()
  -> purchase_range: number
```

获取商店的购买范围

@*return* `purchase_range` — 购买范围
## get_shop_tab_name

```lua
(method) Unit:get_shop_tab_name(tag_index: py.TabIdx)
  -> tab_name: string
```

获取商店的页签名

@*param* `tag_index` — 页签

@*return* `tab_name` — 页签名
## get_shop_tab_number

```lua
(method) Unit:get_shop_tab_number()
  -> tab_number: number
```

获取商店页签数量

@*return* `tab_number` — 页签数量
## get_source_model

```lua
(method) Unit:get_source_model()
  -> model: py.ModelKey
```

获取单位的原本模型

@*return* `model` — 原本模型
## get_subtype

```lua
(method) Unit:get_subtype()
  -> unit_subtype: py.UnitType
```

获取单位分类

@*return* `unit_subtype` — 单位分类
## get_team

```lua
(method) Unit:get_team()
  -> team: py.Camp
```

获取单位的队伍

@*return* `team` — 获取单位的队伍
## get_tech_list

```lua
(method) Unit:get_tech_list()
  -> py.TechKey[]
```

获取单位可研究的所有科技
## get_turning_speed

```lua
(method) Unit:get_turning_speed()
  -> turning_speed: number
```

获取单位转身速度

@*return* `turning_speed` — 单位转身速度
## get_type

```lua
(method) Unit:get_type()
  -> unit_type: py.UnitType
```

获取单位的单位类型ID

@*return* `unit_type` — 单位类型ID
## get_type_by_id

```lua
function Unit.get_type_by_id(unit_key: py.UnitKey)
  -> integer
```

获取单位类型的分类

@*param* `unit_key` — 单位id
## get_unit_resource_cost

```lua
(method) Unit:get_unit_resource_cost(unit_id: py.UnitKey, player_attr_name: py.RoleResKey)
  -> player_attr: integer
```

获取建造此单位消耗的资源（玩家属性）

@*param* `unit_id` — 单位类型

@*param* `player_attr_name` — 玩家属性名

@*return* `player_attr` — 单位被击杀玩家属性
## get_unit_selection_range_scale

```lua
(method) Unit:get_unit_selection_range_scale()
  -> range_scale: number
```

获取单位选择圈缩放

@*return* `range_scale` — 选择圈缩放
## get_upgrade_exp

```lua
(method) Unit:get_upgrade_exp()
  -> exp: number
```

获取单位当前升级所需经验

@*return* `exp` — 单位当前升级所需经验
## get_x_scale

```lua
(method) Unit:get_x_scale()
  -> xaxis: number
```

获取单位的X轴缩放

@*return* `xaxis` — X轴缩放
## get_y_scale

```lua
(method) Unit:get_y_scale()
  -> yaxis: number
```

获取单位的Y轴缩放

@*return* `yaxis` — Y轴缩放
## get_z_scale

```lua
(method) Unit:get_z_scale()
  -> zaxis: number
```

获取单位的Z轴缩放

@*return* `zaxis` — Z轴缩放
## give_item

```lua
(method) Unit:give_item(item: Item, target: Unit)
  -> py.UnitCommand
```

 命令给予物品
## handle

```lua
py.Unit
```

py层的单位对象
## has_ability_by_key

```lua
(method) Unit:has_ability_by_key(ability_key: py.AbilityKey)
  -> has_ability_type: boolean
```

是否有指定id的技能

@*param* `ability_key` — 技能类型

@*return* `has_ability_type` — 有指定类型的技能
## has_buff_by_effect_type

```lua
(method) Unit:has_buff_by_effect_type(effect_type: y3.Const.EffectType)
  -> has_modifier_style: boolean
```

是否有指定类型的魔法效果

@*param* `effect_type` — 魔法效果类型

@*return* `has_modifier_style` — 有指定类型的魔法效果
## has_buff_by_key

```lua
(method) Unit:has_buff_by_key(buff_key: py.ModifierKey)
  -> has_modifier: boolean
```

是否有指定id的魔法效果

@*param* `buff_key` — 魔法效果id

@*return* `has_modifier` — 有魔法效果
## has_buff_status

```lua
(method) Unit:has_buff_status(state_name: integer)
  -> has_buff_status: boolean
```

是否有指定状态
> 请改用 `has_state` 方法

@*param* `state_name` — 状态

@*return* `has_buff_status` — 有指定状态
## has_item

```lua
(method) Unit:has_item(item: Item)
  -> has_item: boolean
```

是否有指定物品

@*param* `item` — 物品

@*return* `has_item` — 有物品
## has_item_by_key

```lua
(method) Unit:has_item_by_key(item_key: py.ItemKey)
  -> has_item_name: boolean
```

是否有指定类型的物品

@*param* `item_key` — 物品类型

@*return* `has_item_name` — 有指定类型的物品
## has_move_collision

```lua
(method) Unit:has_move_collision(collision_layer: integer|y3.Const.CollisionLayers)
  -> boolean
```

是否拥有指定碰撞类型

@*param* `collision_layer` — 碰撞类型

@*return* — 是否拥有指定碰撞类型
## has_state

```lua
(method) Unit:has_state(state_enum: integer|y3.Const.UnitEnumState)
  -> boolean?
```

是否有某个状态

@*param* `state_enum` — 状态名
## has_tag

```lua
(method) Unit:has_tag(tag_name: string)
  -> has_tag: boolean
```

是否具有标签

@*param* `tag_name` — 标签

@*return* `has_tag` — 具有标签
## heals

```lua
(method) Unit:heals(value: number, skill?: Ability, source_unit?: Unit, text_type?: string)
```

造成治疗

@*param* `value` — 治疗值

@*param* `skill` — 技能

@*param* `source_unit` — 单位

@*param* `text_type` — 跳字类型
## hold

```lua
(method) Unit:hold(point: Point)
  -> py.UnitCommand
```

 命令驻守

@*param* `point` — 点

@*return* — 命令
## id

```lua
integer
```

## is_alive

```lua
(method) Unit:is_alive()
  -> alive: boolean
```

是否存活

@*return* `alive` — 是否存活
## is_ally

```lua
(method) Unit:is_ally(target_unit: Unit)
  -> is_enemy: boolean
```

是否是友方

@*param* `target_unit` — 目标单位

@*return* `is_enemy` — 是敌对关系
## is_building

```lua
(method) Unit:is_building()
  -> boolean
```

是否是建筑
## is_casting

```lua
(method) Unit:is_casting()
  -> boolean
```

单位是否有正在释放的技能
## is_collided_with_point

```lua
(method) Unit:is_collided_with_point(point: Point, range: number)
  -> can_collide: boolean
```

是否与点碰撞

@*param* `point` — 点

@*param* `range` — 范围

@*return* `can_collide` — 是否与点碰撞
## is_destroyed

```lua
(method) Unit:is_destroyed()
  -> boolean
```

## is_enemy

```lua
(method) Unit:is_enemy(target_unit: Unit)
  -> is_enemy: boolean
```

是否是敌人

@*param* `target_unit` — 目标单位

@*return* `is_enemy` — 是敌对关系
## is_exist

```lua
(method) Unit:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## is_hero

```lua
(method) Unit:is_hero()
  -> boolean
```

是否是英雄
## is_illusion

```lua
(method) Unit:is_illusion()
  -> illusion: boolean
```

是否是幻象单位

@*return* `illusion` — 是幻象单位
## is_in_battle

```lua
(method) Unit:is_in_battle()
  -> in_battle: boolean
```

是否在战斗状态

@*return* `in_battle` — 在战斗状态
## is_in_group

```lua
(method) Unit:is_in_group(group: UnitGroup)
  -> in_group: boolean
```

是否在单位组中

@*param* `group` — 单位组

@*return* `in_group` — 在单位组中
## is_in_radius

```lua
(method) Unit:is_in_radius(other: Point|Unit, range: number)
  -> in_radius: boolean
```

是否在另一个单位或点附近

@*param* `other` — 单位/点

@*param* `range` — 范围

@*return* `in_radius` — 在单位附近
## is_moving

```lua
(method) Unit:is_moving()
  -> is_moving: boolean
```

是否正在移动

@*return* `is_moving` — 正在移动
## is_shop

```lua
(method) Unit:is_shop()
  -> is_shop: boolean
```

是否是商店

@*return* `is_shop` — 是商店
## key

```lua
integer?
```

## kill_by

```lua
(method) Unit:kill_by(killer: Unit)
```

杀死单位

@*param* `killer` — 凶手单位
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_key

```lua
string?
```

## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|'table'...(+1))
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
    | 'table'
```
## kv_remove

```lua
(method) KV:kv_remove(key: any)
```

## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## learn

```lua
(method) Unit:learn(ability_key: py.AbilityKey)
```

学习技能

@*param* `ability_key` — 技能id
## move_along_road

```lua
(method) Unit:move_along_road(road: Road, patrol_mode: integer, can_attack: boolean, start_from_nearest: boolean, back_to_nearest: boolean)
  -> py.UnitCommand
```

 命令沿路径移动

@*param* `road` — 路径

@*param* `patrol_mode` — 移动模式

@*param* `can_attack` — 是否自动攻击

@*param* `start_from_nearest` — 就近选择起始点

@*param* `back_to_nearest` — 偏离后就近返回

@*return* — 命令
## move_to_pos

```lua
(method) Unit:move_to_pos(point: Point, range?: number)
  -> py.UnitCommand
```

 命令移动

@*param* `point` — 点

@*param* `range` — 范围

@*return* — 命令
## mover_curve

```lua
(method) Unit:mover_curve(mover_data: Mover.CreateData.Curve)
  -> Mover
```

创建曲线运动器
## mover_line

```lua
(method) Unit:mover_line(mover_data: Mover.CreateData.Line)
  -> Mover
```

创建直线运动器
## mover_round

```lua
(method) Unit:mover_round(mover_data: Mover.CreateData.Round)
  -> Mover
```

创建环绕运动器
## mover_target

```lua
(method) Unit:mover_target(mover_data: Mover.CreateData.Target)
  -> Mover
```

创建追踪运动器
## object_event_manager

```lua
EventManager?
```

## pause_life_cycle

```lua
(method) Unit:pause_life_cycle(is_stop: boolean)
```

设置生命周期暂停状态

@*param* `is_stop` — 生命周期暂停状态
## phandle

```lua
py.Unit
```

代理的对象，用这个调用引擎的方法会快得多
## pick_item

```lua
(method) Unit:pick_item(item: Item)
  -> py.UnitCommand
```

 命令拾取物品
## play_animation

```lua
(method) Unit:play_animation(anim_name: string, speed?: number, start_time?: number, end_time?: number, is_loop?: boolean, is_back_normal?: boolean)
```

*******************播放动画全局统一
播放动画

@*param* `anim_name` — 动画名

@*param* `speed` — 速度

@*param* `start_time` — 开始时间

@*param* `end_time` — 结束时间(默认-1表示播到最后)

@*param* `is_loop` — 是否循环

@*param* `is_back_normal` — 是否返回默认状态
## player_shop_check

```lua
(method) Unit:player_shop_check(player: Player)
  -> boolean
```

玩家是否可以购买商店的物品
## reborn

```lua
(method) Unit:reborn(point?: Point)
```

复活单位

@*param* `point` — 点
## ref_manager

```lua
unknown
```

## remove

```lua
(method) Unit:remove()
```

删除单位
## remove_abilitiy_by_key

```lua
(method) Unit:remove_abilitiy_by_key(type: y3.Const.AbilityType|y3.Const.AbilityTypeAlias, ability_key: py.AbilityKey)
```

移除技能(指定类型)
> 拼错了，请改用 `Unit:remove_ability_by_key`

@*param* `type` — 技能类型

@*param* `ability_key` — 物编id

```lua
type:
    | '隐藏'
    | '普通'
    | '命令'
    | '英雄'
```
## remove_ability

```lua
(method) Unit:remove_ability(type: y3.Const.AbilityType, slot: y3.Const.AbilityIndex)
```

移除技能

@*param* `type` — 技能类型

@*param* `slot` — 技能位
## remove_ability_by_key

```lua
(method) Unit:remove_ability_by_key(type: y3.Const.AbilityType|y3.Const.AbilityTypeAlias, ability_key: py.AbilityKey)
```

移除技能(指定类型)

@*param* `type` — 技能类型

@*param* `ability_key` — 物编id

```lua
type:
    | '隐藏'
    | '普通'
    | '命令'
    | '英雄'
```
## remove_buffs_by_effect_type

```lua
(method) Unit:remove_buffs_by_effect_type(effect_type: y3.Const.EffectType)
```

单位移除所有指定类型的魔法效果

@*param* `effect_type` — 影响类型的魔法效果
## remove_buffs_by_key

```lua
(method) Unit:remove_buffs_by_key(buff_key: py.ModifierKey)
```

单位移除所有指定id的魔法效果

@*param* `buff_key` — 影响类型的魔法效果
## remove_goods

```lua
(method) Unit:remove_goods(item_name: py.TabName, item_key: py.ItemKey)
```

移除可贩卖的商品

@*param* `item_name` — 物品名

@*param* `item_key` — 物品id
## remove_item

```lua
(method) Unit:remove_item(item_id: py.ItemKey, num?: integer)
```

单位移除物品

@*param* `item_id` — 物品id

@*param* `num` — 数量
## remove_mover

```lua
(method) Unit:remove_mover()
```

移除运动器
## remove_multi_state

```lua
(method) Unit:remove_multi_state(state_enum: integer)
```

移除多个状态
使用 `y3.const.UnitEnumState` 中的枚举值

@*param* `state_enum` — 状态
## remove_state

```lua
(method) Unit:remove_state(state_enum: integer|y3.Const.UnitEnumState)
```

移除状态
 只有移除次数等同添加次数时才能移除状态

@*param* `state_enum` — 状态名
## remove_tag

```lua
(method) Unit:remove_tag(tag: string)
```

移除标签

@*param* `tag` — 标签
## remove_tech

```lua
(method) Unit:remove_tech(tech_id: py.TechKey)
```

单位删除科技

@*param* `tech_id` — 科技id
## replace_model

```lua
(method) Unit:replace_model(model_id: py.ModelKey)
```

替换模型

@*param* `model_id` — 模型id
## research_tech

```lua
(method) Unit:research_tech(tech_id: py.TechKey)
```

研究科技

@*param* `tech_id` — 科技id
## sell

```lua
(method) Unit:sell(unit: Unit, item: Item)
```

单位向商店出售物品

@*param* `unit` — 单位

@*param* `item` — 物品
## set_Xray_is_open

```lua
(method) Unit:set_Xray_is_open(is_open: boolean)
```

设置透视状态

@*param* `is_open` — 是否透视
## set_ability_point

```lua
(method) Unit:set_ability_point(skill_point: integer)
```

设置技能点

@*param* `skill_point` — 技能点
## set_afterimage_time

```lua
(method) Unit:set_afterimage_time(interval: number, duration: number, start_time: number, end_time: number)
```

设置残影时间

@*param* `interval` — 间隔时间

@*param* `duration` — 显示时间

@*param* `start_time` — 开始时间

@*param* `end_time` — 结束时间
## set_alert_range

```lua
(method) Unit:set_alert_range(range: number)
```

设置警戒范围

@*param* `range` — 范围
## set_animation_speed

```lua
(method) Unit:set_animation_speed(speed: number)
```

设置动画播放速率

@*param* `speed` — 速度
## set_armor_type

```lua
(method) Unit:set_armor_type(armor_type: integer)
```

设置护甲类型

@*param* `armor_type` — 护甲类型
## set_attack_type

```lua
(method) Unit:set_attack_type(attack_type: integer)
```

设置攻击类型

@*param* `attack_type` — 攻击类型
## set_attr

```lua
(method) Unit:set_attr(attr_name: string|y3.Const.UnitAttr, value: number, attr_type?: string|y3.Const.UnitAttrType)
```

设置属性

@*param* `attr_name` — 属性名

@*param* `value` — 属性值

@*param* `attr_type` — 属性类型，默认为“基础”
## set_attr_growth

```lua
function Unit.set_attr_growth(unit_key: py.UnitKey, attr_name: string, value: number)
```

******************************************
设置属性成长

@*param* `unit_key` — 单位id

@*param* `attr_name` — 属性名

@*param* `value` — 属性成长
## set_bar_cnt

```lua
(method) Unit:set_bar_cnt(number: integer)
```

设置物品栏的槽位数

@*param* `number` — 槽位数
## set_base_speed

```lua
(method) Unit:set_base_speed(speed: number)
```

设置走路动画基准速度

@*param* `speed` — 速度
## set_behavior

```lua
(method) Unit:set_behavior(behavior: py.UnitBehavior)
```

设置默认单位行为

@*param* `behavior` — 单位行为
## set_blood_bar_type

```lua
(method) Unit:set_blood_bar_type(bar_type: integer)
```

设置血条样式

@*param* `bar_type` — 血条样式
## set_cancel_alert_range

```lua
(method) Unit:set_cancel_alert_range(range: number)
```

设置取消警戒范围

@*param* `range` — 取消警戒范围
## set_collision_radius

```lua
(method) Unit:set_collision_radius(radius: number)
```

设置单位碰撞半径
## set_day_vision

```lua
(method) Unit:set_day_vision(value: number)
```

 设置白天的视野范围
## set_description

```lua
(method) Unit:set_description(description: string)
```

设置描述

@*param* `description` — 描述
## set_enemy_minimap_icon

```lua
(method) Unit:set_enemy_minimap_icon(img_id: py.Texture)
```

设置敌方单位小地图头像

@*param* `img_id` — 敌方单位小地图头像
## set_exp

```lua
(method) Unit:set_exp(exp: number)
```

设置经验

@*param* `exp` — 经验
## set_facing

```lua
(method) Unit:set_facing(direction: number, turn_time: number)
```

设置朝向

@*param* `direction` — 朝向

@*param* `turn_time` — 转向时间
## set_ghost_color

```lua
(method) Unit:set_ghost_color(red: number, green: number, blue: number, alpha: number)
```

设置残影颜色

@*param* `red` — 绿

@*param* `green` — 绿

@*param* `blue` — 蓝

@*param* `alpha` — 透明度
## set_goods_stack

```lua
(method) Unit:set_goods_stack(tag_name: py.TabName, item_key: py.ItemKey, number: integer)
```

设置商品库存

@*param* `tag_name` — 标签名

@*param* `item_key` — 物品id

@*param* `number` — 物品库存
## set_health_bar_display

```lua
(method) Unit:set_health_bar_display(bar_show_type: integer)
```

设置血条显示方式

@*param* `bar_show_type` — 血条显示方式
## set_height

```lua
(method) Unit:set_height(height: number, trans_time: number)
```

设置飞行高度

@*param* `height` — 高度

@*param* `trans_time` — 过渡时间
## set_hp

```lua
(method) Unit:set_hp(hp: number)
```

设置当前生命值

@*param* `hp` — 当前生命值
## set_icon

```lua
(method) Unit:set_icon(img_id: py.Texture)
```

设置单位头像

@*param* `img_id` — 单位头像
## set_level

```lua
(method) Unit:set_level(level: integer)
```

设置等级

@*param* `level` — 等级
## set_life_cycle

```lua
(method) Unit:set_life_cycle(time: number)
```

设置生命周期

@*param* `time` — 生命周期
## set_minimap_icon

```lua
(method) Unit:set_minimap_icon(img_id: py.Texture)
```

***************敌我合并一条
设置单位小地图头像

@*param* `img_id` — 单位小地图头像
## set_move_channel_air

```lua
(method) Unit:set_move_channel_air(air_limitation?: boolean)
```

设置单位的移动类型为空中

@*param* `air_limitation` — 空中限制
## set_move_channel_land

```lua
(method) Unit:set_move_channel_land(land_limitation?: boolean, item_limitation?: boolean, water_limitation?: boolean)
```

设置单位的移动类型为地面

@*param* `land_limitation` — 陆地限制

@*param* `item_limitation` — 物件限制

@*param* `water_limitation` — 海洋限制
## set_move_collision

```lua
(method) Unit:set_move_collision(collision_layer: integer|y3.Const.CollisionLayers, enable: boolean)
```

设置单位是否计算某种碰撞类型

@*param* `collision_layer` — 碰撞mask

@*param* `enable` — 开启状态
## set_mp

```lua
(method) Unit:set_mp(mp: number)
```

设置当前魔法值

@*param* `mp` — 当前魔法值
## set_name

```lua
(method) Unit:set_name(name: string)
```

设置名称

@*param* `name` — 名称
## set_night_value

```lua
(method) Unit:set_night_value(value: number)
```

 设置夜晚的视野范围
## set_outline_visible

```lua
(method) Unit:set_outline_visible(bool: boolean)
```

设置单位描边开启

@*param* `bool` — 布尔值
## set_outlined_color

```lua
(method) Unit:set_outlined_color(color_r: number, color_g: number, color_b: number)
```

设置单位描边颜色

@*param* `color_r` — R

@*param* `color_g` — G

@*param* `color_b` — B
## set_pkg_cnt

```lua
(method) Unit:set_pkg_cnt(number: integer)
```

设置背包栏的槽位数

@*param* `number` — 槽位数
## set_point

```lua
(method) Unit:set_point(point: Point, isSmooth: boolean)
```

强制传送到点

@*param* `point` — 点

@*param* `isSmooth` — 是否丝滑
## set_recycle_on_remove

```lua
(method) Unit:set_recycle_on_remove(is_recycle: boolean)
```

设置尸体消失后是否回收

@*param* `is_recycle` — 是否回收
## set_reward_exp

```lua
(method) Unit:set_reward_exp(exp: number)
```

设置被击杀的经验值奖励

@*param* `exp` — 经验
## set_reward_res

```lua
(method) Unit:set_reward_res(player_attr_name: py.RoleResKey, value: number)
```

设置被击杀的玩家属性奖励

@*param* `player_attr_name` — 属性名

@*param* `value` — 属性奖励
## set_scale

```lua
(method) Unit:set_scale(scale: number)
```

设置模型缩放

@*param* `scale` — 模型缩放
## set_select_effect_visible

```lua
(method) Unit:set_select_effect_visible(bool: boolean)
```

设置单位选择框的可见性

@*param* `bool` — 布尔值
## set_transparent_when_invisible

```lua
(method) Unit:set_transparent_when_invisible(is_visible: boolean)
```

**********************这是啥
设置隐身可见时是否半透明

@*param* `is_visible` — 是否半透明
## set_turning_speed

```lua
(method) Unit:set_turning_speed(speed: number)
```

设置转身速度

@*param* `speed` — 转身速度
## set_unit_scale

```lua
(method) Unit:set_unit_scale(sx: number, sy: number, sz: number)
```

设置单位三轴缩放

@*param* `sx` — X轴缩放

@*param* `sy` — Y轴缩放

@*param* `sz` — Z轴缩放
## shift_item

```lua
(method) Unit:shift_item(item: Item, type: y3.Const.ShiftSlotTypeAlias, index?: integer, force?: boolean)
```

移动物品

@*param* `item` — 物品

@*param* `index` — 槽位

@*param* `force` — 是否强制移动，`true`: 如果目标有物品，则移动到另一个空格中；`false`: 如果目标有物品，则要移动的物品会掉落

```lua
type:
    | '物品栏'
    | '背包栏'
```
## start_ghost

```lua
(method) Unit:start_ghost(red: number, green: number, blue: number, alpha: number, interval: number, duration: number, start_time: number, end_time: number, is_origin_martial: boolean)
```

************************残影优化
开启残影

@*param* `red` — 红

@*param* `green` — 绿

@*param* `blue` — 蓝

@*param* `alpha` — 透明度

@*param* `interval` — 间隔时间

@*param* `duration` — 显示时间

@*param* `start_time` — 开始时间

@*param* `end_time` — 结束时间

@*param* `is_origin_martial` — 使用原生材质
## stop

```lua
(method) Unit:stop()
  -> py.UnitCommand
```

 命令停止

@*return* — 命令
## stop_all_abilities

```lua
(method) Unit:stop_all_abilities()
```

停止所有技能
## stop_animation

```lua
(method) Unit:stop_animation(anim_name: string)
```

停止动画

@*param* `anim_name` — 动画名
## stop_cur_animation

```lua
(method) Unit:stop_cur_animation()
```

停止当前正在播放的动画
## stop_ghost

```lua
(method) Unit:stop_ghost()
```

关闭残影
## storage_all

```lua
(method) Storage:storage_all()
  -> table
```

 获取存储数据的容器
## storage_get

```lua
(method) Storage:storage_get(key: any)
  -> any
```

 获取存储的值
## storage_set

```lua
(method) Storage:storage_set(key: any, value: any)
```

 存储任意值
## storage_table

```lua
table
```

## subscribe_event

```lua
(method) ObjectEvent:subscribe_event(event_name: string, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```

## switch_ability

```lua
(method) Unit:switch_ability(ability_1: Ability, ability_2: Ability)
```

交换技能位置

@*param* `ability_1` — 第一个技能

@*param* `ability_2` — 第二个技能
## switch_ability_by_slot

```lua
(method) Unit:switch_ability_by_slot(type_1: y3.Const.AbilityType, slot_1: y3.Const.AbilityIndex, type_2: y3.Const.AbilityType, slot_2: y3.Const.AbilityIndex)
```

根据坑位交换技能

@*param* `type_1` — 第一个技能类型

@*param* `slot_1` — 第一个技能坑位

@*param* `type_2` — 第二个技能类型

@*param* `slot_2` — 第二个技能坑位
## type

```lua
string
```

## unit_gains_tech

```lua
(method) Unit:unit_gains_tech(tech_key: py.TechKey)
```

单位获得科技

@*param* `tech_key` — 科技类型
## unit_has_modifier_tag

```lua
(method) Unit:unit_has_modifier_tag(tag_name: string)
  -> has_modifier_tag: boolean
```

是否有指定标签的魔法效果

@*param* `tag_name` — 标签

@*return* `has_modifier_tag` — 有指定标签的魔法效果
## use_item

```lua
(method) Unit:use_item(item: Item, target?: Destructible|Item|Point|Unit, extra_target?: Point)
  -> py.UnitCommand
```

 命令使用物品

# Unit.DamageData

 造成伤害

## ability

```lua
Ability
```

关联技能
## common_attack

```lua
boolean
```

视为普攻
## critical

```lua
boolean
```

必定暴击
## damage

```lua
number
```

## no_miss

```lua
boolean
```

必定命中
## particle

```lua
py.SfxKey
```

特效
## socket

```lua
string
```

特效挂点
## target

```lua
Destructible|Item|Unit
```

单位
## text_track

```lua
integer
```

跳字轨迹类型
## text_type

```lua
y3.Const.DamageTextType
```

跳字类型
## type

```lua
integer|y3.Const.DamageType
```

也可以传任意数字

