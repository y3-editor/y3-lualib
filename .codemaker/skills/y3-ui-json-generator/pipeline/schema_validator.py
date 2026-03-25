"""
UI 生成流水线 - Schema 校验模块

Step 3: 校验生成的 UI JSON 是否符合 Y3 规范
包含两层检查:
  1. Schema 校验: 结构完整性、UID格式、类型枚举等
  2. 静态检查: 字段类型精确性 (font/text/pos_data 等)
"""

import json
import re
import uuid
from typing import Dict, Any, List, Set

from static_check import static_check, format_errors as format_static_errors

# Y3 UI 组件类型枚举 (来源: EditorUICompMeta.py -> UIComponentType)
# 参考路径: F:\work\map\src\Server\server\engine\dm\clients\ui\uiEditor\EditorUICompMeta.py
class UIComponentType:
    Node = 0
    Button = 1
    Layer = 2              # Panel/根节点
    TextLabel = 3
    Image = 4
    Progress = 5
    Model = 6
    Layout = 7
    TabWidget = 8
    TabPage = 9
    ScrollView = 10
    Slider = 11
    # 12, 13 未定义
    Background = 14
    InputField = 15
    MiniMap = 16
    SkillBtn = 17
    BuffList = 18
    BuffItem = 19
    EquipSlot = 20
    ShopPanel = 21
    GoodsItem = 22
    ComposePanel = 23
    ChatBox = 24
    GridView = 25
    RichText = 26
    SettingPanel = 27
    AnimationEffect = 28
    ComboBox = 29
    ComboBoxItem = 30
    SequenceAnimation = 31
    NewChatBox = 32
    PageView = 33
    AudioSwitch = 34
    Spine = 35
    # 36, 37 未定义
    NewSequenceAnimation = 38
    BaseBarProgress = 39
    BaseRadialProgress = 40
    BarProgress = 41
    RadialProgress = 42
    NewSlider = 43
    CutImage = 44
    NewPageView = 45
    CheckBox = 46
    NewTabWidget = 47
    Live2DNode = 48
    Effect = 49
    Joystick = 50
    Video = 51
    Audio = 52
    SkillJoyStick = 53
    UIFog = 54
    UIBlur = 55
    FriendList = 56
    NewSettingPanel = 57
    WorldChatBox = 58
    Report = 59
    ChatBoxRichText = 60
    CameraOperationArea = 61
    UICamera = 62
    Tips = 63
    ClippingNode = 64
    UICanvas = 65


# 所有有效的组件类型值集合
VALID_UI_TYPES = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
    14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
    38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65
}


# Y3 UI JSON Schema 定义
UI_JSON_SCHEMA = {
    # 根节点必填字段
    "root_required": ["type", "uid", "name", "layer_name", "pos_data", "size", "anchor", "children"],
    # 子节点必填字段
    "node_required": ["type", "uid", "name", "layer_name", "pos_data", "size", "anchor"],
    # type 枚举值 - 使用从引擎源码提取的有效类型集合
    "type_enum": VALID_UI_TYPES,
    # alignment 水平枚举 (1=左, 2=中, 4=右)
    "alignment_h_enum": [1, 2, 4],
    # alignment 垂直枚举 (0=默认, 8=中, 16=下)
    "alignment_v_enum": [0, 8, 16],
}

# UUID4 正则表达式
UUID4_PATTERN = re.compile(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    re.IGNORECASE
)


def is_valid_uuid4(uid: str) -> bool:
    """
    检查字符串是否是有效的 UUID4 格式
    
    Args:
        uid: 要检查的字符串
        
    Returns:
        是否是有效的 UUID4
    """
    if not isinstance(uid, str):
        return False
    return bool(UUID4_PATTERN.match(uid))


def collect_uids(node: Dict[str, Any], uids: Set[str] = None) -> Set[str]:
    """
    递归收集所有节点的 UID
    
    Args:
        node: UI 节点
        uids: 已收集的 UID 集合
        
    Returns:
        所有 UID 的集合
    """
    if uids is None:
        uids = set()
    
    if "uid" in node:
        uids.add(node["uid"])
    
    for child in node.get("children", []):
        collect_uids(child, uids)
    
    return uids


