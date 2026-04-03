---
name: y3-ui-pipeline
description: |
  Y3 UI 完整工作流管理技能。当用户需要创建 UI 时自动触发此流程。
  触发词：生成UI、创建界面、做个UI、UI面板、HUD、英雄选择界面、商店界面、技能栏、背包界面等。
  工作流程：1. 调用 y3-ui-generator 生成 UI JSON → 2. 调用 gen_ui_tree.py 生成节点树（供 Lua 查询）
---

# Y3 UI Pipeline（UI 完整工作流）

当用户需求涉及 UI 生成时，**必须使用此工作流**，而非直接调用子技能。

## 🔄 工作流程

```
用户 UI 需求
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 环节 1: 生成 UI JSON                                        │
│                                                             │
│ 激活 skill: y3-ui-generator                                 │
│ 输入: 用户的 UI 描述                                         │
│ 输出: maps/EntryMap/ui/{PanelName}.json                     │
│ （内部自动执行热更 + 保存）                                  │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 环节 2: 生成 UI 节点树                                       │
│                                                             │
│ 执行: python gen_ui_tree.py "<map_root_path>"               │
│ 输入: 地图根目录                                             │
│ 输出: ui_tree/{PanelName}_Tree.json                         │
│ 用途: 供 Lua 代码查询 UI 结构（节点名、uid、type）           │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
完成（可继续编写 Lua 代码操作 UI）
```

## 📋 环节 1: 生成 UI JSON

**使用 `y3-ui-generator` skill**

此环节负责：
- 理解用户的 UI 需求描述
- 生成 HTML 布局预览（可选）
- 转换为 Y3 UI JSON 文件

详细指南见 `y3-ui-generator/SKILL.md`

## 📋 环节 2: 生成 UI 节点树

**执行脚本生成简化树结构**

### 为什么需要节点树？

| 原始 UI JSON | 节点树 JSON |
|-------------|------------|
| 3000+ 行 | ~150 行 |
| 包含所有视觉属性 | 仅 name/uid/type |
| 难以快速查询结构 | 一目了然的层级 |

### 执行命令

```bash
python ".codemaker/skills/y3-ui-pipeline/gen_ui_tree.py" "e:\ai_dev\y3_ai\agentmap"
```

### 输出位置

- 输入：`maps/EntryMap/ui/*.json`
- 输出：`ui_tree/*_Tree.json`

### 节点树示例

```json
{
  "name": "HeroSelectPanel",
  "uid": "abc123",
  "type": 2,
  "children": [
    {
      "name": "block",
      "uid": "def456",
      "type": 7,
      "children": [
        {
          "name": "main_frame",
          "uid": "ghi789",
          "type": 7,
          "children": [
            { "name": "hero_1", "uid": "jkl012", "type": 7 },
            { "name": "hero_2", "uid": "mno345", "type": 7 }
          ]
        }
      ]
    }
  ]
}
```

### 用途：Lua 路径查询

有了节点树，编写 Lua 代码时可以快速确定正确的 UI 路径：

```lua
-- 查看节点树后确定路径：HeroSelectPanel.block.main_frame.hero_1
local hero1 = y3.ui.get_ui(player, "HeroSelectPanel.block.main_frame.hero_1")
```

**⚠️ 常见错误：路径缺少中间层级（如忘记 `block`）**

## 🎯 触发关键词

当用户请求包含以下关键词时使用本技能：

- 生成UI、创建界面、做个UI、UI面板
- HUD、血条、技能栏、背包、商店
- 英雄选择界面、设置界面、主菜单
- 弹窗、对话框、提示框
- 任何与 UI/界面相关的需求

## 📁 目录结构

```
.codemaker/skills/y3-ui-pipeline/
├── SKILL.md              # 本文件（工作流说明）
└── gen_ui_tree.py        # 节点树生成脚本

maps/EntryMap/ui/         # UI JSON 文件
├── HeroSelectPanel.json
├── GameHUD.json
└── ...

ui_tree/                  # 生成的节点树
├── HeroSelectPanel_Tree.json
├── GameHUD_Tree.json
└── ...
```

## 🔗 UI 组件类型速查

| type | 名称 | type | 名称 | type | 名称 |
|------|------|------|------|------|------|
| 0 | Node | 1 | Button | 2 | Layer |
| 3 | TextLabel | 4 | Image | 5 | Progress |
| 6 | Model | 7 | Layout | 8 | TabWidget |
| 10 | ScrollView | 11 | Slider | 14 | Background |
| 15 | InputField | 16 | MiniMap | 17 | SkillBtn |
| 25 | GridView | 26 | RichText | 29 | ComboBox |
| 33 | PageView | 35 | Spine | 46 | CheckBox |
| 50 | Joystick | 51 | Video | 52 | Audio |
| 65 | UICanvas（根节点） | 67 | CycleList | 74 | SplendorNode |

## ⚠️ 注意事项

1. **必须按顺序执行**：先生成 UI JSON，再生成节点树
2. **节点树仅供参考**：不要手动修改节点树文件
3. **UI JSON 变更后**：需要重新运行 gen_ui_tree.py 更新节点树
4. **Lua 路径规则**：使用点号分隔，如 `Panel.block.child.grandchild`

## 🔗 关联技能

| 技能 | 用途 |
|------|------|
| `y3-ui-generator` | 生成 UI JSON（本流程环节 1） |
| `y3-ui-official` | 编写 UI Lua 代码（事件绑定、显示隐藏等） |
| `y3-lua-pipeline` | 编写非 UI 游戏逻辑代码 |

---

*最后更新: 2026-04-03*
