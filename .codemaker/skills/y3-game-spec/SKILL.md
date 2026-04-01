---
name: y3-game-spec
description: >
  Y3 游戏开发流程管理，从零开始在 Y3 引擎上制作各类游戏。
  
  ALWAYS use this skill when user mentions: 做一个游戏、开发游戏、游戏规划、
  做个塔防、做个RPG、做个肉鸽、做个MOBA、从零开始做、游戏开发流程。
  
  This is the entry point skill for any game development project. It will route to
  other skills (y3-obj-gen, y3-ui-pipeline, y3-lua-pipeline) as needed.
---

# Y3 游戏开发指南

完整的游戏开发流程管理，从零开始在 Y3 引擎上制作各类游戏。

## 📋 适用范围

| 游戏类型 | 复杂度 |
|----------|--------|
| Roguelike/肉鸽 | ⭐⭐⭐ |
| 塔防 | ⭐⭐ |
| 生存 | ⭐⭐⭐ |
| RPG | ⭐⭐⭐⭐ |
| MOBA | ⭐⭐⭐⭐ |

## 🏗️ 系统架构

```
数据层 - 物编（y3-obj-gen 生成）
├── 单位：玩家角色、敌人、NPC、建筑
├── 技能/物品/Buff

逻辑层 - Lua
├── GameController → 游戏主循环
├── PlayerManager → 玩家控制
├── EntityManager → 实体管理
├── CombatSystem → 战斗逻辑

表现层 - UI（y3-ui-pipeline 统一入口）
├── GameHUD → 常驻界面
└── GamePanels → 功能面板
```

## 📅 开发阶段

### P0：基础系统
1. 物编配置 → `y3-obj-gen`
2. 玩家管理 → Lua
3. 实体/战斗 → Lua

### P1：核心玩法
4. 进度系统 → Lua
5. UI 开发 → `y3-ui-pipeline`（统一入口，内部自动路由）

### P2：完善体验
6. HUD/菜单 → `y3-ui-pipeline`
7. 音效/特效 → Lua

## 🔀 技能路由

| 任务 | 技能 |
|------|------|
| 生成物编 | `y3-obj-gen` |
| 修改物编 | `y3-obj-edit` |
| **所有 UI 开发** | `y3-ui-pipeline` ⭐ |
| 写游戏逻辑 | `y3-lua-pipeline` |

> ⭐ `y3-ui-pipeline` 是 UI 开发统一入口，内部自动路由到：
> - `y3-ui-generator`（生成 JSON + 提取 UI 树）
> - `y3-ui-official`（生成 Lua 代码）

## ⚠️ 关键规则

### 物编生成（强制）
```
❌ 禁止手动写 JSON
❌ 禁止动态生成物编
✅ 必须使用 y3-obj-gen
```

### 主角单位检查
- Roguelike/RPG/MOBA → **必须**创建主角物编
- 塔防/RTS → 通常不需要

### Y3 坐标系
```
Y-（北/上）↑
X-（西）←┼→ X+（东）
Y+（南/下）↓
```
> ⚠️ Y轴反转：W = Y减小，S = Y增大

## 🎮 Y3 内置 RTS 3C 系统

Y3 引擎封装了一套类似魔兽争霸的基础 RTS 操作系统，**无需额外编写代码即可使用**。

### 内置操作（开箱即用）

| 操作 | 快捷键/鼠标 | 说明 |
|------|-------------|------|
| **点选** | 左键单击 | 选中单个单位 |
| **框选** | 左键拖拽 | 选中框内多个单位 |
| **移动** | 右键点地面 | 让选中单位移动到目标点 |
| **攻击移动** | A + 左键 | 单位移动途中遇敌自动攻击 |
| **强制攻击** | A + 左键点目标 | 攻击指定目标（含友军） |
| **停止** | S | 停止当前动作 |
| **保持位置** | H | 原地待命，遇敌自动反击 |

### 内置单位行为

