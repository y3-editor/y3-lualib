---
name: y3-ui-pipeline
description: >
  Y3编辑器UI开发统一入口。所有UI相关需求的路由中心，自动分发到子技能。
  
  ALWAYS use this skill when user mentions: 生成UI、创建界面、制作面板、做个UI、做界面、
  肉鸽界面、三选一、抽卡界面、选择界面、弹窗、HUD、菜单、对话框、卡牌选择、技能选择、
  装备选择、道具选择、角色选择、商店界面、背包界面、设置界面、登录界面、排行榜、
  血条、蓝条、技能栏、状态栏、任务面板、成就界面、loading界面、UI交互、按钮点击、
  优化界面、调整布局、美化UI、修改UI代码、UI事件绑定。
  
  This is the SINGLE entry point for ALL UI development. It routes to:
  - y3-ui-json-generator (JSON generation + tree extraction)
  - y3-ui-official (Lua code)
  - y3-ui-beautify (layout/beautify)
---

# Y3 UI 开发自动化管线

自动化完成从需求到UI代码的完整开发流程。

---

## ⚡ 快速执行清单（复制即用）

> **每次执行前先勾选确认！避免遗漏步骤。**

| 步骤 | ☐ | 操作 | 命令/工具 | 输出 |
|------|---|------|----------|------|
| **0** | ☐ | 路径检测 | 检测 `header.project` / `header.map` | `{{map_root_path}}` |
| **1** | ☐ | 生成 UI JSON | `py -3 tree_to_ui_json.py <tree.json> <output.json>` | `ui/*.json` |
| **1.3** | ☐ | 模板后处理 | 自动执行（clone 时内置） | UID 重生成 |
| **1.5** | ☐ | 静态检查 🚨 | 见下方命令 | 错误报告 |
| **1.6** | ☐ | 🎨 询问美化（默认全套美化） | 询问用户是否需要美化（默认是） → `y3-ui-beautify` | 视觉优化 |
| **1.7** | ☐ | 📦 下载图片资源 🔴 | MCP `download_editor_icon_resource` | 资源就绪 |
| **2** | ☐ | 生成 UI 树 | `py -3 gen_ui_tree.py {{workspace}}` | `ui_tree/*_Tree.json` |
| **3** | ☐ | 生成 Lua 代码 | 调用 `y3-ui-official` 技能 | `script/*.lua` |
| **4** | ☐ | 截图验证（可选） | MCP `screenshot_ui_preview` | 布局分析 |
| **5** | ☐ | 热更+保存 🔴 | MCP `hotfix_ui_editor` → **等3秒** → `save_editor` | ✅ 完成 |

### 📋 命令模板

```bash
# ========== 步骤 1: 树状结构 → UI JSON ==========
cd .codemaker/skills/y3-ui-json-generator/pipeline
py -3 tree_to_ui_json.py input_tree.json {{map_root_path}}/ui/{{panel_name}}.json

# ========== 步骤 1.5: 静态检查（强制） ==========
py -3 -c "from static_check import static_check; import json; data=json.load(open('{{map_root_path}}/ui/{{panel_name}}.json','r',encoding='utf-8')); r=static_check(data); print('✅ 通过' if r['passed'] else f'❌ {len(r[\"errors\"])}个错误'); [print(f'  {e[\"path\"]}: {e[\"error\"]}') for e in r.get('errors',[])]"

# ========== 步骤 2: 生成 UI 树 ==========
py -3 gen_ui_tree.py {{workspace}}
# 输出: {{workspace}}/ui_tree/{{panel_name}}_Tree.json
```

### 🔴 MCP 调用顺序（不可乱序！）

```
1. hotfix_ui_editor     ← 热更 UI
2. 等待 3 秒            ← 必须等待！
3. save_editor          ← 保存
```

---

## 🚨 官方组件优先原则（强制）

**在创建 UI 之前，必须先检查是否有官方封装组件可用！**

### 官方封装组件清单

| Type | 组件名 | 用途 | 自动绑定 |
|------|--------|------|---------|
| **17** | **技能按钮** | 技能图标+冷却+按键 | ✅ 自动 |
| **18** | **魔法效果** | Buff 列表显示 | ✅ 自动 |
| **20** | **物品** | 装备/物品槽位 | ✅ 自动 |
| 16 | 地图 | 小地图 | ✅ 自动 |
| 21 | 商店面板 | 商店界面 | ✅ 自动 |

