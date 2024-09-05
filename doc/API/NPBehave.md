# NPBehave.Blackboard

## AddObserver

```lua
(method) NPBehave.Blackboard:AddObserver(key: string, observer: fun(type: NPBehaveBlackboardType, value: any))
```

添加观察者
## Disable

```lua
(method) NPBehave.Blackboard:Disable()
```

禁用黑板
## Enable

```lua
(method) NPBehave.Blackboard:Enable()
```

启用黑板
## Get

```lua
(method) NPBehave.Blackboard:Get(key: string)
  -> any
```

获取键值
## GetObserverList

```lua
(method) NPBehave.Blackboard:GetObserverList(target: { [string]: fun(type: NPBehaveBlackboardType, value: any)[] }, key: string)
  -> fun(type: NPBehaveBlackboardType, value: any)[]
```

获取观察者列表
## IsSet

```lua
(method) NPBehave.Blackboard:IsSet(key: string)
  -> boolean
```

检查键是否已设置
## NotifyObservers

```lua
(method) NPBehave.Blackboard:NotifyObservers()
```

通知观察者
## RemoveObserver

```lua
(method) NPBehave.Blackboard:RemoveObserver(key: string, observer: fun(type: NPBehaveBlackboardType, value: any))
```

移除观察者
## Set

```lua
(method) NPBehave.Blackboard:Set(key: string, value: any)
```

设置键值
## Unset

```lua
(method) NPBehave.Blackboard:Unset(key: string)
```

取消设置键值
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## funcBindCache

```lua
table
```


# NPBehave.Blackboard.Notification

## key

```lua
string
```

## type

```lua
NPBehaveBlackboardType
```

## value

```lua
any
```


# NPBehave.Clock

## AddTimer

```lua
(method) NPBehave.Clock:AddTimer(delay: number, repeat_count: number, action: NPBehave.Tool.BindCallback, randomVariance?: number)
```

注册一个具有随机方差的计时器函数

@*param* `delay` — 延迟时间(以毫秒为单位)

@*param* `repeat_count` — 重复次数, 设为 -1 则重复直至取消注册.

@*param* `action` — 回调函数

@*param* `randomVariance` — 随机方差
## AddUpdateObserver

```lua
(method) NPBehave.Clock:AddUpdateObserver(action: NPBehave.Tool.BindCallback)
```

注册一个每帧都会调用的函数

@*param* `action` — 要调用的函数
## ElapsedTime

```lua
number
```

 经过时间
## GetTimerFromPool

```lua
(method) NPBehave.Clock:GetTimerFromPool()
  -> timer: NPBehave.Clock.Timer
```

从池中获取计时器

@*return* `timer` — 计时器
## HasTimer

```lua
(method) NPBehave.Clock:HasTimer(action: NPBehave.Tool.BindCallback)
  -> boolean
```

检查是否存在计时器

@*param* `action` — 回调函数
## HasUpdateObserver

```lua
(method) NPBehave.Clock:HasUpdateObserver(action: NPBehave.Tool.BindCallback)
  -> boolean
```

检查是否存在每帧调用的函数

@*param* `action` — 要检查的函数

@*return* — 是否存在每帧调用的函数
## RemoveTimer

```lua
(method) NPBehave.Clock:RemoveTimer(action: NPBehave.Tool.BindCallback)
```

移除计时器

@*param* `action` — 回调函数
## RemoveUpdateObserver

```lua
(method) NPBehave.Clock:RemoveUpdateObserver(action: NPBehave.Tool.BindCallback)
```

移除每帧调用的函数

@*param* `action` — 要移除的函数
## Update

```lua
(method) NPBehave.Clock:Update(deltaTime: number)
```

更新函数

@*param* `deltaTime` — 时间增量

# NPBehave.Clock.AddTimerStruct

## Timer

```lua
NPBehave.Clock.Timer
```

## TimerId

```lua
number
```


# NPBehave.Clock.Timer

## Action

```lua
(NPBehave.Tool.BindCallback)?
```

## Delay

```lua
number
```

## RandomVariance

```lua
number
```

## Repeat

```lua
integer
```

 重复次数, 设为 -1 则重复直至取消注册.
## ScheduleAbsoluteTime

```lua
(method) NPBehave.Clock.Timer:ScheduleAbsoluteTime(elapsedTime: number)
```

