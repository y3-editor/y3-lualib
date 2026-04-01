---
name: y3-ui-pipeline
description: >
  Y3编辑器UI开发统一入口。所有UI相关需求的路由中心，分发到子技能。
  
  ALWAYS use this skill when user mentions: 生成UI、创建界面、制作面板、做个UI、做界面、
  肉鸽界面、三选一、抽卡界面、选择界面、弹窗、HUD、菜单、对话框、卡牌选择、技能选择、
  装备选择、道具选择、角色选择、商店界面、背包界面、设置界面、登录界面、排行榜、
  血条、蓝条、技能栏、状态栏、任务面板、成就界面、loading界面、UI交互、按钮点击、
  优化界面、调整布局、美化UI、修改UI代码、UI事件绑定。
  
  This is the SINGLE entry point for ALL UI development. It routes to:
  - y3-ui-generator (UI JSON generation)
  - y3-ui-official (Lua code reference)
---

# Y3 UI 开发管线

三步完成从需求到 UI 代码的完整开发流程。

---

## 执行流程

```
用户需求描述
    │
    ▼
┌───────────────────────────────────────────────────┐
│ 步骤 1: 生成 UI JSON                              │
│ - 调用 y3-ui-generator 技能                       │
│ - 从用户需求生成 HTML 预览 → 转换为 Y3 JSON       │
│ - 热更到编辑器 → 清理临时文件                     │
│ - 输出: maps/EntryMap/ui/{panel_name}.json        │
└───────────────────────────────────────────────────┘
    │
    ▼
┌───────────────────────────────────────────────────┐
│ 步骤 1.5: 生成 UI 树（自动执行）                   │
│ - 运行 gen_ui_tree.py 提取简化树结构               │
│ - 输出: ui_tree/{panel_name}_Tree.json            │
│ - 目的: 为步骤 2 提供控件路径参考（压缩比~97%）   │
└───────────────────────────────────────────────────┘
    │
    ▼
┌───────────────────────────────────────────────────┐
│ 步骤 2: 编写 Lua 代码                             │
│ - 参考 y3-ui-official 技能中的 API 和示例          │
│ - 读取 ui_tree/*_Tree.json 获取控件路径            │
│ - 使用 Y3 官方 API（y3.ui、GameAPI）              │
│ - 输出: maps/EntryMap/script/{script_name}.lua    │
└───────────────────────────────────────────────────┘
    │
    ▼
完成
```

---

## 步骤 1: 生成 UI JSON

**调用技能**: `y3-ui-generator`

该技能会自动完成以下工作：
1. 根据用户描述设计 UI 结构草图
2. 生成 HTML 预览文件
3. 调用 `html_to_y3_ui.py` 转换为 Y3 JSON
4. 在浏览器中打开 HTML 预览
5. 热更 UI 编辑器（`y3editor.hotfix_ui_editor`）
6. 删除 HTML 临时文件

**输出**: `maps/EntryMap/ui/{panel_name}.json`

> 详细流程和规范见 `y3-ui-generator` SKILL.md。

---

## 步骤 1.5: 生成 UI 树

**工具**: `gen_ui_tree.py`（位于本技能目录 `.codemaker/skills/y3-ui-pipeline/`）

UI JSON 生成后，**自动执行**此步骤，将完整 JSON 压缩为简化树结构，供步骤 2 编写 Lua 代码时查阅控件路径。

### 执行命令

```bash
py -3 "{{workspace}}/.codemaker/skills/y3-ui-pipeline/gen_ui_tree.py" "{{workspace}}"
```

### 脚本行为

1. 扫描 `maps/EntryMap/ui/` 下所有 `.json` 文件（含 `ui/prefab/` 子目录）
2. 自动检测文件类型（Canvas / Prefab）
3. 提取每个节点的 `name`、`uid`、`type` 和 `children` 层级关系
4. 输出到 `{{workspace}}/ui_tree/{文件名}_Tree.json`

### 输入 / 输出

