"""
UI 生成流水线 - 模板匹配模块

Step 2: 根据意图对象匹配模板并填充内容
"""

import copy
import json
import uuid
import re
import os
from typing import Dict, Any, Optional, List
from pathlib import Path

# 模板目录
TEMPLATE_DIR = Path(__file__).parent / "templates"

# 需要转换为 __tuple__ 格式的字段名
TUPLE_FIELDS = ("pos_data", "size", "anchor", "cap_insets")

# 模板映射表
TEMPLATE_MAP = {
    "popup": "popup_confirm.json",
    "inventory": "inventory_grid.json",
    "hud": "hud_basic.json",
    "skill_btn": "skill_btn.json",  # 技能按钮预制体
    "item_slot": "item_slot.json",  # 物品槽预制体
    "buff_slot": "buff_slot.json",  # Buff槽预制体
    "roguelike": "roguelike_choice.json",  # 肉鸽三选一界面
    "choice": "roguelike_choice.json",     # 选择界面（三选一）
    # TODO: 添加更多模板
    # "shop": "shop_list.json",
    # "settings": "settings_panel.json",
}

# 技能按钮默认配置
SKILL_BTN_CONFIG = {
    "keys": ["Q", "W", "E", "R"],
    "spacing": 110,  # 按钮间距（像素）
    "start_x": 0,    # 起始X偏移
}

# 物品槽默认配置
ITEM_SLOT_CONFIG = {
    "count": 6,      # 默认物品槽数量
    "spacing": 70,   # 槽位间距（像素）
    "start_x": 0,    # 起始X偏移
}

# Buff槽默认配置
BUFF_SLOT_CONFIG = {
    "count": 10,     # 默认Buff槽数量
    "spacing": 40,   # 槽位间距（像素）
    "start_x": 0,    # 起始X偏移
}


def load_template(template_name: str) -> Optional[Dict[str, Any]]:
    """
    加载模板文件
    
    Args:
        template_name: 模板文件名
        
    Returns:
        模板 JSON 对象或 None
    """
    template_path = TEMPLATE_DIR / template_name
    if not template_path.exists():
        return None
    
    with open(template_path, 'r', encoding='utf-8') as f:
        return json.load(f)


def generate_uid() -> str:
    """生成 UUID4 格式的 UID"""
    return str(uuid.uuid4())


def convert_tuple_fields(node: Dict[str, Any]) -> None:
    """
    递归将节点及其子节点中特定字段从普通数组格式转换为 __tuple__ 格式。
    
    转换字段：pos_data, size, anchor, cap_insets
    已经是 __tuple__ 格式的字段保持不变。
    原地修改节点。
    
    Args:
        node: UI JSON 节点
    """
    for key in TUPLE_FIELDS:
        v = node.get(key)
        if isinstance(v, list):
            node[key] = {"__tuple__": True, "items": v}
        # 如果已经是 dict 且有 __tuple__ 键，则跳过
    
    for child in node.get("children", []):
        convert_tuple_fields(child)


def _set_layer_name(node: Dict[str, Any], layer_name: str) -> None:
    """
    递归设置节点及其所有子节点的 layer_name 字段。
    根节点（type==2）不设置 layer_name，但其子节点会设置。
    
    Args:
        node: UI JSON 节点
        layer_name: 面板名称
    """
    if "layer_name" in node or node.get("type") != 2:
        node["layer_name"] = layer_name
    for child in node.get("children", []):
        _set_layer_name(child, layer_name)


