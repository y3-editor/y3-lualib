---
name: y3-auto-test
description: >
  Y3 自动化测试流程，通过 MCP 工具链实现 UI 控件定位与点击操作。
  
  ALWAYS use this skill when user mentions: 自动化测试、自动点击、
  找到XX按钮并点击、定位XX并点击、桌面操作、窗口操作、UI 自动化、
  开始测试、执行测试计划、跑测试、继续执行测试。
  
  This skill handles automated testing using MCP tool chain:
  y3-helper for UI coordinate detection + desktop-automation for mouse input.
---

# Y3 Auto Test Skill

## 🔴 技能激活时自动读取（首要步骤）

**本技能激活后，开始任何自动化操作之前，必须先读取：**

```
.codemaker/rules/mcp-rules.mdc     ← MCP 调用安全规范（熔断规则、超时处理）
.codemaker/rules/auto-test.mdc     ← 自动化测试执行规则（不停、不跳、不问）
```

> 遵守 MCP 熔断规则：超时不重试，连续失败 2 次后停止！
> 遵守测试执行规则：每个测试点必须执行到尾，失败重试 3 次，上下文不足时生成续接文档！

## 🔧 环境检查（首次使用）

**激活本技能时，必须检查 `desktop-automation` MCP 服务是否可用。**

### 检查方式

尝试调用 `desktop-automation` 的任意工具（如 `bot_get_system_info`），如果返回错误或无法连接，说明未安装。

### 安装方式

`desktop-automation` 是一个 npm 全局包，需通过以下命令安装：

```cmd
npm install -g @cool-mcp/desktop-automation
```

安装后需要在 MCP 配置中添加该服务器。配置示例（CodeMaker / VSCode MCP 配置）：

```json
{
  "desktop-automation": {
    "command": "desktop-automation",
    "args": []
  }
}
```

### 检查是否已安装

```cmd
npm list -g @cool-mcp/desktop-automation
```

> 如果输出包含版本号（如 `@cool-mcp/desktop-automation@1.0.9`），则已安装。
> 如果输出 `(empty)` 或报错，则需要安装。

### ⚠️ 未安装时的提示模板

如果检测到 `desktop-automation` 未安装，向用户输出以下提示：

```
⚠️ 检测到 desktop-automation MCP 服务不可用。
该工具用于桌面自动化操作（鼠标点击、键盘输入等）。

请在终端执行以下命令安装：

  npm install -g @cool-mcp/desktop-automation

安装完成后，请在 MCP 配置中添加该服务器，然后重启 IDE。
```

---

> 桌面自动化测试流程，通过 MCP 工具链（`y3-helper` + `desktop-automation`）实现精确的 UI 控件定位与点击。

## 🎯 触发条件

用户提到以下关键词时触发：
- 自动化测试、自动点击
- 找到XX按钮并点击、定位XX并点击
- 桌面操作、窗口操作
- UI 自动化测试

## ✅ 核心原则

| 原则 | 说明 |
|------|------|
| **首选 y3runtime** | UI 控件点击优先使用 `trigger_ui_touch_event_by_path` 直接触发事件 |
| **备用 desktop-automation** | 非 UI 场景（点击游戏世界位置等）使用 `get_ui_center_in_windows` + `bot_click` |
| **无需管理员权限** | 两种方案均无需管理员权限 |
| **游戏必须运行** | `trigger_ui_touch_event_by_path` 和 `get_ui_center_in_windows` 均需游戏运行中 |

## 🏗️ 架构说明

### ⭐ 首选方案：y3runtime 直接事件触发

```
┌───────────────────┐        ┌──────────────────────┐
│  y3-helper MCP    │        │  y3runtime MCP       │
│                   │        │                       │
│  get_ui_canvas    │──→     │  trigger_ui_touch_    │
│  (确认控件路径)    │  路径   │  event_by_path       │
│                   │──→     │  (直接触发点击事件)    │
└───────────────────┘        └──────────────────────┘
```

**首选工作流程（1~2 步，推荐）：**
1. `get_ui_canvas` → 获取 UI 控件树结构，确认控件路径（可选，已知路径时跳过）
2. `trigger_ui_touch_event_by_path(ui_path, touch)` → 直接触发控件的点击事件

