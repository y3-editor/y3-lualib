"""
UI 树状结构 → 完整 JSON 生成器

输入: 简化的树状结构 (name, type, children)
输出: 完整的 Y3 UI JSON (含 uid, pos_data, size, layer_name 等)

🚨 官方组件自动生成：
- type: skill_btn / 技能按钮 → 自动加载 skill_btn.json 模板
- type: item_slot / 物品槽 → 自动加载 item_slot.json 模板
- type: buff_slot / buff项 → 自动加载 buff_slot.json 模板

使用方法:
    python tree_to_ui_json.py input_tree.json output.json
    
或在 Python 中调用:
    from tree_to_ui_json import generate_ui_from_tree
    ui_json = generate_ui_from_tree(tree_data, "PanelName")
"""

import json
import uuid
import sys
import os
from typing import Dict, Any, List, Optional
from pathlib import Path

# 导入官方组件生成器
try:
    from template_matcher import (
        load_template, 
        regenerate_uids, 
        update_slot_refs,
        clone_skill_btn,
        clone_item_slot,
        clone_buff_slot,
    )
    TEMPLATE_AVAILABLE = True
except ImportError:
    TEMPLATE_AVAILABLE = False
    print("⚠️ 警告: template_matcher 模块不可用，官方组件将使用简化结构")


# ==============================================================================
# Prefab 嵌入支持
# ==============================================================================

# Prefab 目录（相对于项目根目录）
PREFAB_DIR = None  # 运行时设置

def _find_prefab_dir() -> Optional[str]:
    """
    自动查找 prefab 目录路径。
    从当前脚本位置向上查找 maps/EntryMap/ui/prefab/ 目录。
    """
    # 从脚本所在目录向上查找
    current = Path(__file__).resolve().parent
    for _ in range(10):  # 最多向上查找10层
        candidate = current / "maps" / "EntryMap" / "ui" / "prefab"
        if candidate.exists():
            return str(candidate)
        current = current.parent
    return None


def load_prefab(prefab_name: str, prefab_dir: str = None) -> Optional[Dict[str, Any]]:
    """
    加载 prefab 文件。
    
    Args:
        prefab_name: prefab 名称（不含路径和 .json 后缀）
        prefab_dir: prefab 目录路径，如果不指定则自动查找
    
    Returns:
        prefab 的 data 节点（包含 children、prefab_key 等），或 None
    """
    if prefab_dir is None:
        prefab_dir = _find_prefab_dir()
    if prefab_dir is None:
        print(f"⚠️ 警告: 找不到 prefab 目录")
        return None
    
    # 支持带或不带 .json 后缀
    if not prefab_name.endswith(".json"):
        prefab_name = prefab_name + ".json"
    
    prefab_path = Path(prefab_dir) / prefab_name
    if not prefab_path.exists():
        print(f"⚠️ 警告: prefab 文件不存在: {prefab_path}")
        return None
    
    with open(prefab_path, 'r', encoding='utf-8') as f:
        prefab_json = json.load(f)
    
    # prefab 文件结构: { "data": {...}, "key": "...", "name": "..." }
    if "data" not in prefab_json or "key" not in prefab_json:
        print(f"⚠️ 警告: prefab 文件格式不正确: {prefab_path}")
        return None
    
    return prefab_json


def clone_prefab_for_embed(prefab_json: Dict[str, Any], instance_name: str) -> Dict[str, Any]:
    """
    克隆 prefab 数据用于嵌入到面板中。
    
    规则：
    - uid: 所有节点重新生成（根节点如果没有 uid 则补充）
    - prefab_sub_key: 保持不变（与 prefab 源文件一致）
    - prefab_key: 根节点保持（标识引用哪个 prefab）
    - name: 根节点改为 instance_name
    
    Args:
        prefab_json: 完整的 prefab JSON（含 data、key、name）
        instance_name: 实例名称（如 "challengeCmp_1"）
    
    Returns:
        可直接嵌入面板 children 的节点数据
    """
    import copy
    
    data = copy.deepcopy(prefab_json["data"])
    
    # 确保根节点有 uid（prefab 源文件的 data 根节点可能没有 uid）
    if "uid" not in data:
        data["uid"] = str(uuid.uuid4())
    
    # 重新生成所有 uid（但不改 prefab_sub_key）
    _regenerate_uids_only(data)
    
    # 设置实例名称
    data["name"] = instance_name
    
    return data


