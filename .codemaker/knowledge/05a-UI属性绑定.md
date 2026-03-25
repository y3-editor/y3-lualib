# Y3 UI 属性绑定系统

Y3 引擎提供了多种方式将游戏数据绑定到 UI 控件，实现自动同步更新。

---

## 绑定方式对比

| 方式 | 适用场景 | 数据来源 | 自动刷新 |
|------|----------|----------|----------|
| `bind_player_prop` | 玩家属性（金币、资源） | Player 对象 | ✅ 是 |
| `bind_unit_attr` | 单位属性（生命、等级） | Unit 对象 | ✅ 是 |
| 手动轮询 | 非标准属性（经验、波次） | 自定义数据 | ❌ 需定时器 |

---

## 1. 玩家属性绑定：`bind_player_prop`

### 适用属性
- `gold`：金币
- `wood`：木材
- 其他官方资源

### 代码示例

```lua
local goldText = y3.ui.get_ui(player, "ResourceHUD.gold_TEXT")
if goldText then
    -- 绑定玩家金币到文本控件
    goldText:bind_player_prop('文本', player, 'gold', 0)
end
```

### 参数说明
| 参数 | 说明 |
|------|------|
| `'文本'` | 要绑定的 UI 属性（可以是"文本"、"进度条值"等） |
| `player` | 玩家对象 |
| `'gold'` | 玩家属性名称 |
| `0` | 偏移量（通常为 0） |

---

## 2. 单位属性绑定：`bind_unit_attr`

### 适用属性（UnitAttr 枚举）
- `'当前生命'`
- `'最大生命'`
- `'当前魔法'`
- `'最大魔法'`
- `'等级'`
- `'攻击力'`
- `'护甲'`
- 其他在 `UnitAttr` 枚举中定义的属性

### ⚠️ 不支持的属性
> **问题 10：使用了无效的 UnitAttr**
> 
> `'当前经验'` **不是** 有效的 `UnitAttr` 枚举值！
> 
> 如需获取经验，必须使用 `unit:get_exp()` 方法并手动更新 UI。

### 代码示例

```lua
local hpText = y3.ui.get_ui(player, "HUD.hp_TEXT")
if hpText then
    -- 绑定单位生命值到文本控件
    hpText:bind_unit_attr('文本', hero, y3.const.UnitAttr['当前生命'])
end
```

---

## 3. 手动轮询模式

### 适用场景
- 经验值（`get_exp()`）
- 波次信息
- 自定义数据

### 代码示例

```lua
-- 经验值更新（使用定时器轮询）
y3.ltimer.loop(0.5, function()
    local expText = y3.ui.get_ui(player, "ResourceHUD.exp_TEXT")
    if expText and hero then
        local exp = hero:get_exp()
        expText:set_text('经验: ' .. tostring(exp))
    end
end)

-- 波次信息更新（直接设置文本）
function updateWaveDisplay(waveNum)
    local waveText = y3.ui.get_ui(player, "ResourceHUD.wave_TEXT")
    if waveText then
        waveText:set_text('第 ' .. waveNum .. ' 波')
    end
end
```

---

## ⚠️ 常见错误

### 错误 1：尝试绑定不存在的属性

```lua
-- ❌ 错误：'当前经验' 不是有效的 UnitAttr
expText:bind_unit_attr('文本', hero, y3.const.UnitAttr['当前经验'])

-- ✅ 正确：使用手动获取
local exp = hero:get_exp()
expText:set_text('经验: ' .. exp)
```

### 错误 2：使用 `refresh` 更新非绑定数据

```lua
-- ❌ 错误：refresh 用于刷新已绑定的属性，不能用于更新自定义数据
waveText:on_refresh(function()
    return _G.currentWave  -- 这不会生效
end)

-- ✅ 正确：直接设置文本
waveText:set_text('第 ' .. waveNum .. ' 波')
```

### 错误 3：跨模块状态不同步

```lua
-- ❌ 错误：每次 include 创建独立的 local 变量
local currentWave = 1  -- 模块A修改后，模块B看不到

-- ✅ 正确：使用 _G 全局表共享状态
_G.ResourceHUD_currentWave = waveNum
```

---

## 最佳实践

### 1. 选择正确的绑定方式

```lua
-- 金币：玩家属性绑定
goldText:bind_player_prop('文本', player, 'gold', 0)

-- 生命值：单位属性绑定
hpText:bind_unit_attr('文本', hero, y3.const.UnitAttr['当前生命'])

-- 经验值：手动轮询
y3.ltimer.loop(0.5, function()
    expText:set_text('EXP: ' .. hero:get_exp())
end)

-- 波次：直接设置
waveText:set_text('第 ' .. waveNum .. ' 波')
```

### 2. 初始化防重复

```lua
local isInitialized = false

function ResourceHUD.init()
    if isInitialized then return end
    isInitialized = true
    
    -- 初始化逻辑...
end
```

### 3. 跨模块状态共享

```lua
-- 使用 _G 全局表
_G.ResourceHUD_currentWave = 1

-- 或使用模块化状态管理
local State = require('state')
State.currentWave = 1
```

---

## ⚠️ `bind_unit` API 使用限制

### 问题描述

`bind_unit` 是用于将 UI 控件绑定到单位的 API，但**不能直接对任意 UI 控件使用**！

### 前置条件（必须满足其一）

| 条件 | 说明 |
|------|------|
| 1. Lua 代码预绑定 | 先调用 `set_ui_comp_bind_attr` 绑定属性 |
| 2. UI 编辑器绑定 | 在 UI 编辑器中配置过属性绑定（JSON 中有 `text_bind` 字段） |

### JSON 结构对比

**✅ 已绑定属性的控件（可以使用 `bind_unit`）：**
```json
{
    "name": "label_1",
    "type": 3,
    "text_bind": {
        "__tuple__": true,
        "items": [3, "official_res_1"]  // 已绑定玩家金币属性
    },
    "uid": "xxx"
}
```

**❌ 未绑定属性的控件（不能直接使用 `bind_unit`）：**
```json
{
    "name": "label_1_1",
    "type": 3,
    // 没有 text_bind 字段！
    "uid": "xxx"
}
```

### 正确用法

```lua
-- 方式1：先用 set_ui_comp_bind_attr 绑定，再 bind_unit
local label = y3.ui.get_ui(player, "panel.label")
label:set_ui_comp_bind_attr('文本', '当前生命')  -- 先绑定属性
label:bind_unit(unit)  -- 再绑定单位

-- 方式2：在 UI 编辑器中配置好绑定后，直接 bind_unit
local label = y3.ui.get_ui(player, "panel.label")  -- JSON 中已有 text_bind
label:bind_unit(unit)  -- 直接绑定单位即可
```

### 常见错误

```lua
-- ❌ 错误：对未绑定属性的控件直接调用 bind_unit
local label = y3.ui.get_ui(player, "panel.label")
label:bind_unit(unit)  -- 不会生效！控件没有预先绑定属性

-- ✅ 正确：先绑定属性
local label = y3.ui.get_ui(player, "panel.label")
label:set_ui_comp_bind_attr('文本', '当前生命')
label:bind_unit(unit)
```

---

*来源：Step 2 测试经验，2026-03-19*
*关键发现：'当前经验' 不在 UnitAttr 枚举中，必须使用 get_exp() 手动获取*

*更新：2026-03-21*
*关键发现：`bind_unit` 必须配合 `text_bind` 或 `set_ui_comp_bind_attr` 使用*
