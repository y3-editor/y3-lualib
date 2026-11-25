---
name: y3-ui-generator
description: |
  [内部实现技能 - 不直接面向用户]
  UI JSON 生成引擎：HTML 布局预览 → Y3 UI JSON 转换。
  仅由 y3-ui-pipeline 内部调用，或由 L3 专业用户在明确知道自己只需要 JSON 生成能力时直接调用。

  ⚠️ 用户触发"生成UI / 做个界面 / 创建画板"等需求时，必须走 y3-ui-pipeline（UI 唯一入口），
  由 pipeline 完成「生成 JSON → 生成节点树」完整工作流，不要直接路由到本技能。

  本技能只负责生成 UI JSON 结构文件，不涉及 Lua 逻辑代码（Lua 代码请使用 y3-lua-pipeline）。
---

# Y3 UI Generator（内部实现）

> 📘 **定位**：本技能是 `y3-ui-pipeline` 的内部子步骤，负责 UI JSON 的生成。
> 用户的 UI 需求请走 `y3-ui-pipeline`（唯一入口），不要直接激活本技能。
> 直接激活本技能仅限以下情况：
> - `y3-ui-pipeline` 内部自动路由
> - L3 专业用户明确只需要 JSON 生成能力、不需要节点树

---

## 🔴 技能激活时自动读取（首要步骤）

**本技能激活后，开始任何 UI 生成工作之前，必须先读取：**

```
<agent>/rules/mcp-rules.mdc     ← MCP 热更+保存流程规范
```

> UI JSON 生成后必须按 `热更 → 等待 3 秒 → 保存` 的顺序执行，否则内容会丢失！

---

从自然语言描述生成 Y3 编辑器兼容的 UI 面板 JSON 文件。

## 工作流概览

**重要：流程分阶段确认，HTML 预览生成后等待用户反馈再继续。草图阶段不设确认。**

```
用户描述 UI 需求
       ↓
Step 1: 🔍 网格/列表控件识别（识别 GridView/ScrollView 需求，排除 BuffList 等官方组件）
       ↓
Step 2: 📋 模板清单（列出所有将使用的模板及其尺寸）
       ↓
Step 3: 生成结构草图（文本 + UI 树，直接进入下一步）
       ↓
Step 4: 生成画板 HTML 预览文件并保存到临时位置
       ↓
Step 5: 🔍 布局检查（超框检测 + 同级重叠检测）
       ↓ 无问题或用户忽略
Step 6: 预览、确认并转换画板（打开预览 → 用户确认 → 转换为 Y3 JSON）
       ↓ 用户确认满意
Step 7: 🎨 Prefab 设计与转换（仅当有 grid/list 时触发：设计 prefab → 生成 HTML → 转换 JSON）
       ↓
Step 8: 调用 y3editor MCP 热更 UI 编辑器（hotfix_ui_editor）
       ↓
Step 9: 🔴 删除 HTML 临时文件（强制，不可跳过）
       ↓
输出到 maps/EntryMap/ui/<PanelName>.json
       + maps/EntryMap/ui/prefab/<PanelName>-<path>-template.json
```

流程分阶段确认，用户在 HTML 预览节点有机会修改，确认满意后再继续下一步。草图生成后自动进入 HTML 生成。

## Step 1: 🔍 网格/列表控件识别

收到用户的 UI 描述后，**首先**分析需求中是否涉及网格或列表控件。

### 识别关键字

| 控件类型 | HTML data-type | Y3 type | 识别关键字 |
|----------|---------------|---------|-----------|
| **网格 (GridView)** | `grid` | 25 | 格子、网格、宫格、Grid、GridView、物品格、装备格、技能格、背包格子、N×M 排列、九宫格、多行多列 |
| **列表 (ScrollView)** | `list` | 10 | 列表、滚动列表、排行榜、ScrollView、滚动视图、可滚动、上下滑动、左右滑动、翻页列表、聊天记录、日志列表 |

### ⚠️ 排除规则

**BuffList (type:18)** 是官方组件，自动管理其子节点 BuffItem (type:19)，**不走 prefab 子流程**。当用户提到"Buff列表"时，使用 `data-template="buff_list"` 模板，而非 grid/list 控件。

### 🔴 行列/方向提取（强制）

识别到 grid/list 后，**必须**从用户描述中提取行列数或方向：

- **GridView**: 提取 `rows` 和 `cols`，参见"Grid 行列识别规则"的识别对照表
- **ScrollView**: 提取 `direction`（vertical/horizontal），规则如下：

**严禁使用 rows=1 或 cols=1 作为默认值！** 如果用户未明确指定，按自动计算规则估算。

### 🔴 Grid 宽度约束规则（强制）

识别到 GridView 时，**必须**确保 grid 宽度满足以下公式：

```
grid_w = item_w × cols + gap_x × (cols - 1)
```

| 参数 | 说明 |
|------|------|
| `grid_w` | Grid 控件的宽度 |
| `item_w` | 子项的宽度 |
| `cols` | 列数 |
| `gap_x` | 水平间距 |

