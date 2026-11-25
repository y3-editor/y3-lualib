---
name: y3-game-spec
description: >
  Y3 游戏开发全流程编排器，从零开始在 Y3 引擎上制作各类游戏。
  管理「策划案 → 执行案 → 测试案 → 迭代」完整闭环。
  
  ALWAYS use this skill when user mentions: 做一个游戏、开发游戏、游戏规划、
  做个塔防、做个RPG、做个肉鸽、做个MOBA、从零开始做、游戏开发流程。
  
  This is the orchestrator skill for any game development project. It manages
  the full pipeline: spec → plan → test → iterate, routing to sub-skills as needed.
---

# Y3 游戏开发全流程编排器

管理从零开始制作游戏的完整闭环：**策划案 → 执行案 → 制作 → 测试案 → 测试 → 迭代**。

> 📊 **评估报告**：本技能执行时会在 `<agent>/skills/y3-game-spec/report/` 下自动生成评估报告，记录执行过程、token 估算、测试问题及修复情况，并在流程结束时整合为完整流程报告（含 HTML 版本）。

## 🎯 Y3 引擎定位（务必先读）

> **Y3 是一款 2.5D 俯视角、单局制（Match-Based / Session-Based）游戏引擎，定位与玩法形态高度类似《魔兽争霸 III》World Editor。**

| 维度 | 定位 |
|------|------|
| **画面** | 2.5D 俯视角（3D 资产 + 俯视摄像机），不是纯 2D 也不是自由 3D |
| **场次形态** | **单局制**：进入地图 → 一局对战 / 闯关 → 出结算 → 退出，不是 MMO 持久世界 |
| **典型游戏类型** | RTS、塔防、MOBA、ARPG 单局、Roguelike、生存对抗、自走棋、卡牌对战、War3 风格自定义地图 |
| **资源系统** | ✅ **支持导入自定义资源**（模型 / 贴图 / 音效 / 特效 / UI 素材等），同时可使用 Y3 官方资源市场素材 |
| **类比对标** | War3 World Editor / Dota2 Workshop Tools / 星际2 银河编辑器 |

> ⚠️ 推介游戏方向时，必须围绕「2.5D 俯视角 + 单局制」两大特征。
> 边界判断依据见 `feasibility-redlines.md`。

## 📊 评估报告机制（强制执行）

> ⚠️ **以下所有报告钩子为强制步骤，不可跳过。**

### 🔖 Step R0：技能启动时初始化评估文档【强制】

**在执行任何业务步骤（包括 Step 0）之前**，必须先执行：

1. 通过以下命令读取本地系统时间，生成时间戳，保存为本次会话的 `$REPORT_TIMESTAMP`：

```bash
python -c "from datetime import datetime; print(datetime.now().strftime('%Y-%m-%d-%H%M'))"
```

2. 创建文件 `<agent>/skills/y3-game-spec/report/report-$REPORT_TIMESTAMP.md`，写入以下骨架：

```markdown
# GameSpec 评估报告 — $REPORT_TIMESTAMP

## 执行阶段

<!-- 各 Phase 执行记录将追加到此处 -->

## 测试阶段

<!-- 各轮测试记录将追加到此处 -->
```

---

### 🔖 Step R1：每个执行 Phase 开始时【强制】

在阶段 2 的**每个 Phase（Phase 1～Phase 6）开始执行前**，先执行以下命令读取本地时间，再向报告追加：

```bash
python -c "from datetime import datetime; print(datetime.now().strftime('%H:%M'))"
```

```markdown
### Phase N: <阶段名>
- **开始时间**: HH:MM  ← 使用上方命令输出的真实本地时间
- **玩家输入摘要**: <本轮用户需求，不超过 200 字>
```

---

### 🔖 Step R2：每个执行 Phase 结束时【强制】

在阶段 2 的**每个 Phase 完成后**，先执行以下命令读取本地时间，再向报告追加：

```bash
python -c "from datetime import datetime; print(datetime.now().strftime('%H:%M'))"
```

```markdown
- **结束时间**: HH:MM  ← 使用上方命令输出的真实本地时间
- **耗时**: X 分钟  ← 结束时间 - 开始时间
- **Token 估算**: ~NNN（估算，字符数×1.5）
- **执行步骤**: <本阶段主要完成的工作，逗号分隔>
```

---

### 🔖 Step R3：测试阶段每轮交互后【强制】

