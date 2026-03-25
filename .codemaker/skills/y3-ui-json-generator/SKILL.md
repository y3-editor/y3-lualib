---
name: y3-ui-json-generator
description: >
  Y3编辑器UI界面JSON文件生成器（y3-ui-pipeline 子技能）。
  
  ⚠️ 此技能通常由 y3-ui-pipeline 内部调用，不直接触发。
  
  功能：生成符合Y3规范的UI面板、布局、按钮、文本、图片等组件的JSON配置。
  
  触发路径：用户UI需求 → y3-ui-pipeline → 本技能
---

# UI JSON Generator

为 Y3 编辑器生成符合规范的 UI JSON 配置文件。

---

## ✅ 官方组件自动生成（已集成！）

**`tree_to_ui_json.py` 脚本已集成 `template_matcher.py`，自动从模板生成完整的官方封装组件！**

### 支持的官方组件

| 需求类型 | 官方组件 | 树状结构类型 | 可用参数 |
|----------|----------|-------------|----------|
| 技能按钮 | type:17 | `skill_btn` | `slot_id`, `shortcut`, `pos_x`, `pos_y` |
| 物品槽 | type:20 | `item_slot` | `slot_id`, `pos_x`, `pos_y` |
| Buff槽 | type:19 | `buff_slot` | `slot_id`, `pos_x`, `pos_y` |
| **Prefab 预制体** | type:7 + prefab_key | `prefab` | `prefab_name`, `instance_name`, `pos_x`, `pos_y`, `width`, `height`, `visible` |

### 🚨 工作原理

脚本检测到官方组件类型时，会：
1. 从 `templates/` 目录加载对应模板（如 `skill_btn.json`）
2. 调用 `template_matcher.py` 的克隆函数
3. 重新生成所有 UID，更新引用关系
4. 应用用户指定的位置和参数

### 使用示例

**输入树状结构（AI 只需输出这个）：**
```json
{
  "name": "game_hud",
  "type": "panel",
  "children": [
    {"name": "skill_q", "type": "skill_btn", "slot_id": 1, "shortcut": "Q", "pos_x": 910, "pos_y": 80},
    {"name": "skill_w", "type": "skill_btn", "slot_id": 2, "shortcut": "W", "pos_x": 1020, "pos_y": 80},
    {"name": "item_1", "type": "item_slot", "slot_id": 1, "pos_x": 1750, "pos_y": 80},
    {"name": "item_2", "type": "item_slot", "slot_id": 2, "pos_x": 1820, "pos_y": 80}
  ]
}
```

**脚本自动生成：**
- ✅ 完整的子节点结构（技能按钮 ~15 个子节点，物品槽 ~7 个子节点）
- ✅ 正确的 UID 和引用关系（`skill_icon_img`, `skill_cd_progress` 等）
- ✅ 所有必要的属性和样式
- ✅ 用户指定的位置 (`pos_x`, `pos_y`)

### 生成命令

```bash
cd .codemaker/skills/y3-ui-json-generator/pipeline
py -3 tree_to_ui_json.py input_tree.json output.json
```

**输出示例：**
```
✅ Generated: maps/EntryMap/ui/game_hud.json
   - 技能按钮: 2 个
   - 物品槽: 2 个
   - Buff槽: 0 个
   - 其他控件: 1 个
```

---

## 🔴🔴🔴 禁止 AI 手写完整 JSON（强制！）

**无论何种情况，AI 都禁止直接手写完整的 UI JSON 文件！**

### 为什么？

| 问题 | 说明 |
|------|------|
| **子节点顺序** | 同级节点后定义的显示在上层，AI 容易搞错 |
| **UID 重复** | 手写时容易复制粘贴导致 UID 重复 |
| **坐标计算** | 位置、尺寸需要精确计算，手写易出错 |
| **Token 浪费** | 一个面板 JSON 约 300-500 行，输出成本高 |

---

## ✅ 正确的 UI 生成流程

### 流程图

```
用户需求
    │
    ▼
是否有匹配的模板？
    │
    ├─ 有模板 ────────────▶ 【模板模式】直接复制模板并修改
    │
    └─ 无模板 ────────────▶ 【树状结构模式】
                                │
                                ▼
                           Step 1: AI 设计布局图（ASCII）
                                │
                                ▼
                           Step 2: AI 输出树状结构 JSON
                                │
                                ▼
                           Step 3: 脚本生成完整 JSON
                                │
                                ▼
                           Step 4: AI 修改具体字段
                                │
                                ▼
                           Step 5: 静态检查
```

---

## 📦 模板模式

当需求匹配现有模板时，使用 `clone_from_template()` 安全克隆。

### 可用模板

| 模板文件名 | 说明 | 节点数 |
|------------|------|--------|
| `hud_basic.json` | 完整的战斗 HUD（属性面板、头像、技能栏、血条、物品槽） | ~620 |
| `skill_btn.json` | 技能按钮组件（type:17 官方封装） | ~15 |
| `item_slot.json` | 物品槽组件（type:20 官方封装） | ~10 |
| `buff_slot.json` | Buff 槽组件 | ~8 |
| `roguelike_choice.json` | 肉鸽三选一面板 | ~50 |
| `popup_confirm.json` | 确认弹窗 | ~20 |
| `inventory_grid.json` | 物品栏网格布局 | ~30 |

### 模板克隆命令

