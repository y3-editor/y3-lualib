---
name: y3-ui-generator
description: "从自然语言描述生成Y3编辑器UI面板JSON文件。工作流：用户描述UI需求 → 生成HTML布局预览 → 转换为Y3 JSON。当用户想要创建新的UI画板、生成UI布局、从描述生成界面时使用。触发词：生成UI、创建画板、生成面板JSON、UI生成、新建UI、从描述生成界面、generate UI、create panel。注意：本技能专注于生成UI JSON结构文件，不涉及Lua逻辑代码（Lua代码请使用 y3-ui-builder 技能）。"
---

# Y3 UI Generator

从自然语言描述生成 Y3 编辑器兼容的 UI 面板 JSON 文件。

## 工作流概览

**重要：流程分阶段确认，在关键节点等待用户反馈后再继续。**

```
用户描述 UI 需求
       ↓
Step 0.5: 📋 模板清单（列出所有将使用的模板及其尺寸）
       ↓
Step 1: 生成结构草图（文本 + UI 树，基于模板尺寸）
       ↓
Step 1.5: 🔄 草图确认（询问用户是否满意，支持多轮修改）
       ↓ 用户确认满意
Step 2: 生成 HTML 预览文件并保存到临时位置
       ↓
Step 2.5: 🔍 布局检查（超框检测 + 同级重叠检测）
       ↓ 无问题或用户忽略
Step 3: 在浏览器中打开 HTML 预览
       ↓
Step 3.5: 🔄 预览确认（询问用户是否满意，支持多轮调整）
       ↓ 用户确认满意
Step 4: 调用 html_to_y3_ui.py 转换为 Y3 JSON
       ↓
Step 5: 调用 y3editor MCP 热更 UI 编辑器（hotfix_ui_editor）
       ↓
Step 5.5: 📦 下载依赖资源（download_editor_icon_resource）
       ↓
Step 6: 🔴 删除 HTML 临时文件（强制，不可跳过）
       ↓
输出到 maps/EntryMap/ui/<PanelName>.json
```

流程分阶段确认，用户在草图和预览两个关键节点有机会修改，确认满意后再继续下一步。

## Step 0.5: 📋 模板清单

收到用户的 UI 描述后，**首先**分析需求中涉及的复合控件模板，输出模板清单表格。

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

### 缩放比例显示规则

| 场景 | 说明列内容 |
|------|-----------|
| 计划尺寸 = 默认尺寸 | "使用默认尺寸" |
| 计划尺寸 > 默认尺寸 | "等比放大 1.5x"（保留一位小数） |
| 计划尺寸 < 默认尺寸 | "等比缩小 0.8x"（保留一位小数） |

### 无模板场景

如果用户需求不涉及任何预制模板（如简单弹窗只有文字和按钮），输出：

```markdown
### 模板清单

无需使用预制模板，所有控件将手动创建。
```

### 模板尺寸数据来源

**必须**从 `widget_template_config.md` 的"模板列表"表格读取默认尺寸，**禁止**使用硬编码或估算值。

输出模板清单后，立即进入 Step 1 生成草图。

## Step 1: 理解需求，生成结构草图

**重要**：草图中的模板控件尺寸**必须**与 Step 0.5 模板清单中的"计划尺寸"一致。

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

### 尺寸一致性规则

1. 模板控件的尺寸**必须**与模板清单中的"计划尺寸"完全一致
2. 如果需要调整尺寸，**必须**先修改模板清单，再更新草图
3. 手动控件的尺寸可自由设定

输出草图后进入 Step 1.5 确认环节。

## Step 1.5: 🔄 草图确认

生成结构草图后，**必须**使用 `ask_user_question` 工具询问用户是否满意。

### 确认对话

```
问题: 请确认上方的 UI 结构草图是否符合预期
选项:
  - "满意，继续生成 HTML (Recommended)"
  - "需要修改"
```

### 处理规则

| 用户选择 | 操作 |
|----------|------|
| 满意，继续生成 HTML | 立即进入 Step 2 生成 HTML |
| 需要修改 | 根据用户描述调整草图，然后**再次询问确认**（循环） |

### 多轮修改说明

- 支持用户多次修改，直到选择"满意"
- 每次修改后只输出修改后的草图，不重复完整内容
- 修改后必须再次调用 `ask_user_question` 确认
- 用户可在任意轮次选择"满意"退出循环

## Step 2: 生成 HTML 预览

### ⚠️ 尺寸继承规则

**HTML 中的 `data-w/h` 必须与草图中的尺寸完全一致，禁止重新估算！**

| 草图中的控件 | HTML 中的属性 |
|-------------|--------------|
| `[skill] skill_q (100×100)` | `data-w="100" data-h="100"` |
| `[hp_bar] hero_hp (300×44)` | `data-w="300" data-h="44"` |
| `label: hero_name (200×30)` | `data-w="200" data-h="30"` |

