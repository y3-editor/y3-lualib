# Ability
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
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any[], ...any)
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
  -> ability: Ability
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
## get_float_attr

```lua
(method) Ability:get_float_attr(key: string)
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
(method) Ability:get_int_attr(key: string)
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

@*param* `ability_key` — 技能类型id (物编id)

@*param* `key` — 键值key

@*return* `value` — 值
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
## get_name

```lua
(method) Ability:get_name()
  -> string
```

## get_owner

```lua
(method) Ability:get_owner()
  -> owner: Unit
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

@*param* `ability_key` — 技能类型id (物编id)

@*param* `key` — 键值key

@*return* `str` — 值
## get_string_attr

```lua
(method) Ability:get_string_attr(key: py.AbilityStrAttr)
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
## is_exist

```lua
(method) Ability:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
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
(method) Ability:set_float_attr(key: string, value: number)
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
(method) Ability:set_int_attr(key: string, value: integer)
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


# Area
## add_tag

```lua
(method) Area:add_tag(tag: string)
```

给区域添加标签

@*param* `tag` — tag
## create_circle_area

```lua
function Area.create_circle_area(point: Point, radius: number)
  -> 圆形区域: Area
```

创建圆形区域

@*param* `point` — 点

@*param* `radius` — 半径
## create_polygon_area_by_points

```lua
function Area.create_polygon_area_by_points(...Point)
  -> polygon: Area
```

沿点创建多边形

@*return* `polygon` — 多边形区域
## create_rectangle_area

```lua
function Area.create_rectangle_area(point: Point, horizontal_length: number, vertical_length: number)
  -> area: Area
```

创建矩形区域

@*param* `point` — 点

@*param* `horizontal_length` — 长度

@*param* `vertical_length` — 宽度

@*return* `area` — 矩形区域
## create_rectangle_area_from_two_points

```lua
function Area.create_rectangle_area_from_two_points(point_one: Point, point_two: Point)
  -> area: Area
```

以起点终点创建矩形区域

@*param* `point_one` — 点1

@*param* `point_two` — 点2

@*return* `area` — 矩形区域
## edit_area_collision

```lua
(method) Area:edit_area_collision(collision_layer: integer, is_add: boolean)
```

编辑区域碰撞

@*param* `collision_layer` — 碰撞类型

@*param* `is_add` — 添加/去除
## edit_area_fov_block

```lua
(method) Area:edit_area_fov_block(fov_block_type: integer, is_add: boolean)
```

编辑区域视野阻挡

@*param* `fov_block_type` — 视野阻挡类型

@*param* `is_add` — 添加/去除
## event

```lua
fun(self: Area, event: "区域-进入", callback: fun(trg: Trigger, data: EventParam.区域-进入)):Trigger
```

## get_all_unit_in_area

```lua
(method) Area:get_all_unit_in_area()
  -> 单位组: Unit[]
```

区域内的所有单位
## get_by_handle

```lua
function Area.get_by_handle(py_area: py.Area, shape?: Area.Shape)
  -> Area
```

根据py对象创建区域

@*param* `py_area` — py层对象

@*param* `shape` — 见area.enum
## get_by_res_id

```lua
function Area.get_by_res_id(res_id: py.AreaID, shape?: Area.Shape)
  -> Area
```

@*param* `res_id` — 编辑场景中的id

@*param* `shape` — 见area.enum
## get_center_point

```lua
(method) Area:get_center_point()
  -> 中心点: Point
```

 获取中心点
## get_circle_areas_by_tag

```lua
function Area.get_circle_areas_by_tag(tag: string)
  -> area: Area[]
```

按标签获取所有的圆形区域

@*param* `tag` — 标签

@*return* `area` — 矩形区域
## get_circle_by_res_id

```lua
function Area.get_circle_by_res_id(res_id: py.AreaID)
  -> Area
```

根据场景id获得圆形区域

@*param* `res_id` — 编辑场景中的id
## get_map_area

```lua
function Area.get_map_area()
  -> Area
```

获取完整地图区域
## get_max_x

```lua
(method) Area:get_max_x()
  -> X坐标: number
```

获取区域内最大X坐标
## get_max_y

```lua
(method) Area:get_max_y()
  -> Y坐标: number
```

获取区域内最大Y坐标
## get_min_x

```lua
(method) Area:get_min_x()
  -> X坐标: number
```

获取区域内最小X坐标
## get_min_y

```lua
(method) Area:get_min_y()
  -> Y坐标: number
```

获取区域内最小Y坐标
## get_polygon_areas_by_tag

```lua
function Area.get_polygon_areas_by_tag(tag: string)
  -> area: Area[]
```

按标签获取所有的多边形区域

@*param* `tag` — 标签

@*return* `area` — 多边形区域表
## get_polygon_areas_point_list

```lua
function Area.get_polygon_areas_point_list(polygon: Area)
  -> area: table
```

获取多边形的所有顶点

@*param* `polygon` — 多边形区域

@*return* `area` — 多边形顶点表
## get_polygon_by_res_id

```lua
function Area.get_polygon_by_res_id(res_id: py.AreaID)
  -> Area
```

根据场景id获得多边形区域

@*param* `res_id` — 编辑场景中的id
## get_radius

```lua
(method) Area:get_radius()
  -> 半径: number
```

获得圆形区域半径
## get_rect_areas_by_tag

```lua
function Area.get_rect_areas_by_tag(tag: string)
  -> area: Area[]
```

按标签获取所有的矩形区域

@*param* `tag` — 标签

@*return* `area` — 矩形区域表
## get_rectangle_area_last_created

```lua
function Area.get_rectangle_area_last_created()
  -> Area
```

获得最后创建的矩形区域
## get_rectangle_by_res_id

```lua
function Area.get_rectangle_by_res_id(res_id: py.AreaID)
  -> Area
```

根据场景id获得矩形区域

@*param* `res_id` — 编辑场景中的id
## get_unit_group_in_area

```lua
(method) Area:get_unit_group_in_area(player: Player)
  -> 单位组: UnitGroup
```

区域内玩家单位(单位组)

@*param* `player` — 玩家
## get_unit_num_in_area

```lua
(method) Area:get_unit_num_in_area()
  -> 数量: integer
```

区域中单位的数量
## get_weather

```lua
(method) Area:get_weather()
  -> 天气枚举: integer
```

获得区域天气
## handle

```lua
py.Area
```

区域
## has_tag

```lua
(method) Area:has_tag(tag: string)
  -> 区域是否有tag: boolean
```

区域是否有tag

@*param* `tag` — tag
## is_point_in_area

```lua
(method) Area:is_point_in_area(point: Point)
  -> boolean
```

 点是否在区域内

@*param* `point` — 点
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
```
## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## map

```lua
{ [py.AreaID]: Area }
```

## object_event_manager

```lua
EventManager?
```

## random_point

```lua
(method) Area:random_point()
  -> Point
```

 获取随机点
## ref_manager

```lua
unknown
```

## remove

```lua
(method) Area:remove()
```

删除区域
## remove_tag

```lua
(method) Area:remove_tag(tag: string)
```

给区域移除标签

@*param* `tag` — tag
## res_id

```lua
integer?
```

## set_collision

```lua
(method) Area:set_collision(is_collision_effect: boolean, is_land_effect: boolean, is_air_effect: boolean)
```

设置区域碰撞

@*param* `is_collision_effect` — 碰撞是否生效

@*param* `is_land_effect` — 地面碰撞开关

@*param* `is_air_effect` — 空中碰撞开关
## set_radius

```lua
(method) Area:set_radius(radius: number)
```

设置圆形区域半径

@*param* `radius` — 半径
## set_size

```lua
(method) Area:set_size(horizontal_length: number, vertical_length: number)
```

设置矩形区域半径

@*param* `horizontal_length` — 长度

@*param* `vertical_length` — 宽度
## set_visible

```lua
(method) Area:set_visible(player: Player, is_visibility: boolean, is_real_visibility: boolean)
```

设置多边形区域对玩家可见性

@*param* `player` — 玩家

@*param* `is_visibility` — 是否开启视野

@*param* `is_real_visibility` — 是否开启真实视野
## shape

```lua
Area.Shape
```

## subscribe_event

```lua
(method) ObjectEvent:subscribe_event(event_name: string, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```

## type

```lua
string
```


# Area.Shape
```lua
{
    CIRCLE: integer = 1,
    RECTANGLE: integer = 2,
    POLYGON: integer = 3,
}
```
# Beam
## create

```lua
function Beam.create(data: Beam.CreateData)
  -> Beam
```

## create_lua_beam_by_py

```lua
function Beam.create_lua_beam_by_py(py_beam: py.LinkSfx)
  -> beam: Beam
```

## handle

```lua
py.LinkSfx
```

链接特效
## remove

```lua
(method) Beam:remove()
```

链接特效 - 销毁
## set

```lua
(method) Beam:set(data: Beam.LinkData)
```

链接特效 - 设置位置
## show

```lua
(method) Beam:show(is_show: boolean)
```

@*param* `is_show` — 是否显示

链接特效 - 显示/隐藏
## type

```lua
string
```


# Beam.CreateData
## immediate

```lua
boolean
```

销毁时，是否有过度
## key

```lua
py.SfxKey
```

特效id
## source

```lua
Point|Unit
```

目标
## source_height

```lua
number
```

高度（只在目标是点时生效）
## source_socket

```lua
string
```

挂接点（只在目标是单位时生效）
## target

```lua
Point|Unit
```

目标
## target_height

```lua
number
```

高度（只在目标是点时生效）
## target_socket

```lua
string
```

挂接点（只在目标是单位时生效）
## time

```lua
number
```

存在时间

# Beam.LinkData
## height

```lua
number
```

高度（只在目标是点时生效）
## point_type

```lua
y3.Const.LinkSfxPointType
```

起点or终点
## socket

```lua
string
```

挂接点（只在目标是单位时生效）
## target

```lua
Point|Unit
```

目标

# Buff
## add_aura_range

```lua
(method) Buff:add_aura_range(range: number)
```

增加魔法效果光环影响范围

@*param* `range` — 影响范围
## add_shield

```lua
(method) Buff:add_shield(value: number)
```

增加护盾值

@*param* `value` — 护盾值
## add_stack

```lua
(method) Buff:add_stack(stack: integer)
```

增加堆叠层数

@*param* `stack` — 层数
## add_time

```lua
(method) Buff:add_time(time: number)
```

增加剩余持续时间

@*param* `time` — 剩余持续时间
## custom_event_manager

```lua
EventManager?
```

## event

```lua
fun(self: Buff, event: "效果-获得", callback: fun(trg: Trigger, data: EventParam.效果-获得)):Trigger
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
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any[], ...any)
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

## get_ability

```lua
(method) Buff:get_ability()
  -> ability: Ability|nil
```

获得关联技能

@*return* `ability` — 投射物或魔法效果的关联技能
## get_aura

```lua
(method) Buff:get_aura()
  -> aura: Buff
```

获取所属光环

@*return* `aura` — 所属光环
## get_buff_aura_effect_key

```lua
(method) Buff:get_buff_aura_effect_key()
  -> type: py.ModifierKey
```

获取魔法效果的光环效果类型ID

@*return* `type` — 光环效果类型ID
## get_buff_aura_range

```lua
(method) Buff:get_buff_aura_range()
  -> range: number
```

获取魔法效果的光环范围

@*return* `range` — 光环范围
## get_buff_effect_type

```lua
(method) Buff:get_buff_effect_type()
  -> type: y3.Const.EffectType
```

获取魔法效果影响类型

@*return* `type` — 魔法效果影响类型
## get_buff_type

```lua
(method) Buff:get_buff_type()
  -> type: y3.Const.ModifierType
```

获取魔法效果类型

@*return* `type` — 魔法效果类型
## get_by_handle

```lua
function Buff.get_by_handle(py_buff: py.ModifierEntity)
  -> Buff
```

通过py层的魔法效果实例获取lua层的魔法效果实例

@*param* `py_buff` — py层的魔法效果实例

@*return* — 返回在lua层初始化后的lua层魔法效果实例
## get_by_id

```lua
function Buff.get_by_id(id: integer)
  -> Buff
```

## get_cycle_time

```lua
(method) Buff:get_cycle_time()
  -> time: number
```

获取魔法效果循环周期

@*return* `time` — 循环周期
## get_description

```lua
(method) Buff:get_description()
  -> description: string
```

获取魔法效果对象的描述

@*return* `description` — 描述
## get_description_by_key

```lua
function Buff.get_description_by_key(buff_key: py.ModifierKey)
  -> description: string
```

获取魔法效果类型的描述

@*param* `buff_key` — 类型

@*return* `description` — 描述
## get_icon_by_key

```lua
function Buff.get_icon_by_key(buff_key: py.ModifierKey)
  -> py.Texture
```

获取魔法效果类型的icon图标的图片

@*param* `buff_key` — 类型

@*return* — 图片id
## get_key

```lua
(method) Buff:get_key()
  -> buff_key: py.ModifierKey
```

获得魔法效果的类别

@*return* `buff_key` — 类别
## get_level

```lua
(method) Buff:get_level()
  -> level: integer
```

获取等级

@*return* `level` — 等级
## get_max_stack

```lua
(method) Buff:get_max_stack()
  -> stack: integer
```

获取魔法效果的最大堆叠层数

@*return* `stack` — 层数
## get_name

```lua
(method) Buff:get_name()
  -> name: string
```

获取魔法效果对象的名称

@*return* `name` — 名字
## get_owner

```lua
(method) Buff:get_owner()
  -> owner: Unit
```

获取魔法效果的携带者

@*return* `owner` — 携带者
## get_passed_time

```lua
(method) Buff:get_passed_time()
  -> duration: number
```

魔法效果的已持续时间

@*return* `duration` — 持续时间
## get_shield

```lua
(method) Buff:get_shield()
  -> shield: number
```

获取魔法效果的护盾

@*return* `shield` — 护盾值
## get_source

```lua
(method) Buff:get_source()
  -> provider: Unit
```

获取魔法效果的施加者

@*return* `provider` — 施加者
## get_stack

```lua
(method) Buff:get_stack()
  -> stack: integer
```

获取魔法效果的堆叠层数

@*return* `stack` — 层数
## get_time

```lua
(method) Buff:get_time()
  -> time: number
```

获取魔法效果的剩余持续时间

@*return* `time` — 剩余持续时间
## handle

```lua
py.ModifierEntity
```

效果对象
## has_tag

```lua
(method) Buff:has_tag(tag: string)
  -> boolean
```

是否具有标签

@*param* `tag` — 标签
## id

```lua
integer
```

## is_exist

```lua
(method) Buff:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## is_icon_visible

```lua
(method) Buff:is_icon_visible()
  -> is_visible: boolean
```

魔法效果的图标是否可见

@*return* `is_visible` — 是否可见
## is_icon_visible_by_key

```lua
function Buff.is_icon_visible_by_key(buff_key: py.ModifierKey)
  -> is_visible: boolean
```

魔法效果类型的图标是否可见

@*param* `buff_key` — 类型

@*return* `is_visible` — 是否可见
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
```
## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## ref_manager

```lua
unknown
```

所有魔法效果实例
## remove

```lua
(method) Buff:remove()
```

移除
## set_aura_range

```lua
(method) Buff:set_aura_range(range: number)
```

设置魔法效果光环影响范围

@*param* `range` — 影响范围
## set_description

```lua
(method) Buff:set_description(description: string)
```

设置魔法效果对象的描述

@*param* `description` — 描述
## set_name

```lua
(method) Buff:set_name(name: string)
```

设置魔法效果的名称

@*param* `name` — 名字
## set_shield

```lua
(method) Buff:set_shield(value: number)
```

设置护盾值

@*param* `value` — 护盾值
## set_stack

```lua
(method) Buff:set_stack(stack: integer)
```

设置堆叠层数

@*param* `stack` — 层数
## set_time

```lua
(method) Buff:set_time(time: number)
```

设置剩余持续时间

@*param* `time` — 剩余持续时间
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

## type

```lua
string
```


# Buff.AddData
## ability

```lua
Ability
```

关联技能
## key

```lua
py.ModifierKey
```

魔法效果id
## pulse

```lua
number
```

心跳周期
## source

```lua
Unit
```

来源单位
## stacks

```lua
integer
```

层数
## time

```lua
number
```

持续时间

# Camera
## camera_shake

```lua
function Camera.camera_shake(player: Player, strength: number, speed: number, time: number, shake_type: integer)
```

镜头摇晃镜头

@*param* `player` — 玩家

@*param* `strength` — 晃动幅度

@*param* `speed` — 速率

@*param* `time` — 持续时间

@*param* `shake_type` — 震动模式
## camera_shake_with_decay

```lua
function Camera.camera_shake_with_decay(player: Player, shake: number, attenuation: number, frequency: number, time: number, shake_type: integer)
```

镜头带衰减震动

@*param* `player` — 玩家

@*param* `shake` — 震动幅度

@*param* `attenuation` — 衰减

@*param* `frequency` — 频率

@*param* `time` — 持续时间

@*param* `shake_type` — 震动模式
## cancel_area_limit

```lua
function Camera.cancel_area_limit(player: Player)
```

关闭镜头限制移动

@*param* `player` — 玩家
## cancel_camera_follow_unit

```lua
function Camera.cancel_camera_follow_unit(player: Player)
```

设置镜头取消跟随

@*param* `player` — 玩家
## cancel_tps_follow_unit

```lua
function Camera.cancel_tps_follow_unit(player: Player)
```

取消镜头第三人称跟随单位

@*param* `player` — 玩家
## create_camera

```lua
function Camera.create_camera(point: Point, focal_length: number, focal_height: number, yaw: number, pitch: number, range_of_visibility: number)
  -> Camera
```

创建镜头

@*param* `point` — 镜头所在点

@*param* `focal_length` — 焦距

@*param* `focal_height` — 焦点高度

@*param* `yaw` — 镜头的yaw

@*param* `pitch` — 镜头的pitch

@*param* `range_of_visibility` — 远景裁切范围
## disable_camera_move

```lua
function Camera.disable_camera_move(player: Player)
```

禁止玩家镜头移动

@*param* `player` — 玩家
## enable_camera_move

```lua
function Camera.enable_camera_move(player: Player)
```

允许玩家镜头移动

@*param* `player` — 玩家
## get_by_handle

```lua
function Camera.get_by_handle(py_camera: integer)
  -> camera: Camera
```

## get_camera_center_raycast

```lua
function Camera.get_camera_center_raycast(player: Player)
  -> 摄像机中心射线的碰撞点: Point
```

 获取玩家摄像机中心射线的碰撞点。
 必须先设置 `y3.config.sync.camera = true`

@*param* `player` — 玩家
## get_player_camera_direction

```lua
function Camera.get_player_camera_direction(player: Player)
  -> 摄像机朝向: Point
```

 获取玩家摄像机朝向。
 必须先设置 `y3.config.sync.camera = true`

@*param* `player` — 玩家
## handle

```lua
integer
```

## is_camera_playing_timeline

```lua
function Camera.is_camera_playing_timeline(player: Player)
  -> 是否正在播放动画: boolean
```

玩家镜头是否正在播放动画

@*param* `player` — 玩家
## limit_in_rectangle_area

```lua
function Camera.limit_in_rectangle_area(player: Player, area: Area)
```

限制镜头移动范围

@*param* `player` — 玩家

@*param* `area` — 移动范围区域
## linear_move_by_time

```lua
function Camera.linear_move_by_time(player: Player, point: Point, time: number, move_type: integer)
```

线性移动（时间）

@*param* `player` — 玩家

@*param* `point` — 目标点

@*param* `time` — 过渡时间

@*param* `move_type` — 移动模式
## look_at_point

```lua
function Camera.look_at_point(player: Player, point: Point, time: number)
```

设置镜头朝向点

@*param* `player` — 玩家

@*param* `point` — 目标点

@*param* `time` — 过渡时间
## play_camera_timeline

```lua
function Camera.play_camera_timeline(player: Player, camera_timeline_id: py.CamlineID)
```

播放镜头动画

@*param* `player` — 玩家

@*param* `camera_timeline_id` — 镜头动画ID
## set_camera_follow_unit

```lua
function Camera.set_camera_follow_unit(player: Player, unit: Unit, x: number, y: number, height: number)
```

设置镜头跟随单位

@*param* `player` — 玩家

@*param* `unit` — 目标单位

@*param* `x` — 过渡时间

@*param* `y` — 移动模式

@*param* `height` — 高度
## set_distance

```lua
function Camera.set_distance(player: Player, value: number, time: number)
```

设置焦点距离

@*param* `player` — 玩家

@*param* `value` — 值

@*param* `time` — 过渡时间
## set_focus_height

```lua
function Camera.set_focus_height(player: Player, value: number, time: number)
```

设置镜头焦点高度

@*param* `player` — 玩家

@*param* `value` — 值

@*param* `time` — 过渡时间
## set_keyboard_move_camera_speed

```lua
function Camera.set_keyboard_move_camera_speed(player: Player, speed: number)
```

设置镜头移动速度（键盘）

@*param* `player` — 玩家

@*param* `speed` — 移动速度
## set_max_distance

```lua
function Camera.set_max_distance(player: Player, value: number)
```

设置镜头高度上限

@*param* `player` — 玩家

@*param* `value` — 高度上限
## set_mouse_move_camera_speed

```lua
function Camera.set_mouse_move_camera_speed(player: Player, speed: number)
```

设置镜头移动速度（鼠标）

@*param* `player` — 玩家

@*param* `speed` — 移动速度
## set_moving_with_mouse

```lua
function Camera.set_moving_with_mouse(player: Player, state: boolean)
```

设置是否可以鼠标移动镜头

@*param* `player` — 玩家

@*param* `state` — 开关
## set_rotate

```lua
function Camera.set_rotate(player: Player, angle_type: py.CameraRotate, value: number, time: number)
```

设置镜头角度

@*param* `player` — 玩家

@*param* `angle_type` — 角度类型

@*param* `value` — 值

@*param* `time` — 过渡时间
## set_tps_follow_unit

```lua
function Camera.set_tps_follow_unit(player: Player, unit: Unit, sensitivity?: number, yaw?: number, pitch?: number, x_offset?: number, y_offset?: number, z_offset?: number, camera_distance?: number)
```

设置镜头第三人称跟随单位

@*param* `player` — 玩家

@*param* `unit` — 目标单位

@*param* `sensitivity` — 灵敏度

@*param* `yaw` — yaw

@*param* `pitch` — pitch

@*param* `x_offset` — 偏移量X

@*param* `y_offset` — 偏移量Y

@*param* `z_offset` — 偏移高度

@*param* `camera_distance` — 距离焦点距离
## show_tps_mode_mouse

```lua
function Camera.show_tps_mode_mouse(player: Player, switch: boolean)
```

设置TPS视角鼠标显示

@*param* `player` — 玩家

@*param* `switch` — 是否显示鼠标
## stop_camera_timeline

```lua
function Camera.stop_camera_timeline(player: Player)
```

停止镜头动画

@*param* `player` — 玩家
## type

```lua
string
```


# Cast
## ability

```lua
Ability
```

## cast_id

```lua
integer
```

## get

```lua
function Cast.get(ability: Ability, cast_id: integer)
  -> Cast
```

## get_ability

```lua
(method) Cast:get_ability()
  -> Ability
```

 获取技能
## get_angle

```lua
(method) Cast:get_angle()
  -> number
```

 获取施法方向
## get_target_destructible

```lua
(method) Cast:get_target_destructible()
  -> Destructible?
```

 获取施法目标可破坏物
## get_target_item

```lua
(method) Cast:get_target_item()
  -> Item?
```

 获取施法目标物品
## get_target_point

```lua
(method) Cast:get_target_point()
  -> Point?
```

 获取施法目标点
## get_target_unit

```lua
(method) Cast:get_target_unit()
  -> Unit?
```

 获取施法目标单位
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


# Class
## declare

```lua
function Class.declare(name: <T>, super?: string)
  -> <T:string>
  2. Class.Config
```

 定义一个类
## delete

```lua
function Class.delete(obj: table)
```

 析构一个实例
## extends

```lua
function Class.extends(name: <Class>, extendsName: <Extends>, init?: fun(self: <Class:string>, super: <Extends:string>, ...any))
```

## get

```lua
function Class.get(name: <T>)
  -> <T:string>
```

 获取一个类
## getConfig

```lua
function Class.getConfig(name: string)
  -> Class.Config
```

## isValid

```lua
function Class.isValid(obj: table)
  -> boolean
```

 判断一个实例是否有效
## new

```lua
function Class.new(name: <T>, tbl?: table)
  -> <T:string>
```

 实例化一个类
## runDel

```lua
function Class.runDel(obj: table, name: string)
```

## runInit

```lua
function Class.runInit(obj: table, name: string, ...any)
```

## setErrorHandler

```lua
function Class.setErrorHandler(errorHandler: fun(msg: string))
```

## super

```lua
function Class.super(name: string)
  -> fun(...any)
```

## type

```lua
function Class.type(obj: table)
  -> string?
```

 获取类的名称

# Class.Base

# Class.Config
## extends

```lua
(method) Class.Config:extends(extendsName: <Extends>, init?: fun(self: unknown, super: <Extends:string>))
```

## extendsCalls

```lua
Class.Extends.CallData[]
```

## extendsMap

```lua
table<string, boolean>
```

## getter

```lua
table<any, fun(obj: any)>
```

## initCalls

```lua
(fun(...any)[]|false)?
```

## name

```lua
string
```

## super

```lua
(method) Class.Config:super(name: string)
  -> fun(...any)
```

## superCache

```lua
table<string, fun(...any)>
```

## superClass

```lua
(Class.Base)?
```


# Class.Extends.CallData

```lua
{ name: string, init: fun(self: any, super: fun(...any), ...any)? }
```


# Command
## commands

```lua
{ [string]: fun(...any) }
```

## execute

```lua
function Command.execute(command: string, ...any)
```

 执行作弊指令
## register

```lua
function Command.register(command: string, callback: fun(...any))
```

 注册作弊指令（指令名称无视大小写）

# Config
## debug

```lua
string
```

 是否是debug模式
## log

```lua
unknown
```

 日志相关的配置
## sync

```lua
unknown
```

 同步相关的配置，当设置为 `true` 后将启用同步，
 会产生额外的流量。  
 同步需要一定的时间，获取到的是一小段时间前的状态，
 因此启用同步后不能立即获取状态。  

# Config.Log
## level

```lua
Log.Level
```

日志等级，默认为 `debug`
## logger

```lua
fun(level: Log.Level, message: string, timeStamp: string):boolean
```

自定义的日志处理函数，返回 `true` 将阻止默认的日志处理。在处理函数的执行过程中会屏蔽此函数。
## toDialog

```lua
boolean
```

是否打印到Dialog窗口，默认为 `true`
## toGame

```lua
boolean
```

是否打印到游戏窗口中，默认为 `false`

# Config.Sync
 同步相关的配置，当设置为 `true` 后将启用同步，
 会产生额外的流量。  
 同步需要一定的时间，获取到的是一小段时间前的状态，
 因此启用同步后不能立即获取状态。  ## camera

```lua
boolean
```

同步玩家的镜头
## key

```lua
boolean
```

同步玩家的键盘与鼠标按键
## mouse

```lua
boolean
```

同步玩家的鼠标位置

# CustomEvent
## custom_event_manager

```lua
EventManager?
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
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any[], ...any)
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


# DamageInstance
## data

```lua
EventParam.单位-受到伤害后
```

## get_ability

```lua
(method) DamageInstance:get_ability()
  -> Ability?
```

 获取关联技能
## get_damage

```lua
(method) DamageInstance:get_damage()
  -> number
```

 获取当前伤害
## is_missed

```lua
(method) DamageInstance:is_missed()
  -> boolean
