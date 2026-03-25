"""
UI JSON 静态检查模块

基于引擎源码验证 UI JSON 字段格式是否正确
"""

import re
from typing import Dict, Any, List
from field_formats import (
    FieldType, 
    COMMON_FIELD_FORMATS, 
    COMPONENT_FIELD_FORMATS,
    get_field_format
)


# UUID v4 正则表达式
UUID_PATTERN = re.compile(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    re.IGNORECASE
)


def check_tuple_field(value: Any, expected_len: int, field_name: str, path: str) -> List[Dict]:
    """检查元组/数组字段格式"""
    errors = []
    
    # 检查是否为字符串（常见错误）
    if isinstance(value, str):
        errors.append({
            "path": path,
            "field": field_name,
            "error": f"字段应为{expected_len}元素数组，实际为字符串",
            "expected": f"[...] ({expected_len}元素)",
            "actual": f'"{value}"',
            "fix": f"将字符串改为数组格式"
        })
        return errors
    
    # 检查是否为列表/元组
    if not isinstance(value, (list, tuple)):
        # 检查 __tuple__ 格式
        if isinstance(value, dict) and value.get("__tuple__"):
            items = value.get("items", [])
            if len(items) != expected_len:
                errors.append({
                    "path": path,
                    "field": field_name,
                    "error": f"__tuple__.items 长度错误",
                    "expected": expected_len,
                    "actual": len(items)
                })
        else:
            errors.append({
                "path": path,
                "field": field_name,
                "error": f"字段应为{expected_len}元素数组",
                "expected": f"list/tuple ({expected_len}元素)",
                "actual": type(value).__name__
            })
        return errors
    
    # 检查长度
    if len(value) != expected_len:
        errors.append({
            "path": path,
            "field": field_name,
            "error": f"数组长度错误",
            "expected": expected_len,
            "actual": len(value)
        })
    
    return errors


def check_uuid_field(value: Any, field_name: str, path: str) -> List[Dict]:
    """检查 UUID 字段格式"""
    errors = []
    
    if not isinstance(value, str):
        errors.append({
            "path": path,
            "field": field_name,
            "error": "UUID 字段必须为字符串",
            "expected": "string (UUID v4 格式)",
            "actual": type(value).__name__
        })
        return errors
    
    if not UUID_PATTERN.match(value):
        errors.append({
            "path": path,
            "field": field_name,
            "error": "UUID 格式无效",
            "expected": "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx",
            "actual": value
        })
    
    return errors


def check_color_range(value: Any, field_name: str, path: str) -> List[Dict]:
    """检查颜色值范围 (0-255)"""
    errors = []
    
    # 处理 __tuple__ 格式
    if isinstance(value, dict) and value.get("__tuple__"):
        items = value.get("items", [])
    elif isinstance(value, (list, tuple)):
        items = value
    else:
        return errors  # 非数组类型，跳过范围检查
    
    for i, v in enumerate(items):
        if isinstance(v, (int, float)):
            if v < 0 or v > 255:
                errors.append({
                    "path": path,
                    "field": field_name,
                    "error": f"颜色值 [{i}] 超出范围",
                    "expected": "0-255",
                    "actual": v
                })
    
    return errors


def check_alignment_values(value: Any, field_name: str, path: str) -> List[Dict]:
    """检查对齐方式枚举值"""
    errors = []
    
    # 处理 __tuple__ 格式
    if isinstance(value, dict) and value.get("__tuple__"):
        items = value.get("items", [])
    elif isinstance(value, (list, tuple)):
        items = value
    else:
        return errors
    
    if len(items) < 2:
        return errors
    
    h_align, v_align = items[0], items[1]
    
    # 水平对齐: 1=左, 2=中, 4=右
    valid_h = {1, 2, 4}
    if h_align not in valid_h:
        errors.append({
            "path": path,
            "field": field_name,
            "error": f"水平对齐值 {h_align} 无效",
            "expected": "1(左), 2(中), 4(右)",
            "actual": h_align
        })
    
    # 垂直对齐: 0=顶, 8=中, 16=底
    valid_v = {0, 8, 16}
    if v_align not in valid_v:
        errors.append({
            "path": path,
            "field": field_name,
            "error": f"垂直对齐值 {v_align} 无效",
            "expected": "0(顶), 8(中), 16(底)",
            "actual": v_align
        })
    
    return errors


