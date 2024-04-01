# Command

作弊指令

该功能仅在开发模式有效

## commands

```lua
{ [string]: fun(...any) }
```

## execute

```lua
function Command.execute(command: string, ...any)
```

 执行作弊指令
## register

```lua
function Command.register(command: string, callback: fun(...any))
```

 注册作弊指令（指令名称无视大小写）

