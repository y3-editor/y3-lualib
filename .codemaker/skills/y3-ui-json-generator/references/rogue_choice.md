# 肉鸽三选一 (Rogue Choice) 界面规范 V2

> 基于实战项目 `BondPickCardCmp.json` 提炼的标准骨架规范。
> 生成三选一界面时 **必须** 阅读本文档。

## 概述

肉鸽三选一界面是 Roguelike 游戏中常见的奖励选择界面。玩家在完成关卡或达成条件后，弹出包含三个卡片选项的界面。

**典型使用场景**:
- 击败 BOSS 后选择英雄/技能强化
- 升级后选择天赋/羁绊
- 开宝箱后选择道具/卡牌

---

## 界面整体结构

```
WorldUILayer (type=2, 根节点)
│
├── Image(bg_mask) ──── 全屏半透明黑色遮罩
│
├── TextLabel(label_title) ──── 标题："请选择一个奖励"
│
└── ScrollView(scroll_cards) ──── 水平滚动容器 (type=10, layout_type=2)
    │
    ├── Image(card_1) ──── 卡片1 (BondPickCardCmp 风格)
    ├── Image(card_2) ──── 卡片2
    └── Image(card_3) ──── 卡片3
```

**ASCII 布局示意**：
```
┌────────────────────────────────────────────────────────────┐
│                   bg_mask (全屏半透明遮罩)                   │
│                                                            │
│              ╔══════════════════════════╗                   │
│              ║   label_title: 请选择     ║   Y≈85%          │
│              ╚══════════════════════════╝                   │
│                                                            │
│    ┌──────────┐    ┌──────────┐    ┌──────────┐            │
│    │  card_1  │    │  card_2  │    │  card_3  │  Y≈45%     │
│    │ 354x591  │    │ 354x591  │    │ 354x591  │            │
│    └──────────┘    └──────────┘    └──────────┘            │
│                                                            │
│         scroll_cards (水平ScrollView, margin=20)           │
└────────────────────────────────────────────────────────────┘
```

### ScrollView 配置要点

| 属性 | 值 | 说明 |
|------|-----|------|
| type | 10 | ScrollView |
| layout_type | **2** | HORIZONTAL (水平排列) |
| margin | 20 | 卡片间距 20px |
| block_scrolling | true | 禁止用户滚动（固定3张） |
| pos_data Y_PCT | ~45% | 垂直居中偏下 |
| size | ~1200x650 | 容纳 3 张卡片+间距 |

---

## 卡片层级结构

> 参照 `BondPickCardCmp.json` 提炼，每张卡片是一个 Image 作为根容器。

```
Image(heroBg) ─── 卡片主背景容器 [354×591]
│
├── Image(commonBg) ─── 内容区深色背景 [335×572]
│   └── Image(line) ─── 水平分隔线 [274×4]
│
├── Layout(avatar) ─── 头像区域 [106×106]  ← 圆形遮罩模式
│   ├── Image(bg) ─── 头像底图 [94×94]
│   ├── Layout(mask) ─── 遮罩容器 [72×72, clip_enabled=true]
│   │   └── Image(icon) ─── 实际头像图片 [72×72]
│   └── Image(frame) ─── 头像边框 [116×116]
│
├── Image(title) ─── 标题条背景 [203×46]
│   └── TextLabel(bond_TEXT) ─── 品质/羁绊名称文本
│
├── TextLabel(title_TEXT) ─── 卡片主名称 [300×30]
│
├── Layout(bondIcon) ─── 羁绊图标组 [84×84, scale=0.75]  ★可选
│   ├── Layout(mask) [clip_enabled] → Image(icon)
│   └── Image(frame)
│
├── Image(own) ─── 拥有计数条 [161×33]  ★可选
│   └── TextLabel(own_TEXT) ─── "羁绊 0/5"
│
└── ScrollView(attrList) ─── 属性描述区 [layout_type=1, VERTICAL]
    ├── TextLabel(condition_TEXT) ─── 触发条件文本
    ├── ScrollView(rewardList) ─── 奖励列表
    │   ├── TextLabel(title_TEXT) ─── "[获得奖励]"
    │   └── TextLabel(attr_TEXT) ─── "物理伤害加成 +10%"
    └── ScrollView(skillList) ─── 技能列表  ★可选
        └── ...
```

### 各子节点 Type 对照

| 节点名 | type | 组件类型 | 必须/可选 |
|--------|------|---------|----------|
| heroBg | 4 | Image | ✅ 必须 |
| commonBg | 4 | Image | ✅ 必须 |
| line | 4 | Image | ✅ 必须 |
| avatar | 7 | Layout | ✅ 必须 |
| avatar/bg | 4 | Image | ✅ 必须 |
| avatar/mask | 7 | Layout | ✅ 必须 |
| avatar/mask/icon | 4 | Image | ✅ 必须 |
| avatar/frame | 4 | Image | ✅ 必须 |
| title | 4 | Image | ✅ 必须 |
| title/bond_TEXT | 3 | TextLabel | ✅ 必须 |
| title_TEXT | 3 | TextLabel | ✅ 必须 |
| bondIcon | 7 | Layout | ⭐ 可选 |
| own | 4 | Image | ⭐ 可选 |
| own/own_TEXT | 3 | TextLabel | ⭐ 可选 |
| attrList | 10 | ScrollView | ✅ 必须 |