**优势**：无需获取屏幕坐标，不受窗口位置/缩放/遮挡影响，精确可靠。

### 备用方案：y3-helper + desktop-automation（屏幕坐标点击）

```
┌───────────────────┐                    ┌──────────────────────┐
│  y3-helper MCP    │                    │  desktop-automation  │
│                   │                    │  MCP                 │
│  get_ui_canvas    │──→ 控件路径 ──→    │                      │
│  get_ui_center_   │──→ 屏幕坐标 ──→   │  bot_click(x, y)     │
│  in_windows       │                    │                      │
└───────────────────┘                    └──────────────────────┘
```

**备用工作流程（3 步，仅在非 UI 场景或 y3runtime 不可用时使用）：**
1. `get_ui_canvas` → 获取 UI 控件树结构，确认控件路径
2. `get_ui_center_in_windows(path)` → 获取控件中心的 Windows 屏幕绝对坐标
3. `bot_click(x, y)` → 在该坐标执行鼠标点击

## 🚀 使用流程

### 步骤 1：确保游戏运行

```
y3-helper.get_game_status  → 检查游戏是否运行
y3-helper.launch_game      → 如未运行则启动
```

### 步骤 2：获取 UI 控件树（可选，用于确认路径）

```
y3-helper.get_ui_canvas
  - depth: -1          → 完整展开
  - nodePath: "画板名"  → 只看某个画板
```

返回示例：
```
画板: panel_1
└── button_1 [Button] (uid: xxx)
```

### 步骤 3（首选）：直接触发 UI 点击事件

```
y3runtime.trigger_ui_touch_event_by_path
  - ui_path: "panel_1.button_1"   → 画板名.控件路径
  - touch: "左键"                  → "左键" 或 "右键"
```

> ✅ 无需获取屏幕坐标，直接在运行时触发控件事件，精确可靠。

### 步骤 3（备用）：通过屏幕坐标点击

> 仅当需要点击非 UI 区域（如游戏世界位置）或 y3runtime 不可用时使用。

```
# 3a. 获取控件屏幕坐标
y3-helper.get_ui_center_in_windows
  - path: "panel_1.button_1"   → 画板名.控件路径

# 3b. 执行鼠标点击
desktop-automation.bot_click
  - x: <从3a获取>
  - y: <从3a获取>
  - button: "left"
```

> ⚠️ X 坐标可能为负数（多显示器场景），这是正常的。

### 完整示例

```
# ⭐ 首选方案（1 步完成 UI 点击）
trigger_ui_touch_event_by_path(ui_path="panel_1.button_1", touch="左键")
→ 成功触发点击事件

# 备用方案（需要 2 步）
get_ui_center_in_windows(path="panel_1.button_1")
→ { x: -980, y: 551 }
bot_click(x=-980, y=551, button="left")
→ 成功点击
```

## 🛠️ 可用 MCP 工具

### ⭐ y3runtime（首选：运行时 UI 交互）

| 工具 | 功能 | 前置条件 |
|------|------|----------|
| `trigger_ui_touch_event_by_path` | **直接触发 UI 控件点击事件** | ⚠️ 游戏运行中 |
| `get_ui_center_by_path` | 获取 UI 控件中心点屏幕坐标 | ⚠️ 游戏运行中 |

> `trigger_ui_touch_event_by_path` 参数：`ui_path`（控件路径）、`touch`（"左键" 或 "右键"）
> `get_ui_center_by_path` 参数：`ui_path`（控件路径）

### y3-helper（UI 定位 + 游戏管理）

| 工具 | 功能 | 前置条件 |
|------|------|----------|
| `get_game_status` | 检查游戏状态 | 无 |
| `launch_game` | 启动游戏 | 无 |
| `get_ui_canvas` | 获取 UI 控件树 | 地图已加载 |
| `get_ui_center_in_windows` | 获取控件屏幕坐标（备用） | ⚠️ 游戏运行中 |

### desktop-automation（备用：桌面输入操作）

> 仅在非 UI 场景或 y3runtime 不可用时使用。

| 工具 | 功能 | 说明 |
|------|------|------|
| `bot_click` | 鼠标点击 | 支持 left/right/middle，支持双击 |
| `bot_move_mouse` | 移动鼠标 | 移到指定坐标 |
| `bot_drag` | 鼠标拖拽 | 起点→终点 |
| `bot_hotkey` | 快捷键 | 如 "ctrl c" |
| `bot_type_text` | 输入文本 | 末尾加 \n 自动回车 |
| `bot_screenshot` | 截图 | 辅助调试 |

