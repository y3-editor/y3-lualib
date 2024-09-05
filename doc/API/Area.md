# Area

区域

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
## get_unit_in_area_by_camp

```lua
(method) Area:get_unit_in_area_by_camp(camp: py.Camp)
  -> 单位组: Unit[]
```

区域内阵营所有单位
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


