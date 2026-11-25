# Y3 UI 布局规则

## 坐标系统

- **原点位置**：画布左下角
- **坐标单位**：支持像素和百分比
- **默认锚点**：控件中心 (0.5, 0.5)

## 分辨率适配

### 设计分辨率

- **画布高度固定**：1080
- **画布宽度动态**：`1080/实际高度 * 实际宽度`

```lua
-- 获取当前画布尺寸
local width = y3.ui.get_screen_width()   -- 动态宽度
local height = y3.ui.get_screen_height() -- 固定1080
```

### 适配原则

1. **优先使用百分比坐标** - 自动适配不同分辨率
2. **避免用 `get_screen_width()` 计算 `set_pos()`** - 会导致居中失效

## 父子坐标关系

子控件坐标**相对于父控件左下角**（非锚点）。

```lua
-- 示例：子控件100x50，左下角对齐父控件左下角
child:set_ui_size(100, 50)
child:set_anchor(0.5, 0.5)  -- 锚点在中心
child:set_pos(50, 25)       -- x=宽度/2, y=高度/2

-- 示例：子控件在父控件(宽200)底部居中
child:set_ui_size(100, 50)
child:set_pos(100, 25)  -- x=父宽/2=100, y=子高/2=25
```

## 定位方法

### 1. 百分比定位（推荐用于居中）

```lua
-- 0-100范围，50表示居中
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, x, y)

-- 示例
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 50)  -- 完全居中
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 70)  -- 水平居中，垂直70%
```

### 2. 边缘定位（推荐用于贴边）

控件边缘距离父控件对应边缘的距离。

```lua
-- 方向：'顶部'|'底部'|'左侧'|'右侧'
widget:set_relative_parent_pos(direction, offset)

-- 全屏铺满
widget:set_relative_parent_pos('顶部', 0)
widget:set_relative_parent_pos('底部', 0)
widget:set_relative_parent_pos('左侧', 0)
widget:set_relative_parent_pos('右侧', 0)

-- 快捷方法
widget:set_relative_parent_pos_v(0)          -- 四边都是0
widget:set_relative_parent_pos_v(10, 20)     -- 上下10，左右20
widget:set_relative_parent_pos_v(10, 20, 30, 40)  -- 上、下、左、右
```

| direction | 含义 |
|-----------|------|
| `'顶部'` | 当前控件**顶边**距离父控件**顶边** |
| `'底部'` | 当前控件**底边**距离父控件**底边** |
| `'左侧'` | 当前控件**左边**距离父控件**左边** |
| `'右侧'` | 当前控件**右边**距离父控件**右边** |

### 3. 相对坐标定位

相对于父控件左下角的像素坐标。

```lua
widget:set_pos(x, y)      -- 设置坐标
widget:set_ui_size(w, h)  -- 设置尺寸
widget:set_anchor(x, y)   -- 设置锚点 (0-1)
```

### 4. 绝对坐标定位

相对于整个游戏窗口的坐标。

```lua
widget:set_widget_absolute_coordinates(x, y)
```

## 推荐布局模式

### 全屏居中布局

适用于菜单、弹窗等需要居中的界面。

```lua
function M:on_show(data)
    M.__super.on_show(self, data)
    
    -- 1. 创建全屏容器
    local root = self.widget_root
    root:set_relative_parent_pos_v(0)  -- 铺满父控件
    
    -- 2. 全屏背景
    self.image_bg:set_relative_parent_pos_v(0)
    
    -- 3. 居中元素
    local titleUI = self.label_title:get_ui()
    GameAPI.set_ui_comp_pos_percent(self.player.handle, titleUI.handle, 50, 70)
    
    local btnUI = self.button_start:get_ui()
    GameAPI.set_ui_comp_pos_percent(self.player.handle, btnUI.handle, 50, 50)
end
```

### 边缘固定布局

适用于HUD等固定在屏幕边缘的元素。

```lua
function M:on_show(data)
    M.__super.on_show(self, data)
    
    -- 左上角
    self.widget_topLeft:set_relative_parent_pos('顶部', 30)
    self.widget_topLeft:set_relative_parent_pos('左侧', 30)
    
    -- 右上角
    self.widget_topRight:set_relative_parent_pos('顶部', 30)
    self.widget_topRight:set_relative_parent_pos('右侧', 30)
    
    -- 左下角
    self.widget_bottomLeft:set_relative_parent_pos('底部', 30)
    self.widget_bottomLeft:set_relative_parent_pos('左侧', 30)
    
    -- 右下角
    self.widget_bottomRight:set_relative_parent_pos('底部', 30)
    self.widget_bottomRight:set_relative_parent_pos('右侧', 30)
    
    -- 底部居中（只设置水平50%，垂直由底部定位控制）
    self.widget_bottomCenter:set_relative_parent_pos('底部', 30)
    -- 注意：百分比定位会覆盖边缘定位，建议计算后用set_pos
end
```

## 常见问题

### 问题1：控件无法水平居中

**错误**：
```lua
local screen_width = y3.ui.get_screen_width()
ui:set_pos(screen_width / 2, 540)  -- ❌ set_pos不应该用screen_width计算
```

**正确**：
```lua
GameAPI.set_ui_comp_pos_percent(player.handle, ui.handle, 50, 50)  -- ✅
```

### 问题2：全屏背景不铺满

**解决**：
```lua
self.image_bg:set_relative_parent_pos_v(0)
self.image_bg:set_image(图片资源ID)
```

### 问题3：文本显示不全

**原因**：文本控件默认宽度不够

**解决**：
```lua
label:set_ui_size(400, 60)  -- 设置足够宽度
label:set_text_alignment('中', '中')
```

### 问题4：图片显示默认图

**原因**：只设置了颜色，没设置图片资源

**错误**：
```lua
image:set_image_color(0, 0, 0, 150)  -- ❌ 没有图片资源
```

**正确**：
```lua
image:set_image(图片资源ID)
image:set_image_color(180, 180, 180, 255)  -- 叠加颜色
```

### 问题5：按钮文字看不清

**原因**：背景色和文字颜色对比度不够

**解决**：
```lua
button:set_image_color(50, 150, 50, 255)   -- 深色背景
button:set_text_color(255, 255, 255, 255)  -- 白色文字
```

## 使用空节点的建议

优先使用图片控件 + 空图片(id:999)作为容器，方便调试。

```lua
-- ✅ 推荐
local container = root:create_child('图片')
container:set_image(999)

-- ❌ 不推荐（调试时看不到尺寸）
local container = root:create_child('空节点')
```

## 缩放与旋转

```lua
-- 相对缩放（相对父控件）
widget:set_widget_relative_scale(1.5, 1.5)

-- 绝对缩放
widget:set_widget_absolute_scale(2.0, 2.0)

-- 相对旋转
widget:set_widget_relative_rotation(45)

-- 绝对旋转
widget:set_widget_absolute_rotation(90)
```

## 透明度

```lua
-- 0-100范围
widget:set_alpha(80)

-- 通过property设置（支持Tween动画）
widget.property.alpha = 50
```