---

## 圆形头像遮罩模式

> 这是实际项目中实现圆形头像的标准方式，avatar 区域和 bondIcon 区域均使用此模式。

### 原理

使用 Layout (type=7) 的 `clip_enabled` + `clipping_type` + `mask_image` 三属性组合，将子节点的图片裁剪为指定形状（通常是圆形）。

### 关键属性

| 属性 | 值 | 说明 |
|------|-----|------|
| `clip_enabled` | `true` | 开启裁剪 |
| `clipping_type` | `1` | 使用 mask 图片裁剪 |
| `mask_image` | 图片ID | 蒙版图片（圆形白色图片） |
| `color` alpha | `0` | 遮罩容器自身透明 |

### JSON 代码片段

```json
{
    "type": 7,
    "name": "avatar",
    "size": {"__tuple__": true, "items": [106.0, 106.0]},
    "children": [
        {
            "type": 4,
            "name": "bg",
            "size": {"__tuple__": true, "items": [94.0, 94.0]},
            "pos_data": {"__tuple__": true, "items": [53.0, 53.0, 50.0, 50.0, 0, 0]},
            "children": []
        },
        {
            "type": 7,
            "name": "mask",
            "clip_enabled": true,
            "clipping_type": 1,
            "color": {"__tuple__": true, "items": [255, 255, 255, 0]},
            "size": {"__tuple__": true, "items": [72.0, 72.0]},
            "pos_data": {"__tuple__": true, "items": [42.0, 42.0, 50.0, 50.0, 0, 0]},
            "children": [
                {
                    "type": 4,
                    "name": "icon",
                    "size": {"__tuple__": true, "items": [72.0, 72.0]},
                    "pos_data": {"__tuple__": true, "items": [36.0, 36.0, 50.0, 50.0, 0, 0]},
                    "children": []
                }
            ]
        },
        {
            "type": 4,
            "name": "frame",
            "size": {"__tuple__": true, "items": [116.0, 116.0]},
            "pos_data": {"__tuple__": true, "items": [53.0, 53.0, 50.0, 50.0, 0, 0]},
            "children": []
        }
    ]
}
```

### 层级顺序说明

children 顺序 **必须** 为：`bg → mask(内含icon) → frame`
- `bg` 在最底层作为底图
- `mask` 在中间，裁剪 icon 为圆形
- `frame` 在最上层覆盖边框

⚠️ **骨架 UI 注意**：生成时省略 `mask_image` 属性（使用引擎默认值），用户需在编辑器中替换为实际的圆形蒙版图片。

---

## 推荐尺寸与位置参考值

### 卡片主容器 (heroBg)

| 属性 | 推荐值 | 来源 |
|------|--------|------|
| size | 354×591 | BondPickCardCmp |
| anchor | (0.5, 0.5) | 居中锚点 |

### 子控件尺寸表

| 控件 | 推荐 size | 推荐 Y_PCT (相对卡片) | 说明 |
|------|----------|---------------------|------|
| commonBg | 335×572 | 42.9% (Y_ABS≈290) | 内容背景，略小于卡片 |
| line | 274×4 | 7.3% (Y_ABS≈42) | 底部分隔线 |
| avatar | 106×106 | 71.3% (Y_ABS≈482) | 头像区域，卡片上部 |
| avatar/bg | 94×94 | 居中 | 头像底图 |
| avatar/mask | 72×72 | 居中 | 遮罩区域 |
| avatar/frame | 116×116 | 居中 | 边框略大于遮罩 |
| title | 203×46 | 84.9% (Y_ABS≈574) | 标题条，卡片顶部 |
| title_TEXT | 300×30 | 57.8% (Y_ABS≈391) | 卡片名称 |
| bondIcon | 84×84 (scale 0.75) | 79.5% (Y_ABS≈537) | 羁绊图标 |
| own | 161×33 | 63.1% (Y_ABS≈426) | 拥有计数条 |
| attrList | ~285×275 | ~30-45% 区域 | 属性描述滚动区 |

### 坐标系注意（Cocos2d-x 左下角原点）

⚠️ **口诀：「上大下小」** — 视觉顶部 = 大Y值，视觉底部 = 小Y值