### 使用规则

| 需求 | 正确做法 | 错误做法 |
|------|----------|----------|
| 技能栏 | 使用 `type:17` 技能按钮 | ❌ 手写 Image+Progress+Text |
| Buff 显示 | 使用 `type:18` 魔法效果 | ❌ 手写 Buff 列表 |
| 物品栏 | 使用 `type:20` 物品槽 | ❌ 手写物品格子 |

### 如何添加官方组件

**✅ 现已支持脚本自动生成！无需在编辑器中手动添加！**

在树状结构 JSON 中声明官方组件类型，脚本会自动从模板生成完整结构：

```json
{
  "name": "game_hud",
  "type": "panel",
  "children": [
    {"name": "skill_q", "type": "skill_btn", "slot_id": 1, "shortcut": "Q", "pos_x": 910, "pos_y": 80},
    {"name": "item_1", "type": "item_slot", "slot_id": 1, "pos_x": 1750, "pos_y": 80}
  ]
}
```

然后运行：
```bash
cd .codemaker/skills/y3-ui-json-generator/pipeline
py -3 tree_to_ui_json.py input_tree.json output.json
```

脚本会自动：
- ✅ 从 `templates/skill_btn.json` 加载完整技能按钮结构（~15 子节点）
- ✅ 从 `templates/item_slot.json` 加载完整物品槽结构（~7 子节点）
- ✅ 重新生成所有 UID，更新内部引用关系
- ✅ 应用用户指定的位置和参数

### 参考文档

- 详细说明见：`.codemaker/knowledge/08-官方UI组件.md`
- 官方示例：`y3/演示/demo/界面/主控.lua`
- **脚本文档**：`.codemaker/skills/y3-ui-json-generator/SKILL.md`

---

## 🚫 禁止手写脚本原则（强制）

**在执行任何操作之前，必须先检查是否有现成的工具/脚本可用！**

### 🔴 核心规则

```
需要执行某项操作
    │
    ├─ 1. 先查看已加载的技能说明
    │       └─ 技能中是否提供了相关脚本/工具？
    │
    ├─ 2. 检查 pipeline/ 目录
    │       └─ 是否有现成的 .py 脚本？
    │
    ├─ 3. 如果有现成工具
    │       └─ ✅ 使用现成工具，禁止手写
    │
    └─ 4. 只有确认没有现成工具时
            └─ ⚠️ 才可以考虑编写新脚本
```

### 已有工具清单

| 任务 | 现有工具 | 位置 |
|------|---------|------|
| 生成 UI JSON | `tree_to_ui_json.py` | `y3-ui-json-generator/pipeline/` |
| 静态检查 | `static_check.py` | `y3-ui-json-generator/pipeline/` |
| 生成 UI 树 | `gen_ui_tree.py` | `y3-ui-json-generator/pipeline/` |
| **批量修改/美化** | `patch_ui_json.py` | `y3-ui-beautify/pipeline/` |
| 模板克隆 | `template_matcher.py` | `y3-ui-json-generator/pipeline/` |

### ❌ 禁止行为

| 场景 | 错误做法 | 正确做法 |
|------|----------|----------|
| 需要修改多个 JSON 字段 | 手写 Python 脚本 | 使用 `patch_ui_json.py --config` |
| 需要批量美化 | 手写循环修改代码 | 创建配置文件 + `patch_ui_json.py` |
| 需要生成 UI 结构 | 手写完整 JSON | 使用 `tree_to_ui_json.py` |

### 正确流程示例

```
需要美化 UI
    │
    ├─ ❌ 错误: "文件太长，我来写个脚本批量处理"
    │
    └─ ✅ 正确:
         1. 调用 y3-ui-beautify 技能
         2. 查看技能提供的工具 → 发现 patch_ui_json.py
         3. 创建配置文件（JSON 格式）
         4. 执行: py -3 patch_ui_json.py <json> --config <config>
```

### 触发检查点

**在以下时机必须检查是否有现成工具：**

1. ⏱️ 生成 UI JSON 后，准备修改时
2. ⏱️ 需要批量修改字段时
3. ⏱️ 说出"我来写个脚本"之前
4. ⏱️ 调用 `edit_file` 创建 `.py` 文件之前