在阶段 3 的**每轮测试交互（发现问题或验证通过）完成后**，先执行以下命令读取本地时间，再向报告追加：

```bash
python -c "from datetime import datetime; print(datetime.now().strftime('%H:%M'))"
```

```markdown
### 测试轮次 N
- **时间**: HH:MM  ← 使用上方命令输出的真实本地时间
- **玩家输入摘要**: <本轮用户描述，不超过 200 字>
- **Token 估算**: ~NNN（估算）
- **发现问题**:
  | 问题描述 | 类型 | 发生阶段 | 修复状态 |
  |---------|------|---------|---------|
  | ...     | ...  | ...     | ✅ 已修复 / ❌ 未修复 / ⚠️ 已绕过 |
```
> 若本轮无新问题，写入：`✅ 本轮验证通过，无新增问题`

---

### 🔖 Step R4：测试验收完成后——快照 + 总结【强制】

在阶段 3 **测试验收全部完成**（无未修复问题）后，**立即**执行以下两步：

**Step R4-A：创建测试报告快照**

将当次生成的测试报告文件（`openspec/docs/{gameName}测试报告-*.md` 中最新的一份）完整复制到：
`<agent>/skills/y3-game-spec/report/test-snapshot-$REPORT_TIMESTAMP.md`

**Step R4-B：生成完整流程 HTML 报告**

读取 `report-$REPORT_TIMESTAMP.md` + `test-snapshot-$REPORT_TIMESTAMP.md`，将两份文档的**全部内容**按三部分结构合并，**直接生成 HTML 文件**：
`<agent>/skills/y3-game-spec/report/full-report-$REPORT_TIMESTAMP.html`

> ⚠️ **不得精简或总结任何内容**，原始记录全部保留，仅做排版整合。无需生成中间 MD 文件。

使用以下 Python 脚本完成：

```python
# 执行命令（在工程根目录）：
python -c "
import markdown, pathlib
ts = '$REPORT_TIMESTAMP'
report_md = pathlib.Path(f'<agent>/skills/y3-game-spec/report/report-{ts}.md').read_text(encoding='utf-8')
snapshot_md = pathlib.Path(f'<agent>/skills/y3-game-spec/report/test-snapshot-{ts}.md').read_text(encoding='utf-8')

# 从 report 中提取执行阶段和测试阶段内容
exec_section = report_md.split('## 测试阶段')[0].replace('## 执行阶段', '').strip()
test_section = report_md.split('## 测试阶段')[1].strip() if '## 测试阶段' in report_md else ''

combined = f'''# GameSpec 全流程报告 — {ts}

---

## 第一部分：执行阶段

{exec_section}

---

## 第二部分：测试阶段

{test_section}

---

## 第三部分：测试报告原文

{snapshot_md}
'''

body = markdown.markdown(combined, extensions=['tables', 'fenced_code'])
html = f'''<!DOCTYPE html>
<html lang=\"zh-CN\">
<head>
<meta charset=\"utf-8\">
<title>GameSpec 全流程报告 — {ts}</title>
<style>
  body {{ font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; max-width: 960px; margin: 40px auto; padding: 0 20px; color: #333; }}
  h1 {{ border-bottom: 2px solid #0066cc; padding-bottom: 8px; }}
  h2 {{ border-bottom: 1px solid #ddd; padding-bottom: 4px; color: #0066cc; }}
  h3 {{ color: #444; }}
  table {{ border-collapse: collapse; width: 100%; margin: 16px 0; }}
  th, td {{ border: 1px solid #ddd; padding: 8px 12px; text-align: left; }}
  th {{ background: #f5f5f5; font-weight: bold; }}
  tr:nth-child(even) {{ background: #fafafa; }}
  code {{ background: #f4f4f4; padding: 2px 6px; border-radius: 3px; font-family: monospace; }}
  pre {{ background: #f4f4f4; padding: 16px; border-radius: 6px; overflow-x: auto; }}
  hr {{ border: none; border-top: 2px solid #eee; margin: 32px 0; }}
</style>
</head>
<body>{body}</body>
</html>'''

out = pathlib.Path(f'<agent>/skills/y3-game-spec/report/full-report-{ts}.html')
out.write_text(html, encoding='utf-8')
print(f'HTML 报告已生成：{out}')
"
```

> 若 `markdown` 库未安装，先执行：`pip install markdown`