卡片内从视觉上到下的 Y_PCT 递减顺序：
1. title (标题条) → Y≈85%（视觉最上方）
2. bondIcon → Y≈80%
3. avatar (头像) → Y≈71%
4. own (计数条) → Y≈63%
5. title_TEXT (名称) → Y≈58%
6. commonBg (背景) → Y≈43%（居中）
7. attrList (属性区) → Y≈30%（视觉下方）
8. line (分隔线) → Y≈7%（视觉最下方）

---

## 可选组件

以下组件标记为 ★可选，用户可根据游戏需求省略：

| 组件 | 用途 | 省略影响 |
|------|------|---------|
| **bondIcon** | 显示羁绊/系列图标 | 适合没有羁绊系统的游戏省略 |
| **own** + **own_TEXT** | 显示"已拥有 X/Y" 计数 | 适合一次性选择（非收集系统）省略 |
| **hover** 层 | 选中/悬停高亮效果 | 可在 Lua 中动态创建替代 |
| **skillList** ScrollView | 技能描述子列表 | 适合简单奖励（仅属性加成）省略 |
| **line** 分隔线 | 视觉分隔 | 影响较小，可省略 |

### 最简卡片结构（仅保留必需组件）

```
Image(heroBg) [354×591]
├── Image(commonBg) [335×572]
├── Layout(avatar) [106×106]
│   ├── Image(bg)
│   ├── Layout(mask) [clip_enabled]
│   │   └── Image(icon)
│   └── Image(frame)
├── Image(title) [203×46]
│   └── TextLabel(bond_TEXT)
├── TextLabel(title_TEXT) [300×30]
└── ScrollView(attrList) [layout_type=1]
    └── TextLabel(attr_TEXT)
```

---

## 常见错误

### ❌ 错误 #1: 卡片元素 Y 坐标上下颠倒

| 错误描述 | 正确做法 | 记录日期 |
|----------|----------|----------|
| 标题在底部，属性在顶部 | 标题 Y≈85%（大值=上），属性 Y≈30%（小值=下） | 2026-03-05 |

**原因**：AI 默认使用 Web/CSS 坐标系（左上角原点），而 Y3 使用 Cocos2d-x 坐标系（左下角原点）。

### ❌ 错误 #2: 遮罩容器使用 Image (type=4) 而非 Layout (type=7)

| 错误描述 | 正确做法 | 记录日期 |
|----------|----------|----------|
| mask 节点用 type=4 | mask 必须用 type=7 (Layout)，因为只有 Layout 支持 clip_enabled | 2026-03-12 |

### ❌ 错误 #3: 遮罩层级顺序错误

| 错误描述 | 正确做法 | 记录日期 |
|----------|----------|----------|
| frame 在 mask 之前 | 顺序必须为 bg → mask → frame（frame 在最上层） | 2026-03-12 |

### ❌ 错误 #4: ScrollView 方向错误

| 错误描述 | 正确做法 | 记录日期 |
|----------|----------|----------|
| 卡片容器用垂直 ScrollView | 3 张卡片横排，应使用 layout_type=2 (HORIZONTAL) | 2026-03-12 |
| 属性列表用水平 ScrollView | 属性文本纵向排列，应使用 layout_type=1 (VERTICAL) | 2026-03-12 |

### ❌ 错误 #5: 遮罩容器 color 不透明

| 错误描述 | 正确做法 | 记录日期 |
|----------|----------|----------|
| mask Layout 的 color alpha=255 | mask 的 color alpha 必须为 0（自身透明），否则会遮盖子节点 | 2026-03-12 |

### ✅ 推荐：使用实战图片 ID

| 做法 | 说明 |
|------|------|
| 查阅 `y3-ui-beautify` 的 `IMAGE_ID_REGISTRY.md` | 这些 ID 经过实战验证，能正确显示 |
| 例如 `heroBg` 使用 `134269971` | 来自 BondPickCardCmp.json |
| 无合适 ID 时省略属性 | 让引擎使用默认值 |

---

## 推荐参数

| 属性 | 推荐值 | 说明 |
|------|--------|------|
| 卡片宽度 | 354px | 与 BondPickCardCmp 对齐 |
| 卡片高度 | 591px | 竖长形状 |
| 卡片间距(ScrollView margin) | 20px | 卡片之间留白 |
| 头像区域 | 106×106px | 含边框 |
| 头像遮罩 | 72×72px | 实际可见区域 |
| 头像边框 | 116×116px | 略大于头像底图 |
| 标题条 | 203×46px | 品质/羁绊名称 |
| 名称字号 | 20px | 卡片名称 |
| 品质文本字号 | 24px | 标题条内文本 |
| 属性文本字号 | 18px | 属性描述 |
| 标题颜色 | (164, 254, 255, 255) | 青色高亮 |
| 名称颜色 | (125, 217, 255, 255) | 蓝色 |
| 属性颜色 | (255, 255, 255, 255) | 白色 |
| 奖励标题颜色 | (255, 214, 74, 255) | 金色 |

---

*最后更新: 2026-03-12*