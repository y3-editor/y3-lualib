---
name: y3-ui-generator
description: "从自然语言描述生成Y3编辑器UI面板JSON文件。工作流：用户描述UI需求 → 生成HTML布局预览 → 转换为Y3 JSON。当用户想要创建新的UI画板、生成UI布局、从描述生成界面时使用。触发词：生成UI、创建画板、生成面板JSON、UI生成、新建UI、从描述生成界面、generate UI、create panel。注意：本技能专注于生成UI JSON结构文件，不涉及Lua逻辑代码（Lua代码请使用 y3-ui-builder 技能）。"
---

# Y3 UI Generator

从自然语言描述生成 Y3 编辑器兼容的 UI 面板 JSON 文件。

## 工作流概览

**重要：收到用户需求后，一次性完成所有步骤，不需要在中间停下来等待确认。**

```
用户描述 UI 需求
       ↓
Step 1: 生成结构草图（文本 + UI 树）— 直接输出，不等确认
       ↓
Step 2: 生成 HTML 预览文件并保存到临时位置
       ↓
Step 3: 调用 html_to_y3_ui.py 转换为 Y3 JSON
       ↓
Step 4: 在浏览器中打开 HTML 预览
       ↓
Step 5: 调用 y3editor MCP 热更 UI 编辑器（hotfix_ui_editor）
       ↓
Step 6: 🔴 删除 HTML 临时文件（强制，不可跳过）
       ↓
输出到 maps/EntryMap/ui/<PanelName>.json
```

整个流程一气呵成，最终向用户展示：结构草图 + 转换结果 + 浏览器预览。

## Step 1: 理解需求，生成结构草图

收到用户的 UI 描述后，立即规划结构并输出草图，然后直接继续后续步骤：

```
面板名称: ShopPanel
设计分辨率: 1920×1080

UI 树:
├── layout: bg (全屏半透明遮罩, 适配=all)
├── layout: main_frame (居中主框架 800×600, 适配=无)
│   ├── image: image_bg (背景图, 适配=all)
│   ├── label: label_title (标题文字, 顶部居中)
│   ├── layout: scroll_content (商品列表区域)
│   │   ├── layout: item_slot_1 (商品槽位1)
│   │   ├── layout: item_slot_2 (商品槽位2)
│   │   └── layout: item_slot_3 (商品槽位3)
│   └── button: button_close (关闭按钮, 右上角)
```

输出草图后立即进入 Step 2，不等待用户确认。

## Step 2: 生成 HTML 预览

### HTML 编写规范

HTML 文件使用 `data-*` 属性来描述 Y3 UI 节点。每个 `<div>` 对应一个 UI 节点。

**坐标系统**：使用 HTML 标准坐标（左上角为原点，Y轴向下）。转换脚本会自动转为 Y3 坐标（左下角原点，Y轴向上）。

### 必需属性

| 属性 | 说明 | 示例 |
|------|------|------|
| `data-type` | 控件类型 | `layout` / `label` / `image` / `button` |
| `data-name` | 节点名称（Lua代码引用名） | `label_title` |
| `data-x` | 相对父节点的 X 偏移（左上角） | `100` |
| `data-y` | 相对父节点的 Y 偏移（左上角） | `200` |
| `data-w` | 宽度 | `400` |
| `data-h` | 高度 | `50` |

### 可选通用属性

| 属性 | 说明 | 默认值 |
|------|------|--------|
| `data-adapter` | 适配方向（逗号分隔） | 无适配 |
| `data-anchor` | 锚点 | 无 |

**data-adapter 值**：`top`, `bottom`, `left`, `right`, `all`（全部开启）

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
3. **命名规范**：遵循 y3-ui-builder 的前缀命名规则（`label_xxx`, `button_xxx`, `image_xxx` 等），这样 Lua 代码可以自动绑定 Widget
4. **颜色区分**：不同类型的节点使用不同背景色，方便在浏览器中查看布局

## Step 3: 转换为 Y3 JSON

HTML 生成后立即执行转换，不等待用户确认：

```bash
python scripts/html_to_y3_ui.py <preview.html> <output.json> --panel-name <PanelName> --zorder 300
```

**转换器路径**：`scripts/html_to_y3_ui.py`（技能内置）

**输出位置**：`maps/EntryMap/ui/<PanelName>.json`

## Step 4: 打开预览

转换完成后：
1. 在浏览器中打开 HTML 预览文件供用户查看布局效果
2. 向用户展示完整的生成结果摘要（节点树、Widget 列表等）

用户如果对布局不满意，可以提出修改需求，重新走一遍流程。

## Step 5: 热更 UI 编辑器

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

## Step 6: 🔴 删除 HTML 临时文件（强制）

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

### 转换器的坐标处理

