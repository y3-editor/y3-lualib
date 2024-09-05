# Reload

热重载

热重载相关的方法，详细请看 `演示/热重载`。

## afterReloadCallbacks

```lua
{ name: string, callback: Reload.afterReloadCallback }[]
```

## beforeReloadCallbacks

```lua
{ name: string, callback: Reload.beforeReloadCallback }[]
```

## defaultReloadOptional

```lua
nil
```

## filter

```lua
(fun(name: string, reload: Reload):boolean)?
```

## fire

```lua
(method) Reload:fire()
```

## getCurrentIncludeName

```lua
function Reload.getCurrentIncludeName()
  -> string?
```

## getIncludeName

```lua
function Reload.getIncludeName(func: function)
  -> string?
```

## include

```lua
function Reload.include(modname: string)
  -> any
  2. loaderdata: unknown
```

 类似于 `require` ，但是会在重载时重新加载文件。
 加载文件时遇到错误会返回false而不是抛出异常。
## includeStack

```lua
table
```

## includedNameMap

```lua
{ [string]: boolean }
```

## includedNames

```lua
string[]
```

## isReloading

```lua
function Reload.isReloading()
  -> boolean
```

是否正在重载
## isValidName

```lua
(method) Reload:isValidName(name?: string)
  -> boolean
```

 模块名是否会被重载
## modNameMap

```lua
table
```

## onAfterReload

```lua
function Reload.onAfterReload(callback: Reload.afterReloadCallback)
```

 注册在重载之后的回调
## onBeforeReload

```lua
function Reload.onBeforeReload(callback: Reload.beforeReloadCallback)
```

 注册在重载之前的回调
## optional

```lua
(Reload.Optional)?
```

## recycle

```lua
function Reload.recycle(callback: fun(trash: fun(obj: <R2>):<R2>):<R1>?)
  -> <R1>
```

立即执行回调函数，之后每当发生重载时，
会再次执行这个回调函数。
## reload

```lua
function Reload.reload(optional?: Reload.Optional)
```

 进行重载
## setDefaultOptional

```lua
function Reload.setDefaultOptional(optional?: Reload.Optional)
```

 设置默认的重载选项
## validMap

```lua
table<string, any>
```


# Reload.Optional

## filter

```lua
fun(name: string, reload: Reload):boolean
```

过滤函数
## list

```lua
string[]
```

要重载的模块列表

# Reload.afterReloadCallback


```lua
fun(reload: Reload, hasReloaded: boolean)
```


# Reload.beforeReloadCallback


```lua
fun(reload: Reload, willReload: boolean)
```


