#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
test_static_check.py — 静态校验模块单元测试

测试 static_check.py 的各种错误检测场景。
"""

import json
import sys
import os

# 添加脚本目录到路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from static_check import check_ui_json, StaticChecker


def test_json_syntax_error():
    """测试 JSON 语法错误检测"""
    invalid_json = '{"type": 2, "name": "test"'  # 缺少闭合括号
    score, issues = check_ui_json(invalid_json)
    
    assert score == 0, f"Expected score 0, got {score}"
    assert len(issues) == 1
    assert issues[0]["code"] == "JSON_SYNTAX"
    assert issues[0]["severity"] == "FATAL"
    print("✅ test_json_syntax_error passed")


def test_root_not_type2():
    """测试根节点非 type:2 检测"""
    json_content = json.dumps({
        "type": 1,  # 应该是 2
        "name": "test",
        "uid": "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d"
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 0, f"Expected score 0, got {score}"
    assert any(i["code"] == "ROOT_NOT_TYPE2" for i in issues)
    print("✅ test_root_not_type2 passed")


def test_nested_type2():
    """测试子节点 type:2 检测"""
    json_content = json.dumps({
        "type": 2,
        "name": "root",
        "uid": "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d",
        "children": [
            {
                "type": 2,  # 子节点不应该是 type:2
                "name": "child",
                "uid": "b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e"
            }
        ]
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 60, f"Expected score 60 (100-40), got {score}"
    assert any(i["code"] == "NESTED_TYPE2" for i in issues)
    print("✅ test_nested_type2 passed")


def test_uid_invalid_format():
    """测试 UID 格式非法检测"""
    json_content = json.dumps({
        "type": 2,
        "name": "root",
        "uid": "invalid-uid-format"  # 不是 UUID v4
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 80, f"Expected score 80 (100-20), got {score}"
    assert any(i["code"] == "UID_INVALID_FORMAT" for i in issues)
    print("✅ test_uid_invalid_format passed")


def test_uid_duplicate():
    """测试 UID 重复检测"""
    same_uid = "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d"
    json_content = json.dumps({
        "type": 2,
        "name": "root",
        "uid": same_uid,
        "children": [
            {
                "type": 3,
                "name": "child",
                "uid": same_uid  # 重复的 UID
            }
        ]
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 70, f"Expected score 70 (100-30), got {score}"
    assert any(i["code"] == "UID_DUPLICATE" for i in issues)
    print("✅ test_uid_duplicate passed")


def test_alignment_invalid_horizontal():
    """测试水平对齐非法值检测"""
    json_content = json.dumps({
        "type": 2,
        "name": "root",
        "uid": "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d",
        "alignment": {"__tuple__": True, "items": [3, 8]}  # 3 不是合法的水平对齐值
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 85, f"Expected score 85 (100-15), got {score}"
    assert any(i["code"] == "ALIGNMENT_INVALID_H" for i in issues)
    print("✅ test_alignment_invalid_horizontal passed")


def test_alignment_invalid_vertical():
    """测试垂直对齐非法值检测"""
    json_content = json.dumps({
        "type": 2,
        "name": "root",
        "uid": "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d",
        "alignment": {"__tuple__": True, "items": [2, 4]}  # 4 不是合法的垂直对齐值
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 85, f"Expected score 85 (100-15), got {score}"
    assert any(i["code"] == "ALIGNMENT_INVALID_V" for i in issues)
    print("✅ test_alignment_invalid_vertical passed")


def test_perfect_json():
    """测试完美的 JSON（无任何问题）"""
    json_content = json.dumps({
        "type": 2,
        "name": "root",
        "uid": "a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d",
        "alignment": {"__tuple__": True, "items": [2, 8]},
        "children": [
            {
                "type": 3,
                "name": "label",
                "uid": "b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e",
                "alignment": {"__tuple__": True, "items": [1, 0]}
            }
        ]
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 100, f"Expected score 100, got {score}"
    assert len(issues) == 0, f"Expected no issues, got {len(issues)}"
    print("✅ test_perfect_json passed")


def test_multiple_errors():
    """测试多个错误叠加"""
    json_content = json.dumps({
        "type": 2,
        "name": "root",
        "uid": "invalid-uid",  # -20
        "alignment": {"__tuple__": True, "items": [3, 4]},  # -15 + -15 = -30
        "children": []
    })
    score, issues = check_ui_json(json_content)
    
    assert score == 50, f"Expected score 50 (100-20-30), got {score}"
    assert len(issues) == 3
    print("✅ test_multiple_errors passed")


def run_all_tests():
    """运行所有测试"""
    print("\n" + "=" * 50)
    print("运行静态校验单元测试")
    print("=" * 50 + "\n")
    
    tests = [
        test_json_syntax_error,
        test_root_not_type2,
        test_nested_type2,
        test_uid_invalid_format,
        test_uid_duplicate,
        test_alignment_invalid_horizontal,
        test_alignment_invalid_vertical,
        test_perfect_json,
        test_multiple_errors,
    ]
    
    passed = 0
    failed = 0
    
    for test in tests:
        try:
            test()
            passed += 1
        except AssertionError as e:
            print(f"❌ {test.__name__} failed: {e}")
            failed += 1
        except Exception as e:
            print(f"❌ {test.__name__} error: {e}")
            failed += 1
    
    print("\n" + "=" * 50)
    print(f"测试结果: {passed} 通过, {failed} 失败")
    print("=" * 50)
    
    return failed == 0


if __name__ == "__main__":
    success = run_all_tests()
    sys.exit(0 if success else 1)
