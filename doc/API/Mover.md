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

## wrap_base_args

```lua
function Mover.wrap_base_args(builder: py.MoverBaseBuilder, args: Mover.CreateData.Base)
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
## block_interval

```lua
number
```

触发地形阻挡事件的间隔
## face_angle

```lua
boolean
```

是否始终面向运动方向
## hit_interval

```lua
number
```

碰撞同一个单位的间隔
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

碰撞类型 0： 敌人；1： 盟友；2： 全部
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
## unit

```lua
Unit
```

关联单位

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
## block_interval

```lua
number
```

触发地形阻挡事件的间隔
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
## hit_interval

```lua
number
```

碰撞同一个单位的间隔
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

碰撞类型 0： 敌人；1： 盟友；2： 全部
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
(Point|py.FixedVec2)[]
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
## unit

```lua
Unit
```

关联单位

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
## block_interval

```lua
number
```

触发地形阻挡事件的间隔
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
## hit_interval

```lua
number
```

碰撞同一个单位的间隔
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

碰撞类型 0： 敌人；1： 盟友；2： 全部
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
## unit

```lua
Unit
```

关联单位

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
## block_interval

```lua
number
```

触发地形阻挡事件的间隔
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
## hit_interval

```lua
number
```

碰撞同一个单位的间隔
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

碰撞类型 0： 敌人；1： 盟友；2： 全部
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
## unit

```lua
Unit
```

关联单位

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
## block_interval

```lua
number
```

触发地形阻挡事件的间隔
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
## hit_interval

```lua
number
```

碰撞同一个单位的间隔
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

碰撞类型 0： 敌人；1： 盟友；2： 全部
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
## unit

```lua
Unit
```

关联单位