def _regenerate_uids_only(node: Dict[str, Any]):
    """
    递归为节点生成/重新生成 uid，但保留 prefab_sub_key 不变。
    如果节点没有 uid 字段，也会补上（嵌入到面板时所有节点都需要 uid）。
    """
    node["uid"] = str(uuid.uuid4())
    
    for child in node.get("children", []):
        _regenerate_uids_only(child)


# ==============================================================================
# 控件类型定义
# ==============================================================================

UI_TYPES = {
    "button": 1,
    "btn": 1,
    "按钮": 1,
    
    "panel": 2,
    "面板": 2,
    "root": 2,
    
    "text": 3,
    "label": 3,
    "文本": 3,
    
    "image": 4,
    "img": 4,
    "图片": 4,
    
    "progress": 5,
    "进度条": 5,
    
    "model": 6,
    "3d模型": 6,
    
    "layout": 7,
    "container": 7,
    "空节点": 7,
    "容器": 7,
    
    "scrollview": 10,
    "滚动视图": 10,
    
    "slider": 11,
    "滑动条": 11,
    
    "input": 15,
    "inputfield": 15,
    "输入框": 15,
    
    # 引擎专用控件类型 (参见 EditorUICompMeta.py UIComponentType)
    "minimap": 16,
    "mini_map": 16,
    "小地图": 16,
    
    "skillbtn": 17,
    "skill_btn": 17,
    "skill_slot": 17,
    "技能按钮": 17,
    "技能槽": 17,
    
    "bufflist": 18,
    "buff_list": 18,
    "buff列表": 18,
    
    "buffitem": 19,
    "buff_item": 19,
    "buff_slot": 19,
    "buff项": 19,
    
    "equipslot": 20,
    "item_slot": 20,
    "物品槽": 20,
    "装备槽": 20,
    
    "grid": 25,
    "gridview": 25,
    "网格": 25,
    
    # 特殊类型：prefab 嵌入（脚本内部使用，会被替换为 type:7 + prefab_key）
    "prefab": -1,
    "预制体": -1,
}

# 官方封装组件类型（需要从模板生成）
OFFICIAL_COMPONENT_TYPES = {17, 19, 20}  # 技能按钮、Buff项、物品槽

# Prefab 虚拟类型标识（在树状结构中使用，生成时会替换为实际 prefab 数据）
PREFAB_TYPE = -1


# ==============================================================================
# 默认属性配置
# ==============================================================================

def get_default_props(type_id: int, name: str) -> Dict[str, Any]:
    """
    根据控件类型返回默认属性
    """
    base_props = {
        "anchor": [0.5, 0.5],
        "event_list": [],
    }
    
    if type_id == 1:  # Button
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [200.0, 60.0]},
        }
    
    elif type_id == 2:  # Panel (根节点)
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [1920.0, 1080.0]},
            "layer": 200,
            "auto_create": True,
            "visible": True,
        }
    
    elif type_id == 3:  # Text
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [200.0, 40.0]},
            "text": [name.replace("_TEXT", "").replace("_text", ""), False],
            "font": ["", 24],
            "font_color": [255, 255, 255, 255],
        }
    
    elif type_id == 4:  # Image
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [100.0, 100.0]},
            "image": 134233166,  # 默认白色图片
        }
    
    elif type_id == 5:  # Progress
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [200.0, 20.0]},
            "progress": 100,
        }
    
    elif type_id == 7:  # Layout / Container
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [400.0, 300.0]},
        }
    
    elif type_id == 10:  # ScrollView
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [400.0, 300.0]},
            "inner_size": {"__tuple__": True, "items": [400.0, 600.0]},
        }
    
    else:
        return {
            **base_props,
            "size": {"__tuple__": True, "items": [100.0, 100.0]},
        }