> **注意**：grid 高度（`grid_h`）不受约束，可自由设定（引擎会自动处理垂直滚动）。

**如果用户给定的宽度不符合公式**，需要调整以下任一参数使其匹配：
1. 调整 grid 宽度（推荐）
2. 调整子项宽度
3. 调整水平间距

### 输出格式

```markdown
### 网格/列表控件识别

| 控件 | 类型 | 名称 | 尺寸 | 子项尺寸 | 额外参数 |
|------|------|------|------|----------|---------|
| 物品格子 | grid | item_grid | 430×540 | 100×100 | rows=5, cols=4, gap_x=10, gap_y=10 |
| 排行榜 | list | rank_list | 400×600 | 380×80 | direction=vertical, gap=5 |
```

> **宽度验证**：物品格子 grid_w = 100×4 + 10×3 = 430 ✓

### 确认对话模板

识别到 grid/list 需求后，在输出识别清单之后，**必须**执行以下确认：

```
问题: 检测到网格/列表需求（如上表），请确认使用哪种实现方式
选项:
  - "使用 GridView/ScrollView（引擎动态管理子项，需要 prefab） (Recommended)"
  - "使用手动布局（每个格子独立 layout 节点，适合固定少量格子）"
```

| 用户选择 | 后续操作 |
|----------|----------|
| 使用 GridView/ScrollView | 按 grid/list 流程继续（Step 2 → Step 3 用 `[grid]`/`[list]` 标记 → Step 7 生成 prefab） |
| 使用手动布局 | 将识别结果标记为"手动布局"，在 Step 3 草图中使用独立 layout 节点排列格子 |

识别完成后进入 Step 2。

## Step 2: 📋 模板清单

收到用户的 UI 描述后，分析需求中涉及的复合控件模板，输出模板清单表格。

### 模板清单格式

```markdown
### 模板清单

| 模板 | 默认尺寸 | 计划尺寸 | 说明 |
|------|----------|----------|------|
| hp_bar | 256×38 | 300×44 | 血条，等比放大 1.17x |
| skill | 100×100 | 100×100 | 技能按钮，使用默认尺寸 |
| minimap | 211×211 | 211×211 | 小地图，使用默认尺寸 |
```

### 表格列说明

| 列名 | 说明 |
|------|------|
| **模板** | 模板 ID（来自 `widget_template_config.md`） |
| **默认尺寸** | 模板的默认尺寸（从配置文件读取，禁止估算） |
| **计划尺寸** | 本次 UI 中计划使用的尺寸（可等比缩放） |
| **说明** | 用途说明 + 缩放比例（如有） |

### 无模板场景

如果用户需求不涉及任何预制模板（如简单弹窗只有文字和按钮），输出：

```markdown
### 模板清单

无需使用预制模板，所有控件将手动创建。
```

### 模板尺寸数据来源

**必须**从 `widget_template_config.md` 的"模板列表"表格读取默认尺寸，**禁止**使用硬编码或估算值。

输出模板清单后，立即进入 Step 3 生成草图。

## Step 3: 生成结构草图

**重要**：草图中的模板控件尺寸**必须**与 Step 2 模板清单中的"计划尺寸"一致。

### 草图格式

```
面板名称: MobaHUD
设计分辨率: 1920×1080

UI 树:
├── layout: hud_container (1920×200, 底部, 适配=bottom,left,right)
│   ├── [hp_bar] hero_hp (300×44)           ← 模板控件，使用计划尺寸
│   ├── [mp_bar] hero_mp (300×44)           ← 模板控件
│   ├── label: hero_name (200×30)            ← 手动控件
│   ├── layout: skill_bar (420×110)
│   │   ├── [skill] skill_q (100×100)        ← 模板控件
│   │   ├── [skill] skill_w (100×100)
│   │   ├── [skill] skill_e (100×100)
│   │   └── [skill] skill_r (100×100)
│   └── [minimap] minimap (211×211)          ← 模板控件
```

### 控件表示法

| 类型 | 格式 | 示例 |
|------|------|------|
| **模板控件** | `[模板ID] 名称 (宽×高)` | `[skill] skill_q (100×100)` |
| **手动控件** | `类型: 名称 (宽×高, 说明)` | `label: hero_name (200×30)` |
| **网格控件** | `[grid] 名称 (宽×高, rows=M, cols=N, gap=N, prefab=Name)` | `[grid] item_grid (440×540, rows=5, cols=4, gap=5, prefab=xxx-item_grid-template)` |
| **列表控件** | `[list] 名称 (宽×高, direction=xxx, prefab=Name)` | `[list] rank_list (400×600, direction=vertical, prefab=xxx-rank_list-template)` |

网格/列表控件的子行表示 prefab 子项（将在 Step 7 单独生成）：
```
├── [grid] item_grid (440×540, rows=5, cols=4, gap=5, prefab=ItemCmp)
│   └── xxx-item_grid-template (100×100) → prefab 子项
├── [list] rank_list (400×600, direction=vertical, prefab=RankItemCmp)
│   └── xxx-rank_list-template (380×80) → prefab 子项
```

