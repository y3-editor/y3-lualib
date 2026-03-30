#!/usr/bin/env python3
"""
上海地形纹理图生成脚本
根据高度图生成对应的纹理图（256x256）
仅生成地形纹理：(<地形纹理ID>, <强度>)
水体和悬崖纹理记录到第一阶段
"""

import csv
import codecs
import re

# 配置
HEIGHT_MAP_PATH = "h:/y3_ai_agent/skills/y3-gen-terrain/scripts/1_height_map/output/shanghai_terrain.csv"
OUTPUT_PATH = "h:/y3_ai_agent/skills/y3-gen-terrain/scripts/2_texture_map/output/shanghai_texture.csv"

# 导入完整的纹理映射表
from terrain_textures import TERRAIN_TEXTURES

# ============================================
# 上海市区边界锚点（顺时针，从最上/入海口开始）
# 用于判断格子是否在市区范围内
# ============================================
SHANGHAI_CITY_ANCHORS = [
    (31.386631, 121.511656),  # 1. 最上，入海口
    (31.332395, 121.648500),  # 2.
    (31.158631, 121.654273),  # 3.
    (31.115141, 121.463155),  # 4.
    (31.080531, 121.373658),  # 5.
    (31.193212, 121.310722),  # 6. 虹桥机场
    (31.262336, 121.352872),  # 7.
    (31.329436, 121.354604),  # 8.
    (31.375786, 121.482786),  # 9.
    (31.413100, 121.477859),  # 10.
]

# 经纬度范围（与第一阶段保持一致）
LAT_MIN = 30.699588   # 南/下
LAT_MAX = 31.491193   # 北/上
LON_MIN = 120.910576  # 西/左
LON_MAX = 121.970006  # 东/右

LAT_RANGE = LAT_MAX - LAT_MIN
LON_RANGE = LON_MAX - LON_MIN


def lat_lon_to_px_py(lat, lon):
    """将经纬度转换为归一化的px, py坐标"""
    px = (lon - LON_MIN) / LON_RANGE
    py = (LAT_MAX - lat) / LAT_RANGE  # y轴反转：北=0
    return px, py


# 预计算市区多边形顶点（归一化坐标）
CITY_POLYGON_VERTICES = [lat_lon_to_px_py(lat, lon) for lat, lon in SHANGHAI_CITY_ANCHORS]


def point_in_polygon(px, py, vertices):
    """射线法判断点是否在多边形内"""
    n = len(vertices)
    inside = False
    
    j = n - 1
    for i in range(n):
        xi, yi = vertices[i]
        xj, yj = vertices[j]
        
        if ((yi > py) != (yj > py)) and (px < (xj - xi) * (py - yi) / (yj - yi) + xi):
            inside = not inside
        j = i
    
    return inside


def is_in_city(x, y, grid_size):
    """判断点(x,y)是否在上海市区内"""
    px = float(x) / float(grid_size)
    py = float(y) / float(grid_size)
    return point_in_polygon(px, py, CITY_POLYGON_VERTICES)


# 纹理分配策略：根据地理位置和高度范围
# 优先级：1. 市区内 -> 方整砖地，2. 郊区 -> 浅绿草皮
# 强度1-5代表Y3混合纹理刷的次数
TEXTURE_RULES = [
    # 市区内：方整砖地
    {'in_city': True, 'tex_id': 232, 'intensity': 5, 'label': '市区-方整砖地'},
    # 郊区：浅绿草皮
    {'in_city': False, 'tex_id': 227, 'intensity': 3, 'label': '郊区-浅绿草皮'},
]

def parse_terrain_cell(cell):
    """
    解析地形单元格，返回 (terrain_type, height)
    """
    cell = cell.strip().strip('"')
    
    # ground: ("ground", height)
    match = re.match(r'\("ground",\s*([\d.]+)\)', cell)
    if match:
        return ('ground', float(match.group(1)))
    
    # water: ("water", depth, "deep/shallow", mat_id) - 3或4参数格式
    match = re.match(r'\("water",\s*([\d.]+),\s*"(\w+)"', cell)
    if match:
        return ('water', float(match.group(1)))
    
    # 4参数水体: ("water", depth, "deep/shallow", mat_id)
    match = re.match(r'\("water",\s*([\d.]+),\s*"(\w+)"\s*,\s*\d+\)', cell)
    if match:
        return ('water', float(match.group(1)))
    
    # cliff: ("cliff",)
    if 'cliff' in cell:
        return ('cliff', 0)
    
    return ('ground', 0)

def generate_texture_map():
    """
    生成纹理图
    注意：只生成地形纹理，水体和悬崖纹理在第一阶段处理
    """
    print("📖 读取高度图数据...")
    
    # 读取高度图
    height_grid = []
    with codecs.open(HEIGHT_MAP_PATH, 'r', 'utf-8') as f:
        reader = csv.reader(f)
        for row in reader:
            height_grid.append([parse_terrain_cell(cell) for cell in row])
    
    grid_size = len(height_grid)
    print(f"✅ 高度图大小: {grid_size}x{grid_size}")
    
    # 生成纹理图
    print("🎨 生成纹理图...")
    texture_grid = []
    ground_texture_count = 0
    # 非地面（悬崖、水体）记录为 0 或特殊值
    non_ground_count = 0
    
    # 统计各纹理使用情况
    texture_usage = {tex_id: 0 for tex_id in TERRAIN_TEXTURES.keys()}
    
    for y in range(grid_size):
        row = []
        for x in range(grid_size):
            terrain_type, height = height_grid[y][x]
            
            if terrain_type == 'ground':
                # 根据地理位置选择纹理ID和强度
                in_city = is_in_city(x, y, grid_size)
                
                if in_city:
                    # 市区内：方整砖地
                    tex_id = 232
                    intensity = 5
                else:
                    # 郊区：浅绿草皮
                    tex_id = 227
                    intensity = 3
                
                # 地形纹理：(<地形纹理ID>, <强度>) - 强度1-5代表Y3混合纹理刷的次数
                texture = f'({tex_id}, {intensity})'
                texture_usage[tex_id] = texture_usage.get(tex_id, 0) + 1
                ground_texture_count += 1
            else:
                # 水体/悬崖在第一阶段处理，此处记录为 0
                texture = '0'
                non_ground_count += 1
            
            row.append(texture)
        texture_grid.append(row)
    
    print(f"✅ 纹理统计:")
    print(f"   - 地形纹理 (ground): {ground_texture_count}")
    print(f"   - 非地面 (水体/悬崖): {non_ground_count}")
    for tex_id, count in sorted(texture_usage.items()):
        if count > 0:
            print(f"   - {tex_id} ({TERRAIN_TEXTURES.get(tex_id, '未知')}): {count}")
    print(f"   - 总计: {ground_texture_count + non_ground_count}")
    
    # 写入纹理图 CSV
    print(f"💾 保存到 {OUTPUT_PATH}...")
    with codecs.open(OUTPUT_PATH, 'w', 'utf-8') as f:
        writer = csv.writer(f, quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
        for row in texture_grid:
            writer.writerow(row)
    
    print("✅ 纹理图生成完成!")


if __name__ == "__main__":
    generate_texture_map()