#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Y3 非单位物编生成器 v1.0

专门用于生成技能、魔法效果、投射物、物品的物编 JSON。
单位物编请使用 y3_obj_gen_ai.py。

使用方式:
    # 生成技能
    py -3 y3_obj_generator.py -m "maps/EntryMap" -t ability -n "火球术" --id 100001001 --icon 100508
    
    # 生成魔法效果
    py -3 y3_obj_generator.py -m "maps/EntryMap" -t modifier -n "燃烧" --id 100001101 --type 2
    
    # 生成投射物
    py -3 y3_obj_generator.py -m "maps/EntryMap" -t projectile -n "火球弹道" --id 100001201 --effect 100430
    
    # 生成物品
    py -3 y3_obj_generator.py -m "maps/EntryMap" -t item -n "治疗药水" --id 500001 --icon 100000
    
    # 批量生成（从 JSON 配置）
    py -3 y3_obj_generator.py -m "maps/EntryMap" --config objects.json

JSON 配置格式:
    [
        {"type": "ability", "name": "火球术", "id": 100001001, "icon": 100508, "cooldown": "8", "cost": "70"},
        {"type": "modifier", "name": "燃烧", "id": 100001101, "modifier_type": 2},
        {"type": "projectile", "name": "火球弹道", "id": 100001201, "effect": 100430},
        {"type": "item", "name": "治疗药水", "id": 500001, "icon": 100000, "stack": 5}
    ]