### 尺寸一致性规则

1. 模板控件的尺寸**必须**与模板清单中的"计划尺寸"完全一致
2. 如果需要调整尺寸，**必须**先修改模板清单，再更新草图
3. 手动控件的尺寸可自由设定

草图生成后，**直接进入 Step 4 生成画板 HTML 预览**，无需等待用户确认。

## Step 4: 生成画板 HTML 预览

### ⚠️ 尺寸继承规则

**HTML 中的 `data-w/h` 必须与草图中的尺寸完全一致，禁止重新估算！**

| 草图中的控件 | HTML 中的属性 |
|-------------|--------------|
| `[skill] skill_q (100×100)` | `data-w="100" data-h="100"` |
| `[hp_bar] hero_hp (300×44)` | `data-w="300" data-h="44"` |
| `label: hero_name (200×30)` | `data-w="200" data-h="30"` |

草图已经过用户确认（Step 3），尺寸是可信的，不需要也不应该在 HTML 阶段重新估算。

### HTML 编写规范

HTML 文件使用 UTF-8 编码。

HTML 文件使用 `data-*` 属性来描述 Y3 UI 节点。每个 `<div>` 对应一个 UI 节点。

**坐标系统**：使用 HTML 标准坐标（左上角为原点，Y轴向下）。转换脚本会自动转为 Y3 坐标（左下角原点，Y轴向上）。

### ⚠️ 内边距规则（强制）

**layout 内部子节点必须与父容器边缘保持至少 3px 的间距！**

| 规则 | 说明 |
|------|------|
| **最小内边距** | 子节点的 `data-x/y` 最小值为 `3`，不允许为 `0` |
| **最大边界** | 子节点右边缘 ≤ 父宽度 - 3，下边缘 ≤ 父高度 - 3 |
| **推荐值** | 建议使用 `10~20px` 的内边距，视觉效果更佳 |

**示例**：

```html
<!-- ❌ 错误：子节点紧贴父容器边缘 -->
<div data-type="layout" data-name="panel" data-w="400" data-h="300">
    <div data-type="label" data-name="title" data-x="0" data-y="0" data-w="400" data-h="40">
</div>

<!-- ✅ 正确：保持 10px 内边距 -->
<div data-type="layout" data-name="panel" data-w="400" data-h="300">
    <div data-type="label" data-name="title" data-x="10" data-y="10" data-w="380" data-h="40">
</div>
```

**例外情况**：
- 全屏背景图（`data-adapter="all"`）可以使用 `x=0, y=0`
- 显式的背景图节点（名称含 `bg`）可以铺满父容器

### 必需属性

| 属性 | 说明 | 示例 |
|------|------|------|
| `data-type` | 控件类型 | `layout` / `label` / `image` / `button` / `grid` / `list` |
| `data-name` | 节点名称（Lua代码引用名） | `label_title` |
| `data-x` | 相对父节点的 X 偏移（左上角） | `100` |
| `data-y` | 相对父节点的 Y 偏移（左上角） | `200` |
| `data-w` | 宽度 | `400` |
| `data-h` | 高度 | `50` |

## Y3 类型映射

| data-type | Y3 type 值 | Y3 控件名 | 用途 |
|-----------|-----------|-----------|------|
| `layout` | 7 | 空节点 | 容器、分组、背景框 |
| `label` | 3 | 文本 | 标题、描述、数值显示 |
| `image` | 4 | 图片 | 图标、背景图、装饰 |
| `button` | 1 | 按钮 | 可点击交互元素 |
| `3dmodel` | 6 | 模型控件 | 模型展示（英雄、物品 3D 预览） |
| `grid` | 25 | GridView | 网格排列子项（需 prefab） |
| `list` | 10 | ScrollView | 滚动列表（需 prefab） |

### 可选通用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-adapter` | 适配方向（逗号分隔） | 无适配 |
| `data-anchor` | 锚点 | 无 |
| **`data-event`** | **控件具名事件（ECA 接 UI 交互的唯一可用通道）**，多个用逗号分隔 | 无（`event_list` 为空） |
| `data-event-type` | 事件类型；`1` = 点击（默认） | `1` |

**data-adapter 值**：`top`, `bottom`, `left`, `right` 任意组合（逗号分隔），或 `all`（全部开启）

### 🔴 `data-event`：让 ECA 能收到这个控件的点击

```html
<!-- 点击卡 1 → 发送具名事件 card_1_click -->
<div data-type="button" data-name="card_1" data-event="card_1_click" ...></div>

<!-- 一个控件挂多个事件 -->
<div data-type="button" data-name="btn_multi" data-event="ev_a,ev_b" ...></div>
```

生成结果与工程自带官方画板 GameHUD 完全同构（`type: 1` = 点击）：

```json
"event_list": [
  { "action_list": [], "enabled": true, "name": "card_1_click",
    "not_wait_network": false, "sound_id": null, "type": 1 }
]
```