---

## 📁 路径变量定义（执行前必读）

### 路径检测规则

在执行管线前，**必须先判断项目根目录类型**：

```
执行路径检测
    │
    ├─ 当前目录有 header.project？
    │       │
    │       ├─ ✅ 是 → 项目级根目录
    │       │       └─ map_root_path = {{workspace}}/maps/EntryMap
    │       │
    │       └─ ❌ 否 → 检查上一级目录
    │               │
    │               ├─ 上一级有 header.map？
    │               │       │
    │               │       ├─ ✅ 是 → 地图级根目录
    │               │       │       └─ map_root_path = 上一级目录
    │               │       │
    │               │       └─ ❌ 否 → ⚠️ 报错
    │               │               └─ 提示：请检查目录结构
```

### 路径变量表

| 变量 | 含义 | 示例值 |
|------|------|--------|
| `{{workspace}}` | 当前工作目录（用户打开的目录） | 由环境自动获取 |
| `{{map_root_path}}` | 地图根目录（包含 ui/、script/ 子目录） | 根据检测规则确定 |
| `{{map_name}}` | 地图名称 | `EntryMap`（项目级）或地图目录名 |
| `{{skills_dir}}` | 技能脚本目录 | `{{workspace}}/.codemaker/skills/` |

### 派生路径

| 用途 | 路径 |
|------|------|
| UI JSON 输出目录 | `{{map_root_path}}/ui/` |
| Lua 脚本输出目录 | `{{map_root_path}}/script/` |
| UI 树输出目录 | `{{workspace}}/ui_tree/` |
| gen_ui_tree.py 脚本 | `{{skills_dir}}/y3-ui-json-generator/pipeline/gen_ui_tree.py` |

### 检测示例

**情况1：项目级根目录**
```
{{workspace}}/
├── header.project     ← 检测到此文件
├── maps/
│   └── EntryMap/      ← map_root_path
│       ├── ui/
│       └── script/
└── skills/
```

**情况2：地图级根目录**
```
{{workspace}}/         ← 当前工作目录（如 script 子目录）
../                    ← 上一级目录
├── header.map         ← 检测到此文件
├── ui/                ← map_root_path = ../
└── script/
```

**情况3：错误 - 无法确定根目录**
```
⚠️ 错误：当前目录未找到 header.project，上一级目录未找到 header.map
请确保在正确的 Y3 项目目录中执行此技能。
```

---

## 🔀 需求路由判断（执行前必读）

在执行管线前，**必须先判断用户需求类型**，选择合适的执行路径：

### 判断流程图

```
用户需求
    │
    ├─ 需求明确？
    │       │
    │       ├─ ✅ 明确 → 按类型路由
    │       │       │
    │       │       ├─ 🆕 新建界面/新增按钮/新功能 → 全流程（本技能）
    │       │       │   例：做一个三选一界面、增加一个按钮
    │       │       │
    │       │       ├─ 🎨 调整布局/美化/换图片 → y3-ui-beautify
    │       │       │   例：调整布局、改位置、改大小、美化、换图片
    │       │       │
    │       │       └─ ⚙️ 修改代码/增加逻辑/修复BUG → y3-ui-official
    │       │           例：增加点击功能、修复按钮不响应
    │       │
    │       └─ ❌ 模糊 → 询问用户
    │               └─ 提供三个选项让用户选择
```

### 需求类型判断表

| 需求类型 | 关键词示例 | 执行路径 |
|----------|-----------|----------|
| **全流程** | 新建、制作、增加按钮、新功能、做一个XX界面 | 本技能（ui-pipeline） |
| **布局/美化/批量修改** | 调整布局、改位置、改大小、美化、换图片、批量改字段 | **y3-ui-beautify** |
| **代码修改** | 增加功能、修改逻辑、修复、点击事件、响应 | y3-ui-official |

### 判断示例

