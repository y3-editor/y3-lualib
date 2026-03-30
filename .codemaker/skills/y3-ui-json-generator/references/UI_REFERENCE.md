# UI JSON 规范参考（合并版）

> 本文档整合了 UI_JSON_SPEC.md、COMPONENT_PATTERNS.md、STYLE_GUIDE.md 的核心内容

**最后更新**: 2025-03-23

---

## 📌 快速索引

- [坐标系统](#坐标系统)：Y3 原点在**左下角**

---

## 坐标系统

**⚠️ 重要：Y3 UI 坐标原点在左下角！**

```
Y轴 ↑
1080├─────────────────────┐
    │      屏幕区域        │
   0└─────────────────────┴──→ X轴
    0                   1920
```

| 位置 | X | Y | 说明 |
|------|---|---|------|
| 左下角 | 0 | 0 | 原点 |
| 右下角 | 1920 | 0 | |
| 左上角 | 0 | 1080 | |
| 中央 | 960 | 540 | |

---

## 组件类型

### 常用类型

| type | 名称 | 用途 |
|------|------|------|
| 1 | Button | 按钮 |
| 2 | Layer | 面板根容器 |
| 3 | TextLabel | 文本 |
| 4 | Image | 图片 |
| 5 | Progress | 进度条（旧） |
| 7 | Layout | 布局容器 |
| 10 | ScrollView | 滚动视图 |
| 15 | InputField | 输入框 |
| **17** | **SkillBtn** | **技能按钮**（官方） |
| **18** | **BuffList** | **Buff列表**（官方） |
| **20** | **EquipSlot** | **物品槽**（官方） |
| 41 | BarProgress | 条形进度条 |
| 42 | RadialProgress | 环形进度条 |

### 完整类型表（0-65）

<details>
<summary>点击展开</summary>

| type | 名称 | 默认前缀 |
|------|------|----------|
| 0 | Node | node |
| 1 | Button | button |
| 2 | Layer | panel |
| 3 | TextLabel | label |
| 4 | Image | image |
| 5 | Progress | progress |
| 6 | Model | model |
| 7 | Layout | layout |
| 8 | TabWidget | tab_widget |
| 9 | TabPage | pag |
| 10 | ScrollView | scroll_view |
| 11 | Slider | slider |
| 14 | Background | back_ground |
| 15 | InputField | input_field |
| 16 | MiniMap | mini_map |
| 17 | SkillBtn | skill_btn |
| 18 | BuffList | buff_list |
| 19 | BuffItem | buff_item |
| 20 | EquipSlot | equip_slot |
| 21 | ShopPanel | shop_panel |
| 22 | GoodsItem | goods_item |
| 23 | ComposePanel | compose_panel |
| 24 | ChatBox | chat_box |
| 25 | GridView | grid_view |
| 26 | RichText | rich_text |
| 27 | SettingPanel | setting_panel |
| 28 | AnimationEffect | animation_effect |
| 29 | ComboBox | combo_box |
| 30 | ComboBoxItem | combo_box_item |
| 31 | SequenceAnimation | sequence_animation |
| 32 | NewChatBox | chat_box |
| 33 | PageView | page_view |
| 35 | Spine | spine |
| 38 | NewSequenceAnimation | sequence_animation |
| 39 | BaseBarProgress | new_base_bar_progress |
| 40 | BaseRadialProgress | new_base_radial_progress |
| 41 | BarProgress | bar_progress |
| 42 | RadialProgress | radial_progress |
| 43 | NewSlider | new_slider |
| 44 | CutImage | cut_image |
| 45 | NewPageView | new_page_view |
| 46 | CheckBox | check_box |
| 47 | NewTabWidget | new_tab_widget |
| 48 | Live2DNode | live2d_node |
| 49 | Effect | effect |
| 50 | Joystick | joystick |
| 51 | Video | video |
| 52 | Audio | audio |
| 53 | SkillJoyStick | skilljoystick |
| 54 | UIFog | ui_fog |
| 55 | UIBlur | ui_blur |
| 56 | FriendList | friend_list |
| 57 | NewSettingPanel | new_setting_panel |
| 58 | WorldChatBox | world_chat_box |
| 59 | Report | report |
| 60 | ChatBoxRichText | chat_box_rich_text |
| 61 | CameraOperationArea | camera_operation_area |
| 62 | UICamera | ui_camera |
| 63 | Tips | tips |
| 64 | ClippingNode | clipping_node |
| 65 | UICanvas | ui_canvas |

**⚠️ 生产环境最大 type = 65，不存在 66-74**

</details>

---

## pos_data 定位

**格式**：`[X_ABS, Y_ABS, X_PCT, Y_PCT, X_MODE, Y_MODE]`

| 索引 | 字段 | 说明 |
|------|------|------|
| 0 | X_ABS | X 像素值 |
| 1 | Y_ABS | Y 像素值 |
| 2 | X_PCT | X 百分比 (0-100) |
| 3 | Y_PCT | Y 百分比 (0-100) |
| 4 | X_MODE | 0=像素, 1=百分比 |
| 5 | Y_MODE | 0=像素, 1=百分比 |

**常用定位**：

```json
// 居中
"pos_data": {"__tuple__": true, "items": [0.0, 0.0, 50.0, 50.0, 1, 1]}

// 左下角 100,200
"pos_data": {"__tuple__": true, "items": [100.0, 200.0, 0.0, 0.0, 0, 0]}

// 底部居中
"pos_data": {"__tuple__": true, "items": [0.0, 50.0, 50.0, 0.0, 1, 0]}
```

---

## 适配器

```json
"open_adapter": true,
"adapter_option": [
    left,     // 锁定左边 (0/1)
    right,    // 锁定右边
    bottom,   // 锁定下边
    top,      // 锁定上边
    left_m,   // 左边距 px
    right_m,  // 右边距 px
    bottom_m, // 下边距 px
    top_m     // 上边距 px
]
```

| 场景 | adapter_option |
|------|----------------|
| 全屏铺满 | `[1, 1, 1, 1, 0, 0, 0, 0]` |
| 底部固定 | `[1, 1, 1, 0, 0, 0, 20, 0]` |
| 顶部固定 | `[1, 1, 0, 1, 10, 10, 0, 10]` |

---

## 组件模式

### 血条 (BarProgress)

```
BarProgress (hp_bar) [type=41]
├── Image (progress_bg_img)
├── BaseBarProgress (progress_bar_img) [type=39]
└── TextLabel (percent_label)
```

### 技能栏

```
Layout (skill_bar)
├── SkillBtn (skill_1) [type=17]
├── SkillBtn (skill_2) [type=17]
├── SkillBtn (skill_3) [type=17]
└── SkillBtn (ultimate) [type=17]
```

### 弹窗结构

```
Layout (popup)
├── Image (mask_bg)
└── Layout (dialog_box)
    ├── Image (bg)
    ├── TextLabel (title)
    ├── TextLabel (content)
    ├── Button (btn_confirm)
    └── Button (btn_cancel)
```

### 滚动列表

```
ScrollView (scroll_list) [type=10]
└── Layout (inner_container)
    ├── [Item 1]
    └── [Item 2]
```

---

## 风格规范

### 层级 (Z-Order)

| 层级 | 用途 |
|------|------|
| 0-10 | 背景 |
| 10-100 | 主内容 |
| 100-200 | 弹窗 |
| 200-300 | 提示 |
| 300+ | 系统遮罩 |

### 面板尺寸

| 类型 | 尺寸 |
|------|------|
| 全屏 | 1920×1080 |
| 弹窗 | 400-800 × 300-600 |
| 顶栏 | 满宽 × 80-120 |
| 底栏 | 满宽 × 100-150 |

### 安全区域

- 重要元素距边缘至少 **50px**
- 底部技能栏预留 **20px** 安全边距

---

## 数据格式

### __tuple__ 包装

```json
// size
"size": {"__tuple__": true, "items": [200.0, 50.0]}

// anchor
"anchor": {"__tuple__": true, "items": [0.5, 0.5]}

// font [字体ID, 字号]
"font": {"__tuple__": true, "items": ["134280035", 24]}

// text [内容, 是否多语言]
"text": {"__tuple__": true, "items": ["按钮文字", false]}

// cap_insets 九宫格 [左, 上, 右, 下]
"cap_insets": {"__tuple__": true, "items": [10, 10, 10, 10]}
```

### 颜色

```json
// RGBA 数组
"font_color": [255, 255, 255, 255]

// 带 __tuple__
"color": {"__tuple__": true, "items": [0, 0, 0, 128]}
```

---

*合并自: UI_JSON_SPEC.md, COMPONENT_PATTERNS.md, STYLE_GUIDE.md*