```

 获取当前伤害是否闪避
## mode

```lua
'伤害前'|'伤害后'|'伤害时'
```

## set_damage

```lua
(method) DamageInstance:set_damage(damage: number)
```

 修改当前伤害
## set_missed

```lua
(method) DamageInstance:set_missed(missed: boolean)
```

 设置当前伤害是否闪避

# Destructible
## add_height

```lua
(method) Destructible:add_height(height: number)
```

增加高度

@*param* `height` — 高度
## add_hp

```lua
(method) Destructible:add_hp(value: number)
```

@*param* `value` — 生命值

增加当前生命值
## add_max_hp

```lua
(method) Destructible:add_max_hp(value: number)
```

@*param* `value` — 生命值

增加最大生命值
## add_max_resource

```lua
(method) Destructible:add_max_resource(value: number)
```

@*param* `value` — 资源数

增加最大资源数
## add_resource

```lua
(method) Destructible:add_resource(value: number)
```

@*param* `value` — 资源数

增加当前资源数
## add_tag

```lua
(method) Destructible:add_tag(tag: string)
```

增加标签

@*param* `tag` — 标签
## can_be_ability_target

```lua
(method) Destructible:can_be_ability_target()
  -> is_lockable: boolean
```

可破坏物能否被技能指示器选中

@*return* `is_lockable` — 能否被选中
## can_be_attacked

```lua
(method) Destructible:can_be_attacked()
  -> is_attackable: boolean
```

可破坏物能否被攻击

@*return* `is_attackable` — 能否被攻击
## can_be_collected

```lua
(method) Destructible:can_be_collected()
  -> is_collectable: boolean
```

可破坏物能否被采集

@*return* `is_collectable` — 能否被选中
## can_be_selected

```lua
(method) Destructible:can_be_selected()
  -> is_selectable: boolean
```

可破坏物能否被选中

@*return* `is_selectable` — 能否被选中
## cancel_replace_model

```lua
(method) Destructible:cancel_replace_model(model_id: py.ModelKey)
```

取消替换模型

@*param* `model_id` — 模型id
## create_destructible

```lua
function Destructible.create_destructible(type_id: py.DestructibleKey, point: Point, angle: number, scale_x?: number, scale_y?: number, scale_z?: number, height?: number)
  -> destructible: Destructible
```

创建可破坏物

@*param* `type_id` — 可破坏物类型id

@*param* `point` — 创建到点

@*param* `angle` — 面向角度

@*param* `scale_x` — 缩放x

@*param* `scale_y` — 缩放y

@*param* `scale_z` — 缩放z

@*param* `height` — 高度

@*return* `destructible` — 可破坏物
## event

```lua
fun(self: Destructible, event: "可破坏物-创建", callback: fun(trg: Trigger, data: EventParam.可破坏物-创建)):Trigger
```

## get_by_handle

```lua
function Destructible.get_by_handle(py_destructible: py.Destructible)
  -> Destructible
```

通过py层的可破坏物实例获取lua层的可破坏物对象
## get_by_id

```lua
function Destructible.get_by_id(id: py.DestructibleID)
  -> Destructible
```

 通过可破坏物的唯一ID获取lua的可破坏物对象
## get_description

```lua
(method) Destructible:get_description()
  -> description: string
```

获取可破坏物描述

@*return* `description` — 描述
## get_description_by_key

```lua
function Destructible.get_description_by_key(key: py.DestructibleKey)
  -> description: string
```

获取可破坏物类型的描述

@*param* `key` — 类型id

@*return* `description` — 描述
## get_facing

```lua
(method) Destructible:get_facing()
  -> rotation: number
```

获取可破坏物的面向角度

@*return* `rotation` — 面向角度
## get_height

```lua
(method) Destructible:get_height()
  -> height: number
```

获取可破坏物的高度

@*return* `height` — 高度
## get_hp

```lua
(method) Destructible:get_hp()
  -> cur_hp: number
```

获取可破坏物的生命值

@*return* `cur_hp` — 生命值
## get_id

```lua
(method) Destructible:get_id()
  -> integer
```

 获取唯一ID
## get_item_type

```lua
(method) Destructible:get_item_type()
  -> item_key: py.ItemKey
```

获取可破坏物的物品类型ID

@*return* `item_key` — 物品类型ID
## get_key

```lua
(method) Destructible:get_key()
  -> type: py.DestructibleKey
```

获取可破坏物类型

@*return* `type` — 可破坏物类型
## get_max_hp

```lua
(method) Destructible:get_max_hp()
  -> hp: number
```

获取可破坏物的生命值

@*return* `hp` — 可破坏物的生命值
## get_max_resource

```lua
(method) Destructible:get_max_resource()
  -> max_number: number
```

获取可破坏物的最大资源数

@*return* `max_number` — 最大资源数
## get_model

```lua
(method) Destructible:get_model()
  -> model_key: py.ModelKey
```

获取可破坏物的模型

@*return* `model_key` — 模型id
## get_model_by_type

```lua
function Destructible.get_model_by_type(key: py.DestructibleKey)
  -> model: py.ModelKey
```

获取可破坏物类型的模型

@*param* `key` — 类型id

@*return* `model` — 模型id
## get_name

```lua
(method) Destructible:get_name()
  -> name: string
```

获取可破坏物的名称

@*return* `name` — 可破坏物的名称
## get_name_by_key

```lua
function Destructible.get_name_by_key(key: py.DestructibleKey)
  -> name: string
```

获取可破坏物类型的名称

@*param* `key` — 类型id

@*return* `name` — 名称
## get_position

```lua
(method) Destructible:get_position()
  -> point: Point
```

获取可破坏物对象的位置

@*return* `point` — 可破坏物的位置
## get_resource

```lua
(method) Destructible:get_resource()
  -> source_number: number
```

获取可破坏物的当前资源数

@*return* `source_number` — 当前资源数
## get_resource_name

```lua
(method) Destructible:get_resource_name()
  -> source_name: string
```

获取可破坏物的资源名称

@*return* `source_name` — 资源名称
## get_resource_type

```lua
(method) Destructible:get_resource_type()
  -> player_res_key: py.RoleResKey
```

获取可破坏物的玩家属性名

@*return* `player_res_key` — 玩家属性
## handle

```lua
py.Destructible
```

可破坏物对象
## id

```lua
integer
```

## is_alive

```lua
(method) Destructible:is_alive()
  -> is_alive: boolean
```

可破坏物是否存活

@*return* `is_alive` — 是否存活
## is_exist

```lua
(method) Destructible:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## is_visible

```lua
(method) Destructible:is_visible()
  -> is_visible: boolean
```

可破坏物是否可见

@*return* `is_visible` — 是否可见
## kill

```lua
(method) Destructible:kill(killer_unit: Unit)
```

@*param* `killer_unit` — 凶手

杀死可破坏物
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
```
## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## object_event_manager

```lua
EventManager?
```

## pick

```lua
function Destructible.pick(area: Area)
  -> Destructible[]
```

遍历区域中的所有可破坏物

@*param* `area` — 区域对象
## pick_in_shape

```lua
function Destructible.pick_in_shape(point: Point, shape: Shape)
  -> destructible_list: table
```

@*param* `point` — 点

@*param* `shape` — 区域

@*return* `destructible_list` — 可破坏物列表

获取不同形状范围内的可破坏物列表
## play_animation

```lua
(method) Destructible:play_animation(anim_name: string, start_time: number, end_time: number, is_loop: boolean, speed: number)
```

播放动画

@*param* `anim_name` — 动画名字

@*param* `start_time` — 开始时间

@*param* `end_time` — 结束时间

@*param* `is_loop` — 是否循环

@*param* `speed` — 速度
## reborn

```lua
(method) Destructible:reborn()
```

复活可破坏物
## ref_manager

```lua
unknown
```

## remove

```lua
(method) Destructible:remove()
```

删除可破坏物
## remove_tag

```lua
(method) Destructible:remove_tag(tag: string)
```

移除标签

@*param* `tag` — 标签
## replace_model

```lua
(method) Destructible:replace_model(model_id: py.ModelKey)
```

替换模型

@*param* `model_id` — 模型id
## set_can_be_ability_target

```lua
(method) Destructible:set_can_be_ability_target(can_be_ability_target: boolean)
```

设置能否被技能指示器锁定

@*param* `can_be_ability_target` — 能否被技能指示器锁定
## set_can_be_attacked

```lua
(method) Destructible:set_can_be_attacked(is_attackable: boolean)
```

设置能否被攻击

@*param* `is_attackable` — 能否被攻击
## set_can_be_collected

```lua
(method) Destructible:set_can_be_collected(is_collectable: boolean)
```

设置能否被采集

@*param* `is_collectable` — 能否被采集
## set_can_be_selected

```lua
(method) Destructible:set_can_be_selected(is_selectable: boolean)
```

设置能否被选中

@*param* `is_selectable` — 能否被选中
## set_description

```lua
(method) Destructible:set_description(description: string)
```

@*param* `description` — 描述

设置描述
## set_facing

```lua
(method) Destructible:set_facing(angle: number)
```

设置朝向

@*param* `angle` — 朝向角度
## set_height

```lua
(method) Destructible:set_height(height: number)
```

设置高度

@*param* `height` — 高度
## set_hp

```lua
(method) Destructible:set_hp(value: number)
```

设置生命值

@*param* `value` — 生命值
## set_max_hp

```lua
(method) Destructible:set_max_hp(value: number)
```

@*param* `value` — 生命值

设置最大生命值
## set_max_resource

```lua
(method) Destructible:set_max_resource(value: number)
```

@*param* `value` — 资源数

设置最大资源数
## set_name

```lua
(method) Destructible:set_name(name: string)
```

@*param* `name` — 名字

设置名称
## set_point

```lua
(method) Destructible:set_point(point: Point)
```

移动到点

@*param* `point` — 目标点
## set_resource

```lua
(method) Destructible:set_resource(value: number)
```

@*param* `value` — 资源数

设置当前资源数
## set_scale

```lua
(method) Destructible:set_scale(x: number, y: number, z: number)
```

设置缩放

@*param* `x` — x轴缩放

@*param* `y` — y轴缩放

@*param* `z` — z轴缩放
## set_visible

```lua
(method) Destructible:set_visible(is_visible: boolean)
```

显示/隐藏

@*param* `is_visible` — 是否显示
## stop_animation

```lua
(method) Destructible:stop_animation(anim_name: string)
```

停止动画

@*param* `anim_name` — 动画名字
## subscribe_event

```lua
(method) ObjectEvent:subscribe_event(event_name: string, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```

## type

```lua
string
```


# Doctor
## catch

```lua
function
```

 遍历虚拟机，寻找对象的引用。
 输入既可以是对象实体，也可以是对象的描述（从其他接口的返回值中复制过来）。
 返回字符串数组的数组，每个字符串描述了如何从根节点引用到指定的对象。
 可以同时查找多个对象。
## compare

```lua
function
```

 比较2个报告
## enableCache

```lua
function
```

 是否启用缓存，启用后会始终使用第一次查找的结果，
 适用于连续查找引用。如果想要查找新的引用需要先关闭缓存。
## exclude

```lua
function
```

 在进行快照相关操作时排除掉的对象。
 你可以用这个功能排除掉一些数据表。
## flushCache

```lua
function
```

 立即清除缓存
## ignoreMainThread

```lua
function
```

 是否忽略主线程的栈
## report

```lua
function
```

 生成一个内存快照的报告。
 你应当将其输出到一个文件里再查看。
## snapshot

```lua
function
```

 获取内存快照，生成一个内部数据结构。
 一般不用这个API，改用 report 或 catch。

# Doctor.Report

```lua
{ point: string, count: integer, name: string, childs: integer }
```


# Dump
## decode

```lua
function Dump.decode(bin: string)
  -> any
```

 反序列化数据
## decodeHook

```lua
function Dump.decodeHook(value: any)
  -> unknown
```

## encode

```lua
function Dump.encode(data: Serialization.SupportTypes)
  -> string
```

 序列化数据
## encodeHook

```lua
function Dump.encodeHook(value: any)
  -> table|nil
```


# ECABind

# ECAFunction
## call

```lua
(method) ECAFunction:call(func: function)
```

执行的函数
## call_name

```lua
string
```

## func

```lua
function
```

## params

```lua
{ key: string, type: string, optional: boolean }[]
```

## returns

```lua
{ key: string, type: string }[]
```

## with_param

```lua
(method) ECAFunction:with_param(key: string, type_name: string)
  -> ECAFunction
```

添加参数
## with_return

```lua
(method) ECAFunction:with_return(key: string, type_name: string)
  -> ECAFunction
```

添加返回值

# Editor.Object
 物体编辑器## ability

```lua
unknown
```

## buff

```lua
unknown
```

## callMethod

```lua
function Editor.Object.callMethod(otype: string, mname: string, key: any, lock_obj: any, arg1: any, arg2: any)
```

## call_stack_map

```lua
table
```

## item

```lua
unknown
```

## lock_count_map

```lua
table
```

## unit

```lua
unknown
```


# Editor.Object.Ability
## data

```lua
Object.Ability
```

Class.Base
## data_key

```lua
string
```

## key

```lua
py.AbilityKey
```

技能编号
## new

```lua
(method) Editor.Object.Ability:new()
  -> Editor.Object.Ability
```

以此技能为模板创建新的技能物编
## on_add

```lua
fun(ability: Ability)
```

技能获得后执行
## on_can_cast

```lua
fun(ability: Ability, cast: Cast)
```

技能即将施法时执行
## on_cast_channel

```lua
fun(ability: Ability, cast: Cast)
```

技能引导施法时执行
## on_cast_finish

```lua
fun(ability: Ability, cast: Cast)
```

技能完成施法时执行
## on_cast_shot

```lua
fun(ability: Ability, cast: Cast)
```

技能出手施法时执行
## on_cast_start

```lua
fun(ability: Ability, cast: Cast)
```

技能开始施法时执行
## on_cast_stop

```lua
fun(ability: Ability, cast: Cast)
```

技能停止施法时执行
## on_cooldown

```lua
fun(ability: Ability)
```

技能冷却结束后执行
## on_lose

```lua
fun(ability: Ability)
```

技能失去后执行
## on_upgrade

```lua
fun(ability: Ability)
```

技能升级后执行

# Editor.Object.Buff
## data

```lua
Object.Buff
```

魔法效果的物编数据，你可以从里面读取或修改任意物编  
> 警告：请确保数据类型正确，否则可能导致崩溃  
> 警告：如果创建过此魔法效果再修改数据，行为是未定义的
## data_key

```lua
string
```

## key

```lua
py.ModifierKey
```

效果编号
## new

```lua
(method) Editor.Object.Buff:new()
  -> Editor.Object.Buff
```

以此魔法效果为模板创建新的魔法效果物编
## on_add

```lua
fun(buff: Buff)
```

效果获得后执行
## on_can_add

```lua
fun(buff: Buff)
```

效果即将获得时执行
## on_lose

```lua
fun(buff: Buff)
```

效果失去后执行
## on_pulse

```lua
fun(buff: Buff)
```

效果心跳后执行

# Editor.Object.DataModule
## data_key

```lua
string
```


# Editor.Object.Item
## data

```lua
Object.Item
```

物品的物编数据，你可以从里面读取或修改任意物编  
> 警告：请确保数据类型正确，否则可能导致崩溃  
> 警告：如果创建过此物品再修改数据，行为是未定义的
## data_key

```lua
string
```

## key

```lua
py.ItemKey
```

物品编号
## new

```lua
(method) Editor.Object.Item:new()
  -> Editor.Object.Item
```

以此物品为模板创建新的物品物编
## on_add

```lua
fun(item: Item)
```

物品获得后执行
## on_create

```lua
fun(item: Item)
```

物品创建后执行
## on_lose

```lua
fun(item: Item)
```

物品失去后执行
## on_remove

```lua
fun(item: Item)
```

物品移除后执行

# Editor.Object.Unit
## data

```lua
Object.Unit
```

单位的物编数据，你可以从里面读取或修改任意物编  
> 警告：请确保数据类型正确，否则可能导致崩溃  
> 警告：如果创建过此单位再修改数据，行为是未定义的
## data_key

```lua
string
```

## key

```lua
py.UnitKey
```

单位编号
## new

```lua
(method) Editor.Object.Unit:new()
  -> Editor.Object.Unit
```

以此单位为模板创建新的单位物编
## on_create

```lua
fun(unit: Unit)
```

单位创建后执行
## on_dead

```lua
fun(unit: Unit)
```

单位死亡后执行
## on_remove

```lua
fun(unit: Unit)
```

单位移除后执行

# Enum
## SfxVisibleType

```lua
table
```

## UnitCommandTypeEnum

```lua
table
```


# Enum.SfxVisibleType
None
# Enum.UnitCommandTypeEnum
None
# Event
## add_trigger

```lua
(method) Event:add_trigger(trigger: Trigger)
```

## check_waiting

```lua
(method) Event:check_waiting()
```

## dispatch

```lua
(method) Event:dispatch(event_args?: any[], ...any)
  -> any
  2. any
  3. any
  4. any
```

## event_name

```lua
Event.Name
```

## fire_lock

```lua
integer
```

## has_matched_trigger

```lua
(method) Event:has_matched_trigger(args: any[])
  -> boolean
```

## is_firing

```lua
(method) Event:is_firing()
  -> boolean
```

## notify

```lua
(method) Event:notify(event_args?: any[], ...any)
```

## pairs

```lua
(method) Event:pairs()
  -> fun():Trigger
```

## remove_trigger

```lua
(method) Event:remove_trigger(trigger: Trigger)
```

## triggers

```lua
LinkedTable
```

## wait_poping

```lua
Trigger[]
```

## wait_pushing

```lua
Trigger[]
```


# Event.Name

```lua
string
```


# EventConfig
## config

```lua
table
```


# EventManager
## check_stack

```lua
(method) EventManager:check_stack()
```

## dispatch

```lua
(method) EventManager:dispatch(event_name: Event.Name, event_args?: any[], ...any)
  -> any
  2. any
  3. any
  4. any
```

## event

```lua
(method) EventManager:event(event_name: Event.Name, event_args?: any[], callback: Trigger.CallBack)
  -> Trigger
```

@*param* `event_name` — Lua框架使用的事件名
## event_map

```lua
table<string, Event>
```

## fire_lock

```lua
integer
```

## has_event

```lua
(method) EventManager:has_event(event_name: Event.Name, event_args?: any[])
  -> boolean
```

## is_firing

```lua
(method) EventManager:is_firing()
  -> boolean
```

## notify

```lua
(method) EventManager:notify(event_name: Event.Name, event_args?: any[], ...any)
```

## object

```lua
table
```

## pairs

```lua
(method) EventManager:pairs()
  -> fun():Trigger?
```

## stack_list

```lua
LinkedTable?
```

## stack_notify

```lua
(method) EventManager:stack_notify(event_name: Event.Name, event_args?: any[], ...any)
```


# GCHost

# GCNode
## onDel

```lua
any
```


# Game
## clear_table

```lua
function Game.clear_table(table: any)
```

清空表
## close_role_micro_unit

```lua
function Game.close_role_micro_unit(player: Player)
```

关闭玩家的附近语音聊天

@*param* `player` — 玩家
## create_day_night_human_time

```lua
function Game.create_day_night_human_time(time: number, dur: number)
```

创建人造时间

@*param* `time` — 时间

@*param* `dur` — 持续时间
## current_game_run_time

```lua
function Game.current_game_run_time()
  -> time: number
```

游戏已运行的时间

@*return* `time` — 时间
## custom_event_manager

```lua
EventManager?
```

## enable_grass_by_pos

```lua
function Game.enable_grass_by_pos(is_on: boolean, point: Point)
```

开关目标点的草丛

@*param* `is_on` — 开关

@*param* `point` — 点
## enable_soft_pause

```lua
function Game.enable_soft_pause()
```

开启软暂停
## encrypt_table

```lua
function Game.encrypt_table(tab: table)
```

加密表

@*param* `tab` — 表
## end_player_game

```lua
function Game.end_player_game(player: Player, result: string, is_show: boolean)
```

结束玩家游戏

@*param* `player` — 玩家

@*param* `result` — 结果

@*param* `is_show` — 是否展示界面
## event

```lua
fun(self: Game, event: "游戏-初始化", callback: fun(trg: Trigger, data: EventParam.游戏-初始化)):Trigger
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
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any[], ...any)
  -> any
  2. any
  3. any
  4. any
```

 发起带事件参数的自定义事件（回执模式）
## event_manager

```lua
unknown
```

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

## get_archive_rank_player_archive_value

```lua
function Game.get_archive_rank_player_archive_value(file: integer, index: integer)
  -> value: integer
```

获取整数存档排行榜玩家存档值

@*param* `file` — 存档

@*param* `index` — 序号

@*return* `value` — 存档值
## get_camp_by_id

```lua
function Game.get_camp_by_id(id: py.CampID)
  -> py.Camp
```

获得阵营

@*param* `id` — 阵营id
## get_compound_attributes

```lua
function Game.get_compound_attributes(primary_attribute: string, secondary_attr: string)
  -> coefficient: number
```

获取三维属性的影响系数

@*param* `primary_attribute` — 一级属性

@*param* `secondary_attr` — 二级属性

@*return* `coefficient` — 系数
## get_current_game_mode

```lua
function Game.get_current_game_mode()
  -> game_mode: py.GameMode
```

获取当前游戏模式

@*return* `game_mode` — 游戏模式
## get_damage_ratio

```lua
function Game.get_damage_ratio(attack_type: integer, area_type: integer)
  -> factor: number
```

获取伤害系数

@*param* `attack_type` — 攻击类型

@*param* `area_type` — 护甲类型

@*return* `factor` — 伤害系数
## get_day_night_time

```lua
function Game.get_day_night_time()
  -> time: number
```

获取游戏当前时间

@*return* `time` — 时间
## get_event_manager

```lua
(method) Game:get_event_manager()
  -> EventManager
```

## get_game_init_time_stamp

```lua
function Game.get_game_init_time_stamp()
  -> time_stamp: integer
```

获取游戏开始时间戳

@*return* `time_stamp` — 时间戳
## get_game_x_resolution

```lua
function Game.get_game_x_resolution()
  -> x_resolution: integer
```

获取初始化横向分辨率

@*return* `x_resolution` — 横向分辨率
## get_game_y_resolution

```lua
function Game.get_game_y_resolution()
  -> y_resolution: integer
```

获取初始化纵向分辨率

@*return* `y_resolution` — 纵向分辨率
## get_global_archive

```lua
function Game.get_global_archive(name: string)
  -> archive: integer
```

获取全局存档

@*param* `name` — 存档名

@*return* `archive` — 存档
## get_global_weather

```lua
function Game.get_global_weather()
  -> weather: integer
```

获取全局天气

@*return* `weather` — 天气
## get_graphics_quality

```lua
function Game.get_graphics_quality()
  -> quality: 'high'|'low'|'medium'
```

获取初始化游戏画质

@*return* `quality` — 画质

```lua
quality:
    | 'low'
    | 'medium'
    | 'high'
```
## get_icon_id

```lua
function Game.get_icon_id(id: integer)
  -> texture: py.Texture
```

根据图片ID获取图片
## get_point_texture

```lua
function Game.get_point_texture(point: Point)
  -> integer
```

获取地形纹理

@*param* `point` — 点
## get_start_mode

```lua
function Game.get_start_mode()
  -> game_mode: integer
```

获取本局游戏环境

@*return* `game_mode` — 游戏环境，1是编辑器，2是平台
## get_table

```lua
function Game.get_table(name: string)
  -> tb: table
```

获取表

@*param* `name` — 表名

@*return* `tb` — 表
## get_tech_description

```lua
function Game.get_tech_description(tech_id: py.TechKey)
  -> description: string
```

获取科技类型的描述

@*param* `tech_id` — 科技类型

@*return* `description` — 描述
## get_tech_icon

```lua
function Game.get_tech_icon(tech_id: py.TechKey, index: integer)
  -> texture: py.Texture
```

获取科技图标

@*param* `tech_id` — 科技

@*param* `index` — 等级

@*return* `texture` — 图标id
## get_tech_max_level

```lua
function Game.get_tech_max_level(tech_id: py.TechKey)
  -> level: integer
```

获取科技最大等级

@*param* `tech_id` — 科技id

@*return* `level` — 最大等级
## get_tech_name

```lua
function Game.get_tech_name(tech_id: py.TechKey)
  -> name: string
```

获取科技类型的名称

@*param* `tech_id` — 科技类型

@*return* `name` — 名称
## get_window_mode

```lua
function Game.get_window_mode()
  -> mode: 'full_screen'|'window_mode'|'window_mode_full_screen'
```

获取窗口化类别

@*return* `mode` — 窗口化类别

```lua
mode:
    | 'full_screen'
    | 'window_mode'
    | 'window_mode_full_screen'
```
## is_compound_attributes_enabled

```lua
function Game.is_compound_attributes_enabled()
  -> is_open: boolean
```

是否开启三维属性

@*return* `is_open` — 是否开启
## is_debug_mode

```lua
function Game.is_debug_mode()
  -> boolean
```

 是否是调试模式
## locale

```lua
function Game.locale(key: string)
  -> 多语言内容: string