def clone_from_template(template_name: str, layer_name: str,
                        replacements: Optional[Dict[str, str]] = None) -> Dict[str, Any]:
    """
    安全地克隆一个模板，执行完整的后处理职责链：
    load → deepcopy → set_layer_name → regenerate_uids → update_slot_refs
    → convert_tuple_fields → text replacements → set root name
    
    这是使用大型模板（popup_confirm、hud_basic 等）的唯一推荐入口。
    
    Args:
        template_name: 模板文件名，如 "popup_confirm.json"
        layer_name: 目标面板名称（同时设置 root.name 和所有子节点的 layer_name）
        replacements: 文本占位符替换映射，如 {"{{TITLE_TEXT}}": "确认"}
        
    Returns:
        完整的 UI JSON dict，所有 UID 已重生成，格式已规范化
        
    Raises:
        FileNotFoundError: 模板文件不存在
    """
    # 1. load
    template = load_template(template_name)
    if template is None:
        raise FileNotFoundError(f"Template not found: {template_name}")
    
    # 2. deepcopy
    node = copy.deepcopy(template)
    
    # 3. set_layer_name
    _set_layer_name(node, layer_name)
    
    # 4. regenerate_uids
    uid_map = regenerate_uids(node)
    
    # 5. update_slot_refs
    update_slot_refs(node, uid_map)
    
    # 6. convert_tuple_fields
    convert_tuple_fields(node)
    
    # 7. text replacements（序列化→替换→反序列化）
    if replacements:
        text = json.dumps(node, ensure_ascii=False)
        for placeholder, value in replacements.items():
            text = text.replace(placeholder, value)
        node = json.loads(text)
    
    # 8. set root name
    node["name"] = layer_name
    
    return node


