#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import json
import os
import shutil
import sys
import mmh3

# 脚本所在目录
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
SKILL_DIR = os.path.dirname(SCRIPT_DIR)
CODEMAKER_DIR = os.path.dirname(os.path.dirname(SKILL_DIR))  # .codemaker
PROJECT_ROOT = os.path.dirname(CODEMAKER_DIR)  # 项目根目录
TEMPLATE_DIR = os.path.join(SKILL_DIR, "data")


def resolve_map_path(map_path: str) -> str:
    """
    解析地图路径，支持相对路径和绝对路径
    - 绝对路径：直接返回
    - 相对路径：基于项目根目录解析
    """
    if os.path.isabs(map_path):
        return map_path
    
    # 相对路径：基于项目根目录解析
    resolved_path = os.path.join(PROJECT_ROOT, map_path)
    return os.path.normpath(resolved_path)


# ============================================================================
# 单位相关配置
# ============================================================================

# 单位类型与模板映射
UNIT_TYPE_TEMPLATE_MAP = {
    "近战小怪": "jzxg.json",
    "远程小怪": "ycxg.json",
    "近战精英": "jzboss.json",
    "远程精英": "ycboss.json",
    "近战boss": "jzboss.json",
    "远程boss": "ycboss.json",
    "近战英雄": "jzyx.json",
    "远程英雄": "ycyx.json",
    "建筑": "jz.json",
}

# 单位可选属性参数及其类型
UNIT_ATTRIBUTES = {
    "name": str,
    "description": str,
    "model": int,
    "icon": int,
    "hp_max": float,
    "hp_max_grow": float,
    "mp_max": float,
    "mp_max_grow": float,
    "attack_phy": float,
    "attack_phy_grow": float,
    "attack_mag": float,
    "defense_phy": float,
    "defense_mag": float,
    "attack_speed": float,
    "attack_interval": float,
    "common_atk_type": int,
    "ori_speed": float,
    "turn_speed": float,
    "sight_range": float,
    "attack_range": float,
    # 索敌/警戒/视野相关字段（实测补充）
    # 单位均为「米」（实测换算：运行时 `unit:get_attr('vision_rng')` = 物编值 × 100，与
    # attack_range 2.5 → 250 一致）。
    #
    # ⭐ alarm_range / cancel_alarm_range 才是「警戒索敌」范围：
    #   证据：怪物模板 data/jz.json 中 alarm_range=8.0、cancel_alarm_range=10.0，
    #   且 default_behaviour_type="caution"（警戒行为）。
    #   实测：alarm_range=8 时，距目标 6m 的怪物会主动前压，
    #   而距 20m 的怪物 100 秒内完全不动（不索敌、不移动）。
    #   把 alarm_range 调到覆盖全图后，远处怪物即可主动扑向目标。
    #   对照实验还证明以下字段「不是」索敌半径（调大后 20m 仍静止）：
    #     vision_rng / vision_night（仅视野，运行时 set_attr 也改不动 AI 取值）、
    #     counterattack_range（模板默认 0；运行时 set_attr 完全无效）。
    #   ⚠️ 这些字段都只能改物编，运行时 `set_attr` 无效。
    "alarm_range": float,
    "cancel_alarm_range": float,
    "vision_rng": float,
    "vision_night": float,
    "counterattack_range": float,
    "reward_exp": float,
    "reward_official_res_1": float,
    "hero_ability_list": "tuple",
    "common_ability_list": "tuple",
    "build_time": float,
    "move_channel": int,
    "build_ignore_dyn_collision": bool,
    "dynamic_collision_r": float,
    "collision_radius_2": float,
    "collision_points": "json",
    "collision_box_turning_enable": bool,
    "path_finding_external_size": int,
}


# ============================================================================
# 技能相关配置
# ============================================================================

# 技能可选属性参数及其类型
ABILITY_ATTRIBUTES = {
    "name": str,
    "description": str,
    "ability_icon": int,
    "ability_max_level": int,
    "sight_type": int,
    "ability_cast_type": int,
    "ability_cast_point": float,
    "ability_bw_point": float,
    "is_immediate": bool,
    "is_meele": bool,
    # 等级数组类型（tuple_str）
    "cold_down_time": "tuple_str",
    "ability_cost": "tuple_str",
    "ability_hp_cost": "tuple_str",
    "ability_damage": "tuple_str",
    "ability_damage_range": "tuple_str",
    "ability_cast_range": "tuple_str",
    "circle_radius": "tuple_str",
    "sector_radius": "tuple_str",
    "sector_angle": "tuple_str",
    "arrow_length": "tuple_str",
    "arrow_width": "tuple_str",
    # 整数数组类型（tuple_int）
    "required_level": "tuple_int",
    "build_list": "tuple_int",
    "ability_build_subtype": int,
}


# ============================================================================
# 物品相关配置
# ============================================================================

# 物品可选属性参数及其类型
ITEM_ATTRIBUTES = {
    "name": str,
    "description": str,
    "icon": int,
    "model": int,
    "level": int,
    # 堆叠与充能
    "maximum_stacking": int,
    "maximum_charging": int,
    "cur_stack": int,
    "cur_charge": int,
    # 物品行为
    "auto_use": bool,
    "use_consume": int,
    "discard_enable": bool,
    "discard_when_dead": bool,
    "delete_on_discard": bool,
    "sale_enable": bool,
    "drop_stay_time": int,
    "hp_max": int,
    # 附加属性（写入 JSON 时为 5 元素数组：[基础属性, 基础加成, 增益属性, 增益加成, 总属性加成]）
    "attached_hp_max": "item_attached",
    "attached_hp_rec": "item_attached",
    "attached_mp_max": "item_attached",
    "attached_mp_rec": "item_attached",
    "attached_attack_phy": "item_attached",
    "attached_attack_mag": "item_attached",
    "attached_defense_phy": "item_attached",
    "attached_defense_mag": "item_attached",
    "attached_strength": "item_attached",
    "attached_agility": "item_attached",
    "attached_intelligence": "item_attached",
    "attached_critical_chance": "item_attached",
    "attached_critical_dmg": "item_attached",
    "attached_dodge_rate": "item_attached",
    "attached_hit_rate": "item_attached",
    "attached_pene_phy": "item_attached",
    "attached_pene_mag": "item_attached",
    "attached_attack_speed": "item_attached",
    "attached_move_speed": "item_attached",
    # 技能绑定（tuple_int）
    "attached_ability": "tuple_int",
    "attached_passive_abilities": "tuple_int",
}