def validate_node(node: Dict[str, Any], path: str, errors: List[Dict], seen_uids: Set[str], is_root: bool = False):
    """
    递归验证单个节点
    
    Args:
        node: UI 节点
        path: 节点路径（用于错误报告）
        errors: 错误列表
        seen_uids: 已见过的 UID（用于检测重复）
        is_root: 是否是根节点
    """
    required_fields = UI_JSON_SCHEMA["root_required"] if is_root else UI_JSON_SCHEMA["node_required"]
    
    # 检查必填字段
    for field in required_fields:
        if field not in node:
            # children 对于非容器节点可以省略
            if field == "children" and not is_root:
                continue
            errors.append({
                "path": f"{path}.{field}",
                "error": "Missing required field",
                "expected": f"Field '{field}' is required"
            })
    
    # 检查 type 枚举
    if "type" in node:
        if node["type"] not in UI_JSON_SCHEMA["type_enum"]:
            errors.append({
                "path": f"{path}.type",
                "error": "Invalid type value",
                "expected": UI_JSON_SCHEMA["type_enum"],
                "actual": node["type"]
            })
    
    # 检查 UID 格式
    if "uid" in node:
        uid = node["uid"]
        if not is_valid_uuid4(uid):
            errors.append({
                "path": f"{path}.uid",
                "error": "Invalid UID format",
                "expected": "UUID4 format (xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx)",
                "actual": uid
            })
        
        # 检查 UID 唯一性
        if uid in seen_uids:
            errors.append({
                "path": f"{path}.uid",
                "error": "Duplicate UID",
                "actual": uid
            })
        seen_uids.add(uid)
    
    # 检查 pos_data 格式（应该是 6 元素数组）
    if "pos_data" in node:
        pos_data = node["pos_data"]
        if not isinstance(pos_data, list) or len(pos_data) != 6:
            errors.append({
                "path": f"{path}.pos_data",
                "error": "Invalid pos_data format",
                "expected": "Array of 6 numbers [x, y, rel_x, rel_y, anchor_h, anchor_v]",
                "actual": pos_data
            })
    
    # 检查 size 格式（应该是 2 元素数组）
    if "size" in node:
        size = node["size"]
        if not isinstance(size, list) or len(size) != 2:
            errors.append({
                "path": f"{path}.size",
                "error": "Invalid size format",
                "expected": "Array of 2 numbers [width, height]",
                "actual": size
            })
    
    # 检查 anchor 格式（应该是 2 元素数组）
    if "anchor" in node:
        anchor = node["anchor"]
        if not isinstance(anchor, list) or len(anchor) != 2:
            errors.append({
                "path": f"{path}.anchor",
                "error": "Invalid anchor format",
                "expected": "Array of 2 numbers [x, y]",
                "actual": anchor
            })
    
    # 检查 alignment 枚举（如果存在）
    if "alignment" in node:
        alignment = node["alignment"]
        if isinstance(alignment, list) and len(alignment) == 2:
            h_align, v_align = alignment
            if h_align not in UI_JSON_SCHEMA["alignment_h_enum"]:
                errors.append({
                    "path": f"{path}.alignment[0]",
                    "error": "Invalid horizontal alignment",
                    "expected": UI_JSON_SCHEMA["alignment_h_enum"],
                    "actual": h_align
                })
            if v_align not in UI_JSON_SCHEMA["alignment_v_enum"]:
                errors.append({
                    "path": f"{path}.alignment[1]",
                    "error": "Invalid vertical alignment",
                    "expected": UI_JSON_SCHEMA["alignment_v_enum"],
                    "actual": v_align
                })
    
    # 检查 color 格式（如果存在，应该是 4 元素 RGBA 数组）
    if "color" in node:
        color = node["color"]
        if not isinstance(color, list) or len(color) != 4:
            errors.append({
                "path": f"{path}.color",
                "error": "Invalid color format",
                "expected": "Array of 4 numbers [R, G, B, A]",
                "actual": color
            })
        elif not all(isinstance(c, (int, float)) and 0 <= c <= 255 for c in color):
            errors.append({
                "path": f"{path}.color",
                "error": "Invalid color values",
                "expected": "Each value should be 0-255",
                "actual": color
            })
    
    # 递归检查子节点
    for i, child in enumerate(node.get("children", [])):
        validate_node(child, f"{path}.children[{i}]", errors, seen_uids, is_root=False)


def validate_ui_json(ui_json: Dict[str, Any]) -> Dict[str, Any]:
    """
    验证 UI JSON 是否符合 Y3 规范
    
    Args:
        ui_json: UI JSON 对象
        
    Returns:
        {"valid": True} 或 {"valid": False, "errors": [...]}
    """
    errors = []
    seen_uids = set()
    
    # 从根节点开始验证
    validate_node(ui_json, "root", errors, seen_uids, is_root=True)
    
    if errors:
        return {
            "valid": False,
            "errors": errors,
            "error_count": len(errors)
        }
    
    return {"valid": True}


def format_validation_errors(result: Dict[str, Any]) -> str:
    """
    格式化验证错误为可读字符串
    
    Args:
        result: validate_ui_json 的返回值
        
    Returns:
        格式化的错误字符串
    """
    if result.get("valid"):
        return "✅ Validation passed"
    
    lines = [f"❌ Validation failed with {result['error_count']} error(s):"]
    for error in result["errors"]:
        path = error.get("path", "unknown")
        msg = error.get("error", "Unknown error")
        expected = error.get("expected", "")
        actual = error.get("actual", "")
        
        line = f"  - [{path}] {msg}"
        if expected:
            line += f" (expected: {expected})"
        if actual:
            line += f" (got: {actual})"
        lines.append(line)
    
    return "\n".join(lines)