## ScheduledTime

```lua
number
```

## Used

```lua
boolean
```

## repeat_count

```lua
integer
```


# NPBehave.Composite.Composite

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Children

```lua
NPBehave.Node[]?
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Node:DoCancel()
```

virtual<br>
## DoChildStopped

```lua
(method) NPBehave.Container:DoChildStopped(child: NPBehave.Node, succeeded: boolean)
```

abstract<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Node:DoStart()
```

virtual<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Composite.Composite:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StopLowerPriorityChildrenForChild

```lua
fun(self: NPBehave.Composite.Composite, child: NPBehave.Node, immediateRestart: boolean)
```

abstract<br>
## Stopped

```lua
(method) NPBehave.Composite.Composite:Stopped(success: boolean)
```

override<br>
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Composite.Parallel

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Children

```lua
NPBehave.Node[]?
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Composite.Parallel:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Composite.Parallel:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Composite.Parallel:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Composite.Composite:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StopLowerPriorityChildrenForChild

```lua
(method) NPBehave.Composite.Parallel:StopLowerPriorityChildrenForChild(abortForChild: NPBehave.Node, immediateRestart: boolean)
```

## Stopped

```lua
(method) NPBehave.Composite.Composite:Stopped(success: boolean)
```

override<br>
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Composite.RandomSelector

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Children

```lua
NPBehave.Node[]?
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Composite.RandomSelector:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Composite.RandomSelector:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Composite.RandomSelector:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## ProcessChildren

```lua
(method) NPBehave.Composite.RandomSelector:ProcessChildren()
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Composite.Composite:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StopLowerPriorityChildrenForChild

```lua
(method) NPBehave.Composite.RandomSelector:StopLowerPriorityChildrenForChild(abortForChild: NPBehave.Node, immediateRestart: boolean)
```

## Stopped

```lua
(method) NPBehave.Composite.Composite:Stopped(success: boolean)
```

override<br>
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Composite.RandomSequence

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Children

```lua
NPBehave.Node[]?
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Composite.RandomSequence:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Composite.RandomSequence:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Composite.RandomSequence:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## ProcessChildren

```lua
(method) NPBehave.Composite.RandomSequence:ProcessChildren()
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Composite.Composite:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StopLowerPriorityChildrenForChild

```lua
(method) NPBehave.Composite.RandomSequence:StopLowerPriorityChildrenForChild(abortForChild: NPBehave.Node, immediateRestart: boolean)
```

## Stopped

```lua
(method) NPBehave.Composite.Composite:Stopped(success: boolean)
```

override<br>
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Composite.Selector

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Children

```lua
NPBehave.Node[]?
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Composite.Selector:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Composite.Selector:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Composite.Selector:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## ProcessChildren

```lua
(method) NPBehave.Composite.Selector:ProcessChildren()
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Composite.Composite:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StopLowerPriorityChildrenForChild

```lua
(method) NPBehave.Composite.Selector:StopLowerPriorityChildrenForChild(abortForChild: NPBehave.Node, immediateRestart: boolean)
```

## Stopped

```lua
(method) NPBehave.Composite.Composite:Stopped(success: boolean)
```

override<br>
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Composite.Sequence

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Children

```lua
NPBehave.Node[]?
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Composite.Sequence:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Composite.Sequence:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Composite.Sequence:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## ProcessChildren

```lua
(method) NPBehave.Composite.Sequence:ProcessChildren()
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Composite.Composite:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StopLowerPriorityChildrenForChild

```lua
(method) NPBehave.Composite.Sequence:StopLowerPriorityChildrenForChild(abortForChild: NPBehave.Node, immediateRestart: boolean)
```

## Stopped

```lua
(method) NPBehave.Composite.Composite:Stopped(success: boolean)
```

override<br>
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Container

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Node:DoCancel()
```

virtual<br>
## DoChildStopped

```lua
(method) NPBehave.Container:DoChildStopped(child: NPBehave.Node, succeeded: boolean)
```

abstract<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Node:DoStart()
```

virtual<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Node:SetRoot(rootNode: NPBehave.Root)
```

virtual<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Context

abstract<br>

## Blackboards

```lua
table<string, NPBehave.Blackboard>
```

## Clock

```lua
unknown
```

## GetInstance

```lua
function NPBehave.Context.GetInstance()
  -> NPBehave.Context
