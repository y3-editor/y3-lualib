# Cast

施法实例

会在施法相关的事件中传递

## ability

```lua
Ability
```

技能
## cast_id

```lua
integer
```

## get

```lua
function Cast.get(ability: Ability, cast_id: integer)
  -> Cast
```

## get_ability

```lua
(method) Cast:get_ability()
  -> Ability
```

 获取技能
## get_angle

```lua
(method) Cast:get_angle()
  -> number
```

 获取施法方向
## get_target_destructible

```lua
(method) Cast:get_target_destructible()
  -> Destructible?
```

 获取施法目标可破坏物
## get_target_item

```lua
(method) Cast:get_target_item()
  -> Item?
```

 获取施法目标物品
## get_target_point

```lua
(method) Cast:get_target_point()
  -> Point?
```

 获取施法目标点
## get_target_unit

```lua
(method) Cast:get_target_unit()
  -> Unit?
```

 获取施法目标单位
## storage_all

```lua
(method) Storage:storage_all()
  -> table
```

 获取存储数据的容器
## storage_get

```lua
(method) Storage:storage_get(key: any)
  -> any
```

 获取存储的值
## storage_set

```lua
(method) Storage:storage_set(key: any, value: any)
```

 存储任意值
## storage_table

```lua
table
```


