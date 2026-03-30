"""
UI JSON 字段格式规范

来源:
- F:/work/map/src/Server/server/engine/dm/clients/ui/uiEditor/EditorUICompMeta.py
- F:/work/map/src/Server/server/engine/dm/clients/ui/ui_const.py
- F:/work/map/src/Server/server/engine/dm/clients/ui/uiEditor/UIComp/WorldUI*.py

每个字段定义其期望的格式类型和长度
"""

# ==============================================================================
# UIPosIndex (来源: ui_const.py:335)
# ==============================================================================
# pos_data 数组索引定义
class UIPosIndex:
    X_ABS = 0    # X 绝对值 (像素)
    Y_ABS = 1    # Y 绝对值 (像素)
    X_PCT = 2    # X 百分比 (0-100)
    Y_PCT = 3    # Y 百分比 (0-100)
    X_MODE = 4   # X 模式 (0=像素ABS, 1=百分比PCT)
    Y_MODE = 5   # Y 模式 (0=像素ABS, 1=百分比PCT)


# ==============================================================================
# UIPosMode (来源: ui_const.py:315)
# ==============================================================================
class UIPosMode:
    ABS = 0  # 像素模式
    PCT = 1  # 百分比模式


# ==============================================================================
# 字段格式类型枚举
# ==============================================================================
class FieldType:
    TUPLE_2 = "tuple_2"      # 2元素数组 [a, b]
    TUPLE_4 = "tuple_4"      # 4元素数组 [r, g, b, a]
    TUPLE_6 = "tuple_6"      # 6元素数组
    TUPLE_8 = "tuple_8"      # 8元素数组 (adapter_option)
    STRING = "string"
    INT = "int"
    FLOAT = "float"
    BOOL = "bool"
    ARRAY = "array"
    UUID = "uuid"            # UUID v4 格式字符串


# ==============================================================================
# 通用字段格式规范 (适用于所有组件)
# ==============================================================================
COMMON_FIELD_FORMATS = {
    # ========== 位置与变换 ==========
    
    # pos_data: 位置数据
    # 来源: ui_const.py:335 UIPosIndex, WorldUIComp.py:396-400
    "pos_data": {
        "type": FieldType.TUPLE_6,
        "desc": "[X_ABS, Y_ABS, X_PCT, Y_PCT, X_MODE, Y_MODE]",
        "example": [960.0, 540.0, 50.0, 50.0, 1, 1],
        "index_meaning": {
            0: "X绝对值(像素)",
            1: "Y绝对值(像素)",
            2: "X百分比(0-100)",
            3: "Y百分比(0-100)",
            4: "X模式(0=像素,1=百分比)",
            5: "Y模式(0=像素,1=百分比)"
        }
    },
    
    # size: 尺寸 [宽, 高]
    "size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [100.0, 100.0]
    },
    
    # anchor: 锚点 [x, y] 范围 0.0-1.0
    "anchor": {
        "type": FieldType.TUPLE_2,
        "desc": "[x, y] (0.0-1.0)",
        "example": [0.5, 0.5]
    },
    
    # scale: 缩放 [x, y]
    "scale": {
        "type": FieldType.TUPLE_2,
        "desc": "[scale_x, scale_y]",
        "example": [1.0, 1.0]
    },
    
    # ========== 颜色相关 ==========
    
    # color: 颜色 RGBA
    "color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A] (0-255)",
        "example": [255, 255, 255, 255]
    },
    
    # font_color: 字体颜色 RGBA
    "font_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A] (0-255)",
        "example": [255, 255, 255, 255]
    },
    
    # ========== 对齐方式 ==========
    
    # alignment: 对齐方式
    # 来源: EditorUICompMeta.py:1802, WorldUITextLabel.py:794
    # horizontal: 1=左, 2=中, 4=右
    # vertical: 0=顶, 8=中, 16=底
    "alignment": {
        "type": FieldType.TUPLE_2,
        "desc": "[horizontal, vertical]",
        "example": [2, 8],
        "h_values": {1: "左", 2: "中", 4: "右"},
        "v_values": {0: "顶", 8: "中", 16: "底"}
    },
    
    # ========== 适配器 ==========
    
    # adapter_option: 适配选项 8元素
    # [left_lock, right_lock, bottom_lock, top_lock, left_margin, right_margin, bottom_margin, top_margin]
    "adapter_option": {
        "type": FieldType.TUPLE_8,
        "desc": "[left_lock, right_lock, bottom_lock, top_lock, left_margin, right_margin, bottom_margin, top_margin]",
        "example": [True, True, True, True, 0, 0, 0, 0]
    },
    
    # ========== 九宫格 ==========
    
    # cap_insets: 九宫格边距 [左, 上, 右, 下]
    "cap_insets": {
        "type": FieldType.TUPLE_4,
        "desc": "[left, top, right, bottom]",
        "example": [24, 24, 24, 24]
    },
    
    # ========== 滚动视图 ==========
    
    # inner_size: 内容区域尺寸
    "inner_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [100.0, 500.0]
    },
    
    # scroll_bar_color: 滚动条颜色
    "scroll_bar_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 128]
    },
}


