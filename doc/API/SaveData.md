# SaveData

存档

## load_boolean

```lua
function SaveData.load_boolean(player: Player, slot: integer)
  -> boolean
```

 获取玩家的存档数据（布尔）
## load_integer

```lua
function SaveData.load_integer(player: Player, slot: integer)
  -> integer
```

 获取玩家的存档数据（整数）
## load_real

```lua
function SaveData.load_real(player: Player, slot: integer)
  -> number
```

 获取玩家的存档数据（实数）
## load_string

```lua
function SaveData.load_string(player: Player, slot: integer)
  -> string
```

 获取玩家的存档数据（字符串）
## load_table

```lua
function SaveData.load_table(player: Player, slot: integer, disable_cover: boolean)
  -> table
```

 获取玩家的存档数据（表）

@*param* `disable_cover` — 是否禁用覆盖，必须和存档设置中的一致
## load_table_with_cover_disable

```lua
function SaveData.load_table_with_cover_disable(player: Player, slot: integer)
  -> table
```

## load_table_with_cover_enable

```lua
function SaveData.load_table_with_cover_enable(player: Player, slot: integer)
  -> table
```

## save_boolean

```lua
function SaveData.save_boolean(player: Player, slot: integer, value: boolean)
```

 保存玩家的存档数据（布尔）
## save_integer

```lua
function SaveData.save_integer(player: Player, slot: integer, value: integer)
```

 保存玩家的存档数据（整数）
## save_real

```lua
function SaveData.save_real(player: Player, slot: integer, value: number)
```

 保存玩家的存档数据（实数）
## save_string

```lua
function SaveData.save_string(player: Player, slot: integer, value: string)
```

 保存玩家的存档数据（字符串）
## save_table

```lua
function SaveData.save_table(player: Player, slot: integer, t: table)
```

 保存玩家的存档数据（表），存档设置中必须使用允许覆盖模式
## table_cache

```lua
table
```

## timer_map

```lua
{ [Player]: LocalTimer }
```

## upload_save_data

```lua
function SaveData.upload_save_data(player: Player)
```