```bash
cd .codemaker/skills/y3-ui-json-generator/pipeline

# 克隆确认弹窗模板
py -3 template_matcher.py clone popup_confirm.json {{map_root_path}}/ui/my_dialog.json my_dialog --replace "{{TITLE}}=确认退出" --replace "{{CONTENT}}=你确定吗？"

# 克隆 HUD 面板
py -3 template_matcher.py clone hud_basic.json {{map_root_path}}/ui/BattleHUD.json BattleHUD

# 克隆肉鸽三选一面板
py -3 template_matcher.py clone roguelike_choice.json {{map_root_path}}/ui/ChoicePanel.json ChoicePanel
```

### 模板使用流程

1. **选择模板** - 根据需求匹配上表中的模板
2. **克隆模板** - 运行 `template_matcher.py clone` 命令生成到 UI 目录
3. **调整布局** - 根据需要修改位置、尺寸、图片等字段
4. **静态检查** - 运行检查确保格式正确
5. **生成 Lua 代码** - 调用 y3-ui-official 生成交互代码

### `clone_from_template()` 自动处理

该函数底层自动执行完整的安全后处理链：
- ✅ **深拷贝** 模板（不修改原模板）
- ✅ **重新生成所有 UID**（避免与项目中已有 UI 冲突）
- ✅ **更新槽位引用**（SkillSlot/EquipSlot/BuffSlot 的子组件引用）
- ✅ **转换 `__tuple__` 格式**（`pos_data`/`size`/`anchor`/`cap_insets`）
- ✅ **设置 `name` 和 `layer_name`**（递归更新所有子节点）
- ✅ **替换文本占位符**（`{{TITLE}}`、`{{CONTENT}}` 等）

> ⚠️ **禁止手动复制模板文件再修改 UID！** 必须通过 `clone_from_template()` 确保安全。

---

## 🌲 树状结构模式

### Step 1: 设计布局图

使用 ASCII 绘制界面布局：

```
+----------------------------------+
|          选择界面                 |
+----------------------------------+
|   +--------+  +--------+  +--------+
|   | 选项1  |  | 选项2  |  | 选项3  |
|   | [图标] |  | [图标] |  | [图标] |
|   | 名称   |  | 名称   |  | 名称   |
|   | 描述   |  | 描述   |  | 描述   |
|   +--------+  +--------+  +--------+
+----------------------------------+
```

### Step 2: 输出树状结构

```json
{
  "name": "SelectPanel",
  "type": "panel",
  "children": [
    {"name": "bg", "type": "image"},
    {"name": "title_TEXT", "type": "text"},
    {
      "name": "option_1",
      "type": "layout",
      "children": [
        {"name": "icon", "type": "image"},
        {"name": "name_TEXT", "type": "text"},
        {"name": "desc_TEXT", "type": "text"},
        {"name": "btn_select", "type": "button"}
      ]
    },
    {"name": "option_2", "type": "layout", "children": ["..."]},
    {"name": "option_3", "type": "layout", "children": ["..."]}
  ]
}
```

### Step 3: 脚本生成

```bash
cd .codemaker/skills/y3-ui-json-generator/pipeline
py -3 tree_to_ui_json.py tree.json {{map_root_path}}/ui/SelectPanel.json
```

### Step 4: 修改具体字段

根据布局图调整生成的 JSON 中的：
- `pos_data`: 位置
- `size`: 尺寸
- `image`: 图片 ID
- `text`: 文本内容

### Step 5: 静态检查

```bash
py -3 -c "from static_check import static_check; import json; data = json.load(open('输出路径', 'r', encoding='utf-8')); result = static_check(data); print('✅ 检查通过' if result['passed'] else f'❌ 发现 {len(result[\"errors\"])} 个错误')"
```

### Step 6: 询问美化（可选）🎨

**静态检查通过后，询问用户是否需要美化 UI。**

```
UI 已生成完成，是否需要对界面进行美化？

选项：
1. ✅ 是，帮我美化（推荐）→ 调用 y3-ui-beautify
2. ⏭️ 不需要，继续下一步
3. 🎯 仅更换图片资源 → 查阅 IMAGE_ID_REGISTRY.md
```

若选择美化，调用 `y3-ui-beautify` 技能，查阅 `IMAGE_ID_REGISTRY.md` 选择合适的图片资源。

---

## 📐 控件类型对照表

| 类型名 | type 值 | 说明 |
|--------|---------|------|
| button | 1 | 按钮 |
| panel | 2 | 根面板/Layer |
| text | 3 | 文本标签 |
| image | 4 | 图片 |
| progress | 5 | 进度条 |
| model | 6 | 3D模型 |
| layout | 7 | 布局容器 |
| scrollview | 10 | 滚动视图 |
| slider | 11 | 滑动条 |
| input | 15 | 输入框 |
| **mini_map** | **16** | **小地图（官方）** |
| **skill_btn** | **17** | **技能按钮（官方）** |
| **buff** | **18** | **魔法效果（官方）** |
| **item_slot** | **20** | **物品槽（官方）** |
| **setting** | **27** | **系统设置（官方）** |

---

## 📍 Y3 坐标系说明

⚠️ **重要：Y3 UI 坐标原点在左下角！**

```
     ▲ Y+
     │
     │
     │
     └────────────► X+
   (0,0)
```

- `pos_data[0]`: X 绝对坐标
- `pos_data[1]`: Y 绝对坐标
- `pos_data[2]`: X 百分比 (0-100)
- `pos_data[3]`: Y 百分比 (0-100)
- `pos_data[4]`: X 模式 (0=像素, 1=百分比) **仅 0 或 1！**
- `pos_data[5]`: Y 模式 (0=像素, 1=百分比) **仅 0 或 1！**

> 📚 **完整 UI 规范**：见 `knowledge/05-UI字段规范.md` 和 `08-官方UI组件.md`
