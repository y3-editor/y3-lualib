# UIPrefab

界面元件

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
## get_child

```lua
(method) UIPrefab:get_child(child_path?: string)
  -> UI?
```

获取 UIPrefab 的 UI 实例
>注意！这里的 path 是相对于 *节点第一层之后* 的（就是节点列表里有个默认不能删的节点，那个是第一层）

@*param* `child_path` — 路径，默认为根节点。
## get_ui

```lua
(method) UIPrefab:get_ui(player: Player)
  -> UI
```

 获取 UIPrefab 的 UI 实例
>请改用 `get_child` 方法

@*param* `player` — 玩家
## handle

```lua
string
```

## player

```lua
Player
```

玩家
## remove

```lua
(method) UIPrefab:remove()
```

删除界面模块实例
## type

```lua
string
```