```

获取多语言内容

@*param* `key` — 多语言key
## modify_point_texture

```lua
function Game.modify_point_texture(point: Point, terrain_type: integer, range: integer, area_type: integer)
```

设置某点的地形纹理

@*param* `point` — 点

@*param* `terrain_type` — 纹理类型

@*param* `range` — 范围

@*param* `area_type` — 形状
## pause_game

```lua
function Game.pause_game()
```

暂停游戏
## reg_sound_area

```lua
function Game.reg_sound_area(area: Area)
```

注册区域的附近语音频道

@*param* `area` — 区域
## remove_ability_kv

```lua
function Game.remove_ability_kv(ability_key: py.AbilityKey, key: string)
```

清除技能类型键值

@*param* `ability_key` — 技能id

@*param* `key` — 键
## remove_item_kv

```lua
function Game.remove_item_kv(item_key: py.ItemKey, key: string)
```

清除物品类型键值

@*param* `item_key` — 物品id

@*param* `key` — 键
## remove_unit_kv

```lua
function Game.remove_unit_kv(unit_key: py.UnitKey, key: string)
```

清除单位类型键值

@*param* `unit_key` — 单位id

@*param* `key` — 键
## replace_area_texture

```lua
function Game.replace_area_texture(area: Area, old_texture: integer, new_texture: integer)
```

替换地形纹理

@*param* `area` — 区域

@*param* `old_texture` — 纹理类型

@*param* `new_texture` — 纹理类型
## restart_game

```lua
function Game.restart_game(fast_restart: boolean)
```

开始新一轮游戏

@*param* `fast_restart` — 快速重置
## resume_soft_pause

```lua
function Game.resume_soft_pause()
```

恢复软暂停
## send_custom_event

```lua
function Game.send_custom_event(id: integer, table: table)
```

 发送自定义事件给ECA

@*param* `id` — 事件id

@*param* `table` — 事件数据
## send_signal

```lua
function Game.send_signal(player: Player, signal_enum: y3.Const.SignalType, point: Point, visible_enum: y3.Const.VisibleType)
```

发送信号

@*param* `player` — 玩家

@*param* `signal_enum` — 信号枚举值

@*param* `point` — 点

@*param* `visible_enum` — 可见性枚举值
## set_area_weather

```lua
function Game.set_area_weather(area: Area, weather: integer)
```

设置区域天气

@*param* `area` — 区域

@*param* `weather` — 天气
## set_cascaded_shadow_distanc

```lua
function Game.set_cascaded_shadow_distanc(distance: number)
```

设置阴影距离

@*param* `distance` — 距离
## set_cascaded_shadow_distance

```lua
function Game.set_cascaded_shadow_distance(dis: number)
```

设置阴影距离

@*param* `dis` — 距离
## set_cascaded_shadow_enable

```lua
function Game.set_cascaded_shadow_enable(is_enable: boolean)
```

开关级联阴影

@*param* `is_enable` — 开关
## set_compound_attributes

```lua
function Game.set_compound_attributes(primary_attribute: string, secondary_attr: string, value: number)
```

设置复合属性

@*param* `primary_attribute` — 一级属性

@*param* `secondary_attr` — 二级属性

@*param* `value` — 属性值
## set_damage_factor

```lua
function Game.set_damage_factor(attack_type: integer, armor_type: integer, ratio: number)
```

设置伤害系数

@*param* `attack_type` — 攻击类型

@*param* `armor_type` — 护甲类型

@*param* `ratio` — 系数
## set_day_night_speed

```lua
function Game.set_day_night_speed(speed: number)
```

设置游戏时间的流逝速度

@*param* `speed` — 速度
## set_day_night_time

```lua
function Game.set_day_night_time(time: number)
```

设置游戏时间

@*param* `time` — 时间
## set_fog_attr

```lua
function Game.set_fog_attr(fog: table, attr: string, value: number)
```

设置雾效属性(新)

@*param* `fog` — 局部雾

@*param* `attr` — 朝向

@*param* `value` — 位置x
## set_fog_attribute

```lua
function Game.set_fog_attribute(fog: table, direction: number, pos_x: number, pos_y: number, pos_z: number, scale_x: number, scale_y: number, scale_z: number, red: number, green: number, blue: number, concentration: number, speed: number)
```

设置雾效属性

@*param* `fog` — 局部雾

@*param* `direction` — 朝向

@*param* `pos_x` — 位置x

@*param* `pos_y` — 位置y

@*param* `pos_z` — 位置z

@*param* `scale_x` — 缩放x

@*param* `scale_y` — 缩放y

@*param* `scale_z` — 缩放z

@*param* `red` — 颜色r

@*param* `green` — 颜色g

@*param* `blue` — 颜色b

@*param* `concentration` — 浓度

@*param* `speed` — 流速
## set_global_weather

```lua
function Game.set_global_weather(weather: integer)
```

设置全局天气

@*param* `weather` — 天气
## set_globale_view

```lua
function Game.set_globale_view(enable: boolean)
```

 启用全图视野（总是可见的）
## set_jump_word

```lua
function Game.set_jump_word(enable: boolean)
```

关闭localplayer的表现层跳字

@*param* `enable` — 是否关闭
## set_logic_fps

```lua
function Game.set_logic_fps(fps: integer)
```

设置逻辑帧率

@*param* `fps` — 帧率
## set_material_param

```lua
function Game.set_material_param(obj: Unit, mat: integer, r: number, g: number, b: number, intensity: number, alpha: number)
```

设置物体的材质

@*param* `mat` — 材质

@*param* `r` — 红

@*param* `g` — 绿

@*param* `b` — 蓝

@*param* `intensity` — 强度

@*param* `alpha` — 透明度
## set_nearby_micro_switch

```lua
function Game.set_nearby_micro_switch(player: Player, switch: boolean)
```

设置玩家的附近语音聊天发言开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_nearby_sound_switch

```lua
function Game.set_nearby_sound_switch(player: Player, switch: boolean)
```

设置玩家的附近语音聊天收听开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_nearby_voice_mode

```lua
function Game.set_nearby_voice_mode(switch: boolean)
```

设置附近语音的区域模式开关

@*param* `switch` — 是否关闭
## set_object_color

```lua
function Game.set_object_color(obj: Destructible|Item|Unit, r: integer, g: integer, b: integer, a: integer)
```

设置对象基础材质颜色
## set_object_fresnel

```lua
function Game.set_object_fresnel(obj: Destructible|Item|Unit, r?: integer, g?: integer, b?: integer, alpha?: number, exp?: number, strength?: number)
```

设置对象的菲涅尔效果

@*param* `r` — R

@*param* `g` — G

@*param* `b` — B

@*param* `alpha` — alpha

@*param* `exp` — exp

@*param* `strength` — strength
## set_object_fresnel_visible

```lua
function Game.set_object_fresnel_visible(obj: Destructible|Item|Unit, b: boolean)
```

设置对象的菲涅尔效果
## set_post_effect

```lua
function Game.set_post_effect(player: Player, processing: py.PostEffect)
```

为玩家切换画风

@*param* `player` — 玩家

@*param* `processing` — 画风
## set_random_seed

```lua
function Game.set_random_seed(seed: integer)
```

设置随机数种子

@*param* `seed` — 随机种子
## set_role_all_micro_switch

```lua
function Game.set_role_all_micro_switch(player: Player, switch: boolean)
```

设置玩家的所有人语音聊天发言开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_all_sound_switch

```lua
function Game.set_role_all_sound_switch(player: Player, switch: boolean)
```

设置玩家的所有人语音聊天收听开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_camp_micro_switch

```lua
function Game.set_role_camp_micro_switch(player: Player, switch: boolean)
```

设置玩家的同阵营语音聊天发言开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_camp_sound_switch

```lua
function Game.set_role_camp_sound_switch(player: Player, switch: boolean)
```

设置玩家的同阵营语音聊天收听开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## set_role_micro_unit

```lua
function Game.set_role_micro_unit(player: Player, unit: Unit)
```

设置玩家的声音主单位

@*param* `player` — 玩家

@*param* `unit` — 是否关闭
## sfx_switch

```lua
function Game.sfx_switch(player: Player, switch: boolean)
```

特效播放开关

@*param* `player` — 玩家

@*param* `switch` — 是否关闭
## str_to_ability_cast_type

```lua
function Game.str_to_ability_cast_type(str: string)
  -> py.AbilityCastType
```

字符串转技能释放类型

@*param* `str` — 字符串

@*return* — 技能释放类型
## str_to_ability_key

```lua
function Game.str_to_ability_key(str: string)
  -> py.AbilityKey
```

字符串转技能类型

@*param* `str` — 字符串

@*return* — 技能类型
## str_to_ability_type

```lua
function Game.str_to_ability_type(str: string)
  -> py.AbilityType
```

字符串转技能槽位类型

@*param* `str` — 字符串

@*return* — 技能槽位类型
## str_to_audio_key

```lua
function Game.str_to_audio_key(str: string)
  -> py.AudioKey
```

字符串转声音类型

@*param* `str` — 字符串

@*return* — 声音类型
## str_to_camp

```lua
function Game.str_to_camp(str: string)
  -> py.Camp
```

字符串转阵营

@*param* `str` — 字符串

@*return* — 阵营
## str_to_damage_type

```lua
function Game.str_to_damage_type(str: string)
  -> integer
```

字符串转伤害类型

@*param* `str` — 字符串

@*return* — 伤害类型
## str_to_dest_key

```lua
function Game.str_to_dest_key(str: string)
  -> py.DestructibleKey
```

字符串转可破坏物类型

@*param* `str` — 字符串

@*return* — 可破坏物类型
## str_to_item_key

```lua
function Game.str_to_item_key(str: string)
  -> py.ItemKey
```

字符串转物品类型

@*param* `str` — 字符串

@*return* — 物品类型
## str_to_keyboard_key

```lua
function Game.str_to_keyboard_key(str: string)
  -> py.KeyboardKey
```

字符串转键盘按键

@*param* `str` — 字符串

@*return* — 键盘按键
## str_to_link_sfx_key

```lua
function Game.str_to_link_sfx_key(str: string)
  -> py.SfxKey
```

字符串转链接特效

@*param* `str` — 字符串

@*return* — 链接特效
## str_to_model_key

```lua
function Game.str_to_model_key(str: string)
  -> py.ModelKey
```

字符串转模型类型

@*param* `str` — 字符串

@*return* — 模型类型
## str_to_modifier_effect_type

```lua
function Game.str_to_modifier_effect_type(str: string)
  -> py.ModifierEffectType
```

字符串转魔法效果影响类型

@*param* `str` — 字符串

@*return* — 魔法效果影响类型
## str_to_modifier_key

```lua
function Game.str_to_modifier_key(str: string)
  -> py.ModifierKey
```

字符串转魔法效果类型

@*param* `str` — 字符串

@*return* — 魔法效果类型
## str_to_modifier_type

```lua
function Game.str_to_modifier_type(str: string)
  -> py.ModifierType
```

字符串转魔法效果类别

@*param* `str` — 字符串

@*return* — 魔法效果类别
## str_to_mouse_key

```lua
function Game.str_to_mouse_key(str: string)
  -> py.MouseKey
```

字符串转鼠标按键

@*param* `str` — 字符串

@*return* — 鼠标按键
## str_to_mouse_wheel

```lua
function Game.str_to_mouse_wheel(str: string)
  -> py.MouseWheel
```

字符串转鼠标滚轮

@*param* `str` — 字符串

@*return* — 鼠标滚轮
## str_to_particle_sfx_key

```lua
function Game.str_to_particle_sfx_key(str: string)
  -> py.SfxKey
```

字符串转特效

@*param* `str` — 字符串

@*return* — 特效
## str_to_project_key

```lua
function Game.str_to_project_key(str: string)
  -> py.ProjectileKey
```

字符串转投射物类型

@*param* `str` — 字符串

@*return* — 投射物类型
## str_to_role_relation

```lua
function Game.str_to_role_relation(str: string)
  -> py.RoleRelation
```

字符串转玩家关系

@*param* `str` — 字符串

@*return* — 玩家关系
## str_to_role_res

```lua
function Game.str_to_role_res(str: string)
  -> py.RoleResKey
```

字符串转玩家属性

@*param* `str` — 字符串

@*return* — 3 玩家属性
## str_to_role_status

```lua
function Game.str_to_role_status(status: py.RoleStatus)
  -> string
```

字玩家状态转字符串
## str_to_role_type

```lua
function Game.str_to_role_type(str: string)
  -> py.RoleType
```

字符串转玩家控制状态

@*param* `str` — 字符串

@*return* — 玩家控制状态
## str_to_store_key

```lua
function Game.str_to_store_key(str: string)
  -> store_key: py.StoreKey
```

字符串转平台道具类型

@*param* `str` — 字符串

@*return* `store_key` — 平台道具类型
## str_to_tech_key

```lua
function Game.str_to_tech_key(str: string)
  -> py.TechKey
```

字符串转科技类型

@*param* `str` — 字符串

@*return* — 科技类型
## str_to_ui_event

```lua
function Game.str_to_ui_event(str: string)
  -> string
```

字符串转界面事件

@*param* `str` — 字符串
## str_to_unit_attr_type

```lua
function Game.str_to_unit_attr_type(str: string)
  -> string
```

字符串转单位属性类型

@*param* `str` — 字符串

@*return* — 单位属性类型
## str_to_unit_command_type

```lua
function Game.str_to_unit_command_type(str: string)
  -> py.UnitCommandType
```

字符串转单位命令类型

@*param* `str` — 字符串

@*return* — 单位命令类型
## str_to_unit_key

```lua
function Game.str_to_unit_key(str: string)
  -> py.UnitKey
```

字符串转单位类型

@*param* `str` — 字符串

@*return* — 单位类型
## str_to_unit_name

```lua
function Game.str_to_unit_name(str: string)
  -> string
```

字符串转单位属性

@*param* `str` — 字符串

@*return* — 单位属性
## str_to_unit_type

```lua
function Game.str_to_unit_type(str: string)
  -> py.UnitType
```

字符串转单位分类

@*param* `str` — 字符串

@*return* — 单位分类
## subscribe_event

```lua
(method) Game:subscribe_event(event_type: y3.Const.EventType, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```

## table_has_key

```lua
function Game.table_has_key(table: table, key: string)
  -> boolean
```

表是否存在字段
## toggle_day_night_time

```lua
function Game.toggle_day_night_time(is_on: boolean)
```

开关时间流逝

@*param* `is_on` — 开关
## unreg_sound_area

```lua
function Game.unreg_sound_area(area: Area)
```

注销区域的附近语音频道

@*param* `area` — 区域

# Ground
## get_collision

```lua
function Ground.get_collision(point: Point)
  -> integer
```

获取地图在该点位置的碰撞类型

@*param* `point` — 碰撞点
## get_height_level

```lua
function Ground.get_height_level(point: Point)
  -> level: integer
```

获取地图在该点位置的层级

@*param* `point` — 点

@*return* `level` — 层级
## get_view_block_type

```lua
function Ground.get_view_block_type(point: Point)
  -> integer
```

获取地图在该点位置的视野类型
## set_collision

```lua
function Ground.set_collision(point: Point, is_collision_effect: boolean, is_land_effect: boolean, is_air_effect: boolean)
```

设置碰撞

@*param* `point` — 碰撞点

@*param* `is_collision_effect` — 碰撞是否生效

@*param* `is_land_effect` — 地面碰撞开关

@*param* `is_air_effect` — 空中碰撞开关

# HealInstance
## data

```lua
EventParam.单位-受到治疗后
```

## get_ability

```lua
(method) HealInstance:get_ability()
  -> Ability?
```

 获取关联技能
## get_heal

```lua
(method) HealInstance:get_heal()
  -> number
```

 获取当前治疗
## mode

```lua
'治疗前'|'治疗后'|'治疗时'
```

## set_heal

```lua
(method) HealInstance:set_heal(value: number)
```

 修改当前治疗

# Helper
## pack_list

```lua
function Helper.pack_list(lua_list: any[], unwrapper?: fun(lua_object: any):any)
  -> py.DynamicTypeMeta[]
```

## tonumber

```lua
function Helper.tonumber(n: number|py.Fixed)
  -> number
```

## unpack_list

```lua
function Helper.unpack_list(py_list: py.List, wrapper?: fun(py_object: any):any)
  -> any[]
```


# Item
## add_attribute

```lua
(method) Item:add_attribute(key: string, value: number)
```

增加基础属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## add_charge

```lua
(method) Item:add_charge(charge: integer)
```

增加充能数

@*param* `charge` — 充能数
## add_passive_ability

```lua
(method) Item:add_passive_ability(ability_id: py.AbilityKey, level: integer)
```

给物品添加被动技能

@*param* `ability_id` — 技能id

@*param* `level` — 等级
## add_stack

```lua
(method) Item:add_stack(stack: integer)
```

增加堆叠数

@*param* `stack` — 堆叠数
## add_tag

```lua
(method) Item:add_tag(tag: string)
```

添加标签

@*param* `tag` — 标签
## attr_pick

```lua
(method) Item:attr_pick()
  -> keys: string[]
```

遍历物品的单位属性

@*return* `keys` — 属性key
## attr_pick_by_key

```lua
function Item.attr_pick_by_key(item_key: py.ItemKey)
  -> keys: string[]
```

遍历物品类型的单位属性

@*param* `item_key` — 物品类型

@*return* `keys` — 属性key
## check_precondition_by_key

```lua
function Item.check_precondition_by_key(player: Player, item_key: py.ItemKey)
  -> boolean
```

检查物品类型前置条件

@*param* `player` — 玩家

@*param* `item_key` — 物品类型ID
## create_item

```lua
function Item.create_item(point: Point, item_key: py.ItemKey, player?: Player)
  -> Item
```

创建物品到点

@*param* `point` — 点

@*param* `item_key` — 道具类型

@*param* `player` — 玩家
## custom_event_manager

```lua
EventManager?
```

## drop

```lua
(method) Item:drop(point: Point, count: integer)
```

丢弃物品到点

@*param* `point` — 目标点

@*param* `count` — 丢弃数量
## event

```lua
fun(self: Item, event: "物品-获得", callback: fun(trg: Trigger, data: EventParam.物品-获得)):Trigger
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
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any[], ...any)
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

## get_ability

```lua
(method) Item:get_ability()
  -> ability: Ability?
```

获取物品的主动技能

@*return* `ability` — 主动技能
## get_attribute

```lua
(method) Item:get_attribute(key: string)
  -> number
```

获取物品的基础属性

@*param* `key` — 属性key
## get_attribute_by_key

```lua
function Item.get_attribute_by_key(item_key: py.ItemKey, key: string)
  -> number
```

获取物品类型的基础属性

@*param* `key` — 属性key

@*param* `item_key` — 物品类型
## get_by_handle

```lua
function Item.get_by_handle(py_item: py.Item)
  -> Item
```

通过py层的技能实例获取lua层的道具实例

@*param* `py_item` — py层的道具实例

@*return* — 返回在lua层初始化后的lua层道具实例
## get_by_id

```lua
function Item.get_by_id(id: py.ItemID)
  -> Item
```

 通过id获取lua层的道具实例

@*return* — 返回在lua层初始化后的lua层道具实例
## get_charge

```lua
(method) Item:get_charge()
  -> charges: integer
```

物品充能数

@*return* `charges` — 充能数
## get_description

```lua
(method) Item:get_description()
  -> description: string
```

获取物品描述

@*return* `description` — 物品描述
## get_description_by_key

```lua
function Item.get_description_by_key(item_key: py.ItemKey)
  -> string
```

获取物品类型的描述

@*param* `item_key` — 物品类型
## get_facing

```lua
(method) Item:get_facing()
  -> angel: number
```

获取物品的朝向

@*return* `angel` — 朝向
## get_hp

```lua
(method) Item:get_hp()
  -> hp: number
```

获取物品的生命值

@*return* `hp` — 物品的生命值
## get_icon

```lua
(method) Item:get_icon()
  -> py.Texture
```

获取物品的图标
## get_icon_id_by_key

```lua
function Item.get_icon_id_by_key(item_key: py.ItemKey)
  -> integer
```

获取物品类型的icon的图片id

@*param* `item_key` — 物品类型
## get_id

```lua
(method) Item:get_id()
  -> integer
```

 获取唯一ID
## get_item_buy_price_by_key

```lua
function Item.get_item_buy_price_by_key(item_key: py.ItemKey, key: py.RoleResKey)
  -> price: number
```

获取物品购买售价

@*param* `item_key` — 类型

@*param* `key` — 玩家属性

@*return* `price` — 价格
## get_item_group_in_area

```lua
function Item.get_item_group_in_area(area: Area)
  -> ItemGroup
```

获得区域内所有物品

@*param* `area` — 区域
## get_item_sell_price_by_key

```lua
function Item.get_item_sell_price_by_key(item_key: py.ItemKey, key: py.RoleResKey)
  -> price: number
```

获取物品出售售价

@*param* `item_key` — 类型

@*param* `key` — 玩家属性

@*return* `price` — 价格
## get_key

```lua
(method) Item:get_key()
  -> key: py.ItemKey
```

获取物品类型id

@*return* `key` — 类型
## get_level

```lua
(method) Item:get_level()
  -> level: integer
```

获取物品等级

@*return* `level` — 物品等级
## get_max_charge

```lua
(method) Item:get_max_charge()
  -> max_charge: integer
```

获取最大充能数

@*return* `max_charge` — 最大充能数
## get_model

```lua
(method) Item:get_model()
  -> model_key: py.ModelKey
```

获取物品模型

@*return* `model_key` — 模型类型
## get_model_by_key

```lua
function Item.get_model_by_key(item_key: py.ItemKey)
  -> model_key: py.ModelKey
```

获取物品类型的模型

@*param* `item_key` — 物品类型

@*return* `model_key` — 模型类型
## get_name

```lua
(method) Item:get_name()
  -> name: string
```

获取物品名

@*return* `name` — 物品名字
## get_name_by_key

```lua
function Item.get_name_by_key(item_key: py.ItemKey)
  -> string
```

获取物品类型名

@*param* `item_key` — 物品类型
## get_num_of_item_mat

```lua
function Item.get_num_of_item_mat(item_key: py.ItemKey, comp_item_key: py.ItemKey)
  -> integer
```

物品类型合成所需的物品类型数量
## get_num_of_player_attr

```lua
function Item.get_num_of_player_attr(item_key: py.ItemKey, role_res_key: py.RoleResKey)
  -> number
```

物品类型合成所需的玩家属性数量
## get_owner

```lua
(method) Item:get_owner()
  -> owner: Unit?
```

物品持有者

@*return* `owner` — 持有者
## get_owner_player

```lua
(method) Item:get_owner_player()
  -> player: Player
```

获取物品的拥有玩家

@*return* `player` — 玩家
## get_passive_ability

```lua
(method) Item:get_passive_ability(index: integer)
  -> ability: Ability?
```

获取物品的被动技能

@*return* `ability` — 被动技能
## get_point

```lua
(method) Item:get_point()
  -> position: Point
```

物品所在点

@*return* `position` — 物品所在点
## get_scale

```lua
(method) Item:get_scale()
  -> scale: number
```

获取物品缩放

@*return* `scale` — 物品缩放
## get_slot

```lua
(method) Item:get_slot()
  -> index: integer
```

获取物品在单位身上的格子位置

@*return* `index` — 格子位置
## get_slot_type

```lua
(method) Item:get_slot_type()
  -> 背包槽类型: py.SlotType
```

获取物品在单位身上的背包槽类型
## get_stack

```lua
(method) Item:get_stack()
  -> stacks: integer
```

物品堆叠数

@*return* `stacks` — 堆叠数
## handle

```lua
py.Item
```

物品对象
## has_tag

```lua
(method) Item:has_tag(tag: string)
  -> is_has_tag: boolean
```

存在标签

@*param* `tag` — 删除标签

@*return* `is_has_tag` — 是否有标签
## has_tag_by_key

```lua
function Item.has_tag_by_key(tag: string, item_key: py.ItemKey)
  -> is_has_tag: boolean
```

物品类型是否存在标签

@*param* `tag` — 标签

@*param* `item_key` — 物品类型

@*return* `is_has_tag` — 是否有标签
## id

```lua
py.ItemID
```

物品ID
## is_exist

```lua
(method) Item:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## is_in_bag

```lua
(method) Item:is_in_bag()
  -> is_in_bag: boolean
```

物品在背包栏

@*return* `is_in_bag` — 是否在背包栏
## is_in_bar

```lua
(method) Item:is_in_bar()
  -> is_in_bar: boolean
```

物品在物品栏

@*return* `is_in_bar` — 是否在物品栏
## is_in_scene

```lua
(method) Item:is_in_scene()
  -> is_in_scene: boolean
```

是否在场景中

@*return* `is_in_scene` — 是否在场景中
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
```
## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## object_event_manager

```lua
EventManager?
```

## ref_manager

```lua
unknown
```

## remove

```lua
(method) Item:remove()
```

删除物品
## remove_tag

```lua
(method) Item:remove_tag(tag: string)
```

@*param* `tag` — 标签
## set_attribute

```lua
(method) Item:set_attribute(key: string, value: number)
```

设置基础属性

@*param* `key` — 属性key

@*param* `value` — 属性值
## set_charge

```lua
(method) Item:set_charge(charge: integer)
```

设置充能数

@*param* `charge` — 充能数
## set_description

```lua
(method) Item:set_description(description: string)
```

设置物品的描述

@*param* `description` — 描述
## set_droppable

```lua
(method) Item:set_droppable(dropable: boolean)
```

设置丢弃状态

@*param* `dropable` — 状态
## set_facing

```lua
(method) Item:set_facing(facing: number)
```

设置物品朝向

@*param* `facing` — 朝向
## set_hp

```lua
(method) Item:set_hp(value: number)
```

设置生命值

@*param* `value` — 生命值
## set_icon

```lua
(method) Item:set_icon(picture_id: py.Texture)
```

设置物品的图标

@*param* `picture_id` — 图片id
## set_level

```lua
(method) Item:set_level(level: integer)
```

设置等级

@*param* `level` — 等级
## set_max_charge

```lua
(method) Item:set_max_charge(charge: integer)
```

设置最大充能数

@*param* `charge` — 最大充能数
## set_name

```lua
(method) Item:set_name(name: string)
```

设置物品的名称

@*param* `name` — 名字
## set_owner_player

```lua
(method) Item:set_owner_player(player: Player)
```

设置所属玩家

@*param* `player` — 所属玩家
## set_point

```lua
(method) Item:set_point(point: Point)
```

移动到点 

@*param* `point` — 点
## set_sale_state

```lua
(method) Item:set_sale_state(state: boolean)
```

设置物品可否出售

@*param* `state` — 是否可出售
## set_scale

```lua
(method) Item:set_scale(scale: number)
```

设置物品缩放

@*param* `scale` — 缩放
## set_shop_price

```lua
function Item.set_shop_price(id: py.ItemKey, player_attr_name: py.RoleResKey, price: number)
```

设置物品商品售价

@*param* `id` — 物品id

@*param* `player_attr_name` — 玩家属性

@*param* `price` — 价格
## set_stack

```lua
(method) Item:set_stack(stack: integer)
```

设置堆叠数

@*param* `stack` — 堆叠数
## set_visible

```lua
(method) Item:set_visible(is_visible: boolean)
```

设置物品可见性

@*param* `is_visible` — 是否可见
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

## type

```lua
string
```


# ItemGroup
## create_lua_item_group_from_py

```lua
function ItemGroup.create_lua_item_group_from_py(py_item_group: py.ItemGroup)
  -> ItemGroup
```

## get_all_items_in_shapes

```lua
function ItemGroup.get_all_items_in_shapes(point: Point, shape: Shape)
  -> ItemGroup
```

筛选范围内的所有物品

@*param* `point` — 点

@*param* `shape` — 筛选范围
## handle

```lua
py.ItemGroup
```

物品组
## pick

```lua
(method) ItemGroup:pick()
  -> Item[]
```

遍历物品组中玩家做动作
## type

```lua
string
```


# KV.SupportType

```lua
boolean|string|number|Ability|Buff...(+8)
```


# KV.SupportTypeEnum
```lua
"Unit" | "Ability" | "Item" | "Buff" | "Point" | "Player" | "Projectile" | "Destructible" | "Particle" | "Mover"
```
# Light
## create_lua_light_by_py

```lua
function Light.create_lua_light_by_py(py_light: py.Light)
  -> light: Light
```

## create_point_light_at_point

```lua
function Light.create_point_light_at_point(point: Point, deviation_height: number)
  -> Light
```

创建点光源到点

@*param* `point` — 目标点

@*param* `deviation_height` — 偏移高度
## create_point_light_at_unit_socket

```lua
function Light.create_point_light_at_unit_socket(unit: Unit, socket_name: string, deviation_height: number)
  -> Light
```

创建点光源到单位挂接点

@*param* `unit` — 目标单位

@*param* `socket_name` — 挂接点

@*param* `deviation_height` — 偏移高度
## create_spot_light_at_unit_socket

```lua
function Light.create_spot_light_at_unit_socket(unit: Unit, socket_name: string, pos_offset_y?: number, target_unit?: Unit, target_offset_y?: number)
  -> Light
```

创建方向光源到单位挂接点

@*param* `unit` — 目标单位

@*param* `socket_name` — 挂接点

@*param* `pos_offset_y` — 偏移高度

@*param* `target_unit` — 目标单位

@*param* `target_offset_y` — 目标点偏移高度
## create_spot_light_to_point

```lua
function Light.create_spot_light_to_point(point: Point, pos_offset_y?: number, unit_point_projectile?: Point|Projectile|Unit, target_offset_y?: number)
  -> Light
```

创建方向光源到点

@*param* `point` — 目标点

@*param* `pos_offset_y` — 偏移高度

@*param* `unit_point_projectile` — 目标

@*param* `target_offset_y` — 目标点偏移高度
## get_light_attribute

```lua
(method) Light:get_light_attribute(key: string)
  -> 属性值: number
```

获取光源属性

@*param* `key` — 属性名
## get_light_cast_shadow_state

```lua
(method) Light:get_light_cast_shadow_state()
  -> 是否产生阴影: boolean
```

获取光源是否产生阴影
## get_point_light_by_res_id

```lua
function Light.get_point_light_by_res_id(res_id: py.LightID)
  -> Light
```

根据场景id获得点光源

@*param* `res_id` — 编辑场景中的id
## get_spot_light_by_res_id

```lua
function Light.get_spot_light_by_res_id(res_id: py.LightID)
  -> Light
```

根据场景id获得聚光灯

@*param* `res_id` — 编辑场景中的id
## handle

```lua
py.Light
```

光源
## map

```lua
table
```

## remove_light

```lua
(method) Light:remove_light()
```

删除光源
## res_id

```lua
(py.LightID)?
```

光源ID
## set_directional_light_attribute

```lua
(method) Light:set_directional_light_attribute(light_attr_type: string, value: number)
```

设置方向光源属性

@*param* `light_attr_type` — 属性名

@*param* `value` — 属性值
## set_point_light_attribute

```lua
(method) Light:set_point_light_attribute(light_attr_type: string, value: number)
```

设置点光源属性

@*param* `light_attr_type` — 属性名

@*param* `value` — 属性值
## set_shadow_casting_status

```lua
(method) Light:set_shadow_casting_status(value: boolean)
```

设置光源是否产生阴影

@*param* `value` — 是否产生阴影
## type

```lua
string
```


# LinkedTable
## dump

```lua
(method) LinkedTable:dump(start: any, revert?: boolean)
  -> string
```

## getAfter

```lua
(method) LinkedTable:getAfter(node: any)
  -> any
```

## getBefore

```lua
(method) LinkedTable:getBefore(node: any)
  -> any
```

## getHead