# ============================================================================
# 魔法效果相关配置
# ============================================================================

# 魔法效果可选属性参数及其类型
MODIFIER_ATTRIBUTES = {
    "name": str,
    "description": str,
    "modifier_icon": int,
    "modifier_type": int,
    "modifier_effect": int,
    "layer_max": int,
    "disappear_when_dead": bool,
    "show_on_ui": bool,
    "shield_value": float,
    "shield_type": int,
    "influence_rng": float,
    "is_influence_self": bool,
    # 材质颜色（tuple_int）
    "material_color": "tuple_int",
}


# ============================================================================
# 投射物相关配置
# ============================================================================

# 投射物可选属性参数及其类型
PROJECTILE_ATTRIBUTES = {
    "name": str,
    "description": str,
    "icon": int,
    "max_duration": float,
    "move_channel": int,
    "move_limitation": int,
    "sfx_loop": bool,
    # 特效ID（只修改 items[0]）
    "effect_foes": "effect_id",
    "effect_friend": "effect_id",
    "effect_fly": "effect_id",
}


# ============================================================================
# 通用函数
# ============================================================================

def murmur3_hash(text: str) -> int:
    """计算 murmur3 hash 用于多语言 TID"""
    return mmh3.hash(text, signed=True)


def parse_tuple_string(tuple_str: str) -> dict:
    """
    解析 tuple 字符串格式（用于单位技能列表）
    输入: "100001001:1,100001002:2"
    输出: {"__tuple__": true, "items": [[100001001, 1], [100001002, 2]]}
    """
    if not tuple_str:
        return {"__tuple__": True, "items": []}
    
    items = []
    for pair in tuple_str.split(","):
        if ":" in pair:
            parts = pair.split(":")
            items.append([int(parts[0]), int(parts[1])])
        else:
            items.append([int(pair)])
    
    return {"__tuple__": True, "items": items}


def parse_tuple_str_array(value_str: str) -> dict:
    """
    解析 tuple 字符串数组格式（用于技能等级数值）
    输入: "8,7,6,5,4"
    输出: {"__tuple__": true, "items": ["8", "7", "6", "5", "4"]}
    """
    if not value_str:
        return {"__tuple__": True, "items": []}
    
    items = [v.strip() for v in value_str.split(",")]
    return {"__tuple__": True, "items": items}


def parse_tuple_int_array(value_str: str) -> dict:
    """
    解析 tuple 整数数组格式
    输入: "1,3,5,7,9" 或 "100001001,100001002"
    输出: {"__tuple__": true, "items": [1, 3, 5, 7, 9]}
    """
    if not value_str:
        return {"__tuple__": True, "items": []}
    
    items = [int(v.strip()) for v in value_str.split(",")]
    return {"__tuple__": True, "items": items}


def parse_attached_attr(value) -> list:
    """
    解析物品附加属性，输出 5 元素数组格式。
    数组含义：[基础属性, 基础加成, 增益属性, 增益加成, 总属性加成]
    支持两种输入格式：
      - 5 个逗号分隔值：  "50.0,0.0,0.0,0.0,0.0"  → [50.0, 0.0, 0.0, 0.0, 0.0]
      - 单个值（兼容旧格式）：50 / "50" / 50.0       → [50.0, 0.0, 0.0, 0.0, 0.0]
    """
    s = str(value).strip()
    if "," in s:
        parts = [p.strip() for p in s.split(",")]
        if len(parts) != 5:
            raise ValueError(
                f"attached_* 属性需要恰好 5 个逗号分隔的值（基础属性,基础加成,增益属性,增益加成,总属性加成），"
                f"实际收到 {len(parts)} 个：{s}"
            )
        return [float(p) for p in parts]
    else:
        return [float(s), 0.0, 0.0, 0.0, 0.0]


def update_language_file(map_path: str, name: str, description: str = ""):
    """更新多语言文件"""
    lang_path = os.path.join(map_path, "zhlanguage.json")
    
    if os.path.exists(lang_path):
        with open(lang_path, "r", encoding="utf-8") as f:
            lang_data = json.load(f)
    else:
        lang_data = {}
    
    # 计算 TID
    name_tid = murmur3_hash(name)
    desc_tid = murmur3_hash(description) if description else 0
    
    # 添加多语言
    lang_data[str(name_tid)] = name
    if description:
        lang_data[str(desc_tid)] = description
    
    with open(lang_path, "w", encoding="utf-8") as f:
        json.dump(lang_data, f, ensure_ascii=False, indent=4)
    
    print(f"✅ 已更新多语言文件: {lang_path}")
    
    return name_tid, desc_tid


# ============================================================================
# 单位相关函数
# ============================================================================

def load_unit_template(unit_type: str) -> dict:
    """加载单位模板"""
    template_file = UNIT_TYPE_TEMPLATE_MAP.get(unit_type)
    if not template_file:
        raise ValueError(f"未知的单位类型: {unit_type}，支持的类型: {list(UNIT_TYPE_TEMPLATE_MAP.keys())}")
    
    template_path = os.path.join(TEMPLATE_DIR, template_file)
    if not os.path.exists(template_path):
        raise FileNotFoundError(f"模板文件不存在: {template_path}")
    
    with open(template_path, "r", encoding="utf-8") as f:
        return json.load(f)


