---
name: y3-lua-pipeline
description: >
  用于编写 Y3 游戏非 UI 相关的 Lua 代码，包括游戏逻辑、系统开发、事件处理、技能效果实现。
  
  ALWAYS use this skill when user mentions: 写Lua代码、游戏逻辑、事件处理、技能效果、
  Buff效果、伤害计算、死亡判定、单位创建、刷怪逻辑、AI行为、定时器、触发器、
  数据存储、存档读档、计分系统、关卡逻辑、胜负判定、玩家初始化。
  
  This skill handles game logic code. For UI-related Lua code, use y3-ui-official instead.
---

# Y3 Lua Pipeline

## 🔴 技能激活时自动读取（首要步骤）

**本技能激活后，编写任何代码之前，必须先读取以下文件：**

```
1. .codemaker/rules/api-safety.mdc     ← API 安全规则 + 常见错误表
2. .codemaker/memory/lua-issues/       ← Lua 错题本（如存在）
```

> 这些文件包含 API 臆造预防规则和历史错误记录，可有效避免重复犯错。

用于编写 Y3 游戏非 UI 相关的 Lua 代码，包括游戏逻辑、系统开发、事件处理。

## 🔧 Lua 运行时环境

**Lua 虚拟机版本为 5.4**，有以下定制：

| 特性 | 说明 |
|------|------|
| 定点数 | 实数使用定点数（非浮点数）以保证跨平台一致性 |
| `math.random` | 使用引擎提供的实现以保证玩家间同步 |
| `os.clock` | 返回逻辑游戏时间 |
| 生产限制 | 许多 `debug`、`io` 和 `os` 函数在平台模式中被禁用 |

## ⚠️ 核心注意事项

### 🚨 必须使用 Y3 框架官方 API

**所有代码必须基于 y3-lualib 框架，禁止使用不存在的 API！**

在编写任何代码前，必须：
1. **查阅 references 目录** 确认 API 存在且用法正确
2. **使用框架提供的全局对象** 如 `y3.player`、`y3.unit`、`y3.game` 等
3. **遵循 API 规范** 不臆造不存在的方法

### 🔴🔴🔴 强制规则：脚本目录检测（最高优先级）

> ⛔ **严重警告**：此规则为最高优先级！编写任何 Lua 代码之前必须先执行目录检测！
> 
> 错误的目录会导致脚本无法加载，浪费开发时间！

**强制执行清单（每次新会话必须执行）：**

