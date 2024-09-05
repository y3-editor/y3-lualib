# Particle

粒子特效

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
## set_color

```lua
(method) Particle:set_color(x: number, y: number, z: number, w: number)
```

设置特效颜色

@*param* `x` — x

@*param* `y` — y

@*param* `z` — z

@*param* `w` — w
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
## set_visible

```lua
(method) Particle:set_visible(visible: boolean)
```

设置特效显示

@*param* `visible` — 开关
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
integer|y3.Const.SfxRotateType
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

销毁时，是否立刻移除显示效果
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

