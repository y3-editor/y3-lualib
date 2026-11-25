# Y3 官方 UI API - 本地UI逻辑

> 本地UI逻辑框架用于处理**仅客户端执行**的UI逻辑，回调在本地玩家环境执行（不同步）。
> 适用场景：纯客户端UI交互、不需要同步的视觉效果。
> 来源: `y3/util/local_ui.lua`

**注意**: 与 `PanelBase` 不同，这是更底层的本地UI框架，使用 `y3.ctimer`（客户端定时器）进行刷新调度。

---

## 创建与附着

```lua
-- 创建本地UI逻辑
local logic = y3.local_ui.create(path_or_ui)        -- path_or_ui: string|UI

-- 创建用于元件的本地UI逻辑
local prefab_logic = y3.local_ui.prefab(prefab_name)

-- 附着到UI上
logic:attach(ui, kv)    -- kv: 数据表，通过 storage_get 获取

-- 解除附着 / 删除
logic:detach()
logic:remove()
```

---

## 事件订阅

```lua
-- 订阅控件刷新（回调在本地玩家环境执行）
logic:on_refresh(child_name, function(ui, local_player, instance)
    -- child_name: 空字符串 = 主控件
end)

-- 订阅控件初始化
logic:on_init(child_name, function(ui, local_player, instance)
end)

-- 订阅控件本地事件
logic:on_event(child_name, event, function(ui, local_player, instance)
    -- event: y3.Const.UIEvent
end)
```

---

## 刷新与数据

```lua
-- 刷新控件
logic:refresh(name, player)     -- name: 控件名，'*' = 刷新所有；player: 可选，只刷新此玩家

-- 存储/获取数据
logic:storage_set(key, value)
local value = logic:storage_get(key)
```

---

## 元件绑定

```lua
-- 绑定元件
logic:bind_prefab(child_name, prefab_logic, prefab_token)
-- child_name: 父控件路径
-- prefab_logic: 用 y3.local_ui.prefab 创建
-- prefab_token: 区分同一元件的不同实例

-- 刷新元件
logic:refresh_prefab(prefab_token, count, on_create, on_refresh)
-- count: 修改元件数量
-- on_create: function(index, kv)
-- on_refresh: function(ui, local_player, instance)
```

---

## 属性绑定

```lua
-- 绑定子控件属性到单位属性
logic:bind_unit_attr(child_name, ui_attr, unit_attr, accuracy)
```
