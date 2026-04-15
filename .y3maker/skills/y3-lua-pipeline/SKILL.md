---
name: y3-lua-pipeline
description: >
  用于编写 Y3 游戏的所有 Lua 代码，包括游戏逻辑、系统开发、事件处理、技能效果实现，
  以及 UI 交互代码（使用 y3.ui 和 GameAPI）。
  
  ALWAYS use this skill when user mentions: 写Lua代码、游戏逻辑、事件处理、技能效果、
  Buff效果、伤害计算、死亡判定、单位创建、刷怪逻辑、AI行为、定时器、触发器、
  数据存储、存档读档、计分系统、关卡逻辑、胜负判定、玩家初始化、
  UI代码、UI事件绑定、UI交互、按钮点击、界面逻辑。
  
  This skill handles ALL Lua code including game logic AND UI interaction code.
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
2. **确认函数存在**：使用代码搜索工具或 `rg` 搜索函数名，验证其存在于 y3 库中
3. **核对参数签名**：查看源码中的函数定义，确保参数数量和类型正确
4. **禁止臆造 API**：如果搜索不到函数，**绝对不能自行编造**

**执行流程**：
```
编写代码前
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 1. 搜索 y3 源码：代码搜索工具 / `rg` 函数名                 │
│ 2. 找到定义后，阅读参数和返回值                             │
│ 3. 如果找不到，查阅 references/ 或 common_errors.md        │
│ 4. 仍找不到则询问用户或明确标注"待验证"                    │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
确认 API 存在后才能写入代码
```
---

## 触发关键词

当用户请求包含以下关键词时使用本技能：

- 游戏逻辑、系统开发、UI逻辑
- 单位创建、技能系统、物品系统
- 事件监听、键盘监听、游戏事件
- 计时器、定时任务、循环执行
- 玩家遍历、玩家数据、主控单位
- AI 行为、寻路、移动控制
- Buff 系统、属性修改、伤害计算
- 存档读取、配置加载、数据管理

---

## 🔒 强制执行清单（Execution Checklist, MUST）

> 以下清单为 Lua 任务硬门禁执行项。任何一项未完成，不得标记任务完成。

- [ ] **路由确认**：当前任务已进入 `y3-lua-pipeline`（UI Lua 场景由 `y3-ui-pipeline` 子路由）
- [ ] **脚本目录确认**：已确认实际脚本根目录（`maps/EntryMap/script` 或 `global_script`）
- [ ] **前置阅读完成**：已阅读 `memory/lua-issues/`（`api_issues.md`、`trace_issues.md`）与对应 `references/`
- [ ] **API 合规验证**：新增/修改的每个 API 调用均已在 `y3/` 源码或 references 中验证存在性与参数
- [ ] **代码实现完成**：Lua 文件已按规范修改并放置在正确目录
- [ ] **静态检查通过**：已执行 Lua 问题检查（如 `read_problems_lua`）且无阻断错误
- [ ] **运行时验证通过**：已完成至少 1 轮标准测试循环（状态检查 → 启动/重启 → 等待日志 → trace 检查）
- [ ] **记忆归档完成**：若出现 Lua 相关问题，已按类别归档至 `lua-issues`（API/Trace）
- [ ] **交付报告已输出**：已按下方 Completion Report 模板输出交付信息

## 📋 交付报告模板（Completion Report, MUST）

> 每次 Lua 任务交付时必须附带以下结构化报告，便于审计与复盘。

```markdown
## Lua Task Completion Report

### 1) 任务信息
- 任务描述：
- 影响范围：
- 路由技能：`y3-lua-pipeline`（游戏逻辑 + UI Lua） / `y3-ui-pipeline`（UI JSON 生成）

### 2) 变更文件
- 修改文件：
- 新增文件：
- 删除文件：

### 3) API 合规验证
- 新增/修改 API 列表：
  - API:
    - 来源：`maps/.../y3/...` 或 `references/...`
    - 参数校验结论：
- 未验证 API：无 / （若有，必须标记“实验性实现”并说明风险）

### 4) 静态检查结果
- 检查方式：
- 结果：通过 / 未通过
- 详细问题（如有）：

### 5) 运行时验证结果
- 测试循环执行次数：
- 游戏状态操作：launch / quick_restart
- 日志检查结论：无阻断错误 / 存在错误（已修复）
- Trace/Error 摘要：

### 6) Lua 问题归档
- 是否新增 `lua-issues` 记录：是 / 否
- 归档文件：`api_issues.md` / `trace_issues.md`
- 问题原因与解决方案摘要：

### 7) 风险与例外
- 跳过 Gate：无 / Gx（需附用户二次确认）
- 当前剩余风险：无 / （请说明）
- 补救建议：
```

---

## Part 1: y3 库结构

### 1.1 目录结构树