| 行为 | 说明 | 开发者需要做的 |
|------|------|----------------|
| **自动寻路** | 单位自动绑定 NavMesh 寻路 | 在编辑器中配置寻路区域 |
| **自动攻击** | 进入攻击范围自动开火 | 设置单位攻击属性 |
| **仇恨系统** | 自动选择攻击目标 | 使用正确的玩家编号（敌对关系） |
| **碰撞体积** | 单位间自动碰撞避让 | 在物编中设置碰撞半径 |
| **死亡动画** | 单位死亡自动播放动画 | 物编中配置死亡动画 |

### 玩家敌对关系

| 玩家编号 | 关系 | 用途 |
|----------|------|------|
| 1-12 | 可配置 | 普通玩家，默认互为敌对 |
| 31 | 中立敌对 | 攻击所有玩家，用于怪物 |
| 32 | 中立友好 | 不攻击任何人，用于 NPC |

```lua
-- ✅ 创建会自动攻击玩家的怪物
local enemy = y3.player(31):create_unit(monster_id, point, 0)

-- ✅ 创建友好 NPC
local npc = y3.player(32):create_unit(npc_id, point, 0)
```

### 开发建议

| 游戏类型 | 3C 策略 |
|----------|---------|
| **RTS/塔防** | 直接使用内置 3C，专注策略玩法 |
| **MOBA** | 使用内置选中+攻击，自定义技能释放 |
| **RPG/Roguelike** | 可禁用框选，使用主角模式 |
| **动作游戏** | 需自定义控制逻辑，覆盖内置行为 |

### 自定义控制（覆盖内置）

如果需要自定义操作（如 WASD 移动），可以：

```lua
-- 使用自定义表存储玩家英雄
local player_heroes = {}

-- 在创建英雄时存储引用
local function create_hero_for_player(player)
    local hero = y3.unit.create_unit(player, HERO_ID, spawn_point, 0)
    player_heroes[player:get_id()] = hero
    player:select_unit(hero)  -- 选中英雄
    return hero
end

-- 监听键盘事件，实现自定义移动
y3.game:event('键盘-按下', 'W', function(trg, data)
    local player = data.player
    local hero = player_heroes[player:get_id()]  -- 从自定义表获取英雄
    if hero then
        -- 获取当前位置，向 Y- 方向移动（北）
        local pos = hero:get_point()
        local target = y3.point.create(pos:get_x(), pos:get_y() - 100, pos:get_z())
        hero:move_to_point(target)
    end
end)
```

> ⚠️ **注意**：自定义控制会与内置 3C 共存，如需完全替换需禁用默认行为

## 📁 项目结构

> ⚠️ **所有路径相对于项目根目录 `e:\agentmap\`**

```
maps/
└── EntryMap/
    ├── editor_table/    ← 物编数据（此地图专用）
    │   └── editorunit/
    ├── script/          ← Lua 脚本 ⭐
    │   ├── main.lua     ← 入口文件
    │   ├── 可重载的代码.lua
    │   ├── y3/          ← Y3 框架（不要修改）
    │   └── game/        ← 你的游戏逻辑（新建）
    └── ui/              ← UI JSON

editor_table/            ← 全局物编（所有地图共用）
```

### 🚨 脚本路径警告

| ✅ 正确路径 | ❌ 错误路径 |
|-------------|-------------|
| `maps/EntryMap/script/` | `script/`（根目录下） |
| `maps/EntryMap/script/game/xxx.lua` | `./script/xxx.lua` |

> **AI 在创建 Lua 文件时，必须使用完整的 `maps/EntryMap/script/` 路径！**

## 📚 参考资源

| 资源 | 路径 |
|------|------|
| 常见错误 | `.codemaker/rules/common_errors.md` |
| 代码示例 | `skills/y3-game-spec/examples/` |
| API 验证 | `maps/EntryMap/script/y3/` |

---

*最后更新: 2026-03-11*