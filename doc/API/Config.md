# Config

## debug

```lua
string
```

 是否是debug模式
## log

```lua
unknown
```

 日志相关的配置
## sync

```lua
unknown
```

 同步相关的配置，当设置为 `true` 后将启用同步，
 会产生额外的流量。  
 同步需要一定的时间，获取到的是一小段时间前的状态，
 因此启用同步后不能立即获取状态。  

# Config.Log

## level

```lua
Log.Level
```

日志等级，默认为 `debug`
## logger

```lua
fun(level: Log.Level, message: string, timeStamp: string):boolean
```

自定义的日志处理函数，返回 `true` 将阻止默认的日志处理。在处理函数的执行过程中会屏蔽此函数。
## toDialog

```lua
boolean
```

是否打印到Dialog窗口，默认为 `true`
## toGame

```lua
boolean
```

是否打印到游戏窗口中，默认为 `false`

# Config.Sync

 同步相关的配置，当设置为 `true` 后将启用同步，
 会产生额外的流量。  
 同步需要一定的时间，获取到的是一小段时间前的状态，
 因此启用同步后不能立即获取状态。  

## camera

```lua
boolean
```

同步玩家的镜头
## key

```lua
boolean
```

同步玩家的键盘与鼠标按键
## mouse

```lua
boolean
```

同步玩家的鼠标位置