```lua
(method) LinkedTable:getHead()
  -> any
```

## getSize

```lua
(method) LinkedTable:getSize()
  -> integer
```

## getTail

```lua
(method) LinkedTable:getTail()
  -> any
```

## has

```lua
(method) LinkedTable:has(node: any)
  -> boolean
```

## isValidNode

```lua
(method) LinkedTable:isValidNode(node: any)
  -> boolean
```

## pairs

```lua
(method) LinkedTable:pairs(start: any, revert?: boolean)
  -> fun():any
```

## pop

```lua
(method) LinkedTable:pop(node: any)
  -> boolean
```

## popHead

```lua
(method) LinkedTable:popHead()
  -> boolean
```

## popTail

```lua
(method) LinkedTable:popTail()
  -> boolean
```

## pushAfter

```lua
(method) LinkedTable:pushAfter(node: any, afterWho: any)
  -> boolean
```

## pushBefore

```lua
(method) LinkedTable:pushBefore(node: any, beforeWho: any)
  -> boolean
```

## pushHead

```lua
(method) LinkedTable:pushHead(node: any)
  -> boolean
```

## pushTail

```lua
(method) LinkedTable:pushTail(node: any)
  -> boolean
```

## replace

```lua
(method) LinkedTable:replace(old: any, new: any)
  -> boolean
```

## reset

```lua
(method) LinkedTable:reset()
```


# LocalTimer
 本地计时器，支持异步创建或回调（只要你自己保证不会引发其他不同步的问题）## all_timers

```lua
table
```

## count

```lua
integer
```

## execute

```lua
(method) LocalTimer:execute(...any)
```

 立即执行
## get_elapsed_time

```lua
(method) LocalTimer:get_elapsed_time()
  -> number
```

 获取经过的时间
## get_include_name

```lua
(method) LocalTimer:get_include_name()
  -> string?
```

## get_init_count

```lua
(method) LocalTimer:get_init_count()
  -> integer
```

 获取初始计数
## get_remaining_count

```lua
(method) LocalTimer:get_remaining_count()
  -> integer
```

 获取剩余计数
## get_remaining_time

```lua
(method) LocalTimer:get_remaining_time()
  -> number
```

 获取剩余时间
## get_time_out_time

```lua
(method) LocalTimer:get_time_out_time()
  -> number
```

 获取计时器设置的时间
## id

```lua
integer
```

## include_name

```lua
string?
```

## init_ms

```lua
integer
```

## is_running

```lua
(method) LocalTimer:is_running()
  -> boolean
```

 是否正在运行
## loop

