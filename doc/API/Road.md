# Road

路径

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


