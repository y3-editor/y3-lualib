# Ability

技能

## add_cd

```lua
(method) Ability:add_cd(value: number)
```

增加冷却时间

@*param* `value` — 冷却
## add_float_attr

```lua
(method) Ability:add_float_attr(key: string, value: number)
```

增加实数属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## add_int_attr

```lua
(method) Ability:add_int_attr(key: string, value: integer)
```

增加整数属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## add_level

```lua
(method) Ability:add_level(value: integer)
```

增加技能等级

@*param* `value` — 等级
## add_player_attr_cost

```lua
(method) Ability:add_player_attr_cost(key: string, value: number)
```

增加技能玩家属性消耗

@*param* `key` — 属性key

@*param* `value` — 属性值
## add_remaining_cd

```lua
(method) Ability:add_remaining_cd(value: number)
```

增加技能剩余冷却时间

@*param* `value` — 剩余冷却时间
## add_stack

```lua
(method) Ability:add_stack(value: integer)
```

增加技能充能层数

@*param* `value` — 层数
## add_tag

```lua
(method) Ability:add_tag(tag: string)
```

添加标签

@*param* `tag` — 标签
## can_cast_when_hp_insufficient

```lua
(method) Ability:can_cast_when_hp_insufficient()
  -> can_cast: boolean
```

生命不足是否可以释放

@*return* `can_cast` — 生命不足是否可以释放
## check_precondition_by_key

```lua
function Ability.check_precondition_by_key(player: Player, ability_key: py.AbilityKey)
  -> is_meet: boolean
```

检查技能类型前置条件

@*param* `player` — 玩家

@*param* `ability_key` — 技能类型id (物编id)

@*return* `is_meet` — 技能类型前置条件是否满足
## complete_cd

```lua
(method) Ability:complete_cd()
```

完成冷却
## custom_event_manager

```lua
EventManager?
```

## disable

```lua
(method) Ability:disable()
```

禁用技能
## enable

```lua
(method) Ability:enable()
```

启用技能
## event

```lua
fun(self: Ability, event: "技能-建造完成", callback: fun(trg: Trigger, data: EventParam.技能-建造完成)):Trigger
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

## get_by_handle

```lua
function Ability.get_by_handle(py_ability: py.Ability)
  -> ability: Ability?
```

通过py层的技能实例获取lua层的技能实例

@*param* `py_ability` — py层的技能实例

@*return* `ability` — 返回在lua层初始化后的lua层技能实例
## get_by_id

```lua
function Ability.get_by_id(id: integer)
  -> Ability
```

## get_cast_type

```lua
(method) Ability:get_cast_type()
  -> type: py.AbilityCastType
```

获取技能释放类型 AbilityCastType

@*return* `type` — 技能释放类型
## get_cd

```lua
(method) Ability:get_cd()
  -> time: number
```

获取当前冷却时间

@*return* `time` — 当前冷却时间
## get_charge_time

```lua
(method) Ability:get_charge_time()
  -> number
```

获取技能当前剩余充能时间
## get_custom_event_manager

```lua
(method) CustomEvent:get_custom_event_manager()
  -> EventManager?
```

## get_description

```lua
(method) Ability:get_description()
  -> string
```

获取技能描述
## get_description_by_key

```lua
function Ability.get_description_by_key(ability_key: py.AbilityKey)
  -> des: string
```

根据技能的key获取技能描述

@*return* `des` — 描述
## get_float_attr

```lua
(method) Ability:get_float_attr(key: string|y3.Const.AbilityFloatAttr)
  -> value: number
```

获取实数属性

@*param* `key` — 键值key

@*return* `value` — 值
## get_float_attr_by_key

```lua
function Ability.get_float_attr_by_key(ability_key: py.AbilityKey, key: string)
  -> value: number
```

获取技能类型实数属性
> 请使用 `y3.object.ability[ability_key].data` 代替

@*param* `ability_key` — 技能类型id (物编id)

@*param* `key` — 键值key

@*return* `value` — 值
## get_formula_attr_by_key

```lua
function Ability.get_formula_attr_by_key(ability_id: py.AbilityKey, attr_name: string, level: integer, stack_count: integer, unit_hp_max: number, unit_hp_cur: number)
  -> value: number
```

获取技能类型公式属性

@*param* `ability_id` — 技能类型id(物编id)

@*param* `attr_name` — 属性名称

@*param* `level` — 技能等级

@*param* `stack_count` — 技能层数

@*param* `unit_hp_max` — 单位最大生命

@*param* `unit_hp_cur` — 单位当前生命

@*return* `value` — 值
## get_formula_kv

```lua
(method) Ability:get_formula_kv(key: string)
  -> value: number
```

获取技能公式类型的kv

@*param* `key` — 键值key

@*return* `value` — 值
## get_icon

```lua
(method) Ability:get_icon()
  -> id: py.Texture
