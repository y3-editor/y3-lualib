# Doctor

## catch

```lua
function
```

 遍历虚拟机，寻找对象的引用。
 输入既可以是对象实体，也可以是对象的描述（从其他接口的返回值中复制过来）。
 返回字符串数组的数组，每个字符串描述了如何从根节点引用到指定的对象。
 可以同时查找多个对象。
## compare

```lua
function
```

 比较2个报告
## enableCache

```lua
function
```

 是否启用缓存，启用后会始终使用第一次查找的结果，
 适用于连续查找引用。如果想要查找新的引用需要先关闭缓存。
## exclude

```lua
function
```

 在进行快照相关操作时排除掉的对象。
 你可以用这个功能排除掉一些数据表。
## flushCache

```lua
function
```

 立即清除缓存
## ignoreMainThread

```lua
function
```

 是否忽略主线程的栈
## report

```lua
function
```

 生成一个内存快照的报告。
 你应当将其输出到一个文件里再查看。
## snapshot

```lua
function
```

 获取内存快照，生成一个内部数据结构。
 一般不用这个API，改用 report 或 catch。

# Doctor.Report


```lua
{ point: string, count: integer, name: string, childs: integer }
```