def check_type_value(value: Any, path: str, is_root: bool = False) -> List[Dict]:
    """
    检查组件类型值是否有效
    
    Y3 UI 组件类型 (来自 EditorUICompMeta.py UIComponentType):
    - type: 0 = Node (抽象节点，不应直接使用！)
    - type: 1 = Button
    - type: 2 = Layer (只能作为根节点！)
    - type: 3 = TextLabel
    - type: 4 = Image
    - type: 5 = Progress
    - type: 6 = Model
    - type: 7 = Layout (空容器/组，用于分组和布局)
    - type: 17 = SkillBtn (技能槽)
    - type: 19 = BuffItem (Buff槽)
    - type: 20 = EquipSlot (装备槽)
    ... 等
    """
    errors = []
    
    # 有效的 type 值 (来自 EditorUICompMeta.py UIComponentType)
    # 注意: 0 虽然在枚举中存在 (Node)，但不应该直接使用！
    VALID_TYPES = {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
        14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33,
        35, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56,
        57, 58, 59, 60, 61, 62, 63, 64, 65
    }
    # 注意: 0, 12, 13, 34, 36, 37 不应该使用！
    
    if not isinstance(value, int):
        errors.append({
            "path": path,
            "field": "type",
            "error": "type 必须为整数",
            "actual": type(value).__name__
        })
        return errors
    
    # 特殊检查: type: 0 (Node) 不应直接使用
    if value == 0:
        errors.append({
            "path": path,
            "field": "type",
            "error": "type: 0 (Node) 不应直接使用，会导致编辑器崩溃",
            "expected": "使用 type: 7 (Layout) 作为容器/组",
            "actual": value,
            "fix": "将 type: 0 改为 type: 7"
        })
        return errors
    
    if value not in VALID_TYPES:
        errors.append({
            "path": path,
            "field": "type",
            "error": f"type 值 {value} 无效",
            "expected": "有效的 UIComponentType (1-65, 不含 0,12,13,34,36,37)",
            "actual": value
        })
    
    return errors


def check_pos_data_consistency(value: Any, field_name: str, path: str, parent_size: tuple = None) -> List[Dict]:
    """
    检查 pos_data 语义一致性
    
    pos_data = [X_ABS, Y_ABS, X_PCT, Y_PCT, X_MODE, Y_MODE]
    当 MODE=1 (百分比模式) 时，ABS 应与 PCT 对应：
    - X_ABS ≈ parent_width × X_PCT / 100
    - Y_ABS ≈ parent_height × Y_PCT / 100
    """
    errors = []
    
    # 处理 __tuple__ 格式
    if isinstance(value, dict) and value.get("__tuple__"):
        items = value.get("items", [])
    elif isinstance(value, (list, tuple)):
        items = list(value)
    else:
        return errors
    
    if len(items) != 6:
        return errors  # 长度错误由其他检查处理
    
    x_abs, y_abs, x_pct, y_pct, x_mode, y_mode = items
    
    # 检查百分比值范围 (0-100)
    # 注: PCT 值可以超出 0-100 范围（用于屏幕外定位等场景），不做限制
    
    # 检查 MODE 值 (0=像素, 1=百分比)
    if x_mode not in (0, 1):
        errors.append({
            "path": path,
            "field": field_name,
            "error": f"X_MODE 值 {x_mode} 无效",
            "expected": "0(像素) 或 1(百分比)",
            "actual": x_mode
        })
    
    if y_mode not in (0, 1):
        errors.append({
            "path": path,
            "field": field_name,
            "error": f"Y_MODE 值 {y_mode} 无效",
            "expected": "0(像素) 或 1(百分比)",
            "actual": y_mode
        })
    
    return errors


def check_nested_type2(node: Dict, path: str, is_root: bool = True) -> List[Dict]:
    """
    检查嵌套 type:2 错误
    
    规则: type:2 (WorldUILayer) 只能用于根节点，子节点禁止使用
    """
    errors = []
    comp_type = node.get("type", 0)
    
    if not is_root and comp_type == 2:
        errors.append({
            "path": path,
            "field": "type",
            "error": "子节点不能使用 type:2 (WorldUILayer)",
            "expected": "使用 type:7 (Layout) 或 type:4 (Image) 作为子容器",
            "actual": "type:2"
        })
    
    # 递归检查子节点
    for i, child in enumerate(node.get("children", [])):
        errors.extend(check_nested_type2(child, f"{path}.children[{i}]", is_root=False))
    
    return errors