```
y3/
├── init.lua                        # 入口文件，定义所有 y3.xxx 全局变量
├── meta/
│   ├── event.lua                   # ⭐ 所有事件名和参数大全（写事件必查）
│   └── enum.lua                    # 枚举定义
├── game/
│   ├── const.lua                   # ⭐ 常量/枚举（UnitAttr、UnitState、DamageType 等）
│   ├── game.lua                    # 游戏控制 API
│   ├── math.lua                    # 数学工具
│   ├── config.lua                  # 配置
│   ├── helper.lua                  # 辅助方法
│   ├── kv.lua                      # KV 键值对存取
│   ├── ground.lua                  # 地面/地形
│   └── steam.lua                   # Steam 平台接口
├── object/
│   ├── editable_object/            # 物编对象（编辑器中定义）
│   │   ├── unit.lua                #   单位
│   │   ├── ability.lua             #   技能
│   │   ├── buff.lua                #   魔法效果（Buff）
│   │   ├── item.lua                #   道具
│   │   ├── projectile.lua          #   投射物
│   │   ├── destructible.lua        #   可破坏物
│   │   └── technology.lua          #   科技
│   ├── runtime_object/             # 运行时对象
│   │   ├── player.lua              #   玩家
│   │   ├── timer.lua               #   ⭐ 同步计时器
│   │   ├── cast.lua                #   施法实例
│   │   ├── damage_instance.lua     #   伤害实例
│   │   ├── heal_instance.lua       #   治疗实例
│   │   ├── mover.lua               #   运动器
│   │   ├── beam.lua                #   射线
│   │   ├── particle.lua            #   粒子特效
│   │   ├── selector.lua            #   单位选择器
│   │   ├── sound.lua               #   音效
│   │   ├── force.lua               #   阵营
│   │   ├── unit_group.lua          #   单位组
│   │   ├── player_group.lua        #   玩家组
│   │   ├── item_group.lua          #   物品组
│   │   └── projectile_group.lua    #   投射物组
│   └── scene_object/               # 场景/UI 对象
│       ├── ui.lua                  #   ⭐ UI 控件
│       ├── ui_prefab.lua           #   UI 预制体（界面元件）
│       ├── scene_ui.lua            #   场景 UI（Billboard）
│       ├── point.lua               #   点
│       ├── area.lua                #   区域
│       ├── camera.lua              #   摄像机
│       ├── light.lua               #   光源
│       ├── road.lua                #   路径
│       └── shape.lua               #   形状
├── tools/
│   ├── class.lua                   # ⭐ y3 类定义系统（Class/New/Extends）
│   ├── json.lua                    # JSON 工具
│   ├── proxy.lua                   # 代理对象
│   ├── reload.lua                  # 热重载（include）
│   └── ...
└── util/
    ├── local_timer.lua             # ⭐ 非同步本地计时器（y3.ltimer）
    ├── log.lua                     # 日志（log.info/debug/error）
    ├── save_data.lua               # ⭐ 存档系统
    ├── event.lua                   # 事件系统核心
    ├── trigger.lua                 # 触发器
    ├── sync.lua                    # 同步工具
    ├── network.lua                 # 网络
    └── ...
```

### 1.2 全局变量→源文件映射表

| 全局变量 | 源文件路径 | 说明 |
|----------|-----------|------|
| `y3.proxy` | `y3/tools/proxy` | 代理对象 |
| `y3.class` | `y3/tools/class` | 类系统 |
| `y3.util` | `y3/tools/utility` | 工具方法 |
| `y3.json` | `y3/tools/json` | JSON 工具 |
| `y3.const` | `y3/game/const` | 常量/枚举 |
| `y3.math` | `y3/game/math` | 数学工具 |
| `y3.game` | `y3/game/game` | 游戏控制 |
| `y3.kv` | `y3/game/kv` | KV 键值存取 |
| `y3.config` | `y3/game/config` | 配置 |
| `y3.ground` | `y3/game/ground` | 地面/地形 |
| `y3.steam` | `y3/game/steam` | Steam 接口 |
| **物编对象** | | |
| `y3.unit` | `y3/object/editable_object/unit` | 单位 |
| `y3.ability` | `y3/object/editable_object/ability` | 技能 |
| `y3.buff` | `y3/object/editable_object/buff` | 魔法效果 |
| `y3.item` | `y3/object/editable_object/item` | 道具 |
| `y3.projectile` | `y3/object/editable_object/projectile` | 投射物 |
| `y3.destructible` | `y3/object/editable_object/destructible` | 可破坏物 |
| `y3.technology` | `y3/object/editable_object/technology` | 科技 |
| **运行时对象** | | |
| `y3.player` | `y3/object/runtime_object/player` | 玩家 |
| `y3.timer` | `y3/object/runtime_object/timer` | 同步计时器 |
| `y3.ltimer` | `y3/util/local_timer` | 非同步本地计时器 |
| `y3.selector` | `y3/object/runtime_object/selector` | 单位选择器 |
| `y3.mover` | `y3/object/runtime_object/mover` | 运动器 |
| `y3.cast` | `y3/object/runtime_object/cast` | 施法实例 |
| `y3.damage_instance` | `y3/object/runtime_object/damage_instance` | 伤害实例 |
| `y3.heal_instance` | `y3/object/runtime_object/heal_instance` | 治疗实例 |
| `y3.particle` | `y3/object/runtime_object/particle` | 粒子特效 |
| `y3.beam` | `y3/object/runtime_object/beam` | 射线 |
| `y3.sound` | `y3/object/runtime_object/sound` | 音效 |
| `y3.force` | `y3/object/runtime_object/force` | 阵营 |
| `y3.player_group` | `y3/object/runtime_object/player_group` | 玩家组 |
| `y3.unit_group` | `y3/object/runtime_object/unit_group` | 单位组 |
| `y3.item_group` | `y3/object/runtime_object/item_group` | 物品组 |
| `y3.projectile_group` | `y3/object/runtime_object/projectile_group` | 投射物组 |
| **场景对象** | | |
| `y3.point` | `y3/object/scene_object/point` | 点 |
| `y3.area` | `y3/object/scene_object/area` | 区域 |
| `y3.camera` | `y3/object/scene_object/camera` | 摄像机 |
| `y3.ui` | `y3/object/scene_object/ui` | UI 控件 |
| `y3.ui_prefab` | `y3/object/scene_object/ui_prefab` | UI 预制体 |
| `y3.scene_ui` | `y3/object/scene_object/scene_ui` | 场景 UI |
| `y3.shape` | `y3/object/scene_object/shape` | 形状 |
| `y3.light` | `y3/object/scene_object/light` | 光源 |
| `y3.road` | `y3/object/scene_object/road` | 路径 |
| **工具/其他** | | |
| `y3.save_data` | `y3/util/save_data` | 存档系统 |
| `y3.sync` | `y3/util/sync` | 同步工具 |
| `y3.network` | `y3/util/network` | 网络 |
| `y3.trigger` | `y3/util/trigger` | 触发器 |
| `y3.object` | `y3/util/object` | 对象工具 |
| `y3.local_ui` | `y3/util/local_ui` | 本地 UI 工具 |