def calculate_default_position(index: int, total: int, parent_size: List[float], item_size: List[float]) -> List[float]:
    """
    计算子控件的默认位置（水平均匀分布，使用像素定位）
    
    Y3 坐标系规则：
    - 原点在左下角，X向右，Y向上
    - pos_data: [x_abs, y_abs, x_pct, y_pct, use_pct_x, use_pct_y]
    - use_pct_x/y: 0=使用像素值, 1=使用百分比
    - 百分比和像素是二选一关系
    
    Args:
        index: 当前控件在兄弟中的索引（0开始）
        total: 兄弟控件总数
        parent_size: 父控件尺寸 [width, height]
        item_size: 当前控件尺寸 [width, height]
    
    Returns:
        pos_data: [x_abs, y_abs, x_pct, y_pct, use_pct_x, use_pct_y]
    """
    item_width = item_size[0]
    item_height = item_size[1]
    parent_width = parent_size[0]
    parent_height = parent_size[1]
    
    if total <= 1:
        # 单个控件，居中（使用像素定位）
        x_abs = parent_width / 2.0
        y_abs = parent_height / 2.0
    else:
        # 多个控件，水平均匀分布
        # 计算间距：总宽度分成 total+1 份
        spacing = parent_width / (total + 1)
        x_abs = spacing * (index + 1)
        y_abs = parent_height / 2.0
    
    # 使用像素定位（use_pct_x=0, use_pct_y=0）
    return [x_abs, y_abs, 0.0, 0.0, 0, 0]


# ==============================================================================
# 官方组件生成
# ==============================================================================

def generate_official_component(
    node: Dict[str, Any],
    layer_name: str,
    x_offset: float = 0.0,
    y_offset: float = 50.0
) -> Optional[Dict[str, Any]]:
    """
    生成官方封装组件（技能按钮、物品槽、Buff槽）
    
    Args:
        node: 树节点，包含 name, type, 以及可选的 slot_id, shortcut 等
        layer_name: 所属面板名称
        x_offset: X 轴偏移
        y_offset: Y 轴偏移（相对于底部）
    
    Returns:
        完整的官方组件 JSON，如果不支持则返回 None
    """
    if not TEMPLATE_AVAILABLE:
        return None
    
    type_id = parse_type(node.get("type", 7))
    name = node.get("name", "unnamed")
    
    if type_id == 17:  # 技能按钮
        template = load_template("skill_btn.json")
        if not template:
            print(f"⚠️ 警告: skill_btn.json 模板不存在")
            return None
        
        # 获取参数
        slot_id = node.get("slot_id", 1)
        shortcut = node.get("shortcut", "Q")
        
        # 克隆并配置
        result = clone_skill_btn(template, shortcut, slot_id, x_offset, layer_name)
        result["name"] = name
        
        # 应用自定义位置
        if "pos_x" in node or "pos_y" in node:
            pos = result.get("pos_data", {})
            if isinstance(pos, dict) and pos.get("__tuple__"):
                items = list(pos["items"])
                if "pos_x" in node:
                    items[0] = node["pos_x"]
                if "pos_y" in node:
                    items[1] = node["pos_y"]
                result["pos_data"] = {"__tuple__": True, "items": items}
        
        return result
    
    elif type_id == 20:  # 物品槽
        template = load_template("item_slot.json")
        if not template:
            print(f"⚠️ 警告: item_slot.json 模板不存在")
            return None
        
        # 获取参数
        slot_id = node.get("slot_id", 1)
        
        # 克隆并配置（传入 slot_id）
        result = clone_item_slot(template, slot_id - 1, x_offset, layer_name, slot_id)
        result["name"] = name
        
        # 应用自定义位置
        if "pos_x" in node or "pos_y" in node:
            pos = result.get("pos_data", {})
            if isinstance(pos, dict) and pos.get("__tuple__"):
                items = list(pos["items"])
                if "pos_x" in node:
                    items[0] = node["pos_x"]
                if "pos_y" in node:
                    items[1] = node["pos_y"]
                result["pos_data"] = {"__tuple__": True, "items": items}
        
        return result
    
    elif type_id == 19:  # Buff 槽
        template = load_template("buff_slot.json")
        if not template:
            print(f"⚠️ 警告: buff_slot.json 模板不存在")
            return None
        
        # 获取参数
        slot_id = node.get("slot_id", 1)
        
        # 克隆并配置
        result = clone_buff_slot(template, slot_id - 1, x_offset, layer_name)
        result["name"] = name
        
        # 应用自定义位置
        if "pos_x" in node or "pos_y" in node:
            pos = result.get("pos_data", {})
            if isinstance(pos, dict) and pos.get("__tuple__"):
                items = list(pos["items"])
                if "pos_x" in node:
                    items[0] = node["pos_x"]
                if "pos_y" in node:
                    items[1] = node["pos_y"]
                result["pos_data"] = {"__tuple__": True, "items": items}
        
        return result
    
    return None


# ==============================================================================
# 树状结构转换
# ==============================================================================

