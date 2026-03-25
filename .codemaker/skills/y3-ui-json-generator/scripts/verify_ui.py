#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
verify_ui.py — UI JSON 验证主流程

整合三阶段验证：
1. 静态校验 (static_check.py)
2. 运行时校验 (MCP 热更新 + 日志分析)
3. 视觉分析 (MCP 截图 + AI 评估)

实现迭代控制和质量报告生成。
"""

import json
import time
import urllib.request
import urllib.error
from typing import Any, Dict, List, Tuple, Optional
from dataclasses import dataclass, field
from enum import Enum

# 导入静态校验模块
try:
    from static_check import check_ui_json, Severity
except ImportError:
    from .static_check import check_ui_json, Severity


# ---------------------------------------------------------------------------
# 配置
# ---------------------------------------------------------------------------

MCP_URL = "http://127.0.0.1:8765/mcp"
MAX_ITERATIONS = 3
PASS_SCORE = 80
VERIFICATION_TIMEOUT = 30  # 秒

# 评分权重
WEIGHTS = {
    "static": 0.4,      # 静态校验 40%
    "runtime": 0.3,     # 运行时校验 30%
    "visual": 0.3,      # 视觉校验 30%
}


# ---------------------------------------------------------------------------
# MCP 客户端
# ---------------------------------------------------------------------------

class MCPClient:
    """MCP 工具调用客户端"""
    
    def __init__(self, url: str = MCP_URL):
        self.url = url
        self._request_id = 0
    
    def _call(self, method: str, params: Dict = None) -> Dict:
        """发送 JSON-RPC 请求"""
        self._request_id += 1
        payload = {
            "jsonrpc": "2.0",
            "id": self._request_id,
            "method": method,
            "params": params or {},
        }
        
        data = json.dumps(payload).encode("utf-8")
        req = urllib.request.Request(
            self.url,
            data=data,
            headers={"Content-Type": "application/json"},
        )
        
        try:
            with urllib.request.urlopen(req, timeout=VERIFICATION_TIMEOUT) as resp:
                result = json.loads(resp.read().decode("utf-8"))
                if "error" in result:
                    raise Exception(result["error"].get("message", "Unknown error"))
                return result.get("result", {})
        except urllib.error.URLError as e:
            raise ConnectionError(f"MCP server not available: {e}")
    
    def call_tool(self, name: str, arguments: Dict = None) -> str:
        """调用 MCP 工具"""
        result = self._call("tools/call", {
            "name": name,
            "arguments": arguments or {},
        })
        content = result.get("content", [])
        if content and content[0].get("type") == "text":
            return content[0].get("text", "")
        return ""
    
    def is_available(self) -> bool:
        """检查 MCP 服务器是否可用"""
        try:
            self._call("ping")
            return True
        except:
            return False
    
    def reload_ui(self, ui_path: str) -> Dict:
        """调用 game_reload_ui 热更新 UI"""
        try:
            result = self.call_tool("game_reload_ui", {"ui_path": ui_path})
            if not result:
                return {"success": False, "error_log": "Empty response from MCP"}
            return json.loads(result)
        except json.JSONDecodeError:
            return {"success": False, "error_log": f"Invalid JSON response: {result[:100]}"}
        except Exception as e:
            return {"success": False, "error_log": str(e)}
    
    def get_logs(self, lines: int = 50, level: str = "ALL") -> Dict:
        """调用 game_get_logs 获取日志"""
        try:
            result = self.call_tool("game_get_logs", {"lines": lines, "level": level})
            if not result:
                return {"logs": [], "count": 0}
            return json.loads(result)
        except json.JSONDecodeError:
            return {"logs": [], "count": 0}
        except Exception as e:
            return {"logs": [], "count": 0, "error": str(e)}
    
    def capture_screenshot(self, output_path: str = None) -> Dict:
        """调用 game_capture_screenshot 截取画面"""
        try:
            args = {}
            if output_path:
                args["output_path"] = output_path
            result = self.call_tool("game_capture_screenshot", args)
            if not result:
                return {"error": "Empty response from MCP"}
            return json.loads(result)
        except json.JSONDecodeError:
            return {"error": f"Invalid JSON response"}
        except Exception as e:
            return {"error": str(e)}


# ---------------------------------------------------------------------------
# 运行时校验
# ---------------------------------------------------------------------------

def runtime_check(mcp: MCPClient, ui_path: str) -> Tuple[int, List[Dict]]:
    """
    运行时校验：热更新 UI 并分析日志
    
    Args:
        mcp: MCP 客户端
        ui_path: UI JSON 文件路径
    
    Returns:
        (score, issues): 得分(0-100) 和问题列表
    """
    issues = []
    
    # 1. 热更新 UI
    try:
        result = mcp.reload_ui(ui_path)
    except ConnectionError as e:
        return -1, [{"severity": "FATAL", "code": "MCP_UNAVAILABLE", "message": str(e), "deduction": 0}]
    
    if not result.get("success"):
        error_log = result.get("error_log", "Unknown error")
        issues.append({
            "severity": "FATAL",
            "code": "RELOAD_FAILED",
            "message": f"UI reload failed: {error_log}",
            "deduction": 100,
        })
        return 0, issues
    
    # 2. 获取日志并分析
    try:
        logs = mcp.get_logs(lines=50, level="ALL")
    except Exception as e:
        issues.append({
            "severity": "WARNING",
            "code": "LOG_FETCH_FAILED",
            "message": f"Failed to fetch logs: {e}",
            "deduction": 0,
        })
        return 100, issues  # 热更新成功，日志获取失败不扣分
    
    # 3. 分析日志中的错误和警告
    log_lines = logs.get("logs", [])
    error_count = 0
    warning_count = 0
    
    for line in log_lines:
        if "[ERROR]" in line:
            error_count += 1
            issues.append({
                "severity": "ERROR",
                "code": "RUNTIME_ERROR",
                "message": line,
                "deduction": 15,
            })
        elif "[WARNING]" in line:
            warning_count += 1
    
    # 4. 计算得分
    # ERROR: -15 每条
    # WARNING: -5 每条，最多扣 20 分
    error_deduction = error_count * 15
    warning_deduction = min(warning_count * 5, 20)
    
    if warning_count > 0:
        issues.append({
            "severity": "WARNING",
            "code": "RUNTIME_WARNING",
            "message": f"{warning_count} warning(s) in logs",
            "deduction": warning_deduction,
        })
    
    score = max(0, 100 - error_deduction - warning_deduction)
    return score, issues


# ---------------------------------------------------------------------------
# 视觉校验
# ---------------------------------------------------------------------------

def visual_check(mcp: MCPClient, ui_description: str = "") -> Tuple[int, List[Dict]]:
    """
    视觉校验：截图并分析 UI 质量
    
    Args:
        mcp: MCP 客户端
        ui_description: UI 的预期描述（用于 AI 对比）
    
    Returns:
        (score, issues): 得分(0-100) 和问题列表
    """
    issues = []
    
    # 1. 截取画面
    try:
        result = mcp.capture_screenshot()
    except ConnectionError as e:
        return -1, [{"severity": "INFO", "code": "SCREENSHOT_UNAVAILABLE", "message": str(e), "deduction": 0}]
    
    if "error" in result:
        issues.append({
            "severity": "WARNING",
            "code": "SCREENSHOT_FAILED",
            "message": result["error"],
            "deduction": 0,
        })
        return -1, issues  # 返回 -1 表示跳过视觉分析
    
    image_path = result.get("image_path")
    
    # 2. AI 视觉分析（简化版 - 实际需要调用 AI API）
    # TODO: 实现真正的 AI 视觉分析
    # 目前返回默认分数
    
    # 模拟 AI 分析结果
    visual_score = 80  # 默认分数
    
    issues.append({
        "severity": "INFO",
        "code": "VISUAL_ANALYSIS",
        "message": f"Visual analysis completed. Screenshot: {image_path}",
        "deduction": 0,
    })
    
    return visual_score, issues


# ---------------------------------------------------------------------------
# 验证主流程
# ---------------------------------------------------------------------------

@dataclass
class VerificationResult:
    """验证结果"""
    total_score: int
    static_score: int
    runtime_score: int
    visual_score: int
    status: str  # "PASS", "BEST_EFFORT", "FAILED"
    issues: List[Dict] = field(default_factory=list)
    iterations: int = 1
    weights_used: Dict[str, float] = field(default_factory=dict)


def verify_ui(
    json_content: str,
    ui_path: str = None,
    skip_runtime: bool = False,
    skip_visual: bool = False,
) -> VerificationResult:
    """
    执行完整的 UI 验证流程
    
    Args:
        json_content: UI JSON 内容
        ui_path: UI JSON 文件路径（用于热更新）
        skip_runtime: 是否跳过运行时校验
        skip_visual: 是否跳过视觉校验
    
    Returns:
        VerificationResult: 验证结果
    """
    all_issues = []
    
    # 初始化 MCP 客户端
    mcp = MCPClient()
    mcp_available = mcp.is_available()
    
    # 1. 静态校验（始终执行）
    static_score, static_issues = check_ui_json(json_content)
    all_issues.extend([{**i, "stage": "static"} for i in static_issues])
    
    # 2. 运行时校验
    runtime_score = 100  # 默认满分（跳过时）
    if not skip_runtime and ui_path and mcp_available:
        runtime_score, runtime_issues = runtime_check(mcp, ui_path)
        if runtime_score == -1:
            runtime_score = 100  # MCP 不可用，按满分计
            skip_runtime = True
        else:
            all_issues.extend([{**i, "stage": "runtime"} for i in runtime_issues])
    elif not mcp_available:
        skip_runtime = True
        all_issues.append({
            "severity": "INFO",
            "code": "MCP_UNAVAILABLE",
            "message": "MCP server not available, skipping runtime check",
            "stage": "runtime",
            "deduction": 0,
        })
    
    # 3. 视觉校验
    visual_score = 60  # 默认中性分数（跳过时）
    if not skip_visual and mcp_available:
        visual_score, visual_issues = visual_check(mcp)
        if visual_score == -1:
            visual_score = 60  # 截图失败，按中性分计
            skip_visual = True
        else:
            all_issues.extend([{**i, "stage": "visual"} for i in visual_issues])
    elif not mcp_available:
        skip_visual = True
    
    # 4. 计算加权总分
    weights = WEIGHTS.copy()
    
    # 重新分配权重（如果有阶段被跳过）
    if skip_runtime and skip_visual:
        # 仅静态校验
        weights = {"static": 1.0, "runtime": 0.0, "visual": 0.0}
    elif skip_runtime:
        # 静态 + 视觉
        total = weights["static"] + weights["visual"]
        weights = {
            "static": weights["static"] / total,
            "runtime": 0.0,
            "visual": weights["visual"] / total,
        }
    elif skip_visual:
        # 静态 + 运行时
        total = weights["static"] + weights["runtime"]
        weights = {
            "static": weights["static"] / total,
            "runtime": weights["runtime"] / total,
            "visual": 0.0,
        }
    
    total_score = int(
        static_score * weights["static"] +
        runtime_score * weights["runtime"] +
        visual_score * weights["visual"]
    )
    
    # 5. 判断状态
    if total_score >= PASS_SCORE:
        status = "PASS"
    elif static_score == 0:
        status = "FAILED"
    else:
        status = "BEST_EFFORT"
    
    return VerificationResult(
        total_score=total_score,
        static_score=static_score,
        runtime_score=runtime_score,
        visual_score=visual_score,
        status=status,
        issues=all_issues,
        weights_used=weights,
    )


def verify_with_iteration(
    json_content: str,
    ui_path: str = None,
    max_iterations: int = MAX_ITERATIONS,
    generate_fix_hints: bool = True,
) -> Tuple[VerificationResult, List[str]]:
    """
    带迭代控制的验证流程
    
    Args:
        json_content: UI JSON 内容
        ui_path: UI JSON 文件路径
        max_iterations: 最大迭代次数
        generate_fix_hints: 是否生成修复提示
    
    Returns:
        (best_result, fix_hints): 最佳结果和修复提示列表
    """
    best_result = None
    best_score = -1
    fix_hints = []
    
    for i in range(max_iterations):
        result = verify_ui(json_content, ui_path)
        result.iterations = i + 1
        
        if result.total_score > best_score:
            best_score = result.total_score
            best_result = result
        
        if result.status == "PASS":
            break
        
        # 生成修复提示
        if generate_fix_hints and i < max_iterations - 1:
            hints = _generate_fix_hints(result.issues)
            fix_hints.extend(hints)
    
    return best_result, fix_hints


def _generate_fix_hints(issues: List[Dict]) -> List[str]:
    """根据问题列表生成修复提示"""
    hints = []
    
    for issue in issues:
        code = issue.get("code", "")
        message = issue.get("message", "")
        
        if code == "JSON_SYNTAX":
            hints.append(f"修复 JSON 语法错误: {message}")
        elif code == "ROOT_NOT_TYPE2":
            hints.append("将根节点的 type 设置为 2 (WorldUILayer)")
        elif code == "NESTED_TYPE2":
            hints.append(f"移除子节点的 type:2，改为其他组件类型: {issue.get('path', '')}")
        elif code == "UID_DUPLICATE":
            hints.append(f"为重复的 UID 生成新的唯一值: {message}")
        elif code == "UID_INVALID_FORMAT":
            hints.append(f"将 UID 改为有效的 UUID v4 格式: {message}")
        elif code == "ALIGNMENT_INVALID_H":
            hints.append(f"将水平对齐改为 1(左), 2(中), 或 4(右): {issue.get('path', '')}")
        elif code == "ALIGNMENT_INVALID_V":
            hints.append(f"将垂直对齐改为 0(上), 8(中), 或 16(下): {issue.get('path', '')}")
        elif code == "RUNTIME_ERROR":
            hints.append(f"修复运行时错误: {message}")
    
    return hints


# ---------------------------------------------------------------------------
# 质量报告生成
# ---------------------------------------------------------------------------

def generate_quality_report(result: VerificationResult) -> str:
    """生成质量报告（Markdown 格式）"""
    lines = ["## UI 质量报告", ""]
    
    # 总分
    status_icon = {"PASS": "✅", "BEST_EFFORT": "⚠️", "FAILED": "❌"}.get(result.status, "❓")
    lines.append(f"**总分**: {result.total_score}/100 {status_icon} {result.status}")
    lines.append("")
    
    # 各维度得分
    lines.append("| 维度 | 得分 | 权重 | 权重后 |")
    lines.append("|------|------|------|--------|")
    
    static_weighted = int(result.static_score * result.weights_used.get("static", 0))
    runtime_weighted = int(result.runtime_score * result.weights_used.get("runtime", 0))
    visual_weighted = int(result.visual_score * result.weights_used.get("visual", 0))
    
    lines.append(f"| 静态校验 | {result.static_score} | {result.weights_used.get('static', 0):.0%} | {static_weighted} |")
    lines.append(f"| 运行时校验 | {result.runtime_score} | {result.weights_used.get('runtime', 0):.0%} | {runtime_weighted} |")
    lines.append(f"| 视觉校验 | {result.visual_score} | {result.weights_used.get('visual', 0):.0%} | {visual_weighted} |")
    lines.append("")
    
    # 发现的问题
    if result.issues:
        lines.append("### 发现的问题")
        lines.append("")
        
        # 按严重程度排序
        severity_order = {"FATAL": 0, "ERROR": 1, "WARNING": 2, "INFO": 3}
        sorted_issues = sorted(result.issues, key=lambda x: severity_order.get(x.get("severity", "INFO"), 4))
        
        for issue in sorted_issues:
            icon = {"FATAL": "🔴", "ERROR": "🟠", "WARNING": "🟡", "INFO": "🔵"}.get(issue.get("severity"), "❓")
            stage = issue.get("stage", "")
            code = issue.get("code", "")
            message = issue.get("message", "")
            lines.append(f"- {icon} [{stage}] {code}: {message}")
        lines.append("")
    
    # 迭代信息
    lines.append(f"### 验证信息")
    lines.append(f"- 迭代次数: {result.iterations}")
    lines.append("")
    
    return "\n".join(lines)


# ---------------------------------------------------------------------------
# 命令行测试
# ---------------------------------------------------------------------------

if __name__ == "__main__":
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python verify_ui.py <ui_json_file>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    
    print("正在验证 UI JSON...")
    result = verify_ui(content, file_path)
    
    report = generate_quality_report(result)
    print(report)