### 1.3 对象三分类

**editable_object（物编对象）**——在编辑器中定义，运行时通过 ID 引用创建：

| 访问器 | 对象 | 用途 |
|--------|------|------|
| `y3.unit` | 单位 | 英雄、怪物、NPC、建筑 |
| `y3.ability` | 技能 | 主动/被动/英雄技能 |
| `y3.buff` | 魔法效果 | Buff/Debuff/光环/护盾 |
| `y3.item` | 道具 | 消耗品/装备/掉落物 |
| `y3.projectile` | 投射物 | 弹道/飞行物 |
| `y3.destructible` | 可破坏物 | 可被摧毁的场景物体 |
| `y3.technology` | 科技 | 科技升级 |

**runtime_object（运行时对象）**——仅在游戏运行时存在：

| 访问器 | 对象 | 用途 |
|--------|------|------|
| `y3.player` | 玩家 | 玩家信息、资源、控制 |
| `y3.timer` | 同步计时器 | 多人同步的延迟/循环 |
| `y3.selector` | 选择器 | 按条件筛选单位 |
| `y3.mover` | 运动器 | 控制物体运动轨迹 |
| `y3.cast` | 施法实例 | 技能施法过程 |
| `y3.damage_instance` | 伤害实例 | 单次伤害事件 |
| `y3.particle` | 粒子特效 | 视觉效果 |
| `y3.player_group` | 玩家组 | 批量操作玩家 |
| `y3.unit_group` | 单位组 | 批量操作单位 |

**scene_object（场景/UI 对象）**——绑定到场景或 UI：

| 访问器 | 对象 | 用途 |
|--------|------|------|
| `y3.point` | 点 | 3D 坐标点 |
| `y3.area` | 区域 | 圆形/矩形区域检测 |
| `y3.camera` | 摄像机 | 视角控制 |
| `y3.ui` | UI 控件 | 界面元素操作 |
| `y3.ui_prefab` | UI 预制体 | 可复用的 UI 模块 |
| `y3.scene_ui` | 场景 UI | 世界空间的 Billboard UI |
| `y3.shape` | 形状 | 碰撞/选择形状 |

### 1.4 关键 meta/game 文件

| 文件 | 何时查阅 | 包含内容 |
|------|----------|----------|
| `y3/meta/event.lua` | **写任何事件监听前必查** | 所有事件名 + `event_params`（`lua_name` 和 `lua_type`） |
| `y3/game/const.lua` | 使用属性名、状态名、枚举值时 | `UnitAttr`（中文键→属性名）、`UnitState`、`UnitEnumState`、`DamageTypeMap`、`AbilityType`、`AbilityIndex`、`KeyboardKey` 等 |
| `y3/game/game.lua` | 游戏控制（开始/结束/时间） | `y3.game:event()`、`y3.game.current_game_run_time()` 等 |

### 1.5 全局快捷函数

以下函数在 `y3/init.lua` 中定义为全局变量，无需 `y3.` 前缀即可使用：

```lua
-- 类系统
Class   = y3.class.declare     -- 声明类：local MyClass = Class('MyClass')
New     = y3.class.new         -- 创建实例：local obj = New('MyClass', ...)
Extends = y3.class.extends     -- 继承：Extends('Child', 'Parent')
Delete  = y3.class.delete      -- 删除实例
IsValid = y3.class.isValid     -- 检查实例有效性
Type    = y3.class.type        -- 获取类型名
Alias   = y3.class.alias       -- 类型别名
IsInstanceOf = y3.class.isInstanceOf  -- 类型检查

-- 模块加载
include = y3.reload.include    -- 支持热重载的 require（开发时推荐）

-- 日志（从 y3/util/log.lua 注入）
log.info("信息")               -- 普通日志
log.debug("调试")              -- 调试日志
log.error("错误")              -- 错误日志
```

