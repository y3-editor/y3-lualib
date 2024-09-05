# PyProxy

## fetch

```lua
function PyProxy.fetch(handle: <T>)
  -> <T>?
```

## kill

```lua
function PyProxy.kill(phandle: any)
```

## unwrap

```lua
function PyProxy.unwrap(handle: <T>)
  -> <T>
```

## wrap

```lua
function PyProxy.wrap(handle: <T>, is_exists?: fun(handle: <T>):boolean)
  -> <T>
```