```

获取技能图标

@*return* `id` — 图片ID
## get_icon_by_key

```lua
function Ability.get_icon_by_key(ability_key: py.AbilityKey)
  -> id: py.Texture
```

获取技能类型的icon图标的图片ID

@*param* `ability_key` — 技能类型id (物编id)

@*return* `id` — 图片ID
## get_int_attr

```lua
(method) Ability:get_int_attr(key: string|y3.Const.AbilityIntAttr)
  -> value: number
```

获取整数属性

@*param* `key` — 键值key

@*return* `value` — 值
## get_int_attr_by_key

```lua
function Ability.get_int_attr_by_key(ability_key: py.AbilityKey, key: string)
  -> value: integer
```

获取技能类型整数属性
> 请使用 `y3.object.ability[ability_key].data` 代替

@*param* `ability_key` — 技能类型id (物编id)

@*param* `key` — 键值key

@*return* `value` — 值
## get_item

```lua
(method) Ability:get_item()
  -> Item?
```

获取技能绑定的物品（技能对象在哪个物品对象上）
## get_key

```lua
(method) Ability:get_key()
  -> py.AbilityKey
```

## get_level

```lua
(method) Ability:get_level()
  -> level: integer
```

 获取技能等级

@*return* `level` — 等级
## get_max_cd

```lua
(method) Ability:get_max_cd()
  -> number
```

获取技能最大CD
## get_name

```lua
(method) Ability:get_name()
  -> string
```

## get_name_by_key

```lua
function Ability.get_name_by_key(ability_key: py.AbilityKey)
  -> name: string
```

根据技能的key获取技能名字

@*return* `name` — 技能名字
## get_owner

```lua
(method) Ability:get_owner()
  -> owner: Unit?
```

获取技能的拥有者

@*return* `owner` — 技能拥有者
## get_player_attr_cost

```lua
(method) Ability:get_player_attr_cost(key: string)
  -> cost: number
```

获取技能消耗的玩家属性值

@*param* `key` — 属性key

@*return* `cost` — 玩家属性值
## get_range

```lua
(method) Ability:get_range()
  -> number
```

获取技能施法范围

@*return* — 施法范围
## get_skill_pointer

```lua
(method) Ability:get_skill_pointer()
  -> y3.Const.AbilityPointerType
```

获取技能的指示器类型
## get_skill_type_pointer

```lua
function Ability.get_skill_type_pointer(name: py.AbilityKey)
  -> y3.Const.AbilityPointerType
```

获取技能类型的指示器类型
## get_slot

```lua
(method) Ability:get_slot()
  -> index: y3.Const.AbilityIndex
```

获取技能所在技能位

@*return* `index` — 技能所在技能位
## get_str_attr_by_key

```lua
function Ability.get_str_attr_by_key(ability_key: py.AbilityKey, key: py.AbilityStrAttr)
  -> str: string
```

获取技能类型字符串属性
> 请改用 `y3.object.ability[ability_key].data` 代替

@*param* `ability_key` — 技能类型id (物编id)

@*param* `key` — 键值key

@*return* `str` — 值
## get_string_attr

```lua
(method) Ability:get_string_attr(key: string)
  -> value: string
```

获取字符串属性

@*param* `key` — 键值key

@*return* `value` — 值
## get_target

```lua
(method) Ability:get_target(cast: integer)
  -> target: Destructible|Item|Point|Unit|nil
```

@*param* `cast` — 施法ID

@*return* `target` — 目标
## get_type

```lua
(method) Ability:get_type()
  -> type: y3.Const.AbilityType
```

获取技能种类

@*return* `type` — 技能种类
## handle

```lua
py.Ability
```

技能对象
## has_tag

```lua
(method) Ability:has_tag(tag: string)
  -> boolean
```

是否具有标签

@*param* `tag` — 标签
## hide_pointer

```lua
function Ability.hide_pointer(player: Player)
```

关闭技能指示器

@*param* `player` — 玩家
## id

```lua
integer
```

## is_autocast_enabled

```lua
(method) Ability:is_autocast_enabled()
  -> is_enabled: boolean
```

自动施法是否开启

@*return* `is_enabled` — 是否开启
## is_cd_reduce

```lua
(method) Ability:is_cd_reduce()
  -> is_influenced: boolean
```

是否受冷却缩减影响

@*return* `is_influenced` — 是否受冷却缩减影响
## is_cd_reduce_by_key

```lua
function Ability.is_cd_reduce_by_key(ability_key: py.AbilityKey)
  -> is_influenced: boolean
```

技能类型是否受冷却缩减影响

@*param* `ability_key` — 技能类型id (物编id)

@*return* `is_influenced` — 技能类型是否受冷却缩减影响
## is_cost_hp_can_die

```lua
(method) Ability:is_cost_hp_can_die()
  -> is_cost: boolean
```

消耗生命是否会死亡

@*return* `is_cost` — 消耗生命是否会死亡
## is_destroyed

```lua
(method) Ability:is_destroyed()
  -> boolean|unknown