### 1.6 计时器选型

| 计时器 | 来源 | 同步性 | 适用场景 |
|--------|------|--------|----------|
| `y3.timer` | `runtime_object/timer.lua` | ✅ 同步 | 游戏逻辑：刷怪、伤害、回合、关卡 |
| `y3.ltimer` | `util/local_timer.lua` | ❌ 非同步 | 本地逻辑：UI 动画、倒计时显示、特效 |

**决策规则**：影响游戏状态的逻辑用 `y3.timer`，纯表现/UI 用 `y3.ltimer`。

```lua
-- ✅ 同步计时器：刷怪（影响所有玩家）
y3.timer.loop(5.0, function(timer, count)
    -- 每5秒刷一波怪
end)

-- ✅ 非同步计时器：UI 倒计时（纯本地表现）
y3.ltimer.loop(1.0, function(timer, count)
    -- 更新倒计时 UI
end)
```

---

## Part 2: 快速查询（9 类代码模式）

### 2.1 游戏流程

```lua
-- 游戏初始化（最早执行，适合创建英雄、初始化数据）
y3.game:event('游戏-初始化', function(trg, data)
    log.info("===== 游戏初始化 =====")
end)

-- 游戏开始（初始化完成后）
y3.game:event('游戏-开始', function(trg, data)
    log.info("游戏正式开始")
end)

-- 游戏结束
y3.game:event('游戏-结束', function(trg, data)
    log.info("游戏结束")
end)
```

**日志打印**：
```lua
log.info("普通信息", variable)    -- 输出到日志面板
log.debug("调试信息")             -- 调试级别
log.error("错误信息")             -- 错误级别
```

**距离单位**：y3 中距离单位为引擎内部单位，编辑器中的"格"约等于 100 单位。

### 2.2 事件绑定

#### 事件名查找流程（强制）

1. 在 `y3/meta/event.lua` 中搜索事件的**中文名**（如 `"单位-死亡"`）
2. 查看该事件的 `event_params` 字段
3. 每个参数包含 `lua_name`（Lua 中使用的参数名）和 `lua_type`（类型）
4. 在代码中使用 `data.lua_name` 访问参数

**⚠️ 严禁凭猜测使用参数名！常见错误：**

| ❌ 错误 | ✅ 正确 | 原因 |
|---------|---------|------|
| `data.killer` | `data.source_unit` | event.lua 中不存在 `killer` |
| `data.target` | `data.target_unit` | 必须使用完整 `lua_name` |
| `data.source` | `data.source_unit` | 必须使用完整 `lua_name` |

#### 事件回调签名

所有事件回调格式为 `function(trg, data)`：
- `trg`：触发器对象
- `data`：事件参数表（字段由 event.lua 定义）

#### 常用事件速查表

**游戏事件**（挂在 `y3.game` 上）：
```lua
y3.game:event('游戏-初始化', function(trg, data) end)
y3.game:event('游戏-开始', function(trg, data) end)
y3.game:event('游戏-结束', function(trg, data) end)
y3.game:event('键盘-按下', 'T', function(trg, data)
    local player = data.player
end)
y3.game:event('键盘-释放', 'T', function(trg, data) end)
y3.game:event('鼠标-按下', function(trg, data)
    local player = data.player
    local button = data.button  -- 1:左键 2:右键 3:中键
end)
```

**单位事件**（挂在 unit 实例或 `y3.game` 上）：
```lua
unit:event('单位-死亡', function(trg, data)
    local source = data.source_unit  -- 击杀者
    local damage = data.damage
end)
unit:event('单位-受到伤害后', function(trg, data)
    local damage = data.damage
    local source = data.source_unit
end)
unit:event('单位-造成伤害后', function(trg, data)
    local target = data.target_unit
end)
unit:event('单位-进入区域', function(trg, data)
    local area = data.area
end)
-- 全局监听所有单位：
y3.game:event('单位-死亡', function(trg, data)
    local unit = data.unit
    local source = data.source_unit
end)
```

**技能事件**：
```lua
-- 施放技能（挂在单位上，不是技能上！）
unit:event('单位-施放技能', function(trg, data)
    local ability = data.ability
    local target = data.ability_target_unit  -- 可能为 nil
end)
ability:event('技能-获得', function(trg, data) end)
ability:event('技能-失去', function(trg, data) end)
ability:event('技能-冷却结束', function(trg, data) end)
```

**Buff 事件**：
```lua
buff:event('效果-获得', function(trg, data) end)
buff:event('效果-失去', function(trg, data) end)
buff:event('效果-层数变化', function(trg, data)
    local change = data.layer_change_values
    local owner = data.owner_unit
end)
```

**物品事件**：
```lua
item:event('物品-获得', function(trg, data)
    local picker = data.unit
end)
item:event('物品-使用', function(trg, data) end)
item:event('物品-失去', function(trg, data) end)
```