> 最终三个文件（`report-*`、`test-snapshot-*`、`full-report-*.html`）共享同一 `$REPORT_TIMESTAMP`，可追溯对应关系。

---

## 🔀 模式选择（Full Mode / Patch Mode）

| 维度 | Full Mode（从零制作） | Patch Mode（增量迭代） |
|------|----------------------|----------------------|
| **入口** | "做一个游戏"、"做个塔防" | "修改"、"优化"、"添加功能" |
| **前置文档** | 必须生成策划案→执行案 | 生成增量三件套 |
| **流程** | 阶段 1→2→3 完整闭环 | 增量策划→执行→测试 完整闭环 |
| **文档产出** | 完整三件套 | 增量三件套（独立保存） |
| **测试** | 完整测试案 + 测试报告 | 增量测试案 + 测试 |
| **记录** | 完整文档 + memory | 增量文档 + memory |
| **详细流程** | 见下方阶段 1/2/3 | 见 `patch-mode.md` |

### 模式触发词

| 触发词 | 模式 |
|--------|------|
| 做一个游戏、做个塔防、从零开始、全新开发 | Full Mode |
| 修改、修 Bug、调整数值、优化性能 | Patch Mode |
| 添加新功能、丰富内容、增加系统、扩展玩法 | Patch Mode |
| 只改 UI、只改 Lua、只改物编 | Patch Mode |

---

## 🚦 前置步骤

### Step -1：核对工程现状（执行案的「✅ 已完成」不可信）

执行案里的「✅ 完成 / 已导入 / 已生成」标记**反映的是规划时的状态，不是当前磁盘的状态**。
实测遇到过：执行案写着「模板已导入、装饰物物编已在工程内」，实际是干净工程
（地形是默认的、无装饰物、无单位、`editor_table/*` 全空）。

开工前先花 30 秒核对，避免按错误前提铺开：

```powershell
# 物编数量（0 = 干净工程）
Get-ChildItem "maps\EntryMap\editor_table\editorunit","maps\EntryMap\editor_table\abilityall" -File | Measure-Object
# 地形/装饰物（空 = 模板未导入）
(Get-Item "maps\EntryMap\decorationdata.data").Length
# 已有触发器与逻辑节点
Get-Content "maps\EntryMap\global_trigger\trigger\index.txt"
Get-Content "maps\EntryMap\logicres.json"
```

> 发现不一致时**先向用户确认**是按「从零做」还是「补差量」，再决定走 Full Mode 还是 Patch Mode。

**在进入任何模式（Full Mode / Patch Mode）执行任务之前，必须先执行以下步骤：**

### Step 0：确认编辑器自动保存已关闭

> ⚠️ **此步骤已迁移至 `y3-env-setup` 自动执行**。环境配置完成后，自动保存默认已关闭。

如果用户反馈遇到文件冲突问题，可手动检查：
```
调用 y3editor.modify_editor_config(config_type="close_auto_save")
```

| 项目 | 说明 |
|------|------|
| **为什么** | 避免 AI 修改文件时与编辑器自动保存冲突，导致数据丢失或覆盖 |
| **配置位置** | `y3-env-setup` Step 5（永久配置，编辑器重启后仍生效） |