**ECA 侧对应写法**：子触发器的事件参数写**普通字符串字面量**，不是 `STR_TO_UI_EVENT(...)`。
完整可用样例与反例见 `eca-json-builder/runtime_pitfalls.md §1`。

> ⚠️ 三条硬约束：
> 1. 不写 `data-event` 时 `event_list` 为空 → 该控件的点击**传不到 ECA**
>    （运行时用 `CREATE_UI_COMP_EVENT_EX_EX` + `STR_TO_UI_EVENT` 注册的写法经实测**运行时无效**，
>    虽然它能通过编辑器保存、`diff` 全绿）。
> 2. 具名事件的 `name` 就是 ECA 的事件契约，**改名即断**，交付前必须登记控件命名契约表。
> 3. UI 点击类用例**必须人工点击验证**：`y3.ui` 的 `send_event`（命名事件注入）驱动不了 ECA；
>    能否用 `y3-helper.trigger_ui_touch_event_by_path`（真实触摸注入）驱动**尚待复核**
>    （旧文档把它判为"不行"，但那次对照只覆盖了命名事件注入这一条通道）。

## 适配规则速查

需要深入了解适配系统时，请读取 → [references/adapter-rules.md](references/adapter-rules.md)

### Label 专用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-text` | 文本内容 | 空 |
| `data-font-size` | 字体大小 | 16 |
| `data-color` | 字体颜色（#rrggbb） | #ffffff |
| `data-align` | 对齐方式 | center,middle |
| `data-shadow` | 文字阴影 | false |

**data-align 格式**：`水平,垂直`，水平=`left`/`center`/`right`，垂直=`top`/`middle`/`bottom`

### Image 专用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-preset` | 图片预设（见下方预设表） | 无 |
| `data-image` | 图片资源ID（可覆盖预设） | 999 |
| `data-color` | 图片颜色叠加 | 无 |
| `data-scale9` | 启用九宫格 | false（需要时设为 true） |
| `data-cap-insets` | 九宫格切割(上,右,下,左) | 10,10,10,10 |

> **完整资源配置**（图片预设、按钮预设、自动背景图、默认值）请读取 → [icon_config.md](icon_config.md)

**图片预设（data-preset 值）**：

| 预设名 | 说明 | 使用场景 |
|--------|------|----------|
| `panel-bg` | 通用面板背景 | 弹窗、面板底图 |
| `frame` | 通用边框 | 卡片、槽位边框 |
| `dark-bg` | 深色背景 | 遮罩、暗色区域 |
| `slot` | 槽位/格子背景 | 物品格、技能格 |
| `divider` | 分割线/装饰条 | 区域分隔 |
| `shadow` | 阴影/暗色遮罩 | 投影效果 |
| `highlight` | 高亮/选中效果 | 选中态、激活态 |
| `border-glow` | 发光边框 | 稀有度、品质边框 |
| `item-bg` | 物品背景 | 道具、装备底图 |
| `title-bar` | 标题栏背景 | 面板顶部标题条 |

使用 `data-preset` 后仍可用 `data-image` 覆盖。

### Button 专用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-preset` | 按钮预设风格 | 无（见下方预设表） |
| `data-text` | 按钮文字 | 空 |
| `data-font-size` | 字体大小 | 16 |
| `data-color` | 字体颜色 | #f7f7f7 |
| `data-normal-image` | 正常状态图片（可覆盖预设） | 107525 |
| `data-hover-image` | 悬浮状态图片（可覆盖预设） | 107526 |
| `data-press-image` | 按下状态图片（可覆盖预设） | 107527 |
| `data-disabled-image` | 禁用状态图片（可覆盖预设） | 107528 |

**按钮预设（data-preset 值）**：

| 预设名 | 外观 | 使用场景 |
|--------|------|----------|
| `gold` | 金色按钮 | 主操作、确认、领取 |
| `blue` | 蓝色按钮 | 次要操作、导航 |
| `red` | 红色按钮 | 危险操作、取消、关闭 |
| `close` | 关闭按钮 | 面板右上角关闭 |
| `transparent` | 透明按钮 | 覆盖在其他控件上的点击区域 |

使用预设后仍可用 `data-normal-image` 等属性单独覆盖某个状态。

### Layout 专用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-bg-image` | 背景图片ID | 无 |
| `data-bg-color` | 背景颜色 | 无 |
| `data-block` | 吞噬点击事件 | false |

**自动背景图注入 **：

> ⚠️ **画板根 layout 也是 layout**：它是 1920×1080，所以**常驻画板**（HUD / 背包 / 状态栏）会被注入一张
> **全屏半透明底图**，表现是「进入对局后整张地图像蒙了一层灰黑遮罩」。
> 常驻画板生成时直接加 `--strip-root-bg`（推荐）；已有画板也可以后处理删除**根 layout 的直接子节点** `<画板名>_bg`（只删这一个节点、不动 uid，ECA 控件引用不受影响）；
> 内层面板自己的 `*_bg` 保留，弹窗仍有正常底板。全屏选择/加载界面保留根底图是对的。
> 细节见 `../eca-json-builder/runtime_pitfalls.md §9.4`。