def full_validate(ui_json: Dict[str, Any]) -> Dict[str, Any]:
    """
    执行完整验证: Schema 校验 + 静态检查
    
    流程:
      1. Schema 校验 (结构、UID、类型枚举)
      2. 静态检查 (字段类型精确性: font/text/pos_data)
    
    Args:
        ui_json: UI JSON 对象
        
    Returns:
        {"valid": True} 或 {"valid": False, "schema_errors": [...], "static_errors": [...]}
    """
    result = {"valid": True}
    
    # Phase 1: Schema 校验
    schema_result = validate_ui_json(ui_json)
    if not schema_result.get("valid"):
        result["valid"] = False
        result["schema_errors"] = schema_result.get("errors", [])
    
    # Phase 2: 静态检查 (即使 schema 失败也继续检查)
    static_result = static_check(ui_json)
    if not static_result.get("valid"):
        result["valid"] = False
        result["static_errors"] = static_result.get("errors", [])
    
    return result


def format_full_validation(result: Dict[str, Any]) -> str:
    """
    格式化完整验证结果
    """
    if result.get("valid"):
        return "✅ 完整验证通过 (Schema + 静态检查)"
    
    lines = ["❌ 验证失败:"]
    
    # Schema 错误
    if "schema_errors" in result:
        lines.append(f"\n📋 Schema 错误 ({len(result['schema_errors'])} 个):")
        for err in result["schema_errors"]:
            lines.append(f"  - [{err.get('path')}] {err.get('error')}")
    
    # 静态检查错误
    if "static_errors" in result:
        lines.append(f"\n🔍 静态检查错误 ({len(result['static_errors'])} 个):")
        for err in result["static_errors"]:
            lines.append(f"  - [{err.get('path')}] {err.get('field')}: {err.get('error')}")
            if "expected" in err:
                lines.append(f"    期望: {err['expected']}, 实际: {err.get('actual', 'N/A')}")
    
    return "\n".join(lines)


if __name__ == "__main__":
    # 测试用例
    
    # 1. 有效的 UI JSON
    valid_ui = {
        "type": 2,
        "uid": str(uuid.uuid4()),
        "name": "test_panel",
        "layer_name": "TestLayer",
        "pos_data": [960.0, 540.0, 50.0, 50.0, 0, 0],
        "size": [1920.0, 1080.0],
        "anchor": [0.5, 0.5],
        "children": [
            {
                "type": 4,
                "uid": str(uuid.uuid4()),
                "name": "bg",
                "layer_name": "TestLayer",
                "pos_data": [0, 0, 0, 0, 0, 0],
                "size": [100, 100],
                "anchor": [0, 0],
                "color": [255, 255, 255, 255]
            }
        ]
    }
    
    print("Test 1: Valid UI JSON")
    result = validate_ui_json(valid_ui)
    print(format_validation_errors(result))
    print()
    
    # 2. 缺少必填字段
    invalid_ui_missing = {
        "type": 2,
        "name": "test_panel",
        # 缺少 uid, layer_name, pos_data, size, anchor, children
    }
    
    print("Test 2: Missing required fields")
    result = validate_ui_json(invalid_ui_missing)
    print(format_validation_errors(result))
    print()
    
    # 3. 无效的 UID 格式
    invalid_ui_uid = {
        "type": 2,
        "uid": "invalid-uid-format",
        "name": "test_panel",
        "layer_name": "TestLayer",
        "pos_data": [0, 0, 0, 0, 0, 0],
        "size": [100, 100],
        "anchor": [0, 0],
        "children": []
    }
    
    print("Test 3: Invalid UID format")
    result = validate_ui_json(invalid_ui_uid)
    print(format_validation_errors(result))
    print()
    
    # 4. 重复的 UID
    dup_uid = str(uuid.uuid4())
    invalid_ui_dup = {
        "type": 2,
        "uid": dup_uid,
        "name": "test_panel",
        "layer_name": "TestLayer",
        "pos_data": [0, 0, 0, 0, 0, 0],
        "size": [100, 100],
        "anchor": [0, 0],
        "children": [
            {
                "type": 4,
                "uid": dup_uid,  # 重复的 UID
                "name": "child",
                "layer_name": "TestLayer",
                "pos_data": [0, 0, 0, 0, 0, 0],
                "size": [50, 50],
                "anchor": [0, 0]
            }
        ]
    }
    
    print("Test 4: Duplicate UID")
    result = validate_ui_json(invalid_ui_dup)
    print(format_validation_errors(result))
    print()
    
    # 5. 无效的 alignment
    invalid_ui_align = {
        "type": 2,
        "uid": str(uuid.uuid4()),
        "name": "test_panel",
        "layer_name": "TestLayer",
        "pos_data": [0, 0, 0, 0, 0, 0],
        "size": [100, 100],
        "anchor": [0, 0],
        "alignment": [0, 8],  # 水平 0 无效
        "children": []
    }
    
    print("Test 5: Invalid alignment")
    result = validate_ui_json(invalid_ui_align)
    print(format_validation_errors(result))
