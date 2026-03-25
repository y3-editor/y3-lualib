# Event API 规范

事件系统相关 API 的使用规范。

## ⚠️ 重要：事件参数查询规范

**在使用任何事件的 `data` 参数前，必须先查阅源码确认正确的参数名！**

### 查询流程（强制）

1. **查找事件配置** → `maps/EntryMap/script/y3/meta/event.lua`
   - 使用 `grep_search` 搜索事件中文名（如 `"单位-死亡"`）
   - 查看该事件的 `event_params` 字段
   - 每个参数包含 `lua_name`（Lua 参数名）和 `lua_type`（类型）
   - 使用 `lua_name` 字段作为 Lua 代码中的参数名

### 常见错误示例

| ❌ 错误写法 | ✅ 正确写法 | 原因 |
|------------|------------|------|
| `data.killer` | `data.source_unit` | 事件定义中不存在 `killer` |
| `data.target` | `data.target_unit` | 必须使用完整参数名 |
| `data.source` | `data.source_unit` | 必须使用完整参数名 |

---

## 事件系统概述

Y3 框架使用事件驱动架构。所有游戏对象都支持 `:event()` 方法注册事件回调。

---

## 游戏事件

### 游戏初始化

```lua
y3.game:event('游戏-初始化', function(trg, data)
    -- 游戏启动时执行一次
    log.info("游戏初始化")
end)
```

### 游戏开始

```lua
y3.game:event('游戏-开始', function(trg, data)
    -- 游戏正式开始
end)
```

### 游戏结束

```lua
y3.game:event('游戏-结束', function(trg, data)
    -- 游戏结束时
end)
```

---

## 键盘事件

### 按键按下

```lua
-- 监听特定按键
y3.game:event('键盘-按下', 'T', function(trg, data)
    local player = data.player
    log.info(player:get_name() .. " 按下了T键")
end)

-- 常用按键: 'A'-'Z', '0'-'9', 'F1'-'F12', 'SPACE', 'ESCAPE', 'TAB'
```

### 按键释放

```lua
y3.game:event('键盘-释放', 'T', function(trg, data)
    local player = data.player
end)
```

---

## 鼠标事件

### 鼠标点击

```lua
y3.game:event('鼠标-按下', function(trg, data)
    local player = data.player
    local button = data.button  -- 1:左键 2:右键 3:中键
    local point = data.point    -- 点击位置
end)
```

---

## 单位事件

### 单位死亡

**完整参数列表**（来源：`y3/meta/event.lua` → `ET_UNIT_DIE` → `event_params`）：

| 参数名 | 类型 | 描述 |
|--------|------|------|
| `unit` | Unit | 死亡的单位 |
| `source_unit` | Unit | 施加致命伤害的单位 |
| `target_unit` | Unit | 承受伤害的单位（同 unit） |
| `damage` | number | 致命伤害值 |
| `damage_type` | integer | 伤害类型 |
| `ability` | Ability | 造成死亡的技能（可能为 nil） |

```lua
unit:event('单位-死亡', function(trg, data)
    local source = data.source_unit  -- ✅ 正确：施加伤害的单位
    -- local killer = data.killer    -- ❌ 错误：不存在此参数！
    log.info("单位被 " .. tostring(source) .. " 击杀")
end)
```

### 受到伤害

**注意**：Y3 引擎中伤害事件分为三个阶段：`前`、`时`、`后`

```lua
-- 受到伤害后（最常用）
unit:event('单位-受到伤害后', function(trg, data)
    local damage = data.damage
    local source = data.source_unit  -- ✅ 使用完整参数名
end)

-- 受到伤害前（可修改伤害值）
unit:event('单位-受到伤害前', function(trg, data)
    local damage = data.damage
end)

-- 受到伤害时
unit:event('单位-受到伤害时', function(trg, data)
    local damage = data.damage
end)
```

### 造成伤害

```lua
-- 造成伤害后（最常用）
unit:event('单位-造成伤害后', function(trg, data)
    local damage = data.damage
    local target = data.target_unit  -- ✅ 使用完整参数名
end)

-- 造成伤害前
unit:event('单位-造成伤害前', function(trg, data)
    local damage = data.damage
end)
```

### 进入区域

```lua
unit:event('单位-进入区域', function(trg, data)
    local area = data.area
end)
```

### 离开区域

