# 资源索引 (Resource Index)

本文档索引项目中常用的 UI 资源，供 AI 生成时参考。

> **注意**: 部分资源 ID 使用占位符，需要根据实际项目填充。

## 目录

1. [通用 UI 图片](#1-通用-ui-图片)
2. [字体配置](#2-字体配置)
3. [特效资源](#3-特效资源)
4. [颜色方案](#4-颜色方案)

---

## 1. 通用 UI 图片

### 按钮资源

| 资源ID | 描述 | 用途 | 九宫格参数 |
|--------|------|------|-----------|
| PLACEHOLDER_BTN_NORMAL | 按钮-正常状态 | 通用按钮 | [10,10,10,10] |
| PLACEHOLDER_BTN_PRESSED | 按钮-按下状态 | 通用按钮 | [10,10,10,10] |
| PLACEHOLDER_BTN_DISABLED | 按钮-禁用状态 | 通用按钮 | [10,10,10,10] |
| PLACEHOLDER_BTN_CLOSE | 关闭按钮 | 弹窗关闭 | - |

### 进度条资源

| 资源ID | 描述 | 用途 | 九宫格参数 |
|--------|------|------|-----------|
| 1115067 | 进度条背景-通用 | 血条/经验条背景 | [125,4,125,4] |
| 1115072 | 进度条填充-通用 | 血条/经验条 | - |
| PLACEHOLDER_HP_BG | 血条背景 | 战斗UI血条 | [5,2,5,2] |
| PLACEHOLDER_HP_FILL | 血条填充-绿色 | 战斗UI血条 | - |
| PLACEHOLDER_HP_FILL_RED | 血条填充-红色 | 低血量警告 | - |

### 背景资源

| 资源ID | 描述 | 用途 | 九宫格参数 |
|--------|------|------|-----------|
| 1111566 | 信息框背景 | 玩家信息卡 | [129,29,129,29] |
| PLACEHOLDER_DIALOG_BG | 弹窗背景 | 对话框 | [20,20,20,20] |
| PLACEHOLDER_PANEL_BG | 面板背景 | 大型面板 | [30,30,30,30] |
| PLACEHOLDER_MASK | 半透明遮罩 | 弹窗背景遮罩 | - |

### 图标资源

| 资源ID | 描述 | 用途 |
|--------|------|------|
| PLACEHOLDER_ICON_COIN | 金币图标 | 货币显示 |
| PLACEHOLDER_ICON_DIAMOND | 钻石图标 | 货币显示 |
| PLACEHOLDER_ICON_SETTING | 设置图标 | 设置按钮 |
| PLACEHOLDER_ICON_CLOSE | 关闭图标 | 关闭按钮 |

### 头像资源

| 资源ID | 描述 | 用途 |
|--------|------|------|
| PLACEHOLDER_AVATAR_BG | 头像框背景 | 玩家信息 |
| PLACEHOLDER_AVATAR_FRAME | 头像框 | 玩家信息 |
| PLACEHOLDER_AVATAR_DEFAULT | 默认头像 | 玩家信息 |

---

## 2. 字体配置

### 内置字体

| 字体名称 | 描述 | 推荐字号 | 用途 |
|----------|------|---------|------|
| FZBWKSK | 方正标准楷书 | 24-48 | 标题、正文 |
| FZHTJW | 方正黑体 | 18-36 | 正文、次要信息 |

### 自定义字体 (资源ID)

| 字体ID | 描述 | 推荐字号 | 用途 |
|--------|------|---------|------|
| 134280035 | 自定义字体A | 18-28 | 战斗UI、数字 |
| PLACEHOLDER_FONT_TITLE | 标题字体 | 36-60 | 大标题 |
| PLACEHOLDER_FONT_NUMBER | 数字字体 | 24-48 | 伤害数字、金币 |

### TTF 字体路径

| 路径 | 描述 | 推荐字号 |
|------|------|---------|
| fonts/FZXS14.ttf | 方正细字体 | 14-24 |

### 位图字体路径

| 路径 | 描述 | 用途 |
|------|------|------|
| UIScript/damage_num.fnt | 伤害数字 | 战斗伤害 |
| UIScript/gold_num.fnt | 金币数字 | 货币显示 |

---

## 3. 特效资源

| 特效ID | 描述 | 用途 |
|--------|------|------|
| 105385 | 排名光效 | 排行榜、玩家卡 |
| PLACEHOLDER_EFFECT_CLICK | 点击特效 | 按钮点击 |
| PLACEHOLDER_EFFECT_SHINE | 发光特效 | 高亮显示 |
| PLACEHOLDER_EFFECT_PARTICLE | 粒子特效 | 装饰效果 |

---

## 4. 颜色方案

### 文字颜色

| 用途 | RGBA | 十六进制 | 描述 |
|------|------|---------|------|
| 主文字 | [255, 251, 244, 255] | #FFFBF4 | 暖白色 |
| 正文白 | [255, 255, 255, 255] | #FFFFFF | 纯白色 |
| 次要文字 | [200, 200, 200, 255] | #C8C8C8 | 灰色 |
| 提示文字 | [150, 150, 150, 255] | #969696 | 浅灰色 |
| 高亮文字 | [255, 215, 0, 255] | #FFD700 | 金色 |
| 错误文字 | [255, 80, 80, 255] | #FF5050 | 红色 |
| 成功文字 | [80, 255, 80, 255] | #50FF50 | 绿色 |

### 描边颜色

| 用途 | RGBA | 描述 |
|------|------|------|
| 标准描边 | [0, 0, 0, 54] | 半透明黑 |
| 深色描边 | [0, 0, 0, 128] | 较深黑边 |
| 发光描边 | [255, 255, 255, 128] | 白色光边 |

### 背景颜色

| 用途 | RGBA | 描述 |
|------|------|------|
| 遮罩背景 | [0, 0, 0, 150] | 半透明黑 |
| 深色遮罩 | [0, 0, 0, 200] | 深半透明黑 |
| 选中高亮 | [255, 255, 255, 50] | 淡白色 |

---

## 5. 资源使用示例

### 按钮示例

```json
{
    "type": 1,
    "name": "btn_confirm",
    "normal_picture": "PLACEHOLDER_BTN_NORMAL",
    "pressed_picture": "PLACEHOLDER_BTN_PRESSED",
    "disabled_picture": "PLACEHOLDER_BTN_DISABLED",
    "normal_cap_insets": {"__tuple__": true, "items": [10, 10, 10, 10]}
}
```

### 文本标签示例

```json
{
    "type": 3,
    "name": "title",
    "text": {"__tuple__": true, "items": ["标题文字", false]},
    "font": {"__tuple__": true, "items": ["FZBWKSK", 36]},
    "font_color": [255, 251, 244, 255],
    "border": true,
    "text_border_width": 2,
    "text_border_color": {"__tuple__": true, "items": [0, 0, 0, 54]}
}
```

### 进度条示例

```json
{
    "type": 4,
    "name": "progress_bg",
    "image": 1115067,
    "cap_insets": {"__tuple__": true, "items": [125, 4, 125, 4]}
}
```

---

## 6. 填充指南

当需要在项目中填充真实资源 ID 时：

1. **图片资源**：在项目资源配置表中查找对应的图片 ID
2. **字体资源**：检查 `custom/Fonts/Fonts.xml` 获取自定义字体映射
3. **特效资源**：在特效配置表中查找特效 ID

### 快速查找命令

```bash
# 查找现有 UI 中使用的图片 ID
grep -r "\"image\":" F:\work\Z2\maps\EntryMap\ui\*.json | grep -oE "[0-9]{6,}"

# 查找字体资源
cat F:\work\Z2\custom\Fonts\Fonts.xml
```