```
┌─────────────────────────────────────────────────────────────────────────┐
│ ⚠️ 脚本目录检测清单（按顺序执行）                                        │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ □ 步骤1: 执行 list_files_top_level("maps/EntryMap/script")             │
│          检查返回结果是否包含 "y3" 或 "y3\"                             │
│                                                                         │
│ □ 步骤2: 如果步骤1找到 y3 目录                                          │
│          ✅ 脚本路径 = maps/EntryMap/script/                            │
│          ✅ 入口文件 = 可重载的代码.lua                                  │
│          ✅ require 路径 = require 'module_name'（无前缀）              │
│          → 跳过步骤3                                                    │
│                                                                         │
│ □ 步骤3: 如果步骤1未找到 y3，执行 list_files_top_level("global_script") │
│          检查返回结果是否包含 "y3" 或 "y3\"                             │
│          ✅ 脚本路径 = global_script/map/                               │
│          ✅ 入口文件 = global_main.lua                                  │
│          ✅ require 路径 = require 'map.module_name'                    │
│                                                                         │
│ □ 步骤4: 记录检测结果，后续编码时严格遵循                               │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**两种目录结构对比：**

| 检测条件 | 脚本存放路径 | 入口文件 | require 方式 |
|----------|--------------|----------|--------------|
| `maps/EntryMap/script/y3/` 存在 | `maps/EntryMap/script/` | `可重载的代码.lua` | `include 'module'` |
| `global_script/y3/` 存在 | `global_script/map/` | `global_main.lua` | `require 'map.module'` |

### 🚨🚨🚨 脚本路径警告（最高优先级）

**禁止在项目根目录下创建 `script/` 文件夹！**

| ✅ 正确路径 | ❌ 错误路径 |
|-------------|-------------|
| `maps/EntryMap/script/xxx.lua` | `script/xxx.lua`（根目录） |
| `maps/EntryMap/script/game/` | `./script/game/` |
| `global_script/map/xxx.lua` | `script/` |

> **根目录下的 `script/` 不是有效的脚本目录，游戏无法加载！**

**❌ 常见错误：**

| 错误做法 | 后果 | 正确做法 |
|----------|------|----------|
| 不检测直接写到 `global_script/map/` | y3 在 EntryMap 时脚本不加载 | 先检测 y3 位置 |
| 假设 y3 在某个位置 | 路径错误导致 require 失败 | 每次会话都执行检测 |
| 混用两种 require 路径 | 模块加载失败 | 统一使用检测结果的路径格式 |

### 🔴 强制规则：查阅 y3 源码实现

**在编写任何 y3 API 调用之前，必须执行以下步骤：**

1. **查阅源码目录**：`global_script/y3/` 或 `script/y3/` 中的源文件
2. **确认函数存在**：使用 `grep_search` 搜索函数名，验证其存在于 y3 库中
3. **核对参数签名**：查看源码中的函数定义，确保参数数量和类型正确
4. **禁止臆造 API**：如果搜索不到函数，**绝对不能自行编造**

```
⚠️ 违规示例：
- 直接写 `player:camera_follow_unit(unit)` 而不验证该方法是否存在
- 使用 `y3.player.get_enemy_player()` 而实际方法是 `get_enemy_player_group_by_player`
```

**执行流程**：
```
编写代码前
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 1. 搜索 y3 源码：grep_search 函数名                         │
│ 2. 找到定义后，阅读参数和返回值                             │
│ 3. 如果找不到，查阅 references/ 或 common_errors.md        │
│ 4. 仍找不到则询问用户或明确标注"待验证"                    │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
确认 API 存在后才能写入代码
```

## 📁 资源目录

本技能包含以下 API 参考资源：

| 资源文件 | 用途 |
|----------|------|
| `references/player.md` | 玩家相关 API（遍历、获取、设置等） |
| `references/unit.md` | 单位相关 API（创建、属性、移动等） |
| `references/ability.md` | 技能相关 API |
| `references/item.md` | 物品相关 API |
| `references/buff.md` | Buff 相关 API |
| `references/event.md` | 事件系统 API |
| `references/timer.md` | 计时器 API |
| `references/point.md` | 点和区域 API |
| `references/particle.md` | 粒子/特效 API（创建、缩放、高度等） |

> 💡 **场景UI相关 API** 见 `skills/y3-ui-official/references/y3-scene-ui.md` 和 `knowledge/14-场景UI.md`

### 问题归档（错误记录）

`references/` 目录还包含 **API 错误归档文件**，记录常见的 API 误用和正确做法：

| 文件 | 用途 |
|------|------|
| `references/common_errors.md` | 常见 API 错误汇总 |

---

## 触发关键词

当用户请求包含以下关键词时使用本技能：

- 游戏逻辑、系统开发、功能实现
- 单位创建、技能系统、物品系统
- 事件监听、键盘监听、游戏事件
- 计时器、定时任务、循环执行
- 玩家遍历、玩家数据、主控单位
- AI 行为、寻路、移动控制
- Buff 系统、属性修改、伤害计算
- 存档读取、配置加载、数据管理

---

## 代码编写流程

```
用户需求
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 步骤1: 分析需求                                             │
│ - 确定需要使用的 API 类型（player/unit/ability 等）         │
│ - 确定需要监听的事件类型                                    │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 步骤2: 查阅 API 规范                                        │
│ - 打开 references/ 目录对应的 API 文档                      │
│ - 确认 API 存在且用法正确                                   │
│ - 查看 common_errors.md 避免已知错误                        │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 步骤3: 编写代码                                             │
│ - 使用正确的 API 编写功能代码                               │
│ - 添加必要的错误处理和日志                                  │
│ - 遵循 Y3 Lua 编码规范                                      │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 步骤4: 整合到项目                                           │
│ - 将代码保存到 script/ 目录                                 │
│ - 在可重载的代码.lua 中添加 include                         │
└─────────────────────────────────────────────────────────────┘
```

---

## 快速参考

### 玩家遍历 ⚠️ 重要

```lua
-- ✅ 正确做法
local allPlayers = y3.player_group.get_all_players():pick()
for _, player in pairs(allPlayers) do
    -- 处理每个玩家
end

