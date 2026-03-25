"""
UI 生成流水线 - 重试机制

Step 4: 校验失败时自动重试，用户无感知
"""

import json
import time
from typing import Dict, Any, Callable, Optional
from functools import wraps


class RetryConfig:
    """重试配置"""
    MAX_RETRIES = 3
    RETRY_DELAY = 0.1  # 秒


def retry_on_validation_failure(
    generate_func: Callable[[Dict[str, Any]], Dict[str, Any]],
    validate_func: Callable[[Dict[str, Any]], Dict[str, Any]],
    intent: Dict[str, Any],
    max_retries: int = RetryConfig.MAX_RETRIES,
    on_retry: Optional[Callable[[int, Dict], None]] = None
) -> Dict[str, Any]:
    """
    带重试的生成函数
    
    Args:
        generate_func: 生成函数，接收 intent 返回 {"success": True, "ui_json": {...}}
        validate_func: 校验函数，接收 ui_json 返回 {"valid": True} 或 {"valid": False, "errors": [...]}
        intent: 意图对象
        max_retries: 最大重试次数
        on_retry: 重试回调函数，接收 (retry_count, last_errors)
        
    Returns:
        {"success": True, "ui_json": {...}, "retries": N} 或
        {"success": False, "error": "...", "last_errors": [...]}
    """
    last_errors = []
    
    for attempt in range(max_retries + 1):
        # 生成 UI JSON
        gen_result = generate_func(intent)
        
        if not gen_result.get("success"):
            # 生成失败（例如没有匹配的模板）
            return {
                "success": False,
                "error": gen_result.get("error", "Generation failed"),
                "fallback_required": gen_result.get("fallback_required", False)
            }
        
        ui_json = gen_result["ui_json"]
        
        # 校验 UI JSON
        validation = validate_func(ui_json)
        
        if validation.get("valid"):
            # 校验通过
            return {
                "success": True,
                "ui_json": ui_json,
                "retries": attempt,
                "template_used": gen_result.get("template_used")
            }
        
        # 校验失败
        last_errors = validation.get("errors", [])
        
        if attempt < max_retries:
            # 还有重试机会
            if on_retry:
                on_retry(attempt + 1, last_errors)
            
            # 短暂等待后重试
            time.sleep(RetryConfig.RETRY_DELAY)
            
            # TODO: 可以在这里修改 intent，传入错误信息帮助 AI 修正
            # 但对于模板方案，模板本身应该是正确的，重试意义不大
            # 这里主要是为未来的 AI 生成模式预留
    
    # 所有重试都失败
    return {
        "success": False,
        "error": f"Validation failed after {max_retries + 1} attempts",
        "last_errors": last_errors
    }


class RetryLogger:
    """重试日志记录器"""
    
    def __init__(self):
        self.logs = []
    
    def log_retry(self, attempt: int, errors: list):
        """记录重试"""
        self.logs.append({
            "attempt": attempt,
            "errors": errors,
            "timestamp": time.time()
        })
    
    def get_summary(self) -> str:
        """获取重试摘要"""
        if not self.logs:
            return "No retries needed"
        
        lines = [f"Retry log ({len(self.logs)} retries):"]
        for log in self.logs:
            lines.append(f"  Attempt {log['attempt']}: {len(log['errors'])} errors")
        return "\n".join(lines)
    
    def clear(self):
        """清除日志"""
        self.logs = []


# 全局重试日志
retry_logger = RetryLogger()


def create_retry_callback():
    """创建重试回调函数"""
    def callback(attempt: int, errors: list):
        retry_logger.log_retry(attempt, errors)
        print(f"  [Retry {attempt}] Validation failed with {len(errors)} errors, retrying...")
    return callback


if __name__ == "__main__":
    # 测试重试机制
    import uuid
    from schema_validator import validate_ui_json
    
    # 模拟一个会失败的生成函数（第一次返回无效 UID，后续返回有效）
    call_count = [0]
    
    def mock_generate(intent):
        call_count[0] += 1
        if call_count[0] == 1:
            # 第一次返回无效的 UI JSON
            return {
                "success": True,
                "ui_json": {
                    "type": 2,
                    "uid": "invalid-uid",  # 无效的 UID
                    "name": "test",
                    "layer_name": "Test",
                    "pos_data": [0, 0, 0, 0, 0, 0],
                    "size": [100, 100],
                    "anchor": [0, 0],
                    "children": []
                }
            }
        else:
            # 后续返回有效的 UI JSON
            return {
                "success": True,
                "ui_json": {
                    "type": 2,
                    "uid": str(uuid.uuid4()),
                    "name": "test",
                    "layer_name": "Test",
                    "pos_data": [0, 0, 0, 0, 0, 0],
                    "size": [100, 100],
                    "anchor": [0, 0],
                    "children": []
                }
            }
    
    print("Test: Retry mechanism")
    retry_logger.clear()
    
    result = retry_on_validation_failure(
        generate_func=mock_generate,
        validate_func=validate_ui_json,
        intent={"ui_type": "popup", "name": "test"},
        on_retry=create_retry_callback()
    )
    
    print(f"Result: success={result['success']}, retries={result.get('retries', 'N/A')}")
    print(retry_logger.get_summary())