**移除事件监听**：
```lua
local handle = unit:event('单位-死亡', function(trg, data) end)
handle:remove()  -- 移除监听
```

### 2.3 UI 操作

#### UI 获取方式

```lua
-- 通过路径获取（推荐）
local ui = y3.ui.get_ui(player, "panel_1.image_1")

-- 获取子控件（支持点号路径）
local child = parent_ui:get_child("container.btn_start")
-- ❌ 错误：直接查找嵌套控件，嵌套在 card_1 中的 btn 查不到
-- local btn = panel:get_child("btn_select_1")
-- ✅ 正确：用点号路径
-- local btn = panel:get_child("card_1.btn_select_1")

-- 创建新控件
local ui = y3.ui.create_ui(player, parent_ui, '图片')  -- 类型: '图片'|'文本'|'按钮'|'进度条'|'输入框'|'列表'|'空节点'
```

#### 强制规则 UI 事件的绑定方式

**`add_fast_event`（快速事件）**——同步触发，用于常规 UI 交互：
```lua
ui:add_fast_event('左键-点击', function(trg, data)
    local player = data.player
    log.info("按钮被点击")
end)
```

**event_type 可选值**：`'左键-按下'`、`'左键-抬起'`、`'左键-点击'`、`'右键-按下'`、`'右键-抬起'`、`'右键-点击'`、`'鼠标-悬停'`、`'鼠标-移入'`、`'鼠标-移出'`、`'拖拽-开始'`、`'拖拽-进行'`、`'拖拽-结束'`

#### 画板初始化与常用操作

```lua
-- 设置可见性
ui:set_visible(true)
ui:set_alpha(80)           -- 透明度 0-100

-- 文本
ui:set_text("你好世界")
ui:set_font_size(24)
ui:set_text_color(255, 255, 255, 255)  -- RGBA

-- 图片
ui:set_image(texture_id)
ui:set_image_color(255, 0, 0, 255)

-- 进度条
ui:set_max_progress_bar_value(100)
ui:set_current_progress_bar_value(75, 0)  -- 第二参数为渐变时间

-- 按钮
ui:set_button_enable(true)
ui:set_button_shortcut('Q')  -- 快捷键
```

#### GridView + UI Prefab

```lua
-- GridView 设置
grid_view:set_ui_gridview_count(3, 3)       -- 3行3列
grid_view:set_ui_gridview_size(100, 100)    -- 单元格尺寸
grid_view:set_ui_gridview_space(5, 5)       -- 间距

-- 创建 UI Prefab 并添加到容器
local prefab = y3.ui_prefab.create(player, prefab_name, parent_ui)
local child = prefab:get_child("image_icon")  -- 获取预制体内子控件
child:set_image(icon_id)
```

### 2.3+ UI 补充（独有内容）

#### 📐 UI 坐标系统

| 特性 | 说明 |
|------|------|
| 原点位置 | 画布**左下角** |
| 坐标单位 | 支持像素和百分比 |
| 默认锚点 | 控件中心 (0.5, 0.5) |
| 画布高度 | 固定 1080 |

**核心原则**：**总是优先使用百分比坐标**，能自动适配不同分辨率。

```lua
-- ✅ 推荐：使用百分比坐标居中
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 50)

-- ❌ 不推荐：使用 set_pos + screen_width 计算
local screen_width = y3.ui.get_screen_width()
ui:set_pos(screen_width / 2, 540)
```

**父子 UI 坐标关系**：子控件的坐标是相对于父控件的**左下角**，而非父控件的锚点位置。

#### 🔍 UI 节点路径查询

**编写 UI 代码前，必须先确定正确的节点路径。**

| 优先级 | 方法 | 说明 |
|--------|------|------|
| **1️⃣** | 读取 `ui_tree/*_Tree.json` | 简化树文件（~150行），token 消耗极低 |
| **2️⃣** | 读取原始 `maps/EntryMap/ui/*.json` | 完整 UI 文件（3000+行），作为备选 |

**从节点树推导 Lua 路径**：
```lua
-- 树结构: HeroSelectPanel → block → main_frame → button_select
-- Lua路径: "HeroSelectPanel.block.main_frame.button_select"
local btn = y3.ui.get_ui(player, "HeroSelectPanel.block.main_frame.button_select")
```

#### 空节点容器技巧

> 当需要使用空节点时，优先使用图片控件并设置为空图片（id:999）。

```lua
-- ✅ 推荐：使用图片控件 + 空图片作为容器
local container = root:create_child('图片')
container:set_image(999)
```

#### 🚨 UI 常见问题

| 问题 | 原因 | 解决方案 |
|------|------|----------|
| 控件无法水平居中 | 用 `screen_width` 计算 | 使用百分比坐标 |
| 全屏背景不铺满 | 未设置四边定位 | `set_relative_parent_pos` 四边设为 0 |
| 文本显示不全 | 控件宽度不够 | 设置足够的 `set_ui_size` |
| 图片显示默认图片 | 没有设置图片资源 | 先 `set_image` 再设颜色 |
| 子控件路径返回 nil | 缺少中间层级 | 使用完整点号路径 |

### 2.4 玩家接口

