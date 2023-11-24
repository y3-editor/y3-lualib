# Helper

## pack_list

```lua
function Helper.pack_list(lua_list: any[], unwrapper?: fun(lua_object: any):any)
  -> py.DynamicTypeMeta[]
```

## tonumber

```lua
function Helper.tonumber(n: number|py.Fixed)
  -> number
```

## unpack_list

```lua
function Helper.unpack_list(py_list: py.List, wrapper?: fun(py_object: any):any)
  -> any[]
```


