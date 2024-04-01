# Ground

地面

地面碰撞相关方法

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