```

## is_exist

```lua
(method) Ability:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## key

```lua
integer?
```

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
(method) Ability:learn()
```

学习技能
## object_event_manager

```lua
EventManager?
```

## phandle

```lua
py.Ability
```

技能对象
## pre_cast

```lua
(method) Ability:pre_cast(player: Player)
```

进入技能准备施法状态

@*param* `player` — 玩家
## ref_manager

```lua
unknown
```

## remove

```lua
(method) Ability:remove()
```

移除技能
## remove_tag

```lua
(method) Ability:remove_tag(tag: string)
```

移除标签

@*param* `tag` — 标签
## restart_cd

```lua
(method) Ability:restart_cd()
```

进入冷却
## set_arrow_length

```lua
(method) Ability:set_arrow_length(value: number)
```

设置箭头/多段指示器长度

@*param* `value` — 长度
## set_arrow_width

```lua
(method) Ability:set_arrow_width(value: number)
```

设置箭头/多段指示器宽度

@*param* `value` — 宽度
## set_autocast

```lua
(method) Ability:set_autocast(enable: boolean)
```

开关自动施法

@*param* `enable` — 开关
## set_build_rotate

```lua
(method) Ability:set_build_rotate(angle: number)
```

设置技能的建造朝向

@*param* `angle` — 角度
## set_can_cast_when_hp_insufficient

```lua
(method) Ability:set_can_cast_when_hp_insufficient(can_cast: boolean)
```

设置生命不足时是否可以释放技能

@*param* `can_cast` — 是否可以释放
## set_cd

```lua
(method) Ability:set_cd(value: number)
```

设置剩余冷却时间

@*param* `value` — 剩余冷却时间
## set_cd_reduce

```lua
(method) Ability:set_cd_reduce(is_influenced: boolean)
```

设置技能是否受冷却缩减的影响

@*param* `is_influenced` — 属性key
## set_charge_time

```lua
(method) Ability:set_charge_time(value: number)
```

设置技能剩余充能时间

@*param* `value` — 剩余充能时间
## set_circle_radius

```lua
(method) Ability:set_circle_radius(value: number)
```

设置箭圆形指示器半径

@*param* `value` — 半径
## set_description

```lua
(method) Ability:set_description(des: string)
```

设置技能描述

@*param* `des` — 描述
## set_float_attr

```lua
(method) Ability:set_float_attr(key: string|y3.Const.AbilityFloatAttr, value: number)
```

设置实数属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## set_icon

```lua
(method) Ability:set_icon(icon_id: integer)
```

设置技能图标

@*param* `icon_id` — 图片id
## set_int_attr

```lua
(method) Ability:set_int_attr(key: string|y3.Const.AbilityIntAttr, value: integer)
```

设置整数属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## set_is_cost_hp_can_die

```lua
(method) Ability:set_is_cost_hp_can_die(can_die: boolean)
```

设置消耗生命是否会死亡

@*param* `can_die` — 是否会死亡
## set_level

```lua
(method) Ability:set_level(level: integer)
```

设置技能等级

@*param* `level` — 等级
## set_max_cd

```lua
(method) Ability:set_max_cd(value: number)
```

设置技能最大CD
## set_name

```lua
(method) Ability:set_name(name: string)
```

设置技能名字

@*param* `name` — 技能名字
## set_normal_attack_preview_state

```lua
function Ability.set_normal_attack_preview_state(player: Player, state: boolean)
```

设置玩家的普攻预览状态

@*param* `player` — 玩家

@*param* `state` — 状态 开/关
## set_player_attr_cost

```lua
(method) Ability:set_player_attr_cost(key: string, value: number)
```

设置技能玩家属性消耗

@*param* `key` — 属性key

@*param* `value` — 属性值
## set_pointer_type

```lua
(method) Ability:set_pointer_type(type: y3.Const.AbilityPointerType)
```

设置技能指示器类型

@*param* `type` — 技能指示器类型
## set_range

```lua
(method) Ability:set_range(value: number)
```

设置技能施法范围

@*param* `value` — 施法范围
## set_sector_angle

```lua
(method) Ability:set_sector_angle(value: number)
```

设置扇形指示器夹角

@*param* `value` — 角度
## set_sector_radius

```lua
(method) Ability:set_sector_radius(value: number)
```

设置扇形指示器半径

@*param* `value` — 半径
## set_smart_cast_with_pointer

```lua
function Ability.set_smart_cast_with_pointer(player: Player, state: boolean)
```

设置玩家的指示器在智能施法时是否显示

@*param* `player` — 玩家

@*param* `state` — 状态 开/关
## set_stack

```lua
(method) Ability:set_stack(value: integer)
```

设置充能层数

@*param* `value` — 层数
## show_indicator

```lua
(method) Ability:show_indicator(player: Player)
```

显示技能指示器

@*param* `player` — 玩家
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