def parse_type(type_value) -> int:
    """解析类型值，支持字符串和数字"""
    if isinstance(type_value, int):
        return type_value
    if isinstance(type_value, str):
        type_lower = type_value.lower()
        if type_lower in UI_TYPES:
            return UI_TYPES[type_lower]
        # 尝试直接转为数字
        try:
            return int(type_value)
        except ValueError:
            pass
    return 7  # 默认为 Layout


def is_official_component(type_value) -> bool:
    """判断是否为官方封装组件"""
    type_id = parse_type(type_value)
    return type_id in OFFICIAL_COMPONENT_TYPES


def calculate_container_size(children: List[Dict], default_child_size: List[float] = [100.0, 100.0], padding: float = 10.0) -> List[float]:
    """
    根据子元素数量计算容器尺寸（水平排列）
    
    Args:
        children: 子元素列表
        default_child_size: 默认子元素尺寸 [width, height]
        padding: 元素间距
    
    Returns:
        [width, height]
    """
    count = len(children)
    if count == 0:
        return [100.0, 100.0]
    
    child_width = default_child_size[0]
    child_height = default_child_size[1]
    
    # 水平排列：宽度 = 子元素数量 * (宽度 + 间距) + 额外边距
    total_width = count * child_width + (count - 1) * padding + padding * 2
    total_height = child_height + padding * 2
    
    return [total_width, total_height]


