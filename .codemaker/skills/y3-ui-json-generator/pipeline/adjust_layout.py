#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Y3 UI JSON 布局调整工具

用于批量修改已有 UI JSON 文件的属性（位置、尺寸、文本、字体等）。

使用方式：
1. 命令行模式：
   py -3 adjust_layout.py <ui_json_path> <layout_config_path>

2. Python 调用：
   from adjust_layout import adjust_layout
   adjust_layout(ui_json_path, layout_config)

布局配置格式（layout_config.json）：
{
    "bg_overlay": {
        "pos": [960, 540],
        "size": [1920, 1080]
    },
    "title_TEXT": {
        "pos": [960, 900],
        "size": [400, 60],
        "text": "选择一项强化",
        "font_size": 36
    },
    "card_container.card_1.select_BTN": {
        "pos": [175, 40],
        "size": [200, 50],
        "text": "选择"
    }
}

支持的属性：
- pos: [x, y] 位置
- size: [width, height] 尺寸
- text: str 文本内容
- font_size: int 字体大小
- font_color: [r, g, b, a] 字体颜色
- image: int 图片ID
- visible: bool 可见性
- alpha: float 透明度 (0-100)
- set: dict 通用字段写入（支持点路径写入子字段）

`set` 用法示例：
{
    "choice_3.name": {
        "set": {
            "alignment.items": [2, 8]
        }
    }
}
"""

import json
import sys
import os
from typing import Dict, Any, Optional, List, Union


def find_node_by_path(root: Dict, path: str) -> Optional[Dict]:
    """
    通过路径查找节点
    
    路径格式: "parent.child.grandchild" 或 "直接名称"
    
    Args:
        root: 根节点
        path: 节点路径，用点号分隔
        
    Returns:
        找到的节点，或 None
    """
    parts = path.split('.')
    current = root
    
    for part in parts:
        found = False
        # 先检查当前节点名称是否匹配
        if current.get('name') == part:
            found = True
            continue
            
        # 在 children 中查找
        for child in current.get('children', []):
            if child.get('name') == part:
                current = child
                found = True
                break
        
        if not found:
            return None
    
    return current


def find_all_nodes_by_name(root: Dict, name: str, results: List[Dict] = None) -> List[Dict]:
    """
    递归查找所有匹配名称的节点
    
    Args:
        root: 根节点
        name: 节点名称
        results: 结果列表（内部使用）
        
    Returns:
        匹配的节点列表
    """
    if results is None:
        results = []
    
    if root.get('name') == name:
        results.append(root)
    
    for child in root.get('children', []):
        find_all_nodes_by_name(child, name, results)
    
    return results


def _set_by_dotted_path(obj: Any, dotted_path: str, value: Any) -> None:
    """按点路径写入字段。

    - dotted_path 示例："alignment.items" / "pos_data.items.0"
    - 若中间 dict 不存在会自动创建
    - list 下标用数字字符串表示
    """
    parts = dotted_path.split('.')
    cur = obj
    for i, part in enumerate(parts):
        is_last = i == len(parts) - 1

        # list index
        if isinstance(cur, list):
            idx = int(part)
            if is_last:
                cur[idx] = value
                return
            cur = cur[idx]
            continue

        # dict key
        if not isinstance(cur, dict):
            raise TypeError(f"Cannot set path '{dotted_path}': non-container at '{part}'")

        if is_last:
            cur[part] = value
            return

        # create intermediate container if missing
        if part not in cur or cur[part] is None:
            # next part decides container type
            nxt = parts[i + 1]
            cur[part] = [] if nxt.isdigit() else {}

        cur = cur[part]


def apply_properties(node: Dict, props: Dict[str, Any]) -> List[str]:
    """
    将属性应用到节点
    
    Args:
        node: 目标节点
        props: 属性字典
        
    Returns:
        修改的属性列表
    """
    modified = []
    
    # 位置
    if 'pos' in props:
        x, y = props['pos']
        node['pos_data']['items'][0] = float(x)
        node['pos_data']['items'][1] = float(y)
        modified.append('pos')
    
    # 尺寸
    if 'size' in props:
        w, h = props['size']
        node['size']['items'][0] = float(w)
        node['size']['items'][1] = float(h)
        modified.append('size')
    
    # 文本
    if 'text' in props:
        text_value = props['text']
        if 'text' in node:
            node['text'] = [text_value, False]
        else:
            node['text'] = [text_value, False]
        modified.append('text')
    
    # 字体大小
    if 'font_size' in props:
        if 'font' in node:
            node['font'][1] = props['font_size']
        else:
            node['font'] = ['', props['font_size']]
        modified.append('font_size')
    
    # 字体颜色
    if 'font_color' in props:
        node['font_color'] = props['font_color']
        modified.append('font_color')
    
    # 图片ID
    if 'image' in props:
        node['image'] = props['image']
        modified.append('image')
    
    # 可见性
    if 'visible' in props:
        node['visible'] = props['visible']
        modified.append('visible')
    
    # 透明度
    if 'alpha' in props:
        node['alpha'] = props['alpha']
        modified.append('alpha')
    
    # 锚点
    if 'anchor' in props:
        node['anchor'] = props['anchor']
        modified.append('anchor')

    # 通用字段写入（点路径）
    # 示例：{"set": {"alignment.items": [2,8]}}
    if 'set' in props:
        set_map = props['set'] or {}
        if not isinstance(set_map, dict):
            raise TypeError("'set' must be a dict")
        for k, v in set_map.items():
            _set_by_dotted_path(node, k, v)
            modified.append(f"set:{k}")
    
    return modified


def adjust_layout(ui_json_path: str, layout_config: Union[str, Dict]) -> Dict[str, Any]:
    """
    调整 UI JSON 的布局
    
    Args:
        ui_json_path: UI JSON 文件路径
        layout_config: 布局配置（可以是文件路径或字典）
        
    Returns:
        调整结果报告
    """
    # 加载 UI JSON
    with open(ui_json_path, 'r', encoding='utf-8') as f:
        ui_data = json.load(f)
    
    # 加载布局配置
    if isinstance(layout_config, str):
        with open(layout_config, 'r', encoding='utf-8') as f:
            config = json.load(f)
    else:
        config = layout_config
    
    # 调整结果报告
    report = {
        'success': [],
        'not_found': [],
        'errors': []
    }
    
    # 遍历配置，应用修改
    for path, props in config.items():
        try:
            # 检查是否是通配符模式（以 * 开头或包含 *）
            if '*' in path:
                # 通配符模式：修改所有匹配名称的节点
                name = path.replace('*', '').strip('.')
                nodes = find_all_nodes_by_name(ui_data, name)
                
                if not nodes:
                    report['not_found'].append(path)
                    continue
                
                for node in nodes:
                    modified = apply_properties(node, props)
                    report['success'].append({
                        'path': f"{path} -> {node.get('name')}",
                        'modified': modified
                    })
            else:
                # 精确路径模式
                node = find_node_by_path(ui_data, path)
                
                if node is None:
                    report['not_found'].append(path)
                    continue
                
                modified = apply_properties(node, props)
                report['success'].append({
                    'path': path,
                    'modified': modified
                })
                
        except Exception as e:
            report['errors'].append({
                'path': path,
                'error': str(e)
            })
    
    # 保存修改后的文件
    with open(ui_json_path, 'w', encoding='utf-8') as f:
        json.dump(ui_data, f, indent=4, ensure_ascii=False)
    
    return report


def main():
    """命令行入口"""
    if len(sys.argv) < 3:
        print("用法: py -3 adjust_layout.py <ui_json_path> <layout_config_path>")
        print("")
        print("示例:")
        print("  py -3 adjust_layout.py maps/EntryMap/ui/TestPanel.json layout.json")
        print("")
        print("布局配置示例 (layout.json):")
        print('''{
    "bg_overlay": {"pos": [960, 540], "size": [1920, 1080]},
    "title_TEXT": {"pos": [960, 900], "text": "标题", "font_size": 36}
}''')
        sys.exit(1)
    
    ui_json_path = sys.argv[1]
    layout_config_path = sys.argv[2]
    
    if not os.path.exists(ui_json_path):
        print(f"错误: UI JSON 文件不存在: {ui_json_path}")
        sys.exit(1)
    
    if not os.path.exists(layout_config_path):
        print(f"错误: 布局配置文件不存在: {layout_config_path}")
        sys.exit(1)
    
    print(f"正在调整布局: {ui_json_path}")
    print(f"使用配置: {layout_config_path}")
    print("")
    
    report = adjust_layout(ui_json_path, layout_config_path)
    
    # 输出报告
    if report['success']:
        print(f"✅ 成功修改 {len(report['success'])} 个节点:")
        for item in report['success']:
            print(f"   - {item['path']}: {', '.join(item['modified'])}")
    
    if report['not_found']:
        print(f"\n⚠️ 未找到 {len(report['not_found'])} 个节点:")
        for path in report['not_found']:
            print(f"   - {path}")
    
    if report['errors']:
        print(f"\n❌ 发生 {len(report['errors'])} 个错误:")
        for item in report['errors']:
            print(f"   - {item['path']}: {item['error']}")
    
    print("\n完成！")


if __name__ == '__main__':
    main()
