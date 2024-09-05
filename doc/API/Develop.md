# Develop.Arg

启动参数


# Develop.Attr

## attr

```lua
y3.Const.UnitAttr
```

## unit

```lua
Unit
```

单位
## watch

```lua
(method) Develop.Attr:watch(value: Develop.Attr.Accept, callback: Develop.Attr.Watch.Callback)
  -> Develop.Attr.Watch
```

监控属性变化，当属性从“不满足条件”变化为“满足条件”时触发回调

@*param* `value` — 表达式，如 `>= 100`，``` == `最大生命` ```

@*param* `callback` — 回调函数

# Develop.Attr.Accept


```lua
string|number|Develop.Attr.Condition
```


# Develop.Attr.Condition


```lua
fun(unit: Unit, value: number):boolean
```


# Develop.Attr.Watch

## attr

```lua
Develop.Attr
```

## callback

```lua
fun(attr: Develop.Attr, watch: Develop.Attr.Watch)
```

## condition

```lua
(Develop.Attr.Condition)?
```

## conditionStr

```lua
string?
```

## isSatisfied

```lua
boolean
```

## remove

```lua
(method) Develop.Attr.Watch:remove()
```

## trigger

```lua
Trigger
```

触发器

# Develop.Attr.Watch.Callback


```lua
fun(attr: Develop.Attr, watch: Develop.Attr.Watch, oldValue: number)
```


# Develop.Code

## on_sync

```lua
function Develop.Code.on_sync(id: string, handler: Develop.Code.SyncHandler)
```

注册同步处理器
## run

```lua
function Develop.Code.run(code: string, env?: table)
  -> boolean
  2. any
```

执行本地代码

@*param* `code` — 要执行的代码

@*param* `env` — 执行环境

@*return* — 是否执行成功

@*return* — 执行结果
## sync_run

```lua
function Develop.Code.sync_run(code: string, data?: table<string, any>, id?: string)
  -> boolean
  2. string?
```

广播后同步执行代码，必须由本地发起

@*param* `code` — 要执行的代码

@*param* `data` — 数据，代码里可以直接访问到

@*param* `id` — 处理器ID

@*return* — 是否执行成功

@*return* — 错误消息
## wrap_code

```lua
function Develop.Code.wrap_code(code: any, env: any)
  -> function|nil
  2. unknown|nil
  3. string|nil
```


# Develop.Code.SyncHandler

## complete

```lua
fun(suc: boolean, result: any, data: any)
```

代码执行后带着结果调用此函数
## env

```lua
fun(data: any):table?
```

返回一个表，用于作为执行环境

# Develop.Command

作弊指令

该功能仅在开发模式有效

## commands

```lua
{ [string]: Develop.Command.Info }
```

## execute

```lua
function Develop.Command.execute(command: string, ...any)
```

 执行作弊指令
## getAllCommands

```lua
function Develop.Command.getAllCommands()
  -> string[]
```

## getCommandInfo

```lua
function Develop.Command.getCommandInfo(command: string)
  -> (Develop.Command.Info)?
```

## getParams

```lua
function Develop.Command.getParams()
  -> Develop.Command.ExecuteParam
```

## input

```lua
function Develop.Command.input(prefix: string, input: string, player?: Player)
```

 输入作弊指令
## params

```lua
Develop.Command.ExecuteParam
```

## register

```lua
function Develop.Command.register(command: string, info: function|Develop.Command.InfoParam)
```

 注册作弊指令（指令名称无视大小写）

# Develop.Command.ExecuteParam

## args

```lua
string[]
```

命令参数
## command

```lua
string
```

输入的命令（和输入一致，不保证大小写状态）
## player

```lua
Player
```

调用命令的玩家

# Develop.Command.Info

## desc

```lua
string?
```

## name

```lua
string
```

## needSync

```lua
boolean?
```

## onCommand

```lua
fun(...any)?
```

## priority

```lua
number
```


# Develop.Command.InfoParam

## desc

