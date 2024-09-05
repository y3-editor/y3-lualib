# SortedDictionary

## SortedPairs

```lua
(method) SortedDictionary:SortedPairs()
  -> fun():any, any
```

 获取有序迭代器
## add

```lua
(method) SortedDictionary:add(key: any, value: any)
```

 添加或更新键值对
## containsKey

```lua
(method) SortedDictionary:containsKey(key: any)
  -> boolean
```

 检查是否包含键
## dictionary

```lua
table<any, any>
```

## get

```lua
(method) SortedDictionary:get(key: any)
  -> any
```

 获取值
## getSortedKeys

```lua
(method) SortedDictionary:getSortedKeys()
  -> table
```

 获取排序后的键列表
## remove

```lua
(method) SortedDictionary:remove(key: any)
```

 移除键值对

# SortedDictionary.Clock

## SortedPairs

```lua
(method) SortedDictionary:SortedPairs()
  -> fun():any, any
```

 获取有序迭代器
## add

```lua
fun(self: SortedDictionary.Clock, key: number, value: NPBehave.Clock.Timer)
```

## containsKey

```lua
(method) SortedDictionary:containsKey(key: any)
  -> boolean
```

 检查是否包含键
## dictionary

```lua
table<any, any>
```

## get

```lua
fun(self: SortedDictionary.Clock, key: number):NPBehave.Clock.Timer
```

## getSortedKeys

```lua
(method) SortedDictionary:getSortedKeys()
  -> table
```

 获取排序后的键列表
## remove

```lua
(method) SortedDictionary:remove(key: any)
```

 移除键值对

