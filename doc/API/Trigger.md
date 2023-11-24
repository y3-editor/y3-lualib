# Trigger

## disable

```lua
(method) Trigger:disable()
```

禁用触发器
## enable

```lua
(method) Trigger:enable()
```

## execute

```lua
(method) Trigger:execute(...any)
  -> any
  2. any
  3. any
  4. any
```

 运行触发器，最多能返回4个返回值
## get_include_name

```lua
(method) Trigger:get_include_name()
  -> string?
```

## is_enable

```lua
(method) Trigger:is_enable()
  -> boolean
```

## is_match_args

```lua
(method) Trigger:is_match_args(fire_args?: any[])
  -> boolean
```

 检查事件的参数与触发器的参数是否匹配，
 允许事件的参数数量多余触发器的参数数量。
## on_remove

```lua
(method) Trigger:on_remove(callback: any)
```

## remove

```lua
(method) Trigger:remove()
```

## type

```lua
string
```


# Trigger.CallBack


```lua
fun(...any):any, any, any, any
```


