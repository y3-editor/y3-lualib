#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Y3 UI Tree Generator
从 Y3 地图 UI JSON 文件中提取核心树结构（name, uid, type）
生成简化版 *_Tree.json 文件，用于快速查看 UI 层级关系

支持两种文件类型：
- Canvas: 根结构直接是节点，使用 uid 字段
- Prefab: 根结构是 {data: {...}, name}, 使用 prefab_sub_key 字段
"""

import json
import os
import sys
from pathlib import Path
from typing import Dict, List, Any, Optional, Tuple


class UITreeGenerator:
    """UI 树结构生成器"""
    
    def __init__(self, map_root: str):
        """
        初始化生成器
        
        Args:
            map_root: 地图根目录路径
        """
        self.map_root = Path(map_root).resolve()
        self.ui_dir = self.map_root / "maps" / "EntryMap" / "ui"
        self.output_dir = self.map_root / "ui_tree"
        self.stats = {
            "total_files": 0,
            "processed": 0,
            "generated": 0,
            "failed": 0,
            "skipped": 0,
            "canvas_count": 0,
            "prefab_count": 0
        }
        self.errors = []
    
    def validate_path(self) -> bool:
        """验证地图路径"""
        if not self.map_root.exists():
            self.errors.append(f"❌ 地图路径不存在: {self.map_root}")
            return False
        
        if not self.ui_dir.exists():
            self.errors.append(f"❌ UI 目录不存在: {self.ui_dir}")
            return False
        
        print(f"✅ 路径验证成功: {self.map_root}")
        return True
    
    def find_ui_files(self) -> List[Path]:
        """扫描所有 UI JSON 文件"""
        ui_files = []
        
        # 扫描所有子目录中的 .json 文件
        for root, dirs, files in os.walk(self.ui_dir):
            for file in files:
                if file.endswith('.json') and not file.endswith('_Tree.json'):
                    ui_files.append(Path(root) / file)
        
        self.stats["total_files"] = len(ui_files)
        print(f"📁 发现 {len(ui_files)} 个 UI 文件")
        return sorted(ui_files)
    
    @staticmethod
    def detect_file_type(ui_data: Dict[str, Any]) -> str:
        """
        检测 UI 文件类型
        
        Args:
            ui_data: JSON 数据
            
        Returns:
            "prefab" 或 "canvas"
        """
        # Prefab 文件的特征：根级别有 "data" 字段，data 内有 UI 节点数据
        if "data" in ui_data and isinstance(ui_data["data"], dict):
            data = ui_data["data"]
            # 进一步验证：data 内应该有 name 和 children 字段，或有 prefab_sub_key
            if "name" in data or "children" in data or "prefab_sub_key" in data:
                return "prefab"
        
        # Canvas 文件特征：根级别直接有 uid、name、children
        if "uid" in ui_data or ("name" in ui_data and "children" in ui_data):
            return "canvas"
        
        # 默认按 canvas 处理
        return "canvas"
    
    @staticmethod
    def extract_tree_canvas(node: Dict[str, Any]) -> Dict[str, Any]:
        """
        递归提取 Canvas 节点的关键信息
        
        Args:
            node: 原始节点数据
            
        Returns:
            简化后的节点数据 {name, uid, type, children}
        """
        result = {
            "name": node.get("name", ""),
            "uid": node.get("uid", ""),
            "type": node.get("type", 0)
        }
        
        # 递归处理子节点
        if "children" in node and node["children"]:
            result["children"] = [
                UITreeGenerator.extract_tree_canvas(child) 
                for child in node["children"]
            ]
        
        return result
    
    @staticmethod
    def extract_tree_prefab(node: Dict[str, Any]) -> Dict[str, Any]:
        """
        递归提取 Prefab 节点的关键信息
        
        Prefab 使用 prefab_sub_key 作为 ID，而不是 uid
        
        Args:
            node: 原始节点数据
            
        Returns:
            简化后的节点数据 {name, uid, type, children}
            uid 字段使用 prefab_sub_key 的值
        """
        # prefab_sub_key 可能是 null（根节点）
        prefab_key = node.get("prefab_sub_key")
        uid = prefab_key if prefab_key is not None else ""
        
        result = {
            "name": node.get("name", ""),
            "uid": uid,
            "type": node.get("type", 0)
        }
        
        # 递归处理子节点
        if "children" in node and node["children"]:
            result["children"] = [
                UITreeGenerator.extract_tree_prefab(child) 
                for child in node["children"]
            ]
        
        return result
    
    def process_file(self, ui_file: Path) -> Tuple[Optional[Dict[str, Any]], str]:
        """
        处理单个 UI 文件
        
        Args:
            ui_file: UI 文件路径
            
        Returns:
            (提取的树结构, 文件类型)，如果失败返回 (None, "")
        """
        try:
            # 读取原始 JSON
            with open(ui_file, 'r', encoding='utf-8') as f:
                ui_data = json.load(f)
            
            # 检测文件类型
            file_type = self.detect_file_type(ui_data)
            
            if file_type == "prefab":
                # Prefab 文件：从 data 字段提取树结构
                data_node = ui_data.get("data", {})
                tree = self.extract_tree_prefab(data_node)
                self.stats["prefab_count"] += 1
            else:
                # Canvas 文件：直接从根提取
                tree = self.extract_tree_canvas(ui_data)
                self.stats["canvas_count"] += 1
            
            return tree, file_type
            
        except json.JSONDecodeError as e:
            self.errors.append(f"⚠️  JSON 解析失败 {ui_file.name}: {str(e)}")
            self.stats["failed"] += 1
            return None, ""
        except Exception as e:
            self.errors.append(f"❌ 处理失败 {ui_file.name}: {str(e)}")
            self.stats["failed"] += 1
            return None, ""
    
    def save_tree(self, tree: Dict[str, Any], output_file: Path) -> bool:
        """
        保存树结构为 JSON 文件
        
        Args:
            tree: 树结构数据
            output_file: 输出文件路径
            
        Returns:
            是否成功
        """
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(tree, f, indent=2, ensure_ascii=False)
            self.stats["generated"] += 1
            return True
        except Exception as e:
            self.errors.append(f"❌ 保存失败 {output_file.name}: {str(e)}")
            self.stats["failed"] += 1
            return False
    
    def generate(self):
        """生成所有 UI 的树结构文件"""
        # 验证路径
        if not self.validate_path():
            return False
        
        # 创建输出目录
        if not self.output_dir.exists():
            try:
                self.output_dir.mkdir(parents=True, exist_ok=True)
                print(f"📁 创建输出目录: {self.output_dir}")
            except Exception as e:
                self.errors.append(f"❌ 创建输出目录失败: {str(e)}")
                return False
        
        # 扫描文件
        ui_files = self.find_ui_files()
        if not ui_files:
            print("⚠️  没有找到 UI 文件")
            return False
        
        print("\n🔄 开始处理 UI 文件...\n")
        
        # 处理每个文件
        for i, ui_file in enumerate(ui_files, 1):
            rel_path = ui_file.relative_to(self.ui_dir)
            print(f"[{i}/{len(ui_files)}] 处理: {rel_path}", end=" ")
            
            # 提取树结构
            tree, file_type = self.process_file(ui_file)
            if tree is None:
                print("❌")
                continue
            
            # 显示文件类型标记
            type_mark = "📦" if file_type == "prefab" else "🖼️"
            
            # 生成输出文件名（放在 ui_tree 目录）
            output_file = self.output_dir / f"{ui_file.stem}_Tree.json"
            
            # 保存树结构
            if self.save_tree(tree, output_file):
                print(f"{type_mark} ✅ → {output_file.name}")
                self.stats["processed"] += 1
            else:
                print("❌")
        
        # 输出统计信息
        self._print_stats()
        return self.stats["failed"] == 0
    
    def _print_stats(self):
        """打印统计信息"""
        print("\n" + "="*60)
        print("📊 处理结果统计")
        print("="*60)
        print(f"总文件数:    {self.stats['total_files']}")
        print(f"已处理:      {self.stats['processed']} ✅")
        print(f"  - Canvas:  {self.stats['canvas_count']} 🖼️")
        print(f"  - Prefab:  {self.stats['prefab_count']} 📦")
        print(f"已生成:      {self.stats['generated']} 📄")
        print(f"失败:        {self.stats['failed']} ❌")
        print(f"跳过:        {self.stats['skipped']} ⏭️")
        
        if self.errors:
            print("\n" + "="*60)
            print("⚠️  错误信息")
            print("="*60)
            for error in self.errors:
                print(error)
        
        print("="*60 + "\n")


def create_batch_script(script_dir: Path):
    """创建批处理脚本"""
    batch_file = script_dir / "gen_ui_tree.bat"
    
    batch_content = """@echo off