转换器会自动检查每个 layout (type=7) 节点，如果没有背景图片子节点，则在 children 列表的开头（index=0，最底层）插入一个默认背景图。如果不想让某个 layout 自动注入背景，在 HTML 中手动添加一个 `image_xxx_bg` 子节点即可。

### 3DModel 专用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-camera-mode` | 镜头模式（1=智能全身模式，2=智能头像模式） | 2 |

**镜头模式说明**：

| 值 | 模式 | 用途 |
|----|------|------|
| `1` | 智能全身模式 | 显示完整模型，适合英雄选择、角色预览 |
| `2` | 智能头像模式 | 聚焦模型上半身/头部，适合头像框、小型预览 |

### Grid 专用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-rows` | 行数（**必填，≥1**） | — |
| `data-cols` | 列数（**必填，≥1**） | — |
| `data-gap-x` | 子项水平间距 | 0 |
| `data-gap-y` | 子项垂直间距 | 0 |
| `data-item-w` | 子项宽度（**必填**） | — |
| `data-item-h` | 子项高度（**必填**） | — |

> ⚠️ **`data-rows` 和 `data-cols` 是必填项，禁止省略！** 引擎的 `GridView.calc_location()` 会用行列数做除法，值为 0 会导致 `ZeroDivisionError` 崩溃。

### 🔴 Grid 行列识别规则（强制）

**GridView 的 `data-rows` 和 `data-cols` 必须从用户需求中精确提取，绝对不能使用默认值 1！**

引擎内部 `grid_count = (行数, 列数)`，转换器从 `data-rows` 和 `data-cols` 分别读取。

#### 识别对照表

| 用户描述 | data-rows | data-cols | 解释 |
|----------|-----------|-----------|------|
| "4×5 格子" | **5** | **4** | "N×M" 默认理解为 **N列×M行**（宽×高习惯） |
| "4×5 网格布局" | **5** | **4** | 同上 |
| "4列×3行" | **3** | **4** | 明确标注了"列"和"行" |
| "3行4列" | **3** | **4** | 明确标注了"行"和"列" |
| "九宫格" | **3** | **3** | 3行3列 |
| "20个格子，每行4个" | **5** | **4** | 20÷4=5行 |
| 未指定行列 | **自动计算** | **自动计算** | 见下方公式 |

#### 自动计算规则（用户未指定行列时）

```
cols = floor(grid_w / (item_w + gap_x))
rows = floor(grid_h / (item_h + gap_y))
cols = max(cols, 1)
rows = max(rows, 1)
```

### List 专用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-gap` | 间距 | 0 |
| `data-item-w` | 子项宽度（**必填**） | — |
| `data-item-h` | 子项高度（**必填**） | — |
| `data-direction` | 排列方向（**必填**，`vertical` 或 `horizontal`） | — |
| `data-bg-image` | 背景图片ID（可选，不填则根据尺寸自动选择） | 自动 |

#### ⚠️ 子项尺寸与滚动方向关系（强制）

**子项尺寸必须与滚动方向匹配，否则会出现布局异常或无法正常滚动！**

| 滚动方向 | data-item-w 要求 | data-item-h 要求 | 说明 |
|----------|------------------|------------------|------|
| `vertical`（上下滚动） | **≈ List 的 data-w** | 自由设定 | 子项宽度应等于或略小于列表宽度（留少量边距） |
| `horizontal`（左右滚动） | 自由设定 | **≈ List 的 data-h** | 子项高度应等于或略小于列表高度（留少量边距） |

### Grid/List HTML 示例

```html
<!-- 网格控件：4列5行，100×100 子项 -->
<div data-type="grid" data-name="item_grid"
     data-x="10" data-y="10" data-w="440" data-h="540"
     data-rows="5" data-cols="4"
     data-gap-x="5" data-gap-y="5"
     data-item-w="100" data-item-h="100"
     style="left:10px; top:10px; width:440px; height:540px; background:rgba(200,100,255,0.2); border:1px dashed rgba(200,100,255,0.6);">
    Grid (4cols×5rows, ItemCmp)
</div>

<!-- 列表控件：纵向滚动，380×80 子项 -->
<div data-type="list" data-name="rank_list"
     data-x="10" data-y="10" data-w="400" data-h="600"
     data-item-w="380" data-item-h="80"
     data-gap-y="5"
     data-direction="vertical"
     style="left:10px; top:10px; width:400px; height:600px; background:rgba(100,200,255,0.2); border:1px dashed rgba(100,200,255,0.6);">
    List (vertical, RankItemCmp)
</div>
```

**注意**：grid/list 节点在 HTML 中为自闭合（无子元素），子项由引擎根据 prefab 动态实例化。HTML 中的文本内容仅用于预览标识。

