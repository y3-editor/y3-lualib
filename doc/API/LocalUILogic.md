# LocalUILogic

本地UI逻辑框架

## bind_unit_attr

```lua
(method) LocalUILogic:bind_unit_attr(child_name: string, ui_attr: y3.Const.UIAttr, unit_attr: string|y3.Const.UnitAttr)
```

将子控件的属性绑定到单位的属性
## get_refresh_targets

```lua
(method) LocalUILogic:get_refresh_targets(name: string)
  -> LocalUILogic.OnRefreshInfo[]
```

## init

```lua
(method) LocalUILogic:init()
```

## on_event

```lua
(method) LocalUILogic:on_event(child_name: string, event: y3.Const.UIEvent, callback: fun(ui: UI, local_player: Player))
```

订阅控件的本地事件，回调函数在 *本地玩家* 环境中执行。

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
(method) LocalUILogic:on_init(child_name: string, on_init: fun(ui: UI, local_player: Player))
```

订阅控件的初始化事件，回调函数在 *本地玩家* 环境中执行。
## on_refresh

```lua
(method) LocalUILogic:on_refresh(child_name: string, on_refresh: fun(ui: UI, local_player: Player))
```

订阅控件刷新，回调函数在 *本地玩家* 环境中执行。
使用空字符串表示主控件。
## refresh

```lua
(method) LocalUILogic:refresh(name: string, player?: Player)
```

刷新控件，指定的控件以及其子控件都会收到刷新消息。
参数为 `*` 时，刷新所有控件。

@*param* `player` — 只刷新此玩家的
## register_events

```lua
(method) LocalUILogic:register_events()
```

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
fun(ui: UI, local_player: Player)
```


# LocalUILogic.OnInitInfo

## name

```lua
string
```

## on_init

```lua
fun(ui: UI, local_player: Player)
```


# LocalUILogic.OnRefreshInfo

## name

```lua
string
```

## on_refresh

```lua
fun(ui: UI, local_player: Player)
```


