# EventManager

## check_stack

```lua
(method) EventManager:check_stack()
```

## dispatch

```lua
(method) EventManager:dispatch(event_name: Event.Name, event_args?: any[], ...any)
  -> any
  2. any
  3. any
  4. any
```

## event

```lua
(method) EventManager:event(event_name: Event.Name, event_args?: any[], callback: Trigger.CallBack)
  -> Trigger
```

@*param* `event_name` — Lua框架使用的事件名
## event_map

```lua
table<string, Event>
```

## fire_lock

```lua
integer
```

## has_event

```lua
(method) EventManager:has_event(event_name: Event.Name, event_args?: any[])
  -> boolean
```

## is_firing

```lua
(method) EventManager:is_firing()
  -> boolean
```

## notify

```lua
(method) EventManager:notify(event_name: Event.Name, event_args?: any[], ...any)
```

## object

```lua
table
```

## pairs

```lua
(method) EventManager:pairs()
  -> fun():Trigger?
```

## stack_list

```lua
LinkedTable?
```

## stack_notify

```lua
(method) EventManager:stack_notify(event_name: Event.Name, event_args?: any[], ...any)
```


