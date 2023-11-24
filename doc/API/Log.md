# Log

## build

```lua
(method) Log:build(level: string, ...any)
  -> message: string
  2. timestamp: string
```

## clock

```lua
function
```

## debug

```lua
fun(...any):string, string
```

## error

```lua
fun(...any):string, string
```

## fatal

```lua
fun(...any):string, string
```

## file

```lua
file*?
```




[查看文档](http://www.lua.org/manual/5.4/manual.html#pdf-file)

## getTimeStamp

```lua
(method) Log:getTimeStamp()
  -> string
```

## info

```lua
fun(...any):string, string
```

## level

```lua
string
```

## logLevel

```lua
table<Log.Level, integer>
```

## maxSize

```lua
integer
```

 设置日志文件的最大大小
## messageFormat

```lua
string
```

## needTraceBack

```lua
table<Log.Level, boolean>
```

## option

```lua
Log.Option
```

## startClock

```lua
number
```

## startTime

```lua
integer
```

## trace

```lua
fun(...any):string, string
```

## usedSize

```lua
integer
```

## warn

```lua
fun(...any):string, string
```


# Log.Level

```lua
"trace" | "debug" | "info" | "warn" | "error" | "fatal"
```


# Log.Option

## clock

```lua
(fun():number)?
```

获取当前时间，需要精确到毫秒
## file

```lua
file*
```

日志文件对象，与path二选一
## level

```lua
Log.Level
```

日志等级，低于此等级的日志将不会被记录
## logLevel

```lua
table<Log.Level, integer>
```

自定义日志等级
## maxSize

```lua
integer?
```

日志文件的最大大小
## needTraceBack

```lua
table<Log.Level, boolean>
```

是否需要打印堆栈信息
## path

```lua
string
```

日志文件的路径，与file二选一
## print

```lua
fun(level: Log.Level, message: string, timeStamp: string)
```

额外的打印回调

