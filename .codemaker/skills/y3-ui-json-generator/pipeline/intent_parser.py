"""
UI 生成流水线 - 意图解析模块

Step 1: 将用户自然语言需求解析为结构化意图对象
"""

import json
import re
from typing import Optional, Dict, Any, List

# 关键词到 ui_type 的映射
UI_TYPE_KEYWORDS = {
    "hud": ["hud", "战斗界面", "游戏界面", "主界面", "血条", "技能栏", "状态栏"],
    "popup": ["弹窗", "弹出", "对话框", "确认框", "提示框", "奖励", "提示"],
    "inventory": ["背包", "物品栏", "仓库", "道具", "装备栏", "格子"],
    "shop": ["商店", "商城", "购买", "出售", "交易"],
    "choice": ["选择", "三选一", "抽卡", "选项", "肉鸽", "roguelike"],
    "settings": ["设置", "选项", "配置", "音量", "画质"],
}

# 意图对象 Schema（用于校验）
INTENT_SCHEMA = {
    "required": ["ui_type", "name"],
    "ui_type_enum": ["hud", "popup", "inventory", "shop", "choice", "settings"],
    "layout_style_enum": ["fullscreen", "centered", "corner"],
    "layout_position_enum": ["top-left", "top-center", "top-right", "center", "bottom-left", "bottom-center", "bottom-right"],
    "layout_size_enum": ["small", "medium", "large", "fullscreen"],
    "component_type_enum": ["text", "button", "image", "progress", "list", "grid", "input"],
    "theme_enum": ["dark", "light", "transparent"],
}


def detect_ui_type(text: str) -> Optional[str]:
    """
    从文本中检测 UI 类型
    
    Args:
        text: 用户输入的自然语言描述
        
    Returns:
        检测到的 ui_type，如果无法确定返回 None
    """
    text_lower = text.lower()
    
    for ui_type, keywords in UI_TYPE_KEYWORDS.items():
        for keyword in keywords:
            if keyword in text_lower:
                return ui_type
    
    return None


def extract_grid_size(text: str) -> Dict[str, int]:
    """
    从文本中提取网格尺寸
    
    Args:
        text: 用户输入，如 "6x4 的背包"
        
    Returns:
        {"rows": 6, "cols": 4} 或空字典
    """
    # 匹配 NxM 或 N*M 格式
    match = re.search(r'(\d+)\s*[xX*×]\s*(\d+)', text)
    if match:
        return {
            "rows": int(match.group(1)),
            "cols": int(match.group(2))
        }
    
    # 匹配 "N 格" 格式
    match = re.search(r'(\d+)\s*格', text)
    if match:
        count = int(match.group(1))
        # 默认按 4 列排列
        cols = 4
        rows = (count + cols - 1) // cols
        return {"rows": rows, "cols": cols, "count": count}
    
    return {}


def extract_title(text: str) -> Optional[str]:
    """
    从文本中提取标题
    
    Args:
        text: 用户输入，如 "标题是'我的背包'"
        
    Returns:
        提取的标题或 None
    """
    # 匹配 "标题是/为/叫 'xxx'" 或 "标题：xxx"
    patterns = [
        r"标题[是为叫]?\s*['\"]([^'\"]+)['\"]",
        r"标题[是为叫]?\s*[:：]\s*([^\s,，。]+)",
        r"名[字称][是为叫]?\s*['\"]([^'\"]+)['\"]",
        r"名[字称][是为叫]?\s*[:：]\s*([^\s,，。]+)",
    ]
    
    for pattern in patterns:
        match = re.search(pattern, text)
        if match:
            return match.group(1)
    
    return None


def generate_name(ui_type: str, title: Optional[str] = None) -> str:
    """
    生成英文标识符
    
    Args:
        ui_type: 界面类型
        title: 界面标题（可选）
        
    Returns:
        合法的英文标识符
    """
    if title:
        # 尝试将中文标题转为拼音或简单映射
        name_map = {
            "背包": "inventory",
            "我的背包": "my_inventory",
            "商店": "shop",
            "设置": "settings",
            "确认": "confirm",
            "奖励": "reward",
        }
        if title in name_map:
            return f"{name_map[title]}_panel"
    
    # 默认使用 ui_type + _panel
    return f"{ui_type}_panel"