| 项目 | 路径 |
|------|------|
| 输入 | `maps/EntryMap/ui/*.json`、`maps/EntryMap/ui/prefab/*.json` |
| 输出 | `ui_tree/{panel_name}_Tree.json`、`ui_tree/{prefab_name}_Tree.json` |

### 输出示例

```json
{
  "name": "orpghud",
  "uid": "abc123...",
  "type": 2,
  "children": [
    {
      "name": "widget_skill_bar",
      "uid": "def456...",
      "type": 7,
      "children": [
        { "name": "skill_q", "uid": "...", "type": 17 }
      ]
    }
  ]
}
```

### 为什么需要这一步？

- 完整 UI JSON 通常有数千行，直接读取会消耗大量 token
- Tree JSON 仅保留层级关系，压缩比约 **97%**
- 步骤 2 编写 Lua 代码时，读取 Tree JSON 即可获取所有控件的点号路径（如 `widget_skill_bar.skill_q`）

---

## 步骤 2: 编写 Lua 代码

**参考技能**: `y3-ui-official`

编写 UI 相关的 Lua 代码时，参考 `y3-ui-official` 技能中提供的 API 文档和示例。

### 🔴 控件路径查找优先级（必须遵守）

1. **优先读取** `ui_tree/{panel_name}_Tree.json` 获取控件层级和路径
2. **仅当 Tree JSON 不存在时**，才回退到读取完整 `ui/*.json` 文件

### 核心 API

| 功能 | API |
|------|-----|
| 获取控件 | `y3.ui.get_ui(player, "panel.child")` |
| 获取子控件 | `ui:get_child("path.to.child")` |
| 创建控件 | `ui:create_child('图片'\|'文本'\|'按钮'\|'进度条')` |
| 显示/隐藏 | `ui:set_visible(bool)` |
| 设置文本 | `ui:set_text(str)` |
| 设置图片 | `ui:set_image(id)` |
| 设置位置 | `ui:set_pos(x, y)` |
| 百分比定位 | `GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, x%, y%)` |
| 事件绑定 | `ui:add_fast_event('左键-按下', callback)` |

### 事件绑定示例

```lua
local btn = panel:get_child("button_confirm")
btn:add_fast_event('左键-按下', function(trg)
    panel:set_visible(false)
end)
```

### 计时器

```lua
y3.ltimer.loop(interval, function(timer, count)
    -- 每隔 interval 秒执行
end)

y3.ltimer.wait(delay, function(timer, count)
    -- delay 秒后执行一次
end)
```

> 完整 API 参考和高级用法见 `y3-ui-official` SKILL.md 及其 `references/` 目录下的文档。

---

## 需求路由

| 用户需求 | 执行路径 |
|----------|----------|
| 新建界面 / 做一个XX面板 | 步骤 1 → 1.5 → 2（全流程） |
| 仅修改 Lua 代码 / 修复 BUG | 仅步骤 2（参考 y3-ui-official） |
| 仅生成 UI JSON / 不需要代码 | 仅步骤 1 → 1.5 |

---

## 路径约定

| 用途 | 路径 |
|------|------|
| UI JSON 输出 | `maps/EntryMap/ui/` |
| UI 树输出 | `ui_tree/` |
| Lua 脚本输出 | `maps/EntryMap/script/` |
| gen_ui_tree.py | `.codemaker/skills/y3-ui-pipeline/gen_ui_tree.py` |

---

## 热更 + 保存（MCP 调用顺序）

UI JSON 生成后必须热更，否则编辑器内容会丢失：

```
1. y3editor.hotfix_ui_editor   ← 热更 UI
2. 等待 3 秒                   ← 必须等待
3. y3editor.save_editor         ← 保存
```

---

## 🚨 自动化执行要点

整个管线流程中，AI **不需要询问用户任何问题**：
- **不询问目录**：使用检测到的路径变量
- **不询问实现方式**：直接按流程执行
- **不询问文件名**：由各子技能自动命名
- **步骤 1.5 自动执行**：UI JSON 生成后立即运行 gen_ui_tree.py，无需询问