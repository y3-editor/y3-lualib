# Ref

## allowWeakRef

```lua
boolean
```

 是否允许弱引用
## className

```lua
<T>
```

 用于管理的对象类名
## get

```lua
(method) Ref:get(key: any, ...any)
  -> any
```

 获取指定key的对象，如果不存在，则使用所有的参数创建并返回
## newMethod

```lua
fun(key: any, ...any):<T:string>
```

 创建新对象的方法
## remove

```lua
(method) Ref:remove(key: any)
```

 移除指定的key
## strongRefMap

```lua
table
```

 强引用
## unrefTimeAtLeast

```lua
integer
```

 至少在这个时间之后才会释放引用
## updateTimer

```lua
unknown
```

## updateWaitingList

```lua
(method) Ref:updateWaitingList()
```

## waitingListOld

```lua
table
```

 待删除列表（老年代）
## waitingListYoung

```lua
table
```

 待删除列表（青年代）
## weakRefMap

```lua
table
```

 弱引用

# Ref.ValidKeyType


```lua
any
```


