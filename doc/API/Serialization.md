# Serialization

## decode

```lua
function Serialization.decode(str: string, hook?: fun(value: Serialization.SupportTypes):Serialization.SupportTypes)
  -> Serialization.SupportTypes
```

 反序列化二进制数据为Lua值
## encode

```lua
function Serialization.encode(data: Serialization.SupportTypes, hook?: fun(value: table):Serialization.SupportTypes)
  -> string
```

 将一个Lua值序列化为二进制数据

# Serialization.SupportTypes


```lua
boolean|string|number|table|nil
```


