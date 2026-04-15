---
name: y3-lua-review
description: >
  Y3 Lua 代码审查技能，对项目中所有游戏业务 Lua 文件执行系统性检查。
  覆盖基础语法、API 合规、事件合规、已知问题匹配，支持自动修复。
  
  ALWAYS use this skill when user mentions: 代码审查、Lua审查、代码检查、
  review代码、检查Lua、审查代码、代码质量、API检查、检查API臆造、
  代码review、lua review、检查代码质量。
  
  This skill reviews existing Lua code for correctness. It does NOT write new code
  (use y3-lua-pipeline for that).
---

# Y3 Lua Review

对项目中所有游戏业务 Lua 代码执行系统性审查，发现并修复 API 臆造、事件参数错误、语法问题。

## 🔴 技能激活时自动读取（首要步骤）

**本技能激活后，执行审查之前，必须先读取以下文件：**

```
1. .codemaker/rules/api-safety.mdc          ← API 安全规则 + 常见错误速查
2. .codemaker/memory/lua-issues/api_issues.md ← 已知 API 错误模式（当前 10 条）
3. .codemaker/memory/lua-issues/trace_issues.md ← 运行时 trace 错误（如存在）
```

> 这些文件是审查的**核心知识库**，包含所有已知错误模式，必须在 Phase 3 中逐一比对。

---

## 📋 审查总览

```
┌─────────────────────────────────────────────────────────────────┐
│                    Y3 Lua Review 四阶段流程                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Phase 1: 审查范围确定                                          │
│  ├── 脚本目录检测（EntryMap/script 或 global_script）           │
│  ├── 扫描 .lua 文件列表                                        │
│  └── 排除 y3/ 框架目录                                         │
│           │                                                     │
│           ▼                                                     │
│  Phase 2: 基础语法检查                                          │
│  ├── end 匹配（function/if/for/while/do）                      │
│  ├── require/include 路径一致性                                 │
│  └── CRITICAL 语法错误 → 阻断该文件后续检查                    │
│           │                                                     │
│           ▼                                                     │
│  Phase 3: API 合规审查                                          │
│  ├── API 方法存在性（对照 references + y3 源码）                │
│  ├── 事件名验证（对照 meta/event.lua）                         │
│  ├── 事件参数名验证（data.xxx 对照 lua_name）                  │
│  ├── 参数类型检查（已知类型陷阱）                              │
│  └── 已知错误模式匹配（api_issues.md 10 条）                   │
│           │                                                     │
│           ▼                                                     │
│  Phase 4: 汇总报告 + 修复                                      │
│  ├── CRITICAL / WARNING / INFO 分级                            │
│  ├── 确定性修复 → 自动应用（用户确认后）                       │
│  ├── 非确定性修复 → 输出建议                                   │
│  └── 新问题归档 → lua-issues                                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Phase 1: 审查范围确定

### 1.1 脚本目录检测（强制）

与 `y3-lua-pipeline` 相同的检测流程：

```
┌──────────────────────────────────────────────────────────────┐
│ □ 步骤1: list_files_top_level("maps/EntryMap/script")       │
│          检查是否包含 "y3" 目录                               │
│                                                              │
│ □ 步骤2: 如果找到 y3 目录                                    │
│          ✅ 业务代码根目录 = maps/EntryMap/script/           │
│          ✅ require 方式 = include 'module'                   │
│          → 跳过步骤3                                         │
│                                                              │
│ □ 步骤3: 如果未找到，检查 global_script/                     │
│          ✅ 业务代码根目录 = global_script/map/              │
│          ✅ require 方式 = require 'map.module'              │
└──────────────────────────────────────────────────────────────┘
```

### 1.2 文件扫描

**扫描规则：**

```
1. 使用 glob_search("**/*.lua") 在业务代码根目录下查找所有 .lua 文件
2. 排除以下目录：
   - y3/          ← 框架源码，不审查
   - .log/        ← 日志文件
   - test*/       ← 测试临时目录（如有）
