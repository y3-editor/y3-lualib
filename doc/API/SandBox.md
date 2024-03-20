# SandBox

## env

```lua
table
```

## init

```lua
(method) SandBox:init(sandbox_name: string, prefix_name?: string)
```

## make_preload

```lua
(method) SandBox:make_preload()
  -> function
```

## make_require

```lua
(method) SandBox:make_require(searchers: any, loaded: any)
  -> function
```

## make_searcher

```lua
(method) SandBox:make_searcher()
  -> function
```

## name

```lua
string
```

## prefix_name

```lua
string?
```

## require

```lua
(method) SandBox:require(name: any)
  -> unknown
```


