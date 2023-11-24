# Event

## add_trigger

```lua
(method) Event:add_trigger(trigger: Trigger)
```

## check_waiting

```lua
(method) Event:check_waiting()
```

## dispatch

```lua
(method) Event:dispatch(event_args?: any[], ...any)
  -> any
  2. any
  3. any
  4. any
```

## event_name

```lua
Event.Name
```

## fire_lock

```lua
integer
```

## has_matched_trigger

```lua
(method) Event:has_matched_trigger(args: any[])
  -> boolean
```

## is_firing

```lua
(method) Event:is_firing()
  -> boolean
```

## notify

```lua
(method) Event:notify(event_args?: any[], ...any)
```

## pairs

```lua
(method) Event:pairs()
  -> fun():Trigger
```

## remove_trigger

```lua
(method) Event:remove_trigger(trigger: Trigger)
```

## triggers

```lua
LinkedTable
```

## wait_poping

```lua
Trigger[]
```

## wait_pushing

```lua
Trigger[]
```


# Event.Name


```lua
string
```