转换器自动处理以下转换：
- HTML 坐标（左上角原点）→ Y3 坐标（左下角原点）
- 像素位置 → 中心点坐标 + 百分比坐标
- CSS-like 定位 → adapter_option 边距系统
- 嵌套节点的 parent 尺寸传递

## 适配规则速查

需要深入了解适配系统时，请读取 → [references/adapter-rules.md](references/adapter-rules.md)

常用模式：

| 场景 | data-adapter 值 |
|------|-----------------|
| 全屏铺满 | `all` |
| 固定在顶部 | `top,left,right` |
| 固定在底部 | `bottom,left,right` |
| 左上角固定 | `top,left` |
| 右上角固定 | `top,right` |
| 居中不适配 | 不设置 |

## Y3 类型映射

| data-type | Y3 type 值 | Y3 控件名 | 用途 |
|-----------|-----------|-----------|------|
| `layout` | 7 | 空节点 | 容器、分组、背景框 |
| `label` | 3 | 文本 | 标题、描述、数值显示 |
| `image` | 4 | 图片 | 图标、背景图、装饰 |
| `button` | 1 | 按钮 | 可点击交互元素 |

## 复合控件模板

当生成 UI 时需要使用常见的游戏控件（血条、技能框等），**不需要手动编写子节点**，直接使用 `data-template` 属性引用预制模板。转换器会自动将模板 JSON 注入到该节点位置，并根据指定的 `data-x/y/w/h` 调整位置和尺寸。

> **完整模板配置**（模板列表、识别关键字、内部结构）请读取 → [widget_template_config.md](widget_template_config.md)

### 可用模板速查

| data-template 值 | 模板名 | 说明 | 默认尺寸 | 模板文件 |
|------------------|--------|------|----------|----------|
| `hp_bar` | 血条 | 进度条式血量显示，含背景图+填充条+数值文字 | 256×38 | `templates/hp_bar.json` |
| `mp_bar` | 魔法条 | 进度条式魔力显示，结构同血条 | 256×38 | `templates/mp_bar.json` |
| `skill` | 技能框 | 含背景、边框、图标、CD遮罩、等级文字、快捷键标签、升级按钮 | 150×230 | `templates/skill.json` |
| `buff_list` | Buff列表 | 横向排列的魔法效果图标列表（8个槽位），每个含图标+时间进度+层数 | 400×50 | `templates/buff_list.json` |
| `chat_box` | 聊天框 | 含聊天消息滚动列表、输入框、发送按钮、频道切换 | 332×268 | `templates/chat_box.json` |
| `card` | 卡牌 | 羁绊卡牌，含卡面背景、边框、头像、奖励描述、标签列表、悬浮效果 | 354×500 | `templates/card.json` |
| `close_btn` | 关闭按钮 | 圆形背景底图+关闭图标按钮，常用于面板右上角 | 50×50 | `templates/close_btn.json` |

### 使用方法

在 HTML 中只需声明一个占位 div，指定 `data-template` 和位置/尺寸：

```html
<!-- 血条：放在左下角 -->
<div data-template="hp_bar" data-name="hp_bar"
     data-x="20" data-y="950" data-w="256" data-h="38"
     style="left:20px; top:950px; width:256px; height:38px; background:rgba(255,50,50,0.3);">
    HP Bar
</div>

<!-- 技能框：放在底部中间 -->
<div data-template="skill" data-name="skill"
     data-x="885" data-y="850" data-w="150" data-h="230"
     style="left:885px; top:850px; width:150px; height:230px; background:rgba(100,100,255,0.3);">
    Skill
</div>

<!-- Buff 列表 -->
<div data-template="buff_list" data-name="buff_list"
     data-x="300" data-y="950" data-w="400" data-h="50"
     style="left:300px; top:950px; width:400px; height:50px; background:rgba(200,200,50,0.3);">
    Buff List
</div>
```

### 转换器行为

当转换器遇到 `data-template="xxx"` 时：
1. 从 `templates/xxx.json` 加载完整的控件 JSON 结构
2. 使用 `data-name` 作为模板根节点的名称
3. 使用 `data-x/y/w/h` 重新计算模板根节点的 `pos_data`（坐标转换为 Y3 坐标系）
4. 保留模板内部所有子节点的相对结构和属性不变
5. 为模板内所有节点生成新的 UUID

### 模板内部结构参考

#### hp_bar (type=41, 进度条)
```
hp_bar (type=41, 256×38)
├── progress_bg_img (type=4, 背景图 img=133173)
├── progress_bar_img (type=39, 填充条)
└── progress_percent_label (type=3, 文字 "50/100")
```

#### mp_bar (type=41, 进度条)
```
mp_bar (type=41, 256×38)
├── progress_bg_img (type=4, 背景图 img=133173)
├── progress_bar_img (type=39, 填充条)
└── progress_percent_label (type=3, 文字 "50/100")
```