```lua
unit:event('单位-离开区域', function(trg, data)
    local area = data.area
end)
```

---

## 技能事件

### 单位施放技能

**注意**：Y3 中技能施放事件挂在单位上，不是技能对象上

```lua
-- 监听单位施放技能（最常用）
unit:event('单位-施放技能', function(trg, data)
    local caster = data.unit              -- 施法者
    local ability = data.ability          -- 施放的技能对象
    local target = data.ability_target_unit  -- 技能目标单位（可能为 nil）
end)
```

### 技能获得/失去

```lua
-- 技能获得
ability:event('技能-获得', function(trg, data)
    log.info("获得技能")
end)

-- 技能失去
ability:event('技能-失去', function(trg, data)
    log.info("失去技能")
end)
```

### 技能冷却结束

```lua
ability:event('技能-冷却结束', function(trg, data)
    log.info("技能冷却结束")
end)
```

### 技能升级

```lua
ability:event('技能-升级', function(trg, data)
    log.info("技能升级")
end)
```

---

## UI 事件

### 按钮点击

```lua
y3.game:event('UI-按钮-左键-点击', function(trigger, data)
    local player = data.player
    local ui_comp = data.ui_comp
    
    -- 判断是哪个按钮
    if ui_comp == my_button then
        -- 处理点击
    end
end)
```

### 输入框事件

```lua
y3.game:event('UI-输入框-内容改变', function(trigger, data)
    local player = data.player
    local content = data.content
end)

y3.game:event('UI-输入框-提交', function(trigger, data)
    local player = data.player
    local content = data.content
end)
```

### 鼠标移入/移出

```lua
y3.game:event('UI-控件-鼠标-移入', function(trigger, data)
    local ui_comp = data.ui_comp
end)

y3.game:event('UI-控件-鼠标-移出', function(trigger, data)
    local ui_comp = data.ui_comp
end)
```

---

## Buff 事件

```lua
-- Buff 获得（添加）
buff:event('效果-获得', function(trg, data)
    -- Buff 添加时
end)

-- Buff 失去（移除）
buff:event('效果-失去', function(trg, data)
    -- Buff 移除时
end)

-- Buff 层数变化
buff:event('效果-层数变化', function(trg, data)
    local change = data.layer_change_values  -- 层数变化值
    local owner = data.owner_unit            -- 效果携带者
end)
```

---

## 物品事件

```lua
-- 物品获得（被拾取）
item:event('物品-获得', function(trg, data)
    local picker = data.unit
end)

-- 物品使用
item:event('物品-使用', function(trg, data)
    -- 物品被使用
end)

-- 物品失去
item:event('物品-失去', function(trg, data)
    -- 物品失去
end)

-- 物品进入物品栏
item:event('物品-进入物品栏', function(trg, data)
    -- 物品进入物品栏
end)
```

---

## 全局单位事件

监听所有单位的事件：

```lua
y3.game:event('单位-死亡', function(trg, data)
    local unit = data.unit              -- 死亡的单位
    local source = data.source_unit     -- ✅ 施加伤害的单位
    -- local killer = data.killer       -- ❌ 错误：不存在此参数！
    
    log.info("有单位死亡，击杀者: " .. tostring(source))
end)
```

---

## 移除事件监听

```lua
-- 保存事件句柄
local event_handle = unit:event('单位-死亡', function(trg, data)
    -- ...
end)

-- 移除监听
event_handle:remove()
```

---

## 完整示例：游戏初始化流程

```lua
-- 游戏初始化
y3.game:event('游戏-初始化', function(trg, data)
    log.info("===== 游戏初始化 =====")
    
    -- 为所有玩家创建英雄
    local allPlayers = y3.player_group.get_all_players():pick()
    for _, player in pairs(allPlayers) do
        local spawn_point = y3.point.create(0, 0, 0)
        local hero = y3.unit.create_unit(player, 134217857, spawn_point, 0)
        
        if hero then
            player:select_unit(hero)
            
            -- 监听英雄死亡
            hero:event('单位-死亡', function(trg, data)
                log.info(player:get_name() .. " 的英雄死亡")
            end)
        end
    end
end)

-- 监听T键打开界面
y3.game:event('键盘-按下', 'T', function(trg, data)
    local player = data.player
    log.info(player:get_name() .. " 按下了T键")
    -- 打开界面逻辑
end)
```
