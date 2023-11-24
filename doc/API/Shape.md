# Shape

形状

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