# TextLabel (type=3) 专用字段
TEXTLABEL_FIELD_FORMATS = {
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["MSYH", 24],
        "error_case": "alibaba (字符串会导致 font[1] 取到字符而非字号)"
    },
    "text": {
        "type": FieldType.TUPLE_2,
        "desc": "[content, is_language_key]",
        "example": ["Hello", False]
    },
    "text_shadow_color": {"type": FieldType.TUPLE_4, "desc": "[R, G, B, A]"},
    "text_shadow_offset": {"type": FieldType.TUPLE_2, "desc": "[x, y]"},
    "text_border_color": {"type": FieldType.TUPLE_4, "desc": "[R, G, B, A]"},
    "line_space": {"type": FieldType.TUPLE_2, "desc": "[vertical, horizontal]"},
    "strike_through_color": {"type": FieldType.TUPLE_4, "desc": "[R, G, B, A]"},
}


# Button (type=1) 专用字段
BUTTON_FIELD_FORMATS = {
    "normal_text": {
        "type": FieldType.TUPLE_2,
        "desc": "[text, is_language_key]",
        "example": ["确认", False]
    },
    "normal_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "pressed_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [200, 200, 200, 255]
    },
    "disabled_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [128, 128, 128, 255]
    },
    "normal_cap_insets": {
        "type": FieldType.TUPLE_4,
        "desc": "[left, top, right, bottom]",
        "example": [24, 24, 24, 24]
    },
    "pressed_cap_insets": {
        "type": FieldType.TUPLE_4,
        "desc": "[left, top, right, bottom]",
        "example": [24, 24, 24, 24]
    },
    "disabled_cap_insets": {
        "type": FieldType.TUPLE_4,
        "desc": "[left, top, right, bottom]",
        "example": [24, 24, 24, 24]
    },
}


# Image (type=4) 专用字段
IMAGE_FIELD_FORMATS = {
    # 继承通用 color, cap_insets
}


# Progress (type=5) 专用字段
PROGRESS_FIELD_FORMATS = {
    "progress_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "bg_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [100, 100, 100, 255]
    },
}


# Layout (type=7) 专用字段
LAYOUT_FIELD_FORMATS = {
    "clip_rect": {
        "type": FieldType.TUPLE_4,
        "desc": "[x, y, width, height]",
        "example": [0, 0, 100, 100]
    },
}


# ScrollView (type=10) 专用字段
SCROLLVIEW_FIELD_FORMATS = {
    "inner_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [100.0, 500.0]
    },
    "scroll_bar_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 128]
    },
}


# InputField (type=15) 专用字段
INPUTFIELD_FIELD_FORMATS = {
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 24]
    },
    "tip_text": {
        "type": FieldType.TUPLE_2,
        "desc": "[placeholder_text, is_language_key]",
        "example": ["请输入账号", False]
    },
    "tip_text_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [128, 128, 128, 255]
    },
    "text": {
        "type": FieldType.TUPLE_2,
        "desc": "[content, is_language_key]",
        "example": ["", False]
    },
}


# BarProgress (type=41) 专用字段
BARPROGRESS_FIELD_FORMATS = {
    "bar_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 0, 0, 255]
    },
    "bg_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [50, 50, 50, 255]
    },
}


# Slider (type=11, 43) 专用字段
SLIDER_FIELD_FORMATS = {
    "bar_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "bg_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [100, 100, 100, 255]
    },
}


# RichText (type=26) 专用字段
RICHTEXT_FIELD_FORMATS = {
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 24]
    },
    "font_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
}


# GridView (type=25) 专用字段
GRIDVIEW_FIELD_FORMATS = {
    "grid_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[columns, rows] or [cell_width, cell_height]",
        "example": [4, 4]
    },
    "cell_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [100.0, 100.0]
    },
}


# EquipSlot (type=20) 专用字段
EQUIPSLOT_FIELD_FORMATS = {
    "slot_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
}


# TabWidget (type=8) 专用字段
TABWIDGET_FIELD_FORMATS = {
    "tab_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [100.0, 40.0]
    },
    "tab_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "selected_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 200, 0, 255]
    },
}


# ChatBox (type=24) 专用字段
CHATBOX_FIELD_FORMATS = {
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 18]
    },
    "font_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "input_font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 16]
    },
}


# ComboBox (type=29) 专用字段
COMBOBOX_FIELD_FORMATS = {
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 20]
    },
    "font_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "dropdown_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [50, 50, 50, 255]
    },
    "item_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "selected_item_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 200, 0, 255]
    },
}


# PageView (type=33, 45) 专用字段
PAGEVIEW_FIELD_FORMATS = {
    "page_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [400.0, 300.0]
    },
    "indicator_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 128]
    },
    "selected_indicator_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
}


