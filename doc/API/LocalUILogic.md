# LocalUILogic

本地UI逻辑框架

## apply_kv

```lua
(method) LocalUILogic:apply_kv(kv?: table)
```

## as_prefab

```lua
(method) LocalUILogic:as_prefab(prefab_name: string)
```

## attach

```lua
(method) LocalUILogic:attach(ui: UI, kv?: table)
  -> LocalUILogic
```

附着到一个UI上

@*param* `kv` — 数据使用 `instance:storage_get` 获取
## bind_prefab

```lua
(method) LocalUILogic:bind_prefab(child_name: string, prefab_logic: LocalUILogic, prefab_token?: any)
```

绑定元件

@*param* `child_name` — 空字符串表示主控件

@*param* `prefab_logic` — 使用 `y3.local_ui.prefab` 创建的元件逻辑

@*param* `prefab_token` — 如果你在不同的控件下绑定了相同的元件且需要分开刷新，可以为它们设置不同的 token
## bind_unit_attr

```lua
(method) LocalUILogic:bind_unit_attr(child_name: string, ui_attr: y3.Const.UIAttr, unit_attr: string|y3.Const.UnitAttr)
```

将子控件的属性绑定到单位的属性
## detach

```lua
(method) LocalUILogic:detach()
```

## get_refresh_targets

```lua
(method) LocalUILogic:get_refresh_targets(name: string)
  -> LocalUILogic.OnRefreshInfo[]
```

## init

```lua
(method) LocalUILogic:init()
```

## make_instance

```lua
(method) LocalUILogic:make_instance(kv?: table)
  -> LocalUILogic
```

## on_event

```lua
(method) LocalUILogic:on_event(child_name: string, event: y3.Const.UIEvent, callback: fun(ui: UI, local_player: Player, instance: LocalUILogic))
```

订阅控件的本地事件，回调函数在 *本地玩家* 环境中执行。

@*param* `child_name` — 空字符串表示主控件

```lua
event:
    | '左键-按下'
    | '左键-抬起'
    | '左键-点击'
    | '左键-双击'
    | '鼠标-悬停'
    | '鼠标-移入'
    | '鼠标-移出'
    | '鼠标-右击'
    | '右键-按下'
    | '右键-抬起'
    | '右键-点击'
    | '右键-双击'
```
## on_init

```lua
(method) LocalUILogic:on_init(child_name: string, on_init: fun(ui: UI, local_player: Player, instance: LocalUILogic))
```

订阅控件的初始化事件，回调函数在 *本地玩家* 环境中执行。

@*param* `child_name` — 空字符串表示主控件
## on_refresh

```lua
(method) LocalUILogic:on_refresh(child_name: string, on_refresh: fun(ui: UI, local_player: Player, instance: LocalUILogic))
```

订阅控件刷新，回调函数在 *本地玩家* 环境中执行。

@*param* `child_name` — 空字符串表示主控件
## refresh

```lua
(method) LocalUILogic:refresh(name: string, player?: Player)
```

刷新控件，指定的控件以及其子控件都会收到刷新消息。
参数为 `*` 时，刷新所有控件。

@*param* `player` — 只刷新此玩家的
## refresh_prefab

```lua
(method) LocalUILogic:refresh_prefab(prefab_token: any, count?: integer, on_create?: fun(index: integer, kv: table))
```

刷新元件

@*param* `prefab_token` — 要刷新的元件，默认为绑定时的元件逻辑

@*param* `count` — 修改元件数量

@*param* `on_create` — 创建新的元件时回调，`kv` 中默认会将 `index` 设置为这是第几个元件。
## register_events

```lua
(method) LocalUILogic:register_events()
```

## remove

```lua
(method) LocalUILogic:remove()
```

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


# LocalUILogic.OnEventInfo

## event

```lua
y3.Const.UIEvent
```

## name

```lua
string
```

## on_event

```lua
fun(ui: UI, local_player: Player, instance: LocalUILogic)
```


# LocalUILogic.OnInitInfo

## name

```lua
string
```

## on_init

```lua
fun(ui: UI, local_player: Player, instance: LocalUILogic)
```


# LocalUILogic.OnRefreshInfo

## name

```lua
string
```

## on_refresh

```lua
fun(ui: UI, local_player: Player, instance: LocalUILogic)
```


# LocalUILogic.PrefabInfo

## child_name

```lua
string
```

## prefab_logic

```lua
LocalUILogic
```

本地UI逻辑框架
## prefab_token

```lua
any
```


