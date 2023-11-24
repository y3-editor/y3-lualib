# Class

## declare

```lua
function Class.declare(name: <T>, super?: string)
  -> <T:string>
  2. Class.Config
```

 定义一个类
## delete

```lua
function Class.delete(obj: table)
```

 析构一个实例
## extends

```lua
function Class.extends(name: <Class>, extendsName: <Extends>, init?: fun(self: <Class:string>, super: <Extends:string>, ...any))
```

## get

```lua
function Class.get(name: <T>)
  -> <T:string>
```

 获取一个类
## getConfig

```lua
function Class.getConfig(name: string)
  -> Class.Config
```

## isValid

```lua
function Class.isValid(obj: table)
  -> boolean
```

 判断一个实例是否有效
## new

```lua
function Class.new(name: <T>, tbl?: table)
  -> <T:string>
```

 实例化一个类
## runDel

```lua
function Class.runDel(obj: table, name: string)
```

## runInit

```lua
function Class.runInit(obj: table, name: string, ...any)
```

## setErrorHandler

```lua
function Class.setErrorHandler(errorHandler: fun(msg: string))
```

## super

```lua
function Class.super(name: string)
  -> fun(...any)
```

## type

```lua
function Class.type(obj: table)
  -> string?
```

 获取类的名称

# Class.Base


# Class.Config

## extends

```lua
(method) Class.Config:extends(extendsName: <Extends>, init?: fun(self: unknown, super: <Extends:string>))
```

## extendsCalls

```lua
Class.Extends.CallData[]
```

## extendsMap

```lua
table<string, boolean>
```

## getter

```lua
table<any, fun(obj: any)>
```

## initCalls

```lua
(fun(...any)[]|false)?
```

## name

```lua
string
```

## super

```lua
(method) Class.Config:super(name: string)
  -> fun(...any)
```

## superCache

```lua
table<string, fun(...any)>
```

## superClass

```lua
(Class.Base)?
```


# Class.Extends.CallData


```lua
{ name: string, init: fun(self: any, super: fun(...any), ...any)? }
```