```

## GetSharedBlackboard

```lua
function NPBehave.Context.GetSharedBlackboard(key: string)
  -> NPBehave.Blackboard
```

获取共享黑板
## Instance

```lua
nil
```

abstract<br>
## Platform

```lua
nil
```

abstract<br>

# NPBehave.Decorator.BlackboardCondition

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoParentCompositeStopped(parentComposite: NPBehave.Composite.Composite)
```

override<br>
## DoStart

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoStart()
```

override<br>
## Evaluate

```lua
(method) NPBehave.Decorator.ObservingDecorator:Evaluate()
```

protected
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsConditionMet

```lua
(method) NPBehave.Decorator.BlackboardCondition:IsConditionMet()
  -> boolean
```

override<br>
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## OnValueChanged

```lua
(method) NPBehave.Decorator.BlackboardCondition:OnValueChanged(type: NPBehaveBlackboardType, newValue: any)
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StartObserving

```lua
(method) NPBehave.Decorator.BlackboardCondition:StartObserving()
```

override<br>
## StopObserving

```lua
(method) NPBehave.Decorator.BlackboardCondition:StopObserving()
```

override<br>
## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## StopsOnChange

```lua
NPBehave.Enum.Stops
```

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.BlackboardQuery

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoParentCompositeStopped(parentComposite: NPBehave.Composite.Composite)
```

override<br>
## DoStart

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoStart()
```

override<br>
## Evaluate

```lua
(method) NPBehave.Decorator.ObservingDecorator:Evaluate()
```

protected
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsConditionMet

```lua
(method) NPBehave.Decorator.BlackboardQuery:IsConditionMet()
  -> boolean
```

override<br>
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## OnValueChanged

```lua
(method) NPBehave.Decorator.BlackboardQuery:OnValueChanged(type: NPBehaveBlackboardType, newValue: any)
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StartObserving

```lua
(method) NPBehave.Decorator.BlackboardQuery:StartObserving()
```

override<br>
## StopObserving

```lua
(method) NPBehave.Decorator.BlackboardQuery:StopObserving()
```

override<br>
## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## StopsOnChange

```lua
NPBehave.Enum.Stops
```

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Condition

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoParentCompositeStopped(parentComposite: NPBehave.Composite.Composite)
```

override<br>
## DoStart

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoStart()
```

override<br>
## Evaluate

```lua
(method) NPBehave.Decorator.ObservingDecorator:Evaluate()
```

protected
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsConditionMet

```lua
(method) NPBehave.Decorator.Condition:IsConditionMet()
  -> boolean
```

override<br>
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StartObserving

```lua
(method) NPBehave.Decorator.Condition:StartObserving()
```

override<br>
## StopObserving

```lua
(method) NPBehave.Decorator.Condition:StopObserving()
```

override<br>
## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## StopsOnChange

```lua
NPBehave.Enum.Stops
```

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Cooldown

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Cooldown:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Cooldown:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Cooldown:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## TimeoutReached

```lua
(method) NPBehave.Decorator.Cooldown:TimeoutReached()
```

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Decorator

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Node:DoCancel()
```

virtual<br>
## DoChildStopped

```lua
(method) NPBehave.Container:DoChildStopped(child: NPBehave.Node, succeeded: boolean)
```

abstract<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Node:DoStart()
```

virtual<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Failer

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Failer:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Failer:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Failer:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Hook

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Hook:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Hook:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Hook:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Inverter

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Inverter:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Inverter:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Inverter:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Observer

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Observer:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Observer:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Observer:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.ObservingDecorator

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoChildStopped(child: NPBehave.Node, result: boolean)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoParentCompositeStopped(parentComposite: NPBehave.Composite.Composite)
```

override<br>
## DoStart

```lua
(method) NPBehave.Decorator.ObservingDecorator:DoStart()
```

override<br>
## Evaluate

```lua
(method) NPBehave.Decorator.ObservingDecorator:Evaluate()
```

protected
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsConditionMet

```lua
fun()
```

abstract
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## StartObserving

```lua
fun()
```

abstract
## StopObserving

```lua
fun()
```

abstract
## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## StopsOnChange

```lua
NPBehave.Enum.Stops
```

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Random

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Random:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Random:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Random:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Repeater

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Repeater:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Repeater:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Repeater:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RestartDecorator

