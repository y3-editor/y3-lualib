"""
分析自定义资源脚本

用途：
- 查看项目 custom/ 目录下的自定义模型资源
- 检测哪些模型可被自动匹配，哪些因命名不规范被跳过
- 调试自定义资源加载问题

用法：
  py -3 analyze_custom_resources.py [项目路径]
  
  例如：
    py -3 analyze_custom_resources.py .
    py -3 analyze_custom_resources.py    # 使用默认路径
"""
import re
import os
import sys

# 默认项目路径（当前工程的上级目录）
# scripts/ -> y3-obj-gen/ -> skills/ -> agentmap/
SKILL_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEFAULT_PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(SKILL_DIR)))


def is_valid_model_name(name):
    """
    检查模型名称是否有效（可用于搜索匹配）
    """
    if not name or len(name) < 2:
        return False
    
    # 纯数字 -> 无效
    if re.match(r'^\d+$', name):
        return False
    
    # 纯英文字母+数字+下划线的编码格式 -> 无效
    if re.match(r'^[a-zA-Z_]+\d*[a-zA-Z_]*\d*[a-zA-Z_]*\d*$', name) and '_' in name:
        return False
    
    # 包含中文 -> 有效
    if re.search(r'[\u4e00-\u9fff]', name):
        return True
    
    # 有意义的英文单词（至少3个连续字母，不含数字和下划线）
    if re.match(r'^[a-zA-Z]{3,}$', name):
        return True
    
    return False


def analyze_custom_resources(project_root):
    """分析指定项目的自定义资源"""
    custom_dir = os.path.join(project_root, 'custom')
    
    print(f"\n{'='*60}")
    print(f"  分析自定义资源: {project_root}")
    print(f"{'='*60}\n")
    
    if not os.path.exists(custom_dir):
        print(f"  ❌ 自定义资源目录不存在: {custom_dir}")
        return
    
    # 读取分类信息
    folder_info_path = os.path.join(custom_dir, "folder_info", "custom_model_folder_info.py")
    category_map = {}
    
    if os.path.exists(folder_info_path):
        try:
            with open(folder_info_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            import ast
            match = re.search(r"data\s*=\s*(\{.*\})", content, re.DOTALL)
            if match:
                data = ast.literal_eval(match.group(1))
                
                folders = {}
                if 'f' in data:
                    for folder_item in data['f']:
                        if len(folder_item) >= 4:
                            folder_id = folder_item[2]
                            folder_name = folder_item[3]
                            folders[folder_id] = folder_name
                
                if 'd' in data:
                    for model_id, (folder_id, _) in data['d'].items():
                        category_map[model_id] = folders.get(folder_id, "未分类")
                
                print(f"  ✓ 已解析分类信息: {len(category_map)} 个模型\n")
                
                # 统计分类
                category_counts = {}
                for cat in category_map.values():
                    category_counts[cat] = category_counts.get(cat, 0) + 1
                
                print("  分类统计:")
                for cat, count in sorted(category_counts.items(), key=lambda x: -x[1]):
                    print(f"    - {cat}: {count} 个")
                print()
                
        except Exception as e:
            print(f"  ⚠️ 解析分类信息失败: {e}\n")
    
    # 读取资源仓库
    repo_path = os.path.join(custom_dir, 'CustomImportRepo.local', 'resource.repository')
    
    if not os.path.exists(repo_path):
        print(f"  ❌ 资源仓库文件不存在: {repo_path}")
        return
    
    content = open(repo_path, 'r', encoding='utf-8').read()
    pattern = r'<Item><Type>Model</Type>.*?<Package>custom_model/(\d+)</Package>.*?<Name>([^<]+)</Name>'
    
    valid = []
    skipped = []
    
    for m in re.finditer(pattern, content):
        model_id = int(m.group(1))
        model_name = m.group(2)
        category = category_map.get(model_id, "未分类")
        
        if is_valid_model_name(model_name):
            valid.append((model_id, model_name, category))
        else:
            skipped.append((model_id, model_name, category))
    
    # 输出结果
    print(f"  {'='*50}")
    print(f"  有效模型 ({len(valid)} 个) - 可参与自动匹配")
    print(f"  {'='*50}")
    for v in valid[:15]:
        print(f"    ID: {v[0]:<12} 名称: \"{v[1]}\" ({v[2]})")
    if len(valid) > 15:
        print(f"    ... 等 {len(valid)-15} 个")
    
    print()
    print(f"  {'='*50}")
    print(f"  跳过的模型 ({len(skipped)} 个) - 命名不规范")
    print(f"  {'='*50}")
    for s in skipped[:15]:
        print(f"    ID: {s[0]:<12} 名称: \"{s[1]}\" ({s[2]})")
    if len(skipped) > 15:
        print(f"    ... 等 {len(skipped)-15} 个")
    
    print()
    print(f"  {'='*50}")
    print(f"  总结: 可用 {len(valid)} 个，跳过 {len(skipped)} 个")
    print(f"  {'='*50}")
    
    if skipped:
        print("\n  💡 提示: 被跳过的模型可以在 Y3 编辑器中重命名为中文名称，")
        print("          重命名后将自动参与匹配。")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        project_root = sys.argv[1]
    else:
        project_root = DEFAULT_PROJECT_ROOT
    
    analyze_custom_resources(project_root)