## ⚠️ 注意事项

| 事项 | 说明 |
|------|------|
| **UI 点击优先用 y3runtime** | `trigger_ui_touch_event_by_path` 更简洁、更可靠、不受窗口位置影响 |
| **控件路径格式** | `画板名.控件路径`，如 `CommonTip.bg.btn_mid` |
| **游戏必须运行** | `trigger_ui_touch_event_by_path` 和 `get_ui_center_in_windows` 均需游戏运行 |
| **控件必须可见** | 隐藏的控件可能无法触发事件或返回异常坐标 |
| **备用方案坐标注意** | 使用 desktop-automation 时，每次点击前重新获取坐标，负数坐标是正常的（多显示器） |

### 方案选择指南

| 场景 | 使用方案 |
|------|----------|
| 点击 UI 按钮/控件 | ⭐ `y3runtime.trigger_ui_touch_event_by_path` |
| 获取 UI 控件坐标 | `y3runtime.get_ui_center_by_path` 或 `y3-helper.get_ui_center_in_windows` |
| 点击游戏世界位置（非 UI） | `desktop-automation.bot_click` |
| 键盘输入/快捷键 | `desktop-automation.bot_hotkey` / `bot_type_text` |
| 鼠标拖拽 | `desktop-automation.bot_drag` |
| y3runtime 不可用时 | 回退到 `y3-helper.get_ui_center_in_windows` + `desktop-automation.bot_click` |

## 🔄 备用方案：守护进程架构

> 如果 `bot_click` 在某些特殊场景下对 Y3 窗口无效，可回退到管理员守护进程方案。

### 架构

```
┌──────────────────┐        文件队列         ┌──────────────────────┐
│  VSCode 终端     │  ──── command.json ───→  │  管理员 PowerShell   │
│  (普通权限)      │  ←─── result.json ─────  │  (admin_daemon.ps1)  │
│  send_command.ps1│                          │  mouse_event/SetCur  │
└──────────────────┘                          └──────────────────────┘
```

### 启动守护进程

手动右键打开管理员 PowerShell，执行：

```powershell
cd E:\y3_ai\agentmap
powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\y3-auto-test\admin_daemon.ps1
```

### 发送命令

```cmd
powershell -ExecutionPolicy Bypass -File .\.codemaker\skills\y3-auto-test\send_command.ps1 -Action mouse-click -X 500 -Y 300 -Button left
```

支持动作：`mouse-move` / `mouse-click` / `mouse-drag` / `key` / `ping`

## 📁 文件清单

```
.codemaker/skills/y3-auto-test/
├── SKILL.md                    ← 本文件（技能指南）
├── admin_daemon.ps1            ← 管理员守护进程（备用方案）
├── send_command.ps1            ← 命令发送脚本（备用方案）
└── .queue/                     ← 命令队列目录（备用方案运行时自动创建）

# 已迁移到 y3-game-spec：
# .codemaker/skills/y3-game-spec/gen-test-plan.md  ← 验收标准自动生成规范
```

## ❌ 已验证的变更历史

| 日期 | 变更 |
|------|------|
| 2026-04-07 | 采用守护进程架构（admin_daemon + send_command） |
| 2026-04-08 | ✅ 验证 `bot_click` 可直接对 Y3 窗口生效，无需管理员权限 |
| 2026-04-08 | ✅ 验证 `get_ui_center_in_windows` 可精确获取控件屏幕坐标 |
| 2026-04-08 | ✅ 验证坐标能自适应窗口缩放 |
| 2026-04-08 | 推荐方案变更为：MCP 工具链（get_ui_center_in_windows + bot_click） |
| 2026-04-13 | 🆕 新增 `y3runtime` MCP 服务，提供 `trigger_ui_touch_event_by_path` 直接事件触发 |
| 2026-04-13 | ⭐ 首选方案变更为：y3runtime 直接事件触发，desktop-automation 降为备用方案 |

---

*更新时间: 2026-04-13*
*变更: 新增 y3runtime 为首选 UI 点击方案；desktop-automation 降为备用方案*