```lua
string?
```

## needSync

```lua
boolean?
```

## onCommand

```lua
fun(...any)?
```

## priority

```lua
number?
```


# Develop.Console

## getHelpInfo

```lua
function Develop.Console.getHelpInfo()
  -> string
```

## input

```lua
function Develop.Console.input(input: string)
```

控制台输入
## show_result

```lua
function Develop.Console.show_result(ok: boolean, result: any)
  -> any
```


# Develop.Helper

## awaitRequest

```lua
(async) function Develop.Helper.awaitRequest(method: string, params: table)
  -> any
```

向《Y3开发助手》发送请求（协程）
## createAttrWatcher

```lua
function Develop.Helper.createAttrWatcher(unit: Unit, attrType: y3.Const.UnitAttr, condition?: Develop.Attr.Accept)
  -> Develop.Helper.TreeNode
```

在《Y3开发助手》上创建一个属性监视器

@*param* `unit` — 要监视的单位

@*param* `attrType` — 属性名

@*param* `condition` — 断点表达式，如 `>= 100`，``` <= `最大生命` / 2 ```
## createInputBox

```lua
function Develop.Helper.createInputBox(optional?: Develop.Helper.InputBox.Optional)
  -> Develop.Helper.InputBox
```

在《Y3开发助手》上创建一个输入框
## createTreeNode

```lua
function Develop.Helper.createTreeNode(name: string, optional?: Develop.Helper.TreeNode.Optional)
  -> Develop.Helper.TreeNode
```

在《Y3开发助手》的树形视图上创建一个节点
## createTreeView

```lua
function Develop.Helper.createTreeView(name: string, root: Develop.Helper.TreeNode)
  -> Develop.Helper.TreeView
```

在《Y3开发助手》的视图上创建一个树形视图
## init

```lua
function Develop.Helper.init(port?: integer)
```

初始化与《Y3开发助手》的连接。如果用VSCode启动游戏，会自动连接。
其他情况若有需求可以调用此函数连接。
## isReady

```lua
function Develop.Helper.isReady()
  -> boolean
```

《Y3开发助手》是否准备好
## notify

```lua
function Develop.Helper.notify(method: string, params: table)
```

向《Y3开发助手》发送通知
## onReady

```lua
function Develop.Helper.onReady(callback: fun())
```

当《Y3开发助手》准备好时调用
## prepareForRestart

```lua
function Develop.Helper.prepareForRestart(options: Develop.Helper.RestartOptions)
```

准备重启游戏
## print

```lua
function Develop.Helper.print(message: string)
```

在《Y3开发助手》的终端上打印消息
## registerMethod

```lua
function Develop.Helper.registerMethod(method: string, callback: fun(params: any):any)
```

## request

```lua
function Develop.Helper.request(method: string, params: table, callback?: fun(data: any))
```

向《Y3开发助手》发送请求

@*param* `callback` — 接收返回值
## requestCommand

```lua
function Develop.Helper.requestCommand(command: string, args?: any[], callback?: fun(result: any))
```

## response

```lua
function Develop.Helper.response(id: integer, result: any, err?: string)
```

## treeViewMap

```lua
{ [string]: Develop.Helper.TreeView }
```


# Develop.Helper.Attr

## add

```lua
(method) Develop.Helper.Attr:add(unit: Unit, attr: y3.Const.UnitAttr)
  -> Develop.Helper.TreeNode
  2. fun(value: Develop.Attr.Accept)
```

@*return*

@*return* — 设置断点
## childs

```lua
Develop.Helper.TreeNode[]
```

## root

```lua
unknown
```

## tree

```lua
unknown
```


# Develop.Helper.Attr.ModifyOptions

## attr_type

```lua
(y3.Const.UnitAttrType)?
```

## can_create_watch

```lua
boolean?
```


# Develop.Helper.Explorer

## attrLayout

```lua
string
```

给这个变量重新赋值即可重新定义排版，语法自己研究吧
## create