### HTML 模板

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>UI Preview: PanelName</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: #1a1a2e; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .canvas {
            width: 1920px; height: 1080px;
            transform: scale(0.65); transform-origin: center;
            position: relative; background: #16213e; border: 2px solid #0f3460;
            overflow: hidden;
        }
        /* 每个 data-type 用不同的边框颜色方便区分 */
        [data-type="layout"] { border: 1px dashed rgba(100, 200, 255, 0.4); }
        [data-type="label"] { border: 1px solid rgba(255, 200, 50, 0.6); background: rgba(255, 200, 50, 0.1); }
        [data-type="image"] { border: 1px solid rgba(100, 255, 100, 0.6); background: rgba(100, 255, 100, 0.1); }
        [data-type="button"] { border: 1px solid rgba(255, 100, 100, 0.6); background: rgba(255, 100, 100, 0.15); cursor: pointer; }
        /* 所有 UI 节点都用绝对定位 */
        [data-type] { position: absolute; display: flex; align-items: center; justify-content: center; color: white; font-size: 12px; }
        /* 节点名称标签 */
        [data-type]::after {
            content: attr(data-name);
            position: absolute; top: 2px; left: 4px;
            font-size: 10px; color: rgba(255,255,255,0.5);
            pointer-events: none;
        }
    </style>
</head>
<body>
<div class="canvas">

    <!-- 在这里放置 UI 节点 -->
    <!-- 每个 div 使用 style="left:Xpx; top:Ypx; width:Wpx; height:Hpx;" 来可视化位置 -->
    <!-- data-x/y/w/h 是传给转换器的实际坐标，style 仅用于 HTML 预览 -->

</div>
</body>
</html>
```

### 关键约定

1. **style 和 data 保持一致**：`style="left:100px; top:200px; width:400px; height:50px;"` 应与 `data-x="100" data-y="200" data-w="400" data-h="50"` 一致
2. **子节点坐标相对于父节点**：嵌套节点的 data-x/y 是相对于父容器左上角的偏移
3. **命名规范**：遵循 y3-lua-pipeline 的前缀命名规则（`label_xxx`, `button_xxx`, `image_xxx` 等），这样 Lua 代码可以自动绑定 Widget
4. **颜色区分**：不同类型的节点使用不同背景色，方便在浏览器中查看布局

## Step 5: 🔍 布局检查（强制）

HTML 生成后、打开预览前，**必须**执行布局检查。如果发现问题，向用户提出警告并询问是否重新生成。

### 检查项目

| 检查项 | 规则 | 错误示例 |
|--------|------|----------|
| **超框检测** | 根节点的子元素不得超出 1920×1080 边界 | `x=1800, w=200` → 右边缘 2000 > 1920 |
| **同级重叠** | 同一父节点下的 layout 类型子节点不得互相重叠 | 两个 500×300 的 layout 都在 x=100 |

### 超框检测规则

对于根节点 `bg` 的直接子节点：
```
左边界: x ≥ 0
右边界: x + w ≤ 1920
上边界: y ≥ 0
下边界: y + h ≤ 1080
```

### 同级重叠检测规则

同一父节点下的所有 `data-type="layout"` 节点，两两检查矩形是否相交：
```
节点 A: (x1, y1, w1, h1)
节点 B: (x2, y2, w2, h2)

重叠条件（任一为真则不重叠）:
  - A 在 B 左边: x1 + w1 ≤ x2
  - A 在 B 右边: x2 + w2 ≤ x1
  - A 在 B 上边: y1 + h1 ≤ y2
  - A 在 B 下边: y2 + h2 ≤ y1

如果以上都不满足，则 A 和 B 重叠
```

### 检查结果处理

**无问题时**：静默通过，直接进入 Step 6 预览

**有问题时**：输出警告信息，并向用户确认

#### 警告信息格式

```markdown
⚠️ **布局检查发现问题**

**超框问题**：
- `center_area` 右边缘超出 (x=700 + w=1300 = 2000 > 1920)
- `bottom_heroes` 下边缘超出 (y=980 + h=140 = 1120 > 1080)

**同级重叠问题**：
- `left_panel` 与 `center_area` 重叠
  - left_panel: (20, 80, 520, 620)
  - center_area: (400, 80, 520, 960)
  - 重叠区域: x∈[400,540], y∈[80,700]
```

#### 确认对话

```
问题: 布局检查发现上述问题，是否重新调整 HTML？
选项:
  - "重新调整 (Recommended)"
  - "忽略问题，继续预览"
```

#### 处理规则

| 用户选择 | 操作 |
|----------|------|
| 重新调整 | 根据问题修改 HTML 中的坐标/尺寸，然后**再次执行布局检查**（循环） |
| 忽略问题，继续预览 | 进入 Step 6 预览（警告已告知用户） |

### 自动修复建议

检测到问题时，可在警告信息后附加修复建议：

```markdown
**建议修复**：
- `center_area`: 将 w 从 1300 改为 1200，或将 x 从 700 改为 600
- `left_panel` 与 `center_area` 重叠: 将 center_area 的 x 从 400 改为 550
```

## Step 6: 预览、确认并转换画板

本步骤包含三个子环节：打开预览 → 用户确认 → 转换为 JSON。

### 6a: 打开预览

HTML 生成后：
1. 在浏览器中打开 HTML 预览文件供用户查看布局效果
2. 向用户展示当前的布局摘要

### 6b: 确认对话

HTML 预览在浏览器中打开后，**必须**向用户确认是否满意：

```
问题: HTML 预览已在浏览器中打开，请确认布局效果
选项:
  - "满意，转换为 JSON (Recommended)"
  - "需要调整"