-- ❌ 错误做法（API不存在）
y3.player.with_all_players(function(player)  -- 错误！
    -- ...
end)
```

### 单位创建

#### 🔴 强制规则：物编 ID 必须已存在

**使用 `create_unit` 之前，必须确保 ID 对应的物编已通过 `y3-obj-gen` 生成！**

```
┌─────────────────────────────────────────────────────────────┐
│ create_unit 前置检查清单                                     │
├─────────────────────────────────────────────────────────────┤
│ □ 1. unit_key（单位 ID）是否在物编 Excel 中定义？            │
│      检查 skills/y3-obj-gen/excels/object.xlsx              │
│                                                             │
│ □ 2. 物编 JSON 是否已生成到 editor_table/editorunit/ ？      │
│      检查 editor_table/editorunit/{unit_key}.json 是否存在  │
│                                                             │
│ □ 3. 如果物编不存在，必须先执行 y3-obj-gen 生成！             │
│      切勿使用未生成的 ID 调用 create_unit                    │
└─────────────────────────────────────────────────────────────┘
```

#### 常见错误

| ❌ 错误做法 | 后果 | ✅ 正确做法 |
|-------------|------|-------------|
| 在 Lua 配置中定义 ID，但没在物编中创建 | `ea_prefab_not_exist` 错误 | 先用 y3-obj-gen 生成物编 |
| 假设 ID 存在而不验证 | 运行时单位无法创建 | 检查 editor_table 目录 |
| 复制粘贴其他项目的 ID | ID 冲突或不存在 | 使用本项目生成的 ID |

#### 验证流程

```
编写 create_unit 代码前
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 1. 确认需要创建的单位类型（玩家主角？敌人？NPC？）           │
│ 2. 检查 editor_table/editorunit/ 目录                       │
│ 3. 如果 {unit_key}.json 不存在 → 激活 y3-obj-gen 生成       │
│ 4. 物编生成完成后，再编写 create_unit 代码                  │
└─────────────────────────────────────────────────────────────┘
```

#### API 用法

```lua
-- 创建单位
local unit = y3.unit.create_unit(player, unit_key, point, direction)

-- 通过ID获取单位
local unit = y3.unit.get_by_id(id)
```

### 主控单位 ⚠️ 重要

```lua
-- 选中单位作为主控
player:select_unit(hero)
```


### 事件监听

#### 🔴 强制规则：查阅 event.lua

**事件名称和参数必须参考 `event.lua` 文件！**

- **文件位置**：`maps/EntryMap/script/y3/meta/event.lua`
- **查阅方法**：使用 `grep_search` 搜索事件关键字，查看 `event_params` 字段获取正确参数名

```
⚠️ 常见事件名错误：

❌ 错误：'玩家-进入游戏'  → ✅ 正确：'玩家-加入游戏'
❌ 错误：'单位-被杀死'    → ✅ 正确：'单位-死亡'
❌ 错误：'游戏-开始'      → ✅ 正确：'游戏-初始化'
```

#### 常用事件参考

| 事件名 | 事件 Key | 说明 |
|--------|----------|------|
| `'游戏-初始化'` | ET_GAME_INIT | 游戏初始化时触发 |
| `'玩家-加入游戏'` | ET_ROLE_JOIN_BATTLE | 玩家加入游戏时触发 |
| `'玩家-离开游戏'` | ET_ROLE_ACTIVE_EXIT_GAME_EVENT | 玩家主动离开时触发 |
| `'玩家-发送消息'` | ET_CHAT_SEND_GM | 玩家发送聊天消息 |
| `'单位-死亡'` | ET_UNIT_DEAD | 单位死亡时触发 |
| `'键盘-按下'` | ET_KEYBOARD_KEY_DOWN_EVENT | 键盘按键按下 |

```lua
-- 游戏初始化
y3.game:event('游戏-初始化', function(trg, data)
    -- 初始化代码
end)

-- ✅ 正确：玩家-加入游戏（不是"进入游戏"）
y3.game:event('玩家-加入游戏', function(trg, data)
    local player = data.player
    -- 处理玩家加入
end)

-- 键盘按下
y3.game:event('键盘-按下', 'T', function(trg, data)
    local player = data.player
    -- 处理按键
end)

-- 单位死亡
unit:event('单位-死亡', function(trg, data)
    -- 处理死亡
end)
```

### 计时器

```lua
-- 延迟执行
y3.ltimer.wait(delay, function(timer, count)
    -- delay 秒后执行
end)

-- 循环执行
y3.ltimer.loop(interval, function(timer, count)
    -- 每隔 interval 秒执行
end)

-- 循环指定次数
y3.ltimer.loop_count(interval, count, function(timer, current)
    -- 执行 count 次
end)
```

### 点与区域

```lua
-- 创建点
local point = y3.point.create(x, y, z)

-- 获取单位位置
local pos = unit:get_point()
```

### 单位命令 ⚠️ 重要

```lua
-- ✅ 正确：让单位攻击目标
unit:attack_target(target, 0)  -- 参数：目标单位, 范围

