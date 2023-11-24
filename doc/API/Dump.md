# Dump

## decode

```lua
function Dump.decode(bin: string)
  -> any
```

 反序列化数据
## decodeHook

```lua
function Dump.decodeHook(value: any)
  -> unknown
```

## encode

```lua
function Dump.encode(data: Serialization.SupportTypes)
  -> string
```

 序列化数据
## encodeHook

```lua
function Dump.encodeHook(value: any)
  -> table|nil
```


