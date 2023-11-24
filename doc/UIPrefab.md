# UIPrefab

## create

```lua
function UIPrefab.create(player: Player, prefab_name: string, parent_ui: UI)
  -> UIPrefab
```

创建界面模块实例

@*param* `player` — 玩家

@*param* `prefab_name` — 界面模块id

@*param* `parent_ui` — 父控件
## get_by_handle

```lua
function UIPrefab.get_by_handle(player: Player, prefab_name: string)
  -> UIPrefab
```

通过py层的界面实例获取lua层的界面实例

@*param* `player` — 玩家

@*return* — 返回在lua层初始化后的lua层技能实例
## get_ui

```lua
(method) UIPrefab:get_ui(player: Player)
  -> UI
```

 获取 UIPrefab 的 UI 实例

@*param* `player` — 玩家
## handle

```lua
string
```

## player

```lua
Player
```

## remove

```lua
(method) UIPrefab:remove()
```

删除界面模块实例
## type

```lua
string
```


