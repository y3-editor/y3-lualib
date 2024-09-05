# Network

## callback

```lua
(method) Network:callback(key: 'connected'|'data'|'disconnected'|'error', ...any)
```

```lua
key:
    | 'connected'
    | 'data'
    | 'disconnected'
    | 'error'
```
## data_reader

```lua
(method) Network:data_reader(callback: fun(read: fun(len: integer|'L'|'l'|nil):string))
```

创建一个“阻塞”式的数据读取器，会循环执行 `callback`
> 与 `on_data` 互斥

回调里会给你一个读取函数 `read`，下面是它的说明：

按照传入的规则读取数据，如果数据不满足规则，
那么读取器会休眠直到收到满足规则的数据再返回
* 如果不传入任何参数：
  读取所有已收到的数据，类似于 `on_data`
* 如果传入整数：
  读取指定字节数的数据。
* 如果传入 `'l'`：
  读取一行数据，不包括换行符。
* 如果传入 `'L'`：
  读取一行数据，包括换行符。
## handle

```lua
KKNetwork
```

## ip

```lua
string
```

## is_connecting

```lua
(method) Network:is_connecting()
  -> boolean
```

是否已连接
## make_error

```lua
(method) Network:make_error(err: any)
```

## on_connected

```lua
(method) Network:on_connected(on_connected: Network.OnConnected)
```

连接成功后的回调
## on_data

```lua
(method) Network:on_data(on_data: Network.OnData)
```

收到数据后的回调
## on_disconnected

```lua
(method) Network:on_disconnected(on_disconnected: Network.OnDisconnected)
```

断开连接后的回调
## on_error

```lua
(method) Network:on_error(on_error: Network.OnError)
```

发生错误后的回调
## options

```lua
Network.Options
```

## port

```lua
integer
```

## remove

```lua
(method) Network:remove()
```

## retry_timer

```lua
unknown
```

## send

```lua
(method) Network:send(data: string)
```

## state

```lua
string
```

## update

```lua
(method) Network:update()
```

## update_timer

```lua
unknown
```


# Network.OnConnected


```lua
fun(self: Network)
```


# Network.OnData


```lua
fun(self: Network, data: string)
```


# Network.OnDisconnected


```lua
fun(self: Network)
```


# Network.OnError


```lua
fun(self: Network, error: string)
```


# Network.Options

## buffer_size

```lua
integer
```

网络缓冲区大小（字节），默认为 2MB
## retry_interval

```lua
number
```

重连间隔（秒），默认为 5
## timeout

```lua
number
```

连接超时时间（秒），默认为30秒
## update_interval

```lua
number
```

网络更新间隔（秒），默认为 0.2

