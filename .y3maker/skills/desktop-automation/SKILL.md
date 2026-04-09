---
name: desktop-automation
description: >
  桌面自动化测试流程，通过 Editor MCP 获取 UI 控件坐标进行精确点击操作。
  
  ALWAYS use this skill when user mentions: 自动化测试、自动点击、
  找到XX按钮并点击、定位XX并点击、桌面操作、窗口操作、UI 自动化。
  
  This skill handles desktop automation tasks including getting UI element coordinates
  via Editor MCP, mouse control, and window management.
---

# Desktop Automation Skill

## 🔴 技能激活时自动读取（首要步骤）

**本技能激活后，开始任何自动化操作之前，必须先读取：**

```
.codemaker/rules/mcp-rules.mdc     ← MCP 调用安全规范（熔断规则、超时处理）
```

> 遵守 MCP 熔断规则：超时不重试，连续失败 2 次后停止！

---

> 桌面自动化测试流程，通过 Editor MCP 获取 UI 控件坐标进行精确点击操作。

## 🎯 触发条件

用户提到以下关键词时触发：
- 自动化测试、自动点击
- 找到XX按钮并点击、定位XX并点击
- 桌面操作、窗口操作
- UI 自动化测试

## ⚠️ 前置条件

- **游戏必须全屏运行**（确保 UI 坐标与屏幕坐标一致）
- Y3 编辑器在左侧显示器（X 坐标为负数）

## � 坐标系说明

### 多显示器布局

```
        左侧显示器（副屏）          主显示器（右侧）
    ┌─────────────────────┬─────────────────────┐
    │                     │                     │
    │   X: -1920 ~ 0      │    X: 0 ~ 1920      │
    │                     │                     │
    │   Y3 编辑器/游戏     │    (0,0) 原点       │
    │                     │                     │
    └─────────────────────┴─────────────────────┘
```

- **主显示器原点 (0,0)**：在两屏交界处的左上角
- **左侧显示器**：X 坐标为**负数**（-1920 到 0）
- **Y3 游戏全屏**：占据整个左侧显示器

### UI 坐标转屏幕坐标

当游戏全屏运行时（1920x1080）：
```
屏幕坐标 X = UI 坐标 X - 1920
屏幕坐标 Y = UI 坐标 Y
```

## � 标准工作流程

```
┌─────────────────────────────────────────────────────────────┐
│                    自动化点击流程                            │
├─────────────────────────────────────────────────────────────┤
│  1. 📍 获取控件坐标 ────────────────────────────────────── │
│     │  使用 Editor MCP 获取 UI 控件的屏幕坐标              │
│     │  工具: y3editor.get_ui_element_position              │
│     │  输入: 控件路径（如 "HUDPanel.Btn_Exit"）            │
│     │  输出: 屏幕绝对坐标 (x, y)                           │
│     ▼                                                       │
│  2. 🖱️ 移动鼠标 ─────────────────────────────────────────── │
│     │  使用 MCP bot_move_mouse 移动到目标位置              │
│     │  支持负坐标（左侧显示器）                             │
│     ▼                                                       │
│  3. 👆 点击 ─────────────────────────────────────────────── │
│        使用 PowerShell 脚本执行点击（管理员权限）           │
│        不传坐标参数，在当前鼠标位置点击                      │
└─────────────────────────────────────────────────────────────┘
```

## 🛠️ 工具清单

### Editor MCP 工具 (y3editor)

| 工具 | 功能 |
|------|------|
| `get_ui_element_position` | 获取 UI 控件的屏幕坐标（开发中） |

> ⚠️ 此工具正在开发中，将返回控件的屏幕绝对坐标

### Desktop MCP 工具 (desktop-automation)

| 工具 | 功能 |
|------|------|
| `bot_move_mouse` | 移动鼠标到指定坐标（支持负坐标） |
| `bot_activate_window` | 激活/聚焦窗口 |
| `bot_list_windows` | 列出所有窗口 |
| `bot_wait` | 等待指定毫秒 |

### 本地脚本（管理员权限点击）

| 脚本 | 路径 | 功能 |
|------|------|------|
| `mouse_clicker.ps1` | `.codemaker/skills/desktop-automation/` | PowerShell 版，使用 mouse_event API |
| `mouse_clicker.py` | `.codemaker/skills/desktop-automation/` | Python 版，使用 SendInput API |

> ⚠️ **重要**: 必须以**管理员权限**运行才能点击 Y3 窗口！