```

**处理规则**：

| 用户选择 | 操作 |
|----------|------|
| 满意，转换为 JSON | 立即执行 6c 转换 |
| 需要调整 | 根据用户描述修改 HTML 文件，然后**重新打开预览并再次询问确认**（循环） |

**多轮调整**：支持用户多次调整，直到选择"满意"。每次调整后重新打开预览并确认。

### 6c: 转换为 Y3 JSON

用户确认预览满意后，执行画板转换：

```bash
python scripts/html_to_y3_ui.py <preview.html> <output.json> --panel-name <PanelName> --zorder 300
```

**转换器路径**：`scripts/html_to_y3_ui.py`（技能内置）

**输出位置**：`maps/EntryMap/ui/<PanelName>.json`

转换完成后向用户展示生成结果摘要（节点树、Widget 列表等），然后进入 Step 7。

## Step 7: 🎨 Prefab 设计与转换

**仅当 Step 1 识别到 grid/list 控件时触发**，否则跳过直接进入 Step 8。

### 🔴 Prefab 命名规则

### 处理流程

对 Step 1 识别出的每个 prefab 需求，按顺序执行以下子步骤：

#### Step 7a: 确定 Prefab 名称

根据草图中的节点路径，计算 Prefab 最终名称：

1. 从草图中找到使用该 prefab 的 grid/list 节点
2. 构建从根节点到该节点的路径（用 `.` 分隔）
3. 将路径中的 `.` 替换为 `-`
4. 组合为 `<PanelName>-<path>-template`

#### Step 7b: 询问 Prefab 布局

向用户确认每个 prefab 子项的内部布局：

```
问题: 请描述 [PrefabName] (100×100) 的子项布局，包含哪些元素？
示例：图标(居中)+数量文字(右下角)+品质边框(铺满)
```

#### Step 7c: 生成 Prefab HTML

为每个 prefab 生成独立的 HTML 预览文件：

- **文件名**：使用最终名称，如 `MyPanel-block-main_frame-hero_list-template_preview.html`
- **canvas 尺寸**：父控件（grid/list）的 `data-item-w` × `data-item-h`（而非 1920×1080）
- **根节点 data-name**：使用最终名称

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Prefab Preview: MyPanel-block-main_frame-hero_list-template</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: #1a1a2e; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .canvas {
            width: 100px; height: 100px;  /* ← 使用父控件的 data-item-w × data-item-h */
            transform: scale(3); transform-origin: center;  /* 放大3倍方便预览 */
            position: relative; background: #16213e; border: 2px solid #0f3460;
            overflow: hidden;
        }
        [data-type="layout"] { border: 1px dashed rgba(100, 200, 255, 0.4); }
        [data-type="label"] { border: 1px solid rgba(255, 200, 50, 0.6); background: rgba(255, 200, 50, 0.1); }
        [data-type="image"] { border: 1px solid rgba(100, 255, 100, 0.6); background: rgba(100, 255, 100, 0.1); }
        [data-type] { position: absolute; display: flex; align-items: center; justify-content: center; color: white; font-size: 10px; }
        [data-type]::after { content: attr(data-name); position: absolute; top: 1px; left: 2px; font-size: 8px; color: rgba(255,255,255,0.5); }
    </style>
</head>
<body>
<div class="canvas">
    <!-- Prefab 根节点：使用最终名称 -->
    <div data-type="layout" data-name="MyPanel-block-main_frame-hero_list-template"
         data-x="0" data-y="0" data-w="100" data-h="100"
         style="left:0; top:0; width:100px; height:100px;">

        <!-- 子节点根据用户描述布局 -->
        <div data-type="image" data-name="item_icon"
             data-x="10" data-y="10" data-w="80" data-h="80" data-preset="slot"
             style="left:10px; top:10px; width:80px; height:80px;">
        </div>

        <div data-type="label" data-name="item_count"
             data-x="55" data-y="75" data-w="40" data-h="20"
             data-text="99" data-font-size="12" data-color="#ffffff" data-align="right,bottom"
             style="left:55px; top:75px; width:40px; height:20px;">
            99
        </div>
    </div>
</div>
</body>
</html>
```

#### Step 7d: 确认并转换 Prefab

在浏览器中打开 prefab HTML 预览后，向用户确认：

```
问题: Prefab [PrefabName] 的布局预览已打开，是否满意？
选项:
  - "满意，转换为 JSON (Recommended)"
  - "需要调整"
```

用户确认满意后，**立即执行转换**：

```bash
python scripts/html_to_y3_ui.py <prefab_name>_preview.html maps/EntryMap/ui/prefab/<prefab_name>.json --prefab --prefab-name <prefab_name>
```

