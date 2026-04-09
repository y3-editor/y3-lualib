#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
HTML to Y3 UI JSON Converter

Converts a structured HTML preview file into Y3 editor-compatible UI panel JSON.

Usage:
    python html_to_y3_ui.py <input.html> <output.json> [--panel-name PanelName] [--zorder 300]

The HTML must follow a specific convention using data-* attributes to describe
Y3 UI nodes. See the SKILL.md for the HTML authoring guide.

Supported node types:
    - div[data-type="layout"]  -> type 7 (空节点/容器)
    - div[data-type="label"]   -> type 3 (文本)
    - div[data-type="image"]   -> type 4 (图片)
    - div[data-type="button"]  -> type 1 (按钮)
"""

import json
import uuid
import sys
import os
import re
from html.parser import HTMLParser

# =============================================================================
# Constants
# =============================================================================

DESIGN_WIDTH = 1920.0
DESIGN_HEIGHT = 1080.0

# Y3 type mapping
TYPE_MAP = {
    "button": 1,
    "panel": 2,
    "label": 3,
    "image": 4,
    "layout": 7,
}

# Default font colors
DEFAULT_FONT_COLOR = [255, 255, 255, 255]
DEFAULT_BUTTON_FONT_COLOR = [247, 247, 247, 255]

# Default button images — overridden by icon_config.md at load time
# Values below match icon_config.md Section 4: 默认按钮图片
DEFAULT_BUTTON_NORMAL = 906095
DEFAULT_BUTTON_HOVER = 906024
DEFAULT_BUTTON_PRESS = 907222
DEFAULT_BUTTON_DISABLED = 906450

# =============================================================================
# icon_config.md loader
# 在脚本所在目录的上层寻找 icon_config.md，解析其中的表格数据，
# 用来覆盖 BUTTON_PRESETS / IMAGE_PRESETS 以及背景图选取规则。
# =============================================================================

def _parse_bg_rule(rule_text):
    """
    将 icon_config.md 中背景图规则的中文描述转换为可 eval 的 Python 条件字符串。

    支持格式（bold 标记 ** 会被忽略）：
        宽 > 800 且 高 > 800
        宽 = 1920 且 高 = 1080
        宽 >= 500 且 高 >= 300
        其他尺寸  /  default
        （不满足上条）等括号备注会被忽略

    返回值示例：
        'w==1920 and h==1080'
        'w>800 and h>800'
        'default'
    """
    # strip bold markers and parenthetical remarks
    text = re.sub(r'\*+', '', rule_text).strip()
    text = re.sub(r'（[^）]*）', '', text).strip()
    text = re.sub(r'\([^)]*\)', '', text).strip()

    # catch-all / default
    if '其他' in text or not text or text.lower() == 'default':
        return 'default'

    # 宽高比规则: "宽高比 > 3" / "3 > 宽高比 > 2" / "宽高比 = 1920/1080"
    # 转换为特殊标记 "ratio>3" / "ratio<3 and ratio>2" / "ratio_eq:1.778"，由 _get_bg_image_id 特殊处理
    if '宽高比' in text or 'ratio' in text.lower():
        # 精确比例: "宽高比 = 1920/1080" → "ratio_eq:1.7777..."
        m = re.match(r'(?:宽高比|ratio)\s*=\s*(\d+)\s*/\s*(\d+)', text, re.IGNORECASE)
        if m:
            numerator, denominator = float(m.group(1)), float(m.group(2))
            if denominator != 0:
                return f'ratio_eq:{numerator/denominator}'
            return 'default'
        
        OP_MAP_RATIO = [('>=', '>='), ('<=', '<='), ('>', '>'), ('<', '<')]
        # 双侧: "3 > 宽高比 > 2"
        m = re.match(r'(\d+(?:\.\d+)?)\s*(>=|<=|>|<)\s*(?:宽高比|ratio)\s*(>=|<=|>|<)\s*(\d+(?:\.\d+)?)', text, re.IGNORECASE)
        if m:
            num_left, op_left, op_right, num_right = m.group(1), m.group(2), m.group(3), m.group(4)
            flip = {'>': '<', '<': '>', '>=': '<=', '<=': '>='}
            left_expr  = 'ratio' + flip.get(op_left, op_left) + num_left
            right_expr = 'ratio' + op_right + num_right
            return left_expr + ' and ' + right_expr
        # 单侧: "宽高比 > 3"
        m = re.match(r'(?:宽高比|ratio)\s*(>=|<=|>|<)\s*(\d+(?:\.\d+)?)', text, re.IGNORECASE)
        if m:
            return 'ratio' + m.group(1) + m.group(2)
        return 'default'

    # operator map: Chinese → Python
    OP_MAP = [
        ('>=', '>='), ('<=', '<='),
        ('>', '>'),   ('<', '<'),
        ('=', '=='),  # plain = → ==
    ]

    # parse one clause, supports:
    #   "宽 > 800"       →  'w>800'
    #   "400 > 宽 > 200" →  'w>200 and w<400'  (双侧不等式)
    def _parse_clause(clause):
        clause = clause.strip()

        # 双侧不等式: "<num> <op> 宽/高 <op> <num>"
        for var_ch, var_py in [('宽', 'w'), ('高', 'h')]:
            m = re.match(
                r'(\d+)\s*(>=|<=|>|<)\s*' + var_ch + r'\s*(>=|<=|>|<)\s*(\d+)',
                clause
            )
            if m:
                num_left, op_left, op_right, num_right = m.group(1), m.group(2), m.group(3), m.group(4)
                # flip left side: "400 > 宽" → "w < 400"
                flip = {'>': '<', '<': '>', '>=': '<=', '<=': '>='}
                left_expr  = var_py + flip.get(op_left,  op_left)  + num_left
                right_expr = var_py + op_right + num_right
                return left_expr + ' and ' + right_expr

        # 单侧: "宽 > 800"
        for ch_op, py_op in OP_MAP:
            for var_ch, var_py in [('宽', 'w'), ('高', 'h')]:
                m = re.match(var_ch + r'\s*' + re.escape(ch_op) + r'\s*(\d+)', clause)
                if m:
                    return var_py + py_op + m.group(1)
        return None

    # split on 且 / and
    parts = re.split(r'且|and', text)
    exprs = [_parse_clause(p) for p in parts]
    exprs = [e for e in exprs if e]

    if exprs:
        return ' and '.join(exprs)
    return 'default'


def _load_icon_config():
    """
    Parse ../icon_config.md (relative to this script) and return:
        image_presets   : dict[str, int]
        button_presets  : dict[str, dict[str, int]]
        bg_rules        : list of (rule_str, image_id)
            rule_str examples: "w>800 and h>800", "w<200 and h<200", "w>400 and h>400", "default"
        default_btn     : dict[str, int]  keys: normal/hover/press/disabled
        default_img     : int
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))
    config_path = os.path.join(script_dir, '..', 'icon_config.md')
    config_path = os.path.normpath(config_path)

    image_presets  = {}
    button_presets = {}
    bg_rules       = []   # list of (condition_str, image_id)
    default_btn    = {}
    default_img    = 100061  # 默认占位图，与 icon_config.md 第 5 节保持一致

    if not os.path.exists(config_path):
        return image_presets, button_presets, bg_rules, default_btn, default_img

    with open(config_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # ── helper: parse a markdown table section ──────────────────────────────
    def _parse_table(text):
        """Extract rows from a markdown table as list of lists of stripped cells."""
        rows = []
        for line in text.splitlines():
            line = line.strip()
            if not line.startswith('|'):
                continue
            cells = [c.strip() for c in line.strip('|').split('|')]
            # skip separator rows like |---|---|
            if all(re.match(r'^[-: ]+$', c) for c in cells):
                continue
            rows.append(cells)
        return rows  # first row is header

    # ── Section 1: Image Presets ─────────────────────────────────────────────
    m = re.search(r'## 1\. 图片预设.*?(?=## 2\.)', content, re.DOTALL)
    if m:
        rows = _parse_table(m.group())
        for row in rows[1:]:   # skip header
            if len(row) >= 3:
                preset_name = row[0].strip('`')
                try:
                    image_presets[preset_name] = int(row[2].strip('`'))
                except ValueError:
                    pass

    # ── Section 2: Button Presets ────────────────────────────────────────────
    m = re.search(r'## 2\. 按钮预设.*?(?=## 3\.)', content, re.DOTALL)
    if m:
        section = m.group()
        # Each sub-section starts with "### <preset_name>"
        for sub in re.finditer(r'###\s+(\S+)\s.*?(?=###|\Z)', section, re.DOTALL):
            preset_name = sub.group(1).split('—')[0].strip()  # e.g. "gold"
            rows = _parse_table(sub.group())
            preset = {}
            STATE_MAP = {'normal': 'normal', 'hover': 'hover',
                         'press': 'press', 'disabled': 'disabled'}
            for row in rows[1:]:
                if len(row) >= 3:
                    state_key = row[1].strip().strip('`').lower()
                    if state_key in STATE_MAP:
                        try:
                            preset[STATE_MAP[state_key]] = int(row[2].strip('`'))
                        except ValueError:
                            pass
            if preset:
                button_presets[preset_name] = preset

    # ── Section 3: Auto Background Rules ────────────────────────────────────
    m = re.search(r'## 3\. 自动背景图.*?(?=## 4\.)', content, re.DOTALL)
    if m:
        rows = _parse_table(m.group())
        # Expected columns: 资源描述 | 选取规则 | 图片 ID
        for row in rows[1:]:
            if len(row) >= 3:
                rule_text = row[1].strip()
                img_id_str = row[2].strip().strip('`')
                condition = _parse_bg_rule(rule_text)
                try:
                    bg_rules.append((condition, int(img_id_str)))
                except ValueError:
                    pass

    # ── Section 4: Default Button Images ────────────────────────────────────
    m = re.search(r'## 4\. 默认按钮图片.*?(?=## 5\.|\Z)', content, re.DOTALL)
    if m:
        rows = _parse_table(m.group())
        STATE_MAP = {'normal': 'normal', 'hover': 'hover',
                     'press': 'press', 'disabled': 'disabled'}
        for row in rows[1:]:
            if len(row) >= 3:
                state_key = row[1].strip().strip('`').lower()
                if state_key in STATE_MAP:
                    try:
                        default_btn[STATE_MAP[state_key]] = int(row[2].strip('`'))
                    except ValueError:
                        pass

    # ── Section 5: Default Image ─────────────────────────────────────────────
    m = re.search(r'## 5\. 默认图片.*', content, re.DOTALL)
    if m:
        rows = _parse_table(m.group())
        for row in rows[1:]:
            if len(row) >= 2:
                try:
                    default_img = int(row[1].strip('`'))
                    break
                except ValueError:
                    pass

    return image_presets, button_presets, bg_rules, default_btn, default_img


# Load config at module level — overrides hardcoded defaults below if config exists
_cfg_image_presets, _cfg_button_presets, _cfg_bg_rules, _cfg_default_btn, _cfg_default_img = _load_icon_config()

# =============================================================================
# Presets - 预设资源集
# 使用 data-preset="xxx" 在 HTML 中引用
# 以下为内置默认值；若 icon_config.md 存在，运行时会被覆盖。
# =============================================================================

# 按钮预设：每个预设包含 normal/hover/press/disabled 四态图片
# Fallback values mirror icon_config.md Section 2
BUTTON_PRESETS = _cfg_button_presets if _cfg_button_presets else {
    "gold": {
        "normal": 906010, "hover": 907120,
        "press": 906125, "disabled": 907311,
    },
    "blue": {
        "normal": 907066, "hover": 906009,
        "press": 907330, "disabled": 906051,
    },
    "red": {
        "normal": 906859, "hover": 906026,
        "press": 906276, "disabled": 907095,
    },
    "close": {
        "normal": 906975, "hover": 906021,
        "press": 906659, "disabled": 907057,
    },
    "transparent": {
        "normal": 999, "hover": 999,
        "press": 999, "disabled": 999,
    },
}

# 图片预设：常用图片资源ID
# Fallback values mirror icon_config.md Section 1
IMAGE_PRESETS = _cfg_image_presets if _cfg_image_presets else {
    "panel-bg":   132046,
    "frame":      132055,
    "dark-bg":    906073,
    "slot":       906176,
    "divider":    906131,
    "shadow":     906550,
    "highlight":  906144,
    "border-glow":132000,
    "item-bg":    906852,
    "title-bar":  906111,
}

# 默认按钮图片（无预设时使用）
if _cfg_default_btn:
    DEFAULT_BUTTON_NORMAL   = _cfg_default_btn.get('normal',   DEFAULT_BUTTON_NORMAL)
    DEFAULT_BUTTON_HOVER    = _cfg_default_btn.get('hover',    DEFAULT_BUTTON_HOVER)
    DEFAULT_BUTTON_PRESS    = _cfg_default_btn.get('press',    DEFAULT_BUTTON_PRESS)
    DEFAULT_BUTTON_DISABLED = _cfg_default_btn.get('disabled', DEFAULT_BUTTON_DISABLED)


# =============================================================================
# HTML Parser
# =============================================================================

class Y3UIHTMLParser(HTMLParser):
    """
    Parses structured HTML and builds a tree of Y3 UI nodes.
    
    Expected HTML structure:
    <div data-type="layout" data-name="MyContainer"
         data-x="100" data-y="200" data-w="400" data-h="300"
         data-adapter="top,left" data-anchor="0.5,0.5">
        <div data-type="label" data-name="label_title"
             data-text="Hello" data-font-size="24" data-color="#ffffff">
        </div>
    </div>
    """

    def __init__(self):
        super().__init__()
        self.root_children = []
        self.stack = []  # stack of (node, children_list, div_depth)
        # div_depth counts how many nested <div> tags each stack frame owns.
        # A frame is only popped when its own outermost </div> is seen.

        # For structural verification: record every HTML node as (name, parent_name)
        self.html_nodes = []          # list of (name, parent_name_or_None)
        self._name_stack = []         # parallel stack of names for parent tracking

    def handle_starttag(self, tag, attrs):
        if tag != 'div':
            return

        attr_dict = dict(attrs)

        # --- Template injection ---
        template_name = attr_dict.get('data-template', '')
        if template_name:
            node = self._build_template_node(attr_dict, template_name)
            node_name = attr_dict.get('data-name', f'template_{template_name}')
            parent_name = self._name_stack[-1] if self._name_stack else None
            if node is None:
                # Still need to track depth so handle_endtag stays in sync
                # Push a sentinel (None) so the matching </div> is consumed
                self.stack.append((None, [], 1))
                self._name_stack.append(None)
                return
            # Record in html_nodes for structural verification
            self.html_nodes.append((node_name, parent_name))
            if self.stack:
                parent_node, _, _ = self.stack[-1]
                if parent_node is not None:
                    parent_node['children'].append(node)
            else:
                self.root_children.append(node)
            # Push with depth=1: this frame owns exactly the outermost <div>.
            # Any additional <div> inside (decorative HTML) increments the depth
            # counter instead of pushing a new frame.
            self.stack.append((node, node.get('children', []), 1))
            self._name_stack.append(node_name)
            return

        data_type = attr_dict.get('data-type', '')

        if data_type not in TYPE_MAP:
            # Non-UI div (e.g. decorative .card-inner) — increment the current
            # frame's depth counter so the matching </div> is absorbed correctly.
            if self.stack:
                node, children, depth = self.stack[-1]
                self.stack[-1] = (node, children, depth + 1)
            return

        node = self._build_node(attr_dict, data_type)
        node_name = node['name']
        parent_name = self._name_stack[-1] if self._name_stack else None
        # Record in html_nodes for structural verification
        self.html_nodes.append((node_name, parent_name))

        if self.stack:
            # Append to parent's children
            parent_node, _, _ = self.stack[-1]
            if parent_node is not None:
                parent_node['children'].append(node)
        else:
            self.root_children.append(node)

        self.stack.append((node, node.get('children', []), 1))
        self._name_stack.append(node_name)

    def handle_endtag(self, tag):
        if tag != 'div' or not self.stack:
            return
        node, children, depth = self.stack[-1]
        if depth > 1:
            # This </div> closes an inner decorative div — just decrement depth
            self.stack[-1] = (node, children, depth - 1)
        else:
            # This </div> closes the frame's own outermost div — pop the frame
            self.stack.pop()
            if self._name_stack:
                self._name_stack.pop()

    def _build_node(self, attrs, data_type):
        """Build a Y3 UI node from HTML data attributes."""
        name = attrs.get('data-name', f'{data_type}_{uuid.uuid4().hex[:6]}')
        
        # Position and size
        x = float(attrs.get('data-x', '0'))
        y = float(attrs.get('data-y', '0'))
        w = float(attrs.get('data-w', '100'))
        h = float(attrs.get('data-h', '100'))

        # Parent dimensions for adapter calculation
        parent_w = float(attrs.get('data-parent-w', str(DESIGN_WIDTH)))
        parent_h = float(attrs.get('data-parent-h', str(DESIGN_HEIGHT)))

        # Center position (Y3 uses center-based coordinates)
        cx = x + w / 2.0
        cy = y + h / 2.0

        # Y3 coordinate system: origin bottom-left, Y increases upward
        # HTML coordinate system: origin top-left, Y increases downward
        # Convert: y3_cy = parent_h - html_cy
        y3_cy = parent_h - cy

        # Percentage position
        pct_x = (cx / parent_w * 100) if parent_w > 0 else 50.0
        pct_y = (y3_cy / parent_h * 100) if parent_h > 0 else 50.0

        # Adapter margins (relative to parent)
        # top_margin = parent_h - (y3_cy + h/2) = parent_h - y3_cy - h/2
        # bottom_margin = y3_cy - h/2
        # left_margin = cx - w/2 = x
        # right_margin = parent_w - (cx + w/2) = parent_w - x - w
        top_margin = parent_h - y3_cy - h / 2.0
        bottom_margin = y3_cy - h / 2.0
        left_margin = x
        right_margin = parent_w - x - w

        # Round margins
        top_margin = round(top_margin, 4)
        bottom_margin = round(bottom_margin, 4)
        left_margin = round(left_margin, 4)
        right_margin = round(right_margin, 4)

        # Parse adapter settings
        adapter_str = attrs.get('data-adapter', '')
        adapt_top, adapt_bottom, adapt_left, adapt_right = self._parse_adapter(adapter_str)

        node = {
            "children": [],
            "event_list": [],
            "name": name,
            "open_adapter": True,
            "adapter_option": [
                adapt_top, adapt_bottom, adapt_left, adapt_right,
                top_margin, bottom_margin, left_margin, right_margin
            ],
            "pos_data": {
                "__tuple__": True,
                "items": [
                    round(cx, 4),
                    round(y3_cy, 4),
                    round(pct_x, 4),
                    round(pct_y, 4),
                    0 if pct_x == 0 else 1,
                    0 if pct_y == 0 else 1,
                ]
            },
            "prefab_sub_key": None,
            "scene_ui_name": None,
            "size": [round(w, 1), round(h, 1)],
            "type": TYPE_MAP[data_type],
            "uid": str(uuid.uuid4()),
        }

        # Store original HTML coordinates for post_process_tree
        node['_html_x'] = x
        node['_html_y'] = y

        # Z-index for sibling sorting (higher = rendered on top = later in children array)
        node['_zindex'] = int(attrs.get('data-zindex', '0'))

        # Parse anchor
        anchor_str = attrs.get('data-anchor', '')
        if anchor_str:
            parts = [float(v.strip()) for v in anchor_str.split(',')]
            if len(parts) == 2:
                node["anchor"] = {"__tuple__": True, "items": parts}

        # Type-specific fields
        if data_type == "label":
            self._add_label_fields(node, attrs)
        elif data_type == "image":
            self._add_image_fields(node, attrs)
        elif data_type == "button":
            self._add_button_fields(node, attrs)
        elif data_type == "layout":
            self._add_layout_fields(node, attrs)

        return node

    def _parse_adapter(self, adapter_str):
        """Parse adapter string like 'top,left,right' into boolean tuple."""
        if not adapter_str:
            return (False, False, False, False)
        
        parts = [s.strip().lower() for s in adapter_str.split(',')]
        return (
            'top' in parts or 'all' in parts,
            'bottom' in parts or 'all' in parts,
            'left' in parts or 'all' in parts,
            'right' in parts or 'all' in parts,
        )

    def _parse_color(self, color_str):
        """Parse color string '#rrggbb' or '#rrggbbaa' into [r, g, b, a]."""
        if not color_str:
            return DEFAULT_FONT_COLOR[:]
        
        color_str = color_str.strip().lstrip('#')
        if len(color_str) == 6:
            r, g, b = int(color_str[0:2], 16), int(color_str[2:4], 16), int(color_str[4:6], 16)
            return [r, g, b, 255]
        elif len(color_str) == 8:
            r, g, b, a = int(color_str[0:2], 16), int(color_str[2:4], 16), int(color_str[4:6], 16), int(color_str[6:8], 16)
            return [r, g, b, a]
        return DEFAULT_FONT_COLOR[:]

    def _add_label_fields(self, node, attrs):
        """Add label-specific fields (type=3)."""
        text = attrs.get('data-text', '')
        font_size = int(attrs.get('data-font-size', '16'))
        color = self._parse_color(attrs.get('data-color', '#ffffff'))
        
        # Alignment: data-align="center,middle" or "left,top"
        align_str = attrs.get('data-align', 'center,middle')
        h_align, v_align = self._parse_alignment(align_str)
        
        node["text"] = {"__tuple__": True, "items": [text, False]}
        node["font"] = {"__tuple__": True, "items": ["", font_size]}
        node["font_color"] = color
        node["font_min_size"] = max(10, font_size - 4)
        node["over_pattern"] = 2
        node["alignment"] = {"__tuple__": True, "items": [h_align, v_align]}
        
        # Shadow
        if attrs.get('data-shadow', 'false').lower() == 'true':
            node["shadow"] = True
            node["text_shadow_color"] = {"__tuple__": True, "items": [0, 0, 0, 180]}

    def _add_image_fields(self, node, attrs):
        """Add image-specific fields (type=4)."""
        # Check preset first
        preset = attrs.get('data-preset', '')
        if preset and preset in IMAGE_PRESETS:
            image_id = IMAGE_PRESETS[preset]
        else:
            # Default image ID from icon_config.md Section 5
            image_id = int(attrs.get('data-image', str(_cfg_default_img)))
        
        node["image"] = image_id
        
        color = self._parse_color(attrs.get('data-color', ''))
        if attrs.get('data-color'):
            node["color"] = color

        # Scale9: default OFF, use data-scale9="true" to enable
        scale9_str = attrs.get('data-scale9', 'false').lower()
        if scale9_str == 'true':
            node["is_scale9_enable"] = True
            insets_str = attrs.get('data-cap-insets', '10,10,10,10')
            insets = [int(v.strip()) for v in insets_str.split(',')]
            node["cap_insets"] = {"__tuple__": True, "items": insets}

    def _add_button_fields(self, node, attrs):
        """Add button-specific fields (type=1)."""
        text = attrs.get('data-text', '')
        font_size = int(attrs.get('data-font-size', '16'))
        
        # Check preset first, then individual overrides, then defaults
        preset = attrs.get('data-preset', '')

        # Mark transparent buttons for sorting (they go behind visuals)
        if preset == 'transparent':
            node['_is_transparent_btn'] = True
        if preset and preset in BUTTON_PRESETS:
            bp = BUTTON_PRESETS[preset]
            normal_img = int(attrs.get('data-normal-image', str(bp["normal"])))
            hover_img = int(attrs.get('data-hover-image', str(bp["hover"])))
            press_img = int(attrs.get('data-press-image', str(bp["press"])))
            disabled_img = int(attrs.get('data-disabled-image', str(bp["disabled"])))
        else:
            normal_img = int(attrs.get('data-normal-image', str(DEFAULT_BUTTON_NORMAL)))
            hover_img = int(attrs.get('data-hover-image', str(DEFAULT_BUTTON_HOVER)))
            press_img = int(attrs.get('data-press-image', str(DEFAULT_BUTTON_PRESS)))
            disabled_img = int(attrs.get('data-disabled-image', str(DEFAULT_BUTTON_DISABLED)))
        
        font_color = self._parse_color(attrs.get('data-color', '#f7f7f7'))
        
        node["normal_picture"] = normal_img
        node["suspend_picture"] = hover_img
        node["press_picture"] = press_img
        node["disabled_picture"] = disabled_img
        
        node["hover_status_added"] = True
        node["pressed_status_added"] = True
        node["disabled_status_added"] = True
        
        if text:
            node["font"] = {"__tuple__": True, "items": ["MSYH", font_size]}
            text_tuple = {"__tuple__": True, "items": [text, False]}
            node["normal_text"] = text_tuple
            node["suspend_text"] = text_tuple
            node["press_text"] = text_tuple
            node["disabled_text"] = text_tuple
            
            node["normal_font_color"] = font_color
            node["suspend_font_color"] = font_color
            node["press_font_color"] = font_color
            node["disabled_font_color"] = font_color

        # Scale9 for button
        cap_str = attrs.get('data-cap-insets', '33,33,33,33')
        insets = [float(v.strip()) for v in cap_str.split(',')]
        node["normal_cap_insets"] = {"__tuple__": True, "items": insets}

    def _add_layout_fields(self, node, attrs):
        """Add layout-specific fields (type=7)."""
        # Background image (optional)
        bg_image = attrs.get('data-bg-image', '')
        if bg_image:
            node["bg_image"] = int(bg_image)
            
        # Background color (optional)
        bg_color = attrs.get('data-bg-color', '')
        if bg_color:
            node["color"] = self._parse_color(bg_color)
        
        # Swallow touches (block input)
        if attrs.get('data-block', '').lower() == 'true':
            node["swallow_touches"] = True

    def _parse_alignment(self, align_str):
        """
        Parse alignment string into Y3 alignment values.
        Horizontal: left=1, center=2, right=4
        Vertical: top=16, middle=8, bottom=0
        """
        h_map = {'left': 1, 'center': 2, 'right': 4}
        v_map = {'top': 16, 'middle': 8, 'bottom': 0}
        
        parts = [s.strip().lower() for s in align_str.split(',')]
        h_val = h_map.get(parts[0], 2) if len(parts) > 0 else 2
        v_val = v_map.get(parts[1], 8) if len(parts) > 1 else 8
        
        return h_val, v_val

    def _build_template_node(self, attrs, template_name):
        """
        Load a pre-built template JSON and position it according to data-x/y/w/h.
        The template JSON is a complete Y3 node subtree extracted from the project.
        """
        # Resolve template path relative to this script
        script_dir = os.path.dirname(os.path.abspath(__file__))
        template_path = os.path.join(script_dir, '..', 'templates', f'{template_name}.json')
        template_path = os.path.normpath(template_path)

        if not os.path.exists(template_path):
            print(f'[WARN] Template not found: {template_name} ({template_path})')
            return None

        with open(template_path, 'r', encoding='utf-8') as f:
            node = json.load(f)

        # Override name if specified
        custom_name = attrs.get('data-name', '')
        if custom_name:
            node['name'] = custom_name

        # Read position/size from HTML attributes
        x = float(attrs.get('data-x', '0'))
        y = float(attrs.get('data-y', '0'))
        w = float(attrs.get('data-w', '0'))
        h = float(attrs.get('data-h', '0'))

        # Determine parent dimensions
        parent_w = DESIGN_WIDTH
        parent_h = DESIGN_HEIGHT
        if self.stack:
            parent_node, _, _ = self.stack[-1]
            if parent_node is not None:
                p_size = parent_node.get('size', [DESIGN_WIDTH, DESIGN_HEIGHT])
                if isinstance(p_size, dict):
                    p_size = p_size.get('items', [DESIGN_WIDTH, DESIGN_HEIGHT])
                parent_w, parent_h = float(p_size[0]), float(p_size[1])

        # Calculate Y3 center coordinates (bottom-left origin)
        cx = x + w / 2.0
        html_cy = y + h / 2.0
        y3_cy = parent_h - html_cy

        pct_x = (cx / parent_w * 100) if parent_w > 0 else 50.0
        pct_y = (y3_cy / parent_h * 100) if parent_h > 0 else 50.0

        # Update pos_data
        node['pos_data'] = {
            "__tuple__": True,
            "items": [cx, y3_cy, pct_x, pct_y, 1, 1]
        }

        # Update size and scale children if specified size differs from template
        if w > 0 and h > 0:
            orig_w, orig_h = self._get_node_size(node)
            node['size'] = [w, h]

            # Scale internal children proportionally if size changed
            # Always scale when user specifies an explicit size (even if equal),
            # so that percentage coordinates are always recomputed against the
            # correct (potentially different) parent dimensions.
            if orig_w > 0 and orig_h > 0:
                scale_x = w / orig_w
                scale_y = h / orig_h
                if abs(scale_x - 1.0) > 0.0001 or abs(scale_y - 1.0) > 0.0001:
                    self._scale_template_children(
                        node.get('children', []), scale_x, scale_y, w, h
                    )

        # Regenerate all UIDs in the subtree
        self._regenerate_uids(node)

        # Mark root and ALL descendants as template so overlap resolver ignores them
        def _mark_template_recursive(n):
            n['_is_template'] = True
            for child in n.get('children', []):
                _mark_template_recursive(child)
        _mark_template_recursive(node)

        return node

    @staticmethod
    def _get_node_size(node):
        """Extract (w, h) from a node's size field, handling both formats."""
        size = node.get('size', [0, 0])
        if isinstance(size, dict):
            items = size.get('items', [0, 0])
            return float(items[0]), float(items[1])
        elif isinstance(size, list) and len(size) >= 2:
            return float(size[0]), float(size[1])
        return 0.0, 0.0

    def _scale_template_children(self, children, scale_x, scale_y, parent_w, parent_h):
        """
        Recursively scale size and pos_data of all children in a template.

        Args:
            children: list of Y3 node dicts to scale
            scale_x:  horizontal scale factor (new_w / orig_w)
            scale_y:  vertical   scale factor (new_h / orig_h)
            parent_w: the *new* (scaled) width  of the parent node
            parent_h: the *new* (scaled) height of the parent node
        """
        for child in children:
            # --- 1. Scale size ---
            cw, ch = self._get_node_size(child)
            new_cw = cw * scale_x if cw > 0 else 0.0
            new_ch = ch * scale_y if ch > 0 else 0.0

            if cw > 0 or ch > 0:
                size = child.get('size')
                if isinstance(size, dict) and 'items' in size:
                    size['items'] = [new_cw, new_ch]
                elif size is not None:
                    child['size'] = [new_cw, new_ch]
                # If no 'size' field (e.g. type=17 special buttons), don't inject one;
                # use the parent dimensions for the recursion below.

            # Effective dimensions for child's own children:
            # If this node has no explicit size, assume it fills the parent.
            child_pw = new_cw if new_cw > 0 else parent_w
            child_ph = new_ch if new_ch > 0 else parent_h

            # --- 2. Scale pos_data (cx, cy) and recalculate percentages ---
            pos = child.get('pos_data', {})
            if isinstance(pos, dict) and 'items' in pos:
                items = pos['items']
                if len(items) >= 4:
                    new_cx = items[0] * scale_x
                    new_cy = items[1] * scale_y
                    items[0] = new_cx
                    items[1] = new_cy
                    # Recalculate percentage based on the scaled parent dimensions
                    items[2] = (new_cx / parent_w * 100) if parent_w > 0 else items[2]
                    items[3] = (new_cy / parent_h * 100) if parent_h > 0 else items[3]

            # --- 3. Scale adapter_option margins ---
            adapter = child.get('adapter_option', [])
            if isinstance(adapter, list) and len(adapter) >= 8:
                adapter[4] = adapter[4] * scale_y  # top margin
                adapter[5] = adapter[5] * scale_y  # bottom margin
                adapter[6] = adapter[6] * scale_x  # left margin
                adapter[7] = adapter[7] * scale_x  # right margin

            # --- 4. Recurse into grandchildren with *this child's* effective size as parent ---
            if child.get('children'):
                self._scale_template_children(
                    child['children'], scale_x, scale_y, child_pw, child_ph
                )

    def _regenerate_uids(self, node):
        """
        Recursively regenerate all uid fields in a node tree, and patch any
        uid-reference fields (e.g. skill_cd_label, skill_icon_img on type=17 nodes)
        so that they point to the newly-generated uids instead of the stale template uids.

        Process:
          Pass 1 — collect old→new uid mapping for every node in the subtree.
          Pass 2 — for every node, scan all string fields whose value matches a
                   known old uid and replace with the corresponding new uid.
        """
        uid_map = {}  # old_uid -> new_uid

        # ── Pass 1: assign new uids and record the mapping ──────────────────
        def _assign_uids(n):
            old_uid = n.get('uid')
            if old_uid:
                new_uid = str(uuid.uuid4())
                uid_map[old_uid] = new_uid
                n['uid'] = new_uid
            for child in n.get('children', []):
                _assign_uids(child)

        _assign_uids(node)

        # ── Pass 2: patch uid-reference fields ──────────────────────────────
        # These are fields whose *value* is a uid string referencing another node.
        # We scan every string field (except 'uid' itself) for known old uids.
        def _patch_refs(n):
            for key, val in list(n.items()):
                if key == 'uid':
                    continue
                if isinstance(val, str) and val in uid_map:
                    n[key] = uid_map[val]
            for child in n.get('children', []):
                _patch_refs(child)

        _patch_refs(node)


# =============================================================================
# JSON Builder
# =============================================================================

def build_panel_json(children, panel_name="NewPanel", zorder=300):
    """Build the root panel JSON structure."""
    return {
        "adapt_mode": 2,
        "anim_data": {},
        "auto_create": True,
        "children": children,
        "name": panel_name,
        "opacity": 1.0,
        "script_name": "",
        "type": 2,
        "ui_anims": [],
        "uid": str(uuid.uuid4()),
        "visible": True,
        "zorder": zorder,
    }


def inject_parent_dimensions(html_content):
    """
    Pre-process HTML to add data-parent-w/h attributes to child nodes.
    
    This walks through the HTML and for each parent div with data-w/h,
    propagates those dimensions to direct children that don't already have
    data-parent-w/h set.
    """
    # We do this at the tree level after parsing, not in HTML
    # This is handled in post_process_tree instead
    return html_content


def post_process_tree(children, parent_w=DESIGN_WIDTH, parent_h=DESIGN_HEIGHT):
    """
    Recalculate all positions and margins based on actual parent dimensions.
    
    During parsing, all nodes initially use DESIGN_WIDTH/HEIGHT as parent.
    This function corrects child nodes to use their actual parent's dimensions.
    """
    for node in children:
        # Get original HTML coordinates stored during parsing
        # We stored data-x, data-y relative to parent in _build_node,
        # but used wrong parent dims. Recover the original x, y from pos_data.
        size = node.get('size', {})
        if isinstance(size, dict):
            w = size.get('items', [100, 100])[0]
            h = size.get('items', [100, 100])[1]
        elif isinstance(size, list):
            w, h = size[0], size[1]
        else:
            w, h = 100, 100

        # Recover original HTML x,y from the node's _html_x/_html_y if stored,
        # or compute from pos_data using the OLD parent dims
        html_x = node.pop('_html_x', None)
        html_y = node.pop('_html_y', None)

        if html_x is not None and html_y is not None:
            # Recalculate using correct parent dimensions
            cx = html_x + w / 2.0
            cy = html_y + h / 2.0
            y3_cy = parent_h - cy
        else:
            # Fallback: use existing pos_data (root level nodes are already correct)
            pos_data = node.get('pos_data', {})
            if isinstance(pos_data, dict):
                items = pos_data.get('items', [0, 0, 50, 50, 0, 0])
                cx = items[0]
                y3_cy = items[1]
            else:
                cx, y3_cy = parent_w / 2, parent_h / 2

        # Recalculate margins based on actual parent
        top_margin = parent_h - y3_cy - h / 2.0
        bottom_margin = y3_cy - h / 2.0
        left_margin = cx - w / 2.0
        right_margin = parent_w - cx - w / 2.0

        # Update pos_data
        pct_x = (cx / parent_w * 100) if parent_w > 0 else 50.0
        pct_y = (y3_cy / parent_h * 100) if parent_h > 0 else 50.0
        node['pos_data'] = {
            "__tuple__": True,
            "items": [
                round(cx, 4),
                round(y3_cy, 4),
                round(pct_x, 4),
                round(pct_y, 4),
                0 if pct_x == 0 else 1,
                0 if pct_y == 0 else 1,
            ]
        }

        # Update adapter_option margins (keep boolean switches)
        adapter = node.get('adapter_option', [False, False, False, False, 0, 0, 0, 0])
        adapter[4] = round(top_margin, 4)
        adapter[5] = round(bottom_margin, 4)
        adapter[6] = round(left_margin, 4)
        adapter[7] = round(right_margin, 4)
        node['adapter_option'] = adapter

        # Recurse into children with this node's dimensions as parent
        # Skip template nodes — their internal structure is pre-built
        if node.get('children') and not node.get('_is_template'):
            post_process_tree(node['children'], w, h)

    # Sort children by render order (ascending index = bottom layer → top layer):
    # In Y3, LATER index in children array = rendered ON TOP (covers earlier ones).
    #
    # Layering priority (bottom → top):
    #   z=0:  Transparent buttons (preset=transparent) — click zones behind everything
    #   z=10: Images — background, borders, icons
    #   z=20: Layouts — containers
    #   z=30: Labels — text always visible
    #   z=40: Visible buttons (close, gold, blue, red, etc.) — interactive, on top
    #
    # Within the same z-level, LARGER area nodes go first (behind), smaller later (on top).

    def _get_sort_key(node):
        # Explicit data-zindex takes priority
        explicit_z = node.get('_zindex', 0)
        if explicit_z != 0:
            return (explicit_z, 0)

        node_type = node.get('type', 7)

        if node_type == 1:  # Button
            # Transparent buttons go to bottom; visible buttons go to top
            is_transparent = node.get('_is_transparent_btn', False)
            type_z = 0 if is_transparent else 40
        elif node_type == 4:  # Image
            type_z = 10
        elif node_type == 7:  # Layout
            type_z = 20
        elif node_type == 3:  # Label
            type_z = 30
        else:
            type_z = 20

        # Larger area = smaller secondary key = sorted first (behind)
        size = node.get('size', [0, 0])
        if isinstance(size, list) and len(size) == 2:
            area = size[0] * size[1]
        else:
            area = 0
        return (type_z, -area)

    children.sort(key=_get_sort_key)

    # Clean up temp fields (keep _is_template for overlap resolver, removed later)
    for node in children:
        node.pop('_zindex', None)
        node.pop('_is_transparent_btn', None)


# =============================================================================
# Auto Background Injection
# =============================================================================

# Background image IDs by size thresholds:
#   > 800x800  → 110072
#   > 400x400  → 904640
#   < 200x200  → 120089
#   else       → 888
_BG_KEYWORDS = ('bg', 'background', '_bg_')


def _get_bg_image_id(w, h):
    """Select background image resource ID based on layout dimensions.

    Evaluation order:
        1. 尺寸规则 (non-ratio, non-default)
        2. 宽高比规则 (ratio-based, only if size rules didn't match)
        3. default fallback
    """
    ratio = w / h if h != 0 else 0

    if _cfg_bg_rules:
        default_id = 999
        ratio_eq_rules = []   # 精确比例匹配（优先级最高）
        size_rules  = []
        ratio_rules = []      # 比例范围规则
        for condition, img_id in _cfg_bg_rules:
            if condition == 'default':
                default_id = img_id
            elif condition.startswith('ratio_eq:'):
                ratio_eq_rules.append((condition, img_id))
            elif 'ratio' in condition:
                ratio_rules.append((condition, img_id))
            else:
                size_rules.append((condition, img_id))

        # Phase 0: exact ratio match (highest priority, e.g., fullscreen 16:9)
        for condition, img_id in ratio_eq_rules:
            try:
                target_ratio = float(condition.split(':')[1])
                if abs(ratio - target_ratio) < 0.01:  # tolerance for floating point
                    return img_id
            except Exception:
                pass

        # Phase 1: size-based rules
        for condition, img_id in size_rules:
            try:
                if eval(condition, {"__builtins__": {}}, {"w": w, "h": h}):
                    return img_id
            except Exception:
                pass

        # Phase 2: ratio range rules (only if no size rule matched)
        for condition, img_id in ratio_rules:
            try:
                if eval(condition, {"__builtins__": {}}, {"ratio": ratio}):
                    return img_id
            except Exception:
                pass

        return default_id
    # ── fallback: hardcoded rules (mirrors icon_config.md in case config fails to load)
    FULLSCREEN_RATIO = 1920 / 1080  # ≈1.778
    if abs(ratio - FULLSCREEN_RATIO) < 0.01:
        return 999          # 全屏面板（基于宽高比）
    elif w > 800 and h > 800:
        return 132046       # 背景图-大
    elif 200 < w < 800 and 200 < h < 800:
        return 906957       # 背景图-中
    elif w < 200 and h < 200:
        return 906073       # 背景图-小
    else:
        return 999          # 默认


def _has_bg_image(layout_node):
    """
    Check if a layout already has a background image child.
    A 'bg image' is an image (type=4) whose name contains bg/background keywords
    AND whose area is >= 80% of the layout's area.
    """
    size = layout_node.get('size', [0, 0])
    if isinstance(size, dict):
        size = size.get('items', [0, 0])
    lw, lh = float(size[0]), float(size[1])
    layout_area = lw * lh
    if layout_area <= 0:
        return True  # can't determine, skip

    threshold = layout_area * 0.8

    for child in layout_node.get('children', []):
        if child.get('type') != 4:  # not an image
            continue
        name = child.get('name', '').lower()
        has_keyword = any(kw in name for kw in _BG_KEYWORDS)
        if not has_keyword:
            continue
        # Check child size
        c_size = child.get('size', [0, 0])
        if isinstance(c_size, dict):
            c_size = c_size.get('items', [0, 0])
        c_area = float(c_size[0]) * float(c_size[1])
        if c_area >= threshold:
            return True

    return False


def _create_bg_image_node(layout_node):
    """Create a background image node that fills the layout."""
    size = layout_node.get('size', [0, 0])
    if isinstance(size, dict):
        size = size.get('items', [0, 0])
    w, h = float(size[0]), float(size[1])

    layout_name = layout_node.get('name', 'layout')
    bg_name = layout_name + '_bg'
    image_id = _get_bg_image_id(w, h)

    cx = w / 2.0
    cy = h / 2.0
    pct_x = 50.0
    pct_y = 50.0

    return {
        "name": bg_name,
        "type": 4,
        "uid": str(uuid.uuid4()),
        "size": [w, h],
        "visible": True,
        "alpha": 100,
        "image": image_id,
        "is_scale9_enable": False,
        "children": [],
        "event_list": [],
        "open_adapter": True,
        "adapter_option": [True, True, True, True, 0.0, 0.0, 0.0, 0.0],
        "pos_data": {
            "__tuple__": True,
            "items": [round(cx, 4), round(cy, 4), round(pct_x, 4), round(pct_y, 4), 1, 1]
        },
    }


def auto_inject_layout_bg(children):
    """
    Recursively walk all nodes. For each layout (type=7) that lacks a background
    image, inject a default bg image at index 0 (bottom layer).
    Template nodes are skipped.
    """
    for node in children:
        # Skip template nodes
        if node.get('_is_template'):
            continue

        node_type = node.get('type', 0)
        node_children = node.get('children', [])

        # Recurse first (depth-first)
        if node_children:
            auto_inject_layout_bg(node_children)

        # Only process layout nodes (type=7)
        if node_type != 7:
            continue

        # Skip if already has a bg image
        if _has_bg_image(node):
            continue

        # Inject bg image at index 0 (bottom layer)
        bg_node = _create_bg_image_node(node)
        node_children.insert(0, bg_node)


# =============================================================================
# Overlap Detection & Auto-Resolve
# =============================================================================

def _node_rect(node):
    """
    Extract the bounding box of a node as (x, y, w, h) in local-parent space.
    pos_data stores [cx, cy, pct_x, pct_y, ...] as the CENTER in parent coords.
    size stores [w, h].
    Returns (left, top, w, h) or None if pos_data is unavailable.
    """
    pos = node.get('pos_data')
    if not pos:
        return None
    items = pos.get('items') if isinstance(pos, dict) else pos
    if not items or len(items) < 2:
        return None

    size = node.get('size', [0, 0])
    if isinstance(size, dict):
        size = size.get('items', [0, 0])
    w, h = float(size[0]), float(size[1])

    cx, cy = float(items[0]), float(items[1])
    left = cx - w / 2.0
    top  = cy - h / 2.0
    return (left, top, w, h)


def _rects_overlap(r1, r2, margin=2.0):
    """Return True if two rects (left,top,w,h) overlap (with a small margin tolerance)."""
    l1, t1, w1, h1 = r1
    l2, t2, w2, h2 = r2
    if (l1 + w1 - margin <= l2 or l2 + w2 - margin <= l1 or
            t1 + h1 - margin <= t2 or t2 + h2 - margin <= t1):
        return False
    return True


def _set_node_cx_cy(node, new_cx, new_cy, parent_w, parent_h):
    """Update pos_data center coordinates and recalculate percentages."""
    pos = node.get('pos_data')
    if not pos:
        return
    items = pos.get('items') if isinstance(pos, dict) else pos
    if not items or len(items) < 4:
        return

    pct_x = (new_cx / parent_w * 100.0) if parent_w > 0 else 50.0
    pct_y = (new_cy / parent_h * 100.0) if parent_h > 0 else 50.0

    items[0] = round(new_cx, 4)
    items[1] = round(new_cy, 4)
    items[2] = round(pct_x, 4)
    items[3] = round(pct_y, 4)


def _resolve_overlaps_in_children(children, parent_w, parent_h, max_iters=20):
    """
    Detect and resolve overlapping sibling nodes within a single parent.

    Strategy:
      - For each pair of overlapping nodes, push the RIGHT / LOWER one away
        from the LEFT / UPPER one (axis of smallest penetration depth).
      - Repeat until no overlaps exist or max_iters is reached.
      - Nodes with adapter=all (fixed full-cover bg) are skipped.
      - Template-internal nodes (_is_template=True) are skipped entirely.
      - Prints a warning for every resolved overlap.
    """
    def _is_fixed_bg(node):
        opt = node.get('adapter_option')
        if opt and len(opt) >= 4:
            return all(opt[:4])   # all four sides locked → full-cover bg
        return False

    def _is_skippable(node):
        # Skip full-cover bg nodes and all template-internal nodes
        if _is_fixed_bg(node):
            return True
        if node.get('_is_template'):
            return True
        # Skip background image nodes (names containing _bg, bg_, background)
        name = node.get('name', '').lower()
        if '_bg' in name or 'bg_' in name or 'background' in name:
            return True
        return False

    movable = [n for n in children if _node_rect(n) and not _is_skippable(n)]
    if len(movable) < 2:
        return

    resolved = []
    for iteration in range(max_iters):
        found = False
        for i in range(len(movable)):
            for j in range(i + 1, len(movable)):
                a, b = movable[i], movable[j]
                ra = _node_rect(a)
                rb = _node_rect(b)
                if ra is None or rb is None:
                    continue
                if not _rects_overlap(ra, rb):
                    continue

                found = True
                al, at, aw, ah = ra
                bl, bt, bw, bh = rb

                # Penetration on each axis
                overlap_x = min(al + aw, bl + bw) - max(al, bl)
                overlap_y = min(at + ah, bt + bh) - max(at, bt)

                # Push along the axis with smaller penetration
                if overlap_x <= overlap_y:
                    # Push horizontally: move b to the right of a
                    gap = 4.0
                    new_bl = al + aw + gap
                    new_bcx = new_bl + bw / 2.0
                    new_bcy = bt + bh / 2.0
                    axis = 'X'
                else:
                    # Push vertically: move b below a
                    gap = 4.0
                    new_bt = at + ah + gap
                    new_bcx = bl + bw / 2.0
                    new_bcy = new_bt + bh / 2.0
                    axis = 'Y'

                old_rb = rb
                _set_node_cx_cy(b, new_bcx, new_bcy, parent_w, parent_h)
                resolved.append(
                    f"  ⚠️  Overlap [{axis}] resolved: '{a.get('name')}' ↔ '{b.get('name')}'"
                    f"  pushed '{b.get('name')}' by {overlap_x if axis=='X' else overlap_y:.1f}px"
                )

        if not found:
            break

    if resolved:
        print(f"\n[Overlap Resolver] {len(resolved)} overlap(s) fixed:")
        for msg in resolved:
            print(msg)


def auto_resolve_overlaps(children, parent_w=DESIGN_WIDTH, parent_h=DESIGN_HEIGHT):
    """
    Recursively walk the node tree and resolve sibling overlaps at every level.
    """
    if not children:
        return

    # Resolve at the current level first
    _resolve_overlaps_in_children(children, parent_w, parent_h)

    # Then recurse into each child
    for node in children:
        node_children = node.get('children', [])
        if not node_children:
            continue
        size = node.get('size', [parent_w, parent_h])
        if isinstance(size, dict):
            size = size.get('items', [parent_w, parent_h])
        nw, nh = float(size[0]), float(size[1])
        auto_resolve_overlaps(node_children, nw, nh)


# =============================================================================
# Structural Verification
# =============================================================================

def _verify_structure(html_nodes, json_nodes, panel_name):
    """
    Compare the HTML-declared node structure against the generated JSON tree.
    
    html_nodes: list of (name, parent_name) recorded during HTML parsing
    json_nodes: dict of {name: parent_name} extracted from the output JSON
    
    Prints a report showing:
      - Total counts (HTML declared vs JSON generated)
      - Nodes present in HTML but missing from JSON (lost nodes)
      - Nodes whose parent differs between HTML and JSON (wrong hierarchy)
    """
    html_names = {name for name, _ in html_nodes}
    json_names = set(json_nodes.keys())

    # Auto-injected background image nodes (name ends with _bg) are expected extras
    auto_bg_names = {n for n in json_names if n not in html_names and n.endswith('_bg')}
    extra_in_json = json_names - html_names - auto_bg_names
    missing_in_json = html_names - json_names

    # Parent mismatch: nodes present in both but with different parents
    parent_mismatches = []
    for name, html_parent in html_nodes:
        if name in json_nodes:
            json_parent = json_nodes[name]
            # Normalize: None vs None is OK
            if html_parent != json_parent:
                parent_mismatches.append((name, html_parent, json_parent))

    # --- Print report ---
    total_html = len(html_nodes)
    total_json = len(json_nodes)
    injected_bg = len(auto_bg_names)

    print()
    print("=" * 60)
    print(f"  Structural Verification: {panel_name}")
    print("=" * 60)
    print(f"  HTML declared nodes : {total_html}")
    print(f"  JSON generated nodes: {total_json}  (incl. {injected_bg} auto-injected _bg)")

    if not missing_in_json and not parent_mismatches and not extra_in_json:
        print("  ✅ PASS — All nodes present, hierarchy correct.")
    else:
        if missing_in_json:
            print(f"\n  ❌ MISSING in JSON ({len(missing_in_json)} nodes):")
            for name in sorted(missing_in_json):
                # Find expected parent from html_nodes
                exp_parent = next((p for n, p in html_nodes if n == name), '?')
                print(f"       - {name}  (expected under: {exp_parent})")

        if parent_mismatches:
            print(f"\n  ⚠️  PARENT MISMATCH ({len(parent_mismatches)} nodes):")
            for name, hp, jp in parent_mismatches:
                print(f"       - {name}")
                print(f"           HTML parent : {hp}")
                print(f"           JSON parent : {jp}")

        if extra_in_json:
            print(f"\n  ℹ️  EXTRA in JSON ({len(extra_in_json)} nodes, non-bg):")
            for name in sorted(extra_in_json):
                print(f"       + {name}  (parent: {json_nodes[name]})")

    print("=" * 60)
    print()


# =============================================================================
# Main
# =============================================================================

def convert(html_path, output_path, panel_name="NewPanel", zorder=300):
    """Convert an HTML file to Y3 UI JSON."""
    with open(html_path, 'r', encoding='utf-8') as f:
        html_content = f.read()

    parser = Y3UIHTMLParser()
    parser.feed(html_content)

    children = parser.root_children

    # Post-process: recalculate margins with correct parent dimensions
    post_process_tree(children, DESIGN_WIDTH, DESIGN_HEIGHT)

    # NOTE: Overlap auto-resolve disabled by user request (2026-04-02)
    # The Step 2.5 layout check in SKILL.md now handles overlap detection manually.
    # auto_resolve_overlaps(children, DESIGN_WIDTH, DESIGN_HEIGHT)

    # Auto-inject background images for layouts that don't have one
    # NOTE: must run BEFORE stripping _is_template markers, so template nodes are skipped correctly
    auto_inject_layout_bg(children)

    # Clean up _is_template markers (kept through overlap resolver, remove before output)
    def _strip_template_markers(nodes):
        for n in nodes:
            n.pop('_is_template', None)
            _strip_template_markers(n.get('children', []))
    _strip_template_markers(children)

    panel = build_panel_json(children, panel_name, zorder)

    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(panel, f, indent=4, ensure_ascii=False)

    print(f"[OK] Generated: {output_path}")
    print(f"     Panel: {panel_name}, Children: {len(children)}, ZOrder: {zorder}")

    # Count all nodes in JSON
    total = 0
    json_nodes = {}  # name -> parent_name
    json_stack = [(n, None) for n in children]
    while json_stack:
        n, par = json_stack.pop()
        total += 1
        n_name = n.get('name', '?')
        json_nodes[n_name] = par
        for child in n.get('children', []):
            json_stack.append((child, n_name))
    print(f"     Total nodes: {total}")

    # ==========================================================================
    # Structural Verification Report
    # ==========================================================================
    _verify_structure(parser.html_nodes, json_nodes, panel_name)


def main():
    import argparse
    parser = argparse.ArgumentParser(description='Convert HTML to Y3 UI JSON')
    parser.add_argument('input', help='Input HTML file path')
    parser.add_argument('output', help='Output JSON file path')
    parser.add_argument('--panel-name', default='NewPanel', help='Panel name (default: NewPanel)')
    parser.add_argument('--zorder', type=int, default=300, help='Z-order (default: 300)')
    args = parser.parse_args()

    convert(args.input, args.output, args.panel_name, args.zorder)


if __name__ == '__main__':
    main()
