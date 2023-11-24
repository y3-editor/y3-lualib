# PYEventRegister

## build_params_lazy_mt

```lua
function PYEventRegister.build_params_lazy_mt(event_data: table)
  -> table
```

## convert_py_params

```lua
function PYEventRegister.convert_py_params(event_key: y3.Const.EventType, event_params: py.Dict)
  -> table
```

## convert_py_params_instant

```lua
function PYEventRegister.convert_py_params_instant(event_name: y3.Const.EventType, event_data: table, event_params: py.Dict)
  -> table
```

## convert_py_params_lazy

```lua
function PYEventRegister.convert_py_params_lazy(event_key: y3.Const.EventType, event_data: table, event_params: py.Dict)
  -> table
```

## event_register

```lua
function PYEventRegister.event_register(event_name: y3.Const.EventType, extra_args?: any[])
```

@*param* `event_name` — 注册给引擎的事件名

@*param* `extra_args` — 额外参数
## event_unregister

```lua
function PYEventRegister.event_unregister(event_name: any, extra_args: any)
```

## need_enable_trigger_manualy

```lua
boolean
```

## next_id

```lua
function PYEventRegister.next_id()
  -> integer
```

## params_metatable_cache

```lua
table
```

## ref_args

```lua
function PYEventRegister.ref_args(name: string, args?: any[])
  -> PYEventRef
```

 为参数增加引用计数，返回引用
## ref_map

```lua
unknown
```

## remove_py_trigger

```lua
function PYEventRegister.remove_py_trigger(trigger_id: any)
```

## removed_ids

```lua
table
```

## trigger_id_counter

```lua
unknown
```

## unref_args

```lua
function PYEventRegister.unref_args(name: string, args?: any[])
  -> PYEventRef
```

 为参数减少引用计数，返回引用