```lua
(method) NPBehave.Decorator.Repeater:RestartDecorator()
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Service

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Service:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Service:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Service:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## InvokeServiceMethodWithRandomVariation

```lua
(method) NPBehave.Decorator.Service:InvokeServiceMethodWithRandomVariation()
```

带随机变化的调用服务方法
## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.Succeeder

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.Succeeder:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.Succeeder:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.Succeeder:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.TimeMax

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.TimeMax:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.TimeMax:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.TimeMax:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## TimeoutReached

```lua
(method) NPBehave.Decorator.TimeMax:TimeoutReached()
```

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.TimeMin

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.TimeMin:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.TimeMin:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.TimeMin:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## TimeoutReached

```lua
(method) NPBehave.Decorator.TimeMin:TimeoutReached()
```

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Decorator.WaitForCondition

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## CheckCondition

```lua
(method) NPBehave.Decorator.WaitForCondition:CheckCondition()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Decorator.WaitForCondition:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Decorator.WaitForCondition:DoChildStopped(child: any, result: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Decorator.WaitForCondition:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Decorator.Decorator:SetRoot(rootNode: NPBehave.Root)
```

override<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Enum.NodeState

```lua
{
    Inactive: string = Inactive,
    Active: string = Active,
    StopRequested: string = StopRequested,
}
```


# NPBehave.Enum.NodeState.Active


# NPBehave.Enum.NodeState.Inactive


# NPBehave.Enum.NodeState.StopRequested


# NPBehave.Enum.Operator

```lua
{
    IsSet: string = IsSet,
    IsNotSet: string = IsNotSet,
    IsEqual: string = IsEqual,
    IsNotEqual: string = IsNotEqual,
    IsGreaterOrEqual: string = IsGreaterOrEqual,
    IsGreater: string = IsGreater,
    IsSmallerOrEqual: string = IsSmallerOrEqual,
    IsSmaller: string = IsSmaller,
    AlwaysTrue: string = AlwaysTrue,
}
```


# NPBehave.Enum.Operator.AlwaysTrue


# NPBehave.Enum.Operator.IsEqual


# NPBehave.Enum.Operator.IsGreater


# NPBehave.Enum.Operator.IsGreaterOrEqual


# NPBehave.Enum.Operator.IsNotEqual


# NPBehave.Enum.Operator.IsNotSet


# NPBehave.Enum.Operator.IsSet


# NPBehave.Enum.Operator.IsSmaller


# NPBehave.Enum.Operator.IsSmallerOrEqual


# NPBehave.Enum.ParallelPolicy

```lua
{
    One: string = One,
    All: string = All,
}
```


# NPBehave.Enum.ParallelPolicy.All


# NPBehave.Enum.ParallelPolicy.One


# NPBehave.Enum.Stops

```lua
{
    None: string = None,
    Self: string = Self,
    LowerPriority: string = LowerPriority,
    Both: string = Both,
    ImmediateRestart: string = ImmediateRestart,
    LowerPriorityImmediateRestart: string = LowerPriorityImmediateRestart,
}
```


# NPBehave.Enum.Stops.Both


# NPBehave.Enum.Stops.ImmediateRestart


# NPBehave.Enum.Stops.LowerPriority


# NPBehave.Enum.Stops.LowerPriorityImmediateRestart


# NPBehave.Enum.Stops.None


# NPBehave.Enum.Stops.Self


# NPBehave.GameContext

## Blackboards

```lua
table<string, NPBehave.Blackboard>
```

## Clock

```lua
unknown
```

## GetInstance

```lua
function NPBehave.Context.GetInstance()
  -> NPBehave.Context
```

## GetSharedBlackboard

```lua
function NPBehave.Context.GetSharedBlackboard(key: string)
  -> NPBehave.Blackboard
```

获取共享黑板
## Instance

```lua
nil
```

abstract<br>
## Platform

```lua
nil
```

abstract<br>
## Update

```lua
function NPBehave.GameContext.Update(gameTime: number)
```


# NPBehave.GamePlatform

## GenerateRandom

```lua
(method) NPBehave.GamePlatform:GenerateRandom()
  -> number
```

override<br>

# NPBehave.Node

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Node:DoCancel()
```

virtual<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Node:DoStart()
```

virtual<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Node:SetRoot(rootNode: NPBehave.Root)
```

virtual<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Platform

abstract<br>

## GenerateRandom

```lua
fun():number
```

abstract<br>

# NPBehave.Root

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## ChildStopped

```lua
(method) NPBehave.Container:ChildStopped(child: NPBehave.Node, succeeded: boolean)
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## Collapse

```lua
boolean
```

崩溃
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## Decoratee

```lua
NPBehave.Node
```

## DoCancel

```lua
(method) NPBehave.Root:DoCancel()
```

override<br>
## DoChildStopped

```lua
(method) NPBehave.Root:DoChildStopped(node: any, success: any)
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Root:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Decorator.Decorator:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

override<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Root:SetRoot(rootNode: NPBehave.Root)
```

## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Task.Action

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Task.Action:DoCancel()
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Task.Action:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## OnUpdateFunc

```lua
(method) NPBehave.Task.Action:OnUpdateFunc()
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Node:SetRoot(rootNode: NPBehave.Root)
```

virtual<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Task.Action.InitParam

## action

```lua
fun()?
```

## multiFrameFunc

```lua
(fun(param: boolean):NPBehaveTaskActionResult)?
```

## singleFrameFunc

```lua
(fun():boolean)?
```


# NPBehave.Task.Task

abstract<br>

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Node:DoCancel()
```

virtual<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Node:DoStart()
```

virtual<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Node:SetRoot(rootNode: NPBehave.Root)
```

virtual<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Task.Wait

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Task.Wait:DoCancel()
```

override<br>
## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Task.Wait:DoStart()
```

override<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## OnTimer

```lua
(method) NPBehave.Task.Wait:OnTimer()
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Node:SetRoot(rootNode: NPBehave.Root)
```

virtual<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Task.Wait.Data

## blackboardKey

```lua
string?
```

## callback

```lua
(fun():number)?
```

## randomVariance

```lua
number?
```

## seconds

```lua
number?
```


# NPBehave.Task.WaitUntilStopped

## Blackboard

```lua
NPBehave.Blackboard
```

`__getter`
## CancelWithoutReturnResult

```lua
(method) NPBehave.Node:CancelWithoutReturnResult()
```

## Clock

```lua
NPBehave.Clock
```

`__getter`
## CurrentState

```lua
NPBehave.Enum.NodeState
```

`__getter`
## DoCancel

```lua
(method) NPBehave.Task.WaitUntilStopped:DoCancel()
```

## DoParentCompositeStopped

```lua
(method) NPBehave.Node:DoParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
 处于非活动状态时调用, 目的是让装饰者删除任何正在等待的观察者.
## DoStart

```lua
(method) NPBehave.Node:DoStart()
```

virtual<br>
## GetPath

```lua
(method) NPBehave.Node:GetPath()
  -> string|unknown
```

## IsActive

```lua
boolean
```

`__getter`
## IsStopRequested

```lua
boolean
```

`__getter`
## Label

```lua
string
```

显示标签
## Name

```lua
string
```

## ParentCompositeStopped

```lua
(method) NPBehave.Node:ParentCompositeStopped(composite: NPBehave.Composite.Composite)
```

virtual<br>
## ParentNode

```lua
(NPBehave.Container)?
```

## RootNode

```lua
NPBehave.Root
```

## SetParent

```lua
(method) NPBehave.Node:SetParent(parentNode: NPBehave.Container)
```

## SetRoot

```lua
(method) NPBehave.Node:SetRoot(rootNode: NPBehave.Root)
```

virtual<br>
## Start

```lua
(method) NPBehave.Node:Start()
```

## Stopped

```lua
(method) NPBehave.Node:Stopped(success: any)
```

virtual<br>
这绝对必须是函数中的最后一个调用, 调用停止后切勿修改任何状态!!! 
## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## currentState

```lua
NPBehave.Enum.NodeState
```

## funcBindCache

```lua
table
```

## name

```lua
string
```


# NPBehave.Tool.BindCallback


# NPBehave.Tool.MethodDecorator

## bind

```lua
(method) NPBehave.Tool.MethodDecorator:bind(func: fun(...any))
  -> NPBehave.Tool.BindCallback
```

函数绑定到对象
## funcBindCache

```lua
table
```


