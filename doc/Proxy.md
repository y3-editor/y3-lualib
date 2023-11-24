# Proxy

## config

```lua
function Proxy.config(proxyObj: table)
  -> table
```

## new

```lua
function Proxy.new(obj: <T>, config?: Proxy.Config, custom?: any)
  -> <T>
```

@*param* `obj` — 要代理的对象

@*param* `config` — 配置

@*param* `custom` — 自定义数据
## raw

```lua
function Proxy.raw(proxyObj: table)
  -> any
```


# Proxy.Config

## anyGetter

```lua
Proxy.Getter
```

只有没有对应的 `getter` 才会触发 `anyGetter`
## anySetter

```lua
Proxy.Setter
```

只有没有对应的 `setter` 才会触发 `anySetter`
## cache

```lua
boolean
```

将读写的结果缓存起来，下次读写时不会再触发`setter`,`getter`（除非上次的结果是`nil`
## getter

```lua
{ [any]: Proxy.Getter }?
```

## setter

```lua
{ [any]: Proxy.Setter }?
```

## updateRaw

```lua
boolean
```

是否将赋值写入到 `raw` 中

# Proxy.Getter


```lua
fun(self: table, raw: any, key: any, config: Proxy.Config, custom: any):any
```


# Proxy.Setter


```lua
fun(self: table, raw: any, key: any, value: any, config: Proxy.Config, custom: any):any
```


