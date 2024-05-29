# Sync

 将本地数据同步给所有玩家

## onSync

```lua
function Sync.onSync(id: string, callback: fun(data: Serialization.SupportTypes, source: Player))
```

 同步接收数据，回调函数在同步后执行  
 同一个 id 只能注册一个回调函数，后注册的会覆盖前面的
## send

```lua
function Sync.send(id: string, data: Serialization.SupportTypes)
```

 发送本地的信息，使用 `onSync` 来同步接受数据  
 请在本地环境中使用此函数

@*param* `id` — 以 `$` 开头的 id 保留为内部使用
## syncMap

```lua
table
```