```lua
-- 获取玩家
local player = y3.player.get_by_id(1)

-- 遍历所有玩家
local allPlayers = y3.player_group.get_all_players():pick()
for _, player in pairs(allPlayers) do
    local id = player:get_id()
    -- 过滤中立玩家（31/32）
    if id >= 1 and id <= 12 then
        -- 处理真实玩家
    end
end

-- 本地玩家（仅客户端逻辑，⚠️ 不要修改游戏状态）
y3.player.with_local(function(local_player)
    -- 纯本地逻辑，如 UI 显示
end)

-- 玩家属性
local name = player:get_name()
local camp = player:get_camp()
player:select_unit(hero)    -- 选中英雄

-- 资源操作
player:set('金币', 1000)
player:add('金币', 100)
local gold = player:get('金币')
```

### 2.5 单位操作

```lua
-- 创建单位
local point = y3.point.create(0, 0, 0)
local unit = y3.unit.create_unit(player, unit_id, point, 0)
-- 参数: 所属玩家, 物编ID, 出生点, 朝向(弧度)

-- 属性（键名见 const.lua UnitAttr，使用中文）
unit:set_attr('物理攻击', 100)
unit:set_attr('移动速度', 300)
local atk = unit:get_attr('物理攻击')

-- 生命值
local hp = unit:get_hp()
unit:add_hp(50)
unit:set_hp(100)

-- 移动
unit:move_to_pos(target_point)
unit:stop()
local pos = unit:get_point()
unit:set_point(new_point)

-- 状态
if unit:is_alive() then end
unit:remove()
```

**⚠️ get_key() vs get_type() 区分（极重要）**：
```lua
-- ✅ 正确：get_key() 返回物编 ID（如 100001）
local unit_key = unit:get_key()
if unit_key == 100001 then
    log.info("这是弓箭手")
end

-- ❌ 错误：get_type() 返回种类（生物=4/建筑=2/英雄=1），不是物编 ID！
-- local unit_type = unit:get_type()
-- if unit_type == 100001 then end  -- 永远不会匹配！
```

### 2.6 技能系统

> ⚠️ **技能类型参数兼容性警告**：
> | API | 可传字符串？ | 原因 |
> |-----|------------|------|
> | `add_ability('英雄', ...)` | ✅ 可以 | 内部有 `y3.const.AbilityType[type] or type` 转换 |
> | `find_ability('英雄', ...)` | ✅ 可以 | 同上 |
> | `remove_ability_by_key('英雄', ...)` | ✅ 可以 | 同上 |
> | `get_abilities_by_type('英雄')` | ❌ **崩溃** | 底层直接传 C++，无转换 |
> | `remove_ability('英雄', slot)` | ❌ **崩溃** | 底层直接传 C++，无转换 |
>
> 对于标记 ❌ 的 API，**必须**使用 `y3.const.AbilityType['英雄']` 传入整数。

```lua
-- 添加技能（类型: '隐藏'|'普通'|'命令'|'英雄'）
local ability = unit:add_ability('普通', ability_id)
local hero_skill = unit:add_ability('英雄', ability_id, slot, level)

-- 查找技能
local ability = unit:find_ability('普通', ability_id)
local abilities = unit:get_abilities_by_type(y3.const.AbilityType['普通'])
-- ⚠️ get_abilities_by_type 必须传 y3.const.AbilityType 整数，不能传字符串！

-- 技能等级
ability:set_level(3)
ability:add_level(1)
local lvl = ability:get_level()

-- 冷却
ability:set_cd(5.0)
ability:complete_cd()  -- 立即结束冷却

-- 技能属性
ability:set_float_attr('伤害', 100)
local dmg = ability:get_float_attr('伤害')

-- 启用/禁用
ability:enable()
ability:disable()

-- 移除
unit:remove_ability(y3.const.AbilityType['普通'], slot)  -- ⚠️ 必须用 const，底层无转换
unit:remove_ability_by_key('普通', ability_key)           -- ✅ 内部有转换，可传字符串
```

**技能施放事件挂在单位上，不是技能对象上**：
```lua
unit:event('单位-施放技能', function(trg, data)
    if data.ability == fireball then
        local target = data.ability_target_unit
    end
end)
```

### 2.7 定时器

#### y3.ltimer（非同步本地计时器）

```lua
-- 延迟执行
y3.ltimer.wait(3.0, function(timer, count)
    log.info("3秒后执行")
end)

-- 无限循环
y3.ltimer.loop(1.0, function(timer, count)
    log.info("每秒执行，次数: " .. count)
    -- timer:remove()  -- 需要时停止
end)

-- 循环指定次数
y3.ltimer.loop_count(1.0, 5, function(timer, current)
    log.info("执行 " .. current .. "/5")
end)

-- 等待帧
y3.ltimer.wait_frame(1, function()
    log.info("下一帧执行")
end)

-- 每帧循环
y3.ltimer.loop_frame(1, function(timer, count)
    -- 每帧执行（用于平滑动画）
    -- timer:remove()
end)
```

#### y3.timer（同步计时器）

```lua
-- 同步循环（影响游戏状态时使用）
y3.timer.loop(5.0, function(timer, count)
    -- 每5秒执行，所有玩家同步
end)
```

