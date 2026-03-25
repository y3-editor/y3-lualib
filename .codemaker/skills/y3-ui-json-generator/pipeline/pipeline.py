"""
UI 生成流水线 - 主流程

整合所有模块，提供完整的 UI 生成能力
"""

import argparse
import json
import os
import sys
from typing import Dict, Any, Optional

from intent_parser import parse_user_request, validate_intent
from template_matcher import generate_from_template, save_ui_json
from schema_validator import validate_ui_json, format_validation_errors
from retry_mechanism import retry_on_validation_failure, create_retry_callback, retry_logger
from static_check import static_check, format_errors as format_static_errors


class UIPipeline:
    """UI 生成流水线"""
    
    def __init__(self, output_dir: str = "maps/EntryMap/ui"):
        """
        初始化流水线
        
        Args:
            output_dir: UI JSON 输出目录
        """
        self.output_dir = output_dir
    
    def generate(self, user_input: str, output_name: Optional[str] = None) -> Dict[str, Any]:
        """
        完整的 UI 生成流程
        
        Args:
            user_input: 用户的自然语言描述
            output_name: 输出文件名（不含扩展名），如果不指定则自动生成
            
        Returns:
            {
                "success": True/False,
                "message": "...",
                "output_path": "...",  # 成功时返回
                "ui_name": "...",       # 成功时返回
                "intent": {...},        # 解析的意图
                "template_used": "...", # 使用的模板
                "retries": N,           # 重试次数
                "errors": [...]         # 失败时返回错误列表
            }
        """
        result = {
            "success": False,
            "message": "",
            "steps": []
        }
        
        # ========== Step 1: 意图解析 ==========
        result["steps"].append("1. Intent Parsing")
        
        parse_result = parse_user_request(user_input)
        if not parse_result.get("success"):
            result["message"] = parse_result.get("error", "Intent parsing failed")
            result["suggestion"] = parse_result.get("suggestion")
            return result
        
        intent = parse_result["intent"]
        result["intent"] = intent
        
        # ========== Step 2: 模板生成 + Schema 校验 + 静态检查 + 重试 ==========
        result["steps"].append("2. Template Generation + Validation")
        
        retry_logger.clear()
        
        # 如果指定了输出名称，传递给生成函数
        def generate_with_name(i):
            return generate_from_template(i, output_name)
        
        # 组合校验函数：Schema 校验 + 静态检查
        def combined_validate(ui_json):
            # 先执行 Schema 校验
            schema_result = validate_ui_json(ui_json)
            if not schema_result.get("valid"):
                return schema_result
            
            # 再执行静态检查
            static_result = static_check(ui_json)
            if not static_result.get("valid"):
                # 转换错误格式以兼容重试机制
                return {
                    "valid": False,
                    "errors": [
                        {"path": e.get("path", ""), "error": e.get("error", "")}
                        for e in static_result.get("errors", [])
                    ]
                }
            
            return {"valid": True}
        
        gen_result = retry_on_validation_failure(
            generate_func=generate_with_name,
            validate_func=combined_validate,
            intent=intent,
            on_retry=create_retry_callback(),
            max_retries=3
        )
        
        if not gen_result.get("success"):
            if gen_result.get("fallback_required"):
                # 没有匹配的模板，需要 fallback 到纯 AI 生成
                result["message"] = f"No template for ui_type '{intent.get('ui_type')}'. Fallback to AI generation required."
                result["fallback_required"] = True
            else:
                # 校验失败（可能是 Schema 或静态检查）
                result["message"] = gen_result.get("error", "Validation failed after retries")
                result["errors"] = gen_result.get("last_errors", [])
                result["validation_failed"] = True
            return result
        
        ui_json = gen_result["ui_json"]
        result["template_used"] = gen_result.get("template_used")
        result["retries"] = gen_result.get("retries", 0)
        
        # 记录静态检查通过
        result["steps"].append("3. Static Check Passed")
        
        # ========== Step 4: 保存文件 ==========
        result["steps"].append("4. Save to File")
        
        # 确定输出文件名
        if output_name:
            filename = f"{output_name}.json"
        else:
            # 使用 UI 名称作为文件名
            ui_name = ui_json.get("name", "generated_ui")
            filename = f"{ui_name}.json"
        
        output_path = os.path.join(self.output_dir, filename)
        
        save_result = save_ui_json(ui_json, output_path)
        if not save_result.get("success"):
            result["message"] = f"Failed to save: {save_result.get('error')}"
            return result
        
        # ========== 成功 ==========
        result["success"] = True
        result["message"] = "UI generated successfully"
        result["output_path"] = output_path
        result["ui_name"] = ui_json.get("name")
        
        return result
    
    def generate_and_report(self, user_input: str, output_name: Optional[str] = None) -> str:
        """
        生成 UI 并返回可读的报告
        
        Args:
            user_input: 用户的自然语言描述
            output_name: 输出文件名（可选）
            
        Returns:
            格式化的报告字符串
        """
        result = self.generate(user_input, output_name)
        
        lines = []
        lines.append("=" * 60)
        lines.append("UI Generation Report")
        lines.append("=" * 60)
        lines.append(f"Input: {user_input}")
        lines.append("")
        
        # 步骤
        lines.append("Steps:")
        for step in result.get("steps", []):
            lines.append(f"  [OK] {step}")
        lines.append("")
        
        # 意图
        if "intent" in result:
            intent = result["intent"]
            lines.append("Intent:")
            lines.append(f"  - ui_type: {intent.get('ui_type')}")
            lines.append(f"  - name: {intent.get('name')}")
            if "title" in intent:
                lines.append(f"  - title: {intent.get('title')}")
            lines.append("")
        
        # 结果
        if result["success"]:
            lines.append("Result: [SUCCESS]")
            lines.append(f"  - Output: {result.get('output_path')}")
            lines.append(f"  - UI Name: {result.get('ui_name')}")
            lines.append(f"  - Template: {result.get('template_used')}")
            lines.append(f"  - Retries: {result.get('retries', 0)}")
        else:
            lines.append("Result: [FAILED]")
            lines.append(f"  - Error: {result.get('message')}")
            if result.get("suggestion"):
                lines.append(f"  - Suggestion: {result.get('suggestion')}")
            if result.get("fallback_required"):
                lines.append("  - Note: This ui_type requires AI generation (no template)")
            if result.get("errors"):
                if result.get("static_check_failed"):
                    lines.append("  - Static Check Errors:")
                    for error in result["errors"][:5]:  # 最多显示 5 个错误
                        # 静态检查错误格式: {path, field, error, expected, actual}
                        msg = error.get('error', '') or error.get('message', '')
                        if not msg and 'field' in error:
                            msg = f"{error.get('field')}: format error"
                        lines.append(f"      [{error.get('path')}] {msg}")
                else:
                    lines.append("  - Validation Errors:")
                    for error in result["errors"][:5]:  # 最多显示 5 个错误
                        lines.append(f"      [{error.get('path')}] {error.get('error')}")
        
        lines.append("")
        lines.append("=" * 60)
        
        return "\n".join(lines)