| 用户需求 | 判断结果 | 原因 |
|----------|----------|------|
| "做一个三选一肉鸽界面" | ✅ 全流程 | 从零新建 |
| "增加一个按钮" | ✅ 全流程 | 新增UI元素+功能 |
| "调整这个界面的布局" | 🎨 布局/美化 | → y3-ui-beautify |
| "把按钮位置改一下" | 🎨 布局/美化 | → y3-ui-beautify |
| "把面板改大一点" | 🎨 布局/美化 | → y3-ui-beautify |
| "美化这个UI" | 🎨 布局/美化 | → y3-ui-beautify |
| "换个背景图" | 🎨 布局/美化 | → y3-ui-beautify |
| "给按钮增加点击功能" | ⚙️ 代码修改 | 仅修改Lua |
| "修复按钮点击无响应" | ⚙️ 代码修改 | 仅修改Lua |
| "帮我改一下界面" | ❓ 模糊 | 询问用户 |

### 模糊需求询问模板

当需求不明确时，使用以下选项询问用户：

```
您的需求属于哪种类型？

1. 🆕 全流程（新建界面/新增按钮/新功能）
   → 生成UI JSON + 生成Lua代码

2. 🎨 布局/美化（调整位置/大小/美化/换图片）
   → 调用 y3-ui-beautify 修改现有 UI

3. ⚙️ 代码修改（增加功能/修复BUG）
   → 仅修改Lua代码
```

---

## � 坐标系统参考

**详见**: `.codemaker/knowledge/05-UI字段规范.md`

核心规则：
- 原点在**左下角**，Y 轴向上
- `pos_data: [x, y, x%, y%, use%_x, use%_y]` —— 像素和百分比**二选一**
- `anchor: [0-1, 0-1]` —— 控件自身的定位点
- 子元素坐标基于**父容器左下角**，可超出父容器范围

---

## �🚨 管线规则（必读）

**此技能是一个自动化管线，AI必须按顺序执行以下三个步骤，无需询问用户！**

### 执行流程图

```
用户需求描述
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤0: 路径检测（自动执行）                             │
│ - 检测 header.project / header.map 确定根目录类型       │
│ - 设置 {{map_root_path}} 变量                           │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤1: y3-ui-json-generator                             │
│ - 根据需求生成UI JSON文件                               │
│ - 输出路径: {{map_root_path}}/ui/{panel_name}.json      │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤1.3: 模板后处理（已自动集成！）✅                    │
│ - 模板模式：使用 clone_from_template() 底层自动处理     │
│   UID 重生成 + __tuple__ 转换 + layer_name 设置         │
│ - 命令: py -3 template_matcher.py clone <tpl> <out> <name>│
│ - 兜底: 若绕过了 clone，可手动执行 postprocess_template.py│
│   py -3 openspec/ui_testcase/scripts/postprocess_template.py <json>│
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤1.5: 静态检查（强制执行）🚨🚨🚨                      │
│ - 执行 static_check.py 校验生成的 JSON                  │
│ - 检查项: UID格式/唯一性、type:2规则、alignment枚举     │
│ - 如有错误: 必须修复后才能继续                          │
│ - 详见: y3-ui-json-generator SKILL.md "静态检查"        │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤1.6: 🎨 询问美化（默认全套美化）                      │
│ - 询问用户："是否需要美化这个 UI？"                      │
│ - 默认选项为"全套美化"（推荐），用户可选择跳过          │
│ - 若选择全套美化（默认）：调用 y3-ui-beautify 技能      │
│   - 查阅 IMAGE_ID_REGISTRY.md 选择图片资源              │
│   - 优化视觉层次、交互层、文本对齐                      │
│ - 若选择跳过：继续下一步                                │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤2: 生成UI树                                          │
│ - 处理步骤1生成的JSON，提取UI树结构                     │
│ - 执行: py -3 "{{skills_dir}}/y3-ui-json-generator/pipeline/gen_ui_tree.py" "{{workspace}}"│
│ - 输出: {{workspace}}/ui_tree/{panel_name}_Tree.json    │
│ - 目的: 减少步骤3的token输入量（压缩比约97%）           │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤3: y3-ui-official                                   │
│ - 基于UI树结构生成Lua控制代码                           │
│ - 使用Y3官方API（y3.ui、GameAPI）                       │
│ - 输出: {{map_root_path}}/script/{ui_script_name}.lua   │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ 步骤4: 截图验证（可选，用户选择）                        │
│ - 询问用户是否进行截图验证                              │
│ - 若选择验证：调用 MCP 截图分析布局质量                 │
│ - 检查重点：同级元素重叠、布局合理性                    │
│ - 质量差时静默重试（最多1次）                           │
│ - 详见: y3-ui-json-generator SKILL.md "截图验证流程"    │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────────┐
│ 步骤5: 🔴【强制】热更并保存                                  │
│ ⚠️ 必须先热更再保存，否则生成的内容会丢失！                 │
│ - 调用 y3editor.hotfix_ui_editor（热更UI）                  │
│ - 调用 y3editor.save_editor（保存）                         │
└─────────────────────────────────────────────────────────────┘
    │
    ▼
输出最终结果
```