| 文件 | 作用 | 何时读取 |
|------|------|---------|
| **SKILL.md**（本文件） | 全流程总览 + 配置管理 + 引擎速查 | 技能激活时 |
| **patch-mode.md** ⭐ | Patch Mode 增量迭代详细流程（完整三件套） | 进入 Patch Mode 时 |
| **game-design-guide.md** | 阶段 1 策划案引导（Step 1-9 完整流程） | Full Mode 进入阶段 1 时 |
| **feasibility-redlines.md** | Y3 引擎能力边界清单 | Full Mode Step 1.5 + Step 2~7 |
| **phase-2-execution.md** | 阶段 2 执行案 + API 预检 + 制作 | Full Mode 进入阶段 2 时 |
| **y3-auto-test** (skill) | 阶段 3 测试全流程（Gate 准入 + 测试案生成 + 执行 + 报告） | Full Mode 进入阶段 3 时激活 |
| **examples/** | 代码示例（塔防、羁绊面板等） | 制作阶段参考 |

---

## ⚙️ 配置文件（spec-config.json）

> **路径**：`../../spec-config.json`（相对于本文件）
> 用户可通过此文件自定义四类文档的输出路径和 HTML 报告设置。

### 文件命名规则（强制）

| 文档类型 | 文件名模板 | 示例 |
|----------|-----------|------|
| 策划案 | `{gameName}设计案.md` | `示例设计案.md` |
| 执行案（单文档） | `{gameName}执行案.md` | `示例执行案.md` |
| 执行案（多文档主控） | `{gameName}执行案_主控.md` | `示例执行案_主控.md` |
| 执行案（多文档子文档） | `{gameName}执行案_{Phase/模块名}.md` | `示例执行案_Phase3.md` |
| 测试案 | `{gameName}测试案.md` | `示例测试案.md` |
| 测试报告 | `{gameName}测试报告-{timestamp}.md` | `示例测试报告-2026年4月14日11时12分54秒.md` |

> 多文档拆分详见 `phase-2-execution.md` §3「多文档拆分」。大型项目（F-ID > 30 或 Phase 3/4 跨 3+ 独立模块）推荐使用。

---

## 🔄 Full Mode 全流程总览

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      Y3 游戏开发全流程                                    │
└─────────────────────────────────────────────────────────────────────────┘

  阶段 1                阶段 2                     阶段 3
  策划案                 执行案 + 制作               测试案 + 测试
┌──────────┐     ┌───────────────────┐     ┌───────────────────┐
│ 用户描述  │────▶│ 拆分为执行案       │────▶│ 转换为测试案       │
│ ↓        │     │ ↓                 │     │ ↓                 │
│ 生成策划案 │     │ API 预检          │     │ Gate 准入          │
│ ↓        │     │ ↓                 │     │ ↓                 │
│ 可行性收束 │     │ 按 Phase 逐步制作  │     │ 按 T-xx 逐项测试  │
│ ↓        │     │ (路由到子技能)     │     │ (自动化验收)       │
│ 用户确认  │     │ ↓                 │     │ ↓                 │
│          │     │ 一致性校验         │     │ 一致性校验 + 报告  │
└──────────┘     └───────────────────┘     └────────┬──────────┘
      ▲                                              │
      │            ┌─────────────────┐               │
      └────────────│  迭代循环        │◀──────────────┘
                   └─────────────────┘
```

---

## 📋 阶段 1：生成策划案

> 📘 **详细引导流程**：`game-design-guide.md`

### 输出物
`{paths.designDoc}/{gameName}设计案.md`

### 流程概要
Step 1 游戏类型 → Step 1.2 Roadmap 复用询问（🆕 仅塔防/生存且需求模糊时触发）→ Step 1.5 边界校验 → Step 2-8 引导 → Step 9 冲突检测 → Step 10 结构校验 → 用户确认

### 策划案章节（11 章）
游戏概述 → 核心规则 → 单位清单 → 战斗系统 → 经济与成长 → UI 布局 → 游戏流程 → 数值设计 → 功能优先级 → 技术可行性 → 视听细节

---

## 📋 阶段 2：执行案 + 制作

> 📘 **详细规范**：`phase-2-execution.md`

### Phase 划分

| Phase | 内容 | 使用技能 |
|-------|------|----------|
| Phase 1 | 物编准备 + 场景模板匹配 | `y3-obj-edit` + `y3-terrain-template` |
| Phase 2 | UI 开发 | `y3-ui-pipeline` |
| Phase 3 | 核心玩法（Lua / 纯 ECA） | `y3-lua-pipeline` / `y3-eca-pipeline` |
| Phase 4 | 扩展机制（Lua / 纯 ECA） | `y3-lua-pipeline` / `y3-eca-pipeline` |
| Phase 5 | Lua 审查 / ECA 对账 | `y3-lua-review` / `y3-eca-pipeline` |
| Phase 6 | 测试验收 | `y3-auto-test` ⚠️ **强制走完整流程** |

> Phase 3/4 从策划案第 2~7 章提取，按「核心玩法」和「扩展机制」分配。详见 `phase-2-execution.md` 动态 Phase 速查表。
> 纯 ECA 路线（全程零 Lua）统一走 `y3-eca-pipeline`；Lua 路线走 `y3-lua-pipeline`，两条路线不要混用。

### 功能模板支持（可选增强）

> 当 `<agent>/templates/ReadMe.md` 存在已通过验证的模板时，可在 Phase 1~2 之间插入模板匹配和导入流程。模板机制不替代原有流程；没有可用模板或匹配失败时，行为与旧流程等价。

1. **加载模板目录**：读取 `<agent>/templates/ReadMe.md`。无可用模板则跳过本章节。
2. **逐模块模板匹配**：遍历执行案功能清单，匹配模板的能力标签/依赖/适用场景。
3. **模板分支**：匹配成功 → `y3editor.import_ui` 导入 `.upui` + `y3-lua-pipeline` 融合 `logic.lua`。
4. **常规分支**：匹配失败 → 继续走原有 `y3-ui-pipeline` + `y3-lua-pipeline`。
5. **高风险目录**：模板导入或融合影响 `editor_table/`、`global_script/`、`maps/` 时，必须在执行案和测试案中显式标记。

> ⚠️ **Phase 6 强制规则**：
> - **必须激活 `y3-auto-test` 技能**，由该技能完整执行：Gate 准入（Gate 1A/1B/2/2.5/3）→ 测试案生成 → 一致性校验 → 启动测试 → 报告生成
> - **禁止跳过 Gate 准入直接冒烟测试**（禁止直接用 `launch_game` + `execute_lua` 探测代替完整测试流程）
> - **禁止在未激活 `y3-auto-test` 的情况下进行任何测试操作**
> - 若 Phase 5 Lua 审查发现严重问题，需修复后才能进入 Phase 6

---

## 📋 阶段 3：测试案 + 测试

> ▶️ **激活 `y3-auto-test` 技能**，由该技能完整负责以下全流程：

Gate 准入（Gate 1A/1B/2/2.5/3）→ 测试案生成 → 一致性校验 → 启动测试 → Step Final 报告生成

---

## 🔁 迭代循环

| 问题类型 | 判定标准 | 回到哪个阶段 |
|----------|---------|-------------|
| 策划级 | 功能缺失、规则矛盾 | 阶段 1 |
| 开发级 | API 错误、逻辑 Bug | 阶段 2 |
| 测试级 | 用例覆盖不足 | 阶段 3 |

---

## ⚠️ 关键规则（强制）

### 技能路由（不可绕过）

| 任务 | 唯一入口 |
|------|----------|
| 所有 UI 开发（无模板匹配） | `y3-ui-pipeline` |
| 模板 `.upui` 导入 | `y3editor.import_ui`（由 `y3-game-spec` 模板分支编排） |
| 所有 Lua 代码（含模板 `logic.lua` 融合/适配） | `y3-lua-pipeline` |
| 所有 ECA 触发器 / ECA 函数 / ECA 变量 | `y3-eca-pipeline` |
| Lua 审查 | `y3-lua-review` |
| ECA 交付前对账 / 状态探针 | `y3-eca-pipeline` |
| 物编生成 | `y3-obj-edit` |
| 自动化测试 | `y3-auto-test` |

### 核心禁令

| ❌ 禁止 | ✅ 正确做法 |
|---------|-----------|
| 臆造 API | 查阅 `y3/` 源码验证 |
| 手写 JSON 物编 | 使用 `y3-obj-edit` 脚本生成 |
| 跳过热更直接保存 | hotfix → 等 3 秒 → save |
| 绕过 API 预检 | 执行案生成后必须预检 |
| **代码动态创建逻辑节点** | **场景逻辑节点必须通过专用 MCP 创建：点→`add_point`、路径→`add_point_path`、区域→`add_rect_area`/`add_circle_area`，代码仅通过 `get_xxx_by_res_id` 引用。禁止用 `entity_create_block`（那是装饰物用的）** |

---

## 🎮 Y3 引擎速查

### 玩家编号
| 编号 | 用途 |
|------|------|
| 1-12 | 普通玩家 |
| 31 | 中立敌对（怪物） |
| 32 | 中立友好（NPC） |

### Y3 坐标系
```
Y-（北/上）↑
X-（西）←┼→ X+（东）
Y+（南/下）↓
```

---

## 📚 参考资源

| 资源 | 路径 |
|------|------|
| 配置文件 | `<agent>/spec-config.json` |
| 代码示例 | `skills/y3-game-spec/examples/` |
| API 验证 | `maps/EntryMap/script/y3/` |
| 错题集 | `<agent>/memory/lua-issues/` |

---

*最后更新：合并 Incremental Mode 到 Patch Mode，所有增量迭代统一走完整流程*
