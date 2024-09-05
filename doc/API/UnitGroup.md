# UnitGroup

单位组

## add_unit

```lua
(method) UnitGroup:add_unit(unit: Unit)
```

添加单位

@*param* `unit` — 单位
## clear

```lua
(method) UnitGroup:clear()
```

清空单位组
## count

```lua
(method) UnitGroup:count()
  -> unit_group_num: integer
```

获取单位组中单位数量

@*return* `unit_group_num` — 单位数量
## count_by_key

```lua
(method) UnitGroup:count_by_key(unit_key: py.UnitKey)
  -> num_of_unit: integer
```

单位组中单位类型的数量

@*return* `num_of_unit` — 单位类型的数量
## create

```lua
function UnitGroup.create()
  -> UnitGroup
```

创建空单位组
## get_by_handle

```lua
function UnitGroup.get_by_handle(py_unit_group: py.UnitGroup)
  -> UnitGroup
```

## get_first

```lua
(method) UnitGroup:get_first()
  -> unit: Unit?
```

获取单位组内第一个单位

@*return* `unit` — 单位组内第一个单位
## get_last

```lua
(method) UnitGroup:get_last()
  -> unit: Unit?
```

获取单位组内最后一个单位

@*return* `unit` — 最后一个单位
## get_random

```lua
(method) UnitGroup:get_random()
  -> unit: Unit?
```

获取单位组中随机一个单位

@*return* `unit` — 单位组中随机一个单位
## handle

```lua
py.UnitGroup
```

单位组
## pick

```lua
(method) UnitGroup:pick()
  -> Unit[]
```

将单位组转换为Lua的单位数组
## pick_by_key

```lua
function UnitGroup.pick_by_key(unit_key: py.UnitKey)
  -> unit_group: UnitGroup
```

挑选指定单位类型的单位

@*param* `unit_key` — 单位类型id

@*return* `unit_group` — 单位组
## pick_random_n

```lua
(method) UnitGroup:pick_random_n(count: integer)
  -> unit_group: UnitGroup
```

单位组中随机整数个单位

@*return* `unit_group` — 随机整数个单位
## remove_unit

```lua
(method) UnitGroup:remove_unit(unit: Unit)
```

移除单位

@*param* `unit` — 单位
## remove_units_by_key

```lua
(method) UnitGroup:remove_units_by_key(unit_key: py.UnitKey)
```

移除单位类型

@*param* `unit_key` — 单位类型id
## select_units

```lua
(method) UnitGroup:select_units()
```

根据单位组选中单位