草图已经过用户确认（Step 1.5），尺寸是可信的，不需要也不应该在 HTML 阶段重新估算。

### HTML 编写规范

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

## Step 2.5: 🔍 布局检查（强制）

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

**无问题时**：静默通过，直接进入 Step 3

**有问题时**：输出警告信息，使用 `ask_user_question` 询问用户

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
| 忽略问题，继续预览 | 进入 Step 3 打开预览（警告已告知用户） |

### 自动修复建议

检测到问题时，可在警告信息后附加修复建议：

```markdown
**建议修复**：
- `center_area`: 将 w 从 1300 改为 1200，或将 x 从 700 改为 600
- `left_panel` 与 `center_area` 重叠: 将 center_area 的 x 从 400 改为 550
```

## Step 3: 打开预览

HTML 生成后：
1. 在浏览器中打开 HTML 预览文件供用户查看布局效果
2. 向用户展示当前的布局摘要

然后进入 Step 3.5 确认环节。

## Step 3.5: 🔄 预览确认

HTML 预览在浏览器中打开后，**必须**使用 `ask_user_question` 工具询问用户是否满意。

### 确认对话

```
问题: HTML 预览已在浏览器中打开，请确认布局效果
选项:
  - "满意，转换为 JSON (Recommended)"
  - "需要调整"
```

### 处理规则

| 用户选择 | 操作 |
|----------|------|
| 满意，转换为 JSON | 立即进入 Step 4 执行转换 |
| 需要调整 | 根据用户描述修改 HTML 文件，然后**重新打开预览并再次询问确认**（循环） |

### 多轮调整说明

- 支持用户多次调整，直到选择"满意"
- 每次调整后修改 HTML 文件内容
- 修改后必须重新执行浏览器打开命令（让用户看到更新后的布局）
- 重新打开后必须再次调用 `ask_user_question` 确认
- 用户可在任意轮次选择"满意"退出循环

## Step 4: 转换为 Y3 JSON

用户确认预览满意后，执行转换：

```bash
python scripts/html_to_y3_ui.py <preview.html> <output.json> --panel-name <PanelName> --zorder 300
```

**转换器路径**：`scripts/html_to_y3_ui.py`（技能内置）

**输出位置**：`maps/EntryMap/ui/<PanelName>.json`

转换完成后向用户展示生成结果摘要（节点树、Widget 列表等）。

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

## Step 5.5: 📦 下载依赖资源

热更完成后，调用 y3editor MCP 下载 UI 中使用的图标资源，确保编辑器中资源完整：

```
use_mcp_tool:
  server_name: y3editor
  tool_name: download_editor_icon_resource
  arguments: {"editor_icon_id_list": [<UI中使用的图片ID列表>]}
```

### 资源收集规则

从生成的 JSON 中提取所有 `img` 字段值（图片资源 ID），去重后作为参数传入。

**示例**：如果 UI 中使用了 `img=134219690`、`img=110072`、`img=999`，则调用：

```
arguments: {"editor_icon_id_list": [134219690, 110072, 999]}
```

### 规则

| 场景 | 操作 |
|------|------|
| 下载成功 | 在结果摘要追加 "📦 已下载 N 个依赖资源" |
| 下载失败或 MCP 不可用 | 提示 "⚠️ 资源下载失败，请在编辑器中手动下载"，不阻塞流程 |
| 无图片资源 | 跳过此步骤 |

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

在 HTML 中只需声明一个占位 div，指定 `data-template` 和位置/尺寸。

**⚠️ 尺寸必须与草图一致**：`data-w/h` 的值必须与 Step 1 草图中的模板尺寸完全相同。

```html
<!-- 血条：草图中为 [hp_bar] hero_hp (300×44)，等比放大 1.17x -->
<div data-template="hp_bar" data-name="hero_hp"
     data-x="20" data-y="880" data-w="300" data-h="44"
     style="left:20px; top:880px; width:300px; height:44px; background:rgba(255,50,50,0.3);">
    HP Bar (300×44)
</div>

<!-- 技能框：草图中为 [skill] skill_q (100×100)，使用默认尺寸 -->
<div data-template="skill" data-name="skill_q"
     data-x="860" data-y="930" data-w="100" data-h="100"
     style="left:860px; top:930px; width:100px; height:100px; background:rgba(100,100,255,0.3);">
    Skill Q (100×100)
</div>

<!-- 小地图：草图中为 [minimap] minimap (211×211)，使用默认尺寸 -->
<div data-template="minimap" data-name="minimap"
     data-x="1689" data-y="869" data-w="211" data-h="211"
     style="left:1689px; top:869px; width:211px; height:211px; background:rgba(100,255,100,0.3);">
    Minimap (211×211)
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
