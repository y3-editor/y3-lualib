# PlayerGroup

玩家组

## add_player

```lua
(method) PlayerGroup:add_player(player: Player)
```

添加玩家

@*param* `player` — 玩家
## clear

```lua
(method) PlayerGroup:clear()
```

清空玩家组
## count

```lua
(method) PlayerGroup:count()
  -> integer
```

获取玩家组中玩家数量
## create

```lua
function PlayerGroup.create()
  -> PlayerGroup
```

创建空玩家组
## get_all_players

```lua
function PlayerGroup.get_all_players()
  -> player_group: PlayerGroup
```

获取所有玩家

@*return* `player_group` — 单位组
## get_ally_player_group_by_player

```lua
function PlayerGroup.get_ally_player_group_by_player(player: Player)
  -> player_group: PlayerGroup
```

玩家的所有同盟玩家

@*param* `player` — 玩家

@*return* `player_group` — 单位组
## get_by_handle

```lua
function PlayerGroup.get_by_handle(py_role_group: py.RoleGroup)
  -> PlayerGroup
```

## get_defeated_player_group

```lua
function PlayerGroup.get_defeated_player_group()
  -> player_group: PlayerGroup
```

获取所有失败的玩家

@*return* `player_group` — 单位组
## get_enemy_player_group_by_player

```lua
function PlayerGroup.get_enemy_player_group_by_player(player: Player)
  -> player_group: PlayerGroup
```

玩家的所有敌对玩家

@*param* `player` — 玩家

@*return* `player_group` — 单位组
## get_neutral_player_group

```lua
function PlayerGroup.get_neutral_player_group()
  -> player_group: PlayerGroup
```

所有非中立玩家

@*return* `player_group` — 单位组
## get_player_group_by_camp

```lua
function PlayerGroup.get_player_group_by_camp(camp: py.Camp)
  -> player_group: PlayerGroup
```

阵营內所有玩家

@*param* `camp` — 阵营

@*return* `player_group` — 单位组
## get_victorious_player_group

```lua
function PlayerGroup.get_victorious_player_group()
  -> player_group: PlayerGroup
```

获取所有胜利的玩家

@*return* `player_group` — 单位组
## handle

```lua
py.RoleGroup
```

玩家组
## pick

```lua
(method) PlayerGroup:pick()
  -> Player[]
```

将玩家组转换为Lua的玩家数组
## remove_player

```lua
(method) PlayerGroup:remove_player(player: Player)
```

移除玩家

@*param* `player` — 玩家
## type

```lua
string
```