```lua
function Develop.Helper.Explorer.create()
```

## createGamePause

```lua
function Develop.Helper.Explorer.createGamePause()
```

## createGameSpeed

```lua
function Develop.Helper.Explorer.createGameSpeed()
```

## createGameTimer

```lua
function Develop.Helper.Explorer.createGameTimer()
  -> Develop.Helper.TreeNode
```

## createMemoryWatcher

```lua
function Develop.Helper.Explorer.createMemoryWatcher()
  -> Develop.Helper.TreeNode
```

## createRefWatcher

```lua
function Develop.Helper.Explorer.createRefWatcher()
  -> Develop.Helper.TreeNode
```

## createReloadButton

```lua
function Develop.Helper.Explorer.createReloadButton()
  -> unknown
```

## createRestartGameButton

```lua
function Develop.Helper.Explorer.createRestartGameButton()
  -> unknown
```

## createRoot

```lua
function Develop.Helper.Explorer.createRoot(name: string)
  -> Develop.Helper.TreeNode
```

## createSelectingButton

```lua
function Develop.Helper.Explorer.createSelectingButton()
  -> unknown
```

## createTimerWatcher

```lua
function Develop.Helper.Explorer.createTimerWatcher()
  -> Develop.Helper.TreeNode
```

## createTriggerWatcher

```lua
function Develop.Helper.Explorer.createTriggerWatcher()
  -> Develop.Helper.TreeNode
```

## createUnitButton

```lua
function Develop.Helper.Explorer.createUnitButton(unit: Unit)
  -> Develop.Helper.TreeNode
```

## gamePauseButton

```lua
unknown
```

## gamePaused

```lua
any
```

## gameSpeed

```lua
number
```

## gameSpeedApply

```lua
boolean
```

## gameSpeedButton

```lua
unknown
```


# Develop.Helper.InputBox

## id

```lua
integer
```

## ignoreFocusOut

```lua
boolean
```

是否在失去焦点时关闭
## inputBoxMap

```lua
{ [integer]: Develop.Helper.InputBox }
```

## password

```lua
boolean
```

是否是密码框
## placeHolder

```lua
string
```

占位符
## prompt

```lua
string
```

提示
## remove

```lua
(method) Develop.Helper.InputBox:remove()
```

删除输入框
## show

```lua
(method) Develop.Helper.InputBox:show(callback: fun(value?: string))
```

显示输入框

@*param* `callback` — 输入完成后的回调函数。如果用户取消输入，`value` 为 `nil`。
## title

```lua
string
```

标题
## validateInput

```lua
fun(value: string):string|nil
```

返回一个错误消息表示输入不合法
## value

```lua
string
```

初始值
## valueSelection

```lua
[integer, integer]
```

初始选中的文本范围(光标位置，第一个字符前为0)

# Develop.Helper.InputBox.Optional

输入框的可选项，完全照抄的 VSCode 的接口

## ignoreFocusOut

```lua
boolean
```

是否在失去焦点时关闭
## password

```lua
boolean
```

是否是密码框
## placeHolder

```lua
string
```

占位符
## prompt

```lua
string
```

提示
## title

```lua
string
```

标题
## validateInput

```lua
fun(value: string):string|nil
```

返回一个错误消息表示输入不合法
## value

```lua
string
```

初始值
## valueSelection

```lua
[integer, integer]
```

初始选中的文本范围(光标位置，第一个字符前为0)

# Develop.Helper.RestartOptions

## debugger

```lua
boolean
```

是否需要启动调试器。如果省略，会根据当前是否附加了调试器来决定是否需要调试器。

# Develop.Helper.TreeNode

## changeChecked

```lua
(method) Develop.Helper.TreeNode:changeChecked(checked: boolean)
```

## changeExpanded

```lua
(method) Develop.Helper.TreeNode:changeExpanded(expanded: boolean)
```

## changeVisible

```lua
(method) Develop.Helper.TreeNode:changeVisible(visible: boolean)
```

