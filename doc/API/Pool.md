# Pool

## add

```lua
(method) Pool:add(obj: any, w?: integer)
```

 添加对象
## add_weight

```lua
(method) Pool:add_weight(obj: any, w: integer)
```

 增加对象的权重
## clear

```lua
(method) Pool:clear()
```

 清空池
## del

```lua
(method) Pool:del(obj: any)
```

 移除对象，请勿在遍历的过程中移除对象
## dump

```lua
(method) Pool:dump()
  -> string
```

 显示池的内容，仅用于调试
## get_weight

```lua
(method) Pool:get_weight(obj: any)
  -> integer
```

 获取对象的权重
## has

```lua
(method) Pool:has(obj: any)
  -> boolean
```

 是否包含对象
## order

```lua
table
```

## pairs

```lua
(method) Pool:pairs()
  -> fun():any, integer
```

 遍历池的对象
## pool

```lua
table<any, integer>
```

## random

```lua
(method) Pool:random(filter?: fun(obj: any):boolean)
  -> any
```

 随机抽取一个对象
## random_n

```lua
(method) Pool:random_n(num: integer, filter?: fun(obj: any):boolean)
  -> any[]
```

 抽取多个随机对象，不重复
## set_weight

```lua
(method) Pool:set_weight(obj: any, w: integer)
```

 修改对象的权重