#### 停止计时器

```lua
-- 方式1：保存引用后移除
local my_timer = y3.ltimer.loop(1.0, function() end)
my_timer:remove()

-- 方式2：在回调中移除
y3.ltimer.loop(1.0, function(timer, count)
    if count >= 10 then
        timer:remove()
        return
    end
end)
```

### 2.8 表格（KV 键值对）

y3 的"表格"主要指 KV 键值存取系统（`y3.kv`），用于在物编对象上存取自定义数据。

```lua
-- KV 支持的类型: boolean, integer, number, string, Unit, Ability, Item, Buff, Point, Player, Projectile 等

-- 在单位/技能/Buff等物编对象上存取 KV 值
-- （KV 通过对象的 handle 操作，具体 API 见 y3/game/kv.lua）
```

**注意**：KV 的 key 必须是字符串或整数，value 必须是基础类型或 y3 对象类型。

### 2.9 存档机制

存档通过 `y3.save_data` 操作，按**玩家 + 槽位(slot)** 存取。

```lua
-- 基础类型存取
y3.save_data.save_boolean(player, slot, true)
local val = y3.save_data.load_boolean(player, slot)

y3.save_data.save_integer(player, slot, 100)
local num = y3.save_data.load_integer(player, slot)
y3.save_data.add_integer(player, slot, 10)   -- 增量操作

y3.save_data.save_real(player, slot, 3.14)
local real = y3.save_data.load_real(player, slot)

y3.save_data.save_string(player, slot, "hello")
local str = y3.save_data.load_string(player, slot)

-- 表存取（推荐，修改后自动同步到存档）
local save_table = y3.save_data.load_table(player, slot)
save_table.level = 10           -- 直接修改即自动保存
save_table.items = {}           -- 支持嵌套（最多 3 层）
save_table.items.sword = true
```

**限制**：
- key 必须是字符串或整数
- value 只能是基础类型（boolean/integer/number/string）或表
- 表最多嵌套 3 层

---

## Part 3: API 快速参考

### 3.1 Unit API

```lua
-- 创建
y3.unit.create_unit(player, unit_id, point, direction) -> Unit
y3.unit.get_by_id(id) -> Unit

-- 属性（键名用中文，见 const.lua UnitAttr）
unit:get_attr('物理攻击') -> number
unit:set_attr('物理攻击', value)
unit:get_hp() -> number
unit:set_hp(value)
unit:add_hp(delta)                -- 正数加血，负数减血

-- 物编 ID
unit:get_key() -> py.UnitKey      -- ✅ 获取物编 ID（判断具体类型用这个）
unit:get_type() -> py.UnitType    -- ❌ 获取种类 ID（生物/建筑/英雄），不要用来判断具体类型！

-- 位置/移动
unit:get_point() -> Point
unit:set_point(point)
unit:move_to_pos(point)
unit:stop()

-- 状态
unit:is_alive() -> boolean
unit:remove()

-- 技能/Buff
unit:add_ability(type, ability_id, slot?, level?) -> Ability
unit:find_ability(type, ability_id) -> Ability
unit:add_buff({ key, source?, time?, stacks? }) -> Buff
unit:find_buff(buff_id) -> Buff

-- 运动器
unit:mover_line({ angle, distance, speed, on_hit?, on_finish?, ... })
unit:mover_target({ target, speed, target_distance, on_hit?, on_miss?, ... })
unit:mover_round({ target, radius, angle_speed, round_time, ... })
```

### 3.2 Ability API

```lua
ability:get_level() -> number
ability:set_level(level)
ability:add_level(delta)
ability:get_cd() -> number
ability:set_cd(seconds)
ability:complete_cd()
ability:set_float_attr(name, value)
ability:get_float_attr(name) -> number
ability:enable()
ability:disable()
```

### 3.3 Buff API

```lua
unit:add_buff({ key = buff_id, source = caster, time = 10.0, stacks = 1 }) -> Buff
unit:find_buff(buff_id) -> Buff
unit:get_buffs() -> Buff[]
buff:get_stack() -> number
buff:set_stack(n)
buff:add_stack(delta)
buff:get_time() -> number
buff:set_time(seconds)
buff:add_time(delta)
buff:set_shield(value)
buff:get_shield() -> number
buff:remove()
unit:remove_buffs_by_key(buff_key)
```

### 3.4 Item API

```lua
y3.item.create_item(point, item_key, player?) -> Item
y3.item.get_by_id(id) -> Item
item:get_stack() -> number
item:set_stack(n)
item:get_owner() -> Unit?
item:remove()
unit:add_item(item_id)
unit:get_all_items():pick() -> Item[]
```

### 3.5 Player API

```lua
y3.player.get_by_id(player_id) -> Player
y3.player.with_local(function(local_player) end)  -- ⚠️ 仅本地逻辑
y3.player_group.get_all_players():pick() -> Player[]
player:get_id() -> number
player:get_name() -> string
player:get_camp() -> number
player:select_unit(unit)
player:set(resource_name, value)
player:add(resource_name, delta)
player:get(resource_name) -> number
```

### 3.6 Timer API

