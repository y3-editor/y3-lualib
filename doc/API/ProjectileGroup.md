# ProjectileGroup

投射物组

## create_lua_projectile_group_from_py

```lua
function ProjectileGroup.create_lua_projectile_group_from_py(py_projectile_group: py.ProjectileGroup)
  -> ProjectileGroup
```

## get_all_projectile_in_shapes

```lua
function ProjectileGroup.get_all_projectile_in_shapes(point: Point, shape: Shape)
  -> ProjectileGroup
```

筛选范围内的所有投射物

@*param* `point` — 点

@*param* `shape` — 筛选范围
## get_all_projectiles_with_tag

```lua
function ProjectileGroup.get_all_projectiles_with_tag(tag: string)
  -> ProjectileGroup
```

获取拥有指定标签的投射物

@*param* `tag` — 点
## handle

```lua
py.ProjectileGroup
```

投射物组
## pick

```lua
(method) ProjectileGroup:pick()
  -> Projectile[]
```

遍历投射物组中投射物做动作
## type

```lua
string
```


