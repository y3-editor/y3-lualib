---
name: y3-ui-beautify
description: >
  Y3 UI 美化技能（现有 UI 的布局调整、视觉优化与交互层优化）。

  适用于：调整布局、修改位置/大小、界面美化、卡片排版优化、标题样式优化、按钮层级优化、点击区优化、透明点击层、图片资源替换等。

  典型触发：
  - "调整UI布局"
  - "修改按钮位置"
  - "把这个面板改大一点"
  - "调整间距"
  - "美化这个UI"
  - "优化这个面板的视觉"
  - "按钮挡住内容了"
  - "把点击区改成整卡透明"
  - "换个更好看的背景图"
  
  调用方式：
  - 直接触发（用户请求调整布局或美化）
  - 由 y3-ui-pipeline 在 UI 生成后询问用户是否美化时调用
---

# y3-ui-beautify

用于在**不改核心玩法逻辑**的前提下，对现有 UI JSON 做**布局调整**、视觉和交互层优化。

## 目标

1. **调整布局**（位置、大小、间距、对齐）
2. 提升视觉层次（标题、遮罩、卡片、按钮）
3. 优化交互手感（点击区大小、命中稳定性）
4. 避免层级遮挡（按钮覆盖文本/图标）
5. 统一图片资源（使用验证过的图片 ID）

## 核心原则

1. 先保留结构，再改样式  
   - 优先修改 `pos_data/size/font/font_color/opacity`
   - 不随意删除控件，避免破坏脚本绑定路径
2. 交互与视觉分层  
   - 交互层可透明（`opacity: 0`）
   - 视觉层负责显示，交互层负责命中
3. 避免"透明全屏挡板"  
   - 透明按钮可整卡覆盖，但不要覆盖到其他卡片/区域
4. 文本默认居中  
   - 美化 UI 时，文本组件默认做**水平居中 + 垂直居中**
   - 除非业务明确要求（如左对齐日志面板），否则不改为左/右偏移
5. **图片 ID 必须查表**  
   - 更换图片资源时，必须使用 `IMAGE_ID_REGISTRY.md` 中的验证过的 ID
   - 禁止凭空编造图片 ID，会导致显示异常

## 推荐流程

1. 定位目标 UI 文件（如 `maps/EntryMap/ui/HeroSelectPanel.json`）
2. **调整布局**（位置、大小、间距）
3. 调整视觉参数（标题、卡片、文案、按钮位置）
4. **查阅 `IMAGE_ID_REGISTRY.md` 选择合适的图片资源**
5. 处理点击层（小点击区或整卡透明点击区）
6. 确认 Lua 绑定路径仍可用（如 `card_container.card_1.select_BTN`）
7. 热更 UI → 等待 3 秒 → 保存

## 布局调整指南

### 核心字段

| 字段 | 说明 | 示例 |
|------|------|------|
| `pos_data` | 位置 `[x, y, x%, y%, mode_x, mode_y]` | `[100, 200, 0, 0, 0, 0]` |
| `size` | 尺寸 `[width, height]` | `[320, 440]` |
| `anchor` | 锚点 `[x, y]` (0-1) | `[0.5, 0.5]` 居中 |

### Y3 坐标系（重要！）

⚠️ **Y3 原点在左下角，Y 轴向上！**

```
     ▲ Y+
     │
     │    控件
     │
     └────────────► X+
   (0,0)
```

### 常用布局模式

#### 1. 水平排列（如技能栏）
```json
// 技能 Q: x=910
{"name": "skill_q", "pos_data": [910, 80, 0, 0, 0, 0], "size": [80, 80]}
// 技能 W: x=1010 (间距 20px)
{"name": "skill_w", "pos_data": [1010, 80, 0, 0, 0, 0], "size": [80, 80]}
// 技能 E: x=1110
{"name": "skill_e", "pos_data": [1110, 80, 0, 0, 0, 0], "size": [80, 80]}
```

#### 2. 垂直排列（如选项列表）
```json
// 选项 1: y=400
{"name": "option_1", "pos_data": [960, 400, 0, 0, 0, 0], "size": [300, 60]}
// 选项 2: y=320 (间距 20px)
{"name": "option_2", "pos_data": [960, 320, 0, 0, 0, 0], "size": [300, 60]}
// 选项 3: y=240
{"name": "option_3", "pos_data": [960, 240, 0, 0, 0, 0], "size": [300, 60]}
```

#### 3. 居中布局（百分比模式）
```json
// 面板居中
{
  "pos_data": [0, 0, 50, 50, 1, 1],  // 50%, 50% 位置
  "anchor": [0.5, 0.5],              // 中心锚点
  "size": [800, 600]
}
```

#### 4. 卡片网格（如三选一）
```json
// 左卡片
{"name": "card_1", "pos_data": [340, 300, 0, 0, 0, 0], "size": [320, 440]}
// 中卡片 (间距 40px)
{"name": "card_2", "pos_data": [700, 300, 0, 0, 0, 0], "size": [320, 440]}
// 右卡片
{"name": "card_3", "pos_data": [1060, 300, 0, 0, 0, 0], "size": [320, 440]}
```