# CheckBox (type=46) 专用字段
CHECKBOX_FIELD_FORMATS = {
    "check_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [0, 255, 0, 255]
    },
    "uncheck_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [128, 128, 128, 255]
    },
    "text": {
        "type": FieldType.TUPLE_2,
        "desc": "[label_text, is_language_key]",
        "example": ["启用", False]
    },
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 20]
    },
    "font_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
}


# Joystick (type=50) 专用字段
JOYSTICK_FIELD_FORMATS = {
    "bg_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 128]
    },
    "stick_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "stick_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [80.0, 80.0]
    },
}


# RadialProgress (type=42) 专用字段
RADIALPROGRESS_FIELD_FORMATS = {
    "progress_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [0, 200, 255, 255]
    },
    "bg_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [50, 50, 50, 255]
    },
}


# SkillBtn (type=17) 专用字段
SKILLBTN_FIELD_FORMATS = {
    "cooldown_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [0, 0, 0, 180]
    },
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 16]
    },
    "font_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
}


# MiniMap (type=16) 专用字段
MINIMAP_FIELD_FORMATS = {
    "border_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "player_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [0, 255, 0, 255]
    },
    "enemy_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 0, 0, 255]
    },
}


# Tips (type=63) 专用字段
TIPS_FIELD_FORMATS = {
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 18]
    },
    "font_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "bg_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [0, 0, 0, 200]
    },
    "text": {
        "type": FieldType.TUPLE_2,
        "desc": "[content, is_language_key]",
        "example": ["提示内容", False]
    },
}


# Model3D (type=6) 专用字段
MODEL3D_FIELD_FORMATS = {
    "camera_offset": {
        "type": FieldType.TUPLE_2,
        "desc": "[x_offset, y_offset]",
        "example": [0.0, 0.0]
    },
    "model_scale": {
        "type": FieldType.TUPLE_2,
        "desc": "[scale_x, scale_y]",
        "example": [1.0, 1.0]
    },
}


# NewTabWidget (type=47) 专用字段
NEWTABWIDGET_FIELD_FORMATS = {
    "tab_size": {
        "type": FieldType.TUPLE_2,
        "desc": "[width, height]",
        "example": [120.0, 45.0]
    },
    "normal_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [180, 180, 180, 255]
    },
    "selected_color": {
        "type": FieldType.TUPLE_4,
        "desc": "[R, G, B, A]",
        "example": [255, 255, 255, 255]
    },
    "font": {
        "type": FieldType.TUPLE_2,
        "desc": "[font_name, font_size]",
        "example": ["FZBWKSK", 18]
    },
}


# 组件类型到字段格式的映射
COMPONENT_FIELD_FORMATS = {
    1: BUTTON_FIELD_FORMATS,       # Button
    3: TEXTLABEL_FIELD_FORMATS,    # TextLabel
    4: IMAGE_FIELD_FORMATS,        # Image
    5: PROGRESS_FIELD_FORMATS,     # Progress
    6: MODEL3D_FIELD_FORMATS,      # Model3D
    7: LAYOUT_FIELD_FORMATS,       # Layout
    8: TABWIDGET_FIELD_FORMATS,    # TabWidget
    10: SCROLLVIEW_FIELD_FORMATS,  # ScrollView
    11: SLIDER_FIELD_FORMATS,      # Slider
    15: INPUTFIELD_FIELD_FORMATS,  # InputField
    16: MINIMAP_FIELD_FORMATS,     # MiniMap
    17: SKILLBTN_FIELD_FORMATS,    # SkillBtn
    20: EQUIPSLOT_FIELD_FORMATS,   # EquipSlot
    24: CHATBOX_FIELD_FORMATS,     # ChatBox
    25: GRIDVIEW_FIELD_FORMATS,    # GridView
    26: RICHTEXT_FIELD_FORMATS,    # RichText
    29: COMBOBOX_FIELD_FORMATS,    # ComboBox
    33: PAGEVIEW_FIELD_FORMATS,    # PageView
    41: BARPROGRESS_FIELD_FORMATS, # BarProgress
    42: RADIALPROGRESS_FIELD_FORMATS, # RadialProgress
    43: SLIDER_FIELD_FORMATS,      # NewSlider
    45: PAGEVIEW_FIELD_FORMATS,    # NewPageView
    46: CHECKBOX_FIELD_FORMATS,    # CheckBox
    47: NEWTABWIDGET_FIELD_FORMATS, # NewTabWidget
    50: JOYSTICK_FIELD_FORMATS,    # Joystick
    63: TIPS_FIELD_FORMATS,        # Tips
}


def get_field_format(comp_type: int, field_name: str):
    """
    获取指定组件类型的字段格式规范
    
    先查组件专用格式，再查通用格式
    """
    # 组件专用
    if comp_type in COMPONENT_FIELD_FORMATS:
        comp_formats = COMPONENT_FIELD_FORMATS[comp_type]
        if field_name in comp_formats:
            return comp_formats[field_name]
    
    # 通用格式
    if field_name in COMMON_FIELD_FORMATS:
        return COMMON_FIELD_FORMATS[field_name]
    
    return None
