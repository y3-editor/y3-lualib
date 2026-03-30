#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
static_check.py — UI JSON 静态校验模块

对生成的 UI JSON 进行静态分析，检测：
- JSON 语法错误
- 结构规范（type:2 仅根节点）
- UID 格式和唯一性
- alignment 值合法性
- 必填属性检查

返回评分和问题列表。
"""

import json
import re
from typing import Any, Dict, List, Tuple, Optional
from dataclasses import dataclass
from enum import Enum


class Severity(Enum):
    """问题严重级别"""
    FATAL = "FATAL"      # 致命错误，导致 UI 无法加载
    ERROR = "ERROR"      # 错误，功能异常但可加载
    WARNING = "WARNING"  # 警告，可能存在问题
    INFO = "INFO"        # 建议，优化建议


@dataclass
class Issue:
    """检测到的问题"""
    severity: Severity
    code: str           # 问题代码，如 "JSON_SYNTAX", "UID_DUPLICATE"
    message: str        # 问题描述
    path: str = ""      # JSON 路径，如 "root.children[0].uid"
    deduction: int = 0  # 扣分值


class StaticChecker:
    """UI JSON 静态校验器"""
    
    # UUID v4 正则表达式
    UUID_V4_PATTERN = re.compile(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
        re.IGNORECASE
    )
    
    # 合法的 alignment 值
    VALID_HORIZONTAL_ALIGNMENT = {1, 2, 4}  # 左、中、右
    VALID_VERTICAL_ALIGNMENT = {0, 8, 16}   # 上、中、下
    
    def __init__(self):
        self.issues: List[Issue] = []
        self.seen_uids: Dict[str, str] = {}  # uid -> path
    
    def check(self, json_content: str) -> Tuple[int, List[Issue]]:
        """
        执行静态校验
        
        Args:
            json_content: UI JSON 文件内容（字符串）
        
        Returns:
            (score, issues): 得分(0-100) 和问题列表
        """
        self.issues = []
        self.seen_uids = {}
        
        # 1. JSON 语法校验
        try:
            data = json.loads(json_content)
        except json.JSONDecodeError as e:
            self.issues.append(Issue(
                severity=Severity.FATAL,
                code="JSON_SYNTAX",
                message=f"JSON parse error at line {e.lineno}: {e.msg}",
                deduction=100
            ))
            return 0, self.issues
        
        # 2. 根节点 type:2 检查
        if not self._check_root_type(data):
            return 0, self.issues
        
        # 3. 递归检查所有节点
        self._check_node(data, "root")
        
        # 4. 计算得分
        score = self._calculate_score()
        
        return score, self.issues
    
    def _check_root_type(self, data: Dict) -> bool:
        """检查根节点是否为 type:2 (WorldUILayer)"""
        root_type = data.get("type")
        if root_type != 2:
            self.issues.append(Issue(
                severity=Severity.FATAL,
                code="ROOT_NOT_TYPE2",
                message=f"Root node type is {root_type}, expected 2 (WorldUILayer)",
                path="root",
                deduction=100
            ))
            return False
        return True
    
    def _check_node(self, node: Dict, path: str) -> None:
        """递归检查单个节点"""
        # 检查 UID
        uid = node.get("uid")
        if uid:
            self._check_uid(uid, path)
        
        # 检查 alignment
        alignment = node.get("alignment")
        if alignment:
            self._check_alignment(alignment, path)
        
        # 检查子节点
        children = node.get("children", [])
        for i, child in enumerate(children):
            child_path = f"{path}.children[{i}]"
            
            # 子节点不能是 type:2
            if child.get("type") == 2:
                self.issues.append(Issue(
                    severity=Severity.ERROR,
                    code="NESTED_TYPE2",
                    message="Child node cannot be type:2 (WorldUILayer)",
                    path=child_path,
                    deduction=40
                ))
            
            # 递归检查
            self._check_node(child, child_path)
    
    def _check_uid(self, uid: str, path: str) -> None:
        """检查 UID 格式和唯一性"""
        # 检查格式是否符合 UUID v4
        if not self.UUID_V4_PATTERN.match(uid):
            self.issues.append(Issue(
                severity=Severity.ERROR,
                code="UID_INVALID_FORMAT",
                message=f"UID '{uid}' is not a valid UUID v4 format",
                path=f"{path}.uid",
                deduction=20
            ))
        
        # 检查唯一性
        if uid in self.seen_uids:
            self.issues.append(Issue(
                severity=Severity.ERROR,
                code="UID_DUPLICATE",
                message=f"UID '{uid}' is duplicate, first seen at {self.seen_uids[uid]}",
                path=f"{path}.uid",
                deduction=30
            ))
        else:
            self.seen_uids[uid] = path
    
    def _check_alignment(self, alignment: Any, path: str) -> None:
        """检查 alignment 值是否合法"""
        # alignment 格式: {"__tuple__": true, "items": [horizontal, vertical]}
        if isinstance(alignment, dict) and alignment.get("__tuple__"):
            items = alignment.get("items", [])
            if len(items) >= 2:
                h_align, v_align = items[0], items[1]
                
                if h_align not in self.VALID_HORIZONTAL_ALIGNMENT:
                    self.issues.append(Issue(
                        severity=Severity.ERROR,
                        code="ALIGNMENT_INVALID_H",
                        message=f"Invalid horizontal alignment {h_align}, must be 1 (left), 2 (center), or 4 (right)",
                        path=f"{path}.alignment",
                        deduction=15
                    ))
                
                if v_align not in self.VALID_VERTICAL_ALIGNMENT:
                    self.issues.append(Issue(
                        severity=Severity.ERROR,
                        code="ALIGNMENT_INVALID_V",
                        message=f"Invalid vertical alignment {v_align}, must be 0 (top), 8 (center), or 16 (bottom)",
                        path=f"{path}.alignment",
                        deduction=15
                    ))
    
    def _calculate_score(self) -> int:
        """根据问题列表计算得分"""
        # 检查是否有致命错误
        for issue in self.issues:
            if issue.severity == Severity.FATAL:
                return 0
        
        # 计算总扣分
        total_deduction = sum(issue.deduction for issue in self.issues)
        
        # 得分不低于 0
        return max(0, 100 - total_deduction)


def check_ui_json(json_content: str) -> Tuple[int, List[Dict]]:
    """
    检查 UI JSON 内容
    
    Args:
        json_content: JSON 文件内容字符串
    
    Returns:
        (score, issues): 得分和问题列表（字典格式）
    """
    checker = StaticChecker()
    score, issues = checker.check(json_content)
    
    # 转换为字典格式
    issues_dict = [
        {
            "severity": issue.severity.value,
            "code": issue.code,
            "message": issue.message,
            "path": issue.path,
            "deduction": issue.deduction,
        }
        for issue in issues
    ]
    
    return score, issues_dict


def check_ui_json_file(file_path: str) -> Tuple[int, List[Dict]]:
    """
    检查 UI JSON 文件
    
    Args:
        file_path: JSON 文件路径
    
    Returns:
        (score, issues): 得分和问题列表（字典格式）
    """
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    return check_ui_json(content)


# ---------------------------------------------------------------------------
# 命令行测试
# ---------------------------------------------------------------------------

if __name__ == "__main__":
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python static_check.py <ui_json_file>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    score, issues = check_ui_json_file(file_path)
    
    print(f"\n静态校验得分: {score}/100")
    print(f"发现 {len(issues)} 个问题:\n")
    
    for issue in issues:
        icon = {"FATAL": "🔴", "ERROR": "🟠", "WARNING": "🟡", "INFO": "🔵"}.get(issue["severity"], "❓")
        print(f"{icon} [{issue['severity']}] {issue['code']}")
        print(f"   {issue['message']}")
        if issue["path"]:
            print(f"   路径: {issue['path']}")
        print(f"   扣分: -{issue['deduction']}")
        print()