def convert_tree_node(
    node: Dict[str, Any],
    layer_name: str,
    parent_size: List[float] = [1920.0, 1080.0],
    sibling_index: int = 0,
    sibling_count: int = 1,
    is_root: bool = False
) -> Dict[str, Any]:
    """
    递归转换树节点为完整的 UI JSON 节点
    
    Args:
        node: 输入的简化节点 {name, type, children?}
        layer_name: UI 层名称（通常是根面板名称）
        parent_size: 父控件尺寸
        sibling_index: 在兄弟中的索引
        sibling_count: 兄弟总数
        is_root: 是否为根节点
    
    Returns:
        完整的 UI JSON 节点
    """
    name = node.get("name", "unnamed")
    type_id = parse_type(node.get("type", 7))
    children = node.get("children", [])
    
    # 🚨 Prefab 嵌入：从 prefab 文件加载完整结构
    if type_id == PREFAB_TYPE:
        prefab_name = node.get("prefab_name", name)  # 优先使用 prefab_name，否则用节点 name
        prefab_json = load_prefab(prefab_name)
        if prefab_json:
            # 计算实例名称（如 "challengeCmp_1"）
            instance_name = node.get("instance_name", name)
            
            # 克隆 prefab 数据
            prefab_node = clone_prefab_for_embed(prefab_json, instance_name)
            
            # 应用用户自定义位置
            if "pos_x" in node or "pos_y" in node:
                pos = prefab_node.get("pos_data", {})
                if isinstance(pos, dict) and pos.get("__tuple__"):
                    items = list(pos["items"])
                    if "pos_x" in node:
                        items[0] = float(node["pos_x"])
                    if "pos_y" in node:
                        items[1] = float(node["pos_y"])
                    prefab_node["pos_data"] = {"__tuple__": True, "items": items}
            else:
                # 使用默认位置（在父容器中均匀分布）
                prefab_size = [100.0, 100.0]
                ps = prefab_node.get("size", {})
                if isinstance(ps, dict) and ps.get("__tuple__"):
                    prefab_size = list(ps["items"])
                default_pos = calculate_default_position(sibling_index, sibling_count, parent_size, prefab_size)
                prefab_node["pos_data"] = {"__tuple__": True, "items": default_pos}
            
            # 应用用户自定义尺寸
            if "width" in node or "height" in node:
                sz = prefab_node.get("size", {})
                if isinstance(sz, dict) and sz.get("__tuple__"):
                    items = list(sz["items"])
                    if "width" in node:
                        items[0] = float(node["width"])
                    if "height" in node:
                        items[1] = float(node["height"])
                    prefab_node["size"] = {"__tuple__": True, "items": items}
            
            # 应用 visible 属性
            if "visible" in node:
                prefab_node["visible"] = node["visible"]
            
            return prefab_node
        else:
            print(f"⚠️ prefab '{prefab_name}' 加载失败，降级为普通 layout 节点")
            type_id = 7  # 降级为 layout
    
    # 🚨 关键规则：子容器不能使用 type:2 (panel)，必须转为 type:7 (layout)
    # type:2 只能用于根节点，否则会导致 WorldUILayer.__init__() 错误
    if not is_root and type_id == 2:
        type_id = 7  # 自动转换为 layout
    
    # 🚨 官方组件：使用模板生成
    if type_id in OFFICIAL_COMPONENT_TYPES and TEMPLATE_AVAILABLE:
        # 根据组件类型确定尺寸
        if type_id == 17:  # 技能按钮
            component_size = [100.0, 100.0]
        elif type_id == 20:  # 物品槽
            component_size = [64.0, 64.0]
        elif type_id == 19:  # Buff槽
            component_size = [50.0, 50.0]
        else:
            component_size = [100.0, 100.0]
        
        # 计算在父容器中的绝对位置（居中，anchor=[0.5, 0.5]）
        default_pos = calculate_default_position(sibling_index, sibling_count, parent_size, component_size)
        
        official_node = generate_official_component(node, layer_name, 0)  # 不使用 x_offset
        if official_node:
            # 只有当用户没有指定位置时，才使用计算的默认位置
            # generate_official_component 已经处理了用户自定义的 pos_x/pos_y
            if "pos_x" not in node and "pos_y" not in node:
                official_node["pos_data"] = {"__tuple__": True, "items": [default_pos[0], default_pos[1], 0.0, 0.0, 0, 0]}
            # 确保有 anchor
            if "anchor" not in official_node:
                official_node["anchor"] = [0.5, 0.5]
            return official_node
        # 如果官方组件生成失败，继续使用普通方式
    
    # 生成 UID
    uid = node.get("uid") or str(uuid.uuid4())
    
    # 获取默认属性
    default_props = get_default_props(type_id, name)
    
    # 计算 size
    # 如果是容器类型（type:7）且有子元素，根据子元素计算尺寸
    if type_id == 7 and children:
        # 检测子元素是否为官方组件
        first_child_type = parse_type(children[0].get("type", 7)) if children else 7
        if first_child_type == 17:  # 技能按钮
            child_size = [100.0, 100.0]
        elif first_child_type == 20:  # 物品槽
            child_size = [64.0, 64.0]
        elif first_child_type == 19:  # Buff槽
            child_size = [50.0, 50.0]
        else:
            child_size = [100.0, 100.0]
        
        current_size = calculate_container_size(children, child_size)
        size_data = {"__tuple__": True, "items": current_size}
    else:
        size_data = default_props.get("size", {"__tuple__": True, "items": [100.0, 100.0]})
        if isinstance(size_data, dict) and "__tuple__" in size_data:
            current_size = list(size_data["items"])
        else:
            current_size = list(size_data)
    
    # 计算位置和锚点
    if is_root:
        # 根节点：屏幕中央
        pos_data = [960.0, 540.0, 0.0, 0.0, 0, 0]
        anchor = [0.5, 0.5]
    else:
        pos_data = calculate_default_position(sibling_index, sibling_count, parent_size, current_size)
        anchor = [0.5, 0.5]  # 子元素默认居中锚点
    
    # 构建节点
    result = {
        "name": name,
        "type": type_id,
        "uid": uid,
        "anchor": anchor,
        "pos_data": {"__tuple__": True, "items": pos_data},
        "size": size_data,
    }
    
    # 应用树节点中的自定义位置和锚点
    if "pos_x" in node or "pos_y" in node:
        items = list(result["pos_data"]["items"])
        if "pos_x" in node:
            items[0] = float(node["pos_x"])
        if "pos_y" in node:
            items[1] = float(node["pos_y"])
        result["pos_data"] = {"__tuple__": True, "items": items}
    
    if "anchor" in node:
        result["anchor"] = node["anchor"]
    
    # 只有根节点添加 layer_name
    if is_root:
        result["layer_name"] = layer_name
    
    # 添加类型特定属性
    for key in ["text", "font", "font_color", "image", "progress", "inner_size", 
                "layer", "auto_create", "visible", "event_list"]:
        if key in default_props:
            result[key] = default_props[key]
    
    # 处理子节点（children 已在前面获取）
    if children:
        result["children"] = []
        for i, child in enumerate(children):
            child_result = convert_tree_node(
                child,
                layer_name,
                parent_size=current_size,
                sibling_index=i,
                sibling_count=len(children),
                is_root=False
            )
            result["children"].append(child_result)
    else:
        result["children"] = []
    
    return result