## 步骤1详细说明：生成UI JSON

**调用技能**: `y3-ui-json-generator`

### 🔴 禁止 AI 手写完整 JSON

**无论何种情况，AI 都禁止直接手写完整的 UI JSON 文件！**

### 生成方式

| 场景 | 方式 | 说明 |
|------|------|------|
| 有匹配模板 | **模板模式** | 使用 `template_matcher.py clone` 安全克隆（自动处理 UID/tuple/layer_name） |
| 无匹配模板 | **树状结构模式** | AI 输出树状结构 → 脚本生成 JSON → AI 修改字段 |

### 树状结构模式流程

```
Step 1.1: AI 设计布局图（ASCII 图示）
    ↓
Step 1.2: AI 输出树状结构 JSON（仅 name/type/children）
    ↓
Step 1.3: 调用 tree_to_ui_json.py 生成完整 JSON
    ↓
Step 1.4: AI 根据布局图修改具体字段（pos_data, size, image 等）
```

### 树状结构脚本调用

```bash
cd .codemaker/skills/y3-ui-json-generator/pipeline
py -3 tree_to_ui_json.py input_tree.json {{map_root_path}}/ui/{panel_name}.json
```

### 输出
- `{{map_root_path}}/ui/{panel_name}.json`

### 管线规则
- **不询问目录**：使用检测到的 `{{map_root_path}}/ui/` 路径
- **不询问实现方式**：直接按流程执行
- **禁止手写完整 JSON**：必须使用模板或脚本生成

> **注意**：详细规则参见 `y3-ui-json-generator` SKILL.md 的"树状结构模式"章节。

## 步骤1.5详细说明：静态检查 🚨🚨🚨

**这是强制步骤，不可跳过！**

### 为什么必须执行？
- 快速模式（Pipeline 脚本）会自动执行校验
- **完整模式（AI 手写 JSON）不会自动校验**
- 跳过此步骤可能导致：UID 重复、alignment 错误、type:2 嵌套等致命问题

### 执行命令
```bash
cd .codemaker/skills/y3-ui-json-generator/pipeline && py -3 -c "from static_check import static_check; import json; data = json.load(open('<生成的JSON路径>', 'r', encoding='utf-8')); result = static_check(data); print('✅ 静态检查通过' if result['passed'] else f'❌ 发现 {len(result[\"errors\"])} 个错误'); [print(f'  [{e[\"path\"]}] {e.get(\"field\", \"N/A\")}: {e[\"error\"]}') for e in result.get('errors', [])]"
```

### 检查项目
| 检查项 | 说明 | 严重程度 |
|--------|------|----------|
| JSON 语法 | 格式是否合法 | 🔴 致命 |
| type:2 规则 | 子节点不能使用 type:2 | 🔴 致命 |
| UID 格式 | 必须是有效 UUID v4 | 🔴 致命 |
| UID 唯一性 | 同文件内不能重复 | 🔴 致命 |
| alignment 枚举 | 水平: 1/2/4, 垂直: 0/8/16 | 🟡 严重 |
| 同级元素重叠 | SkillSlot/EquipSlot 不能重叠超过 50% | 🟡 严重 |

### 如果检查失败
1. 根据错误提示修复 JSON
2. 重新执行静态检查
3. **直到检查通过才能继续步骤2**

> **注意**：详细检查规则参见 `y3-ui-json-generator` 技能文档的"生成后：强制执行静态检查"章节。

## 步骤1.6详细说明：询问美化（默认全套美化）🎨

**在 UI JSON 生成并通过静态检查后，询问用户是否需要美化。默认执行全套美化。**

### 询问模板

使用 `ask_user_question` 工具询问：