3. 记录文件列表和总数，输出到审查报告
```

### 1.3 用户指定范围

**如果用户指定了审查范围**（如 "审查 game/ 目录" 或 "检查 rpg_game.lua"）：
- 仅扫描指定范围内的 `.lua` 文件
- 在报告中标注 "部分审查（用户指定范围）"

**如果未指定范围**：
- 扫描全部业务代码

---

## Phase 2: 基础语法检查

对每个文件执行以下检查：

### 2.1 end 匹配检查

**检查方法**：逐文件阅读，统计以下关键字的开闭配对：

| 开始关键字 | 结束关键字 |
|-----------|-----------|
| `function` | `end` |
| `if` | `end` |
| `for` | `end` |
| `while` | `end` |
| `do` | `end` |

**注意排除**：
- 字符串内的关键字（`"function"` 不算）
- 注释内的关键字（`-- function` 不算）
- 单行 `if ... then ... end` 算一对

**问题分级**：`end` 不匹配 → **CRITICAL**

### 2.2 require/include 路径一致性

| 脚本根目录 | 正确方式 | 错误方式 |
|-----------|---------|---------|
| `maps/EntryMap/script/` | `include 'module'` | `require 'map.module'` |
| `global_script/` | `require 'map.module'` | `include 'module'` |

**问题分级**：路径方式不匹配 → **WARNING**

### 2.3 语法错误阻断

- 发现 **CRITICAL** 级语法错误的文件，标记为 `[SYNTAX_ERROR]`
- 该文件 **跳过 Phase 3**，在报告中注明原因

---

## Phase 3: API 合规审查

对通过 Phase 2 的每个文件执行以下检查：

### 3.1 API 方法存在性验证

**检查方法**：

```
对代码中每个 y3.xxx:method() 或 y3.xxx.method() 调用：
    │
    ├─ 1. 在 y3-lua-pipeline/SKILL.md Part 3 API 参考中查找
    │     └─ 找到 → ✅ PASS
    │
    ├─ 2. 在 y3-lua-pipeline/references/*.md 中查找
    │     └─ 找到 → ✅ PASS
    │
    ├─ 3. 使用 grep_search 在 y3/ 源码中搜索函数定义
    │     └─ 找到 → ✅ PASS（标注来源）
    │
    └─ 4. 以上都未找到
          └─ → ❌ CRITICAL: API 臆造
```

**特别关注的高频臆造模式**（来自 api_issues.md）：

| # | 错误 API | 正确 API | 出处 |
|---|----------|----------|------|
| 1 | `player:is_playing()` | `player:is_alive()` | api_issues #1 |
| 2 | `player:get_ui(path)` | `y3.ui.get_ui(player, path)` | api_issues #2 |
| 5 | `player:get_res_num(name)` | `player:get_attr(name)` | api_issues #5 |
| 6 | `point:get_distance(other)` | `point:get_distance_with(other)` | api_issues #6 |
| 7 | `unit:revive(point)` | `unit:reborn(point)` | api_issues #7 |

### 3.2 事件名验证

**检查方法**：

```
对代码中每个 :event('事件名', ...) 调用：
    │
    ├─ 1. 在 y3/meta/event.lua 中搜索该事件名
    │     └─ 找到 → ✅ PASS
    │
    └─ 2. 未找到
          └─ → ❌ CRITICAL: 事件名臆造
```

**常用事件名速查**（用于快速验证）：
- 游戏：`'游戏-初始化'`、`'游戏-开始'`、`'游戏-结束'`
- 单位：`'单位-死亡'`、`'单位-受到伤害后'`、`'单位-造成伤害后'`、`'单位-进入区域'`、`'单位-施放技能'`
- 键盘：`'键盘-按下'`、`'键盘-释放'`
- 鼠标：`'鼠标-按下'`
- 技能：`'技能-获得'`、`'技能-失去'`、`'技能-冷却结束'`
- Buff：`'效果-获得'`、`'效果-失去'`、`'效果-层数变化'`
- 物品：`'物品-获得'`、`'物品-使用'`、`'物品-失去'`

### 3.3 事件参数名验证

**检查方法**：

```
对事件回调中使用的 data.xxx：
    │
    ├─ 1. 确定所属事件名
    ├─ 2. 在 event.lua 中查找该事件的 event_params
    ├─ 3. 检查 xxx 是否匹配某个 param 的 lua_name
    │     └─ 匹配 → ✅ PASS
    │
    └─ 4. 不匹配
          └─ → ❌ CRITICAL: 事件参数臆造
```

**高频错误参数名**：

| ❌ 错误 | ✅ 正确 | 事件 |
|---------|---------|------|
| `data.killer` | `data.source_unit` | 单位-死亡 |
| `data.target` | `data.target_unit` | 单位-造成伤害后 |
| `data.source` | `data.source_unit` | 单位-受到伤害后 |

### 3.4 参数类型检查

**检查以下已知类型陷阱**（api_issues #10）：

| API | ❌ 错误传参 | ✅ 正确传参 |
|-----|-----------|-----------|
| `get_abilities_by_type(type)` | 字符串 `'英雄'` | `y3.const.AbilityType['英雄']` |
| `remove_ability(type, slot)` | 字符串 `'普通'` | `y3.const.AbilityType['普通']` |

**检查方法**：搜索 `get_abilities_by_type` 和 `remove_ability` 的调用，检查第一个参数是否为字符串字面量。

### 3.5 已知错误模式匹配

**逐一匹配 api_issues.md 中的全部错误模式**：

```
对每条 api_issues 记录：
    1. 提取错误 API 签名（如 "player:is_playing()"）
    2. 在审查文件中搜索该签名
    3. 如果匹配 → CRITICAL，引用 "api_issues #N"
```

**完整匹配表**（基于当前 10 条记录）：

| # | 搜索模式 | 分级 |
|---|----------|------|
| 1 | `player:is_playing()` | CRITICAL |
| 2 | `player:get_ui(` | CRITICAL |
| 4 | `KeyboardKey['1']` 或 `KeyboardKey['KEY_F` | WARNING |
| 5 | `player:get_res_num(` | CRITICAL |
| 6 | `point:get_distance(` (不带 _with) | CRITICAL |
| 7 | `unit:revive(` | CRITICAL |
| 8 | (需人工判断 UI 路径完整性) | WARNING |
| 9 | `y3.ui.set_ui_event_callback(` | CRITICAL |
| 10 | `get_abilities_by_type('` 或 `remove_ability('` | CRITICAL |

---

## Phase 4: 汇总报告 + 修复

### 4.1 审查报告模板

```markdown
## Lua Review Report

**审查时间**: YYYY-MM-DD HH:MM
**审查范围**: 全量 / 用户指定（目录/文件）
**文件总数**: N 个
**通过文件**: N 个
**问题文件**: N 个

### Summary

| 维度 | CRITICAL | WARNING | INFO |
|------|----------|---------|------|
| 语法 | 0 | 0 | 0 |
| API 合规 | 0 | 0 | 0 |
| 事件合规 | 0 | 0 | 0 |
| 已知问题 | 0 | 0 | 0 |
| **合计** | **0** | **0** | **0** |

### Issues

#### [CRITICAL] 文件名:行号 — 问题类别
- **问题**: 具体描述
- **原因**: 为什么是错误的
- **修复**: 具体修复方案
- **参考**: api_issues #N / references/xxx.md / y3 源码

#### [WARNING] 文件名:行号 — 问题类别
- **问题**: 具体描述
- **建议**: 修复建议

### Auto-Fix Summary
- 可自动修复: N 个
- 需手动修复: N 个
- [x] 文件:行号 — 已自动修复（用户确认后）
- [ ] 文件:行号 — 需手动处理

### 审查结论
- ✅ 无 CRITICAL 问题，代码质量合格
- ⚠️ 存在 N 个 CRITICAL 问题，必须修复后才能交付
```

### 4.2 问题分级标准

| 级别 | 标准 | 后果 |
|------|------|------|
| **CRITICAL** | API 臆造（方法不存在）、事件名不存在、事件参数名不存在、已知错误模式匹配、参数类型错误 | **必须修复**，代码无法正常运行 |
| **WARNING** | 参数类型疑似错误（不确定）、API 在 references 中未找到但源码中可能存在、require 路径方式不一致、键盘常量格式可疑 | **建议修复**，可能导致问题 |
| **INFO** | 编码风格建议、未使用的变量、日志打印残留 | **可选修复**，不影响运行 |

### 4.3 确定性自动修复表

以下问题有明确的 1:1 替换方案，可自动修复：

| 错误模式 | 自动替换为 | 来源 |
|----------|-----------|------|
| `player:is_playing()` | `player:is_alive()` | api_issues #1 |
| `player:get_res_num(X)` | `player:get_attr(X)` | api_issues #5 |
| `point:get_distance(X)` | `point:get_distance_with(X)` | api_issues #6 |
| `unit:revive(X)` | `unit:reborn(X)` | api_issues #7 |
| `get_abilities_by_type('TYPE')` | `get_abilities_by_type(y3.const.AbilityType['TYPE'])` | api_issues #10 |
| `remove_ability('TYPE', SLOT)` | `remove_ability(y3.const.AbilityType['TYPE'], SLOT)` | api_issues #10 |
| `data.killer` (在单位-死亡事件中) | `data.source_unit` | 事件参数规范 |
| `data.target` (在伤害事件中) | `data.target_unit` | 事件参数规范 |
| `data.source` (在伤害事件中) | `data.source_unit` | 事件参数规范 |

**非确定性修复**（仅输出建议）：
- `player:get_ui(path)` → 建议改为 `y3.ui.get_ui(player, path)`（需确认 player 变量作用域）
- `y3.ui.set_ui_event_callback(...)` → 建议改为先获取 UI 对象再 `add_fast_event`（需重构代码结构）
- API 方法不存在但无明确替代 → 建议用户确认需求

### 4.4 修复前确认流程

```
┌─────────────────────────────────────────────────────────────┐
│ 修复确认流程                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ 1. 输出审查报告（Phase 4.1 模板）                          │
│                                                             │
│ 2. 列出所有可自动修复的问题：                              │
│    "以下 N 个 CRITICAL 问题可自动修复：                     │
│     - rpg_game.lua:280 — get_abilities_by_type 参数类型     │
│     - battle.lua:45 — unit:revive → unit:reborn             │
│     是否执行自动修复？"                                     │
│                                                             │
│ 3. 用户确认后，使用 replace_in_file 批量修复               │
│                                                             │
│ 4. 修复完成后，在报告中标记 [Auto-Fixed]                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 4.5 lua-issues 归档规则

```
审查完成后：
    │
    ├─ 发现新的 API 错误模式（api_issues.md 中未记录）？
    │   ├─ 是 → 追加到 api_issues.md，编号递增
    │   └─ 否 → 跳过
    │
    ├─ 发现新的 trace 错误？
    │   ├─ 是 → 追加到 trace_issues.md
    │   └─ 否 → 跳过
    │
    └─ 已有记录的问题？
        └─ 在报告中引用 "api_issues #N"，不重复归档
```

---

## ⚠️ 重要约束

1. **只审查，不编写新功能代码** — 代码编写由 `y3-lua-pipeline` 负责
2. **不审查 y3/ 框架源码** — 只审查用户业务代码
3. **不做运行时测试** — 那是 `y3-auto-test` 的职责
4. **不审查 UI JSON** — 那是 `y3-ui-pipeline` 的职责
5. **自动修复仅限确定性替换** — 复杂修复只输出建议

---

## 🔗 数据源引用

本技能不维护独立的 references 目录，直接引用以下数据源：

| 数据源 | 路径 | 用途 |
|--------|------|------|
| API 白名单 | `.codemaker/skills/y3-lua-pipeline/references/*.md` (22 文件) | API 存在性校验 |
| API 快速参考 | `.codemaker/skills/y3-lua-pipeline/SKILL.md` Part 3 | API 签名速查 |
| 已知错误库 | `.codemaker/memory/lua-issues/api_issues.md` | 错误模式匹配 |
| Trace 错误库 | `.codemaker/memory/lua-issues/trace_issues.md` | Trace 模式匹配 |
| 事件参数大全 | `y3/meta/event.lua` | 事件名+参数名校验 |
| 常量枚举 | `y3/game/const.lua` | 枚举值校验 |
| API 安全规则 | `.codemaker/rules/api-safety.mdc` | 常见错误速查 |

---

*最后更新: 2026-04-10*