-- ❌ 错误：方法不存在
unit:attack(target)
```

### 玩家编号 ⚠️ 重要

| 编号 | 用途 |
|------|------|
| 1-12 | 普通玩家位 |
| 31 | 中立敌对 |
| 32 | 中立友好 |

> 📖 详细案例见 `references/common_errors.md` #6

### 摄像机

```lua
y3.camera.set_camera_follow_unit(player, unit, 0, 0, 0)
```

> 📖 详细案例见 `references/common_errors.md` #2

---

## 编码规范

### 文件命名
- 使用小写字母和下划线
- 示例：`rogue_system.lua`、`battle_manager.lua`

### 模块结构
```lua
--[[
    模块说明
    功能描述
]]

---@class ModuleName
local ModuleName = {}

-- 私有函数
local function private_helper()
end

-- 公开方法
function ModuleName.public_method()
end

-- 事件绑定
y3.game:event('事件名', function(trg, data)
end)

return ModuleName
```

### 日志规范
```lua
log.info("信息消息")
log.debug("调试消息")
log.error("错误消息")
print("快速调试")   -- 显示在游戏中，上传前记得删除
```

日志在开发模式下写入 `.log/lua_player01.log`（文件名中的数字为玩家编号）。

### 模块加载
```lua
require 'module'   -- 标准 require，不可热重载
include 'module'   -- 可重载的 require，用于需要支持热重载的游戏逻辑
```

---

## ⚠️ 重要注意事项

- **禁止直接调用 CAPI** - 始终使用 y3 框架封装，因为 CAPI 可能会变更
- **模型资源** - Lua 中使用的模型/特效必须在表格编辑器中声明才能触发下载
- **定点数** - 所有数值在底层使用定点数以保证帧同步一致性
- **事件系统** - 所有游戏对象支持 `:event()` 方法注册事件回调
- **引用管理** - 通过 `get_by_id()` 或 `get_by_handle()` 获取对象实例

---

## 常见错误

详见 `references/common_errors.md`

| 错误类型 | 示例 |
|----------|------|
| API 不存在 | `y3.player.with_all_players` |
| 参数类型错误 | 字符串传入数字参数 |
| 事件名错误 | 使用不存在的事件名 |
| 对象为空 | 未检查返回值是否为 nil |

---

## 🚨 API 映射表（强制查阅）

**编写代码前必须查阅此表，避免使用不存在的 API！**

### 单位相关

| ❌ 错误 API | ✅ 正确 API | 说明 |
|-------------|-------------|------|
| `unit:is_dead()` | `unit:is_alive()` | Y3 没有 is_dead 方法 |
| `unit:attack(target)` | `unit:attack_target(target, 0)` | 参数不同 |
| `unit:cause_damage_to_unit(target, dmg, type)` | `unit:damage({target=target, damage=dmg, type='physics'})` | 使用 table 参数 |
| `get_all_units()` 直接遍历 | `get_all_units():pick()` | 必须调用 :pick() 转为数组 |

### 玩家相关

| ❌ 错误 API | ✅ 正确 API | 说明 |
|-------------|-------------|------|
| `player:camera_follow_unit(unit)` | `y3.camera.set_camera_follow_unit(player, unit, 0, 0, 0)` | 使用 y3.camera |
| `y3.player.with_all_players(fn)` | `y3.player_group.get_all_players():pick()` 然后 for 循环 | 没有 with_all_players |

### UI 相关

| ❌ 错误 API | ✅ 正确 API | 说明 |
|-------------|-------------|------|
| `progress:set_progress(value)` | `progress:set_max_progress_bar_value(max)` + `progress:set_current_progress_bar_value(cur, 0)` | 需要两个方法 |
| `hud:get_child("a/b/c")` | `y3.ui.get_ui(player, "hud.a.b.c")` | 使用点号路径 |

### 数值规范

| 场景 | ❌ 错误值 | ✅ 正确值 | 说明 |
|------|----------|----------|------|
| 技能范围 | `5.0` | `300-500` | Y3 坐标系单位小 |
| 刷怪距离 | `30` | `500` | 需要 3 位数 |
| 刷怪半径 | `5` | `200` | 需要 3 位数 |
| 攻击范围 | `2` | `100-150` | 需要 3 位数 |

### 遍历规范

```lua
-- ✅ 正确的遍历方式
local group = player:get_all_units()  -- 返回单位组对象
local units = group:pick()             -- 转换为数组
for _, unit in pairs(units) do         -- 使用 pairs 遍历
    -- 处理单位
end

-- ❌ 错误的遍历方式
local units = player:get_all_units()
for _, unit in pairs(units) do  -- 无法正确遍历单位组对象！
    -- 这里不会执行
end
```

---

*最后更新: 2026-03-16*
