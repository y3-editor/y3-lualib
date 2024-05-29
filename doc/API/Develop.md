# Develop.Arg

启动参数

该功能仅在开发模式有效


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

## register

```lua
function Develop.Command.register(command: string, info: function|Develop.Command.InfoParam)
```

 注册作弊指令（指令名称无视大小写）

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
fun(...any)
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
fun(...any)
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

# Develop.Helper

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
## requestPrint

```lua
function Develop.Helper.requestPrint(message: string)
```

在《Y3开发助手》的终端上打印消息
## response

```lua
function Develop.Helper.response(id: integer, result: any, err?: string)
```


