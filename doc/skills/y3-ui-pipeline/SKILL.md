---
name: y3-ui-pipeline
description: |
  ⭐ Y3 UI 开发的【唯一用户入口】。所有 UI 相关需求统一走本流程，不要直接调用 y3-ui-generator。

  ALWAYS use this skill when user mentions: 生成UI、创建UI、做个UI、UI面板、做个界面、
  创建界面、HUD、英雄选择界面、商店界面、技能栏、背包界面、血条、小地图、装备栏、登录界面、
  结算界面、主菜单、设置面板、create panel、generate UI、make HUD。

  工作流程（两环节自动串联）：
  1. 生成 UI JSON（内部调用 y3-ui-generator）
  2. 生成 UI 节点树（供 Lua 查询，内部调用 gen_ui_tree.py）

  若用户请求中还包含 UI 交互逻辑（按钮点击、数据绑定等 Lua 代码），
  本流程完成后由 y3-lua-pipeline 衔接。
---

# Y3 UI Pipeline（UI 完整工作流 - 唯一入口）

> ⭐ **UI 开发的唯一入口**。当用户需求涉及 UI 生成时，**必须使用此工作流**，而非直接调用子技能（`y3-ui-generator` 已降级为内部实现）。

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
- 生成 HTML 布局预览（**直接生成，无中间确认**）
- 转换为 Y3 UI JSON 文件
- HTML 预览后执行确认步骤

详细指南见 `y3-ui-generator/SKILL.md`

### 🔴 生成器默认复用旧 uid

`html_to_y3_ui.py` 现在会读取目标 JSON，按**名称路径**复用旧控件 uid；新增节点才分配新 uid。
这样重生成画板不会再让所有 ECA 引用同时失效。

- 需要强制全部换新 uid（例如做对照实验）时加 `--no-reuse-uids`。
- 即使 uid 稳定，新增/删除控件后仍要重跑 `make_global_dsl.py → gen_trigger.py → load_eca.py`，
  并跑一次 `audit_triggers.py`；它会校验触发器引用的 uid 是否还存在于画板。

### 🔴 生成后必跑：隐藏官方 GameHUD

项目自带的 `GameHUD` 约 2.7 MB / 992 节点，会占据屏幕底部和右侧，直接盖住自定义 HUD。
生成/调整完自定义 HUD 后执行：

```bash
py -3 <agent>/skills/y3-ui-pipeline/scripts/hide_gamehud.py --map EntryMap
```

脚本会把 `maps/<地图>/ui/GameHUD.json` 根节点 `visible` 置为 `false`，然后
`hotfix_ui_editor` → 等 3 秒 → `save_editor`。不要删除 / 改名 / 覆盖 `GameHUD.json`。
需要恢复时加 `--show`。

> ⚠️ **建造类地图例外**：引擎的建造按钮在 `GameHUD.main.skill_list`（type:10 + type:17）。
> 如果把 GameHUD 根节点整体隐藏，建造按钮会一起消失。此时应保留根节点与 `main.skill_list`，
> 在 ECA 初始化里按控件 uid 隐藏 GameHUD 的其他子节点，
> 不要直接跑 `hide_gamehud.py`。

### 🔴 生成后必跑：常驻画板删除根底图

`MyHUD` / `MyItemBar` 这类常驻画板必须去掉根 layout 的全屏底图，否则整张地图会被蒙一层灰：

```bash
# 生成时直接去掉（推荐）
py -3 html_to_y3_ui.py MyHUD.html maps/<地图>/ui/MyHUD.json --panel-name MyHUD --strip-root-bg

# 或者对已有画板做后处理
py -3 <agent>/skills/y3-ui-pipeline/scripts/postprocess_panel.py --map <地图> --strip-root-bg MyHUD,MyItemBar
```

只删除根节点的 `block_bg` / `<画板名>_bg`，不动其它节点和 uid。全屏选择 / 结算 / 确认画板不要执行这一步。

### 🔴 生成后必跑：布局体检

```bash
python "<agent>/skills/y3-ui-pipeline/scripts/check_layout.py"        # 默认查 ui 目录下全部画板
python "<agent>/skills/y3-ui-pipeline/scripts/check_layout.py" --all  # 全量画板
```

> 只验收业务画板时建议显式列名，避免官方 `LoadingPanel` / `LogoPanel` 的已知警告干扰：
> `py -3 check_layout.py PanelA PanelB PanelC`