def validate_intent(intent: Dict[str, Any]) -> Dict[str, Any]:
    """
    校验意图对象是否符合 Schema
    
    Args:
        intent: 意图对象
        
    Returns:
        {"valid": True} 或 {"valid": False, "errors": [...]}
    """
    errors = []
    
    # 检查必填字段
    for field in INTENT_SCHEMA["required"]:
        if field not in intent:
            errors.append({
                "path": field,
                "error": "Missing required field",
                "expected": f"Field '{field}' is required"
            })
    
    # 检查 ui_type 枚举
    if "ui_type" in intent:
        if intent["ui_type"] not in INTENT_SCHEMA["ui_type_enum"]:
            errors.append({
                "path": "ui_type",
                "error": "Invalid enum value",
                "expected": INTENT_SCHEMA["ui_type_enum"],
                "actual": intent["ui_type"]
            })
    
    # 检查 name 格式
    if "name" in intent:
        if not re.match(r'^[a-z][a-z0-9_]*$', intent["name"]):
            errors.append({
                "path": "name",
                "error": "Invalid name format",
                "expected": "Lowercase letters, numbers, underscores; must start with letter",
                "actual": intent["name"]
            })
    
    # 检查 layout
    if "layout" in intent:
        layout = intent["layout"]
        if "style" in layout and layout["style"] not in INTENT_SCHEMA["layout_style_enum"]:
            errors.append({
                "path": "layout.style",
                "error": "Invalid enum value",
                "expected": INTENT_SCHEMA["layout_style_enum"],
                "actual": layout["style"]
            })
        if "position" in layout and layout["position"] not in INTENT_SCHEMA["layout_position_enum"]:
            errors.append({
                "path": "layout.position",
                "error": "Invalid enum value",
                "expected": INTENT_SCHEMA["layout_position_enum"],
                "actual": layout["position"]
            })
        if "size" in layout and layout["size"] not in INTENT_SCHEMA["layout_size_enum"]:
            errors.append({
                "path": "layout.size",
                "error": "Invalid enum value",
                "expected": INTENT_SCHEMA["layout_size_enum"],
                "actual": layout["size"]
            })
    
    # 检查 components
    if "components" in intent:
        for i, comp in enumerate(intent["components"]):
            if "type" not in comp:
                errors.append({
                    "path": f"components[{i}].type",
                    "error": "Missing required field"
                })
            elif comp["type"] not in INTENT_SCHEMA["component_type_enum"]:
                errors.append({
                    "path": f"components[{i}].type",
                    "error": "Invalid enum value",
                    "expected": INTENT_SCHEMA["component_type_enum"],
                    "actual": comp["type"]
                })
            
            if "name" not in comp:
                errors.append({
                    "path": f"components[{i}].name",
                    "error": "Missing required field"
                })
            elif not re.match(r'^[a-z][a-z0-9_]*$', comp["name"]):
                errors.append({
                    "path": f"components[{i}].name",
                    "error": "Invalid name format",
                    "actual": comp["name"]
                })
    
    # 检查 style
    if "style" in intent:
        style = intent["style"]
        if "theme" in style and style["theme"] not in INTENT_SCHEMA["theme_enum"]:
            errors.append({
                "path": "style.theme",
                "error": "Invalid enum value",
                "expected": INTENT_SCHEMA["theme_enum"],
                "actual": style["theme"]
            })
    
    if errors:
        return {"valid": False, "errors": errors}
    return {"valid": True}


def parse_user_request(text: str) -> Dict[str, Any]:
    """
    解析用户请求为意图对象（规则解析，不依赖 AI）
    
    Args:
        text: 用户的自然语言描述
        
    Returns:
        意图对象或错误信息
    """
    # 检测 UI 类型
    ui_type = detect_ui_type(text)
    if not ui_type:
        return {
            "success": False,
            "error": "无法确定界面类型",
            "suggestion": "请明确指定界面类型，如：背包、商店、弹窗、HUD 等"
        }
    
    # 提取标题
    title = extract_title(text)
    
    # 生成名称
    name = generate_name(ui_type, title)
    
    # 构建基础意图对象
    intent = {
        "ui_type": ui_type,
        "name": name,
    }
    
    if title:
        intent["title"] = title
    
    # 提取网格尺寸（用于背包等）
    grid_size = extract_grid_size(text)
    if grid_size and ui_type in ["inventory", "shop"]:
        intent["components"] = [{
            "type": "grid",
            "name": "item_grid",
            **grid_size
        }]
    
    # 默认布局
    if ui_type == "hud":
        intent["layout"] = {"style": "fullscreen", "size": "fullscreen"}
    elif ui_type == "popup":
        intent["layout"] = {"style": "centered", "position": "center", "size": "medium"}
    elif ui_type == "inventory":
        intent["layout"] = {"style": "centered", "position": "center", "size": "large"}
    else:
        intent["layout"] = {"style": "centered", "position": "center", "size": "medium"}
    
    # 默认样式
    intent["style"] = {
        "theme": "dark",
        "has_close_button": ui_type != "hud",
        "has_background": True
    }
    
    # 校验
    validation = validate_intent(intent)
    if not validation["valid"]:
        return {
            "success": False,
            "error": "意图对象校验失败",
            "validation_errors": validation["errors"]
        }
    
    return {
        "success": True,
        "intent": intent
    }


# 意图解析 Prompt（用于复杂需求时让 AI 解析）
INTENT_PARSE_PROMPT = """你是 Y3 编辑器的 UI 意图解析器，只做一件事：将用户需求转换为结构化意图对象。

规则（必须 100% 遵守）：
1. 只输出纯 JSON，不输出任何文字、解释、注释、代码块
2. 严格使用给定的 Schema 结构
3. 不允许自创字段、不允许缺少必填字段
4. name 必须是合法标识符：小写字母开头，只能包含小写字母、数字、下划线
5. 所有枚举值必须在允许列表内

Schema 结构：
{
  "ui_type": "hud | popup | inventory | shop | choice | settings",
  "name": "英文标识符",
  "title": "界面标题（可选）",
  "layout": {
    "style": "fullscreen | centered | corner",
    "position": "top-left | top-center | top-right | center | bottom-left | bottom-center | bottom-right",
    "size": "small | medium | large | fullscreen"
  },
  "components": [
    {
      "type": "text | button | image | progress | list | grid | input",
      "name": "组件标识符",
      "content": "文本内容（可选）",
      "count": 数量（可选）,
      "rows": 行数（可选）,
      "cols": 列数（可选）
    }
  ],
  "style": {
    "theme": "dark | light | transparent",
    "has_close_button": true/false,
    "has_background": true/false
  }
}

输出：只有 JSON，无任何其他内容。
"""


if __name__ == "__main__":
    # 测试
    test_cases = [
        "生成一个背包界面",
        "生成一个 6x4 的背包界面，标题是'我的背包'",
        "创建一个确认弹窗",
        "做一个商店界面",
        "生成一个界面",  # 模糊需求
    ]
    
    for text in test_cases:
        print(f"\n输入: {text}")
        result = parse_user_request(text)
        print(f"输出: {json.dumps(result, ensure_ascii=False, indent=2)}")
