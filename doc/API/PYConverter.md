# PYConverter

## get_py_type

```lua
function PYConverter.get_py_type(type_name: string)
  -> string
```

## lua_to_py

```lua
function PYConverter.lua_to_py(py_type: string, lua_value: any)
  -> any
```

## lua_to_py_factory

```lua
function PYConverter.lua_to_py_factory(py_type: string)
  -> fun(py_value: any):any
```

## lua_to_py_method

```lua
{ [string]: fun(lua_value: any):any }
```

## py_to_lua

```lua
function PYConverter.py_to_lua(py_type: string, py_value: any)
  -> any
```

## py_to_lua_factory

```lua
function PYConverter.py_to_lua_factory(py_type: string)
  -> fun(lua_value: any):any
```

## py_to_lua_method

```lua
{ [string]: fun(py_value: any):any }
```

## register_lua_to_py

```lua
function PYConverter.register_lua_to_py(py_type: string, converter: fun(lua_value: any):any)
```

## register_py_to_lua

```lua
function PYConverter.register_py_to_lua(py_type: string, converter: fun(py_value: any):any)
```

## register_type_alias

```lua
function PYConverter.register_type_alias(py_type_name: string, lua_type_name: string)
```

## type_alias_map

```lua
{ [string]: string }
```


