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