# 便捷函数
def generate_ui(user_input: str, output_name: Optional[str] = None, output_dir: str = "maps/EntryMap/ui") -> Dict[str, Any]:
    """
    生成 UI 的便捷函数
    
    Args:
        user_input: 用户的自然语言描述
        output_name: 输出文件名（可选）
        output_dir: 输出目录
        
    Returns:
        生成结果
    """
    pipeline = UIPipeline(output_dir=output_dir)
    return pipeline.generate(user_input, output_name)


def safe_print(text: str = ""):
    """在 Windows/GBK 终端下安全输出，避免 UnicodeEncodeError。"""
    try:
        print(text)
    except UnicodeEncodeError:
        encoding = sys.stdout.encoding or "utf-8"
        sys.stdout.buffer.write((str(text) + "\n").encode(encoding, errors="replace"))


def run_builtin_tests(output_dir: str = "maps/EntryMap/ui"):
    """运行内置端到端测试。"""
    pipeline = UIPipeline(output_dir=output_dir)
    test_cases = [
        ("生成一个确认弹窗，标题是'确认退出'", "test_confirm_popup"),
        ("创建一个背包界面，标题是'我的背包'", "test_inventory"),
        ("做一个 HUD 界面", None),
        ("生成一个界面", None),
    ]
    for user_input, output_name in test_cases:
        safe_print(pipeline.generate_and_report(user_input, output_name))
        safe_print("")


def main() -> int:
    parser = argparse.ArgumentParser(description="Y3 UI 生成流水线")
    parser.add_argument("-i", "--input", dest="user_input", help="自然语言需求，例如：创建一个肉鸽三选一面板")
    parser.add_argument("-o", "--output-name", dest="output_name", help="输出文件名（不含 .json）")
    parser.add_argument("-d", "--output-dir", dest="output_dir", default="maps/EntryMap/ui", help="输出目录")
    parser.add_argument("--json", dest="as_json", action="store_true", help="输出原始 JSON 结果")
    parser.add_argument("--test", action="store_true", help="运行内置测试用例")

    args = parser.parse_args()

    if args.test:
        run_builtin_tests(output_dir=args.output_dir)
        return 0

    if not args.user_input:
        parser.print_help()
        return 2

    pipeline = UIPipeline(output_dir=args.output_dir)

    if args.as_json:
        result = pipeline.generate(args.user_input, args.output_name)
        safe_print(json.dumps(result, ensure_ascii=False))
    else:
        safe_print(pipeline.generate_and_report(args.user_input, args.output_name))

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
