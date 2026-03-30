# -*- coding: utf-8 -*-
"""
水体配置生成脚本
生成符合 Y3 引擎格式的水体材质配置
"""

import json
import os

# 水体配置数据
# 格式: mat_id -> 水体属性
WATER_CONFIGS = {
    1: {
        "name": "水",
        "color": [0.26, 0.62, 0.88, 0.6],  # 蓝色半透明
        "flow_speed": 0.5,
        "flow_direction": 0.0,
        "flow_perturbation": 0.1,
    },
    2: {
        "name": "岩浆",
        "color": [0.9, 0.2, 0.1, 0.8],  # 红色不透明
        "flow_speed": 0.3,
        "flow_direction": 0.0,
        "flow_perturbation": 0.2,
    },
    3: {
        "name": "河水",
        "color": [0.65, 0.55, 0.35, 0.5],  # 浑黄色
        "flow_speed": 0.6,
        "flow_direction": 180.0,  # 从北向南流
        "flow_perturbation": 0.15,
    },
    4: {
        "name": "湖水",
        "color": [0.3, 0.75, 0.5, 0.55],  # 清澈绿色
        "flow_speed": 0.1,
        "flow_direction": 0.0,
        "flow_perturbation": 0.05,
    },
    5: {
        "name": "东海海水",
        "color": [0.15, 0.35, 0.55, 0.65],  # 深蓝色
        "flow_speed": 0.4,
        "flow_direction": 270.0,  # 从东向西流
        "flow_perturbation": 0.12,
    },
}


def create_water_material(mat_id, name=None, color=None, flow_speed=None, 
                          flow_direction=None, flow_perturbation=None):
    """
    创建单个水体材质配置
    
    Args:
        mat_id: 材质ID
        name: 水体名称（可选）
        color: RGBA 颜色列表（可选）
        flow_speed: 流速（可选）
        flow_direction: 流向角度（可选）
        flow_perturbation: 流动扰动（可选）
    
    Returns:
        dict: 符合 Y3 引擎格式的水体配置
    """
    config = WATER_CONFIGS.get(mat_id, WATER_CONFIGS[1])
    
    # 使用提供的值或默认值
    final_name = name or config["name"]
    final_color = color or config["color"]
    final_flow_speed = flow_speed if flow_speed is not None else config["flow_speed"]
    final_flow_direction = flow_direction if flow_direction is not None else config["flow_direction"]
    final_flow_perturbation = flow_perturbation if flow_perturbation is not None else config["flow_perturbation"]
    
    return {
        "color": {
            "__tuple__": True,
            "items": final_color
        },
        "custom_color": True,
        "flow_direction": final_flow_direction,
        "flow_perturbation": final_flow_perturbation,
        "flow_speed": final_flow_speed,
        "mat_id": mat_id,
        "name": final_name,
        "original": False  # 新增水体必须为 False
    }


def generate_all_water_materials():
    """生成所有水体材质配置"""
    water_materials = []
    
    for mat_id in sorted(WATER_CONFIGS.keys()):
        water = create_water_material(mat_id)
        water_materials.append(water)
    
    return water_materials


def generate_shanghai_waters():
    """
    生成上海地形使用的水体配置
    根据之前的水体分配规则:
    - 黄浦江: mat_id=3 (河水)
    - 淀山湖: mat_id=4 (湖水)
    - 东海: mat_id=5 (东海海水)
    - 沿海浅水/深水: mat_id=5 (东海海水)
    """
    shanghai_waters = [
        # 黄浦江 - 河水
        create_water_material(
            mat_id=3,
            name="黄浦江",
            color=[0.65, 0.55, 0.35, 0.5],
            flow_speed=0.66,
            flow_direction=243.43,
            flow_perturbation=0.11
        ),
        # 淀山湖 - 湖水
        create_water_material(
            mat_id=4,
            name="淀山湖",
            color=[0.3, 0.75, 0.5, 0.55],
            flow_speed=0.2,
            flow_direction=45.0,
            flow_perturbation=0.05
        ),
        # 东海海水 - 东海
        create_water_material(
            mat_id=5,
            name="东海",
            color=[0.15, 0.35, 0.55, 0.65],
            flow_speed=0.5,
            flow_direction=270.0,
            flow_perturbation=0.12
        ),
    ]
    
    return shanghai_waters


def save_water_config(water_materials, output_path):
    """保存水体配置到 JSON 文件"""
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(water_materials, f, indent=4, ensure_ascii=False)
    
    print(f"水体配置已保存到: {output_path}")


if __name__ == "__main__":
    output_dir = r"h:\y3_ai_agent\skills\y3-gen-terrain\scripts\1_height_map\output"
    
    # 生成所有水体配置
    all_waters = generate_all_water_materials()
    save_water_config(all_waters, os.path.join(output_dir, "all_water_materials.json"))
    
    # 生成上海水体配置
    shanghai_waters = generate_shanghai_waters()
    save_water_config(shanghai_waters, os.path.join(output_dir, "shanghai_water_materials.json"))
    
    # 打印示例
    print("\n示例水体配置（黄浦江）:")
    print(json.dumps(shanghai_waters[0], indent=2, ensure_ascii=False))