## check

```lua
boolean
```

复选框状态
## childs

```lua
Develop.Helper.TreeNode[]?
```

## description

```lua
string
```

描述
## icon

```lua
string
```

图标
## id

```lua
integer
```

## isExpanded

```lua
(method) Develop.Helper.TreeNode:isExpanded()
  -> boolean
```

## isVisible

```lua
(method) Develop.Helper.TreeNode:isVisible()
  -> boolean
```

## lastChilds

```lua
Develop.Helper.TreeNode[]?
```

## makeNodeInfo

```lua
(method) Develop.Helper.TreeNode:makeNodeInfo()
  -> table
```

## name

```lua
string
```

## nodeMap

```lua
{ [integer]: Develop.Helper.TreeNode }
```

## optional

```lua
Develop.Helper.TreeNode.Optional
```

## refresh

```lua
(method) Develop.Helper.TreeNode:refresh()
```

通知子节点有变化。
## remove

```lua
(method) Develop.Helper.TreeNode:remove()
```

## tooltip

```lua
string
```

提示
## update

```lua
(method) Develop.Helper.TreeNode:update()
```

更新此节点的数据（不包含子节点）。

# Develop.Helper.TreeNode.Optional

## check

```lua
boolean?
```

复选框状态，应该要配合 `onCheck` 与 `onUnCheck` 使用
## childs

```lua
Develop.Helper.TreeNode[]
```

子节点列表。如果子节点计算量较大，可以改用 `childsGetter` 来获取子节点
## childsGetter

```lua
fun(node: Develop.Helper.TreeNode):Develop.Helper.TreeNode[]
```

当试图展开节点时，会调用这个函数获取子节点，和 `childs` 互斥
## description

```lua
string?
```

描述
## icon

```lua
string?
```

图标，见 https://code.visualstudio.com/api/references/icons-in-labels#icon-listing
## onCheck

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点复选框被勾选时调用
## onClick

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点被点击时调用
## onCollapse

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点被折叠时调用
## onExpand

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点被展开时调用
## onInit

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点创建第一次可见时调用
## onInvisible

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点看不到时调用
## onUnCheck

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点复选框被取消勾选时调用
## onVisible

```lua
fun(node: Develop.Helper.TreeNode)
```

当节点能被看到时调用
## tooltip

```lua
string?
```

提示

# Develop.Helper.TreeView

## id

```lua
integer
```

## name

```lua
string
```

## remove

```lua
(method) Develop.Helper.TreeView:remove()
```

## root

```lua
Develop.Helper.TreeNode
```


# Develop.TimerWatcher

## count

```lua
function Develop.TimerWatcher.count()
  -> table<string, { all: integer, alive: integer }>
```


# Develop.TriggerWatcher

## activeWatcher

```lua
unknown
```

## count

```lua
function Develop.TriggerWatcher.count()
  -> { all: integer, alive: integer }
```

## lastWatcher

```lua
Develop.TriggerWatcherInstance
```

## report

```lua
function Develop.TriggerWatcher.report()
  -> { count: integer, cost: number, time: number, average: number, tops: string[] }|nil
```

获取监控报告
## start

```lua
function Develop.TriggerWatcher.start()
```

开始监控触发器
## stop

```lua
function Develop.TriggerWatcher.stop()
```

停止监控触发器

# Develop.TriggerWatcherInstance

## endTime

```lua
unknown
```

结束时间（毫秒）
## makeReport

```lua
(method) Develop.TriggerWatcherInstance:makeReport(inTime?: number, topCount?: integer)
  -> { count: integer, cost: number, time: number, average: number, tops: string[] }
```

@*param* `inTime` — 只统计最后X秒的数据

@*param* `topCount` — 统计前X个耗时最长的函数位置
## originalExecute

```lua
function
```

## runnedCallback

```lua
table
```

## runnedClock

```lua
table
```

## runnedCost

```lua
table
```

## startTime

```lua
unknown
```

开始时间（毫秒）

