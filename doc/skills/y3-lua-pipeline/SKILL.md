---
name: y3-lua-pipeline
description: >
  用于编写 Y3 游戏的所有 Lua 代码，包括游戏逻辑、系统开发、事件处理、技能效果实现，
  UI 交互代码（使用 y3.ui 和 GameAPI），以及功能模板 `logic.lua` 的融合、适配与审查。
  
  ALWAYS use this skill when user mentions: 写Lua代码、游戏逻辑、事件处理、技能效果、
  Buff效果、伤害计算、死亡判定、单位创建、刷怪逻辑、AI行为、定时器、触发器、
  数据存储、存档读档、计分系统、关卡逻辑、胜负判定、玩家初始化、
  UI代码、UI事件绑定、UI交互、按钮点击、界面逻辑。
  
  This skill handles ALL Lua code including game logic, UI interaction code,
  and template `logic.lua` integration/adaptation.
---

# Y3 Lua Pipeline

## 🔴 技能激活时自动读取（首要步骤）

**本技能激活后，编写任何代码之前，必须先读取以下文件：**

```
1. ../../rules/api-safety.mdc     ← API 安全规则 + 常见错误表
2. ../../memory/lua-issues/       ← Lua 错题本（如存在）
```

> 这些文件包含 API 臆造预防规则和历史错误记录，可有效避免重复犯错。

用于编写 Y3 游戏非 UI 相关的 Lua 代码，包括游戏逻辑、系统开发、事件处理。

## 🧩 功能模板 Lua 集成规则

当 `y3-game-spec` 将模块标记为 `template-backed` 并提供模板 `logic.lua` 时，本技能仍是唯一 Lua 入口，必须按以下规则融合模板 Lua：

1. **禁止直接粘贴后跳过审查**：模板 `logic.lua` 必须经过本技能的 API 合规、事件合规、目录检测、静态检查与运行验证。
2. **硬编码处理**：检查并处理对象 ID、UI 路径、玩家编号、地图路径、全局变量名、资源名等硬编码。
   - 能参数化的必须参数化；
   - 必须绑定项目值的，写入“项目级映射”；
   - 无法确认的，暂停询问用户。
3. **来源边界**：生成/融合后的 Lua 必须保留模块来源信息：
   - `template-backed: <template-id>` 或 `custom-built`；
   - 模板文件路径（如适用）；
   - 对应的预留入口/模块槽位（例如 `modules.<module_id>.init()`）；
   - 项目级适配点；
   - 与其他模块的调用边界。
4. **API 安全**：模板中任何 Y3 API 和事件都必须在 references 或 y3 源码中验证；未验证 API 必须拒绝、替换或标记为待用户确认。
5. **UI 路径校验**：模板依赖 `.upui` 时，必须读取导入后的 UI 节点树，确认 `logic.lua` 使用的 UI 路径真实存在。
6. **交付报告**：Completion Report 的“影响范围”和“变更文件”必须说明模板来源、适配内容、是否影响 `global_script/` 或 `maps/`。

---

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
**根目录下的 `script/` 不是有效的脚本目录，游戏无法加载！**


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

## 🔒 强制执行清单（Execution Checklist, MUST）

> 以下清单为 Lua 任务硬门禁执行项。任何一项未完成，不得标记任务完成。

- [ ] **路由确认**：当前任务已进入 `y3-lua-pipeline`（UI Lua 场景由 `y3-ui-pipeline` 子路由；模板 Lua 场景由 `y3-game-spec` 模板分支路由）
- [ ] **模板来源确认**：若为 `template-backed` 模块，已记录模板 ID、模板路径、`logic.lua`、`.upui`、项目级适配点
- [ ] **脚本目录确认**：已确认实际脚本根目录（`maps/EntryMap/script` 或 `global_script`）
- [ ] **前置阅读完成**：已阅读 `memory/lua-issues/`（`api_issues.md`、`trace_issues.md`，如存在）与对应 `references/`
- [ ] **API 合规验证**：新增/修改的每个 API 调用均已在 `y3/` 源码或 references 中验证存在性与参数
- [ ] **代码实现完成**：Lua 文件已按规范修改并放置在正确目录
- [ ] **静态检查通过**：已执行 Lua 问题检查（如 `read_problems_lua`）且无阻断错误
- [ ] **运行时验证通过**：已完成至少 1 轮标准测试循环（状态检查 → 启动/重启 → 等待日志 → trace 检查）
- [ ] **记忆归档完成**：若出现 Lua 相关问题且存在 `memory/lua-issues/`，已按类别归档至 `lua-issues`（API/Trace）
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
| `y3.ctimer` | `y3/util/client_timer` | 客户端计时器 |
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

### 1.6 事件绑定

#### 事件名查找流程（强制）

1. 在 `y3/meta/event.lua` 中搜索事件的**中文名**（如 `"单位-死亡"`）
2. 查看该事件的 `event_params` 字段
3. 每个参数包含 `lua_name`（Lua 中使用的参数名）和 `lua_type`（类型）
4. 在代码中使用 `data.lua_name` 访问参数

#### 事件回调签名

所有事件回调格式为 `function(trg, data)`：
- `trg`：触发器对象
- `data`：事件参数表（字段由 event.lua 定义）

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