def generate_ui_from_tree(
    tree: Dict[str, Any],
    panel_name: Optional[str] = None
) -> Dict[str, Any]:
    """
    从树状结构生成完整的 UI JSON
    
    Args:
        tree: 树状结构，格式为 {name, type, children: [...]}
        panel_name: 面板名称，如果不指定则使用树的 name
    
    Returns:
        完整的 Y3 UI JSON
    """
    # 确定面板名称
    if panel_name is None:
        panel_name = tree.get("name", "GeneratedPanel")
    
    # 确保根节点是 Panel 类型
    root_type = parse_type(tree.get("type", 2))
    if root_type != 2:
        # 包装为 Panel
        tree = {
            "name": panel_name,
            "type": 2,
            "children": [tree]
        }
    else:
        tree["name"] = panel_name
    
    # 转换
    result = convert_tree_node(
        tree,
        layer_name=panel_name,
        is_root=True
    )
    
    # 确保根节点有完整的必需字段
    root_required = {
        "adapt_mode": 2,
        "anim_data": {},
        "auto_create": True,
        "layer": 200,
        "layer_name": panel_name,
        "opacity": 1.0,
        "pos_data": {"__tuple__": True, "items": [960.0, 540.0, 50.0, 50.0, 0, 0]},
        "script_name": "",
        "size": {"__tuple__": True, "items": [1920.0, 1080.0]},
        "ui_anims": [],
        "visible": True,
        "zorder": 400,
    }
    
    # 合并字段（不覆盖已有的）
    for key, value in root_required.items():
        if key not in result:
            result[key] = value
    
    return result


# ==============================================================================
# 命令行接口
# ==============================================================================

def main():
    if len(sys.argv) < 2:
        print("Usage: python tree_to_ui_json.py <input_tree.json> [output.json]")
        print("")
        print("支持的官方组件类型:")
        print("  - skill_btn (type:17) 技能按钮")
        print("  - item_slot (type:20) 物品槽")
        print("  - buff_slot (type:19) Buff槽")
        print("  - prefab              Prefab 预制体嵌入")
        print("")
        print("Input format (tree.json):")
        print(json.dumps({
            "name": "BattleHUD",
            "type": "panel",
            "children": [
                {"name": "skill_q", "type": "skill_btn", "slot_id": 1, "shortcut": "Q"},
                {"name": "skill_w", "type": "skill_btn", "slot_id": 2, "shortcut": "W"},
                {"name": "item_1", "type": "item_slot", "slot_id": 1},
                {"name": "item_2", "type": "item_slot", "slot_id": 2},
                {"name": "bg", "type": "image"},
                {"name": "title_TEXT", "type": "text"},
                {"name": "challengeCmp_1", "type": "prefab", "prefab_name": "challengeCmp", "pos_x": 500, "pos_y": 300},
            ]
        }, indent=2, ensure_ascii=False))
        sys.exit(1)
    
    input_path = sys.argv[1]
    output_path = sys.argv[2] if len(sys.argv) > 2 else None
    
    # 读取输入
    with open(input_path, 'r', encoding='utf-8') as f:
        tree = json.load(f)
    
    # 生成
    ui_json = generate_ui_from_tree(tree)
    
    # 统计官方组件和 prefab
    def count_official_components(node, counts=None):
        if counts is None:
            counts = {"skill_btn": 0, "item_slot": 0, "buff_slot": 0, "prefab": 0, "other": 0}
        
        type_id = node.get("type", 7)
        if type_id == 17:
            counts["skill_btn"] += 1
        elif type_id == 20:
            counts["item_slot"] += 1
        elif type_id == 19:
            counts["buff_slot"] += 1
        elif node.get("prefab_key"):
            counts["prefab"] += 1
        else:
            counts["other"] += 1
        
        for child in node.get("children", []):
            count_official_components(child, counts)
        
        return counts
    
    counts = count_official_components(ui_json)
    
    # 输出
    if output_path:
        # 确保目录存在
        os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(ui_json, f, indent=2, ensure_ascii=False)
        print(f"✅ Generated: {output_path}")
        print(f"   - 技能按钮: {counts['skill_btn']} 个")
        print(f"   - 物品槽: {counts['item_slot']} 个")
        print(f"   - Buff槽: {counts['buff_slot']} 个")
        print(f"   - Prefab: {counts['prefab']} 个")
        print(f"   - 其他控件: {counts['other']} 个")
    else:
        print(json.dumps(ui_json, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()