### 间距计算公式

```
下一个X = 当前X + 当前宽度 + 间距
下一个Y = 当前Y - 当前高度 - 间距  (Y轴向上，所以减)
```

### 常见布局问题

| 问题 | 原因 | 解决 |
|------|------|------|
| 控件重叠 | 位置计算错误 | 检查 pos_data 和 size |
| 控件显示在屏幕外 | Y 坐标方向搞反 | 记住原点在左下角 |
| 子控件位置偏移 | 子控件坐标相对于父容器 | 子控件使用相对坐标 |
| 缩放后位置错乱 | 使用了绝对坐标 | 改用百分比模式 |

## 图片资源管理

### ⚠️ 必读：IMAGE_ID_REGISTRY

美化 UI 时涉及图片更换，**必须先查阅** `references/IMAGE_ID_REGISTRY.md`。

该文件按场景分类整理了常用图片 ID：
- 卡牌背景、选中高亮、分隔线
- 头像组件（遮罩、边框、底图）
- HUD 状态条、技能栏、物品格
- 按钮背景、小地图组件

### 图片 ID 使用示例

```json
// 卡牌背景
{"type": 4, "image": 134269971, ...}

// 按钮背景
{"type": 1, "normal_picture": 134264792, ...}

// 圆形头像遮罩
{
  "type": 7,
  "clip_enabled": true,
  "clipping_type": 1,
  "mask_image": 134254385
}
```

### 常用图片 ID 速查

| 用途 | 图片 ID | 说明 |
|------|--------|------|
| 卡牌主背景 | `134269971` | 深色卡面 |
| 选中高亮边框 | `134226134` | 卡片选中效果 |
| 圆形遮罩 | `134254385` | 头像裁剪 |
| 通用按钮(蓝) | `134264792` | 功能按钮 |
| 通用按钮(橙) | `134249578` | 操作按钮 |

> 完整列表见 `references/IMAGE_ID_REGISTRY.md`

## 常见问题与做法

### 问题：按钮挡住内容

原因：
- 按钮在同级末尾，层级更高
- 点击区过大且可见，视觉上覆盖文本/图标

做法：
- 若要整卡可点：按钮设为 `opacity: 0`（透明）
- 若不想整卡可点：缩小按钮到底部条区

### 问题：点击手感不好

做法：
- 从小点击区切换为整卡透明点击区
- 保证卡片任意区域都可触发选择

### 问题：图片显示异常/空白

原因：
- 使用了不存在的图片 ID
- 凭空编造的 ID 无法被引擎识别

做法：
- 查阅 `IMAGE_ID_REGISTRY.md` 使用验证过的 ID
- 无合适 ID 时省略该字段，让用户在编辑器中手动设置

## 批量修改功能

### 脚本工具

本技能集成了批量修改脚本 `pipeline/patch_ui_json.py`，可批量修改 UI JSON 字段。

### 用法

#### 1. 交互式修改（--set-node + --set-field）

```bash
py -3 .codemaker/skills/y3-ui-beautify/pipeline/patch_ui_json.py <ui_json_path> \
  --set-node "choices.choice_1.name" \
  --set-field "alignment.items=[2,8]"
```

多个修改：
```bash
py -3 .codemaker/skills/y3-ui-beautify/pipeline/patch_ui_json.py <ui_json_path> \
  --set-node "title" --set-field "alignment.items=[2,8]" \
  --set-node "choices.choice_1.desc" --set-field "alignment.items=[2,8]"
```

#### 2. 配置文件模式（--config）

```bash
py -3 .codemaker/skills/y3-ui-beautify/pipeline/patch_ui_json.py <ui_json_path> --config patch_config.json
```

配置文件示例：
```json
{
  "choices.choice_3.name": {
    "set": { "alignment.items": [2, 8] }
  },
  "*.txt": {
    "set": { "alignment.items": [2, 8] }
  }
}
```

### 支持的批量操作

| 场景 | 示例 |
|------|------|
| 批量改对齐 | `--set-field "alignment.items=[2,8]"` |
| 批量改位置 | `--set-field "pos_data.items=[100,200,0,0,0,0]"` |
| 批量改字体 | `--set-field "font=24"` |
| 通配符匹配 | 配置文件中使用 `*.txt` 匹配所有名为 txt 的节点 |

### ⚠️ 修改后必做

1. 热更 UI（`hotfix_ui_editor`）
2. 等待 3 秒
3. 保存（`save_editor`）

## 参考文档

- `references/UI_BEAUTIFY_GUIDE.md` - 美化方案详细指南
- `references/IMAGE_ID_REGISTRY.md` - 图片 ID 速查表
- `pipeline/patch_ui_json.py` - 批量修改脚本
