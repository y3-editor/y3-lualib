# Projectile

投射物

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
  -> projectile: Projectile?
```

## get_by_id

```lua
function Projectile.get_by_id(id: py.ProjectileID)
  -> Projectile
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
  -> unit: Unit?
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

## is_destroyed

```lua
(method) Projectile:is_destroyed()
  -> boolean|unknown
```

## is_exist

```lua
(method) Projectile:is_exist()
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

## phandle

```lua
py.ProjectileEntity
```

投掷物对象
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
## set_visible

```lua
(method) Projectile:set_visible(visible: boolean, player_or_group?: Player|PlayerGroup)
```

设置投射物的可见性

@*param* `visible` — 是否可见

@*param* `player_or_group` — 应用于哪些玩家，默认为所有玩家
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
integer|y3.Const.VisibleType
```

粒子特效可见性规则，默认为`1`

