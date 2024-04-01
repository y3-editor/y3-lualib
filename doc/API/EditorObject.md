# EditorObject

 物体编辑器

## ability

```lua
unknown
```

## buff

```lua
unknown
```

## callMethod

```lua
function EditorObject.callMethod(otype: string, mname: string, key: any, lock_obj: any, arg1: any, arg2: any)
```

## call_stack_map

```lua
table
```

## item

```lua
unknown
```

## lock_count_map

```lua
table
```

## unit

```lua
unknown
```


# EditorObject.Ability

## data

```lua
Object.Ability
```

技能的物编数据，你可以从里面读取或修改任意物编  
> 警告：请确保数据类型正确，否则可能导致崩溃  
> 警告：如果创建过此技能再修改数据，行为是未定义的
## data_key

```lua
string
```

## handle

```lua
unknown?
```

## key

```lua
py.AbilityKey
```

技能编号
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_key

```lua
string
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
## new

```lua
(method) EditorObject.Ability:new()
  -> EditorObject.Ability
```

以此技能为模板创建新的技能物编
## on_add

```lua
fun(ability: Ability)
```

技能获得后执行
## on_can_cast

```lua
fun(ability: Ability, cast: Cast)
```

技能即将施法时执行
## on_cast_channel

```lua
fun(ability: Ability, cast: Cast)
```

技能引导施法时执行
## on_cast_finish

```lua
fun(ability: Ability, cast: Cast)
```

技能完成施法时执行
## on_cast_shot

```lua
fun(ability: Ability, cast: Cast)
```

技能出手施法时执行
## on_cast_start

```lua
fun(ability: Ability, cast: Cast)
```

技能开始施法时执行
## on_cast_stop

```lua
fun(ability: Ability, cast: Cast)
```

技能停止施法时执行
## on_cooldown

```lua
fun(ability: Ability)
```

技能冷却结束后执行
## on_lose

```lua
fun(ability: Ability)
```

技能失去后执行
## on_upgrade

```lua
fun(ability: Ability)
```

技能升级后执行

# EditorObject.Buff

## data

```lua
Object.Buff
```

魔法效果的物编数据，你可以从里面读取或修改任意物编  
> 警告：请确保数据类型正确，否则可能导致崩溃  
> 警告：如果创建过此魔法效果再修改数据，行为是未定义的
## data_key

```lua
string
```

## handle

```lua
unknown?
```

## key

```lua
py.ModifierKey
```

效果编号
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_key

```lua
string
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
## new

```lua
(method) EditorObject.Buff:new()
  -> EditorObject.Buff
```

以此魔法效果为模板创建新的魔法效果物编
## on_add

```lua
fun(buff: Buff)
```

效果获得后执行
## on_can_add

```lua
fun(buff: Buff)
```

效果即将获得时执行
## on_lose

```lua
fun(buff: Buff)
```

效果失去后执行
## on_pulse

```lua
fun(buff: Buff)
```

效果心跳后执行

# EditorObject.DataModule

## data_key

```lua
string
```


# EditorObject.Item

## data

```lua
Object.Item
```

物品的物编数据，你可以从里面读取或修改任意物编  
> 警告：请确保数据类型正确，否则可能导致崩溃  
> 警告：如果创建过此物品再修改数据，行为是未定义的
## data_key

```lua
string
```

## handle

```lua
unknown?
```

## key

```lua
py.ItemKey
```

物品编号
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_key

```lua
string
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
## new

```lua
(method) EditorObject.Item:new()
  -> EditorObject.Item
```

以此物品为模板创建新的物品物编
## on_add

```lua
fun(item: Item)
```

物品获得后执行
## on_create

```lua
fun(item: Item)
```

物品创建后执行
## on_lose

```lua
fun(item: Item)
```

物品失去后执行
## on_remove

```lua
fun(item: Item)
```

物品移除后执行

# EditorObject.Unit

## data

```lua
Object.Unit
```

单位的物编数据，你可以从里面读取或修改任意物编  
> 警告：请确保数据类型正确，否则可能导致崩溃  
> 警告：如果创建过此单位再修改数据，行为是未定义的
## data_key

```lua
string
```

## handle

```lua
unknown?
```

## key

```lua
py.UnitKey
```

单位编号
## kv_has

```lua
(method) KV:kv_has(key: string)
  -> boolean
```

 是否拥有指定键值对。可以与ECA互通。
## kv_key

```lua
string
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
## new

```lua
(method) EditorObject.Unit:new()
  -> EditorObject.Unit
```

以此单位为模板创建新的单位物编
## on_create

```lua
fun(unit: Unit)
```

单位创建后执行
## on_dead

```lua
fun(unit: Unit)
```

单位死亡后执行
## on_remove

```lua
fun(unit: Unit)
```

单位移除后执行