def check_layer_name_consistency(node: Dict, root_name: str, path: str) -> List[Dict]:
    """
    检查 layer_name 一致性
    
    规则: 所有子控件的 layer_name 必须与根 Layer 的 name 相同
    """
    errors = []
    
    layer_name = node.get("layer_name")
    if layer_name is not None and layer_name != root_name:
        errors.append({
            "path": path,
            "field": "layer_name",
            "error": f"layer_name 与根节点 name 不一致",
            "expected": root_name,
            "actual": layer_name
        })
    
    # 递归检查子节点
    for i, child in enumerate(node.get("children", [])):
        errors.extend(check_layer_name_consistency(child, root_name, f"{path}.children[{i}]"))
    
    return errors


def collect_all_uids(node: Dict, path: str, uid_map: Dict[str, str]):
    """
    递归收集所有 UID 及其路径
    
    uid_map: {uid: path}
    """
    uid = node.get("uid")
    if uid:
        if uid in uid_map:
            # 记录重复，返回已存在的路径
            return uid_map[uid]
        uid_map[uid] = path
    
    for i, child in enumerate(node.get("children", [])):
        collect_all_uids(child, f"{path}.children[{i}]", uid_map)
    
    return None


def check_uid_uniqueness(ui_json: Dict) -> List[Dict]:
    """
    检查 UID 唯一性
    
    规则: 同一 JSON 文件内所有 UID 必须唯一
    """
    errors = []
    uid_map = {}  # {uid: first_occurrence_path}
    duplicates = []  # [(uid, path1, path2), ...]
    
    def _collect(node: Dict, path: str):
        uid = node.get("uid")
        if uid:
            if uid in uid_map:
                duplicates.append((uid, uid_map[uid], path))
            else:
                uid_map[uid] = path
        
        for i, child in enumerate(node.get("children", [])):
            _collect(child, f"{path}.children[{i}]")
    
    _collect(ui_json, "root")
    
    for uid, path1, path2 in duplicates:
        errors.append({
            "path": path2,
            "field": "uid",
            "error": f"UID 重复",
            "expected": "每个控件必须有唯一 UID",
            "actual": f'"{uid}" 已在 {path1} 使用'
        })
    
    return errors


def check_node_fields(node: Dict, path: str, errors: List[Dict]):
    """检查单个节点的字段格式"""
    comp_type = node.get("type", 0)
    
    # 检查 type 值是否有效
    if "type" in node:
        errors.extend(check_type_value(node["type"], path))
    
    # 检查 uid 字段（必需且必须为 UUID 格式）
    if "uid" in node:
        errors.extend(check_uuid_field(node["uid"], "uid", f"{path}.uid"))
    else:
        errors.append({
            "path": path,
            "field": "uid",
            "error": "缺少必需字段 uid"
        })
    
    # 检查 name 字段（必需）
    if "name" not in node:
        errors.append({
            "path": path,
            "field": "name",
            "error": "缺少必需字段 name"
        })
    
    # 检查 children 字段（必需）
    if "children" not in node:
        errors.append({
            "path": path,
            "field": "children",
            "error": "缺少必需字段 children（即使为空也必须有）"
        })
    
    # 颜色字段列表（需要范围检查）
    COLOR_FIELDS = {
        "color", "font_color", "bg_color", "bar_color", "progress_color",
        "normal_color", "pressed_color", "disabled_color", "scroll_bar_color",
        "tip_text_color", "check_color", "uncheck_color", "cooldown_color",
        "border_color", "player_color", "enemy_color", "stick_color",
        "tab_color", "selected_color", "dropdown_color", "item_color",
        "selected_item_color", "indicator_color", "selected_indicator_color",
        "text_shadow_color", "text_border_color", "strike_through_color"
    }
    
    for field_name, value in node.items():
        # uid 已单独检查
        if field_name in ("uid", "type", "name", "children"):
            continue
            
        # 获取字段格式规范
        fmt = get_field_format(comp_type, field_name)
        if not fmt:
            continue
        
        field_type = fmt.get("type")
        field_path = f"{path}.{field_name}"
        
        # 根据类型检查
        if field_type == FieldType.TUPLE_2:
            errors.extend(check_tuple_field(value, 2, field_name, field_path))
            # alignment 特殊检查
            if field_name == "alignment":
                errors.extend(check_alignment_values(value, field_name, field_path))
        elif field_type == FieldType.TUPLE_4:
            errors.extend(check_tuple_field(value, 4, field_name, field_path))
            # 颜色范围检查
            if field_name in COLOR_FIELDS:
                errors.extend(check_color_range(value, field_name, field_path))
        elif field_type == FieldType.TUPLE_6:
            errors.extend(check_tuple_field(value, 6, field_name, field_path))
            # pos_data 语义检查
            if field_name == "pos_data":
                errors.extend(check_pos_data_consistency(value, field_name, field_path))
        elif field_type == FieldType.TUPLE_8:
            errors.extend(check_tuple_field(value, 8, field_name, field_path))
        elif field_type == FieldType.UUID:
            errors.extend(check_uuid_field(value, field_name, field_path))
    
    # 递归检查子节点
    for i, child in enumerate(node.get("children", [])):
        check_node_fields(child, f"{path}.children[{i}]", errors)


