# ECAHelper

## call

```lua
function ECAHelper.call(...any)
```

调用ECA中定义的自定义事件
## def

```lua
function ECAHelper.def(name: string)
  -> ECAFunction
```

注册ECA函数

可以使用该功能让lua函数在ECA中被调用。
## register_custom_event_impl

```lua
function ECAHelper.register_custom_event_impl(name: string, impl: function)
```