| 检查项 | 判定 | 说明 |
|--------|------|------|
| 越界 | 失败 | 控件矩形超出 1920×1080 |
| 横向越界（未适配） | 失败 | 未开启左右适配时，静态 `x` 超出 `100~1820` 会被裁；已开启适配的控件按边距锚定，不计入此项 |
| 上下留白 | 提示 | 窗口不纵向裁切，只影响观感，不计失败 |
| 面板重叠 | 失败 | 只比对同时可见的画板；用 `--overlap-pairs A:B` 显式指定，默认跳过 |

### 🔴 生成后必跑：控件父路径校验

`check_layout.py` 只检查越界与安全区，**不检查控件是否真的挂在目标父节点下**。
第一次生成时如果把子控件写成根级兄弟节点，结构校验仍会 PASS，但运行时会发现
`label_tower_name` 在 `block` 下、而不是 `block.upgrade_frame` 下。

用下面的脚本打印完整父路径，逐项对照执行案的层级：

```bash
py -3 <agent>/skills/y3-ui-pipeline/scripts/dump_ui_paths.py --map EntryMap --panel TowerUpgradePanel --leaf-only
```

判定标准：执行案写“相对 `upgrade_frame`”的控件，路径必须包含 `.upgrade_frame.`；
执行案写“相对 `info_panel`”的控件，路径必须包含 `.info_panel.`。


口径：`pos_data.items[0..1]` 是相对**父节点左下角**的偏移；模板宿主
（type 16/17/18/20/21/41/42）内部节点是模板相对坐标，脚本自动跳过。
背景见 `knowledge/UI系统/07-控件适配规则.md` 的「生成器坐标与非 16:9 窗口：优先用四方向适配」。

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
python "<agent>/skills/y3-ui-pipeline/gen_ui_tree.py" "."
```

### 输出位置

- 输入：`maps/EntryMap/ui/*.json`
- 输出：`ui_tree/*_Tree.json`

### 节点树示例

```json
{
  "name": "MyPanel",
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
-- 查看节点树后确定路径：MyPanel.block.main_frame.hero_1
local hero1 = y3.ui.get_ui(player, "MyPanel.block.main_frame.hero_1")
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
<agent>/skills/y3-ui-pipeline/
├── SKILL.md              # 本文件（工作流说明）
└── gen_ui_tree.py        # 节点树生成脚本

maps/EntryMap/ui/         # UI JSON 文件
├── MyPanel.json
├── GameHUD.json
└── ...

ui_tree/                  # 生成的节点树
├── MyPanel_Tree.json
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

### 🔴 重新生成画板：uid 默认稳定，但新增/删除控件仍需重导

`html_to_y3_ui.py` 现在按**名称路径复用旧 uid**：未改动控件保持原 uid，新增节点才分配新 uid。
所以常规改布局 / 改颜色 / 改文字，不会再让所有 ECA 引用同时失效。

仍然要按顺序做：

1. 重新生成画板 JSON；
2. 新增 / 删除 / 改名控件时，按控件名重新解析 uid（控件名才是契约，不要在脚本里写死 uid）；
3. 涉及 uid 变化的触发器重新导入（`import_eca` 逐个串行 → 等 3 秒 → `save_editor`）；
4. 跑 `audit_triggers.py --map-dir maps/<地图>`，确认没有“引用了画板里不存在的控件 uid”。

> 需要强制所有节点换新 uid（例如做对照组）时，给生成器加 `--no-reuse-uids`。

### 进度条内的百分比标签命名

| 细节 | 现象 | 做法 |
|------|------|------|
| 进度条内的百分比标签 | 它和**技能格（type:17）内部的 CD 标签同名**（都叫 `progress_percent_label`），按名字解析 uid 会撞车 | 生成器现在会自动改名为 `hp_percent_label` / `mp_percent_label`；不要再手工改名 |

### 🟥 UI 布局目标

执行具体项目时，优先按执行案里的 **UI 布局目标**落地（执行案给出坐标表时，以它为准）。
没有项目级坐标表时，至少遵守：

- 常驻控件优先用 `adapter_option` 锚定到对应边缘（左下/右下/顶部通栏等）；未适配的装饰内容再用左右 ≥100 的安全区兜底。
- 左上英雄面板、右上退出、右下装备栏、底部技能栏固定分区，不四角漂浮。
- 常驻 `MyHUD` / `MyItemBar` 删除根 layout 的 `_bg`；全屏选择/结算/确认保留底板。

## 🔗 关联技能

| 技能 | 用途 |
|------|------|
| `y3-ui-generator` | 生成 UI JSON（本流程环节 1） |
| `y3-lua-pipeline` | 编写所有 Lua 代码（包括 UI 交互代码和游戏逻辑） |

> 💡 **注意**：原 `y3-ui-official` 已整合到 `y3-lua-pipeline` 中，UI Lua 代码请直接使用 `y3-lua-pipeline`。

---