REM Y3 UI Tree 生成脚本
REM 使用方式: gen_ui_tree.bat <map_root_path>
REM 示例: gen_ui_tree.bat .

if "%1"=="" (
    echo 错误: 请提供地图根目录路径
    echo 用法: gen_ui_tree.bat <map_root_path>
    echo 示例: gen_ui_tree.bat .
    pause
    exit /b 1
)

echo ========================================
echo Y3 UI Tree 生成工具
echo ========================================
echo 目标地图: %1
echo.

python gen_ui_tree.py "%1%"

if %errorlevel% neq 0 (
    echo.
    echo 生成失败，按任意键退出...
    pause
    exit /b 1
) else (
    echo.
    echo 生成完成！
    pause
)
"""
    
    try:
        with open(batch_file, 'w', encoding='utf-8') as f:
            f.write(batch_content)
        print(f"✅ 批处理脚本已生成: {batch_file.name}")
        return True
    except Exception as e:
        print(f"❌ 创建批处理脚本失败: {str(e)}")
        return False


def main():
    """主函数"""
    if len(sys.argv) < 2:
        print("用法: python gen_ui_tree.py <map_root_path>")
        print("示例: python gen_ui_tree.py .")
        sys.exit(1)
    
    map_root = sys.argv[1]
    
    # 创建生成器
    generator = UITreeGenerator(map_root)
    
    # 生成树结构
    success = generator.generate()
    
    # 创建批处理脚本
    script_dir = Path(map_root).resolve()
    create_batch_script(script_dir)
    
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