```lua
function LocalTimer.loop(timeout: number, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 循环执行
## loop_count

```lua
function LocalTimer.loop_count(timeout: number, count: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 循环执行，可以指定最大次数
## loop_count_frame

```lua
function LocalTimer.loop_count_frame(frame: integer, count: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 每经过一定帧数后执行，可以指定最大次数
## loop_frame

```lua
function LocalTimer.loop_frame(frame: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 每经过一定帧数后执行
## mode

```lua
LocalTimer.Mode
```

## on_timer

```lua
LocalTimer.OnTimer
```

## pairs

```lua
function LocalTimer.pairs()
  -> fun():LocalTimer?
```

 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
## pause

```lua
(method) LocalTimer:pause()
```

 暂停计时器
## paused_at

```lua
number?
```

## paused_ms

```lua
integer
```

## pausing

```lua
boolean?
```

## pop

```lua
(method) LocalTimer:pop()
```

## push

```lua
(method) LocalTimer:push()
```

## queue_index

```lua
integer?
```

## remove

```lua
(method) LocalTimer:remove()
```

 移除计时器
## removed

```lua
boolean?
```

## resume

```lua
(method) LocalTimer:resume()
```

 恢复计时器
## runned_count

```lua
integer
```

## set_time_out

```lua
(method) LocalTimer:set_time_out()
```

## start_ms

```lua
integer
```

## target_ms

```lua
number
```

## time

```lua
number
```

## total_paused_ms

```lua
integer
```

## wait

```lua
function LocalTimer.wait(timeout: number, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 等待时间后执行
## wait_frame

```lua
function LocalTimer.wait_frame(frame: integer, on_timer: LocalTimer.OnTimer)
  -> LocalTimer
```

 等待一定帧数后执行
## wakeup

```lua
(method) LocalTimer:wakeup()
```

## waking_up

```lua
boolean?
```


# LocalTimer.Mode
```lua
LocalTimer.Mode:
    | 'second'
    | 'frame'
```
```lua
'frame'|'second'
```


# LocalTimer.OnTimer

```lua
fun(timer: LocalTimer, count: integer)
```


# Log
## build

```lua
(method) Log:build(level: string, ...any)
  -> message: string
  2. timestamp: string
```

## clock

```lua
function
```

## debug

```lua
fun(...any):string, string
```

## error

```lua
fun(...any):string, string
```

## fatal

```lua
fun(...any):string, string
```

## file

```lua
file*?
```




[查看文档](http://www.lua.org/manual/5.4/manual.html#pdf-file)

## getTimeStamp

```lua
(method) Log:getTimeStamp()
  -> string
```

## info

```lua
fun(...any):string, string
```

## level

```lua
string
```

## logLevel

```lua
table<Log.Level, integer>
```

## maxSize

```lua
integer
```

 设置日志文件的最大大小
## messageFormat

```lua
string
```

## needTraceBack

```lua
table<Log.Level, boolean>
```

## option

```lua
Log.Option
```

## startClock

```lua
number
```

## startTime

```lua
integer
```

## trace

```lua
fun(...any):string, string
```

## usedSize

```lua
integer
```

## warn

```lua
fun(...any):string, string
```


# Log.Level
```lua
"trace" | "debug" | "info" | "warn" | "error" | "fatal"
```
# Log.Option
## clock

```lua
(fun():number)?
```

获取当前时间，需要精确到毫秒
## file

```lua
file*
```

日志文件对象，与path二选一
## level

```lua
Log.Level
```

日志等级，低于此等级的日志将不会被记录
## logLevel

```lua
table<Log.Level, integer>
```

自定义日志等级
## maxSize

```lua
integer?
```

日志文件的最大大小
## needTraceBack

```lua
table<Log.Level, boolean>
```

是否需要打印堆栈信息
## path

```lua
string
```

日志文件的路径，与file二选一
## print

```lua
fun(level: Log.Level, message: string)
```

额外的打印回调

# Math
## acos

```lua
function Math.acos(value: number)
  -> float: number
```

反余弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## asin

```lua
function Math.asin(value: number)
  -> float: number
```

反正弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## atan

```lua
function Math.atan(y: number, x: number)
  -> float: number
```

反正切（角度制）

@*return* `float` — 实数
## cos

```lua
function Math.cos(value: number)
  -> float: number
```

余弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## get_random_angle

```lua
function Math.get_random_angle()
  -> number
```

获取随机角度
## get_random_seed

```lua
function Math.get_random_seed()
  -> seed: integer
```

获取随机种子

@*return* `seed` — 随机种子
## includedAngle

```lua
function Math.includedAngle(r1: number, r2: number)
  -> angle: number
  2. direction: number
```

计算2个角度之间的夹角（角度制）

@*return* `angle` — 夹角，取值范围[0, 180]

@*return* `direction` — 方向，1为顺时针，-1为逆时针
## isBetween

```lua
function Math.isBetween(number: number, min: number, max: number)
  -> boolean
```

 检查数字是否在[min, max]范围内
## random_float

```lua
function Math.random_float(min: number, max: number)
  -> float: number
```

范围内随机实数

@*param* `min` — 范围内最小实数

@*param* `max` — 范围内最大实数

@*return* `float` — 随机实数
## sin

```lua
function Math.sin(value: number)
  -> float: number
```

正弦（角度制）

@*param* `value` — 实数

@*return* `float` — 实数
## tan

```lua
function Math.tan(value: number)
  -> float: number
```

正切（角度制）

@*param* `value` — 实数

@*return* `float` — 实数

# Mover
## get_by_handle

```lua
function Mover.get_by_handle(py_mover: py.Mover)
  -> Mover
```

## handle

```lua
py.Mover
```

运动器类型
## init

```lua
(method) Mover:init(mover_data: Mover.CreateData.Base)
```

## mover_curve

```lua
function Mover.mover_curve(mover_unit: Projectile|Unit, mover_data: Mover.CreateData.Curve)
  -> Mover
```

## mover_line

```lua
function Mover.mover_line(mover_unit: Projectile|Unit, mover_data: Mover.CreateData.Line)
  -> Mover
```

## mover_round

```lua
function Mover.mover_round(mover_unit: Projectile|Unit, mover_data: Mover.CreateData.Round)
  -> Mover
```

## mover_target

```lua
function Mover.mover_target(mover_unit: Projectile|Unit, mover_data: Mover.CreateData.Target)
  -> Mover
```

## remove

```lua
(method) Mover:remove()
```

 移除运动器
## stop

```lua
(method) Mover:stop()
```

 打断运动器
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

## wrap_callbacks

```lua
function Mover.wrap_callbacks(mover_data: Mover.CreateData.Base)
  -> fun(mover: Mover)
  2. fun()?
  3. fun()?
  4. fun()?
  5. fun()?
  6. fun()
```

@*return* — update mover

@*return* — on_hit

@*return* — on_block

@*return* — on_finish

@*return* — on_break

@*return* — on_remove
## wrap_curve_args

```lua
function Mover.wrap_curve_args(args: Mover.CreateData.Curve)
  -> table
```

## wrap_line_args

```lua
function Mover.wrap_line_args(args: Mover.CreateData.Line)
  -> table
```

## wrap_round_args

```lua
function Mover.wrap_round_args(args: Mover.CreateData.Round)
  -> table
```

## wrap_target_args

```lua
function Mover.wrap_target_args(args: Mover.CreateData.Target)
  -> table
```


# Mover.CreateData.Base
## ability

```lua
Ability
```

关联技能
## absolute_height

```lua
boolean
```

是否使用绝对高度
## face_angle

```lua
boolean
```

是否始终面向运动方向
## hit_radius

```lua
number
```

碰撞范围
## hit_same

```lua
boolean
```

能否重复碰撞同一单位
## hit_type

```lua
integer
```

碰撞类型
## on_block

```lua
fun(self: Mover)
```

碰撞地形回调
## on_break

```lua
fun(self: Mover)
```

运动打断回调
## on_finish

```lua
fun(self: Mover)
```

运动结束回调
## on_hit

```lua
fun(self: Mover, unit: Unit)
```

碰撞单位回调
## on_remove

```lua
fun(self: Mover)
```

运动移除回调
## priority

```lua
integer
```

优先级
## terrain_block

```lua
boolean
```

是否会被地形阻挡

# Mover.CreateData.Curve
## ability

```lua
Ability
```

关联技能
## absolute_height

```lua
boolean
```

是否使用绝对高度
## acceleration

```lua
number
```

加速度
## angle

```lua
number
```

运动方向
## distance

```lua
number
```

运动距离
## face_angle

```lua
boolean
```

是否始终面向运动方向
## fin_height

```lua
number
```

终点高度
## hit_radius

```lua
number
```

碰撞范围
## hit_same

```lua
boolean
```

能否重复碰撞同一单位
## hit_type

```lua
integer
```

碰撞类型
## init_height

```lua
number
```

初始高度
## max_speed

```lua
number
```

最大速度
## min_speed

```lua
number
```

最小速度
## on_block

```lua
fun(self: Mover)
```

碰撞地形回调
## on_break

```lua
fun(self: Mover)
```

运动打断回调
## on_finish

```lua
fun(self: Mover)
```

运动结束回调
## on_hit

```lua
fun(self: Mover, unit: Unit)
```

碰撞单位回调
## on_remove

```lua
fun(self: Mover)
```

运动移除回调
## path

```lua
Point[]
```

路径点
## priority

```lua
integer
```

优先级
## speed

```lua
number
```

初始速度
## terrain_block

```lua
boolean
```

是否会被地形阻挡

# Mover.CreateData.Line
## ability

```lua
Ability
```

关联技能
## absolute_height

```lua
boolean
```

是否使用绝对高度
## acceleration

```lua
number
```

加速度
## angle

```lua
number
```

运动方向
## distance

```lua
number
```

运动距离
## face_angle

```lua
boolean
```

是否始终面向运动方向
## fin_height

```lua
number
```

终点高度
## hit_radius

```lua
number
```

碰撞范围
## hit_same

```lua
boolean
```

能否重复碰撞同一单位
## hit_type

```lua
integer
```

碰撞类型
## init_height

```lua
number
```

初始高度
## max_speed

```lua
number
```

最大速度
## min_speed

```lua
number
```

最小速度
## on_block

```lua
fun(self: Mover)
```

碰撞地形回调
## on_break

```lua
fun(self: Mover)
```

运动打断回调
## on_finish

```lua
fun(self: Mover)
```

运动结束回调
## on_hit

```lua
fun(self: Mover, unit: Unit)
```

碰撞单位回调
## on_remove

```lua
fun(self: Mover)
```

运动移除回调
## parabola_height

```lua
number
```

抛物线顶点高度
## priority

```lua
integer
```

优先级
## speed

```lua
number
```

初始速度
## terrain_block

```lua
boolean
```

是否会被地形阻挡

# Mover.CreateData.Round
## ability

```lua
Ability
```

关联技能
## absolute_height

```lua
boolean
```

是否使用绝对高度
## angle_speed

```lua
number
```

环绕速度
## clock_wise

```lua
boolean
```

是否顺时针
## face_angle

```lua
boolean
```

是否始终面向运动方向
## height

```lua
number
```

环绕高度
## hit_radius

```lua
number
```

碰撞范围
## hit_same

```lua
boolean
```

能否重复碰撞同一单位
## hit_type

```lua
integer
```

碰撞类型
## init_angle

```lua
number
```

初始角度
## lifting_speed

```lua
number
```

提升速度
## on_block

```lua
fun(self: Mover)
```

碰撞地形回调
## on_break

```lua
fun(self: Mover)
```

运动打断回调
## on_finish

```lua
fun(self: Mover)
```

运动结束回调
## on_hit

```lua
fun(self: Mover, unit: Unit)
```

碰撞单位回调
## on_remove

```lua
fun(self: Mover)
```

运动移除回调
## priority

```lua
integer
```

优先级
## radius

```lua
number
```

环绕半径
## radius_speed

```lua
number
```

半径变化速度
## round_time

```lua
number
```

环绕时间
## target

```lua
Point|Unit
```

环绕目标
## target_point

```lua
Point
```

目标点
## terrain_block

```lua
boolean
```

是否会被地形阻挡

# Mover.CreateData.Target
## ability

```lua
Ability
```

关联技能
## absolute_height

```lua
boolean
```

是否使用绝对高度
## acceleration

```lua
number
```

加速度
## bind_point

```lua
string
```

绑定点
## face_angle

```lua
boolean
```

是否始终面向运动方向
## height

```lua
number
```

初始高度
## hit_radius

```lua
number
```

碰撞范围
## hit_same

```lua
boolean
```

能否重复碰撞同一单位
## hit_type

```lua
integer
```

碰撞类型
## max_speed

```lua
number
```

最大速度
## min_speed

```lua
number
```

最小速度
## on_block

```lua
fun(self: Mover)
```

碰撞地形回调
## on_break

```lua
fun(self: Mover)
```

运动打断回调
## on_finish

```lua
fun(self: Mover)
```

运动结束回调
## on_hit

```lua
fun(self: Mover, unit: Unit)
```

碰撞单位回调
## on_remove

```lua
fun(self: Mover)
```

运动移除回调
## parabola_height

```lua
number
```

抛物线顶点高度
## priority

```lua
integer
```

优先级
## speed

```lua
number
```

初始速度
## target

```lua
Destructible|Item|Unit
```

追踪目标
## target_distance

```lua
number
```

撞击目标的距离
## terrain_block

```lua
boolean
```

是否会被地形阻挡

# Object.Ability
## ability_attribute

```lua
number
```

技能特殊属性（暂不生效）  
## ability_break_cast_range

```lua
any[]
```

当技能施法开始或施法出手阶段结束时，如果与施法目标的距离超过该值，会打断技能释放。
## ability_bw_point

```lua
number
```

后摇时长  
施法完成时间
## ability_cast_point

```lua
number
```

前摇时长  
施法开始时间
## ability_cast_range

```lua
any[]
```

释放范围  
以角色为圆心，以该值为半径的圆形区域。是角色不需要移动即可释放技能的最远距离。
## ability_cast_type

```lua
number
```

技能的释放类型。
## ability_channel_time

```lua
number
```

施法时长  
施法出手时间
## ability_cost

```lua
any[]
```

技能资源消耗值  
释放技能消耗的MP(会根据单位自身的技能资源进行变化)数值
## ability_damage

```lua
any[]
```

技能伤害值  
技能造成的伤害，可使用公式编辑，需在触发内引用才可生效
## ability_damage_range

```lua
any[]
```

当前技能的影响范围，
## ability_hp_cost

```lua
any[]
```

使用该技能时会消耗的生命值
## ability_icon

```lua
number
```

图标  
技能的图标，会在编辑器和游戏的ui上显示
## ability_max_level

```lua
number
```

技能最大等级  
技能的等级上限
## ability_max_stack_count

```lua
any[]
```

最大充能层数  
技能的最大充能数，必须满足充能数大于0且不在冷却状态才能施放该技能
## ability_prepare_time

```lua
number
```

施法引导时间
## ability_stack_cd

```lua
any[]
```

充能cd  
每增加一层充能数所需的时间（单位为秒）
## allow_none_target

```lua
boolean
```

是否允许无目标攻击  
## animation

```lua
string
```

动画
## animation_speed

```lua
number
```

动画速率
## arrow_length

```lua
any[]
```

箭头长度  
箭头指示器的长度
## arrow_width

```lua
any[]
```

箭头宽度  
箭头指示器的宽度
## art_resource_btn

```lua
any
```

## auto_pick

```lua
boolean
```

当采集到的资源是物品时，是否自动将物品拾取。如果不自动拾取则物品会创建在地面。
## bs_sfx_list

```lua
any[]
```

后摇特效
## bs_sound_effect

```lua
any[]
```

后摇音效
## build_list

```lua
any[]
```

建造技能建造的单位类型
## can_bs_interrupt

```lua
boolean
```

技能施法完成阶段能否被其他技能或者移动打断
## can_cache

```lua
boolean
```

是否可以缓存  
开启时，被控制时，控制结束 依旧可以继续释放（例如被禁止施法时发布施放命令，禁止施法解除后就会自动施放出来）
## can_cast_interrupt

```lua
boolean
```

技能施法出手阶段能否被其他技能或者移动打断
## can_cast_when_hp_insufficient

```lua
boolean
```

如果单位当前生命值不满足消耗时，能否施放技能
## can_cost_hp

```lua
boolean
```

开启后可以配置消耗生命值相关的技能参数。如无需要请勿开启该配置，会增加系统消耗。
## can_interrupt_others

```lua
boolean
```

释放该技能时候会尝试打断当前正在释放的技能
## can_prepare_interrupt

```lua
boolean
```

技能施法引导阶段能否被其他技能或者移动打断
## can_ps_interrupt

```lua
boolean
```

技能施法开始阶段能否被其他技能或者移动打断
## circle_radius

```lua
any[]
```

圆形半径  
圆形指示器的半径
## cold_down_time

```lua
any[]
```

冷却时间  
技能的冷却时间，释放一次技能后需要等待该时间才可继续释放（单位为秒）
## collection_animation

```lua
string
```

使用采集技能时会播放的动画。会在技能施法开始时播放，施法停止时停止。
## collection_animation_loop

```lua
boolean
```

采集技能时播放的采集动画是否会循环播放。
## collection_continuously

```lua
boolean
```

是否在采集完成后继续采集（仅在技能冷却时间为0时生效）
## collection_destructible_tags

```lua
any[]
```

可破坏物标签要求
## cost_hp_can_die

```lua
boolean
```

如果单位当前生命值不满足消耗时施放技能，则该项为true时单位会死亡，为false时会保留1点生命值
## cst_sfx_list

```lua
any[]
```

施法特效
## cst_sound_effect

```lua
any[]
```

施法音效
## description

```lua
number
```

描述  
描述
## end_sfx_list

```lua
any[]
```

结束特效
## end_sound_effect

```lua
any[]
```

结束音效
## filter_condition_camp

```lua
number
```

索敌条件 - 阵营  
按阵营选取目标。
## filter_condition_type

```lua
number
```

索敌条件 - 类型  
按种类选取目标。
## filter_item_tags

```lua
any[]
```

物品标签要求
## filter_modifier_unit

```lua
number
```

过滤效果单位  
## filter_unit_tags

```lua
any[]
```

单位标签要求
## hit_sfx_list

```lua
any[]
```

受击特效
## hit_sound_effect

```lua
any[]
```

击中音效
## influenced_by_cd_reduce

```lua
boolean
```

技能受到单位属性中的冷却缩短的影响
## influenced_by_move

```lua
boolean
```

勾选后移动会尝试打断当前技能，不勾选则可以实现移动施法
## is_channel

```lua
boolean
```

流程-是否持续施法  
## is_charge_ability

```lua
boolean
```

蓄力技能专属，为true时，技能开始和引导时间会一起作为蓄力技能一阶段的引导时间
## is_immediate

```lua
boolean
```

流程-是否立刻施法  
释放这个技能是否需要施法过程，开启时可以在单位存活的任何时期发动该技能，即使被禁止施法也可以正常释放。
## is_meele

```lua
boolean
```

是否是近战攻击  
开启时，标记这个技能造成的伤害为近战伤害
## is_toggle

```lua
boolean
```

是否开关技能（暂不生效）  
## key

```lua
number
```

ID
## kv

```lua
Object.Ability.Kv
```

## magicbook_list

```lua
any[]
```

魔法书中存放的技能list
## name

```lua
string|integer
```

名称  
名称
## need_turn_to_target

```lua
boolean
```

开启时，技能释放后单位会自动转到技能释放的方向（转身速度为单位的转身速度）
## pick_count

```lua
number
```

每次使用采集技能时获取到的资源数量。如果采集的是玩家属性，则获得对应的玩家属性值，如果采集的是物品，则获得对应数量的物品。
## player_props_cost

```lua
any[]
```

施放技能消耗的玩家属性，技能拥有者的玩家该属性不足时无法施放技能
## precondition_list

```lua
any[]
```

释放技能的前置条件
## ps_sfx_list

```lua
any[]
```

前摇特效
## ps_sound_effect

```lua
any[]
```

前摇音效
## release_immediately_out_of_range

```lua
boolean
```

如果技能目标点超出施法范围，会在施法范围内离目标最近的点施放
## required_level

```lua
Object.Ability.RequiredLevel
```

允许学习等级  
单位学习该技能所需要的等级
## sector_angle

```lua
any[]
```

扇形指示器的角度
## sector_radius

```lua
any[]
```

扇形半径  
扇形指示器的边长
## sight_type

```lua
number
```

指示器类型  
释放技能时的鼠标指示器的样式
## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## sp_count_down

```lua
boolean
```

开启时，会根据技能的施法时间显示相应的进度条
## sp_countdown

```lua
boolean
```

## sp_sfx_list

```lua
any[]
```

准备特效
## sp_sound_effect

```lua
any[]
```

准备音效
## suffix

```lua
string
```

编辑器后缀
## tags

```lua
any[]
```

标签  
用于对技能的分类处理。为技能贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：所有拥有XX标签的技能等级+1
## target_attribute

```lua
number
```

特殊筛选（只有尸体有效）  
特殊的技能目标筛选规则
## theme

```lua
number
```

主题  
## uid

```lua
string
```

UID

# Object.Ability.Kv
## AttackTimes

```lua
Object.Ability.Kv.AttackTimes
```


# Object.Ability.Kv.AttackTimes
## annotation

```lua
string
```

## desc

```lua
string
```

## etype

```lua
number
```

## key

```lua
string
```

ID
## prop_cls

```lua
string
```

## remark

```lua
string
```

## type

```lua
number
```

主类型  
## value

```lua
number
```


# Object.Ability.RequiredLevel
## formula

```lua
string
```

## required_levels

```lua
any[]
```


# Object.Buff
## attach_model_list

```lua
string
```

挂接模型列表
## cycle_time

```lua
number
```

每隔多长时间触发一次循环周期到期事件
## description

```lua
number
```

描述  
描述
## disappear_when_dead

```lua
boolean
```

死亡时是否销毁这个魔法效果。永久型的魔法效果不要勾选该选项。
## effect_button

```lua
any
```

## gain_list

```lua
any[]
```

获得特效列表  
## get_effect_list

```lua
any[]
```

## halo_effect

```lua
number
```

光环会对附近符合条件的单位添加该光环效果
## ign_inf_unit_tag

```lua
any[]
```

不会对拥有指定标签的单位施加光环效果。  
只有满足所有判断条件时，单位才会获得光环效果。
## ign_inf_unit_type

```lua
number
```

不会对指定类型的单位施加光环效果。  
只有满足所有判断条件时，单位才会获得光环效果。
## influence_rng

```lua
number
```

对多大范围内的单位添加光环效果
## is_influence_self

```lua
boolean
```

是否对光环的拥有者添加光环效果
## key

```lua
number
```

ID
## kv

```lua
Object.Buff.Kv
```

## layer_change_of_cover

```lua
number
```

不变会保留旧的魔法效果对象（事件中获取），覆盖会保留新的对象。
## layer_max

```lua
number
```

魔法效果的最大层数，如果最大层数为1则魔法效果在局内的属性面板中不会显示层数
## lose_effect_list

```lua
any[]
```

## lose_list

```lua
any[]
```

失去特效列表  
## material_alpha

```lua
number
```

## material_change

```lua
number
```

影响魔法效果携带者的材质
## material_color

```lua
any[]
```

## material_color_intensity

```lua
number
```

## model

```lua
number
```

模型  
模型
## modifier_cover_type

```lua
number
```

用于决定单位获得相同的魔法效果时，是否进行覆盖以及如何进行覆盖。
## modifier_effect

```lua
number
```

仅用于标记，用来进行效果分类，在ECA中可以对单位身上同一分类的魔法效果统一处理
## modifier_icon

```lua
number
```

效果图标  
## modifier_type

```lua
number
```

不同类别的魔法效果将会有
## name

```lua
string|integer
```

名称  
名称
## same_origin_cover

```lua
boolean
```

“同源”指覆盖发生时2个魔法效果的关联技能类型和来源单位相同  
  
当同源覆盖要求为是，2个不同源的魔法效果不会发生覆盖，走不覆盖规则
## shield_change_of_cover

```lua
number
```

护盾发生覆盖时的护盾值的处理方式
## shield_type

```lua
number
```

通用类可以抵挡物理或法术伤害，物理和法术护盾只能抵挡对应的伤害
## shield_value

```lua
number
```

护盾可以抵挡的伤害值
## show_on_ui

```lua
boolean
```

勾选后会在局内单位的魔法效果栏中显示该魔法效果
## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## suffix

```lua
string
```

编辑器后缀
## tags

```lua
any[]
```

标签  
## target_allow

```lua
number
```

根据敌我关系决定是否对单位施加光环效果
## time_change_of_cover

```lua
number
```

若覆盖类型为覆盖时，不变会保留旧的持续时间，覆盖会保留新的持续时间，若覆盖类型为叠加时，规则相反。
## uid

```lua
string
```

UID

# Object.Buff.Kv

# Object.Item
## agility

```lua
number
```

敏捷  
为物品携带者提供的额外敏捷
## attached_ability

```lua
number
```

主动技能  
使用该物品的时释放的主动技能
## attached_agility

```lua
any[]
```

敏捷  
为物品携带者提供的额外敏捷
## attached_attack_mag

```lua
any[]
```

法术攻击力  
为物品携带者提供的额外魔法攻击力的数值
## attached_attack_phy

```lua
any[]
```

物理攻击力  
为物品携带者提供的额外物理攻击力的数值
## attached_attack_speed

```lua
any[]
```

攻击速度(%)  
为物品携带者提供的额外攻击速度的倍数值
## attached_buffs

```lua
any[]
```

## attached_cd_reduce

```lua
any[]
```

冷却缩减(%)  
为物品携带者提供的额外冷却缩短的百分比
## attached_critical_chance

```lua
any[]
```

暴击率(%)  
为物品携带者提供的额外暴击率
## attached_critical_dmg

```lua
any[]
```

暴击伤害(%)  
为物品携带者提供的额外暴击伤害的倍率。发生暴击时，造成的暴击伤害倍数
## attached_defense_mag

```lua
any[]
```

法术防御力  
为物品携带者提供的额外法术防御力的数值
## attached_defense_phy

```lua
any[]
```

物理防御力  
为物品携带者提供的额外物理防御力的数值
## attached_dmg_reduction

```lua
any[]
```

伤害减免(%)  
为物品携带者提供的额外伤害减免
## attached_dodge_rate

```lua
any[]
```

躲避率(%)  
为物品携带者提供的额外闪避率
## attached_extra_dmg

```lua
any[]
```

所有伤害加成(%)  
为物品携带者提供的额外伤害加成
## attached_gainvalue

```lua
any[]
```

技能伤害加成(%)  
该字段并无实际效果
## attached_heal_effect

```lua
any[]
```

被治疗效果提升(%)  
为物品携带者提供的额外受到治疗增益加成
## attached_hit_rate

```lua
any[]
```

命中率(%)  
为物品携带者提供的额外命中率
## attached_hp_max

```lua
any[]
```

最大生命值  
为物品携带者提供的额外最大生命值
## attached_hp_rec

```lua
any[]
```

生命恢复  
为物品携带者提供的额外每秒恢复生命值
## attached_intelligence

```lua
any[]
```

智力  
为物品携带者提供的额外智力
## attached_mp_max

```lua
any[]
```

最大技能资源  
为物品携带者提供的额外最大法力值
## attached_mp_rec

```lua
any[]
```

技能资源恢复  
为物品携带者提供的额外的每秒法力恢复值
## attached_ori_speed

```lua
any[]
```

移动速度  
为物品携带者提供的额外移动速度
## attached_passive_abilities

```lua
any[]
```

携带该物品时会获得的被动技能
## attached_pene_mag

```lua
any[]
```

法穿数值  
为物品携带者提供的额外法术穿透。先计算固定穿透，再计算百分比穿透
## attached_pene_mag_ratio

```lua
any[]
```

法术穿透(%)  
为物品携带者提供的额外百分比法术穿透。先计算固定穿透，再计算百分比穿透
## attached_pene_phy

```lua
any[]
```

物穿数值  
为物品携带者提供的额外物理穿透。先计算固定穿透，再计算百分比穿透
## attached_pene_phy_ratio

```lua
any[]
```

物理穿透(%)  
为物品携带者提供的额外百分比物理穿透。先计算固定穿透，再计算百分比穿透
## attached_resilience

```lua
any[]
```

该字段并无实际效果
## attached_strength

```lua
any[]
```

力量  
为物品携带者提供的额外力量
## attached_vampire_mag

```lua
any[]
```

法术吸血(%)  
为物品携带者提供的额外法术吸血
## attached_vampire_phy

```lua
any[]
```

物理吸血(%)  
为物品携带者提供的额外物理吸血
## attached_vision_true

```lua
any[]
```

为物品携带者提供的额外真实视野
## attack_mag

```lua
number
```

法攻数值  
为物品携带者提供的额外魔法攻击力的数值
## attack_phy

```lua
number
```

物攻数值  
为物品携带者提供的额外物理攻击力的数值
## attack_speed

```lua
number
```

攻速数值  
为物品携带者提供的额外攻击速度的倍数值
## auto_use

```lua
boolean
```

自动使用  
勾选后获得该物品时会自动使用该物品，如果不满足该物品的主动技能消耗条件则无法拾取
## base_color_mod

```lua
number
```

## base_tint_color

```lua
any[]
```

## body_size

```lua
number
```

尺寸  
物品模型的缩放比例
## buy_res_list

```lua
any[]
```

购买所需资源  
从商店里购买这件物品所需要的资源
## can_sell

```lua
boolean
```

## cd_reduce

```lua
number
```

冷却缩减  
为物品携带者提供的额外冷却缩短的百分比
## cd_type

```lua
string
```

CD组  
该物品所在的CD组，物品使用时会使单位持有的相同CD组内所有物品进入使用物品的主动技能冷却
## compose_list

```lua
any[]
```

合成素材  
合成这件物品所需要的材料，拥有所有合成原料后会自动合成该物品
## compose_sfx

```lua
number
```

## critical_chance

```lua
number
```

暴击率  
为物品携带者提供的额外暴击率
## critical_dmg

```lua
number
```

暴击效果数值  
为物品携带者提供的额外暴击伤害的倍率。发生暴击时，造成的暴击伤害倍数
## cur_charge

```lua
number
```

物品创建后的初始充能层数
## cur_stack

```lua
number
```

物品创建后的初始堆叠层数
## defense_mag

```lua
number
```

法防数值  
为物品携带者提供的额外法术防御力的数值
## defense_phy

```lua
number
```

物防数值  
为物品携带者提供的额外物理防御力的数值
## delete_on_discard

```lua
boolean
```

物品在地面上是否会自动销毁
## description

```lua
number
```

描述  
描述
## disable_overlapping

```lua
boolean
```

开启后物品与物品之间会发生碰撞，可以防止物品堆叠在一起。碰撞范围设置在游戏规则-通用-物品碰撞范围中。
## discard_enable

```lua
boolean
```

可以遗弃  
玩家是否可以将物品丢弃到地面
## discard_when_dead

```lua
boolean
```

持有者死亡时掉落  
物品是否会在携带者死亡时掉落地面
## dmg_reduction

```lua
number
```

受到伤害减免比例  
为物品携带者提供的额外伤害减免
## dodge_rate

```lua
number
```

躲避率  
为物品携带者提供的额外闪避率
## drop_stay_time

```lua
number
```

消失时间  
掉落在地面上的消失时间
## effect_button

```lua
any
```

合成效果编辑按钮  
## effect_list

```lua
any[]
```

获得特效列表
## extra_dmg

```lua
number
```

所有伤害加成(%)  
为物品携带者提供的额外伤害加成
## fresnel_exp

```lua
number
```

## gold_cost

```lua
number
```

## heal_effect

```lua
number
```

被治疗效果提升(%)  
为物品携带者提供的额外受到治疗增益加成
## hit_rate

```lua
number
```

命中率  
为物品携带者提供的额外命中率
## hp_max

```lua
number
```

最大生命值  
生命值
## hp_rec

```lua
number
```

生命恢复  
为物品携带者提供的额外每秒恢复生命值
## icon

```lua
number
```

图标  
物品的头像
## init_stock

```lua
number
```

初始库存  
物品作为商品时在商店中的初始可购买数
## intelligence

```lua
number
```

智力  
为物品携带者提供的额外智力
## item_billboard_type

```lua
number
```

鼠标悬浮到物品上时显示的名称样式
## key

```lua
number
```

ID  
ID
## kv

```lua
Object.Item.Kv
```

玩家自定义  
## level

```lua
number
```

等级  
物品的等级
## material_color

```lua
any[]
```

## material_color_intensity

```lua
number
```

## max_stock

```lua
number
```

最大库存  
物品作为商品时在商店中的最大可购买数
## maximum_charging

```lua
number
```

最大充能数  
物品可以设置的最大充能层数
## maximum_stacking

```lua
number
```

最大堆叠  
物品可以叠加的最大堆叠层数。重复获得物品时，在不大于该值的情况下物品会自动堆叠。
## model

```lua
number
```

模型  
模型
## model_opacity

```lua
number
```

## mp_max

```lua
number
```

最大技能资源  
为物品携带者提供的额外最大法力值
## mp_rec

```lua
number
```

技能资源恢复  
为物品携带者提供的额外的每秒法力恢复值
## name

```lua
string|integer
```

名称  
名称
## non_zero_stacking

```lua
boolean
```

## pene_mag

```lua
number
```

法穿数值  
为物品携带者提供的额外法术穿透。先计算固定穿透，再计算百分比穿透
## pene_mag_ratio

```lua
number
```

法术穿透(%)  
为物品携带者提供的额外百分比法术穿透。先计算固定穿透，再计算百分比穿透
## pene_phy

```lua
number
```

物穿数值  
为物品携带者提供的额外物理穿透。先计算固定穿透，再计算百分比穿透
## pene_phy_ratio

```lua
number
```

无视目标物抗百分比  
为物品携带者提供的额外百分比物理穿透。先计算固定穿透，再计算百分比穿透
## precondition_list

```lua
any[]
```

前置条件  
只有满足对应条件之后物品才会在商店中可购买。
## refresh_interval

```lua
number
```

库存恢复间隔  
当前物品作为商品时，商店库存增加的间隔时间
## sale_enable

```lua
boolean
```

可以被抵押  
是否可以将该物品出售到商店
## sell_gold

```lua
number
```

## sell_res_list

```lua
any[]
```

出售获得资源  
出售到商店时获得的资源
## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## source_player_prop

```lua
string
```

## stack_type

```lua
number
```

堆叠类型  
物品的堆叠或者充能逻辑。
## start_rft

```lua
number
```

购买开始时间  
游戏开始后多长时间才能购买该类物品
## strength

```lua
number
```

力量  
力量
## suffix

```lua
string
```

编辑器后缀  
编辑器后缀
## tags

```lua
any[]
```

标签  
用于对物体的分类处理。为单位贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：杀死所有拥有XX标签的单位
## uid

```lua
string
```

UID  
UID
## use_consume

```lua
number
```

使用消耗次数  
物品是堆叠类型时，每次使用该物品消耗的堆叠层数

# Object.Item.Kv

# Object.Unit
## affect_techs

```lua
any[]
```

应用科技  
单位的可应用科技（会受到该科技的影响）
## agility

```lua
number
```

敏捷  
敏捷
## agility_grow

```lua
number
```

敏捷  
敏捷
## alarm_range

```lua
number
```

锁敌范围  
单位的警戒范围(AI)
## angle_tolerance

```lua
number
```

当单位转向时，如果转向角度小于该值，则移速不会受影响。
## armor_type

```lua
number
```

防御类型  
单位的护甲类型，具体效果可在游戏规则中查看
## attack_interval

```lua
number
```

攻击间隔  
单位两次普通攻击之前间隔的秒数，当普攻技能替换为自定义类型时，会使用技能的冷却时间
## attack_interval_grow

```lua
number
```

两次普通攻击之间的间隔时间
## attack_mag

```lua
number
```

法攻数值  
单位的法术攻击力
## attack_mag_grow

```lua
number
```

法术攻击力  
单位的法术攻击力
## attack_phy

```lua
number
```

物攻数值  
单位的物理攻击力
## attack_phy_grow

```lua
number
```

物理攻击力  
单位的物理攻击力
## attack_range

```lua
number
```

攻击范围  
单位可以攻击攻击范围内的可见单位，当普攻技能替换为自定义类型时，会使用技能的释放范围
## attack_range_grow

```lua
number
```

普通攻击的攻击范围
## attack_speed

```lua
number
```

攻速数值  
单位的攻击速度百分比，局内显示的实际攻速为:1/单位当前普通攻击技能冷却时间*攻击速度
## attack_speed_grow

```lua
number
```

攻击速度(%)  
攻击速度(倍数)
## attack_type

```lua
number
```

攻击类型  
单位的攻击类型，具体效果可在游戏规则中查看
## back_range

```lua
number
```

## bar_show_name

```lua
string|integer
```

头顶名称显示方式  
影响游戏内物体上方的文本显示内容。
## bar_show_scale

```lua
boolean
```

是否显示血条刻度  
单位血条上是否会出现刻度线
## bar_show_title

```lua
boolean
```

## bar_slot_size

```lua
number
```

物品栏  
单位的物品栏格数
## bar_title_style

```lua
number
```

## base_tint_color

```lua
any[]
```

## billboard_height_offset

```lua
number
```

单位血条高度偏移  
## billboard_name_font

```lua
string
```

头顶名称字体  
在单位头顶显示的文字字体
## billboard_scale_x

```lua
number
```

x轴缩放  
## billboard_scale_y

```lua
number
```

y轴缩放  
## blood_bar

```lua
number
```

血条样式  
该单位在游戏内的血条样式
## blood_show_type

```lua
number
```

血条显示模式  
该单位在游戏内的血条的显示时机
## body_size

```lua
number
```

模型缩放  
对当前物体模型的缩放倍数，用于调整模型大小。
## box_angle

```lua
number
```

夹角  
## box_r

```lua
number
```

半径  
## box_type

```lua
number
```

盒子类型  
## build_precondition_list

```lua
any[]
```

## build_res_cost_list

```lua
any[]
```

资源消耗  
单位作为建筑时建造会消耗的资源
## building_rotatable

```lua
boolean
```

## buy_res_list

```lua
any[]
```

购买所需资源  
单位作为商品的购买所需资源
## can_flee

```lua
boolean
```

无法反击时会逃跑  
当单位受到伤害且自身无法反击时，会向伤害来源的相反方向移动一段距离，仅在警戒状态下生效
## cancel_alarm_range

```lua
number
```

解除锁定范围  
单位的取消警戒范围(AI)，敌方离开取消警戒范围后会不再主动攻击敌方
## cd_reduce

```lua
number
```

冷却缩减  
单位技能进入cd时减少部分冷却时间
## cd_reduce_grow

```lua
number
```

冷却缩减(%)  
单位技能进入cd时减少部分冷却时间
## collision

```lua
number
```

碰撞  
## collision_box_turning_enable

```lua
boolean
```

静态碰撞跟随面向  
仅对建筑类型单位生效。勾选时，单位改变朝向时会使静态碰撞跟随旋转。
## collision_points

```lua
any[]
```

## combat_range

```lua
number
```

## common_ability_list

```lua
any[]
```

通用技能  
单位的通用技能。在默认UI界面中，会显示在前6个技能栏内，超出的不显示但依然生效。
## common_atk

```lua
any[]
```

普攻  
单位的普通攻击，唯一，单位对目标普通攻击时释放的技能
## common_atk_type

```lua
number
```

单位普通攻击的类型，选择自定义需要绑定技能
## copper_coin

```lua
number
```

## critical_chance

```lua
number
```

暴击率  
单位普通攻击有概率造成额外伤害
## critical_chance_grow

```lua
number
```

暴击率(%)  
单位普通攻击有概率造成额外伤害
## critical_dmg

```lua
number
```

暴击效果数值  
发生暴击时，造成的暴击伤害倍数
## critical_dmg_grow

```lua
number
```

暴击伤害(%)  
发生暴击时，造成的暴击伤害倍数
## custom_1_grow

```lua
number
```

## custom_2_grow

```lua
number
```

## custom_5_grow

```lua
number
```

## custom_6_grow

```lua
number
```

## custom_7_grow

```lua
number
```

## default_behaviour_type

```lua
string
```

默认行为  
单位默认状态下会执行的行为
## defense_mag

```lua
number
```

法防数值  
单位的法术防御力
## defense_mag_grow

```lua
number
```

法术防御力  
单位的法术防御力
## defense_phy

```lua
number
```

物防数值  
单位的物理防御力
## defense_phy_grow

```lua
number
```

物理防御力  
单位的物理防御力
## description

```lua
number
```

描述  
单位的介绍说明，用在编辑器内和游戏内的Tips显示上
## destroy_after_die

```lua
boolean
```

死亡后是否销毁单位  
死亡后是否会把单位完全销毁。（会在尸体消失时间结束后进行销毁，销毁后将无法再获取单位相关信息）
## die_anim

```lua
string
```

死亡  
死亡状态下会播放的动画
## disk_shadow_size

```lua
number
```

## dmg_reduction

```lua
number
```

受到伤害减免比例  
百分比降低受到的伤害
## dmg_reduction_grow

```lua
number
```

伤害减免(%)  
百分比降低受到的伤害
## dodge_rate

```lua
number
```

躲避率  
单位躲避其他单位普通攻击的概率
## dodge_rate_grow

```lua
number
```

躲避率(%)  
单位躲避其他单位普通攻击的概率
## drop_item

```lua
any[]
```

死亡后掉落物品  
## drop_items_tuple

```lua
any[]
```

掉落物品  
单位死亡后会掉落的物品
## dye_color

```lua
string
```

换色颜色  
## dye_color_plan

```lua
number
```

换色方式  
## dynamic_collision_r

```lua
number
```

碰撞动态半径  
碰撞动态半径，每50为1个标准格。
## dynamic_collision_type

```lua
number
```

动态碰撞类型  
## dynamic_collision_x

```lua
number
```

碰撞宽度  
## dynamic_collision_z

```lua
number
```

碰撞长度  
## enemy_mini_map_icon

```lua
number
```

敌方小地图头像  
## extra_dmg

```lua
number
```

所有伤害加成(%)  
百分比提高造成的伤害
## extra_dmg_grow

```lua
number
```

所有伤害加成(%)  
百分比提高造成的伤害
## force_show_on_mini_map

```lua
boolean
```

强制显示在小地图  
勾选后单位将强制显示在小地图上，无视战争阴影
## fresnel_exp

```lua
number
```

## gainvalue

```lua
number
```

技能伤害加成(%)  
该字段并无实际效果
## gainvalue_grow

```lua
number
```

技能伤害加成(%)  
该字段并无实际效果
## gold_coin

```lua
number
```

## has_mp

```lua
boolean
```

是否有技能资源条  
该单位是否有可以用来释放技能的能量
## has_shield

```lua
boolean
```

是否显示白色护盾值  
## heal_effect

```lua
number
```

被治疗效果加成(%)  
提高接受治疗时受到的治疗效果
## heal_effect_grow

```lua
number
```

被治疗效果提升(%)  
提高接受治疗时受到的治疗效果
## healing_effect

```lua
number
```

当单位受到治疗效果时，提升治疗量
## healing_effect_grow

```lua
number
```

## hero_ability_list

```lua
any[]
```

英雄技能  
单位的英雄技能，可以通过学习升级，每次学习需要消耗一个技能点（升级时获取）。在默认UI界面中，会显示在后6个技能栏内，超出的不显示但依然生效。
## hit_rate

```lua
number
```

命中率  
单位普通攻击命中其他单位的概率
## hit_rate_grow

```lua
number
```

命中率(%)  
单位普通攻击命中其他单位的概率
## hp_max

```lua
number
```

最大生命值  
单位的最大生命值
## hp_max_grow

```lua
number
```

最大生命值  
单位的最大生命值
## hp_rec

```lua
number
```

生命恢复  
单位的每秒生命恢复数值
## hp_rec_grow

```lua
number
```

生命恢复  
单位的每秒生命恢复数值
## icon

```lua
number
```

头像  
单位在游戏中显示的头像
## idle_anim

```lua
string
```

默认状态  
默认状态下会播放的动画
## init_stock

```lua
number
```

初始库存  
单位作为商品的初始库存
## intelligence

```lua
number
```

智力  
智力
## intelligence_grow

```lua
number
```

智力  
智力
## is_apply_role_color

```lua
boolean
```

是否应用玩家颜色光圈  
## is_mini_map_show

```lua
boolean
```

是否在小地图显示  
单位是否会在小地图上显示出来
## is_open_Xray

```lua
boolean
```

勾选后如果该单位被遮挡，会看到该单位的描边
## is_open_outline_pass

```lua
boolean
```

是否开启描边  
## is_shop

```lua
boolean
```

是否做为商店  
开启后单位可以作为商店编辑出售的物品
## keep_dead_body_time

```lua
number
```

尸体消失时间  
尸体消失时间
## keep_target

```lua
boolean
```

无法移动时仍然保持目标  
该字段未勾选时，在目标移动出自身的警戒范围后，且自身不能移动时，会立即开始寻找一个新的攻击目标。多用于定点守卫。
## key

```lua
number
```

ID  
单位的唯一表示
## kv

```lua
Object.Unit.Kv
```

玩家自定义  
## level

```lua
number
```

等级  
单位的默认等级
## logic_rotate_speed_valid

```lua
boolean
```

## logic_upper_rotate_speed_valid

```lua
boolean
```

## main_attr

```lua
string
```

主属性  
英雄单位的主要属性，一般主属性的提升会对英雄有额外加成
## max_stock

```lua
number
```

最大库存  
单位作为商品的最大库存
## mini_map_icon

```lua
number
```

小地图头像  
单位在小地图上的头像
## mini_map_icon_scale

```lua
number
```

小地图头像缩放  
单位在小地图上的头像的缩放
## model

```lua
number
```

模型  
当前单位所使用的的模型
## model_height

```lua
number
```

离地高度  
单位的离地高度
## model_opacity

```lua
number
```

## move_channel

```lua
number
```

移动类型  
单位的移动类型，决定单位究竟是在地面移动还是在空中移动。
## move_limitation

```lua
number
```

可移动通道  
对单位移动类型的补充，决定单位究竟是在哪些通道移动。任意通道被碰撞阻挡该单位均无法通过。
## move_type

```lua
number
```

移动类型  
影响可用的可移动通道。
## mp_color

```lua
string
```

技能资源条颜色  
该单位用来释放技能的能量的颜色
## mp_key

```lua
string
```

技能资源类型标识  
该单位用来释放技能的能量的名称
## mp_max

```lua
number
```

最大技能资源  
单位的最大技能资源
## mp_max_grow

```lua
number
```

最大技能资源  
单位的最大技能资源
## mp_rec

```lua
number
```

技能资源恢复  
单位的每秒技能资源恢复数值
## mp_rec_grow

```lua
number
```

技能资源恢复  
单位的每秒技能资源恢复数值
## name

```lua
string|integer
```

名称  
当前单位的名称
## need_preview_billboard

```lua
boolean
```

## ori_bits

```lua
number
```

单位状态  
进入游戏时，为单位附加的初始状态
## ori_speed

```lua
number
```

移速数值  
单位每秒移动的距离。
## ori_speed_grow

```lua
number
```

移动速度  
单位每秒移动的距离。
## passive_ability_list

```lua
any[]
```

被动技能列表  
隐藏技能，放在这类技能位中的技能将不会被显示在游戏中。
## pene_mag

```lua
number
```

法穿数值  
穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_mag_grow

```lua
number
```

法术穿透  
穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_mag_ratio

```lua
number
```

法术穿透(%)  
百分比穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_mag_ratio_grow

```lua
number
```

法术穿透(%)  
百分比穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
## pene_phy

```lua
number
```

物穿数值  
穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pene_phy_grow

```lua
number
```

物理穿透  
穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pene_phy_ratio

```lua
number
```

无视目标物抗百分比  
百分比穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pene_phy_ratio_grow

```lua
number
```

物理穿透(%)  
百分比穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
## pkg_slot_size

```lua
number
```

背包栏  
单位的背包栏格数
## precondition_list

```lua
any[]
```

前置条件  
训练、购买、建造该单位的前置条件
## preview_billboard_health_value

```lua
number
```

## refresh_interval

```lua
number
```

库存恢复间隔  
单位作为商品的库存恢复间隔
## research_techs

```lua
any[]
```

可研发科技  
这些科技，可以在单位身上研发、升级。
## resilience

```lua
number
```

韧性(%)  
该字段并无实际效果
## resilience_grow

```lua
number
```

韧性(%)  
该字段并无实际效果
## reward_exp

```lua
number
```

该单位被击杀后提供的经验奖励
## role_color_scale

```lua
number
```

玩家颜色缩放  
## rotate_speed

```lua
number
```

转身速度(弧度)  
单位的转身速度
## scale

```lua
number
```

## sell_list

```lua
any[]
```

出售列表  
单位作为商店时的出售列表
## sell_res_list

```lua
any[]
```

出售获得资源  
单位作为商品的出售获得资源
## separate_enemy_icon

```lua
boolean
```

是否敌友方显示不同头像  
## shop_camp_args

```lua
number
```

出售阵营参数  
## shop_key

```lua
any[]
```

商店组件  
## shop_range

```lua
number
```

出售范围  
## shop_select

```lua
boolean
```

打开同时选中  
## shop_sell_type

```lua
number
```

出售阵营类型  
## show_y3_extra_info

```lua
boolean
```

悬浮信息显示  
开启后鼠标悬浮到单位身上时会显示单位名称和等级的文本框
## silver_coin

```lua
number
```

## simple_common_atk

```lua
Object.Unit.SimpleCommonAtk
```

## sound_event_list

```lua
any[]
```

可以设置触发指定事件时播放的声音
## special_idle_anim

```lua
string
```

特殊状态  
特殊状态下会播放的动画
## speed_ratio_in_turn

```lua
number
```

当单位转向时，移动速度会受到一定的影响
## standard_walk_rate

```lua
number
```

移动动画播放速率系数  
单位移动时动画的播放速度
## start_rft

```lua
number
```

购买开始时间  
单位作为商品的可购买时间(游戏开始多久后可以购买）
## strength

```lua
number
```

力量  
力量
## strength_grow

```lua
number
```

力量  
力量
## suffix

```lua
string
```

编辑器后缀  
给使用编辑器的用户看的备注，无实际作用
## support_range

```lua
number
```

## tags

```lua
any[]
```

标签  
用于对物体的分类处理。为单位贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：杀死所有拥有XX标签的单位
## theme

```lua
number
```

主题  
## title_bg_opacity

```lua
number
```

## title_bg_scale

```lua
number
```

## title_font_type

```lua
string
```

## title_scale

```lua
number
```

## title_text_size

```lua
number
```

## turn_speed

```lua
number
```

## type

```lua
number
```

主类型  
单位类型决定了这类单位的一些特性，包括其可编辑的属性和某些属性的默认值。
## uid

```lua
string
```

UID  
## unit_hold_angle_speed

```lua
number
```

## unit_title

```lua
string
```

## use_base_tint_color

```lua
boolean
```

## use_simple_mini_map_icon

```lua
boolean
```

使用简易小地图头像  
简易小地图头像的表现为一个小点。简易小地图头像的绘制性能消耗相比普通小地图头像更小，如果地图上会出现大量的该类型单位，建议使用简易小地图头像。
## vampire_mag

```lua
number
```

法术吸血数值  
造成法术伤害后可以恢复自身生命值
## vampire_mag_grow

```lua
number
```

法术吸血(%)  
造成法术伤害后可以恢复自身生命值
## vampire_phy

```lua
number
```

物理吸血数值  
造成物理伤害后可以恢复自身生命值
## vampire_phy_grow

```lua
number
```

物理吸血(%)  
造成物理伤害后可以恢复自身生命值
## vect_drawing

```lua
number
```

立绘  
## view_type

```lua
number
```

视野类型  
单位与战争迷雾相关的一些属性
## vision_night

```lua
number
```

夜晚视野  
单位在夜晚可以看到（驱散战争迷雾）的范围
## vision_night_grow

```lua
number
```

## vision_rng

```lua
number
```

白天视野  
单位在白天可以看到（驱散战争迷雾）的范围
## vision_rng_grow

```lua
number
```

## vision_sector_angle_day

```lua
number
```

扇形视野白天夹角  
单位在白天拥有的扇形视野夹角。
## vision_sector_angle_day_grow

```lua
number
```

## vision_sector_angle_night

```lua
number
```

扇形视野夜晚夹角  
单位在夜晚拥有的扇形视野夹角。
## vision_sector_angle_night_grow

```lua
number
```

## vision_sector_night

```lua
number
```

扇形视野夜晚半径  
单位在夜晚拥有的扇形视野半径。
## vision_sector_night_grow

```lua
number
```

## vision_sector_rng

```lua
number
```

扇形视野白天半径  
单位在白天拥有的扇形视野半径。
## vision_sector_rng_grow

```lua
number
```

## vision_true

```lua
number
```

真实视野  
单位所能侦测到隐身单位的范围
## vision_true_grow

```lua
number
```

单位所能侦测到隐身单位的范围
## walk_anim

```lua
string
```

行走  
行走状态下会播放的动作

# Object.Unit.Kv

# Object.Unit.SimpleCommonAtk
## ability_animations

```lua
any[]
```

## ability_bw_point

```lua
number
```

后摇时长  
## ability_cast_point

```lua
number
```

前摇时长  
## attack_trajectory

```lua
Object.Unit.SimpleCommonAtk.AttackTrajectory
```

## cast_effect_list

```lua
any[]
```

## cast_sound

```lua
number
```

## critical_anim

```lua
string
```

## damage

```lua
any[]
```

## damage_type

```lua
number
```

## filter_condition_camp

```lua
number
```

索敌条件 - 阵营  
## filter_condition_type

```lua
number
```

索敌条件 - 类型  
## hit_effect

```lua
Object.Unit.SimpleCommonAtk.HitEffect
```

## hit_sound

```lua
number
```

## order_play_anim

```lua
boolean
```

## order_play_reset_time

```lua
number
```

## trajectory_radian

```lua
number
```

## trajectory_speed

```lua
number
```


# Object.Unit.SimpleCommonAtk.AttackTrajectory
## effect

```lua
number
```

## follow_scale

```lua
boolean
```

## scale

```lua
number
```

## socket

```lua
string
```


# Object.Unit.SimpleCommonAtk.HitEffect
## effect

```lua
number
```

## follow_scale

```lua
boolean
```

## scale

```lua
number
```

## socket

```lua
string
```


# ObjectEvent
## event

```lua
(method) ObjectEvent:event(event_name: string, ...any)
  -> Trigger
```

 注册对象的引擎事件
## object_event_manager

```lua
EventManager?
```

## subscribe_event

```lua
(method) ObjectEvent:subscribe_event(event_name: string, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```


# PYConverter
## get_py_type

```lua
function PYConverter.get_py_type(type_name: string)
  -> string
```

## lua_to_py

```lua
function PYConverter.lua_to_py(py_type: string, lua_value: any)
  -> any
```

## lua_to_py_factory

```lua
function PYConverter.lua_to_py_factory(py_type: string)
  -> fun(py_value: any):any
```

## lua_to_py_method

```lua
{ [string]: fun(lua_value: any):any }
```

## py_to_lua

```lua
function PYConverter.py_to_lua(py_type: string, py_value: any)
  -> any
```

## py_to_lua_factory

```lua
function PYConverter.py_to_lua_factory(py_type: string)
  -> fun(lua_value: any):any
```

## py_to_lua_method

```lua
{ [string]: fun(py_value: any):any }
```

## register_lua_to_py

```lua
function PYConverter.register_lua_to_py(py_type: string, converter: fun(lua_value: any):any)
```

## register_py_to_lua

```lua
function PYConverter.register_py_to_lua(py_type: string, converter: fun(py_value: any):any)
```

## register_type_alias

```lua
function PYConverter.register_type_alias(py_type_name: string, lua_type_name: string)
```

## type_alias_map

```lua
{ [string]: string }
```


# PYEventRef
## args

```lua
any[]?
```

## count

```lua
integer
```

## trg_id

```lua
integer
```


# PYEventRegister
## build_params_lazy_mt

```lua
function PYEventRegister.build_params_lazy_mt(event_data: table)
  -> table
```

## convert_py_params

```lua
function PYEventRegister.convert_py_params(event_key: y3.Const.EventType, event_params: py.Dict)
  -> table
```

## convert_py_params_instant

```lua
function PYEventRegister.convert_py_params_instant(event_name: y3.Const.EventType, event_data: table, event_params: py.Dict)
  -> table
```

## convert_py_params_lazy

```lua
function PYEventRegister.convert_py_params_lazy(event_key: y3.Const.EventType, event_data: table, event_params: py.Dict)
  -> table
```

## event_register

```lua
function PYEventRegister.event_register(event_name: y3.Const.EventType, extra_args?: any[])
```

@*param* `event_name` — 注册给引擎的事件名

@*param* `extra_args` — 额外参数
## event_unregister

```lua
function PYEventRegister.event_unregister(event_name: any, extra_args: any)
```

## need_enable_trigger_manualy

```lua
boolean
```

## next_id

```lua
function PYEventRegister.next_id()
  -> integer
```

## params_metatable_cache

```lua
table
```

## ref_args

```lua
function PYEventRegister.ref_args(name: string, args?: any[])
  -> PYEventRef
```

 为参数增加引用计数，返回引用
## ref_map

```lua
unknown
```

## remove_py_trigger

```lua
function PYEventRegister.remove_py_trigger(trigger_id: any)
```

## removed_ids

```lua
table
```

## trigger_id_counter

```lua
unknown
```

## unref_args

```lua
function PYEventRegister.unref_args(name: string, args?: any[])
  -> PYEventRef
```

 为参数减少引用计数，返回引用

# Particle
## create

```lua
function Particle.create(data: Particle.Param.Create)
  -> Particle
```

创建特效到单位或点
## create_screen

```lua
function Particle.create_screen(data: Particle.Param.Screen)
  -> Particle
```

创建屏幕特效
## get_by_handle

```lua
function Particle.get_by_handle(py_sfx: py.Sfx)
  -> Particle
```

## get_handle

```lua
(method) Particle:get_handle()
  -> py.Sfx
```

## handle

```lua
py.Sfx
```

特效
## remove

```lua
(method) Particle:remove()
```

删除粒子
## set_animation_speed

```lua
(method) Particle:set_animation_speed(speed: number)
```

设置动画速度

@*param* `speed` — 速度
## set_facing

```lua
(method) Particle:set_facing(direction: number)
```

设置朝向

@*param* `direction` — 方向
## set_height

```lua
(method) Particle:set_height(height: number)
```

设置高度

@*param* `height` — 高度
## set_point

```lua
(method) Particle:set_point(point: Point)
```

设置坐标

@*param* `point` — 点
## set_rotate

```lua
(method) Particle:set_rotate(x: number, y: number, z: number)
```

设置旋转角度

@*param* `x` — X轴角度

@*param* `y` — Y轴角度

@*param* `z` — Z轴角度
## set_scale

```lua
(method) Particle:set_scale(x: number, y: number, z: number)
```

设置缩放比例

@*param* `x` — X轴缩放

@*param* `y` — Y轴缩放

@*param* `z` — Z轴缩放
## set_time

```lua
(method) Particle:set_time(duration: number)
```

设置持续时间

@*param* `duration` — 持续时间
## type

```lua
string
```


# Particle.Param.Create
## angle

```lua
number
```

方向
## follow_rotation

```lua
integer
```

跟随单位旋转的模式，只有当 `target` 的类型为单位时有效
## follow_scale

```lua
boolean
```

是否跟随单位缩放，只有当 `target` 的类型为单位时有效
## height

```lua
number
```

高度，只有当 `target` 的类型为点时有效
## immediate

```lua
boolean
```

销毁时，是否有过度
## scale

```lua
number
```

缩放
## socket

```lua
string
```

特效挂节点，只有当 `target` 的类型为单位时有效
## target

```lua
Point|Unit
```

点
## time

```lua
number
```

持续时间
## type

```lua
py.SfxKey
```

特效类型id

# Particle.Param.Screen
## is_on_fog

```lua
boolean
```

是否在迷雾上方
## target

```lua
Player
```

玩家
## time

```lua
number
```

持续时间
## type

```lua
py.SfxKey
```

特效id

# Player
## add

```lua
(method) Player:add(key: py.RoleResKey, value: number)
```

增加属性值

@*param* `key` — 属性名

@*param* `value` — 值
## add_global_save_data

```lua
(method) Player:add_global_save_data(key: string, value: integer)
```

增加全局存档

@*param* `key` — 键

@*param* `value` — 值
## add_tech_level

```lua
(method) Player:add_tech_level(tech_type: py.TechKey, level: integer)
```

增加科技等级

@*param* `tech_type` — 科技等级

@*param* `level` — 等级
## create_unit

```lua
(method) Player:create_unit(unit_id: py.UnitKey, point?: Point, facing?: number)
  -> Unit
```

创建单位

@*param* `unit_id` — 单位类型

@*param* `point` — 单位

@*param* `facing` — 朝向
## custom_event_manager

```lua
EventManager?
```

## display_info

```lua
(method) Player:display_info(msg: string, localize?: boolean)
```

向玩家发送提示

@*param* `msg` — 消息

@*param* `localize` — 是否支持语言环境
## enable_vignetting

```lua
function Player.enable_vignetting(player: Player, is_enable: boolean)
```

@*param* `player` — 玩家

@*param* `is_enable` — 开关

设置暗角开关
## event

```lua
fun(self: Player, event: "玩家-加入游戏", callback: fun(trg: Trigger, data: EventParam.玩家-加入游戏)):Trigger
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
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any[], ...any)
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

## exit_game

```lua
(method) Player:exit_game()
```

 退出游戏
## get_all_units

```lua
(method) Player:get_all_units()
  -> unit_group: UnitGroup
```

属于某玩家的所有单位

@*return* `unit_group` — 单位组
## get_attr

```lua
(method) Player:get_attr(key: py.RoleResKey)
  -> role_res: number
```

获取玩家属性

@*param* `key` — 属性名

@*return* `role_res` — 玩家属性
## get_by_handle

```lua
function Player.get_by_handle(py_player: py.Role)
  -> Player
```

## get_by_id

```lua
function Player.get_by_id(id: integer)
  -> player: Player
```

转换玩家ID为玩家

@*param* `id` — 玩家ID

@*return* `player` — 玩家
## get_camp

```lua
(method) Player:get_camp()
  -> py.Camp
```

## get_controller

```lua
(method) Player:get_controller()
  -> role_type: y3.Const.RoleType
```

获取玩家控制者类型

@*return* `role_type` — 玩家控制者类型
## get_exp_rate

```lua
(method) Player:get_exp_rate()
  -> exp_rate: number
```

获取经验获得率

@*return* `exp_rate` — 经验获得率
## get_id

```lua
(method) Player:get_id()
  -> role_id_num: integer
```

获取玩家ID

@*return* `role_id_num` — 玩家ID
## get_local

```lua
function Player.get_local()
  -> Player
```

 获取本地玩家，注意这可能会导致不同步！  
> 警告：如果你不确定这个函数在做什么，请不要使用它！
## get_mouse_pos

```lua
(method) Player:get_mouse_pos()
  -> point: Point
```

 获取鼠标在游戏内的所在点。
 必须先设置 `y3.config.sync.mouse = true`。

@*return* `point` — 点
## get_mouse_pos_x

```lua
(method) Player:get_mouse_pos_x()
  -> pos_x: number
```

获取鼠标在屏幕上的X坐标

@*return* `pos_x` — X坐标
## get_mouse_pos_y

```lua
(method) Player:get_mouse_pos_y()
  -> pos_y: number
```

获取鼠标在屏幕上的y坐标

@*return* `pos_y` — Y坐标
## get_mouse_ui_x_percent

```lua
(method) Player:get_mouse_ui_x_percent()
  -> x_per: number
```

获取玩家鼠标屏幕坐标X的占比。
 必须先设置 `y3.config.sync.mouse = true`。

@*return* `x_per` — X的占比
## get_mouse_ui_y_percent

```lua
(method) Player:get_mouse_ui_y_percent()
  -> y_per: number
```

获取玩家鼠标屏幕坐标y的占比。
 必须先设置 `y3.config.sync.mouse = true`。

@*return* `y_per` — Y的占比
## get_name

```lua
(method) Player:get_name()
  -> role_name: string
```

获取玩家名字

@*return* `role_name` — 玩家名字
## get_operation_key

```lua
(method) Player:get_operation_key(key: py.NormalKey, assist_key: py.RecordKey)
  -> shortcut: py.EditableGameFunc
```

获取玩家响应键盘按键的基础操作（过滤掉禁止设置的）

@*param* `key` — 键名

@*param* `assist_key` — 键盘按键

@*return* `shortcut` — 基础操作
## get_platform_icon

```lua
(method) Player:get_platform_icon()
  -> icon: integer
```

获取玩家平台头像

@*return* `icon` — 平台头像
## get_platform_level

```lua
(method) Player:get_platform_level()
  -> map_level: integer
```

获取玩家平台等级

@*return* `map_level` — 平台等级
## get_platform_model

```lua
(method) Player:get_platform_model()
  -> model: py.ModelKey
```

获取玩家平台外观模型

@*return* `model` — 模型id
## get_platform_name

```lua
(method) Player:get_platform_name()
  -> name: string
```

获取玩家唯一名称

@*return* `name` — 属性名称
## get_rank_num

```lua
(method) Player:get_rank_num(key: integer)
  -> rank_num: integer
```

获取整数存档玩家排名

@*param* `key` — 存档key

@*return* `rank_num` — 整数存档玩家排名
## get_res_icon

```lua
function Player.get_res_icon(key: py.RoleResKey)
  -> icon: integer
```

获取玩家属性的货币图标

@*param* `key` — 属性名

@*return* `icon` — 图标id
## get_res_keys

```lua
function Player.get_res_keys(only_coin: boolean)
  -> py.RoleResKey[]
```

 获取所有玩家属性的属性名

@*param* `only_coin` — 只获取货币类型的玩家属性
## get_res_name

```lua
function Player.get_res_name(key: py.RoleResKey)
  -> name: string
```

获取玩家属性名称

@*param* `key` — 属性名

@*return* `name` — 属性名称
## get_save_data_bool_value

```lua
(method) Player:get_save_data_bool_value(index: integer)
  -> bool_value: boolean
```

布尔型玩家存档数据

@*param* `index` — 存档key

@*return* `bool_value` — 布尔型玩家存档数据
## get_save_data_float

```lua
(method) Player:get_save_data_float(key: integer)
  -> int_value: number
```

实数型存档数据

@*param* `key` — 存档key

@*return* `int_value` — 实数型存档数据
## get_save_data_int

```lua
(method) Player:get_save_data_int(key: integer)
  -> int_value: integer
```

获取整数型存档数据

@*param* `key` — 存档key

@*return* `int_value` — 整数型存档数据
## get_save_data_string

```lua
(method) Player:get_save_data_string(key: integer)
  -> str_value: string
```

字符串型玩家存档数据

@*param* `key` — 存档key

@*return* `str_value` — 字符串玩家存档数据
## get_save_data_table

```lua
(method) Player:get_save_data_table(key: integer)
  -> table_value: table
```

表格型玩家存档数据

@*param* `key` — 存档key

@*return* `table_value` — 表格型玩家存档数据
## get_state

```lua
(method) Player:get_state()
  -> role_status: y3.Const.RoleStatus
```

获取玩家游戏状态

@*return* `role_status` — 玩家游戏状态
## get_store_item_number

```lua
(method) Player:get_store_item_number(id: py.StoreKey)
  -> store_item_cnt: integer
```

玩家平台道具数量

@*param* `id` — 平台道具id

@*return* `store_item_cnt` — 平台道具数量
## get_team_id

```lua
(method) Player:get_team_id()
  -> camp_id: integer
```

获取队伍ID

@*return* `camp_id` — 队伍ID
## get_tech_level

```lua
(method) Player:get_tech_level(tech_id: py.TechKey)
  -> tech_level: integer
```

获取科技等级

@*param* `tech_id` — 科技id

@*return* `tech_level` — 科技等级
## handle

```lua
py.Role
```

玩家
## id

```lua
integer
```

## is_enemy

```lua
(method) Player:is_enemy(player: Player)
  -> is_enemy: boolean
```

玩家间是否是敌对关系

@*param* `player` — 玩家

@*return* `is_enemy` — 是否是敌对关系
## is_in_fog

```lua
(method) Player:is_in_fog(point: Point)
  -> is_point_in_fog: boolean
```

某个位置是否处于玩家的迷雾中

@*param* `point` — 点

@*return* `is_point_in_fog` — 点在迷雾中
## is_in_group

```lua
(method) Player:is_in_group(player_group: PlayerGroup)
  -> is_in_group: boolean
```

玩家在玩家组中

@*param* `player_group` — 玩家组

@*return* `is_in_group` — 玩家在玩家组中
## is_in_shadow

```lua
(method) Player:is_in_shadow(point: Point)
  -> is_point_in_shadow: boolean
```

某个位置是否处于玩家的黑色阴影中

@*param* `point` — 点

@*return* `is_point_in_shadow` — 点在黑色阴影中
## is_key_pressed

```lua
(method) Player:is_key_pressed(key: y3.Const.KeyboardKey|y3.Const.MouseKey)
  -> 是否被按下: boolean
```

玩家的按键是否被按下

@*param* `key` — 按键
## is_middle_join

```lua
(method) Player:is_middle_join()
  -> is_middle_join: boolean
```

玩家是否中途加入

@*return* `is_middle_join` — 是否中途加入
## is_operation_key_occupied

```lua
(method) Player:is_operation_key_occupied(key: py.NormalKey, assist_key: py.RecordKey)
  -> is_conf: boolean
```

玩家基础操作快捷键是否被占用
TODO:功能键lua层表示需要处理

@*param* `key` — 键名

@*param* `assist_key` — 辅助键名

@*return* `is_conf` — 是否被占用
## is_visible

```lua
(method) Player:is_visible(point: Point)
  -> visible: boolean
```

玩家是否可以看到某个位置

@*param* `point` — 点

@*return* `visible` — 点对于玩家可见
## kick

```lua
(method) Player:kick(reason: string)
```

强制踢出

@*param* `reason` — 踢出原因
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
```
## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## object_event_manager

```lua
EventManager?
```

## ref_manager

```lua
unknown
```

## select_unit

```lua
(method) Player:select_unit(unit_or_group: Unit|UnitGroup)
```

选中单位/单位组

@*param* `unit_or_group` — 单位/单位组
## set

```lua
(method) Player:set(key: py.RoleResKey, value: number)
```

设置属性值

@*param* `key` — 属性名

@*param* `value` — 值
## set_all_operation_key

```lua
(method) Player:set_all_operation_key(operation: py.AllGameFunc, is_enable: boolean)
```

设置玩家的基础操作开关（包含所有基础操作）
TODO:operation在lua层的表示方式待整理 方法名英文待确认

@*param* `operation` — 可编辑操作

@*param* `is_enable` — 是否开
## set_color_grading

```lua
(method) Player:set_color_grading(value: integer)
```

 设置滤镜

@*param* `value` — 滤镜
## set_exp_rate

```lua
(method) Player:set_exp_rate(rate: number)
```

设置经验获得率

@*param* `rate` — 经验获得率
## set_follow_distance

```lua
(method) Player:set_follow_distance(distance: number)
```

设置跟随距离

@*param* `distance` — 距离
## set_hostility

```lua
(method) Player:set_hostility(player: Player, is_hostile: boolean)
```

设置敌对关系

@*param* `player` — 玩家

@*param* `is_hostile` — 是否敌视
## set_local_terrain_visible

```lua
(method) Player:set_local_terrain_visible(is_visible: boolean)
```

显示/隐藏玩家地表纹理

@*param* `is_visible` — 显示/隐藏
## set_mouse_click_selection

```lua
(method) Player:set_mouse_click_selection(is_enable: boolean)
```

为玩家开/关鼠标点选

@*param* `is_enable` — 是否开鼠标点选
## set_mouse_drag_selection

```lua
(method) Player:set_mouse_drag_selection(is_enable: boolean)
```

为玩家开/关鼠标框选

@*param* `is_enable` — 是否开鼠标框选
## set_mouse_wheel

```lua
(method) Player:set_mouse_wheel(is_enable: boolean)
```

为玩家开/关鼠标滚轮

@*param* `is_enable` — 是否开鼠标滚轮
## set_name

```lua
(method) Player:set_name(name: string)
```

设置名字

@*param* `name` — 名字
## set_operation_key

```lua
(method) Player:set_operation_key(operation: py.EditableGameFunc, key: py.NormalKey, assist_key: py.RecordKey)
```

设置玩家的基础操作快捷键（过滤掉禁止设置的） 
TODO:operation在lua层的表示方式待整理 方法名英文待确认

@*param* `operation` — 可编辑操作

@*param* `key` — 功能按键

@*param* `assist_key` — 辅助按键
## set_role_vignetting_breath_rate

```lua
(method) Player:set_role_vignetting_breath_rate(circle_time: number)
```

设置暗角呼吸周期

@*param* `circle_time` — 呼吸周期
## set_strict_group_navigation

```lua
(method) Player:set_strict_group_navigation(is_strict: boolean)
```

设置群体寻路严格模式

@*param* `is_strict` — 是否严格
## set_team

```lua
(method) Player:set_team(id: py.Camp)
```

设置队伍ID
## set_tech_level

```lua
(method) Player:set_tech_level(tech_type: py.TechKey, level: integer)
```

设置科技等级

@*param* `tech_type` — 科技等级

@*param* `level` — 等级
## set_vignetting_change_range

```lua
(method) Player:set_vignetting_change_range(range: number)
```

设置暗角变化幅度

@*param* `range` — 幅度
## set_vignetting_color

```lua
(method) Player:set_vignetting_color(red: number, green: number, blue: number, time: number)
```

设置暗角颜色

@*param* `red` — 颜色r

@*param* `green` — 颜色g

@*param* `blue` — 颜色b

@*param* `time` — 过渡时间
## set_vignetting_size

```lua
(method) Player:set_vignetting_size(size: number)
```

设置暗角大小

@*param* `size` — 大小
## share_vision_of_unit

```lua
(method) Player:share_vision_of_unit(unit: Unit, share: boolean)
```

获取单位的视野

@*param* `unit` — 单位
## share_vision_with_player

```lua
(method) Player:share_vision_with_player(target_player: Player, share: boolean)
```

对玩家开放视野

@*param* `target_player` — 玩家
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

## type

```lua
string
```

## upload_save_data

```lua
(method) Player:upload_save_data()
```

上传存档
## use_store_item

```lua
(method) Player:use_store_item(count: integer, item_id: py.StoreKey)
```

消耗玩家平台道具

@*param* `count` — 个数

@*param* `item_id` — 平台道具id

# PlayerGroup
## add_player

```lua
(method) PlayerGroup:add_player(player: Player)
```

添加玩家

@*param* `player` — 玩家
## get_all_players

```lua
function PlayerGroup.get_all_players()
  -> player_group: PlayerGroup
```

获取所有玩家

@*return* `player_group` — 单位组
## get_ally_player_group_by_player

```lua
function PlayerGroup.get_ally_player_group_by_player(player: Player)
  -> player_group: PlayerGroup
```

玩家的所有同盟玩家

@*param* `player` — 玩家

@*return* `player_group` — 单位组
## get_by_handle

```lua
function PlayerGroup.get_by_handle(py_role_group: py.RoleGroup)
  -> PlayerGroup
```

## get_defeated_player_group

```lua
function PlayerGroup.get_defeated_player_group()
  -> player_group: PlayerGroup
```

获取所有失败的玩家

@*return* `player_group` — 单位组
## get_enemy_player_group_by_player

```lua
function PlayerGroup.get_enemy_player_group_by_player(player: Player)
  -> player_group: PlayerGroup
```

玩家的所有敌对玩家

@*param* `player` — 玩家

@*return* `player_group` — 单位组
## get_neutral_player_group

```lua
function PlayerGroup.get_neutral_player_group()
  -> player_group: PlayerGroup
```

所有非中立玩家

@*return* `player_group` — 单位组
## get_player_group_by_camp

```lua
function PlayerGroup.get_player_group_by_camp(camp: py.Camp)
  -> player_group: PlayerGroup
```

阵营內所有玩家

@*param* `camp` — 阵营

@*return* `player_group` — 单位组
## get_victorious_player_group

```lua
function PlayerGroup.get_victorious_player_group()
  -> player_group: PlayerGroup
```

获取所有胜利的玩家

@*return* `player_group` — 单位组
## handle

```lua
py.RoleGroup
```

玩家组
## pick

```lua
(method) PlayerGroup:pick()
  -> Player[]
```

遍历玩家组中玩家做动作    --不处理遍历
## remove_player

```lua
(method) PlayerGroup:remove_player(player: Player)
```

移除玩家

@*param* `player` — 玩家
## type

```lua
string
```


# Point
## create

```lua
function Point.create(x: number, y: number, z?: number)
  -> Point
```

坐标转化为点

@*param* `x` — 点X坐标

@*param* `y` — 点Y坐标

@*param* `z` — 点Z坐标
## get_angle_with

```lua
(method) Point:get_angle_with(other: Point)
  -> number
```

 获取与另一个点的方向
## get_by_handle

```lua
function Point.get_by_handle(py_point: Point.HandleType)
  -> Point
```

根据py对象创建点
## get_distance_with

```lua
(method) Point:get_distance_with(other: Point)
  -> number
```

 获取与另一个点的距离
## get_point_by_res_id

```lua
function Point.get_point_by_res_id(res_id: integer)
  -> Point
```

## get_point_in_path

```lua
function Point.get_point_in_path(path: table, index: integer)
  -> Point
```

路径中的点

@*param* `path` — 目标路径

@*param* `index` — 索引
## get_point_offset_vector

```lua
function Point.get_point_offset_vector(point: Point, direction: number, offset: number)
  -> Point
```

点向方向偏移

@*param* `point` — 点

@*param* `direction` — 偏移方向点

@*param* `offset` — 偏移量
## get_x

```lua
(method) Point:get_x()
  -> number
```

点的x坐标
## get_y

```lua
(method) Point:get_y()
  -> number
```

点的y坐标
## get_z

```lua
(method) Point:get_z()
  -> number
```

点的z坐标
## handle

```lua
Point.HandleType
```

点
## map

```lua
table
```

## move

```lua
(method) Point:move(x?: number, y?: number, z?: number)
  -> Point
```

 移动点
## res_id

```lua
integer?
```

## type

```lua
string
```


# Point.HandleType
点
```lua
py.FPoint
```


# Pool
## add

```lua
(method) Pool:add(obj: any, w?: integer)
```

 添加对象
## add_weight

```lua
(method) Pool:add_weight(obj: any, w: integer)
```

 增加对象的权重
## clear

```lua
(method) Pool:clear()
```

 清空池
## del

```lua
(method) Pool:del(obj: any)
```

 移除对象
## dump

```lua
(method) Pool:dump()
  -> string
```

 显示池的内容，仅用于调试
## get_weight

```lua
(method) Pool:get_weight(obj: any)
  -> integer
```

 获取对象的权重
## has

```lua
(method) Pool:has(obj: any)
  -> boolean
```

 是否包含对象
## pairs

```lua
(method) Pool:pairs()
  -> fun():any, integer
```

 遍历池的对象
## pool

```lua
table<any, integer>
```

## random

```lua
(method) Pool:random(filter?: fun(obj: any):boolean)
  -> any
```

 随机抽取一个对象
## random_n

```lua
(method) Pool:random_n(num: integer, filter?: fun(obj: any):boolean)
  -> any[]
```

 抽取多个随机对象，不重复
## set_weight

```lua
(method) Pool:set_weight(obj: any, w: integer)
```

 修改对象的权重

# Projectile
## add_tag

```lua
(method) Projectile:add_tag(tag: string)
```

投射物添加标签

@*param* `tag` — 标签
## add_time

```lua
(method) Projectile:add_time(duration: number)
```

增加持续时间

@*param* `duration` — 持续时间
## break_mover

```lua
(method) Projectile:break_mover()
```

打断运动器
## create

```lua
function Projectile.create(data: Projectile.CreateData)
  -> Projectile
```

 创建投射物

@*param* `data` — 投射物创建数据
## event

```lua
fun(self: Projectile, event: "投射物-创建", callback: fun(trg: Trigger, data: EventParam.投射物-创建)):Trigger
```

## get_ability

```lua
(method) Projectile:get_ability()
  -> ability: Ability?
```

获得关联技能

@*return* `ability` — 投射物或魔法效果的关联技能
## get_by_handle

```lua
function Projectile.get_by_handle(py_projectile: py.ProjectileEntity)
  -> projectile: Projectile
```

## get_facing

```lua
(method) Projectile:get_facing()
  -> angle: number
```

获取投射物朝向

@*return* `angle` — 投射物朝向
## get_height

```lua
(method) Projectile:get_height()
  -> height: number
```

获取投射物高度

@*return* `height` — 高度
## get_key

```lua
(method) Projectile:get_key()
  -> projectile_key: py.ProjectileKey
```

获取投射物的类型ID
## get_left_time

```lua
(method) Projectile:get_left_time()
  -> duration: number
```

获取投射物剩余持续时间

@*return* `duration` — 投射物剩余持续时间
## get_owner

```lua
(method) Projectile:get_owner()
  -> unit: Unit
```

获取投射物的拥有者

@*return* `unit` — 投射物的拥有者
## get_point

```lua
(method) Projectile:get_point()
  -> point: Point
```

获取投射物所在点

@*return* `point` — 投射物所在点
## handle

```lua
py.ProjectileEntity
```

投掷物对象
## has_tag

```lua
(method) Projectile:has_tag(tag: string)
  -> is_has_tag: boolean
```

是否拥有标签

@*param* `tag` — 标签

@*return* `is_has_tag` — 是否拥有标签
## id

```lua
integer
```

## is_exist

```lua
(method) Projectile:is_exist()
  -> is_exist: boolean
```

是否存在

@*return* `is_exist` — 是否存在
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
```
## kv_save

```lua
(method) KV:kv_save(key: string, value: KV.SupportType)
```

 保存自定义键值对。可以与ECA互通。
## mover_curve

```lua
(method) Projectile:mover_curve(mover_data: Mover.CreateData.Curve)
  -> Mover
```

创建曲线运动器
## mover_line

```lua
(method) Projectile:mover_line(mover_data: Mover.CreateData.Line)
  -> Mover
```

创建直线运动器
## mover_round

```lua
(method) Projectile:mover_round(mover_data: Mover.CreateData.Round)
  -> Mover
```

创建环绕运动器
## mover_target

```lua
(method) Projectile:mover_target(mover_data: Mover.CreateData.Target)
  -> Mover
```

创建追踪运动器
## object_event_manager

```lua
EventManager?
```

## ref_manager

```lua
unknown
```

## remove

```lua
(method) Projectile:remove()
```

销毁
## remove_mover

```lua
(method) Projectile:remove_mover()
```

移除运动器
## remove_tag

```lua
(method) Projectile:remove_tag(tag: string)
```

投射物移除标签

@*param* `tag` — 标签
## set_ability

```lua
(method) Projectile:set_ability(ability: Ability)
```

设置关联技能

@*param* `ability` — 关联技能
## set_animation_speed

```lua
(method) Projectile:set_animation_speed(speed: number)
```

设置动画速度
## set_facing

```lua
(method) Projectile:set_facing(direction: number)
```

设置朝向

@*param* `direction` — 朝向
## set_height

```lua
(method) Projectile:set_height(height: number)
```

设置高度

@*param* `height` — 高度
## set_owner

```lua
(method) Projectile:set_owner(unit: Unit)
```

设置所属单位

@*param* `unit` — 所属单位
## set_point

```lua
(method) Projectile:set_point(point: Point)
```

设置坐标

@*param* `point` — 点坐标
## set_rotation

```lua
(method) Projectile:set_rotation(x: number, y: number, z: number)
```

设置旋转

@*param* `x` — x轴

@*param* `y` — y轴

@*param* `z` — z轴
## set_scale

```lua
(method) Projectile:set_scale(x: number, y: number, z: number)
```

设置缩放

@*param* `x` — x轴

@*param* `y` — y轴

@*param* `z` — z轴
## set_time

```lua
(method) Projectile:set_time(duration: number)
```

设置持续时间

@*param* `duration` — 持续时间
## subscribe_event

```lua
(method) ObjectEvent:subscribe_event(event_name: string, ...any)
  -> any[]?
  2. Trigger.CallBack
  3. Unsubscribe: function
```

## type

```lua
string
```


# Projectile.CreateData
## ability

```lua
Ability
```

投射物关联技能
## angle

```lua
number
```

投射物朝向
## height

```lua
number
```

投射物高度
## key

```lua
py.ProjectileKey
```

投射物类型ID
## owner

```lua
Player|Unit
```

投射物拥有者
## remove_immediately

```lua
boolean
```

是否立即移除表现，如果不填会读表
## socket

```lua
string
```

投射物关联骨骼，只有当 `target` 为单位时才有效
## target

```lua
Point|Unit
```

创建位置
## time

```lua
number
```

投射物持续时间
## visible_rule

```lua
integer
```

粒子特效可见性规则，默认为`1`

# ProjectileGroup
## create_lua_projectile_group_from_py

```lua
function ProjectileGroup.create_lua_projectile_group_from_py(py_projectile_group: py.ProjectileGroup)
  -> ProjectileGroup
```

## get_all_projectile_in_shapes

```lua
function ProjectileGroup.get_all_projectile_in_shapes(point: Point, shape: Shape)
  -> ProjectileGroup
```

筛选范围内的所有投射物

@*param* `point` — 点

@*param* `shape` — 筛选范围
## get_all_projectiles_with_tag

```lua
function ProjectileGroup.get_all_projectiles_with_tag(tag: string)
  -> ProjectileGroup
```

获取拥有指定标签的投射物

@*param* `tag` — 点
## handle

```lua
py.ProjectileGroup
```

投射物组
## pick

```lua
(method) ProjectileGroup:pick()
  -> Projectile[]
```

遍历投射物组中投射物做动作
## type

```lua
string
```


# Proxy
## config

```lua
function Proxy.config(proxyObj: table)
  -> table
```

## new

```lua
function Proxy.new(obj: <T>, config?: Proxy.Config, custom?: any)
  -> <T>
```

@*param* `obj` — 要代理的对象

@*param* `config` — 配置

@*param* `custom` — 自定义数据
## raw

```lua
function Proxy.raw(proxyObj: table)
  -> any
```


# Proxy.Config
## anyGetter

```lua
Proxy.Getter
```

只有没有对应的 `getter` 才会触发 `anyGetter`
## anySetter

```lua
Proxy.Setter
```

只有没有对应的 `setter` 才会触发 `anySetter`
## cache

```lua
boolean
```

将读写的结果缓存起来，下次读写时不会再触发`setter`,`getter`（除非上次的结果是`nil`
## getter

```lua
{ [any]: Proxy.Getter }?
```

## setter

```lua
{ [any]: Proxy.Setter }?
```

## updateRaw

```lua
boolean
```

是否将赋值写入到 `raw` 中

# Proxy.Getter

```lua
fun(self: table, raw: any, key: any, config: Proxy.Config, custom: any):any
```


# Proxy.Setter

```lua
fun(self: table, raw: any, key: any, value: any, config: Proxy.Config, custom: any):any
```


# Ref
## allowWeakRef

```lua
boolean
```

 是否允许弱引用
## className

```lua
<T>
```

 用于管理的对象类名
## get

```lua
(method) Ref:get(key: any, ...any)
  -> any
```

 获取指定key的对象，如果不存在，则使用所有的参数创建并返回
## newMethod

```lua
fun(key: any, ...any):<T:string>
```

 创建新对象的方法
## remove

```lua
(method) Ref:remove(key: any)
```

 移除指定的key
## strongRefMap

```lua
table
```

 强引用
## unrefTimeAtLeast

```lua
integer
```

 至少在这个时间之后才会释放引用
## updateTimer

```lua
unknown
```

## updateWaitingList

```lua
(method) Ref:updateWaitingList()
```

## waitingListOld

```lua
table
```

 待删除列表（老年代）
## waitingListYoung

```lua
table
```

 待删除列表（青年代）
## weakRefMap

```lua
table
```

 弱引用

# Ref.ValidKeyType

```lua
any
```


# Reload
## afterReloadCallbacks

```lua
{ name: string, callback: Reload.afterReloadCallback }[]
```

## beforeReloadCallbacks

```lua
{ name: string, callback: Reload.beforeReloadCallback }[]
```

## defaultReloadOptional

```lua
nil
```

## filter

```lua
(fun(name: string, reload: Reload):boolean)?
```

## fire

```lua
(method) Reload:fire()
```

## getCurrentIncludeName

```lua
function Reload.getCurrentIncludeName()
  -> string?
```

## include

```lua
function Reload.include(name: string)
  -> any
```

 类似于 `require` ，但是会在重载时重新加载文件。
## includeStack

```lua
table
```

## includedNameMap

```lua
{ [string]: boolean }
```

## includedNames

```lua
string[]
```

## isValidName

```lua
(method) Reload:isValidName(name?: string)
  -> boolean
```

 模块名是否会被重载
## onAfterReload

```lua
function Reload.onAfterReload(callback: Reload.afterReloadCallback)
```

 注册在重载之后的回调
## onBeforeReload

```lua
function Reload.onBeforeReload(callback: Reload.beforeReloadCallback)
```

 注册在重载之前的回调
## optional

```lua
(Reload.Optional)?
```

## reload

```lua
function Reload.reload(optional?: Reload.Optional)
```

 进行重载
## setDefaultOptional

```lua
function Reload.setDefaultOptional(optional?: Reload.Optional)
```

 设置默认的重载选项
## validMap

```lua
table<string, any>
```


# Reload.Optional
## filter

```lua
fun(name: string, reload: Reload):boolean
```

过滤函数
## list

```lua
string[]
```

要重载的模块列表

# Reload.afterReloadCallback

```lua
fun(reload: Reload, hasReloaded: boolean)
```


# Reload.beforeReloadCallback

```lua
fun(reload: Reload, willReload: boolean)
```


# Road
## add_point

```lua
(method) Road:add_point(index: integer, point: Point)
```

给路径添加点

@*param* `index` — 序号

@*param* `point` — 点
## add_tag

```lua
(method) Road:add_tag(tag: string)
```

给路径添加标签

@*param* `tag` — 序号
## create_path

```lua
function Road.create_path(start_point: Point)
  -> 创建的路径: Road
```

以点为起点创建路径

@*param* `start_point` — 起点
## get_by_handle

```lua
function Road.get_by_handle(py_road: py.Road)
  -> Road
```

## get_path_areas_by_tag

```lua
function Road.get_path_areas_by_tag(tag: string)
  -> 路径: Road[]
```

按标签获取所有的路径

@*param* `tag` — 标签
## get_point_count

```lua
(method) Road:get_point_count()
  -> integer
```

获取路径中点的个数
## get_road_by_res_id

```lua
function Road.get_road_by_res_id(res_id: integer)
  -> Road
```

## handle

```lua
py.Road
```

路径
## has_tag

```lua
(method) Road:has_tag(tag: string)
  -> 路径是否有tag: boolean
```

路径是否有tag

@*param* `tag` — tag
## map

```lua
table
```

## remove_path

```lua
(method) Road:remove_path()
```

删除路径
## remove_point

```lua
(method) Road:remove_point(index: integer)
```

给路径移除点

@*param* `index` — 序号
## remove_tag

```lua
(method) Road:remove_tag(tag: string)
```

给路径移除标签

@*param* `tag` — 序号
## res_id

```lua
integer
```


# SaveData
## load_boolean

```lua
function SaveData.load_boolean(player: Player, slot: integer)
  -> boolean
```

 获取玩家的存档数据（布尔）
## load_integer

```lua
function SaveData.load_integer(player: Player, slot: integer)
  -> integer
```

 获取玩家的存档数据（整数）
## load_real

```lua
function SaveData.load_real(player: Player, slot: integer)
  -> number
```

 获取玩家的存档数据（实数）
## load_string

```lua
function SaveData.load_string(player: Player, slot: integer)
  -> string
```

 获取玩家的存档数据（字符串）
## load_table

```lua
function SaveData.load_table(player: Player, slot: integer, disable_cover: boolean)
  -> table
```

 获取玩家的存档数据（表）

@*param* `disable_cover` — 是否禁用覆盖，必须和存档设置中的一致
## load_table_with_cover_disable

```lua
function SaveData.load_table_with_cover_disable(player: Player, slot: integer)
  -> table
```

## load_table_with_cover_enable

```lua
function SaveData.load_table_with_cover_enable(player: Player, slot: integer)
  -> table
```

## save_boolean

```lua
function SaveData.save_boolean(player: Player, slot: integer, value: boolean)
```

 保存玩家的存档数据（布尔）
## save_integer

```lua
function SaveData.save_integer(player: Player, slot: integer, value: integer)
```

 保存玩家的存档数据（整数）
## save_real

```lua
function SaveData.save_real(player: Player, slot: integer, value: number)
```

 保存玩家的存档数据（实数）
## save_string

```lua
function SaveData.save_string(player: Player, slot: integer, value: string)
```

 保存玩家的存档数据（字符串）
## save_table

```lua
function SaveData.save_table(player: Player, slot: integer, t: table)
```

 保存玩家的存档数据（表），存档设置中必须使用允许覆盖模式
## table_cache

```lua
table
```

## timer_map

```lua
{ [Player]: LocalTimer }
```

## upload_save_data

```lua
function SaveData.upload_save_data(player: Player)
```


# Selector
## count

```lua
(method) Selector:count(count: integer)
  -> Selector
```

 选项 - 选取的数量
## create

```lua
function Selector.create()
  -> Selector
```

 创建选取器
## get

```lua
(method) Selector:get()
  -> UnitGroup
```

 进行选取
## in_shape

```lua
(method) Selector:in_shape(pos: Point, shape: Shape)
  -> Selector
```

 形状 - 添加形状对象
## in_state

```lua
(method) Selector:in_state(state: integer)
  -> Selector
```

 条件 - 拥有某个特定的状态
## include_dead

```lua
(method) Selector:include_dead()
  -> Selector
```

 选项 - 包含死亡的单位
## is_unit_key

```lua
(method) Selector:is_unit_key(unit_key: py.UnitKey)
  -> Selector
```

 条件 - 是某个特定的单位类型
## is_unit_type

```lua
(method) Selector:is_unit_type(unit_type: py.UnitType)
  -> Selector
```

 条件 - 是某个特定的单位类型
## is_visible

```lua
(method) Selector:is_visible(p: Player)
  -> Selector
```

 条件 - 对某个玩家可见
## not_in_group

```lua
(method) Selector:not_in_group(ug: UnitGroup)
  -> Selector
```

 条件 - 不在某个单位组中
## not_in_state

```lua
(method) Selector:not_in_state(state: integer)
  -> Selector
```

 条件 - 不拥有某个特定的状态
## not_is

```lua
(method) Selector:not_is(u: Unit)
  -> Selector
```

 条件 - 不是某个特定的单位
## not_visible

```lua
(method) Selector:not_visible(p: Player)
  -> Selector
```

 条件 - 对某个玩家不可见
## of_player

```lua
(method) Selector:of_player(p: Player)
  -> Selector
```

 条件 - 属于某个玩家
## with_tag

```lua
(method) Selector:with_tag(tag: string)
  -> Selector
```

 条件 - 拥有特定标签
## without_tag

```lua
(method) Selector:without_tag(tag: string)
  -> Selector
```

 条件 - 不拥有特定标签

# Serialization
## decode

```lua
function Serialization.decode(str: string, hook?: fun(value: Serialization.SupportTypes):Serialization.SupportTypes)
  -> Serialization.SupportTypes
```

 反序列化二进制数据为Lua值
## encode

```lua
function Serialization.encode(data: Serialization.SupportTypes, hook?: fun(value: table):Serialization.SupportTypes)
  -> string
```

 将一个Lua值序列化为二进制数据

# Serialization.SupportTypes

```lua
boolean|string|number|table|nil
```


# Shape
## create_annular_shape

```lua
function Shape.create_annular_shape(in_radius: number, out_radius: number)
  -> Shape
```

创建环形区域

@*param* `in_radius` — 内半径

@*param* `out_radius` — 外半径
## create_circular_shape

```lua
function Shape.create_circular_shape(radius: number)
  -> Shape
```

创建圆形区域

@*param* `radius` — 半径
## create_rectangle_shape

```lua
function Shape.create_rectangle_shape(width: number, length: number, angle: number)
  -> Shape
```

创建矩形区域

@*param* `width` — 宽度

@*param* `length` — 长度

@*param* `angle` — 角度
## create_sector_shape

```lua
function Shape.create_sector_shape(radius: number, angle: number, direction: number)
  -> Shape
```

扇形

@*param* `radius` — 半径

@*param* `angle` — 角度

@*param* `direction` — 方向
## get_by_handle

```lua
function Shape.get_by_handle(py_shape: py.Shape)
  -> Shape
```

## handle

```lua
py.Shape
```

形状
## type

```lua
string
```


# SortByScoreCallback

```lua
fun(o: any):integer
```


# Sound
## get_by_handle

```lua
function Sound.get_by_handle(py_sound: py.SoundEntity)
  -> Sound
```

## handle

```lua
py.SoundEntity
```

声音对象
## play

```lua
function Sound.play(player: Player, sound: py.AudioKey, options?: Sound.PlayOptions)
  -> Sound?
```

播放声音

@*param* `player` — 玩家

@*param* `sound` — 声音

@*param* `options` — 播放选项
## play_3d

```lua
function Sound.play_3d(player: Player, sound: py.AudioKey, point: Point, options?: Sound.Play3DOptions)
  -> Sound?
```

播放3D声音

@*param* `player` — 玩家

@*param* `sound` — 声音

@*param* `point` — 目标点

@*param* `options` — 播放选项
## play_with_object

```lua
function Sound.play_with_object(player: Player, sound: py.AudioKey, unit: Unit, options?: Sound.PlayUnitOptions)
  -> Sound?
```

跟随单位播放声音

@*param* `player` — 玩家

@*param* `sound` — 声音

@*param* `unit` — 跟随的单位

@*param* `options` — 播放选项
## set_volume

```lua
(method) Sound:set_volume(player: Player, volume: integer)
```

 设置音量

@*param* `player` — 玩家

@*param* `volume` — 音量(0-100)
## stop

```lua
(method) Sound:stop(player: Player, is_immediately?: boolean)
```

停止播放声音

@*param* `player` — 玩家

@*param* `is_immediately` — 是否立即停止

# Sound.Play3DOptions
## ensure

```lua
boolean
```

是否确保播放
## fade_in

```lua
number
```

渐入时间
## fade_out

```lua
number
```

渐出时间
## height

```lua
number
```

高度
## loop

```lua
boolean
```

是否循环

# Sound.PlayOptions
## fade_in

```lua
number
```

渐入时间
## fade_out

```lua
number
```

渐出时间
## loop

```lua
boolean
```

是否循环

# Sound.PlayUnitOptions
## ensure

```lua
boolean
```

是否确保播放
## fade_in

```lua
number
```

渐入时间
## fade_out

```lua
number
```

渐出时间
## loop

```lua
boolean
```

是否循环
## offset_x

```lua
number
```

X轴偏移
## offset_y

```lua
number
```

Y轴偏移
## offset_z

```lua
number
```

Z轴偏移

# Storage
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


# Technology
## check_precondition_by_key

```lua
function Technology.check_precondition_by_key(player: Player, tech_key: py.TechKey)
  -> is_meet: boolean
```

检查科技类型前置条件

@*param* `player` — 玩家

@*param* `tech_key` — 技能类型id (物编id)

@*return* `is_meet` — 技能类型前置条件是否满足

# Timer
 同步计时器，所有玩家必须使用一致的计时器## all_timers

```lua
table
```

## count_loop

```lua
function Timer.count_loop(timeout: number, times: integer, on_timer: fun(timer: Timer, count: integer), desc?: string)
  -> Timer
```

 循环执行，可以指定最大次数

@*param* `desc` — 描述
## count_loop_frame

```lua
function Timer.count_loop_frame(frame: integer, times: integer, on_timer: fun(timer: Timer, count: integer), desc?: string)
  -> Timer
```

 每经过一定帧数后执行，可以指定最大次数
> 请改用 `y3.ltimer.count_loop_frame`

@*param* `desc` — 描述
## desc

```lua
string
```

## execute

```lua
(method) Timer:execute(...any)
```

 立即执行
## get_by_handle

```lua
function Timer.get_by_handle(py_timer: py.Timer, on_timer: Timer.OnTimer)
  -> Timer
```

## get_elapsed_time

```lua
(method) Timer:get_elapsed_time()
  -> time: number
```

获取计时器经过的时间

@*return* `time` — 计时器经过的时间
## get_include_name

```lua
(method) Timer:get_include_name()
  -> string?
```

## get_init_count

```lua
(method) Timer:get_init_count()
  -> count: integer
```

获取计时器初始计数

@*return* `count` — 初始计数
## get_remaining_count

```lua
(method) Timer:get_remaining_count()
  -> count: integer
```

获取计时器剩余计数

@*return* `count` — 剩余计数
## get_remaining_time

```lua
(method) Timer:get_remaining_time()
  -> time: number
```

获取计时器剩余时间

@*return* `time` — 计时器剩余时间
## get_time_out_time

```lua
(method) Timer:get_time_out_time()
  -> time: number
```

获取计时器设置的时间

@*return* `time` — 设置的时间
## handle

```lua
py.Timer
```

计时器
## id

```lua
unknown
```

## id_counter

```lua
unknown
```

## include_name

```lua
string?
```

## is_running

```lua
(method) Timer:is_running()
  -> boolean
```

 是否在运行
## loop

```lua
function Timer.loop(timeout: number, on_timer: fun(timer: Timer, count: integer), desc?: string)
  -> Timer
```

 循环执行

@*param* `desc` — 描述
## loop_frame

```lua
function Timer.loop_frame(frame: integer, on_timer: fun(timer: Timer, count: integer), desc?: string)
  -> Timer
```

 每经过一定帧数后执行
> 请改用 `y3.ltimer.loop_frame`

@*param* `desc` — 描述
## mode

```lua
Timer.Mode
```

## on_timer

```lua
Timer.OnTimer
```

## pairs

```lua
function Timer.pairs()
  -> fun():Timer?
```

 遍历所有的计时器，仅用于调试（可能会遍历到已经失效的）
## pause

```lua
(method) Timer:pause()
```

 暂停计时器
## remove

```lua
(method) Timer:remove()
```

 移除计时器
## resume

```lua
(method) Timer:resume()
```

 继续计时器
## type

```lua
string
```

## wait

```lua
function Timer.wait(timeout: number, on_timer: fun(timer: Timer), desc?: string)
  -> Timer
```

 等待时间后执行

@*param* `desc` — 描述
## wait_frame

```lua
function Timer.wait_frame(frame: integer, on_timer: fun(timer: Timer), desc?: string)
  -> Timer
```

 等待一定帧数后执行
> 请改用 `y3.ltimer.wait_frame`

@*param* `desc` — 描述

# Timer.Mode
```lua
Timer.Mode:
    | 'second'
    | 'frame'
```
```lua
'frame'|'second'
```


# Timer.OnTimer

```lua
fun(timer: Timer, ...any)
```


# Trigger
## disable

```lua
(method) Trigger:disable()
```

禁用触发器
## enable

```lua
(method) Trigger:enable()
```

## execute

```lua
(method) Trigger:execute(...any)
  -> any
  2. any
  3. any
  4. any
```

 运行触发器，最多能返回4个返回值
## get_include_name

```lua
(method) Trigger:get_include_name()
  -> string?
```

## is_enable

```lua
(method) Trigger:is_enable()
  -> boolean
```

## is_match_args

```lua
(method) Trigger:is_match_args(fire_args?: any[])
  -> boolean
```

 检查事件的参数与触发器的参数是否匹配，
 允许事件的参数数量多余触发器的参数数量。
## on_remove

```lua
(method) Trigger:on_remove(callback: any)
```

## remove

```lua
(method) Trigger:remove()
```

## type

```lua
string
```


# Trigger.CallBack

```lua
fun(...any):any, any, any, any
```


# UIPrefab
## create

```lua
function UIPrefab.create(player: Player, prefab_name: string, parent_ui: UI)
  -> UIPrefab
```

创建界面模块实例

@*param* `player` — 玩家

@*param* `prefab_name` — 界面模块id

@*param* `parent_ui` — 父控件
## get_by_handle

```lua
function UIPrefab.get_by_handle(player: Player, prefab_name: string)
  -> UIPrefab
```

通过py层的界面实例获取lua层的界面实例

@*param* `player` — 玩家

@*return* — 返回在lua层初始化后的lua层技能实例
## get_ui

```lua
(method) UIPrefab:get_ui(player: Player)
  -> UI
```

 获取 UIPrefab 的 UI 实例

@*param* `player` — 玩家
## handle

```lua
string
```

## player

```lua
Player
```

## remove

```lua
(method) UIPrefab:remove()
```

删除界面模块实例
## type

```lua
string
```


# Unit
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
(method) Unit:add_attr(attr_name: string, value: number, attr_type: string)
```

增加属性

@*param* `attr_name` — 属性名

@*param* `value` — 属性值

@*param* `attr_type` — 属性类型
## add_attr_gc

```lua
(method) Unit:add_attr_gc(attr_name: string, value: number, attr_type: string)
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
(method) Unit:add_item(item_id: py.ItemKey)
  -> Item
```

单位添加物品

@*param* `item_id` — 物品id
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
## add_state

```lua
(method) Unit:add_state(state_enum: integer)
```

添加状态

@*param* `state_enum` — 状态名
## add_state_gc

```lua
(method) Unit:add_state_gc(state_enum: integer)
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
(method) CustomEvent:event_dispatch_with_args(event_name: string, args: any[], ...any)
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
(method) Unit:follow(target: Unit)
  -> py.UnitCommand
```

 命令跟随单位
## get_abilities_by_type

```lua
(method) Unit:get_abilities_by_type(type: y3.Const.AbilityType)
  -> Ability[]
```

获取指定类型的所有技能
## get_ability_by_slot

```lua
(method) Unit:get_ability_by_slot(type: y3.Const.AbilityType, slot: y3.Const.AbilityIndex)
  -> ability: Ability?
```

获得某个技能位的的技能

@*param* `type` — 技能类型

@*param* `slot` — 技能位

@*return* `ability` — 技能
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
## get_attr_all_ratio

```lua
(method) Unit:get_attr_all_ratio(attr_name: string)
  -> number
```

获取属性（最终加成）
## get_attr_base

```lua
(method) Unit:get_attr_base(attr_name: string)
  -> attr_base: number
```

获取单属性（基础）

@*return* `attr_base` — 单位基础属性类型的属性
## get_attr_base_ratio

```lua
(method) Unit:get_attr_base_ratio(attr_name: string)
  -> number
```

获取属性（基础加成）
## get_attr_bonus

```lua
(method) Unit:get_attr_bonus(attr_name: string)
  -> number
```

获取属性（增益）
## get_attr_bonus_ratio

```lua
(method) Unit:get_attr_bonus_ratio(attr_name: string)
  -> number
```

获取属性（增益加成）
## get_attr_growth_by_key

```lua
function Unit.get_attr_growth_by_key(unit_key: py.UnitKey, attr_name: any)
  -> unit_attribute_growth: number
```

获取单位属性成长

@*return* `unit_attribute_growth` — 单位属性成长
## get_attr_other

```lua
(method) Unit:get_attr_other(attr_name: string)
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
  -> Unit
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
(method) Unit:get_final_attr(attr_name: string)
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
(method) Unit:get_item_by_slot(type: y3.Const.SlotType, slot: integer)
  -> item: Item?
```

获取单位背包槽位上的物品

@*param* `type` — 槽位类型

@*param* `slot` — 位置

@*return* `item` — 物品
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
  -> unit_level: number
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

单位
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
(method) Unit:has_move_collision(collision_type: integer)
  -> boolean
```

是否拥有指定碰撞类型

@*param* `collision_type` — 碰撞类型

@*return* — 是否拥有指定碰撞类型
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
## kv_load

```lua
(method) KV:kv_load(key: string, lua_type: 'boolean'|'integer'|'number'|'string'|KV.SupportTypeEnum)
  -> any
```

```lua
lua_type:
    | 'boolean'
    | 'number'
    | 'integer'
    | 'string'
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

@*param* `end_time` — 结束时间

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
(method) Unit:remove_abilitiy_by_key(type: y3.Const.AbilityType, ability_key: py.AbilityKey)
```

移除技能(指定类型)

@*param* `type` — 技能类型

@*param* `ability_key` — 物编id
## remove_ability

```lua
(method) Unit:remove_ability(type: y3.Const.AbilityType, slot: y3.Const.AbilityIndex)
```

移除技能

@*param* `type` — 技能类型

@*param* `slot` — 技能位
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
(method) Unit:remove_item(item_id: py.ItemKey, num: integer)
```

单位移除物品

@*param* `item_id` — 物品id

@*param* `num` — 数量
## remove_mover

```lua
(method) Unit:remove_mover()
```

移除运动器
## remove_state

```lua
(method) Unit:remove_state(state_enum: integer)
```

移除状态

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
(method) Unit:set_attr(attr_name: string, value: number, attr_type: string)
```

设置属性

@*param* `attr_name` — 属性名

@*param* `value` — 属性值

@*param* `attr_type` — 属性类型
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
## shift_item

```lua
(method) Unit:shift_item(item: Item, type: y3.Const.ShiftSlotTypeAlias, index: integer, force: boolean)
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
 造成伤害## ability

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
y3.Const.DamageType
```


# UnitGroup
 单位组## add_unit

```lua
(method) UnitGroup:add_unit(unit: Unit)
```

添加单位

@*param* `unit` — 单位
## count

```lua
(method) UnitGroup:count()
  -> unit_group_num: integer
```

获取单位组中单位数量

@*return* `unit_group_num` — 单位数量
## count_by_key

```lua
(method) UnitGroup:count_by_key(unit_key: py.UnitKey)
  -> num_of_unit: integer
```

单位组中单位类型的数量

@*return* `num_of_unit` — 单位类型的数量
## get_by_handle

```lua
function UnitGroup.get_by_handle(py_unit_group: py.UnitGroup)
  -> UnitGroup
```

## get_first

```lua
(method) UnitGroup:get_first()
  -> unit: Unit
```

获取单位组内第一个单位

@*return* `unit` — 单位组内第一个单位
## get_last

```lua
(method) UnitGroup:get_last()
  -> unit: Unit
```

获取单位组内最后一个单位

@*return* `unit` — 最后一个单位
## get_random

```lua
(method) UnitGroup:get_random()
  -> unit: Unit
```

获取单位组中随机一个单位

@*return* `unit` — 单位组中随机一个单位
## handle

```lua
py.UnitGroup
```

单位组
## pick

```lua
(method) UnitGroup:pick()
  -> Unit[]
```

遍历单位组中单位做动作
## pick_by_key

```lua
function UnitGroup.pick_by_key(unit_key: py.UnitKey)
  -> unit_group: UnitGroup
```

挑选指定单位类型的单位

@*param* `unit_key` — 单位类型id

@*return* `unit_group` — 单位组
## pick_random_n

```lua
(method) UnitGroup:pick_random_n(count: integer)
  -> unit_group: UnitGroup
```

单位组中随机整数个单位

@*return* `unit_group` — 随机整数个单位
## remove_unit

```lua
(method) UnitGroup:remove_unit(unit: Unit)
```

移除单位

@*param* `unit` — 单位
## remove_units_by_key

```lua
(method) UnitGroup:remove_units_by_key(unit_key: py.UnitKey)
```

移除单位类型

@*param* `unit_key` — 单位类型id
## select_units

```lua
(method) UnitGroup:select_units()
```

根据单位组选中单位

# switch
## cachedCases

```lua
string[]
```

## call

```lua
(method) switch:call(callback: fun(...any):...unknown)
  -> switch
```

## case

```lua
(method) switch:case(name: string)
  -> switch
```

## default

```lua
(method) switch:default(callback: fun(...any):...unknown)
  -> switch
```

## getMap

```lua
(method) switch:getMap()
  -> table<string, function>
```

## has

```lua
(method) switch:has(name: string)
  -> boolean
```

## map

```lua
table<string, function>
```


# y3.Const
## AbilityCastType

```lua
table
```

## AbilityCategory

```lua
table
```

## AbilityEventType

```lua
table
```

## AbilityIndex

```lua
table
```

## AbilityPointerType

```lua
table
```

## AbilityType

```lua
table
```

## AreaAction

```lua
table
```

## CameraMoveMode

```lua
table
```

## CameraShakeMode

```lua
table
```

## CursorState

```lua
table
```

## DMGType

```lua
table
```

## DamageTypeMap

```lua
table
```

## DestructibleEventType

```lua
table
```

## DialogDebugType

```lua
table
```

## EaseType

```lua
table
```

## GameResult

```lua
table
```

## GlobalEventType

```lua
table
```

## HarmTextType

```lua
table
```

## ItemEventType

```lua
table
```

## IterKey

```lua
table
```

## KeyboardKey

```lua
table
```

## LinkSfxPointType

```lua
table
```

## ModifierEffectType

```lua
table
```

## ModifierEventType

```lua
table
```

## ModifierType

```lua
table
```

## ModifyType

```lua
table
```

## MouseKey

```lua
table
```

## MovementObstacleProcessType

```lua
table
```

## OnOff

```lua
table
```

## OnceRecycle

```lua
table
```

## PatrolType

```lua
table
```

## PlatformEventType

```lua
table
```

## ProjectileEventType

```lua
table
```

## RoleStatus

```lua
table
```

## RoleType

```lua
table
```

## SfxRotateType

```lua
table
```

## ShiftSlotType

```lua
table
```

## SignalType

```lua
table
```

## SlotType

```lua
table
```

## StateAction

```lua
table
```

## UIComponentType

```lua
table
```

## UIEventMap

```lua
table
```

## UIEventType

```lua
table
```

## UIHAlignmentType

```lua
table
```

## UIRelativeParentPosType

```lua
table
```

## UIVAlignmentType

```lua
table
```

## UnitCategory

```lua
table
```

## UnitEventType

```lua
table
```

## UnitKeyFloatAttr

```lua
table
```

## UnitState

```lua
table
```

## VisibleType

```lua
table
```


# y3.Const.AbilityEventType
```lua
{
    ABILITY_CS_START: string = ET_ABILITY_CS_START,
    ABILITY_PS_START: string = ET_ABILITY_PS_START,
    ABILITY_PS_END: string = ET_ABILITY_PS_END,
    ABILITY_SP_END: string = ET_ABILITY_SP_END,
    ABILITY_CST_END: string = ET_ABILITY_CST_END,
    ABILITY_BS_END: string = ET_ABILITY_BS_END,
    ABILITY_PS_INTERRUPT: string = ET_ABILITY_PS_INTERRUPT,
    ABILITY_SP_INTERRUPT: string = ET_ABILITY_SP_INTERRUPT,
    ABILITY_CST_INTERRUPT: string = ET_ABILITY_CST_INTERRUPT,
    ABILITY_END: string = ET_ABILITY_END,
    ABILITY_OBTAIN: string = ET_ABILITY_OBTAIN,
    ABILITY_LOSE: string = ET_ABILITY_LOSE,
    ABILITY_UPGRADE: string = ET_ABILITY_PLUS_POINT,
    ABILITY_LEVEL_CHANGED: string = ET_ABILITY_UPGRADE,
    ABILITY_CD_END: string = ET_ABILITY_CD_END,
    ABILITY_SWITCH: string = ET_ABILITY_SWITCH,
}
```
# y3.Const.AbilityIndex
```lua
{
    PASSIVE: integer = 0,
    MOVE: integer = 1,
    COMMON_ATK: integer = 2,
    ABILITY1: integer = 3,
    ABILITY2: integer = 4,
    ABILITY3: integer = 5,
    ABILITY4: integer = 6,
    ABILITY5: integer = 7,
    ABILITY6: integer = 8,
    ABILITY7: integer = 9,
    ABILITY8: integer = 10,
    ABILITY9: integer = 11,
    ABILITY10: integer = 12,
    ABILITY11: integer = 13,
    ABILITY12: integer = 14,
}
```
# y3.Const.AbilityPointerType
```lua
{
    NONE: integer = 0,
    SECTOR: integer = 1,
    ARROW: integer = 2,
    DOUBLE_CIRCLE: integer = 3,
    TARGET: integer = 4,
    LOCATION: integer = 5,
    BUILD: integer = 6,
    VECTOR: integer = 7,
}
```
# y3.Const.AbilityType
```lua
{
    HIDE: integer = 0,
    NORMAL: integer = 1,
    COMMON: integer = 2,
    HERO: integer = 3,
    隐藏: integer = 0,
    普通: integer = 1,
    命令: integer = 2,
    英雄: integer = 3,
}
```
# y3.Const.AbilityType.命令

# y3.Const.AbilityType.普通

# y3.Const.AbilityType.英雄

# y3.Const.AbilityType.隐藏

# y3.Const.AbilityTypeAlias
```lua
y3.Const.AbilityTypeAlias:
    | '隐藏'
    | '普通'
    | '命令'
    | '英雄'
```
```lua
'命令'|'普通'|'英雄'|'隐藏'
```


# y3.Const.CursorState
```lua
y3.Const.CursorState:
    | '常态悬浮'
    | '常态选取'
    | '常态禁用'
    | '敌方建筑单位悬浮'
    | '敌方非建筑单位悬浮'
    | '敌方建筑单位选取'
    | '敌方非建筑单位选取'
    | '己方建筑单位悬浮'
    | '己方非建筑单位悬浮'
    | '己方建筑单位选取'
    | '己方非建筑单位选取'
    | '友方建筑单位悬浮'
    | '友方非建筑单位悬浮'
    | '友方建筑单位选取'
    | '友方非建筑单位选取'
```
```lua
'友方建筑单位悬浮'|'友方建筑单位选取'|'友方非建筑单位悬浮'|'友方非建筑单位选取'|'己方建筑单位悬浮'...(+10)
```


# y3.Const.DMGType
```lua
{
    PHY: integer = 0,
    MAG: integer = 1,
    REAL: integer = 2,
}
```
# y3.Const.DamageTextType
```lua
y3.Const.DamageTextType:
    | 'get_gold' -- 获取金币
    | 'heal' -- 治疗
    | 'magic' -- 法术
    | 'physics' -- 物理
    | 'real' -- 真实
```
```lua
'get_gold'|'heal'|'magic'|'physics'|'real'
```


# y3.Const.DamageType
```lua
y3.Const.DamageType:
    | '物理'
    | '法术'
    | '真实'
```
```lua
'法术'|'物理'|'真实'
```


# y3.Const.DestructibleEventType
```lua
{
    DEST_CREATE: string = ET_DEST_CREATE_NEW,
    DEST_DIE: string = ET_DEST_DIE_NEW,
    DEST_REVIVE: string = ET_DEST_REVIVE_NEW,
    DEST_RES_CNT_CHG: string = ET_DEST_RES_CNT_CHG_NEW,
    DEST_COLLECTED: string = ET_DEST_COLLECTED_NEW,
    DEST_GET_HURT: string = ET_GET_HURT_NEW,
    DEST_DELETE: string = ET_DEST_DELETE,
}
```
# y3.Const.EaseType
```lua
{
    ease_in曲线: integer = 1,
    ease_out曲线: integer = 2,
    ease_in_out曲线: integer = 3,
}
```
# y3.Const.EaseType.ease_in_out曲线

# y3.Const.EaseType.ease_in曲线

# y3.Const.EaseType.ease_out曲线

# y3.Const.EffectType
```lua
{
    NORMAL: integer = 1,
    POSITIVE: integer = 2,
    NEGATIVE: integer = 3,
}
```
# y3.Const.EventType

```lua
y3.Const.AbilityEventType|y3.Const.DestructibleEventType|y3.Const.GlobalEventType|y3.Const.ItemEventType|y3.Const.ModifierEventType...(+4)
```


# y3.Const.GlobalEventType
```lua
{
    GAME_INIT: string = ET_GAME_INIT,
    GAME_PAUSE: string = ET_GAME_PAUSE,
    GAME_RESUME: string = ET_GAME_RESUME,
    GAME_ELAPSE_ONCE: string = ET_TIMEOUT,
    GAME_ELAPSE_REPEAT: string = ET_REPEAT_TIMEOUT,
    BUILD_SUCCESS: string = ET_ABILITY_BUILD_FINISH,
    START_SKILL_POINTER: string = ET_START_SKILL_POINTER,
    STOP_SKILL_POINTER: string = ET_STOP_SKILL_POINTER,
    CUSTOM_EVENT: string = ET_EVENT_CUSTOM,
    UI_EVENT: string = ET_TRIGGER_COMPONENT_EVENT,
    UNIT_ATTR_CHANGE: string = ET_UNIT_ATTR_CHANGE,
    UNIT_START_NAVI: string = ET_UNIT_START_NAV_EVENT,
    UNIT_END_NAVI: string = ET_UNIT_END_NAV_EVENT,
    ITEM_BROKEN: string = ET_ITEM_BROKEN,
    ITEM_SOLD: string = ET_ITEM_SOLD,
    AREA_ENTER: string = ET_AREA_ENTER,
    AREA_LEAVE: string = ET_AREA_LEAVE,
    UNIT_PRECONDITION_MEET: string = ET_UNIT_PRECONDITION_SUCCEED,
    UNIT_PRECONDITION_FAILED: string = ET_UNIT_PRECONDITION_FAILED,
    ITEM_PRECONDITION_MEET: string = ET_ITEM_PRECONDITION_SUCCEED,
    ITEM_PRECONDITION_FAILED: string = ET_ITEM_PRECONDITION_FAILED,
    ABILITY_PRECONDITION_MEET: string = ET_ABILITY_PRECONDITION_SUCCEED,
    ABILITY_PRECONDITION_FAILED: string = ET_ABILITY_PRECONDITION_FAILED,
    TECH_PRECONDITION_MEET: string = ET_TECH_PRECONDITION_SUCCEED,
    TECH_PRECONDITION_FAILED: string = ET_TECH_PRECONDITION_FAILED,
    KEYBOARD_DOWN: string = ET_KEYBOARD_KEY_DOWN_EVENT,
    KEYBOARD_UP: string = ET_KEYBOARD_KEY_UP_EVENT,
    MOUSE_DOWN: string = ET_MOUSE_KEY_DOWN_EVENT,
    MOUSE_UP: string = ET_MOUSE_KEY_UP_EVENT,
    MOUSE_D_CLICK: string = MOUSE_KEY_DB_CLICK_EVENT,
    MOUSE_MOVE: string = MOUSE_MOVE_EVENT,
    MOUSE_WHEEL: string = ET_MOUSE_WHEEL_EVENT,
    MOUSE_DOWN_UNIT: string = MOUSE_KEY_DOWN_UNIT_EVENT,
    MOUSE_UP_UNIT: string = MOUSE_KEY_UP_UNIT_EVENT,
    MOUSE_D_CLICK_UNIT: string = MOUSE_KEY_DB_CLICK_UNIT_EVENT,
    SELECT_UNIT: string = ET_SELECT_UNIT,
    SELECT_UNIT_GROUP: string = ET_SELECT_UNIT_GROUP,
    SELECT_ITEM: string = ET_SELECT_ITEM,
    D_CLICK_ITEM: string = ET_DOUBLE_CLICK_ITEM,
    SELECT_DEST: string = ET_SELECT_DEST,
    D_CLICK_DEST: string = ET_DOUBLE_CLICK_DEST,
    PLAYER_JOIN: string = ET_ROLE_JOIN_BATTLE,
    PLAYER_EXIT: string = ET_ROLE_ACTIVE_EXIT_GAME_EVENT,
    PLAYER_LOSE_CONNECT: string = ET_ROLE_LOSE_CONNECT,
    PLAYER_RESOURCE_CHANGED: string = ET_ROLE_RESOURCE_CHANGED,
    PLAYER_SEND_STRING: string = ET_ROLE_INPUT_MSG,
    PLAYER_SEND_ANY: string = ET_CHAT_SEND_GM,
    PLAYER_UPGRADE_TECH: string = ET_ROLE_TECH_UPGRADE,
    PLAYER_DOWNGRADE_TECH: string = ET_ROLE_TECH_DOWNGRADE,
    PLAYER_CHANGE_TECH: string = ET_ROLE_TECH_CHANGED,
}
```
# y3.Const.HarmTextType
```lua
"系统字体" | "物理伤害" | "物理暴击" | "治疗" | "魔法伤害" | "魔法暴击" | "真实伤害" | "金币获取" | "魔兽获取金币" | "魔兽获取木材" | "嘲讽" | "沉默" | "定身" | "减速" | "晕眩" | "致盲"
```
# y3.Const.ItemEventType
```lua
{
    ITEM_CREATE: string = ET_ITEM_ON_CREATE,
    ITEM_ADD: string = ET_UNIT_ADD_ITEM,
    ITEM_ADD_TO_PKG: string = ET_UNIT_ADD_ITEM_TO_PKG,
    ITEM_ADD_TO_BAR: string = ET_UNIT_ADD_ITEM_TO_BAR,
    ITEM_REMOVE: string = ET_UNIT_REMOVE_ITEM,
    ITEM_REMOVE_FROM_PKG: string = ET_UNIT_REMOVE_ITEM_FROM_PKG,
    ITEM_REMOVE_FROM_BAR: string = ET_UNIT_REMOVE_ITEM_FROM_BAR,
    ITEM_USE: string = ET_UNIT_USE_ITEM,
    ITEM_CHANGE_STACK: string = ET_ITEM_STACK_CHANGED,
    ITEM_CHANGE_CHARGE: string = ET_ITEM_CHARGE_CHANGED,
    ITEM_DESTROY: string = ET_ITEM_ON_DESTROY,
    ITEM_CREATE_ON_DEST_COLLECTED: string = ET_ITEM_CREATE_ON_DEST_COLLECTED,
}
```
# y3.Const.KeyboardKey
```lua
{
    NONE: integer = 0,
    ESCAPE: integer = 1,
    KEY_1: integer = 2,
    KEY_2: integer = 3,
    KEY_3: integer = 4,
    KEY_4: integer = 5,
    KEY_5: integer = 6,
    KEY_6: integer = 7,
    KEY_7: integer = 8,
    KEY_8: integer = 9,
    KEY_9: integer = 10,
    KEY_0: integer = 11,
    MINUS: integer = 12,
    EQUAL: integer = 13,
    BACKSPACE: integer = 14,
    TAB: integer = 15,
    Q: integer = 16,
    W: integer = 17,
    E: integer = 18,
    R: integer = 19,
    T: integer = 20,
    Y: integer = 21,
    U: integer = 22,
    I: integer = 23,
    O: integer = 24,
    P: integer = 25,
    LBRACKET: integer = 26,
    RBRACKET: integer = 27,
    RETURN: integer = 28,
    LCTRL: integer = 29,
    A: integer = 30,
    S: integer = 31,
    D: integer = 32,
    F: integer = 33,
    G: integer = 34,
    H: integer = 35,
    J: integer = 36,
    K: integer = 37,
    L: integer = 38,
    SEMICOLON: integer = 39,
    APOSTROPHE: integer = 40,
    GRAVE: integer = 41,
    LSHIFT: integer = 42,
    BACKSLASH: integer = 43,
    Z: integer = 44,
    X: integer = 45,
    C: integer = 46,
    V: integer = 47,
    B: integer = 48,
    N: integer = 49,
    M: integer = 50,
    COMMA: integer = 51,
    PERIOD: integer = 52,
    SLASH: integer = 53,
    RSHIFT: integer = 54,
    NUM_STAR: integer = 55,
    LALT: integer = 56,
    SPACE: integer = 57,
    CAPSLOCK: integer = 58,
    F1: integer = 59,
    F2: integer = 60,
    F3: integer = 61,
    F4: integer = 62,
    F5: integer = 63,
    F6: integer = 64,
    F7: integer = 65,
    F8: integer = 66,
    F9: integer = 67,
    F10: integer = 68,
    PAUSE: integer = 69,
    SCROLL_LOCK: integer = 70,
    NUM_7: integer = 71,
    NUM_8: integer = 72,
    NUM_9: integer = 73,
    NUM_MINUS: integer = 74,
    NUM_4: integer = 75,
    NUM_5: integer = 76,
    NUM_6: integer = 77,
    NUM_ADD: integer = 78,
    NUM_1: integer = 79,
    NUM_2: integer = 80,
    NUM_3: integer = 81,
    NUM_0: integer = 82,
    NUM_PERIOD: integer = 83,
    F11: integer = 87,
    F12: integer = 88,
    NUM_ENTER: integer = 156,
    RCTRL: integer = 157,
    NUM_COMMA: integer = 179,
    NUM_SLASH: integer = 181,
    SYSRQ: integer = 183,
    R_ALT: integer = 184,
    NUM_LOCK: integer = 197,
    HOME: integer = 199,
    UPARROW: integer = 200,
    PAGEUP: integer = 201,
    LEFTARROW: integer = 203,
    RIGHTARROW: integer = 205,
    END: integer = 207,
    DOWNARROW: integer = 208,
    PAGEDOWN: integer = 209,
    INSERT: integer = 210,
    DELETE: integer = 211,
    LWIN: integer = 219,
    RWIN: integer = 220,
    APPS: integer = 221,
}
```
# y3.Const.LinkSfxPointType
```lua
{
    START: integer = 1,
    END: integer = 2,
}
```
# y3.Const.ModifierEventType
```lua
{
    OBTAIN_MODIFIER: string = ET_OBTAIN_MODIFIER,
    LOSS_MODIFIER: string = ET_LOSS_MODIFIER,
    MODIFIER_CYCLE_TRIGGER: string = ET_MODIFIER_CYCLE_TRIGGER,
    MODIFIER_LAYER_CHANGE: string = ET_MODIFIER_LAYER_CHANGE,
    MODIFIER_GET_BEFORE_CREATE: string = ET_MODIFIER_GET_BEFORE_CREATE,
    MODIFIER_BE_COVERED: string = ET_MODIFIER_BE_COVERED,
    MODIFIER_ADDTION: string = ET_MODIFIER_ADDTION,
}
```
# y3.Const.ModifierType
```lua
{
    NORMAL: integer = 1,
    HALO: integer = 2,
    HALO_EFFECT: integer = 3,
    SHIELD: integer = 4,
}
```
# y3.Const.MouseKey
```lua
{
    LEFT: integer = 240,
    RIGHT: integer = 241,
    MIDDLE: integer = 242,
    WHEEL_UP: integer = 243,
    WHEEL_DOWN: integer = 244,
}
```
# y3.Const.PlatformEventType
```lua
{
    HOLD_STORE_ITEM: string = ET_ROLE_HOLD_STORE_ITEM,
    USE_STORE_ITEM_END: string = ET_ROLE_USE_STORE_ITEM_END,
}
```
# y3.Const.ProjectileEventType
```lua
{
    PROJECTILE_PRODUCE: string = ET_PRODUCE_PROJECTILE,
    PROJECTILE_END: string = ET_DEATH_PROJECTILE,
}
```
# y3.Const.RoleStatus
```lua
{
    PLAYING: integer = 1,
    NONE: integer = 2,
    LOST: integer = 3,
    LEFT: integer = 4,
    WATCHING: integer = 5,
}
```
# y3.Const.RoleType
```lua
{
    USER: integer = 1,
    COMPUTER: integer = 2,
    AI_EASY: integer = 5,
    AI_HARD: integer = 6,
    OBSERVER: integer = 10,
}
```
# y3.Const.ShiftSlotType
```lua
{
    物品栏: integer = 1,
    背包栏: integer = 0,
}
```
# y3.Const.ShiftSlotType.物品栏

# y3.Const.ShiftSlotType.背包栏

# y3.Const.ShiftSlotTypeAlias
```lua
y3.Const.ShiftSlotTypeAlias:
    | '物品栏'
    | '背包栏'
```
```lua
'物品栏'|'背包栏'
```


# y3.Const.SignalType
```lua
"普通" | "黄色" | "蓝色"
```
# y3.Const.SlotType
```lua
{
    NOT_IN_BAG: integer = -1,
    PKG: integer = 0,
    BAR: integer = 1,
}
```
# y3.Const.UIComponentType
```lua
y3.Const.UIComponentType:
    | '物品'
    | '按钮'
    | '富文本'
    | '文本'
    | '图片'
    | '进度条'
    | '模型'
    | '空节点'
    | '标签页'
    | '设置'
    | '列表'
    | '滑动条'
    | '聊天'
    | '轮播图'
    | '语音开关'
    | '输入框'
    | '地图'
    | '技能按钮'
    | '魔法效果'
    | '序列帧'
```
```lua
'列表'|'图片'|'地图'|'富文本'|'序列帧'...(+15)
```


# y3.Const.UIEvent
```lua
y3.Const.UIEvent:
    | '空'
    | '点击-开始'
    | '点击-结束'
    | '点击-持续'
    | '鼠标-双击'
    | '鼠标-悬停'
    | '鼠标-移入'
    | '鼠标-移出'
    | '鼠标-右击'
```
```lua
'点击-开始'|'点击-持续'|'点击-结束'|'空'|'鼠标-双击'...(+4)
```


# y3.Const.UIEventType
```lua
{
    UI_CREATE: string = ET_UI_PREFAB_CREATE_EVENT,
    UI_DELETE: string = ET_UI_PREFAB_DEL_EVENT,
}
```
# y3.Const.UIHAlignmentType
```lua
y3.Const.UIHAlignmentType:
    | '左'
    | '中'
    | '右'
```
```lua
'中'|'右'|'左'
```


# y3.Const.UIRelativeParentPosType
```lua
y3.Const.UIRelativeParentPosType:
    | '顶部'
    | '底部'
    | '左侧'
    | '右侧'
```
```lua
'右侧'|'左侧'|'底部'|'顶部'
```


# y3.Const.UIVAlignmentType
```lua
y3.Const.UIVAlignmentType:
    | '上'
    | '中'
    | '下'
```
```lua
'上'|'下'|'中'
```


# y3.Const.UnitEventType
```lua
{
    BEFORE_UNIT_DIE: string = ET_BEFORE_UNIT_DIE,
    UNIT_DIE: string = ET_UNIT_DIE,
    KILL_UNIT: string = ET_KILL_UNIT,
    UNIT_BORN: string = ET_UNIT_BORN,
    REVIVE_UNIT: string = ET_REVIVE_UNIT,
    UPGRADE_UNIT: string = ET_UPGRADE_UNIT,
    UNIT_PRE_ADD_EXP: string = ET_UNIT_PRE_ADD_EXP,
    UNIT_ON_ADD_EXP: string = ET_UNIT_ON_ADD_EXP,
    UNIT_BE_HURT: string = ET_UNIT_BE_HURT,
    UNIT_HURT_OTHER: string = ET_UNIT_HURT_OTHER,
    UNIT_BE_HURT_BEFORE_APPLY: string = ET_UNIT_BE_HURT_BEFORE_APPLY,
    UNIT_HURT_OTHER_BEFORE_APPLY: string = ET_UNIT_HURT_OTHER_BEFORE_APPLY,
    UNIT_BE_HURT_COMPLETE: string = ET_UNIT_BE_HURT_COMPLETE,
    UNIT_HURT_OTHER_COMPLETE: string = ET_UNIT_HURT_OTHER_FINISH,
    UNIT_GET_CURE_BEFORE_APPLY: string = ET_UNIT_GET_CURE_BEFORE_APPLY,
    UNIT_GET_CURE_FINISH: string = ET_UNIT_GET_CURE_FINISH,
    UNIT_GET_CURE: string = ET_UNIT_GET_CURE,
    UNIT_RELEASE_ABILITY: string = ET_UNIT_RELEASE_ABILITY,
    UNIT_START_MOVE: string = ET_UNIT_START_MOVE,
    UNIT_ENTER_BATTLE: string = ET_UNIT_ENTER_BATTLE,
    UNIT_EXIT_BATTLE: string = ET_UNIT_EXIT_BATTLE,
    UNIT_ENTER_GRASS: string = ET_UNIT_ENTER_GRASS,
    UNIT_LEAVE_GRASS: string = ET_UNIT_LEAVE_GRASS,
    UNIT_ON_COMMAND: string = ET_UNIT_ON_COMMAND,
    UNIT_ABILITY_UPGRADE: string = ET_ABILITY_PLUS_POINT,
    UNIT_REMOVE: string = ET_UNIT_REMOVE,
    UNIT_SHOP_BUY_UNIT: string = ET_UNIT_SHOP_BUY_UNIT,
    UNIT_SHOP_BUY_ITEM: string = ET_UNIT_SHOP_BUY_ITEM,
    UNIT_ITEM_SELL: string = ET_UNIT_ITEM_SELL,
    UNIT_ITEM_COMPOSE: string = ET_UNIT_ITEM_COMPOSE,
    UNIT_SHOP_BUY_WITH_COMPOSE: string = ET_UNIT_SHOP_BUY_WITH_COMPOSE,
    UNIT_UPGRADE_TECH: string = ET_UNIT_UPGRADE_TECH,
    UNIT_ADD_TECH: string = ET_UNIT_ADD_TECH,
    UNIT_REMOVE_TECH: string = ET_UNIT_REMOVE_TECH,
    UNIT_ROLE_CHANGED: string = ET_UNIT_ROLE_CHANGED,
}
```
# y3.Const.VisibleType
```lua
"全体" | "自己" | "友方" | "敌方"
```