def replace_placeholders(obj: Any, replacements: Dict[str, str]) -> Any:
    """
    递归替换 JSON 对象中的占位符
    
    Args:
        obj: JSON 对象（可以是 dict、list、str 等）
        replacements: 占位符到值的映射，如 {"{{NAME}}": "my_panel"}
        
    Returns:
        替换后的对象
    """
    if isinstance(obj, str):
        # 替换字符串中的占位符
        result = obj
        for placeholder, value in replacements.items():
            result = result.replace(placeholder, value)
        return result
    elif isinstance(obj, dict):
        return {k: replace_placeholders(v, replacements) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [replace_placeholders(item, replacements) for item in obj]
    else:
        return obj


def collect_uid_placeholders(obj: Any, placeholders: set = None) -> set:
    """
    收集模板中所有的 UID 占位符
    
    Args:
        obj: JSON 对象
        placeholders: 已收集的占位符集合
        
    Returns:
        所有 UID 占位符的集合
    """
    if placeholders is None:
        placeholders = set()
    
    if isinstance(obj, str):
        # 匹配 {{UID_xxx}} 格式的占位符
        matches = re.findall(r'\{\{UID_[A-Z0-9_]+\}\}', obj)
        placeholders.update(matches)
    elif isinstance(obj, dict):
        for v in obj.values():
            collect_uid_placeholders(v, placeholders)
    elif isinstance(obj, list):
        for item in obj:
            collect_uid_placeholders(item, placeholders)
    
    return placeholders


def match_template(ui_type: str) -> Optional[str]:
    """
    根据 UI 类型匹配模板
    
    Args:
        ui_type: 界面类型（如 "popup", "inventory"）
        
    Returns:
        模板文件名或 None
    """
    return TEMPLATE_MAP.get(ui_type)


def regenerate_uids(node: Dict[str, Any], uid_map: Dict[str, str] = None) -> Dict[str, str]:
    """
    递归重新生成节点及其子节点的所有 UID
    
    同时处理占位符格式（如 {{UID_ITEM_BG}}）和真实 UUID 格式。
    占位符 UID 会被替换为真实 UUID，并记录在 uid_map 中以便后续引用更新。
    
    Args:
        node: UI 节点
        uid_map: UID 映射表 (旧UID -> 新UID)
        
    Returns:
        UID 映射表
    """
    import copy
    if uid_map is None:
        uid_map = {}
    
    old_uid = node.get("uid")
    if old_uid:
        new_uid = generate_uid()
        uid_map[old_uid] = new_uid
        node["uid"] = new_uid
    
    for child in node.get("children", []):
        regenerate_uids(child, uid_map)
    
    return uid_map


def update_slot_refs(node: Dict[str, Any], uid_map: Dict[str, str]):
    """
    更新槽位组件 (SkillSlot/EquipSlot/BuffSlot) 的子组件引用
    
    这些槽位通过 UID 引用其子组件，克隆后需要更新这些引用。
    同时处理占位符格式（如 {{UID_ITEM_BG}}）和已生成的 UUID 格式。
    
    Args:
        node: UI 节点
        uid_map: UID 映射表 (旧UID -> 新UID)
    """
    # 所有槽位类型的引用字段
    ref_fields = [
        # SkillSlot (type:17) 引用字段
        "skill_icon_img", "skill_frame_img", "skill_cd_progress", "skill_cd_label",
        "skill_stack_label", "skill_upgrade_btn", "skill_shortcut_label", 
        "skill_level_label", "skill_consume_mask_img", "skill_disable_img",
        "skill_charge_progress", "skill_autocast_enable_img", "bg_image",
        "title_label", "image",
        # EquipSlot (type:20) 引用字段
        "hover_child", "equip_icon_img", "equip_bg_img", "equip_cd_progress",
        "equip_stack_label", "equip_charge_label", "equip_disabled_img",
        # BuffSlot (type:19) 引用字段
        "buff_icon_img", "buff_stack_label", "buff_time_progress", "buff_time_progress_bad",
    ]
    
    for field in ref_fields:
        if field in node and isinstance(node[field], str):
            old_ref = node[field]
            # 直接在 uid_map 中查找
            if old_ref in uid_map:
                node[field] = uid_map[old_ref]
            # 处理占位符格式：如果引用仍是 {{UID_xxx}} 格式，说明 regenerate_uids 时已被替换
            # 此时应该通过子节点的 name 来找到对应的 UID
    
    for child in node.get("children", []):
        update_slot_refs(child, uid_map)


# 向后兼容别名
def update_skill_refs(node: Dict[str, Any], uid_map: Dict[str, str]):
    """向后兼容：更新 SkillSlot 的子组件引用"""
    update_slot_refs(node, uid_map)


def clone_skill_btn(template: Dict[str, Any], key: str, slot_id: int, x_offset: float, layer_name: str) -> Dict[str, Any]:
    """
    克隆技能按钮模板
    
    Args:
        template: 技能按钮模板
        key: 快捷键 (Q/W/E/R)
        slot_id: 槽位 ID (1-4)
        x_offset: X 轴偏移
        layer_name: 所属面板名称
        
    Returns:
        克隆并配置好的技能按钮
    """
    import copy
    btn = copy.deepcopy(template)
    btn["name"] = f"skill_btn_{key}"
    btn["slot_id"] = slot_id
    
    # 设置 layer_name
    def set_layer_name(node, name):
        if "layer_name" in node or node.get("type") != 2:  # 非根节点都需要 layer_name
            node["layer_name"] = name
        for child in node.get("children", []):
            set_layer_name(child, name)
    set_layer_name(btn, layer_name)
    
    # 重新生成所有 UID
    uid_map = regenerate_uids(btn)
    
    # 更新 SkillSlot 对子组件的引用
    update_skill_refs(btn, uid_map)
    
    # 调整位置
    pos = btn.get("pos_data", {})
    if isinstance(pos, dict) and pos.get("__tuple__"):
        items = list(pos["items"])
        items[0] = items[0] + x_offset  # X 偏移
        btn["pos_data"] = {"__tuple__": True, "items": items}
    
    # 更新快捷键标签
    def update_shortcut_label(node, key):
        if node.get("name") == "skill_shortcut_label":
            text = node.get("text", {})
            if isinstance(text, dict) and text.get("__tuple__"):
                text["items"][0] = key
        for child in node.get("children", []):
            update_shortcut_label(child, key)
    update_shortcut_label(btn, key)
    
    return btn


def generate_skill_bar(layer_name: str, keys: List[str] = None, 
                       spacing: float = None, start_x: float = None) -> List[Dict[str, Any]]:
    """
    生成完整的技能栏（QWER 四个技能按钮）
    
    Args:
        layer_name: 所属面板名称
        keys: 快捷键列表，默认 ["Q", "W", "E", "R"]
        spacing: 按钮间距，默认 110
        start_x: 起始 X 偏移，默认 0
        
    Returns:
        技能按钮列表
    """
    # 使用默认配置或自定义配置
    keys = keys or SKILL_BTN_CONFIG["keys"]
    spacing = spacing if spacing is not None else SKILL_BTN_CONFIG["spacing"]
    start_x = start_x if start_x is not None else SKILL_BTN_CONFIG["start_x"]
    
    # 加载技能按钮模板
    template = load_template("skill_btn.json")
    if not template:
        raise FileNotFoundError("skill_btn.json template not found")
    
    # 生成技能按钮
    skill_btns = []
    for i, key in enumerate(keys):
        x_offset = start_x + i * spacing
        btn = clone_skill_btn(template, key, i + 1, x_offset, layer_name)
        skill_btns.append(btn)
    
    return skill_btns


def clone_item_slot(template: Dict[str, Any], index: int, x_offset: float, layer_name: str, slot_id: int = None) -> Dict[str, Any]:
    """
    克隆物品槽模板
    
    Args:
        template: 物品槽模板
        index: 槽位索引 (0-based)
        x_offset: X 轴绝对位置
        layer_name: 所属面板名称
        slot_id: 物品槽位ID (1-based)，如果不传则使用 index+1
        
    Returns:
        克隆并配置好的物品槽
    """
    import copy
    slot = copy.deepcopy(template)
    slot["name"] = f"item_slot_{index + 1}"
    
    # 设置 slot_id（物品栏槽位ID）
    actual_slot_id = slot_id if slot_id is not None else (index + 1)
    slot["slot_id"] = actual_slot_id
    
    # 设置 layer_name
    def set_layer_name(node, name):
        if "layer_name" in node or node.get("type") != 2:
            node["layer_name"] = name
        for child in node.get("children", []):
            set_layer_name(child, name)
    set_layer_name(slot, layer_name)
    
    # 重新生成所有 UID
    uid_map = regenerate_uids(slot)
    
    # 更新 EquipSlot 对子组件的引用
    update_slot_refs(slot, uid_map)
    
    # 设置绝对位置（使用左上角锚点，避免重叠）
    slot_size = slot.get("size", {})
    slot_width = 64.0  # 默认宽度
    if isinstance(slot_size, dict) and slot_size.get("__tuple__"):
        slot_width = slot_size["items"][0]
    
    # 设置位置：X 使用绝对偏移，Y 居中
    slot["pos_data"] = {
        "__tuple__": True, 
        "items": [x_offset + slot_width / 2, slot_width / 2, 0.0, 50.0, 0, 1]  # 左对齐，垂直居中
    }
    
    return slot


def clone_buff_slot(template: Dict[str, Any], index: int, x_offset: float, layer_name: str) -> Dict[str, Any]:
    """
    克隆 Buff 槽模板
    
    Args:
        template: Buff 槽模板
        index: 槽位索引 (0-based)
        x_offset: X 轴绝对位置
        layer_name: 所属面板名称
        
    Returns:
        克隆并配置好的 Buff 槽
    """
    import copy
    slot = copy.deepcopy(template)
    slot["name"] = f"buff_slot_{index + 1}"
    
    # 设置 layer_name
    def set_layer_name(node, name):
        if "layer_name" in node or node.get("type") != 2:
            node["layer_name"] = name
        for child in node.get("children", []):
            set_layer_name(child, name)
    set_layer_name(slot, layer_name)
    
    # 重新生成所有 UID
    uid_map = regenerate_uids(slot)
    
    # 更新 BuffSlot 对子组件的引用
    update_slot_refs(slot, uid_map)
    
    # 设置绝对位置（使用左上角锚点，避免重叠）
    slot_size = slot.get("size", {})
    slot_width = 36.0  # 默认宽度
    if isinstance(slot_size, dict) and slot_size.get("__tuple__"):
        slot_width = slot_size["items"][0]
    
    # 设置位置：X 使用绝对偏移，Y 居中
    slot["pos_data"] = {
        "__tuple__": True, 
        "items": [x_offset + slot_width / 2, slot_width / 2, 0.0, 50.0, 0, 1]  # 左对齐，垂直居中
    }
    
    return slot


def generate_item_bar(layer_name: str, count: int = None, 
                      spacing: float = None, start_x: float = None) -> List[Dict[str, Any]]:
    """
    生成物品栏（多个物品槽）
    
    Args:
        layer_name: 所属面板名称
        count: 物品槽数量，默认 6
        spacing: 槽位间距，默认 70
        start_x: 起始 X 偏移，默认 0
        
    Returns:
        物品槽列表
    """
    # 使用默认配置或自定义配置
    count = count if count is not None else ITEM_SLOT_CONFIG["count"]
    spacing = spacing if spacing is not None else ITEM_SLOT_CONFIG["spacing"]
    start_x = start_x if start_x is not None else ITEM_SLOT_CONFIG["start_x"]
    
    # 加载物品槽模板
    template = load_template("item_slot.json")
    if not template:
        raise FileNotFoundError("item_slot.json template not found")
    
    # 生成物品槽
    item_slots = []
    for i in range(count):
        x_offset = start_x + i * spacing
        slot = clone_item_slot(template, i, x_offset, layer_name)
        item_slots.append(slot)
    
    return item_slots


def generate_buff_bar(layer_name: str, count: int = None, 
                      spacing: float = None, start_x: float = None) -> List[Dict[str, Any]]:
    """
    生成 Buff 栏（多个 Buff 槽）
    
    Args:
        layer_name: 所属面板名称
        count: Buff 槽数量，默认 10
        spacing: 槽位间距，默认 40
        start_x: 起始 X 偏移，默认 0
        
    Returns:
        Buff 槽列表
    """
    # 使用默认配置或自定义配置
    count = count if count is not None else BUFF_SLOT_CONFIG["count"]
    spacing = spacing if spacing is not None else BUFF_SLOT_CONFIG["spacing"]
    start_x = start_x if start_x is not None else BUFF_SLOT_CONFIG["start_x"]
    
    # 加载 Buff 槽模板
    template = load_template("buff_slot.json")
    if not template:
        raise FileNotFoundError("buff_slot.json template not found")
    
    # 生成 Buff 槽
    buff_slots = []
    for i in range(count):
        x_offset = start_x + i * spacing
        slot = clone_buff_slot(template, i, x_offset, layer_name)
        buff_slots.append(slot)
    
    return buff_slots


def fill_template(template: Dict[str, Any], intent: Dict[str, Any]) -> Dict[str, Any]:
    """
    根据意图对象填充模板
    
    Args:
        template: 模板 JSON 对象
        intent: 意图对象
        
    Returns:
        填充后的 UI JSON
    """
    # 收集所有 UID 占位符并生成对应的 UUID
    uid_placeholders = collect_uid_placeholders(template)
    
    # 准备替换映射
    replacements = {}
    
    # 生成所有 UID
    for placeholder in uid_placeholders:
        replacements[placeholder] = generate_uid()
    
    # 替换基本字段
    name = intent.get("name", "generated_panel")
    # layer_name 必须与 name 一致（根据 Y3 引擎规范）
    layer_name = name
    
    replacements["{{NAME}}"] = name
    replacements["{{LAYER_NAME}}"] = layer_name
    replacements["{{TITLE}}"] = intent.get("title", "标题")
    replacements["{{CONTENT}}"] = intent.get("content", "内容")
    
    # 执行替换
    result = replace_placeholders(template, replacements)
    
    # 根据 slot_counts 定制槽位数量
    slot_counts = intent.get("slot_counts", {})
    if slot_counts and intent.get("ui_type") == "hud":
        result = customize_hud_slots(result, slot_counts, layer_name)
    
    return result


def customize_hud_slots(ui_json: Dict[str, Any], slot_counts: Dict[str, int], layer_name: str) -> Dict[str, Any]:
    """
    根据用户指定的数量定制 HUD 中的槽位组件
    
    采用"找到主容器并只处理一次"策略：
    1. 扫描整个 UI 树，找到包含最多同类型槽位的容器作为"主容器"
    2. 只对主容器进行增删操作，保留原有布局
    3. 使用 processed 标记避免重复处理
    
    Args:
        ui_json: HUD 模板 JSON
        slot_counts: {"skill_count": 4, "buff_count": 5, "item_count": 6}
        layer_name: 面板名称
        
    Returns:
        定制后的 HUD JSON
    """
    import copy
    
    skill_count = slot_counts.get("skill_count")
    item_count = slot_counts.get("item_count")
    buff_count = slot_counts.get("buff_count")
    
    # 记录已处理的槽位类型，避免重复处理
    processed_types = set()
    
    def get_slot_x_position(slot: Dict) -> float:
        """获取槽位的 X 坐标（像素值）"""
        pos = slot.get("pos_data", {})
        if isinstance(pos, dict) and pos.get("__tuple__"):
            return pos["items"][0]
        elif isinstance(pos, list) and len(pos) >= 1:
            return pos[0]
        return 0.0
    
    def _get_default_spacing(slot_type: int) -> float:
        """获取默认间距"""
        if slot_type == 17:  # SkillSlot
            return SKILL_BTN_CONFIG["spacing"]
        elif slot_type == 19:  # BuffSlot
            return BUFF_SLOT_CONFIG["spacing"]
        elif slot_type == 20:  # EquipSlot
            return ITEM_SLOT_CONFIG["spacing"]
        return 50.0
    
    def _update_shortcut_label(node: Dict, key: str):
        """更新快捷键标签"""
        if node.get("name") == "skill_shortcut_label":
            text = node.get("text", {})
            if isinstance(text, dict) and text.get("__tuple__"):
                text["items"][0] = key
            elif isinstance(text, list) and len(text) >= 1:
                text[0] = key
        for child in node.get("children", []):
            _update_shortcut_label(child, key)
    
    def clone_and_offset_slot(template_slot: Dict, new_x: float, index: int, 
                              slot_type: int) -> Dict:
        """克隆槽位并设置新的 X 坐标"""
        new_slot = copy.deepcopy(template_slot)
        
        # 更新名称
        if slot_type == 17:  # SkillSlot
            default_keys = ["Q", "W", "E", "R", "T", "D", "F", "G"]
            key = default_keys[index] if index < len(default_keys) else str(index + 1)
            new_slot["name"] = f"skill_btn_{key}"
            new_slot["slot_id"] = index + 1
            _update_shortcut_label(new_slot, key)
        elif slot_type == 19:  # BuffSlot
            new_slot["name"] = f"buff_slot_{index + 1}"
        elif slot_type == 20:  # EquipSlot
            new_slot["name"] = f"item_slot_{index + 1}"
        
        # 重新生成所有 UID
        uid_map = regenerate_uids(new_slot)
        update_slot_refs(new_slot, uid_map)
        
        # 更新 X 坐标（保留原有 Y 坐标和其他参数）
        pos = new_slot.get("pos_data", {})
        if isinstance(pos, dict) and pos.get("__tuple__"):
            items = list(pos["items"])
            items[0] = new_x
            new_slot["pos_data"] = {"__tuple__": True, "items": items}
        elif isinstance(pos, list) and len(pos) >= 1:
            pos[0] = new_x
            new_slot["pos_data"] = pos
        
        return new_slot
    
    def find_main_container(node: Dict, slot_type: int) -> Optional[Dict]:
        """
        找到包含最多指定类型槽位的容器（主容器）
        
        Returns:
            {"container": 容器节点, "slots": 槽位列表, "slot_count": 数量}
        """
        best = {"container": None, "slots": [], "slot_count": 0}
        
        def search(n):
            nonlocal best
            children = n.get("children", [])
            slots = [c for c in children if c.get("type", 0) == slot_type]
            if len(slots) > best["slot_count"]:
                best = {"container": n, "slots": slots, "slot_count": len(slots)}
            for c in children:
                search(c)
        
        search(node)
        return best if best["container"] else None
    
    def adjust_slots_in_container(container_info: Dict, target_count: int, slot_type: int):
        """
        在容器中调整槽位数量
        
        Args:
            container_info: {"container": 节点, "slots": 原槽位列表}
            target_count: 目标数量
            slot_type: 槽位类型
        """
        container = container_info["container"]
        slots = container_info["slots"]
        
        if not slots or target_count <= 0:
            return
        
        # 按 X 坐标排序
        slots.sort(key=get_slot_x_position)
        current_count = len(slots)
        
        # 获取非槽位的其他子节点
        other_children = [c for c in container.get("children", []) 
                         if c.get("type", 0) != slot_type]
        
        if target_count == current_count:
            # 数量相同，不需要修改
            return
        
        elif target_count < current_count:
            # 需要减少：保留前 N 个
            new_slots = slots[:target_count]
        
        else:
            # 需要增加：克隆最后一个槽位
            new_slots = list(slots)
            
            # 计算间距
            if current_count >= 2:
                last_pos = get_slot_x_position(slots[-1])
                second_last_pos = get_slot_x_position(slots[-2])
                spacing = last_pos - second_last_pos
            else:
                spacing = _get_default_spacing(slot_type)
            
            last_x = get_slot_x_position(slots[-1])
            
            # 克隆并偏移
            for i in range(target_count - current_count):
                new_x = last_x + spacing * (i + 1)
                new_slot = clone_and_offset_slot(slots[-1], new_x, i + current_count, slot_type)
                new_slots.append(new_slot)
        
        # 重组子节点
        container["children"] = other_children + new_slots
    
    # 开始处理
    # 最小槽位数阈值：只有当容器中至少有这么多槽位时才进行定制
    # 如果容器中槽位太少（如每个容器只有1个），说明是分散布局，不适合自动调整
    MIN_SLOTS_FOR_ADJUSTMENT = 2
    
    result = copy.deepcopy(ui_json)
    
    # 处理 SkillSlot (type=17)
    if skill_count is not None and 17 not in processed_types:
        main_skill = find_main_container(result, 17)
        if main_skill and main_skill["slot_count"] >= MIN_SLOTS_FOR_ADJUSTMENT:
            adjust_slots_in_container(main_skill, skill_count, 17)
            processed_types.add(17)
        # 如果槽位分散在多个容器中，跳过调整（保留原有布局）
    
    # 处理 EquipSlot (type=20)
    if item_count is not None and 20 not in processed_types:
        main_equip = find_main_container(result, 20)
        if main_equip and main_equip["slot_count"] >= MIN_SLOTS_FOR_ADJUSTMENT:
            adjust_slots_in_container(main_equip, item_count, 20)
            processed_types.add(20)
    
    # 处理 BuffSlot (type=19)
    if buff_count is not None and 19 not in processed_types:
        main_buff = find_main_container(result, 19)
        if main_buff and main_buff["slot_count"] >= MIN_SLOTS_FOR_ADJUSTMENT:
            adjust_slots_in_container(main_buff, buff_count, 19)
            processed_types.add(19)
    
    return result


def generate_from_template(intent: Dict[str, Any], output_name: str = None) -> Dict[str, Any]:
    """
    根据意图对象生成 UI JSON
    
    Args:
        intent: 意图对象
        output_name: 输出文件名（可选，用于覆盖 name 字段）
        
    Returns:
        {"success": True, "ui_json": {...}} 或 {"success": False, "error": "..."}
    """
    ui_type = intent.get("ui_type")
    
    # 如果提供了 output_name，更新 intent 中的 name
    if output_name:
        intent = dict(intent)  # 不修改原始 intent
        intent["name"] = output_name
    
    # 匹配模板
    template_name = match_template(ui_type)
    if not template_name:
        return {
            "success": False,
            "error": f"No template found for ui_type: {ui_type}",
            "fallback_required": True
        }
    
    # 加载模板
    template = load_template(template_name)
    if not template:
        return {
            "success": False,
            "error": f"Failed to load template: {template_name}",
            "fallback_required": True
        }
    
    # 填充模板
    try:
        ui_json = fill_template(template, intent)
        return {
            "success": True,
            "ui_json": ui_json,
            "template_used": template_name
        }
    except Exception as e:
        return {
            "success": False,
            "error": f"Failed to fill template: {str(e)}",
            "fallback_required": True
        }


def save_ui_json(ui_json: Dict[str, Any], output_path: str) -> Dict[str, Any]:
    """
    保存 UI JSON 到文件
    
    Args:
        ui_json: UI JSON 对象
        output_path: 输出路径
        
    Returns:
        {"success": True, "path": "..."} 或 {"success": False, "error": "..."}
    """
    try:
        # 确保目录存在
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(ui_json, f, ensure_ascii=False, indent=4)
        
        return {
            "success": True,
            "path": output_path
        }
    except Exception as e:
        return {
            "success": False,
            "error": str(e)
        }


if __name__ == "__main__":
    import sys

    def _print_usage():
        print("Usage:")
        print("  py -3 template_matcher.py clone <template_name> <output_path> <layer_name> [--replace KEY=VALUE ...]")
        print("  py -3 template_matcher.py test")
        print()
        print("Examples:")
        print('  py -3 template_matcher.py clone popup_confirm.json out.json my_dialog --replace "{{TITLE}}=确认"')
        print("  py -3 template_matcher.py test")

    if len(sys.argv) < 2:
        _print_usage()
        sys.exit(1)

    command = sys.argv[1]

    if command == "clone":
        # clone <template_name> <output_path> <layer_name> [--replace KEY=VALUE ...]
        if len(sys.argv) < 5:
            print("Error: clone requires at least 3 arguments: <template_name> <output_path> <layer_name>")
            _print_usage()
            sys.exit(1)

        template_name = sys.argv[2]
        output_path = sys.argv[3]
        layer_name = sys.argv[4]

        # 解析 --replace 参数
        replacements = {}
        i = 5
        while i < len(sys.argv):
            if sys.argv[i] == "--replace" and i + 1 < len(sys.argv):
                i += 1
                kv = sys.argv[i]
                eq_pos = kv.find("=")
                if eq_pos > 0:
                    replacements[kv[:eq_pos]] = kv[eq_pos + 1:]
                else:
                    print(f"Warning: invalid --replace format '{kv}', expected KEY=VALUE")
            else:
                # 也支持 --replace KEY=VALUE KEY2=VALUE2 连续写
                kv = sys.argv[i]
                eq_pos = kv.find("=")
                if eq_pos > 0 and kv.startswith("{{"):
                    replacements[kv[:eq_pos]] = kv[eq_pos + 1:]
                # else: ignore unknown args
            i += 1

        try:
            result = clone_from_template(template_name, layer_name,
                                         replacements if replacements else None)
            save_result = save_ui_json(result, output_path)
            if save_result["success"]:
                # 统计节点数
                node_count = [0]
                def _count(n):
                    node_count[0] += 1
                    for c in n.get("children", []):
                        _count(c)
                _count(result)
                print(f"✅ Cloned '{template_name}' → '{output_path}'")
                print(f"   layer_name: {layer_name}")
                print(f"   nodes: {node_count[0]}")
                if replacements:
                    print(f"   replacements: {len(replacements)}")
            else:
                print(f"❌ Save failed: {save_result['error']}")
                sys.exit(1)
        except FileNotFoundError as e:
            print(f"❌ {e}")
            sys.exit(1)

    elif command == "test":
        # 保留原有的测试逻辑
        from intent_parser import parse_user_request

        test_cases = [
            "生成一个确认弹窗，标题是'确认退出'",
            "创建一个背包界面，标题是'我的背包'",
            "做一个 HUD 界面",
        ]

        for text in test_cases:
            print(f"\n{'='*50}")
            print(f"输入: {text}")

            parse_result = parse_user_request(text)
            if not parse_result.get("success"):
                print(f"意图解析失败: {parse_result}")
                continue

            intent = parse_result["intent"]
            print(f"意图: {json.dumps(intent, ensure_ascii=False)}")

            gen_result = generate_from_template(intent)
            if not gen_result.get("success"):
                print(f"模板生成失败: {gen_result}")
                continue

            print(f"使用模板: {gen_result.get('template_used')}")
            print(f"生成的 UI JSON (部分):")
            ui_json = gen_result["ui_json"]
            print(f"  name: {ui_json.get('name')}")
            print(f"  uid: {ui_json.get('uid')}")
            print(f"  children count: {len(ui_json.get('children', []))}")

    else:
        print(f"Unknown command: {command}")
        _print_usage()
        sys.exit(1)