**示例**：

```bash
python scripts/html_to_y3_ui.py MyPanel-block-main_frame-hero_list-template_preview.html maps/EntryMap/ui/prefab/MyPanel-block-main_frame-hero_list-template.json --prefab --prefab-name MyPanel-block-main_frame-hero_list-template
```

转换完成后，**立即删除 Prefab HTML 临时文件**，然后继续处理下一个 prefab 或进入 Step 8。

### 多 Prefab 处理

如果有多个 prefab 需求，按顺序逐个完成 7a→7d 全流程。每个 prefab 在用户确认满意后立即转换为 JSON 并删除 HTML。所有 prefab 处理完成后，进入 Step 8。

## Step 8: 热更 UI 编辑器

转换完成后，立即调用 y3editor MCP 的 `hotfix_ui_editor` 工具，将生成的 JSON 热更到编辑器中，无需用户手动刷新：

```
use_mcp_tool:
  server_name: y3editor
  tool_name: hotfix_ui_editor
  arguments: {}
```

**规则：**
- 热更成功时：在结果摘要末尾追加 "✅ 已热更到 Y3 编辑器"
- 热更失败或 MCP 不可用时：不报错，仅提示 "⚠️ 热更失败，请在编辑器中手动刷新 UI"，不影响主流程

## Step 9: 🔴 删除 HTML 临时文件（强制）

**热更完成后，必须立即删除生成的 HTML 临时预览文件。此步骤为强制步骤，不可跳过！**

### 执行方式

使用 y3editor MCP 的 `delete_screenshot` 工具删除临时 HTML 文件：

```
use_mcp_tool:
  server_name: y3editor
  tool_name: delete_screenshot
  arguments: {"file_path": "<HTML临时文件的绝对路径>"}
```

如果 MCP 不可用，则使用终端命令删除：

```bash
del "<HTML临时文件的绝对路径>"
```

### 规则

| 场景 | 操作 |
|------|------|
| 热更成功 | ✅ 立即删除 HTML 临时文件 |
| 热更失败 | ✅ 仍然删除 HTML 临时文件（JSON 已生成，HTML 不再需要） |
| 删除成功 | 在结果摘要追加 "🗑️ 已清理临时文件" |
| 删除失败 | 提示 "⚠️ 临时文件清理失败，请手动删除: <路径>"，不阻塞流程 |

### ❌ 禁止行为

- **禁止跳过此步骤**：无论热更是否成功，都必须执行清理
- **禁止保留 HTML 文件**：HTML 仅用于浏览器预览，JSON 生成后即失去价值
- **禁止等用户手动删除**：AI 必须主动执行删除操作

## 完整示例

用户需求："做一个简单的确认弹窗，半透明黑色遮罩，居中白色面板，标题+内容文本+确认/取消两个按钮"

生成的 HTML：

```html
<div class="canvas">
  <!-- 半透明遮罩 -->
  <div data-type="layout" data-name="block"
       data-x="0" data-y="0" data-w="1920" data-h="1080"
       data-adapter="all" data-bg-color="#00000099" data-block="true"
       style="left:0; top:0; width:1920px; height:1080px; background:rgba(0,0,0,0.6);">

    <!-- 主面板 -->
    <div data-type="layout" data-name="main_frame"
         data-x="660" data-y="340" data-w="600" data-h="400"
         style="left:660px; top:340px; width:600px; height:400px; background:rgba(30,40,60,0.9); border-radius:8px;">

      <!-- 标题 -->
      <div data-type="label" data-name="label_title"
           data-x="100" data-y="30" data-w="400" data-h="40"
           data-text="确认操作" data-font-size="28" data-color="#ffffff" data-align="center,middle"
           style="left:100px; top:30px; width:400px; height:40px;">
        确认操作
      </div>

      <!-- 内容文本 -->
      <div data-type="label" data-name="label_content"
           data-x="50" data-y="100" data-w="500" data-h="160"
           data-text="你确定要执行此操作吗？" data-font-size="20" data-color="#cccccc" data-align="center,middle"
           style="left:50px; top:100px; width:500px; height:160px;">
        你确定要执行此操作吗？
      </div>

      <!-- 确认按钮 -->
      <div data-type="button" data-name="button_confirm"
           data-x="100" data-y="310" data-w="160" data-h="50"
           data-text="确 认" data-font-size="18"
           style="left:100px; top:310px; width:160px; height:50px;">
        确 认
      </div>

      <!-- 取消按钮 -->
      <div data-type="button" data-name="button_cancel"
           data-x="340" data-y="310" data-w="160" data-h="50"
           data-text="取 消" data-font-size="18"
           style="left:340px; top:310px; width:160px; height:50px;">
        取 消
      </div>
    </div>
  </div>
</div>
```

转换命令：
```bash
python scripts/html_to_y3_ui.py confirm_preview.html maps/EntryMap/ui/ConfirmPopup.json --panel-name ConfirmPopup --zorder 500
```