#### skill (type=7, 容器)
```
skill (type=7, 150×230)
├── skill_bg (type=4, 背景 img=906366, 九宫格)
├── skill_frame (type=4, 边框 img=904120, 九宫格)
└── skill_btn (type=17, 按钮容器)
    ├── skill_icon_img (type=4, 技能图标 img=100070)
    ├── skill_frame_img (type=4, 图标边框 img=903689)
    ├── skill_cd_progress (type=5, CD进度 圆形遮罩)
    ├── skill_cd_label (type=3, CD倒计时文字)
    ├── skill_stack_label (type=3, 层数)
    ├── skill_upgrade_btn (type=1, 升级按钮)
    ├── skill_shortcut_label (type=3, 快捷键 "Q")
    ├── skill_level_label (type=3, 等级 "lv.1")
    ├── skill_consume_mask_img (type=4, 消耗不足遮罩)
    ├── skill_disable_img (type=4, 禁用遮罩)
    │   └── skill_frame_img (type=4)
    └── skill_charge_progress (type=42, 充能进度)
```

#### buff_list (type=18, 横向列表)
```
buff_list (type=18, 400×50)
└── buff_item_1~8 (type=19, 每个48×48)
    ├── buff_grond_frame (type=4, 底框 img=131975)
    ├── buff_time_progress (type=5, 增益时间进度)
    ├── buff_time_progress_bad (type=5, 减益时间进度)
    ├── buff_icon_black (type=7, 黑底)
    ├── buff_icon_img (type=4, buff图标 img=131418)
    └── buff_stack_label (type=3, 层数文字)
```

#### chat_box (type=32, 聊天控件)
```
chat_box (type=32, 332×268)
├── scroll_view_chat (type=10, 消息列表)
│   └── label_template (type=60, 消息模板)
├── input (type=7, 输入区域)
│   ├── button_send (type=1, 发送按钮)
│   ├── scroll_view_channel (type=10, 频道切换)
│   │   ├── button_alliance (type=1, 同盟频道)
│   │   └── button_all (type=1, 全部频道)
│   └── image_19 (type=4, 输入框背景)
│       └── input_field (type=15, 输入控件)
└── image_20 (type=4, 装饰)
```

## 图片资源配置

> **完整资源配置**（图片预设、按钮预设、自动背景图、默认值）请读取 → [icon_config.md](icon_config.md)

## 自动背景图注入

转换器会自动检查每个 layout (type=7) 节点，如果没有背景图片子节点，则在 children 列表的开头（index=0，最底层）插入一个默认背景图。

### 判断规则

一个 layout 被认为"已有背景图"当且仅当：
- 其 children 中存在一个 **image (type=4)** 节点
- 该 image 的 **名称包含** `bg`、`background` 等关键词
- 该 image 的 **面积 ≥ layout 面积的 80%**

如果以上条件不满足，则自动注入。

### 背景图资源选用规则

| 条件 | 图片 ID | 说明 |
|------|---------|------|
| 宽 = 1920 **且** 高 = 1080 | `999` | 全屏面板 |
| 宽 > 800 **且** 高 > 800 | `110072` | 大面板 |
| 800 > 宽 > 200 **且** 800 > 高 > 200 | `110072` | 中小面板 |
| 宽 < 200 **且** 高 < 200 | `120089` | 极小控件 |
| *(尺寸未命中)* 宽高比 > 3 | `134092` | 宽条/进度条 |
| *(尺寸未命中)* 3 > 宽高比 > 2 | `100062` | 横幅/标题栏 |
| 其他 | `999` | 默认 |

### 自动注入的节点属性

- **名称**: `{layout名}_bg`（如 `widget_skill_bar_bg`）
- **类型**: image (type=4)
- **尺寸**: 与 layout 完全相同
- **适配**: 四向全开 (adapter=all)
- **九宫格**: 关闭
- **位置**: children[0]（最底层）

### 跳过条件

以下情况 **不会** 自动注入：
1. 用户已在 HTML 中手动添加了带 `bg` 关键词的大图片
2. 模板节点 (`data-template`) 的内部结构
3. 非 layout 类型的节点

如果不想让某个 layout 自动注入背景，在 HTML 中手动添加一个 `image_xxx_bg` 子节点即可。

## 注意事项

1. **模板不通过 HTML→JSON 转换生成**：模板 JSON 是从实际项目中提取的完整 Y3 控件结构，保留了所有引擎特有的类型（type=5/17/18/19/32/39/41/42/60等）
2. **位置可调、结构不可改**：可以通过 `data-x/y/w/h` 调整模板的放置位置，但内部子节点结构保持不变
3. **命名可覆盖**：`data-name` 会替换模板根节点的 `name` 字段，内部子节点命名保持原样
4. **尺寸缩放**：如果指定的 `data-w/h` 与模板默认尺寸不同，转换器会按比例缩放内部子节点

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
