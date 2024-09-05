# Trigger

触发器

## add_tag

```lua
(method) Trigger:add_tag(tag: any)
```

添加标签
## all_triggers

```lua
table
```

## disable

```lua
(method) Trigger:disable()
```

禁用触发器
## disable_once

```lua
(method) Trigger:disable_once()
```

在本次事件中禁用此触发器
## enable

```lua
(method) Trigger:enable()
```

## event_manager

```lua
EventManager?
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

## has_tag

```lua
(method) Trigger:has_tag(tag: any)
  -> boolean
```

是否有标签
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

## recover_disable_once

```lua
(method) Trigger:recover_disable_once()
```

## remove

```lua
(method) Trigger:remove()
```

## remove_tag

```lua
(method) Trigger:remove_tag(tag: any)
```

移除标签
## type

```lua
string
```


# Trigger.CallBack


```lua
fun(trg: Trigger, ...any):any, any, any, any
```