def static_check(ui_json: Dict) -> Dict[str, Any]:
    """
    执行静态检查
    
    包含以下检查项:
    1. 字段格式检查 (tuple长度、类型等)
    2. UUID 格式检查
    3. type 有效性检查
    4. alignment 枚举值检查
    5. 颜色值范围检查 (0-255)
    6. 必需字段检查 (uid, name, children)
    7. pos_data 语义检查 (PCT范围、MODE值)
    8. 嵌套 type:2 检查 (子节点不能用 type:2)
    9. layer_name 一致性检查
    10. UID 唯一性检查
    
    Returns:
        {"valid": True} 或 {"valid": False, "errors": [...]}
    """
    errors = []
    
    # 1-7: 节点字段检查 (递归)
    check_node_fields(ui_json, "root", errors)
    
    # 8: 嵌套 type:2 检查
    errors.extend(check_nested_type2(ui_json, "root", is_root=True))
    
    # 9: layer_name 一致性检查
    root_name = ui_json.get("name", "")
    if root_name:
        for i, child in enumerate(ui_json.get("children", [])):
            errors.extend(check_layer_name_consistency(child, root_name, f"root.children[{i}]"))
    
    # 10: UID 唯一性检查
    errors.extend(check_uid_uniqueness(ui_json))
    
    if errors:
        return {"valid": False, "errors": errors, "error_count": len(errors)}
    return {"valid": True}


def format_errors(result: Dict) -> str:
    """格式化错误输出"""
    if result.get("valid"):
        return "✅ 静态检查通过"
    
    lines = [f"❌ 静态检查失败 ({result['error_count']} 个错误):"]
    for err in result["errors"]:
        lines.append(f"  [{err['path']}] {err['field']}: {err['error']}")
        if "expected" in err:
            lines.append(f"    期望: {err['expected']}")
        if "actual" in err:
            lines.append(f"    实际: {err['actual']}")
    return "\n".join(lines)


