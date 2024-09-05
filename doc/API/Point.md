# Point

点

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
## get_point

```lua
(method) Point:get_point()
  -> Point
```

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
## get_random_point

```lua
(method) Point:get_random_point(radius: any)
  -> Point
```

获取圆形范围内的随机点
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

## x

```lua
number
```

## y

```lua
number
```

## z

```lua
number
```


# Point.HandleType

点


```lua
py.FPoint
```