"""

import argparse
import json
import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
SKILL_DIR = os.path.dirname(SCRIPT_DIR)
TEMPLATE_DIR = os.path.join(SKILL_DIR, "data_template")

# 物编类型配置
OBJ_TYPE_CONFIG = {
    'ability': {
        'template': '主动技能模板.json',
        'folder': 'abilityall',
        'id_start': 100001001,
        'desc': '技能'
    },
    'modifier': {
        'template': '魔法效果模板.json',
        'folder': 'modifierall',
        'id_start': 100001101,
        'desc': '魔法效果'
    },
    'projectile': {
        'template': '投射物模板.json',
        'folder': 'projectileall',
        'id_start': 100001201,
        'desc': '投射物'
    },
    'item': {
        'template': '物品模板.json',
        'folder': 'editoritem',
        'id_start': 500001,
        'desc': '物品'
    }
}


def xencode(s):
    """编码字符串为 bytes"""
    if isinstance(s, bytes):
        return s
    return s.encode('utf-8')


def murmur3_hash(key, seed=0):
    """32-bit murmur3 hash，返回有符号整数（与 Y3 引擎一致）"""
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

    unsigned_val = fmix(h1 ^ length)
    if unsigned_val & 0x80000000 == 0:
        return unsigned_val
    else:
        return -((unsigned_val ^ 0xFFFFFFFF) + 1)


def get_next_id(map_path, obj_type):
    """获取下一个可用 ID"""
    config = OBJ_TYPE_CONFIG.get(obj_type)
    if not config:
        return None
    
    output_dir = os.path.join(map_path, "editor_table", config['folder'])
    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        return config['id_start']
    
    existing_ids = []
    for f in os.listdir(output_dir):
        if f.endswith('.json'):
            try:
                obj_id = int(f.replace('.json', ''))
                existing_ids.append(obj_id)
            except:
                pass
    
    if existing_ids:
        return max(existing_ids) + 1
    return config['id_start']


def load_template(obj_type):
    """加载模板"""
    config = OBJ_TYPE_CONFIG.get(obj_type)
    if not config:
        raise ValueError(f"不支持的物编类型: {obj_type}")
    
    template_path = os.path.join(TEMPLATE_DIR, config['template'])
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


def make_tuple(items):
    """创建 Y3 的 __tuple__ 格式"""
    return {"__tuple__": True, "items": items}


def generate_ability(map_path, obj_config, lang_data):
    """
    生成技能物编
    
    obj_config: {
        "name": "火球术",           # 必填
        "id": 100001001,            # 可选 - 不指定则自动分配
        "icon": 100508,             # 可选 - 技能图标
        "cooldown": "8",            # 可选 - 冷却时间
        "cost": "70",               # 可选 - 魔法消耗
        "damage": "150",            # 可选 - 技能伤害
        "range": "10.0",            # 可选 - 施法距离
        "damage_range": "3.0",      # 可选 - 伤害范围
        "sight_type": 0,            # 可选 - 释放方式 (0=立即, 1=圆形, 2=扇形, 3=箭头, 4=选目标)
        "is_immediate": true,       # 可选 - 是否立即释放
        "is_meele": false,          # 可选 - 是否近战
        "max_level": 5,             # 可选 - 最大等级
        "description": "描述文本"    # 可选 - 技能描述
    }
    """
    name = obj_config.get('name')
    if not name:
        print(f"  [ERR] 配置缺少必填字段 name: {obj_config}")
        return None
    
    # 确定 ID
    obj_id = obj_config.get('id')
    if not obj_id:
        obj_id = get_next_id(map_path, 'ability')
    
    # 检查是否已存在
    config = OBJ_TYPE_CONFIG['ability']
    output_dir = os.path.join(map_path, "editor_table", config['folder'])
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f"{obj_id}.json")
    
    if os.path.exists(output_path):
        print(f"  [WARN] 跳过 {obj_id}: 文件已存在")
        return None
    
    # 加载模板
    data = load_template('ability')
    
    # 基础字段
    data['key'] = obj_id
    data['uid'] = str(obj_id)
    
    # 名称（多语言）
    name_key = murmur3_hash(name)
    data['name'] = name_key
    lang_data[str(name_key)] = name
    
    # 描述
    desc = obj_config.get('description', name)
    desc_key = murmur3_hash(f"{name}_desc")
    data['description'] = desc_key
    lang_data[str(desc_key)] = desc
    
    # 图标
    if 'icon' in obj_config:
        data['ability_icon'] = obj_config['icon']
    
    # 冷却时间
    if 'cooldown' in obj_config:
        data['cold_down_time'] = make_tuple([str(obj_config['cooldown'])])
    
    # 魔法消耗
    if 'cost' in obj_config:
        data['ability_cost'] = make_tuple([str(obj_config['cost'])])
    
    # 技能伤害
    if 'damage' in obj_config:
        data['ability_damage'] = make_tuple([str(obj_config['damage'])])
    
    # 施法距离
    if 'range' in obj_config:
        data['ability_cast_range'] = make_tuple([str(obj_config['range'])])
    
    # 伤害范围
    if 'damage_range' in obj_config:
        data['ability_damage_range'] = make_tuple([str(obj_config['damage_range'])])
    
    # 释放方式
    if 'sight_type' in obj_config:
        data['sight_type'] = obj_config['sight_type']
    
    # 是否立即释放
    if 'is_immediate' in obj_config:
        data['is_immediate'] = obj_config['is_immediate']
    
    # 是否近战
    if 'is_meele' in obj_config:
        data['is_meele'] = obj_config['is_meele']
    
    # 最大等级
    if 'max_level' in obj_config:
        data['ability_max_level'] = obj_config['max_level']
    
    # 保存 JSON
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"  [OK] 技能 {obj_id}: {name}")
    return obj_id


def generate_modifier(map_path, obj_config, lang_data):
    """
    生成魔法效果物编
    
    obj_config: {
        "name": "燃烧",             # 必填
        "id": 100001101,            # 可选 - 不指定则自动分配
        "modifier_type": 2,         # 可选 - 1=增益, 2=减益
        "icon": 100008,             # 可选 - 图标
        "layer_max": 1,             # 可选 - 最大层数
        "cycle_time": 1,            # 可选 - 周期时间（DOT用）
        "disappear_when_dead": true, # 可选 - 死亡消失
        "show_on_ui": true,         # 可选 - UI显示
        "material_color": [255, 100, 100], # 可选 - 材质颜色
        "halo_effect": 0,           # 可选 - 光环特效
        "influence_rng": 0,         # 可选 - 影响范围（光环用）
        "description": "描述文本"    # 可选 - 描述
    }
    """
    name = obj_config.get('name')
    if not name:
        print(f"  [ERR] 配置缺少必填字段 name: {obj_config}")
        return None
    
    # 确定 ID
    obj_id = obj_config.get('id')
    if not obj_id:
        obj_id = get_next_id(map_path, 'modifier')
    
    # 检查是否已存在
    config = OBJ_TYPE_CONFIG['modifier']
    output_dir = os.path.join(map_path, "editor_table", config['folder'])
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f"{obj_id}.json")
    
    if os.path.exists(output_path):
        print(f"  [WARN] 跳过 {obj_id}: 文件已存在")
        return None
    
    # 加载模板
    data = load_template('modifier')
    
    # 基础字段
    data['key'] = obj_id
    data['uid'] = str(obj_id)
    
    # 名称（多语言）
    name_key = murmur3_hash(name)
    data['name'] = name_key
    lang_data[str(name_key)] = name
    
    # 描述
    desc = obj_config.get('description', name)
    desc_key = murmur3_hash(f"{name}_desc")
    data['description'] = desc_key
    lang_data[str(desc_key)] = desc
    
    # Buff类型
    if 'modifier_type' in obj_config:
        data['modifier_type'] = obj_config['modifier_type']
    
    # 图标
    if 'icon' in obj_config:
        data['modifier_icon'] = obj_config['icon']
    
    # 最大层数
    if 'layer_max' in obj_config:
        data['layer_max'] = obj_config['layer_max']
    
    # 周期时间
    if 'cycle_time' in obj_config:
        data['cycle_time'] = obj_config['cycle_time']
    
    # 死亡消失
    if 'disappear_when_dead' in obj_config:
        data['disappear_when_dead'] = obj_config['disappear_when_dead']
    
    # UI显示
    if 'show_on_ui' in obj_config:
        data['show_on_ui'] = obj_config['show_on_ui']
    
    # 材质颜色
    if 'material_color' in obj_config:
        data['material_color'] = make_tuple(obj_config['material_color'])
    
    # 光环特效
    if 'halo_effect' in obj_config:
        data['halo_effect'] = obj_config['halo_effect']
    
    # 影响范围
    if 'influence_rng' in obj_config:
        data['influence_rng'] = obj_config['influence_rng']
    
    # 保存 JSON
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"  [OK] 魔法效果 {obj_id}: {name}")
    return obj_id


def generate_projectile(map_path, obj_config, lang_data):
    """
    生成投射物物编
    
    obj_config: {
        "name": "火球弹道",         # 必填
        "id": 100001201,            # 可选 - 不指定则自动分配
        "effect": 100430,           # 可选 - 特效ID
        "model": 103014,            # 可选 - 模型ID
        "max_duration": 60,         # 可选 - 最大持续时间
        "move_channel": 0,          # 可选 - 移动通道
        "scale": [1.0, 1.0, 1.0],   # 可选 - 缩放
        "description": "描述文本"    # 可选 - 描述
    }
    """
    name = obj_config.get('name')
    if not name:
        print(f"  [ERR] 配置缺少必填字段 name: {obj_config}")
        return None
    
    # 确定 ID
    obj_id = obj_config.get('id')
    if not obj_id:
        obj_id = get_next_id(map_path, 'projectile')
    
    # 检查是否已存在
    config = OBJ_TYPE_CONFIG['projectile']
    output_dir = os.path.join(map_path, "editor_table", config['folder'])
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f"{obj_id}.json")
    
    if os.path.exists(output_path):
        print(f"  [WARN] 跳过 {obj_id}: 文件已存在")
        return None
    
    # 加载模板
    data = load_template('projectile')
    
    # 基础字段
    data['key'] = obj_id
    data['uid'] = str(obj_id)
    
    # 名称（多语言）
    name_key = murmur3_hash(name)
    data['name'] = name_key
    lang_data[str(name_key)] = name
    
    # 描述
    desc = obj_config.get('description', name)
    desc_key = murmur3_hash(f"{name}_desc")
    data['description'] = desc_key
    lang_data[str(desc_key)] = desc
    
    # 特效配置
    effect_id = obj_config.get('effect', 100430)
    model_id = obj_config.get('model', 103014)
    scale = obj_config.get('scale', [1.0, 1.0, 1.0])
    
    effect_config = make_tuple([
        effect_id,
        [0.0, 0.0, 0.0],  # 位置偏移
        [0.0, 0.0, 0.0],  # 旋转
        scale,             # 缩放
        1.0,               # 透明度
        {
            "anim": "idle1",
            "base_color_mod": 1,
            "base_tint_color": [255, 255, 255, 0.5],
            "is_loop": True,
            "model": model_id,
            "model_opacity": 1,
            "offset": [0, 0, 0],
            "rotate": [0, 0, 0],
            "scale": [1, 1, 1],
            "use_base_tint_color": False
        }
    ])
    
    data['effect_foes'] = effect_config
    data['effect_friend'] = effect_config
    
    # 最大持续时间
    if 'max_duration' in obj_config:
        data['max_duration'] = obj_config['max_duration']
    
    # 移动通道
    if 'move_channel' in obj_config:
        data['move_channel'] = obj_config['move_channel']
    
    # 保存 JSON
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"  [OK] 投射物 {obj_id}: {name}")
    return obj_id


def generate_item(map_path, obj_config, lang_data):
    """
    生成物品物编
    
    obj_config: {
        "name": "治疗药水",         # 必填
        "id": 500001,               # 可选 - 不指定则自动分配
        "icon": 100000,             # 可选 - 物品图标
        "model": 10022,             # 可选 - 掉落物模型
        "level": 1,                 # 可选 - 物品等级
        "stack": 5,                 # 可选 - 最大堆叠数量
        "charge": 5,                # 可选 - 最大充能数量
        "auto_use": false,          # 可选 - 是否自动使用
        "discard_enable": true,     # 可选 - 可丢弃
        "sale_enable": true,        # 可选 - 可出售
        "buy_price": 100,           # 可选 - 购买价格（金币）
        "sell_price": 50,           # 可选 - 出售价格（金币）
        "hp_max": 0,                # 可选 - 附加最大生命
        "strength": 0,              # 可选 - 附加力量
        "agility": 0,               # 可选 - 附加敏捷
        "intelligence": 0,          # 可选 - 附加智力
        "ability": 0,               # 可选 - 绑定主动技能ID
        "passive_ability": 0,       # 可选 - 绑定被动技能ID
        "description": "描述文本"    # 可选 - 描述
    }
    """
    name = obj_config.get('name')
    if not name:
        print(f"  [ERR] 配置缺少必填字段 name: {obj_config}")
        return None
    
    # 确定 ID
    obj_id = obj_config.get('id')
    if not obj_id:
        obj_id = get_next_id(map_path, 'item')
    
    # 检查是否已存在
    config = OBJ_TYPE_CONFIG['item']
    output_dir = os.path.join(map_path, "editor_table", config['folder'])
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, f"{obj_id}.json")
    
    if os.path.exists(output_path):
        print(f"  [WARN] 跳过 {obj_id}: 文件已存在")
        return None
    
    # 加载模板
    data = load_template('item')
    
    # 基础字段
    data['key'] = obj_id
    data['uid'] = str(obj_id)
    
    # 名称（多语言）
    name_key = murmur3_hash(name)
    data['name'] = name_key
    lang_data[str(name_key)] = name
    
    # 描述
    desc = obj_config.get('description', name)
    desc_key = murmur3_hash(f"{name}_desc")
    data['description'] = desc_key
    lang_data[str(desc_key)] = desc
    
    # 图标
    if 'icon' in obj_config:
        data['icon'] = obj_config['icon']
    
    # 掉落物模型
    if 'model' in obj_config:
        data['model'] = obj_config['model']
    
    # 物品等级
    if 'level' in obj_config:
        data['level'] = obj_config['level']
    
    # 堆叠数量
    if 'stack' in obj_config:
        data['maximum_stacking'] = obj_config['stack']
        data['max_stock'] = obj_config['stack']
        data['init_stock'] = obj_config['stack']
    
    # 充能数量
    if 'charge' in obj_config:
        data['maximum_charging'] = obj_config['charge']
    
    # 自动使用
    if 'auto_use' in obj_config:
        data['auto_use'] = obj_config['auto_use']
    
    # 可丢弃
    if 'discard_enable' in obj_config:
        data['discard_enable'] = obj_config['discard_enable']
    
    # 可出售
    if 'sale_enable' in obj_config:
        data['sale_enable'] = obj_config['sale_enable']
    
    # 购买价格
    if 'buy_price' in obj_config:
        data['buy_res_list'] = make_tuple([["gold", obj_config['buy_price']]])
    
    # 出售价格
    if 'sell_price' in obj_config:
        data['sell_res_list'] = make_tuple([["gold", obj_config['sell_price']]])
    
    # 附加属性
    if 'hp_max' in obj_config:
        data['attached_hp_max'] = float(obj_config['hp_max'])
    if 'strength' in obj_config:
        data['attached_strength'] = float(obj_config['strength'])
    if 'agility' in obj_config:
        data['attached_agility'] = float(obj_config['agility'])
    if 'intelligence' in obj_config:
        data['attached_intelligence'] = float(obj_config['intelligence'])
    
    # 绑定技能
    if 'ability' in obj_config and obj_config['ability']:
        data['attached_ability'] = make_tuple([obj_config['ability']])
    if 'passive_ability' in obj_config and obj_config['passive_ability']:
        data['attached_passive_abilities'] = make_tuple([obj_config['passive_ability']])
    
    # 保存 JSON
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"  [OK] 物品 {obj_id}: {name}")
    return obj_id


def generate_object(map_path, obj_config, lang_data):
    """根据类型分发到对应的生成函数"""
    obj_type = obj_config.get('type')
    
    if obj_type == 'ability':
        return generate_ability(map_path, obj_config, lang_data)
    elif obj_type == 'modifier':
        return generate_modifier(map_path, obj_config, lang_data)
    elif obj_type == 'projectile':
        return generate_projectile(map_path, obj_config, lang_data)
    elif obj_type == 'item':
        return generate_item(map_path, obj_config, lang_data)
    else:
        print(f"  [ERR] 不支持的物编类型: {obj_type}")
        print(f"     支持的类型: ability, modifier, projectile, item")
        return None


def main():
    parser = argparse.ArgumentParser(description="Y3 非单位物编生成器 v1.0")
    parser.add_argument("-m", "--map-path", required=True, help="地图路径")
    
    # 单个物编模式
    parser.add_argument("-t", "--type", choices=['ability', 'modifier', 'projectile', 'item'],
                        help="物编类型")
    parser.add_argument("-n", "--name", help="物编名称")
    parser.add_argument("--id", type=int, help="物编 ID")
    parser.add_argument("--icon", type=int, help="图标 ID")
    
    # 技能专用参数
    parser.add_argument("--cooldown", help="冷却时间")
    parser.add_argument("--cost", help="魔法消耗")
    parser.add_argument("--damage", help="技能伤害")
    parser.add_argument("--range", help="施法距离")
    parser.add_argument("--damage-range", help="伤害范围")
    parser.add_argument("--sight-type", type=int, help="释放方式 (0-4)")
    parser.add_argument("--immediate", action="store_true", help="立即释放")
    parser.add_argument("--meele", action="store_true", help="近战技能")
    parser.add_argument("--max-level", type=int, help="最大等级")
    
    # 魔法效果专用参数
    parser.add_argument("--modifier-type", type=int, help="Buff类型 (1=增益, 2=减益)")
    parser.add_argument("--layer-max", type=int, help="最大层数")
    parser.add_argument("--cycle-time", type=float, help="周期时间")
    
    # 投射物专用参数
    parser.add_argument("--effect", type=int, help="特效 ID")
    parser.add_argument("--model", type=int, help="模型 ID")
    parser.add_argument("--max-duration", type=int, help="最大持续时间")
    
    # 物品专用参数
    parser.add_argument("--stack", type=int, help="最大堆叠数量")
    parser.add_argument("--charge", type=int, help="最大充能数量")
    parser.add_argument("--buy-price", type=int, help="购买价格")
    parser.add_argument("--sell-price", type=int, help="出售价格")
    parser.add_argument("--ability", type=int, help="绑定主动技能ID")
    
    # 描述
    parser.add_argument("--desc", help="描述文本")
    
    # 批量模式
    parser.add_argument("--config", help="从 JSON 文件读取配置")
    
    args = parser.parse_args()
    
    # 验证地图路径
    map_path = os.path.abspath(args.map_path)
    if ".codemaker" in map_path:
        print(f"[ERR] 禁止生成到 .codemaker 目录: {map_path}")
        sys.exit(1)
    
    print("=" * 60)
    print("   Y3 非单位物编生成器 v1.0")
    print("=" * 60)
    print(f"  地图路径: {map_path}")
    
    # 加载多语言
    lang_data = load_language(map_path)
    generated = []
    
    # 确定要生成的物编列表
    objects_to_generate = []
    
    if args.config:
        # 从 JSON 文件读取
        with open(args.config, 'r', encoding='utf-8') as f:
            objects_to_generate = json.load(f)
        print(f"  从配置文件加载 {len(objects_to_generate)} 个物编")
    
    elif args.type and args.name:
        # 单个物编
        config = {
            'type': args.type,
            'name': args.name,
        }
        if args.id:
            config['id'] = args.id
        if args.icon:
            config['icon'] = args.icon
        if args.desc:
            config['description'] = args.desc
        
        # 技能参数
        if args.cooldown:
            config['cooldown'] = args.cooldown
        if args.cost:
            config['cost'] = args.cost
        if args.damage:
            config['damage'] = args.damage
        if args.range:
            config['range'] = args.range
        if args.damage_range:
            config['damage_range'] = args.damage_range
        if args.sight_type is not None:
            config['sight_type'] = args.sight_type
        if args.immediate:
            config['is_immediate'] = True
        if args.meele:
            config['is_meele'] = True
        if args.max_level:
            config['max_level'] = args.max_level
        
        # 魔法效果参数
        if args.modifier_type:
            config['modifier_type'] = args.modifier_type
        if args.layer_max:
            config['layer_max'] = args.layer_max
        if args.cycle_time:
            config['cycle_time'] = args.cycle_time
        
        # 投射物参数
        if args.effect:
            config['effect'] = args.effect
        if args.model:
            config['model'] = args.model
        if args.max_duration:
            config['max_duration'] = args.max_duration
        
        # 物品参数
        if args.stack:
            config['stack'] = args.stack
        if args.charge:
            config['charge'] = args.charge
        if args.buy_price:
            config['buy_price'] = args.buy_price
        if args.sell_price:
            config['sell_price'] = args.sell_price
        if args.ability:
            config['ability'] = args.ability
        
        objects_to_generate = [config]
    
    else:
        print("  [ERR] 请指定 --type/--name 或 --config")
        print()
        print("  示例:")
        print('    py -3 y3_obj_generator.py -m "maps/EntryMap" -t ability -n "火球术" --cooldown 8 --cost 70')
        print('    py -3 y3_obj_generator.py -m "maps/EntryMap" -t modifier -n "燃烧" --modifier-type 2')
        print('    py -3 y3_obj_generator.py -m "maps/EntryMap" -t projectile -n "火球弹道" --effect 100430')
        print('    py -3 y3_obj_generator.py -m "maps/EntryMap" -t item -n "治疗药水" --stack 5 --buy-price 100')
        print('    py -3 y3_obj_generator.py -m "maps/EntryMap" --config objects.json')
        sys.exit(1)
    
    # 生成物编
    print()
    for config in objects_to_generate:
        result = generate_object(map_path, config, lang_data)
        if result:
            generated.append(result)
    
    # 保存多语言
    save_language(map_path, lang_data)
    
    print()
    print(f"  [DONE] 成功生成 {len(generated)} 个物编")
    print(f"  [INFO] 多语言已更新: {os.path.join(map_path, 'zhlanguage.json')}")
    print("=" * 60)
    
    # 返回生成的 ID 列表（供脚本调用）
    return generated


if __name__ == "__main__":
    main()