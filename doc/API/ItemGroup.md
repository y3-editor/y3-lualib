# ItemGroup

物品组

## create

```lua
function ItemGroup.create()
  -> ItemGroup
```

## create_lua_item_group_from_py

```lua
function ItemGroup.create_lua_item_group_from_py(py_item_group: py.ItemGroup)
  -> ItemGroup
```

## get_all_items_in_shapes

```lua
function ItemGroup.get_all_items_in_shapes(point: Point, shape: Shape)
  -> ItemGroup
```

筛选范围内的所有物品

@*param* `point` — 点

@*param* `shape` — 筛选范围
## get_by_handle

```lua
function ItemGroup.get_by_handle(py_item_group: py.ItemGroup)
  -> ItemGroup
```

## handle

```lua
py.ItemGroup
```

物品组
## pick

```lua
(method) ItemGroup:pick()
  -> Item[]
```

遍历物品组中玩家做动作
## type

```lua
string
```