```lua
-- 非同步（y3.ltimer）
y3.ltimer.wait(delay, function(timer, count) end)
y3.ltimer.loop(interval, function(timer, count) end)
y3.ltimer.loop_count(interval, count, function(timer, current) end)
y3.ltimer.wait_frame(frames, function() end)
y3.ltimer.loop_frame(interval, function(timer, count) end)

-- 同步（y3.timer）
y3.timer.loop(interval, function(timer, count) end)

-- 停止
timer:remove()

-- 游戏时间
y3.game.current_game_run_time() -> number  -- 秒
```

### 3.7 Point / Area / Selector API

```lua
-- Point
y3.point.create(x, y, z) -> Point
point:get_x() / get_y() / get_z() -> number
point:get_distance_with(other_point) -> number
point:get_angle_with(other_point) -> number

-- Area
y3.area.create_circle_area(center, radius) -> Area
y3.area.create_rectangle_area_from_two_points(p1, p2) -> Area
area:is_point_in_area(point) -> boolean

-- Selector（链式调用）
local units = y3.selector.create()
    :in_range(point, radius)
    :is_enemy(player)
    :count(10)                    -- 限制数量
    :sort_type('由近到远')         -- 排序
    :pick()                       -- 返回 Unit[]
-- 注意：选择器默认排除死亡单位
```

### 3.8 UI API

```lua
-- 获取
y3.ui.get_ui(player, "panel.child") -> UI
ui:get_child("sub.path") -> UI     -- 支持点号多级路径

-- 创建
y3.ui.create_ui(player, parent, type) -> UI
y3.ui_prefab.create(player, prefab_name, parent) -> UIPrefab
prefab:get_child(path?) -> UI

-- 事件绑定, 必须使用
ui:add_fast_event(event_type, callback)    -- 同步事件

-- 显示
ui:set_visible(bool)
ui:set_alpha(0-100)
ui:set_text(str)
ui:set_font_size(size)
ui:set_text_color(r, g, b, a)
ui:set_image(texture_id)
ui:set_image_color(r, g, b, a)
ui:set_ui_size(width, height)
ui:set_button_enable(bool)
ui:set_current_progress_bar_value(value, time)

-- 属性绑定
ui:bind_unit_attr(ui_attr, unit_attr, accuracy)
ui:bind_ability_cd(ui_attr, ability)
-- ui_attr: '文本'|'进度'|'进度最大值'|'图片'

-- Scene UI
y3.scene_ui.create_scene_ui_at_point(name, point, range?, height?) -> SceneUI
y3.scene_ui.create_scene_ui_at_player_unit_socket(name, player, unit, socket) -> SceneUI
scene_ui:get_ui_comp_in_scene_ui(player, comp_path) -> UI
```

---

## 附录：References 文件索引

**游戏逻辑**（`references/`）：
- `unit.md` — 单位 API（含运动器详细参数）
- `ability.md` — 技能 API
- `buff.md` — Buff API
- `item.md` — 道具 API
- `player.md` — 玩家 API
- `timer.md` — 计时器 API
- `point.md` — 点/区域/选择器 API
- `common_errors.md` — 常见错误汇总
- `api_errors.md` — API 使用错误

**UI 相关**（`references/`）：
- `y3-ui-instance.md` — UI 实例方法
- `y3-ui-static.md` — UI 静态方法
- `y3-ui-bindings.md` — 绑定与事件
- `y3-ui-controls.md` — 高级控件（GridView 等）
- `y3-scene-ui.md` — 场景 UI 与 UI Prefab
- `y3-local-ui.md` — 本地 UI
- `layout.md` — 布局规则
- `ui-events.md` — UI 事件规范

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


### 事件监听

> 详细事件绑定见 Part 2.2。此处仅强调文件位置：`maps/EntryMap/script/y3/meta/event.lua`

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

> 基础用法见 Part 1.5 全局快捷函数。补充：

```lua
print("快速调试")   -- 显示在游戏中，上传前记得删除
```

日志在开发模式下写入 `.log/lua_player01.log`（文件名中的数字为玩家编号）。

---

## ⚠️ 重要注意事项

- **禁止直接调用 CAPI** - 始终使用 y3 框架封装，因为 CAPI 可能会变更
- **模型资源** - Lua 中使用的模型/特效必须在表格编辑器中声明才能触发下载
- **定点数** - 所有数值在底层使用定点数以保证帧同步一致性
- **事件系统** - 所有游戏对象支持 `:event()` 方法注册事件回调
- **引用管理** - 通过 `get_by_id()` 或 `get_by_handle()` 获取对象实例

---

## 🚨 API 映射表（强制查阅）

**编写代码前必须查阅此表，避免使用不存在的 API！**

### 数值规范

| 场景 | ❌ 错误值 | ✅ 正确值 | 说明 |
|------|----------|----------|------|
| 技能范围 | `5.0` | `300-500` | Y3 坐标系单位小 |
| 刷怪距离 | `30` | `500` | 需要 3 位数 |
| 刷怪半径 | `5` | `200` | 需要 3 位数 |
| 攻击范围 | `2` | `100-150` | 需要 3 位数 |

---

---

*最后更新: 2026-04-10*
