---
name: y3-auto-test
description: >
  Y3 自动化测试流程，通过 MCP 工具链实现 UI 控件定位与点击操作。
  
  ALWAYS use this skill when user mentions: 自动化测试、自动点击、
  找到XX按钮并点击、定位XX并点击、UI 自动化、
  开始测试、执行测试计划、跑测试、继续执行测试。
  
  This skill handles automated testing using MCP tool chain:
  y3-helper for game control and UI interaction.
---

# Y3 Auto Test Skill

## 🔴 激活后必须先读取

```
../../rules/mcp-rules.mdc     ← MCP 熔断规则
../../rules/auto-test.mdc     ← 测试执行纪律（不停、不跳、不问）
```

---

## 🚪 Gate 准入（进入测试前必过）

| Gate | 检查项 | 失败处理 |
|------|--------|---------|
| **1A** | 策划案：`{gameName}设计案.md` / fallback `GameDesign.md` | ❌ 降级为普通测试 |
| **1B** | 执行案：`{gameName}执行案.md` / fallback `ExecPlan.md` | ❌ 降级为普通测试 |
| **2** | 测试案：`{gameName}测试案.md` / fallback `AutoTestPlan.md` | 不存在 → 按本技能目录下 `gen-test-plan.md` 规范生成；存在 → `doc-consistency.mdc` 规则2校验 |
| **2.5** | 测试模式（`ask_user_question` 确认）：开发+测试 / 纯测试 / 指定Phase | — |
| **3** | 清理范围确认（**开发+测试模式才进入**，`ask_user_question` 确认，⛔禁止未经确认直接清理） | — |

**测试模式差异**

| 维度 | 开发+测试 | 纯测试 |
|------|---------|--------|
| Step 0 清理 | ✅（Gate 3 确认） | ⛔ 跳过 |
| Phase 开发任务 | ✅（调用子技能） | ⛔ 跳过 |
| Phase 验收 + Step 5 回归 + Step Final 报告 | ✅ | ✅ |

---

## 🛠️ 测试工具路由

| 测试类型 | 工具 |
|---------|------|
| 物编数据校验 | `read_file` |
| UI 控件验证 | `helper.get_ui_canvas` |
| Lua 语法检查 | `helper.read_problems_lua` |
| 冒烟 / 运行时数据 | `helper.launch_game` + `helper.execute_lua` + `helper.get_logs` |
| UI 点击交互 | `helper.trigger_ui_touch_event_by_path` |
| 截图存证 | `helper.capture_screenshot` |

> ⚠️ 静态数据（物编/UI结构）用静态工具；运行时行为才用 `execute_lua`。

---

## 🚀 执行步骤

**1. 确保游戏运行**
```
helper.get_game_status → 未运行则 helper.launch_game
```
> 启动后轮询 `helper.get_game_status` 直到返回 `running`（`y3-helper` MCP 常驻，无需刷新连接）。

**2. （可选）获取控件路径**
```
helper.get_ui_canvas  depth:-1  nodePath:"画板名"
```

**3. 触发 UI 点击**
```
helper.trigger_ui_touch_event_by_path
  ui_path: "panel_1.button_1"   ← 画板名.控件路径
  touch:   "左键"
```

---

## 📊 Step Final：报告生成

**前置**：按 `doc-consistency.mdc` 规则3 + `auto-test.mdc` 规则6.5 做测试案→报告交叉校验。

**输出两份报告**（路径来自 `spec-config.json`）：
- `{paths.testReport}/{gameName}测试报告-{timestamp}.md`
- `{paths.htmlReport}/{gameName}测试报告-{timestamp}.html`

**生成 HTML**：
```bash
python scripts/gen_test_report_html.py "{md报告路径}"
```
> 若 `svn.autoUpload = true`，脚本自动提交 SVN。

---

## 📁 关联文件

| 文件 | 用途 |
|------|------|
| `rules/auto-test.mdc` | 测试执行纪律 |
| `rules/mcp-rules.mdc` | MCP 熔断规则 |
| `rules/doc-consistency.mdc` | 四文档追溯链校验 |
| `skills/y3-auto-test/gen-test-plan.md` | 测试案自动生成规范 |


*更新时间: 2026-04-23*
