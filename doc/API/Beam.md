# Beam

闪电特效（光束）

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

## follow_scale

```lua
boolean
```

是否跟随缩放（只在起点是单位时生效）
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