```
UI 已生成完成，是否需要对界面进行美化？

选项：
1. ✅ 全套美化（推荐）
   → 优化视觉层次、图片资源、交互层、文本对齐等全部美化项
2. 🎯 仅更换图片资源
   → 查阅 IMAGE_ID_REGISTRY 选择合适的图片
3. ⏭️ 不需要，跳过美化
   → 跳过美化，直接进入下一步
```

> **注意**：默认选项为"全套美化"，排在第一位并标记为（推荐）。如果用户未明确拒绝，则执行全套美化。

### 若选择全套美化（默认）

1. **调用 `y3-ui-beautify` 技能**
2. 美化内容包括：
   - **视觉层次**：标题、背景、卡片层级
   - **图片资源**：查阅 `IMAGE_ID_REGISTRY.md` 选择验证过的图片 ID
   - **交互层**：透明点击区、防遮挡处理
   - **文本对齐**：默认居中对齐

### 若选择跳过

直接继续步骤 2（生成 UI 树）。

### 图片资源速查

美化时常用的图片 ID（完整列表见 `y3-ui-beautify/references/IMAGE_ID_REGISTRY.md`）：

| 用途 | 图片 ID | 说明 |
|------|--------|------|
| 卡牌背景 | `134269971` | 深色卡面 |
| 选中高亮 | `134226134` | 边框高亮 |
| 圆形遮罩 | `134254385` | 头像裁剪 |
| 按钮(蓝) | `134264792` | 功能按钮 |
| 按钮(橙) | `134249578` | 操作按钮 |

## 步骤2详细说明：生成UI树

**工具**: `gen_ui_tree.py`（位于 `y3-ui-json-generator/pipeline/`）

### 执行命令
```bash
py -3 "{{skills_dir}}/y3-ui-json-generator/pipeline/gen_ui_tree.py" "{{workspace}}"
```

### 输入
- 步骤1生成的JSON文件

### 输出
- `{{workspace}}/ui_tree/{panel_name}_Tree.json`

### 作用
将完整UI JSON压缩为简化树结构，减少步骤3的token消耗（压缩比约97%）。

## 步骤3详细说明：生成Lua代码

**调用技能**: `y3-ui-official`

### 输入
- 步骤2生成的UI树结构
- 用户的功能需求

### 输出
- `{{map_root_path}}/script/{ui_script_name}.lua`

> **注意**：Lua 代码规范、API 用法等详细规则参见 `y3-ui-official` 技能文档。

---

## 步骤5详细说明：热更并保存 🔴🔴🔴

**⚠️ 这是强制步骤，不可跳过！**

### 为什么必须执行？

编辑器在运行时使用内存中的数据。如果不先热更（让编辑器重新读取 JSON 文件），直接保存会导致编辑器将**旧的内存数据**覆盖掉**新生成的 JSON 内容**。

### 执行顺序（必须严格遵守）

```
1. 热更 UI（让编辑器读取新的 JSON）
   └─ use_mcp_tool: y3editor.hotfix_ui_editor

2. ⚠️ 等待 3 秒（让编辑器完成内存同步）

3. 保存（让编辑器将内存数据写入 GMP）
   └─ use_mcp_tool: y3editor.save_editor
```

### ⚠️ 重要：热更后必须等待！

**热更后立即保存有概率导致内容丢失！** 编辑器需要时间将 JSON 同步到内存。

### MCP 调用示例

```
# 1. 热更 UI
use_mcp_tool:
  server_name: "y3editor"
  tool_name: "hotfix_ui_editor"
  arguments: {}

# 2. 等待 3 秒（必须！）
# AI 应在此处暂停，或提示用户等待

# 3. 保存
use_mcp_tool:
  server_name: "y3editor"
  tool_name: "save_editor"
  arguments: {}
```

### ❌ 错误做法（会导致内容丢失！）

```
# 错误：只保存不热更
use_mcp_tool:
  server_name: "y3editor"
  tool_name: "save_editor"  ← 直接保存，UI内容会丢失！
  arguments: {}
```

---

## 🚨 自动化执行要点

整个管线流程中，AI **不需要询问用户任何问题**：
- **不询问目录**：使用检测到的路径变量
- **不询问实现方式**：直接按流程执行
- **不询问文件名**：由各子技能自动命名
