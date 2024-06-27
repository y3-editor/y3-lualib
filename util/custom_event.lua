---@class CustomEvent
---@field private custom_event_manager? EventManager
---@overload fun(): self
local M = Class 'CustomEvent'

--[[
注册自定义事件，当触发时，会执行回调函数。

```lua
Obj:event_on('输入', function (trigger, ...)
    print('触发了输入事件', ...)
end)

Obj:event_notify('输入', '123', '456')
```

以上会打印：

```
触发了输入事件 123 456
```

---

注册时可以指定事件的参数：

```lua
Obj:event_on('输入', {'123'}, function (trigger, ...)
    print('触发了输入事件', ...)
end)

Obj:event_notify('输入', 1) -- 不能触发事件
Obj:event_notify_with_args('输入', {'123'}, 2) -- 可以触发事件
Obj:event_notify_with_args('输入', {'456'}, 3) -- 不能触发事件
Obj:event_notify_with_args('输入', {'123', '666'}, 4) -- 可以触发事件
```
]]
---@overload fun(self: self, event_name:string, callback:Trigger.CallBack):Trigger
---@overload fun(self: self, event_name:string, args:any[] | any, callback:Trigger.CallBack):Trigger
function M:event_on(...)
    if not rawget(self, 'custom_event_manager') then
        self.custom_event_manager = New 'EventManager' (self)
    end
    local event_name, args, callback = ...
    if not callback then
        callback = args
        args = nil
    end
    assert(event_name, '缺少事件名')
    assert(type(callback) == 'function', '缺少回调函数')
    local trigger = self.custom_event_manager:event(event_name, args, callback)
    return trigger
end

--[[
发起自定义事件（通知模式），同一个对象身上只会有一个正在执行的事件，
当发生插入结算时，后面的事件会进入队列

```lua
Obj:event_on('获得', function ()
    print('触发获得')
    print('发起移除前')
    Obj:event_notify('移除') -- 实际业务中，可能你获得的buff把你自己杀死了，而死亡会清除buff
    print('发起移除后')
end)

Obj:event_on('移除', function ()
    print('触发移除')
end)

Obj:event_notify('获得')
```

这段代码会打印：

```
触发获得
发起移除前
发起移除后
触发移除
```
]]
---@param event_name string
---@param ... any
function M:event_notify(event_name, ...)
    if not self.custom_event_manager then
        return
    end
    self.custom_event_manager:notify(event_name, nil, ...)
end

-- 发起带事件参数的自定义事件（通知模式）
---@param event_name string
---@param args any[]
---@param ... any
function M:event_notify_with_args(event_name, args, ...)
    if not self.custom_event_manager then
        return
    end
    self.custom_event_manager:notify(event_name, args, ...)
end

--[[
发起自定义事件（回执模式），与通知模式不同，允许插入结算。
可以接受到事件的返回值，有多处注册事件时会按照注册顺序调用，
当任何事件回调返回了非 `nil` 的值后，后续触发器将不再调用。

```lua
Obj:event_on('获取', function (trigger,...)
    print('获取1')
    return 1
end)
Obj:event_on('获取', function (trigger,...)
    print('获取2')
    return 2
end)

local result = Obj:event_dispatch('获取')

print('结果为：', result)
```

以上代码会打印：

```
获取1
结果为：    1
```
]]
---@param event_name string
---@param ... any
---@return any, any, any, any
function M:event_dispatch(event_name, ...)
    if not self.custom_event_manager then
        return
    end
    return self.custom_event_manager:dispatch(event_name, nil, ...)
end

-- 发起带事件参数的自定义事件（回执模式）
---@param event_name string
---@param args any[] | any
---@param ... any
---@return any, any, any, any
function M:event_dispatch_with_args(event_name, args, ...)
    if not self.custom_event_manager then
        return
    end
    return self.custom_event_manager:dispatch(event_name, args, ...)
end

---@return EventManager?
function M:get_custom_event_manager()
    return self.custom_event_manager
end

return M
