#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Y3 物编生成器 v4.0 (AI 协作版)

AI 负责选择模型，脚本负责生成物编 JSON。

使用方式:
    # 单个单位（AI 已选好模型）
    py -3 y3_obj_gen_ai.py -m "maps/EntryMap" -n "战士" -t "近战英雄" --model 206612 --icon 903952
    
    # 批量生成（从 JSON 配置）
    py -3 y3_obj_gen_ai.py -m "maps/EntryMap" --config units.json
    
    # 批量生成（命令行）
    py -3 y3_obj_gen_ai.py -m "maps/EntryMap" --batch "战士:近战英雄:206612:903952,法师:远程英雄:211025:907324"

JSON 配置格式:
    [
        {"name": "战士", "type": "近战英雄", "model": 206612, "icon": 903952},
        {"name": "法师", "type": "远程英雄", "model": 211025, "icon": 907324, "projectile": 104948, "hit_effect": 104949}
    ]
"""

import argparse
import json
import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
SKILL_DIR = os.path.dirname(SCRIPT_DIR)
TEMPLATE_DIR = os.path.join(SKILL_DIR, "data_template")

# 模板映射
TEMPLATE_MAP = {
    '近战小怪': '近程小怪模板.json',
    '远程小怪': '远程小怪模板.json',
    '近战精英': '近战boss模板.json',
    '远程精英': '远程boss模板.json',
    '近战boss': '近战boss模板.json',
    '远程boss': '远程boss模板.json',
    '近战英雄': '近战英雄模板.json',
    '远程英雄': '远程英雄模板.json',
    '建筑': '建筑模板.json',
}

# 默认头像
DEFAULT_ICONS = {
    'hero': 903952,
    'boss': 903952,
    'elite': 903951,
    'minion': 903950,
}


def xencode(s):
    if isinstance(s, bytes):
        return s
    return s.encode('utf-8')


def murmur3_hash(key, seed=0):
    """32-bit murmur3 hash"""
    key = bytearray(xencode(key))
    
    def fmix(h):
        h ^= h >> 16
        h = (h * 0x85ebca6b) & 0xFFFFFFFF
        h ^= h >> 13
        h = (h * 0xc2b2ae35) & 0xFFFFFFFF
        h ^= h >> 16
        return h
    
    length = len(key)
    nblocks = length // 4
    h1 = seed
    c1 = 0xcc9e2d51
    c2 = 0x1b873593
    
    for block_start in range(0, nblocks * 4, 4):
        k1 = (key[block_start + 3] << 24 |
              key[block_start + 2] << 16 |
              key[block_start + 1] << 8 |
              key[block_start + 0])
        k1 = (c1 * k1) & 0xFFFFFFFF
        k1 = (k1 << 15 | k1 >> 17) & 0xFFFFFFFF
        k1 = (c2 * k1) & 0xFFFFFFFF
        h1 ^= k1
        h1 = (h1 << 13 | h1 >> 19) & 0xFFFFFFFF
        h1 = (h1 * 5 + 0xe6546b64) & 0xFFFFFFFF
    
    tail_index = nblocks * 4
    k1 = 0
    tail_size = length & 3
    if tail_size >= 3:
        k1 ^= key[tail_index + 2] << 16
    if tail_size >= 2:
        k1 ^= key[tail_index + 1] << 8
    if tail_size >= 1:
        k1 ^= key[tail_index + 0]
    if tail_size > 0:
        k1 = (k1 * c1) & 0xFFFFFFFF
        k1 = (k1 << 15 | k1 >> 17) & 0xFFFFFFFF
        k1 = (k1 * c2) & 0xFFFFFFFF
        h1 ^= k1
    
    h1 ^= length
    h1 = fmix(h1)
    
    if h1 >= 0x80000000:
        h1 -= 0x100000000
    return h1


def get_next_id(map_path, prefix):
    """获取下一个可用 ID"""
    output_dir = os.path.join(map_path, "editor_table", "editorunit")
    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        return prefix * 100000 + 1
    
    existing_ids = []
    for f in os.listdir(output_dir):
        if f.endswith('.json'):
            try:
                uid = int(f.replace('.json', ''))
                if uid // 100000 == prefix:
                    existing_ids.append(uid)
            except:
                pass
    
    if existing_ids:
        return max(existing_ids) + 1
    return prefix * 100000 + 1


def determine_id_prefix(unit_type):
    """根据类型确定 ID 前缀"""
    if '英雄' in unit_type:
        return 1  # 100001, 100002...
    elif '精英' in unit_type:
        return 3  # 300001, 300002...
    elif 'boss' in unit_type.lower():
        return 4  # 400001, 400002...
    else:
        return 2  # 200001, 200002... (小怪)


def load_template(unit_type):
    """加载模板"""
    template_file = TEMPLATE_MAP.get(unit_type, '近程小怪模板.json')
    template_path = os.path.join(TEMPLATE_DIR, template_file)
    if os.path.exists(template_path):
        with open(template_path, 'r', encoding='utf-8') as f:
            return json.load(f)
    raise FileNotFoundError(f"模板不存在: {template_path}")


def load_language(map_path):
    """加载多语言文件"""
    lang_path = os.path.join(map_path, "zhlanguage.json")
    if os.path.exists(lang_path):
        try:
            with open(lang_path, 'r', encoding='utf-8') as f:
                return json.load(f)
        except:
            pass
    return {}


def save_language(map_path, lang_data):
    """保存多语言文件"""
    lang_path = os.path.join(map_path, "zhlanguage.json")
    with open(lang_path, 'w', encoding='utf-8') as f:
        json.dump(lang_data, f, ensure_ascii=False, indent=4)


def generate_unit(map_path, unit_config, id_counters, lang_data):
    """
    生成单个单位物编
    
    unit_config: {
        "name": "战士",           # 必填
        "type": "近战英雄",        # 必填
        "model": 206612,          # 必填 - AI 选择的模型 ID
        "icon": 903952,           # 可选 - 头像 ID
        "projectile": 0,          # 可选 - 弹道特效 ID（远程用）
        "hit_effect": 102115,     # 可选 - 受击特效 ID
        "id": 100001,             # 可选 - 指定 ID（不指定则自动分配）
        "attrs": {}               # 可选 - 自定义属性覆盖
    }
    """
    name = unit_config.get('name')
    unit_type = unit_config.get('type')
    model_id = unit_config.get('model')
    
    if not name or not unit_type or not model_id:
        print(f"  [ERR] 配置缺少必填字段: {unit_config}")
        return None
    
    # 确定 ID
    if 'id' in unit_config:
        unit_id = unit_config['id']
    else:
        prefix = determine_id_prefix(unit_type)
        if prefix not in id_counters:
            id_counters[prefix] = get_next_id(map_path, prefix)
        unit_id = id_counters[prefix]
        id_counters[prefix] += 1
    
    # 检查是否已存在
    output_dir = os.path.join(map_path, "editor_table", "editorunit")
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f"{unit_id}.json")
    
    if os.path.exists(output_path):
        print(f"  [WARN] 跳过 {unit_id}: 文件已存在")
        return None
    
    # 加载模板
    data = load_template(unit_type)
    
    # 基础字段
    data['key'] = unit_id
    data['uid'] = str(unit_id)
    data['model'] = model_id
    
    # 名称（多语言）
    name_key = murmur3_hash(name)
    data['name'] = name_key
    data['description'] = name_key  # 描述也用名称
    lang_data[str(name_key)] = name
    
    # 头像
    icon_id = unit_config.get('icon')
    if icon_id:
        data['icon'] = icon_id
        data['mini_map_icon'] = icon_id
    else:
        # 根据类型选默认头像
        if '英雄' in unit_type:
            data['icon'] = DEFAULT_ICONS['hero']
        elif 'boss' in unit_type.lower():
            data['icon'] = DEFAULT_ICONS['boss']
        elif '精英' in unit_type:
            data['icon'] = DEFAULT_ICONS['elite']
        else:
            data['icon'] = DEFAULT_ICONS['minion']
    
    # 攻击特效（处理 simple_common_atk）
    is_ranged = '远程' in unit_type
    if 'simple_common_atk' in data:
        simple_atk = data['simple_common_atk']
        
        # 弹道特效
        projectile = unit_config.get('projectile', 0 if not is_ranged else None)
        if projectile is not None and 'attack_trajectory' in simple_atk:
            simple_atk['attack_trajectory']['effect'] = projectile
        
        # 受击特效
        hit_effect = unit_config.get('hit_effect')
        if hit_effect and 'hit_effect' in simple_atk:
            simple_atk['hit_effect']['effect'] = hit_effect
    
    # 自定义属性覆盖
    attrs = unit_config.get('attrs', {})
    for key, value in attrs.items():
        if key in data:
            data[key] = value
    
    # 保存 JSON
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"  [OK] {unit_id}: {name} ({unit_type}) -> 模型 {model_id}")
    return unit_id


def parse_batch_string(batch_str):
    """
    解析批量字符串
    格式: 名称:类型:模型ID:头像ID,名称:类型:模型ID:头像ID,...
    示例: 战士:近战英雄:206612:903952,法师:远程英雄:211025:907324
    """
    units = []
    for item in batch_str.split(','):
        parts = item.strip().split(':')
        if len(parts) >= 3:
            config = {
                'name': parts[0].strip(),
                'type': parts[1].strip(),
                'model': int(parts[2].strip()),
            }
            if len(parts) >= 4:
                config['icon'] = int(parts[3].strip())
            if len(parts) >= 5:
                config['projectile'] = int(parts[4].strip())
            if len(parts) >= 6:
                config['hit_effect'] = int(parts[5].strip())
            units.append(config)
    return units


def main():
    parser = argparse.ArgumentParser(description="Y3 物编生成器 v4.0 (AI 协作版)")
    parser.add_argument("-m", "--map-path", required=True, help="地图路径")
    
    # 单个单位模式
    parser.add_argument("-n", "--name", help="单位名称")
    parser.add_argument("-t", "--type", help="单位类型")
    parser.add_argument("--model", type=int, help="模型 ID")
    parser.add_argument("--icon", type=int, help="头像 ID")
    parser.add_argument("--projectile", type=int, default=0, help="弹道特效 ID")
    parser.add_argument("--hit-effect", type=int, help="受击特效 ID")
    parser.add_argument("--id", type=int, help="指定单位 ID")
    
    # 批量模式
    parser.add_argument("--batch", help="批量生成: 名称:类型:模型ID:头像ID,...")
    parser.add_argument("--config", help="从 JSON 文件读取配置")
    
    args = parser.parse_args()
    
    # 验证地图路径
    map_path = os.path.abspath(args.map_path)
    if ".codemaker" in map_path:
        print(f"[ERR] 禁止生成到 .codemaker 目录: {map_path}")
        sys.exit(1)
    
    print("=" * 60)
    print("   Y3 物编生成器 v4.0 (AI 协作版)")
    print("=" * 60)
    print(f"  地图路径: {map_path}")
    
    # 加载多语言
    lang_data = load_language(map_path)
    id_counters = {}
    generated = []
    
    # 确定要生成的单位列表
    units_to_generate = []
    
    if args.config:
        # 从 JSON 文件读取
        with open(args.config, 'r', encoding='utf-8') as f:
            units_to_generate = json.load(f)
        print(f"  从配置文件加载 {len(units_to_generate)} 个单位")
    
    elif args.batch:
        # 从批量字符串解析
        units_to_generate = parse_batch_string(args.batch)
        print(f"  批量模式: {len(units_to_generate)} 个单位")
    
    elif args.name and args.type and args.model:
        # 单个单位
        config = {
            'name': args.name,
            'type': args.type,
            'model': args.model,
        }
        if args.icon:
            config['icon'] = args.icon
        if args.projectile:
            config['projectile'] = args.projectile
        if args.hit_effect:
            config['hit_effect'] = args.hit_effect
        if args.id:
            config['id'] = args.id
        units_to_generate = [config]
    
    else:
        print("  [ERR] 请指定 --name/--type/--model 或 --batch 或 --config")
        sys.exit(1)
    
    # 生成单位
    print()
    for config in units_to_generate:
        result = generate_unit(map_path, config, id_counters, lang_data)
        if result:
            generated.append(result)
    
    # 保存多语言
    save_language(map_path, lang_data)
    
    print()
    print(f"  [DONE] 成功生成 {len(generated)} 个单位")
    print(f"  [INFO] 多语言已更新: {os.path.join(map_path, 'zhlanguage.json')}")
    print("=" * 60)
    
    # 返回生成的 ID 列表（供脚本调用）
    return generated


if __name__ == "__main__":
    main()