### 辅助工具

| 脚本 | 路径 | 功能 |
|------|------|------|
| `screenshot_with_cursor.py` | `.codemaker/tools/` | 截图并标记鼠标位置（调试用） |
| `draw_grid.py` | `.codemaker/tools/` | 在截图上绘制坐标网格（调试用） |

## 📝 详细步骤指南

### 步骤 1: 获取 UI 控件坐标

```json
// MCP 调用 (y3editor)
{
  "tool": "get_ui_element_position",
  "arguments": {
    "control_path": "HUDPanel.Btn_Exit"
  }
}
```

预期返回:
```json
{
  "success": true,
  "screen_x": -220,
  "screen_y": 100,
  "width": 80,
  "height": 30
}
```

### 步骤 2: 移动鼠标

```json
// MCP 调用 (desktop-automation)
{
  "tool": "bot_move_mouse",
  "arguments": {
    "x": -220,
    "y": 100
  }
}
```

### 步骤 3: 点击（管理员权限）

**两步分离法**：MCP 移动鼠标 + PowerShell 点击（不传坐标）

```cmd
powershell -Command "Start-Process -FilePath 'powershell.exe' -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File \"E:\y3_ai\agentmap\.codemaker\skills\desktop-automation\mouse_clicker.ps1\" -Delay 0' -Verb RunAs -Wait"
```

参数说明:
- `-Delay 0`: 立即执行，不等待
- 不传 `-X`, `-Y`: 在当前鼠标位置点击
- `-Verb RunAs`: 请求管理员权限

## 🔄 完整示例流程

**任务: 点击游戏内的退出按钮**

```
1. 获取控件坐标
   → y3editor.get_ui_element_position { control_path: "CommonTip.Btn_Confirm" }
   → 返回: { screen_x: -220, screen_y: 100 }
   
2. 移动鼠标
   → bot_move_mouse { x: -220, y: 100 }
   
3. 点击（管理员权限，不传坐标）
   → powershell -Command "Start-Process ... mouse_clicker.ps1 -Delay 0 -Verb RunAs -Wait"
```

## � 调试工具

### 截图验证鼠标位置

```bash
py -3.13 E:\y3_ai\agentmap\.codemaker\tools\screenshot_with_cursor.py E:\y3_ai\agentmap\.codemaker\tools\screenshot_temp.png
```

输出示例:
```
Screenshot saved: E:\y3_ai\agentmap\.codemaker\tools\screenshot_temp.png
Cursor embedded at screen position: X=-220, Y=100
```

### 绘制坐标网格（辅助定位）

```bash
py -3.13 E:\y3_ai\agentmap\.codemaker\tools\draw_grid.py <截图> --offset-x -1920 -g 200
```

## 📁 已知控件坐标

| 控件 | 屏幕坐标 | 说明 |
|------|----------|------|
| Y3 编辑器"退出"按钮 | (-220, 100) | 工具栏退出按钮 |

> 更多坐标通过 Editor MCP 动态获取

## ⚠️ 注意事项

### 为什么用 PowerShell 点击而不是 MCP bot_click？

- MCP `bot_click` 在某些受保护的应用（如 Y3 编辑器）上会被拦截
- PowerShell 脚本使用 Windows 底层 `mouse_event` API，以管理员权限运行可以绕过拦截

### 为什么分离移动和点击？

- `mouse_clicker.ps1` 脚本不支持负坐标参数（检查 `$X -ge 0`）
- MCP `bot_move_mouse` 支持负坐标
- 所以：MCP 移动到目标位置 → PowerShell 在当前位置点击

### 游戏必须全屏

- Editor MCP 返回的是 UI 坐标
- 只有全屏运行时，UI 坐标才能直接转换为屏幕坐标
- 窗口化运行时需要额外计算窗口偏移

## 🐛 常见问题

### Q: 点击没有反应？
1. 确认终端有管理员权限
2. 确认游戏窗口已全屏
3. 确认坐标正确（用截图工具验证）

### Q: 坐标偏差很大？
1. 检查游戏是否全屏运行
2. 检查多显示器布局是否正确
3. 使用 `draw_grid.py` 绘制网格辅助定位

### Q: PowerShell 报错 "You must provide both -X and -Y"？
- 这是因为传了负数坐标参数
- 解决方案：不传坐标参数，让脚本在当前鼠标位置点击

---

*更新时间: 2026-04-03*
*变更: 移除图像识别，改用 Editor MCP 获取控件坐标*