def load_unit_json(map_path: str, unit_id: int) -> dict:
    """加载已有单位 JSON"""
    unit_path = os.path.join(map_path, "editor_table", "editorunit", f"{unit_id}.json")
    if not os.path.exists(unit_path):
        raise FileNotFoundError(f"单位文件不存在: {unit_path}")
    
    with open(unit_path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_unit_json(map_path: str, unit_id: int, data: dict):
    """保存单位 JSON"""
    unit_dir = os.path.join(map_path, "editor_table", "editorunit")
    os.makedirs(unit_dir, exist_ok=True)
    
    unit_path = os.path.join(unit_dir, f"{unit_id}.json")
    with open(unit_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"✅ 已保存单位物编: {unit_path}")


# ---------------------------------------------------------------------------
# 普攻「有效字段」同步 + 写入后回读校验（新增）
#
# 背景（踩坑取证）：单位实际生效的普攻射程 / 攻击间隔在 simple_common_atk 里，
# 根级 attack_range / attack_interval 只是镜像。只写根级时命令照样"成功"，
# MCP 回读根级也确实变了，但真正生效的是模板自带的 simple_common_atk.*，
# 表现就是"改了没效果"。
# 另外 common_atk_range 不在 UNIT_ATTRIBUTES 表里，所以 -create 的通用循环会
# 直接跳过它（-edit 有专门分支才生效）—— 这是"同参数 create 无效、edit 有效"的根因。
# ---------------------------------------------------------------------------

_SIMPLE_ATK_SYNC = {
    # 命令行参数名 -> simple_common_atk 内的字段名
    "common_atk_range": "attack_range",
    "attack_range": "attack_range",
    "attack_interval": "attack_interval",
}


def sync_simple_common_atk(data: dict, args: argparse.Namespace) -> list:
    """把根级普攻字段同步进 simple_common_atk；返回给调用方打印的说明行。"""
    atk = data.get("simple_common_atk")
    if not isinstance(atk, dict):
        return ["   ⚠️ 该模板没有 simple_common_atk，跳过普攻有效字段同步"]
    lines = []
    for arg_name, atk_key in _SIMPLE_ATK_SYNC.items():
        value = getattr(args, arg_name, None)
        if value is None:
            continue
        v = float(value)
        if arg_name == "common_atk_range":
            data["attack_range"] = v
        old = atk.get(atk_key)
        atk[atk_key] = v
        lines.append(f"   ↳ simple_common_atk.{atk_key}: {old} → {v}（实际生效值）")
    return lines


def _num_eq(a, b) -> bool:
    try:
        return abs(float(a) - float(b)) < 1e-4
    except (TypeError, ValueError):
        return False


def _existing_object_keys(map_path: str, table: str):
    """返回某类物编已存在的 Key 集合；目录不存在时返回 None（表示无法校验，不误报）。"""
    d = os.path.join(map_path, "editor_table", table)
    if not os.path.isdir(d):
        return None
    return {os.path.splitext(f)[0] for f in os.listdir(d) if f.endswith(".json")}


def verify_unit_saved(map_path: str, unit_id: int, args: argparse.Namespace):
    """保存后回读校验：请求值 vs 落盘值（含 simple_common_atk 有效值），不一致就报警。"""
    try:
        data = load_unit_json(map_path, unit_id)
    except FileNotFoundError:
        return
    atk = data.get("simple_common_atk")
    atk = atk if isinstance(atk, dict) else {}

    # 引用物编 Key 的存在性校验。
    # 证据（实测）：`-hero_ability_list` 里写了**不存在的技能 ID**（把 100001*1000+1
    # 误写成字符串拼接 1000011），脚本照单全收、回读也"通过"，但英雄身上挂的是空技能
    # → 技能栏空白、QWER 无反应。这里必须校验引用的 Key 真的在 editor_table 里。
    ref_ids = []
    for field in ("hero_ability_list", "common_ability_list", "passive_ability_list"):
        tup = data.get(field)
        items = tup.get("items") if isinstance(tup, dict) else None
        for it in (items or []):
            if isinstance(it, list) and it:
                ref_ids.append(it[0])
            elif isinstance(it, (int, str)):
                ref_ids.append(it)
    known_abilities = _existing_object_keys(map_path, "abilityall")
    if ref_ids and known_abilities is not None:
        missing = [i for i in ref_ids if str(i) not in known_abilities]
        print("\n🔎 引用校验（`hero_ability_list` / `common_ability_list` 等引用的技能 Key）")
        if missing:
            print("  ⚠️ 有 %d/%d 个技能 Key 在 editor_table/abilityall 里找不到：%s"
                  % (len(missing), len(ref_ids), missing))
            print("     → 单位身上会挂空技能：界面不显示、快捷键无反应。请先确认技能物编已生成。")
        else:
            print("  ✅ %d 个技能 Key 全部存在" % len(ref_ids))

    rows, bad = [], []
    for attr_name, attr_type in UNIT_ATTRIBUTES.items():
        if attr_type == "tuple" or attr_name in ("name", "description", "model", "icon"):
            continue
        want = getattr(args, attr_name, None)
        if want is None:
            continue
        got = data.get(attr_name)
        if attr_type == "json":
            try:
                want_parsed = json.loads(want)
            except (TypeError, ValueError):
                want_parsed = want
            got_items = got.get("items") if isinstance(got, dict) else got
            ok = got_items == want_parsed
            rows.append((attr_name, want_parsed, got_items, None, None, ok, True))
            if not ok:
                bad.append(attr_name)
            continue
        ok = _num_eq(got, want)
        eff_key = _SIMPLE_ATK_SYNC.get(attr_name)
        eff = atk.get(eff_key) if eff_key else None
        eff_ok = True if eff_key is None else _num_eq(eff, want)
        rows.append((attr_name, want, got, eff_key, eff, ok, eff_ok))
        if not ok or not eff_ok:
            bad.append(attr_name)

    cr = getattr(args, "common_atk_range", None)
    if cr is not None:
        eff_ok = _num_eq(atk.get("attack_range"), cr)
        rows.append(("common_atk_range", cr, data.get("attack_range"),
                     "attack_range", atk.get("attack_range"),
                     _num_eq(data.get("attack_range"), cr), eff_ok))
        if not eff_ok:
            bad.append("common_atk_range")

    if not rows:
        return
    print("\n🔎 回读校验（请求值 vs 落盘值）")
    for attr_name, want, got, eff_key, eff, ok, eff_ok in rows:
        mark = "✅" if (ok and eff_ok) else "⚠️"
        eff_txt = "" if eff_key is None else f"｜实际生效 simple_common_atk.{eff_key}={eff}"
        print(f"   {mark} {attr_name}: 请求={want} 落盘={got}{eff_txt}")
    if bad:
        print("\n⚠️ 以下字段与请求值不一致，编辑器里可能看不到预期效果：" + ", ".join(bad))
        print("   排查：① 是否被模板默认值覆盖（用 -edit 二次应用）；② 真正生效的字段是否在 simple_common_atk 内。")
    else:
        print("   ✅ 全部一致")


def apply_unit_attributes(data: dict, args: argparse.Namespace, unit_id: int = None, map_path: str = None):
    """应用单位属性到数据"""
    for attr_name, attr_type in UNIT_ATTRIBUTES.items():
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "tuple":
                data[attr_name] = parse_tuple_string(value)
            elif attr_type == "json":
                data[attr_name] = {"__tuple__": True, "items": json.loads(value)}
            elif attr_name in ("name", "description"):
                # 名称和描述需要更新多语言文件
                if map_path and unit_id:
                    name_val = getattr(args, "name", None) or ""
                    desc_val = getattr(args, "description", None) or ""
                    name_tid, desc_tid = update_language_file(map_path, name_val, desc_val)
                    if attr_name == "name":
                        data["name"] = name_tid
                    else:
                        data["description"] = desc_tid
            else:
                data[attr_name] = attr_type(value)
    if getattr(args, "unit_type", None) is not None:
        data["type"] = int(args.unit_type)

    # 特殊处理：根级字段同步进 simple_common_atk（真正生效的普攻技能字段）
    for line in sync_simple_common_atk(data, args):
        print(line)


def create_unit(args: argparse.Namespace):
    """创建单位"""
    # 解析 create 参数: 单位ID,名称,类型,模型ID,头像ID
    parts = args.create.split(",")
    if len(parts) != 5:
        raise ValueError("create 参数格式错误，应为: 单位ID,名称,类型,模型ID,头像ID")
    
    unit_id = int(parts[0].strip())
    name = parts[1].strip()
    unit_type = parts[2].strip()
    model_id = int(parts[3].strip())
    icon_id = int(parts[4].strip())
    
    print(f"📦 创建单位: ID={unit_id}, 名称={name}, 类型={unit_type}")
    
    # 加载模板
    data = load_unit_template(unit_type)
    
    # 设置基础属性
    data["key"] = unit_id
    data["uid"] = str(unit_id)
    data["_ref_"] = unit_id
    data["model"] = model_id
    data["icon"] = icon_id
    
    # 更新多语言并设置 name TID
    description = getattr(args, "description", None) or name
    name_tid, desc_tid = update_language_file(args.map, name, description)
    data["name"] = name_tid
    data["description"] = desc_tid
    
    # 应用可选属性（排除 name 和 description，因为已经处理过）
    for attr_name, attr_type in UNIT_ATTRIBUTES.items():
        if attr_name in ("name", "description"):
            continue
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "tuple":
                data[attr_name] = parse_tuple_string(value)
            elif attr_type == "json":
                data[attr_name] = {"__tuple__": True, "items": json.loads(value)}
            else:
                data[attr_name] = attr_type(value)
    if getattr(args, "unit_type", None) is not None:
        data["type"] = int(args.unit_type)

    # 普攻有效字段同步（-common_atk_range 不在 UNIT_ATTRIBUTES 里，必须在这里补）
    for line in sync_simple_common_atk(data, args):
        print(line)

    # 保存
    save_unit_json(args.map, unit_id, data)
    verify_unit_saved(args.map, unit_id, args)

    return unit_id


def edit_unit(args: argparse.Namespace):
    """编辑单位"""
    unit_id = int(args.edit)
    
    print(f"✏️ 编辑单位: ID={unit_id}")
    
    # 加载已有数据
    data = load_unit_json(args.map, unit_id)
    
    # 应用属性
    apply_unit_attributes(data, args, unit_id, args.map)
    
    # 保存
    save_unit_json(args.map, unit_id, data)

    verify_unit_saved(args.map, unit_id, args)

    return unit_id


# ============================================================================
# 技能相关函数
# ============================================================================

def load_ability_template() -> dict:
    """加载技能模板"""
    template_path = os.path.join(TEMPLATE_DIR, "jn.json")
    if not os.path.exists(template_path):
        raise FileNotFoundError(f"模板文件不存在: {template_path}")
    
    with open(template_path, "r", encoding="utf-8") as f:
        return json.load(f)


def load_ability_json(map_path: str, ability_id: int) -> dict:
    """加载已有技能 JSON"""
    ability_path = os.path.join(map_path, "editor_table", "abilityall", f"{ability_id}.json")
    if not os.path.exists(ability_path):
        raise FileNotFoundError(f"技能文件不存在: {ability_path}")
    
    with open(ability_path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_ability_json(map_path: str, ability_id: int, data: dict):
    """保存技能 JSON"""
    ability_dir = os.path.join(map_path, "editor_table", "abilityall")
    os.makedirs(ability_dir, exist_ok=True)
    
    ability_path = os.path.join(ability_dir, f"{ability_id}.json")
    with open(ability_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"✅ 已保存技能物编: {ability_path}")


def apply_ability_attributes(data: dict, args: argparse.Namespace, ability_id: int = None, map_path: str = None):
    """应用技能属性到数据"""
    for attr_name, attr_type in ABILITY_ATTRIBUTES.items():
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "tuple_str":
                data[attr_name] = parse_tuple_str_array(value)
            elif attr_type == "tuple_int":
                tuple_data = parse_tuple_int_array(value)
                # required_level 字段需要特殊包装
                if attr_name == "required_level":
                    data[attr_name] = {"formula": "", "required_levels": tuple_data}
                else:
                    data[attr_name] = tuple_data
            elif attr_name in ("name", "description"):
                # 名称和描述需要更新多语言文件
                if map_path and ability_id:
                    name_val = getattr(args, "name", None) or ""
                    desc_val = getattr(args, "description", None) or ""
                    name_tid, desc_tid = update_language_file(map_path, name_val, desc_val)
                    if attr_name == "name":
                        data["name"] = name_tid
                    elif desc_tid:
                        data["description"] = desc_tid
            elif attr_type == bool:
                data[attr_name] = value.lower() in ("true", "1", "yes") if isinstance(value, str) else bool(value)
            else:
                data[attr_name] = attr_type(value)


def create_ability(args: argparse.Namespace):
    """创建技能"""
    # 解析 create 参数: 技能ID,名称,图标ID
    parts = args.create.split(",")
    if len(parts) != 3:
        raise ValueError("create 参数格式错误，应为: 技能ID,名称,图标ID")
    
    ability_id = int(parts[0].strip())
    name = parts[1].strip()
    icon_id = int(parts[2].strip())
    
    print(f"📦 创建技能: ID={ability_id}, 名称={name}")
    
    # 加载模板
    data = load_ability_template()
    
    # 设置基础属性
    data["key"] = ability_id
    data["uid"] = str(ability_id)
    data["_ref_"] = ability_id
    data["ability_icon"] = icon_id
    
    # 更新多语言并设置 name TID
    description = getattr(args, "description", None) or name
    name_tid, desc_tid = update_language_file(args.map, name, description)
    data["name"] = name_tid
    if desc_tid:
        data["description"] = desc_tid
    
    # 应用可选属性（排除 name 和 description，因为已经处理过）
    for attr_name, attr_type in ABILITY_ATTRIBUTES.items():
        if attr_name in ("name", "description", "ability_icon"):
            continue
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "tuple_str":
                data[attr_name] = parse_tuple_str_array(value)
            elif attr_type == "tuple_int":
                tuple_data = parse_tuple_int_array(value)
                # required_level 字段需要特殊包装
                if attr_name == "required_level":
                    data[attr_name] = {"formula": "", "required_levels": tuple_data}
                else:
                    data[attr_name] = tuple_data
            elif attr_type == bool:
                data[attr_name] = value.lower() in ("true", "1", "yes") if isinstance(value, str) else bool(value)
            else:
                data[attr_name] = attr_type(value)
    
    # 保存
    save_ability_json(args.map, ability_id, data)
    
    return ability_id


def edit_ability(args: argparse.Namespace):
    """编辑技能"""
    ability_id = int(args.edit)
    
    print(f"✏️ 编辑技能: ID={ability_id}")
    
    # 加载已有数据
    data = load_ability_json(args.map, ability_id)
    
    # 应用属性
    apply_ability_attributes(data, args, ability_id, args.map)
    
    # 保存
    save_ability_json(args.map, ability_id, data)
    
    return ability_id


# ============================================================================
# 物品相关函数
# ============================================================================

def load_item_template() -> dict:
    """加载物品模板"""
    template_path = os.path.join(TEMPLATE_DIR, "wp.json")
    if not os.path.exists(template_path):
        raise FileNotFoundError(f"模板文件不存在: {template_path}")
    
    with open(template_path, "r", encoding="utf-8") as f:
        return json.load(f)


def load_item_json(map_path: str, item_id: int) -> dict:
    """加载已有物品 JSON"""
    item_path = os.path.join(map_path, "editor_table", "editoritem", f"{item_id}.json")
    if not os.path.exists(item_path):
        raise FileNotFoundError(f"物品文件不存在: {item_path}")
    
    with open(item_path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_item_json(map_path: str, item_id: int, data: dict):
    """保存物品 JSON"""
    item_dir = os.path.join(map_path, "editor_table", "editoritem")
    os.makedirs(item_dir, exist_ok=True)
    
    item_path = os.path.join(item_dir, f"{item_id}.json")
    with open(item_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"✅ 已保存物品物编: {item_path}")


def apply_item_attributes(data: dict, args: argparse.Namespace, item_id: int = None, map_path: str = None):
    """应用物品属性到数据"""
    for attr_name, attr_type in ITEM_ATTRIBUTES.items():
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "item_attached":
                data[attr_name] = parse_attached_attr(value)
            elif attr_type == "tuple_int":
                data[attr_name] = parse_tuple_int_array(value)
            elif attr_name in ("name", "description"):
                # 名称和描述需要更新多语言文件
                if map_path and item_id:
                    name_val = getattr(args, "name", None) or ""
                    desc_val = getattr(args, "description", None) or ""
                    name_tid, desc_tid = update_language_file(map_path, name_val, desc_val)
                    if attr_name == "name":
                        data["name"] = name_tid
                    elif desc_tid:
                        data["description"] = desc_tid
            elif attr_type == bool:
                data[attr_name] = value.lower() in ("true", "1", "yes") if isinstance(value, str) else bool(value)
            else:
                data[attr_name] = attr_type(value)


def create_item(args: argparse.Namespace):
    """创建物品"""
    # 解析 create 参数: 物品ID,名称,图标ID
    parts = args.create.split(",")
    if len(parts) != 3:
        raise ValueError("create 参数格式错误，应为: 物品ID,名称,图标ID")
    
    item_id = int(parts[0].strip())
    name = parts[1].strip()
    icon_id = int(parts[2].strip())
    
    print(f"📦 创建物品: ID={item_id}, 名称={name}")
    
    # 加载模板
    data = load_item_template()
    
    # 设置基础属性
    data["key"] = item_id
    data["uid"] = str(item_id)
    data["_ref_"] = item_id
    data["icon"] = icon_id
    
    # 更新多语言并设置 name TID
    description = getattr(args, "description", None) or name
    name_tid, desc_tid = update_language_file(args.map, name, description)
    data["name"] = name_tid
    if desc_tid:
        data["description"] = desc_tid
    
    # 应用可选属性（排除 name 和 description，因为已经处理过）
    for attr_name, attr_type in ITEM_ATTRIBUTES.items():
        if attr_name in ("name", "description", "icon"):
            continue
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "item_attached":
                data[attr_name] = parse_attached_attr(value)
            elif attr_type == "tuple_int":
                data[attr_name] = parse_tuple_int_array(value)
            elif attr_type == bool:
                data[attr_name] = value.lower() in ("true", "1", "yes") if isinstance(value, str) else bool(value)
            else:
                data[attr_name] = attr_type(value)
    
    # 保存
    save_item_json(args.map, item_id, data)
    
    return item_id


def edit_item(args: argparse.Namespace):
    """编辑物品"""
    item_id = int(args.edit)
    
    print(f"✏️ 编辑物品: ID={item_id}")
    
    # 加载已有数据
    data = load_item_json(args.map, item_id)
    
    # 应用属性
    apply_item_attributes(data, args, item_id, args.map)
    
    # 保存
    save_item_json(args.map, item_id, data)
    
    return item_id


# ============================================================================
# 魔法效果相关函数
# ============================================================================

def load_modifier_template() -> dict:
    """加载魔法效果模板"""
    template_path = os.path.join(TEMPLATE_DIR, "mfxg.json")
    if not os.path.exists(template_path):
        raise FileNotFoundError(f"模板文件不存在: {template_path}")
    
    with open(template_path, "r", encoding="utf-8") as f:
        return json.load(f)


def load_modifier_json(map_path: str, modifier_id: int) -> dict:
    """加载已有魔法效果 JSON"""
    modifier_path = os.path.join(map_path, "editor_table", "modifierall", f"{modifier_id}.json")
    if not os.path.exists(modifier_path):
        raise FileNotFoundError(f"魔法效果文件不存在: {modifier_path}")
    
    with open(modifier_path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_modifier_json(map_path: str, modifier_id: int, data: dict):
    """保存魔法效果 JSON"""
    modifier_dir = os.path.join(map_path, "editor_table", "modifierall")
    os.makedirs(modifier_dir, exist_ok=True)
    
    modifier_path = os.path.join(modifier_dir, f"{modifier_id}.json")
    with open(modifier_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"✅ 已保存魔法效果物编: {modifier_path}")


def apply_modifier_attributes(data: dict, args: argparse.Namespace, modifier_id: int = None, map_path: str = None):
    """应用魔法效果属性到数据"""
    for attr_name, attr_type in MODIFIER_ATTRIBUTES.items():
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "tuple_int":
                data[attr_name] = parse_tuple_int_array(value)
            elif attr_name in ("name", "description"):
                # 名称和描述需要更新多语言文件
                if map_path and modifier_id:
                    name_val = getattr(args, "name", None) or ""
                    desc_val = getattr(args, "description", None) or ""
                    name_tid, desc_tid = update_language_file(map_path, name_val, desc_val)
                    if attr_name == "name":
                        data["name"] = name_tid
                    elif desc_tid:
                        data["description"] = desc_tid
            elif attr_type == bool:
                data[attr_name] = value.lower() in ("true", "1", "yes") if isinstance(value, str) else bool(value)
            else:
                data[attr_name] = attr_type(value)


def create_modifier(args: argparse.Namespace):
    """创建魔法效果"""
    # 解析 create 参数: 效果ID,名称,图标ID
    parts = args.create.split(",")
    if len(parts) != 3:
        raise ValueError("create 参数格式错误，应为: 效果ID,名称,图标ID")
    
    modifier_id = int(parts[0].strip())
    name = parts[1].strip()
    icon_id = int(parts[2].strip())
    
    print(f"📦 创建魔法效果: ID={modifier_id}, 名称={name}")
    
    # 加载模板
    data = load_modifier_template()
    
    # 设置基础属性
    data["key"] = modifier_id
    data["uid"] = str(modifier_id)
    data["_ref_"] = modifier_id
    data["modifier_icon"] = icon_id
    
    # 更新多语言并设置 name TID
    description = getattr(args, "description", None) or name
    name_tid, desc_tid = update_language_file(args.map, name, description)
    data["name"] = name_tid
    if desc_tid:
        data["description"] = desc_tid
    
    # 走与 -edit 相同的属性应用逻辑，避免 create / edit 两套代码漂移。
    apply_modifier_attributes(data, args, modifier_id, args.map)
    
    # 保存
    save_modifier_json(args.map, modifier_id, data)

    # 回读关键字段。物编热更/保存时若模板覆盖了新对象，这里能第一时间暴露。
    saved = load_modifier_json(args.map, modifier_id)
    print("🔎 回读校验（魔法效果关键字段）")
    for key in ("modifier_type", "modifier_effect", "shield_value", "shield_type", "layer_max"):
        print(f"   {key}: {saved.get(key)}")
    if getattr(args, "shield_value", None) is not None:
        try:
            expected = float(args.shield_value)
            actual = float(saved.get("shield_value", 0) or 0)
            if abs(expected - actual) > 1e-6:
                print(
                    f"   ⚠️ shield_value 请求={expected} 落盘={actual}；"
                    f"请在热更/保存后再执行一次 -edit {modifier_id} -shield_value {expected}"
                )
        except (TypeError, ValueError):
            pass
    
    return modifier_id


def edit_modifier(args: argparse.Namespace):
    """编辑魔法效果"""
    modifier_id = int(args.edit)
    
    print(f"✏️ 编辑魔法效果: ID={modifier_id}")
    
    # 加载已有数据
    data = load_modifier_json(args.map, modifier_id)
    
    # 应用属性
    apply_modifier_attributes(data, args, modifier_id, args.map)
    
    # 保存
    save_modifier_json(args.map, modifier_id, data)
    
    return modifier_id


# ============================================================================
# 投射物相关函数
# ============================================================================

def load_projectile_template() -> dict:
    """加载投射物模板"""
    template_path = os.path.join(TEMPLATE_DIR, "tsw.json")
    if not os.path.exists(template_path):
        raise FileNotFoundError(f"模板文件不存在: {template_path}")
    
    with open(template_path, "r", encoding="utf-8") as f:
        return json.load(f)


def load_projectile_json(map_path: str, projectile_id: int) -> dict:
    """加载已有投射物 JSON"""
    projectile_path = os.path.join(map_path, "editor_table", "projectileall", f"{projectile_id}.json")
    if not os.path.exists(projectile_path):
        raise FileNotFoundError(f"投射物文件不存在: {projectile_path}")
    
    with open(projectile_path, "r", encoding="utf-8") as f:
        return json.load(f)


def save_projectile_json(map_path: str, projectile_id: int, data: dict):
    """保存投射物 JSON"""
    projectile_dir = os.path.join(map_path, "editor_table", "projectileall")
    os.makedirs(projectile_dir, exist_ok=True)
    
    projectile_path = os.path.join(projectile_dir, f"{projectile_id}.json")
    with open(projectile_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    
    print(f"✅ 已保存投射物物编: {projectile_path}")


def apply_projectile_attributes(data: dict, args: argparse.Namespace, projectile_id: int = None, map_path: str = None):
    """应用投射物属性到数据"""
    for attr_name, attr_type in PROJECTILE_ATTRIBUTES.items():
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "effect_id":
                # 特效ID：支持两种格式
                # 格式1: {"__tuple__": true, "items": [id, ...]} （旧格式 effect_foes/effect_friend）
                # 格式2: [id, ...] 直接数组（新格式 effect_fly 等）
                effect_id = int(value)
                if attr_name in data:
                    field = data[attr_name]
                    if isinstance(field, dict) and "items" in field:
                        field["items"][0] = effect_id
                    elif isinstance(field, list) and len(field) > 0:
                        field[0] = effect_id
            elif attr_name in ("name", "description"):
                # 名称和描述需要更新多语言文件
                if map_path and projectile_id:
                    name_val = getattr(args, "name", None) or ""
                    desc_val = getattr(args, "description", None) or ""
                    name_tid, desc_tid = update_language_file(map_path, name_val, desc_val)
                    if attr_name == "name":
                        data["name"] = name_tid
                    elif desc_tid:
                        data["description"] = desc_tid
            elif attr_type == bool:
                data[attr_name] = value.lower() in ("true", "1", "yes") if isinstance(value, str) else bool(value)
            else:
                data[attr_name] = attr_type(value)


def create_projectile(args: argparse.Namespace):
    """创建投射物"""
    # 解析 create 参数: 投射物ID,名称,图标ID
    parts = args.create.split(",")
    if len(parts) != 3:
        raise ValueError("create 参数格式错误，应为: 投射物ID,名称,图标ID")
    
    projectile_id = int(parts[0].strip())
    name = parts[1].strip()
    icon_id = int(parts[2].strip())
    
    print(f"📦 创建投射物: ID={projectile_id}, 名称={name}")
    
    # 加载模板
    data = load_projectile_template()
    
    # 设置基础属性
    data["key"] = projectile_id
    data["uid"] = str(projectile_id)
    data["_ref_"] = projectile_id
    data["icon"] = icon_id
    
    # 更新多语言并设置 name TID
    description = getattr(args, "description", None) or name
    name_tid, desc_tid = update_language_file(args.map, name, description)
    data["name"] = name_tid
    if desc_tid:
        data["description"] = desc_tid
    
    # 应用可选属性（排除 name 和 description，因为已经处理过）
    for attr_name, attr_type in PROJECTILE_ATTRIBUTES.items():
        if attr_name in ("name", "description", "icon"):
            continue
        value = getattr(args, attr_name, None)
        if value is not None:
            if attr_type == "effect_id":
                # 特效ID：支持两种格式
                # 格式1: {"__tuple__": true, "items": [id, ...]}
                # 格式2: [id, ...] 直接数组
                effect_id = int(value)
                if attr_name in data:
                    field = data[attr_name]
                    if isinstance(field, dict) and "items" in field:
                        field["items"][0] = effect_id
                    elif isinstance(field, list) and len(field) > 0:
                        field[0] = effect_id
            else:
                data[attr_name] = attr_type(value)
    
    # 保存
    save_projectile_json(args.map, projectile_id, data)
    
    return projectile_id


def edit_projectile(args: argparse.Namespace):
    """编辑投射物"""
    projectile_id = int(args.edit)
    
    print(f"✏️ 编辑投射物: ID={projectile_id}")
    
    # 加载已有数据
    data = load_projectile_json(args.map, projectile_id)
    
    # 应用属性
    apply_projectile_attributes(data, args, projectile_id, args.map)
    
    # 保存
    save_projectile_json(args.map, projectile_id, data)
    
    return projectile_id


# ============================================================================
# 主函数
# ============================================================================

_OBJECT_TABLE = {
    "unit": "editorunit",
    "ability": "abilityall",
    "item": "editoritem",
    "modifier": "modifierall",
    "projectile": "projectileall",
}


def delete_object(args: argparse.Namespace):
    """删除物编文件，并保留一份备份。"""
    object_id = str(args.delete).strip()
    table = _OBJECT_TABLE[args.type]
    object_path = os.path.join(args.map, "editor_table", table, f"{object_id}.json")
    if not os.path.isfile(object_path):
        raise FileNotFoundError(f"物编文件不存在: {object_path}")

    backup_dir = os.path.join(args.map, ".deleted_object_backup")
    os.makedirs(backup_dir, exist_ok=True)
    backup_path = os.path.join(backup_dir, f"{table}_{object_id}.json")
    shutil.copy2(object_path, backup_path)
    os.remove(object_path)
    print(f"🗑️ 已删除物编: {object_path}")
    print(f"   备份: {backup_path}")
    print("⚠️ 编辑器内存里可能仍保留该物编；请立刻 restart_editor(save_before_restart=false)，")
    print("   并在那之前不要 save_editor，否则它会被写回磁盘。")


def main():
    parser = argparse.ArgumentParser(description="Y3 物编编辑脚本")
    
    # 必选参数
    parser.add_argument("-map", required=True, help="地图路径，如 maps/EntryMap")
    parser.add_argument("-type", required=True, choices=["unit", "ability", "item", "modifier", "projectile"], help="物编类型")
    
    # 操作模式（二选一）
    parser.add_argument("-create", help="创建物编 (unit: ID,名称,类型,模型ID,头像ID; 其他: ID,名称,图标ID)")
    parser.add_argument("-edit", help="编辑物编：物编ID")
    parser.add_argument("-delete", help="删除物编：物编ID（会备份到 maps/<地图>/.deleted_object_backup/）")
    
    # 收集所有已注册的参数名
    registered_attrs = set()
    
    # 单位可选属性参数
    for attr_name, attr_type in UNIT_ATTRIBUTES.items():
        registered_attrs.add(attr_name)
        if attr_type == float:
            parser.add_argument(f"-{attr_name}", type=float, help=f"[单位] {attr_name}")
        elif attr_type == int:
            parser.add_argument(f"-{attr_name}", type=int, help=f"[单位] {attr_name}")
        else:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[单位] {attr_name}")
    parser.add_argument("-unit_type", type=int, help="[单位] 单位分类（1=英雄，2=建筑，4=小怪）")

    # 单位特殊参数：同时更新 simple_common_atk.attack_range（实际战斗射程）
    parser.add_argument("-common_atk_range", type=float,
                        help="[单位] 实际战斗射程，同步写入根级 attack_range 与 simple_common_atk.attack_range")
    
    # 技能可选属性参数
    for attr_name, attr_type in ABILITY_ATTRIBUTES.items():
        if attr_name in registered_attrs:
            continue
        registered_attrs.add(attr_name)
        if attr_type == float:
            parser.add_argument(f"-{attr_name}", type=float, help=f"[技能] {attr_name}")
        elif attr_type == int:
            parser.add_argument(f"-{attr_name}", type=int, help=f"[技能] {attr_name}")
        elif attr_type == bool:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[技能] {attr_name} (true/false)")
        else:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[技能] {attr_name}")
    
    # 物品可选属性参数
    for attr_name, attr_type in ITEM_ATTRIBUTES.items():
        if attr_name in registered_attrs:
            continue
        registered_attrs.add(attr_name)
        if attr_type == float:
            parser.add_argument(f"-{attr_name}", type=float, help=f"[物品] {attr_name}")
        elif attr_type == int:
            parser.add_argument(f"-{attr_name}", type=int, help=f"[物品] {attr_name}")
        elif attr_type == bool:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[物品] {attr_name} (true/false)")
        else:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[物品] {attr_name}")
    
    # 魔法效果可选属性参数
    for attr_name, attr_type in MODIFIER_ATTRIBUTES.items():
        if attr_name in registered_attrs:
            continue
        registered_attrs.add(attr_name)
        if attr_type == float:
            parser.add_argument(f"-{attr_name}", type=float, help=f"[魔法效果] {attr_name}")
        elif attr_type == int:
            parser.add_argument(f"-{attr_name}", type=int, help=f"[魔法效果] {attr_name}")
        elif attr_type == bool:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[魔法效果] {attr_name} (true/false)")
        else:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[魔法效果] {attr_name}")
    
    # 投射物可选属性参数
    for attr_name, attr_type in PROJECTILE_ATTRIBUTES.items():
        if attr_name in registered_attrs:
            continue
        registered_attrs.add(attr_name)
        if attr_type == float:
            parser.add_argument(f"-{attr_name}", type=float, help=f"[投射物] {attr_name}")
        elif attr_type == int:
            parser.add_argument(f"-{attr_name}", type=int, help=f"[投射物] {attr_name}")
        elif attr_type == bool:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[投射物] {attr_name} (true/false)")
        else:
            parser.add_argument(f"-{attr_name}", type=str, help=f"[投射物] {attr_name}")
    
    args = parser.parse_args()
    
    # 解析地图路径（支持相对路径和绝对路径）
    args.map = resolve_map_path(args.map)
    
    # 验证操作模式
    modes = [x for x in (args.create, args.edit, args.delete) if x]
    if not modes:
        parser.error("必须指定 -create、-edit 或 -delete 参数")
    if len(modes) > 1:
        parser.error("-create / -edit / -delete 不能同时使用")
    
    # 执行操作
    try:
        if args.delete:
            delete_object(args)
            print("✅ 操作完成！")
            return
        if args.type == "unit":
            if args.create:
                create_unit(args)
            else:
                edit_unit(args)
        elif args.type == "ability":
            if args.create:
                create_ability(args)
            else:
                edit_ability(args)
        elif args.type == "item":
            if args.create:
                create_item(args)
            else:
                edit_item(args)
        elif args.type == "modifier":
            if args.create:
                create_modifier(args)
            else:
                edit_modifier(args)
        elif args.type == "projectile":
            if args.create:
                create_projectile(args)
            else:
                edit_projectile(args)
        
        print("✅ 操作完成！")
        
    except Exception as e:
        print(f"❌ 错误: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
