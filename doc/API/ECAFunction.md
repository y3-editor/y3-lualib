# ECAFunction

注册ECA函数

可以使用该功能让lua函数在ECA中被调用。

## call

```lua
(method) ECAFunction:call(func: function)
```

执行的函数
## call_name

```lua
string
```

## func

```lua
function
```

## params

```lua
{ key: string, type: string, optional: boolean }[]
```

## returns

```lua
{ key: string, type: string }[]
```

## with_param

```lua
(method) ECAFunction:with_param(key: string, type_name: string)
  -> ECAFunction
```

添加参数
## with_return

```lua
(method) ECAFunction:with_return(key: string, type_name: string)
  -> ECAFunction
```

添加返回值