if __name__ == "__main__":
    print("=" * 60)
    print("测试1: font/text 字段错误")
    print("=" * 60)
    bad_json_1 = {
        "type": 3,  # TextLabel
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "label_gold",
        "font": "alibaba",  # 错误! 应为 ["alibaba", 20]
        "text": "Hello",    # 错误! 应为 ["Hello", False]
        "children": []
    }
    result = static_check(bad_json_1)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试2: UUID 格式错误")
    print("=" * 60)
    bad_json_2 = {
        "type": 7,  # Layout
        "uid": "invalid-uid",  # 错误! 非法UUID
        "name": "panel_main",
        "children": []
    }
    result = static_check(bad_json_2)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试3: adapter_option 长度错误 (TUPLE_8)")
    print("=" * 60)
    bad_json_3 = {
        "type": 7,  # Layout
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "panel_main",
        "adapter_option": [True, True, True, True],  # 错误! 应为8元素
        "children": []
    }
    result = static_check(bad_json_3)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试4: pos_data 长度错误 (TUPLE_6)")
    print("=" * 60)
    bad_json_4 = {
        "type": 1,  # Button
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "btn_confirm",
        "pos_data": [100, 200, 50, 50],  # 错误! 应为6元素
        "children": []
    }
    result = static_check(bad_json_4)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试5: 正确格式 (应通过)")
    print("=" * 60)
    good_json = {
        "type": 3,  # TextLabel
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "label_title",
        "font": ["MSYH", 24],
        "text": ["Hello World", False],
        "color": [255, 255, 255, 255],
        "pos_data": [960.0, 540.0, 50.0, 50.0, 1, 1],
        "children": []
    }
    result = static_check(good_json)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试6: 无效 type 值")
    print("=" * 60)
    bad_json_6 = {
        "type": 12,  # 错误! type 12 不存在
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "invalid_comp",
        "children": []
    }
    result = static_check(bad_json_6)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试7: alignment 枚举值错误")
    print("=" * 60)
    bad_json_7 = {
        "type": 3,  # TextLabel
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "label_test",
        "alignment": [0, 4],  # 错误! 水平0无效, 垂直4无效
        "children": []
    }
    result = static_check(bad_json_7)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试8: 颜色值超出范围")
    print("=" * 60)
    bad_json_8 = {
        "type": 3,  # TextLabel
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "label_test",
        "color": [300, -10, 255, 255],  # 错误! 300>255, -10<0
        "children": []
    }
    result = static_check(bad_json_8)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试9: 缺少必需字段")
    print("=" * 60)
    bad_json_9 = {
        "type": 3,
        # 缺少 uid, name, children
    }
    result = static_check(bad_json_9)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试10: __tuple__ 格式检查")
    print("=" * 60)
    good_json_tuple = {
        "type": 3,  # TextLabel
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "label_test",
        "font": {"__tuple__": True, "items": ["MSYH", 24]},
        "color": {"__tuple__": True, "items": [255, 255, 255, 255]},
        "pos_data": {"__tuple__": True, "items": [960.0, 540.0, 50.0, 50.0, 1, 1]},
        "children": []
    }
    result = static_check(good_json_tuple)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试11: 嵌套 type:2 错误")
    print("=" * 60)
    bad_json_11 = {
        "type": 2,  # 根节点 Layer - 正确
        "uid": "11111111-1234-4123-8123-123456789abc",
        "name": "root_panel",
        "children": [
            {
                "type": 2,  # 错误! 子节点不能用 type:2
                "uid": "22222222-1234-4123-8123-123456789abc",
                "name": "nested_layer",
                "children": []
            }
        ]
    }
    result = static_check(bad_json_11)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试12: layer_name 不一致")
    print("=" * 60)
    bad_json_12 = {
        "type": 2,
        "uid": "11111111-1234-4123-8123-123456789abc",
        "name": "main_panel",
        "children": [
            {
                "type": 7,  # Layout
                "uid": "22222222-1234-4123-8123-123456789abc",
                "name": "layout_header",
                "layer_name": "wrong_panel",  # 错误! 应为 main_panel
                "children": []
            }
        ]
    }
    result = static_check(bad_json_12)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试13: UID 重复")
    print("=" * 60)
    bad_json_13 = {
        "type": 2,
        "uid": "11111111-1234-4123-8123-123456789abc",
        "name": "main_panel",
        "children": [
            {
                "type": 1,
                "uid": "22222222-1234-4123-8123-123456789abc",
                "name": "btn_1",
                "children": []
            },
            {
                "type": 1,
                "uid": "22222222-1234-4123-8123-123456789abc",  # 错误! UID 重复
                "name": "btn_2",
                "children": []
            }
        ]
    }
    result = static_check(bad_json_13)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试14: pos_data MODE无效 (PCT超范围现在允许)")
    print("=" * 60)
    bad_json_14 = {
        "type": 3,
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "label_test",
        "pos_data": [960.0, 540.0, 150.0, -10.0, 2, 3],  # PCT超范围允许, MODE无效
        "children": []
    }
    result = static_check(bad_json_14)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试14b: pos_data PCT超范围 (应通过)")
    print("=" * 60)
    good_json_14b = {
        "type": 3,
        "uid": "12345678-1234-4123-8123-123456789abc",
        "name": "label_test",
        "pos_data": [960.0, 540.0, 150.0, -10.0, 1, 1],  # PCT超范围但MODE合法
        "children": []
    }
    result = static_check(good_json_14b)
    print(format_errors(result))
    
    print("\n" + "=" * 60)
    print("测试15: 完整正确的 UI 结构")
    print("=" * 60)
    good_full_json = {
        "type": 2,
        "uid": "11111111-1234-4123-8123-123456789abc",
        "name": "test_panel",
        "children": [
            {
                "type": 7,  # Layout
                "uid": "22222222-1234-4123-8123-123456789abc",
                "name": "layout_main",
                "layer_name": "test_panel",
                "pos_data": [960.0, 540.0, 50.0, 50.0, 1, 1],
                "children": [
                    {
                        "type": 3,  # TextLabel
                        "uid": "33333333-1234-4123-8123-123456789abc",
                        "name": "label_title",
                        "layer_name": "test_panel",
                        "font": ["MSYH", 24],
                        "text": ["Hello", False],
                        "alignment": [2, 8],
                        "color": [255, 255, 255, 255],
                        "children": []
                    },
                    {
                        "type": 1,  # Button
                        "uid": "44444444-1234-4123-8123-123456789abc",
                        "name": "btn_confirm",
                        "layer_name": "test_panel",
                        "normal_text": ["确认", False],
                        "children": []
                    }
                ]
            }
        ]
    }
    result = static_check(good_full_json)
    print(format_errors(result))
