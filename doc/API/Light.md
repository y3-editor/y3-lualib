# Light

光照

用来修改光照、阴影等效果

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


