# -*- coding: utf-8 -*-
import struct
import math
import os
import sys
import csv

# 读取地图尺寸
map_path = sys.argv[1] if len(sys.argv) > 1 else r'H:\uat\src\LocalData\test_scene_generate\maps\EntryMap\terrain.json'
output_file = sys.argv[2] if len(sys.argv) > 2 else r'h:\y3_ai_agent\skills\y3-gen-terrain\scripts\1_height_map\output\shanghai_terrain.csv'

print('读取地图文件:', map_path)

with open(map_path, 'rb') as f:
    terrain_data = f.read()

size_data = struct.unpack('ii', terrain_data[:8])
point_width = size_data[0] * 2
point_height = size_data[1] * 2

print('生成地图尺寸: {} x {}'.format(point_width, point_height))

# 缩小地图到128*128（点阵256*256）
# 强制覆盖尺寸
point_width = 128 * 2
point_height = 128 * 2
print('强制缩小地图尺寸: {} x {}'.format(point_width, point_height))

# ============================================
# 上海轮廓 - 多边形地形（根据用户提供的锚点）
# 锚定点（顺时针，从最上开始）：
# 1. 31.491193, 121.348525 (最上/吴淞口)
# 2. 31.380998, 121.524287
# 3. 31.376587, 121.518638 (黄浦江入海口)
# 4. 31.283123, 121.717528
# 5. 31.237202, 121.755577
# 6. 31.134191, 121.860452
# 7. 31.125314, 121.853477
# 8. 31.008865, 121.925337
# 9. 30.979464, 121.943964
# 10. 30.888107, 121.970006 (最右)
# 11. 30.849499, 121.895411
# 12. 30.853934, 121.841825
# 13. 30.849499, 121.819668
# 14. 30.842263, 121.639844
# 15. 30.783883, 121.449516
# 16. 30.699588, 121.281522 (最下)
# 17. 30.788889, 121.184415
# 18. 30.853934, 121.072743
# 19. 30.956417, 121.003798
# 20. 31.042983, 120.910576 (最左)
# 21. 31.081019, 120.965908 (淀山湖)
# 22. 31.117001, 121.016422
# 23. 31.241620, 121.067888
# 24. 31.332074, 121.134891
# 25. 31.436527, 121.163052
# 26. 31.478772, 121.235882
# ============================================

# 上海轮廓锚点（经纬度）
SHANGHAI_ANCHORS = [
    (31.491193, 121.348525),  # 1. 最上/吴淞口
    (31.380998, 121.524287),  # 2.
    (31.376587, 121.518638),  # 3. 黄浦江入海口
    (31.283123, 121.717528),  # 4.
    (31.237202, 121.755577),  # 5.
    (31.134191, 121.860452),  # 6.
    (31.125314, 121.853477),  # 7.
    (31.008865, 121.925337),  # 8.
    (30.979464, 121.943964),  # 9.
    (30.888107, 121.970006),  # 10. 最右
    (30.849499, 121.895411),  # 11.
    (30.853934, 121.841825),  # 12.
    (30.849499, 121.819668),  # 13.
    (30.842263, 121.639844),  # 14.
    (30.783883, 121.449516),  # 15.
    (30.699588, 121.281522),  # 16. 最下
    (30.788889, 121.184415),  # 17.
    (30.853934, 121.072743),  # 18.
    (30.956417, 121.003798),  # 19.
    (31.042983, 120.910576),  # 20. 最左
    (31.081019, 120.965908),  # 21. 淀山湖
    (31.117001, 121.016422),  # 22.
    (31.241620, 121.067888),  # 23.
    (31.332074, 121.134891),  # 24.
    (31.436527, 121.163052),  # 25.
    (31.478772, 121.235882),  # 26.
]

# 计算经纬度范围
LAT_MIN = min(a[0] for a in SHANGHAI_ANCHORS)  # 30.699588
LAT_MAX = max(a[0] for a in SHANGHAI_ANCHORS)  # 31.491193
LON_MIN = min(a[1] for a in SHANGHAI_ANCHORS)  # 120.910576
LON_MAX = max(a[1] for a in SHANGHAI_ANCHORS)  # 121.970006

LAT_RANGE = LAT_MAX - LAT_MIN  # ~0.79
LON_RANGE = LON_MAX - LON_MIN  # ~1.06


def lat_lon_to_px_py(lat, lon):
    """将经纬度转换为归一化的px, py坐标"""
    px = (lon - LON_MIN) / LON_RANGE
    # 修正：纬度需要反转，因为 py=0 是北（高纬度），py=1 是南（低纬度）
    py = (LAT_MAX - lat) / LAT_RANGE
    return px, py


# 预计算多边形顶点（归一化坐标）
POLYGON_VERTICES = [lat_lon_to_px_py(lat, lon) for lat, lon in SHANGHAI_ANCHORS]

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

# 预计算市区多边形顶点（归一化坐标）
CITY_POLYGON_VERTICES = [lat_lon_to_px_py(lat, lon) for lat, lon in SHANGHAI_CITY_ANCHORS]

# 海岸线锚点 - 与上海轮廓25个锚点同步
# 从最北（吴淞口）到最南（金山）
COASTLINE_ANCHORS = [
    (31.491193, 121.348525),  # 1. 最上/吴淞口
    (31.380998, 121.524287),  # 2.
    (31.376587, 121.518638),  # 3. 黄浦江入海口
    (31.283123, 121.717528),  # 4.
    (31.237202, 121.755577),  # 5.
    (31.134191, 121.860452),  # 6.
    (31.125314, 121.853477),  # 7.
    (31.008865, 121.925337),  # 8.
    (30.979464, 121.943964),  # 9.
    (30.888107, 121.970006),  # 10. 最右
    (30.849499, 121.895411),  # 11.
    (30.853934, 121.841825),  # 12.
    (30.849499, 121.819668),  # 13.
    (30.842263, 121.639844),  # 14.
    (30.783883, 121.449516),  # 15. 最下
]

# 按y坐标（从上到下）排序海岸线顶点
def sort_coastline_vertices(vertices):
    """按y坐标从上到下排序"""
    return sorted(vertices, key=lambda v: v[1])

# 预计算海岸线顶点（归一化坐标）
COASTLINE_VERTICES_UNSORTED = [lat_lon_to_px_py(lat, lon) for lat, lon in COASTLINE_ANCHORS]
COASTLINE_VERTICES = sort_coastline_vertices(COASTLINE_VERTICES_UNSORTED)


def is_right_of_coastline(px, py, coastline_vertices):
    """
    判断点是否在海岸线右侧（面向大海/东海）
    使用海岸线的分段线性插值来判断
    coastline_vertices: 按从上到下（y从低到高）顺序排列的海岸线顶点
    """
    n = len(coastline_vertices)
    if n < 2:
        return False
    
    # 首先检查是否在顶点y坐标范围内
    y_coords = [v[1] for v in coastline_vertices]
    min_y = min(y_coords)
    max_y = max(y_coords)
    
    # 对于在顶点范围之外的点，使用最近端点的x值
    if py <= min_y:
        # 点在最北（上方）或在边界上 - 使用第一个顶点（y最小的）
        coastline_x = coastline_vertices[0][0]
        return px > coastline_x
    elif py >= max_y:
        # 点在最南（下方）或在边界上 - 使用最后一个顶点（y最大的）
        coastline_x = coastline_vertices[-1][0]
        return px > coastline_x
    else:
        # 点在顶点之间 - 找到对应的海岸线段
        for i in range(n - 1):
            x1, y1 = coastline_vertices[i]
            x2, y2 = coastline_vertices[i + 1]
            
            # 检查点是否在该段的y坐标范围内（包括端点）
            if y1 <= py <= y2 or y2 <= py <= y1:
                # 线性插值计算海岸线的x坐标
                if abs(y2 - y1) > 0.001:
                    t = (py - y1) / (y2 - y1)
                    coastline_x = x1 + t * (x2 - x1)
                    # 如果点的x大于海岸线的x，则在右侧（海洋侧）
                    return px > coastline_x
    
    return False


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


def is_inside_shanghai(x, y, width, height):
    """
    判断点(x,y)是否在上海市轮廓内
    使用用户提供的19个锚点形成的多边形
    """
    px = float(x) / float(width)   # 0=西(左), 1=东(右)
    py = float(y) / float(height)  # 0=北(上), 1=南(下)
    
    return point_in_polygon(px, py, POLYGON_VERTICES)


def is_dianshan_lake(x, y, width, height):
    """判断点是否在淀山湖内（青浦区西部，最左边）"""
    px = float(x) / float(width)
    py = float(y) / float(height)
    # 淀山湖位置：青浦区西部，最左边顶点
    # 坐标：31.063926, 120.922968
    # 映射到 px~0.10, py~0.35
    return 0.08 < px < 0.16 and 0.30 < py < 0.42


def is_flat_water(x, y, width, height):
    """
    判断点是否在平面水区域（小水坑、沼泽、小溪流）
    
    平面水的特征：
    - 位于低洼地带（靠近海岸线但不在主河道/湖泊）
    - 面积较小（通过距离判断）
    - 通常在沿海低地或河流/湖泊边缘
    
    检测策略：
    1. 在沿海区域（海岸线右侧）但距离主水体有一定距离
    2. 在河道/湖泊边缘的小型水体
    """
    px = float(x) / float(width)
    py = float(y) / float(height)
    
    # 只在沿海区域检测
    if not is_right_of_coastline(px, py, COASTLINE_VERTICES):
        return False
    
    # 排除东海主水体（太远）
    min_dist = float('inf')
    for cx, cy in COASTLINE_VERTICES:
        dist = ((px - cx) ** 2 + (py - cy) ** 2) ** 0.5
        min_dist = min(min_dist, dist)
    
    # 距离海岸线太远的是东海，不是平面水
    if min_dist > 0.25:
        return False
    
    # 排除黄浦江和淀山湖
    if is_huangpu_river(x, y, width, height):
        return False
    if is_dianshan_lake(x, y, width, height):
        return False
    
    # 沿海低洼区域（距离海岸线较近但不在主水体）- 可能是沼泽/小水坑
    # 在海岸线附近（0.02-0.15距离范围内）
    if 0.02 < min_dist < 0.15:
        return True
    
    # 额外检测：某些低洼区域可能形成小水坑
    # 在市区外围的沿海过渡区域
    if 0.65 < px < 0.85 and 0.15 < py < 0.45:
        # 靠近海岸线的狭窄区域
        if min_dist < 0.08:
            return True
    
    return False


def is_chongming_island(x, y, width, height):
    """判断点是否在崇明岛区域内（长江入海口）"""
    px = float(x) / float(width)
    py = float(y) / float(height)
    # 崇明岛：长江入海口，主要部分在北部
    # 主岛
    if 0.55 < px < 0.70 and 0.55 < py < 0.80:
        return True
    # 东滩/北滩突出
    if 0.65 < px < 0.72 and 0.60 < py < 0.78:
        return True
    return False

def is_huangpu_river(x, y, width, height):
    """
    判断点(x,y)是否在黄浦江河道内
    
    根据用户提供的GPS锚点转换为归一化坐标：
    - 起始段（较细）: 30.960785,121.219095 → 入海口 31.390525,121.515293
    - 支流段（稍细）: 31.105374,121.462448 → 31.181006,121.465361
    - 支流段（稍粗）: 31.192926,121.496166 → 31.249002,121.533396
    - 最粗段: 31.280403,121.570132 → 31.390525,121.515293
    
    归一化坐标 (px, py):
    - py=0 是北（入海口），py=1 是南（起始点）
    - px=0 是西（左），px=1 是东（右）
    """
    px = float(x) / float(width)
    py = float(y) / float(height)
    
    # GPS锚点转换为归一化坐标
    # 使用与上海轮廓相同的经纬度范围
    river_anchors = [
        # 1. 起始段（较细）- 4个点
        (30.960785, 121.219095),   # 起点
        (30.956329, 121.290692),
        (30.982569, 121.329378),
        (31.015729, 121.487007),
        
        # 2. 支流段（稍细）- 5个点
        (31.105374, 121.462448),
        (31.127405, 121.470702),
        (31.147353, 121.458078),
        (31.161896, 121.471187),
        (31.181006, 121.465361),
        
        # 3. 支流段（稍粗）- 4个点
        (31.192926, 121.496166),
        (31.216123, 121.510737),
        (31.239316, 121.493914),  # 外滩
        (31.249002, 121.533396),
        
        # 4. 最粗段 - 5个点
        (31.280403, 121.570132),
        (31.304691, 121.560933),
        (31.332896, 121.558991),
        (31.364410, 121.503154),
        (31.390525, 121.515293),  # 入海口
    ]
    
    # 转换为归一化坐标
    river_points = []
    for lat, lon in river_anchors:
        npx = (lon - LON_MIN) / LON_RANGE
        npy = (LAT_MAX - lat) / LAT_RANGE  # y轴反转：北=0
        river_points.append((npx, npy))
    
    # 河段定义：(起点, 终点, 阈值/宽度)
    # 根据用户描述调整：
    # - 起始段：较细
    # - 第二段：稍细
    # - 第三段：比第二段细
    # - 第四段：和第二段差不多粗
    river_segments = [
        # 1. 起始段（较细）- threshold=0.015
        (river_points[0], river_points[1], 0.015),
        (river_points[1], river_points[2], 0.015),
        (river_points[2], river_points[3], 0.015),
        
        # 2. 第二段（稍细）- threshold=0.018
        (river_points[3], river_points[4], 0.018),
        (river_points[4], river_points[5], 0.018),
        (river_points[5], river_points[6], 0.018),
        (river_points[6], river_points[7], 0.018),
        (river_points[7], river_points[8], 0.018),
        
        # 3. 第三段（比第二段细）- threshold=0.012
        (river_points[8], river_points[9], 0.012),
        (river_points[9], river_points[10], 0.012),
        (river_points[10], river_points[11], 0.012),  # 外滩
        (river_points[11], river_points[12], 0.012),
        
        # 4. 第四段（和第二段差不多粗）- threshold=0.018
        (river_points[12], river_points[13], 0.018),
        (river_points[13], river_points[14], 0.018),
        (river_points[14], river_points[15], 0.018),
        (river_points[15], river_points[16], 0.018),
        (river_points[16], river_points[17], 0.018),  # 入海口
    ]
    
    for (x1, y1), (x2, y2), threshold in river_segments:
        # 计算点到线段的距离
        min_x, max_x = min(x1, x2) - threshold, max(x1, x2) + threshold
        min_y, max_y = min(y1, y2) - threshold, max(y1, y2) + threshold
        
        if min_x <= px <= max_x and min_y <= py <= max_y:
            dx = x2 - x1
            dy = y2 - y1
            if abs(dx) > 0.001:
                t = max(0, min(1, (px - x1) / dx))
                proj_x = x1 + t * dx
                proj_y = y1 + t * dy
                dist = ((px - proj_x) ** 2 + (py - proj_y) ** 2) ** 0.5
                if dist < threshold:
                    return True
    return False


def is_sheshan(x, y, width, height):
    """
    判断点是否在佘山区域（最高点）
    佘山 (31.094463, 121.194519) - 绝对高度 97m
    """
    px = float(x) / float(width)
    py = float(y) / float(height)
    # 佘山位置：西部，中心偏上
    # 映射到 px~0.25, py~0.32
    return 0.22 < px < 0.30 and 0.28 < py < 0.38


def is_in_downtown(x, y, width, height):
    """
    判断点是否在上海市区内
    市区绝对高度: 10m
    """
    px = float(x) / float(width)
    py = float(y) / float(height)
    return point_in_polygon(px, py, CITY_POLYGON_VERTICES)


# ============================================
# 悬崖纹理定义（来自 editor_terrain_cliff_material.py）
# ============================================
# ID: 纹理名称 (中文)
# 0: code_clifftexture_earth (泥土) - 河流、湖泊旁边
# 2: code_clifftexture_stone (戈壁)
# 8: opd_cliff_texture_8 (灰质岩) - 其他区域默认
# 9: opd_cliff_texture_9 (方砖) - 市区
# 10: code_clifftexture_dota2 (石壁)
CLIFF_TEXTURE_EARTH = 0       # 泥土 - 河流、湖泊旁边
CLIFF_TEXTURE_BRICK = 9      # 方砖 - 市区
CLIFF_TEXTURE_GREY_ROCK = 8  # 灰质岩 - 其他区域默认
CLIFF_TEXTURE_DEFAULT = 8     # 默认使用灰质岩


def get_cliff_texture(x, y, width, height):
    """
    获取地块的悬崖纹理ID
    
    规则：
    - 市区范围内：方砖 (stone, key=2)
    - 河流/湖泊旁边：泥土 (earth, key=0)
    - 其他区域：默认石头 (stone, key=2)
    
    判断逻辑：
    1. 检查是否在黄浦江或淀山湖旁边（距离阈值内）→ 泥土
    2. 检查是否在市区范围内 → 方砖
    3. 否则 → 默认石头
    """
    px = float(x) / float(width)
    py = float(y) / float(height)
    
    # 1. 检查是否靠近黄浦江（河流旁边用泥土）
    # 使用与is_huangpu_river相同的逻辑，但扩大搜索范围
    river_anchors = [
        (30.960785, 121.219095),
        (30.956329, 121.290692),
        (30.982569, 121.329378),
        (31.015729, 121.487007),
        (31.105374, 121.462448),
        (31.127405, 121.470702),
        (31.147353, 121.458078),
        (31.161896, 121.471187),
        (31.181006, 121.465361),
        (31.192926, 121.496166),
        (31.216123, 121.510737),
        (31.239316, 121.493914),
        (31.249002, 121.533396),
        (31.280403, 121.570132),
        (31.304691, 121.560933),
        (31.332896, 121.558991),
        (31.364410, 121.503154),
        (31.390525, 121.515293),
    ]
    
    river_points = []
    for lat, lon in river_anchors:
        npx = (lon - LON_MIN) / LON_RANGE
        npy = (LAT_MAX - lat) / LAT_RANGE
        river_points.append((npx, npy))
    
    # 检查是否靠近黄浦江（扩大阈值到0.025）
    for i in range(len(river_points) - 1):
        x1, y1 = river_points[i]
        x2, y2 = river_points[i + 1]
        
        # 快速包围盒检查
        threshold = 0.025  # 扩大搜索范围
        min_x, max_x = min(x1, x2) - threshold, max(x1, x2) + threshold
        min_y, max_y = min(y1, y2) - threshold, max(y1, y2) + threshold
        
        if min_x <= px <= max_x and min_y <= py <= max_y:
            dx = x2 - x1
            dy = y2 - y1
            if abs(dx) > 0.001:
                t = max(0, min(1, (px - x1) / dx))
                proj_x = x1 + t * dx
                proj_y = y1 + t * dy
                dist = ((px - proj_x) ** 2 + (py - proj_y) ** 2) ** 0.5
                if dist < threshold:
                    return CLIFF_TEXTURE_EARTH  # 河流旁边 → 泥土
    
    # 2. 检查是否靠近淀山湖（湖泊旁边用泥土）
    # 淀山湖中心：px~0.10, py~0.35
    if 0.06 < px < 0.18 and 0.28 < py < 0.44:
        # 距离中心点的距离
        center_px, center_py = 0.12, 0.36
        dist = ((px - center_px) ** 2 + (py - center_py) ** 2) ** 0.5
        if dist < 0.06:  # 湖泊范围内
            return CLIFF_TEXTURE_EARTH  # 湖泊旁边 → 泥土
    
    # 3. 检查是否在市区范围内（市区用方砖）
    if is_in_downtown(x, y, width, height):
        return CLIFF_TEXTURE_BRICK  # 市区 → 方砖 (ID=9)
    
    # 4. 其他区域默认使用灰质岩
    return CLIFF_TEXTURE_DEFAULT  # 默认 → 灰质岩 (ID=8)


# ============================================
# 上海绝对高度参考值（根据用户提供）
# - 上海市平均: 4m
# - 佘山: 97m
# - 市区: 10m
# - 沿海海岸线: 4m
# ============================================

# 生成上海地形高程数据（绝对高度，单位：米）
# 新规则：
# 1. 绝大部分使用整数，只有凹凸区域使用小数
# 2. 相邻块除非是悬崖，否则高度差不大于2
def generate_shanghai_terrain(x, y, width, height, neighbor_heights=None):
    nx = float(x) / float(width)  # 0=西(左), 1=东(右)
    ny = float(y) / float(height)  # 0=北(上), 1=南(下)
    
    # 检查是否是黄浦江
    if is_huangpu_river(x, y, width, height):
        return -1  # 黄浦江水位
    
    # 检查是否是淀山湖（最左边，深水）
    if is_dianshan_lake(x, y, width, height):
        return -2  # 淀山湖水位（深水）
    
    # 检查是否是平面水（小水坑、沼泽、小溪流）
    if is_flat_water(x, y, width, height):
        return -4  # 平面水 - 小水坑、沼泽、小溪流
    
    # 检查是否是崇明岛（长江入海口）
    if is_chongming_island(x, y, width, height):
        # 崇明岛绝对高度: 3-5m
        base = 4
        noise = math.sin(nx * 20) * math.cos(ny * 20) * 1
        # 规则1：大部分整数，小数只在明显凹凸处
        if abs(noise) > 0.5:
            return base + noise
        else:
            return round(base + noise)
    
    # 检查是否是市区
    if is_in_downtown(x, y, width, height):
        # 市区绝对高度: 10m
        base = 10
        noise = math.sin(nx * 20) * math.cos(ny * 20) * 1
        if abs(noise) > 0.5:
            return base + noise
        else:
            return round(base + noise)
    
    # 佘山区域（最高点）
    if is_sheshan(x, y, width, height):
        # 佘山绝对高度: 97m，这里允许更大的小数变化（山地地形）
        base = 97
        noise = math.sin(nx * 30) * math.cos(ny * 30) * 2
        # 佘山允许小数变化表现地形凹凸
        if abs(noise) > 1.0:
            return base + noise
        else:
            return round(base + noise)
    
    # 沿海区域（右侧/东边）- 东海/长江入海口
    # 使用海岸线锚点动态判断
    if is_right_of_coastline(nx, ny, COASTLINE_VERTICES):
        # 沿海海岸线绝对高度: 4m
        # 距离海岸线越远，高度越低（向东海倾斜）
        min_dist = float('inf')
        for cx, cy in COASTLINE_VERTICES:
            dist = ((nx - cx) ** 2 + (ny - cy) ** 2) ** 0.5
            min_dist = min(min_dist, dist)
        distance_to_coast = min(min_dist, 0.3) / 0.3  # 归一化
        # 沿海: 4m, 向东逐渐降低到 2m
        base_height = 4 - distance_to_coast * 2
        noise = math.sin(nx * 15) * math.cos(ny * 15) * 0.5
        h = max(2, base_height + noise)
        # 规则1：大部分整数
        if abs(noise) > 0.3:
            return h
        else:
            return round(h)
    
    # 西部和北部 - 内陆区域
    # 从市区(10m)向西逐渐升高到平均(4m)再过渡
    # 使用市区边界作为参考
    
    # 基础高度：西部4m（平均），东部10m（市区），过渡
    base_height = 4 + nx * 6  # 西边4m，东边10m
    
    # 添加轻微地形变化
    noise = math.sin(nx * 10) * math.cos(ny * 10) * 1
    
    # 金山区（最下面）
    if ny > 0.75:
        base_height = 4 - ny * 1
    
    h = max(3, base_height + noise)
    
    # 规则1：大部分整数
    if abs(noise) > 0.5:
        return h
    else:
        return round(h)

# 生成原始高程网格
terrain_grid = []
inside_count = 0
outside_count = 0
sea_count = 0  # 东海区域

print("开始生成地形网格...")

for y in range(point_height):
    row = []
    for x in range(point_width):
        nx = float(x) / float(point_width)
        ny = float(y) / float(point_height)
        
        # 先判断是否在轮廓内
        if not is_inside_shanghai(x, y, point_width, point_height):
            # 轮廓外 - 检查是否在海岸线右侧（东海区域）
            if is_right_of_coastline(nx, ny, COASTLINE_VERTICES):
                # 东海区域 - 设为水域
                row.append(-3)  # -3 表示东海/公海
                sea_count += 1
            else:
                # 真正的外部 - 设为特殊值，稍后转为cliff
                row.append(None)
                outside_count += 1
        else:
            h = generate_shanghai_terrain(x, y, point_width, point_height)
            row.append(h)
            inside_count += 1
    terrain_grid.append(row)

print('轮廓内点数: %d, 东海区域点数: %d, 轮廓外点数: %d' % (inside_count, sea_count, outside_count))
print("开始生成CSV...")

# 计算高度范围（仅限轮廓内的点）
valid_heights = [h for row in terrain_grid for h in row if h is not None]
raw_min = min(valid_heights)
raw_max = max(valid_heights)
print('原始高度范围: %.1f - %.1f 米' % (raw_min, raw_max))

# ============================================
# 规则2：相邻块除非是悬崖，否则高度差不大于2
# 对地形进行平滑处理，确保相邻陆地块高度差不超过2
# ============================================
def smooth_terrain_height(grid, width, height, max_diff=2):
    """
    平滑地形高度，确保相邻陆地块高度差不大于max_diff
    
    规则：
    - 悬崖(None)和水体(-1,-2,-3)不参与平滑计算
    - 陆地块之间高度差不能超过max_diff
    - 平滑时取相邻有效地块的平均值
    """
    # 复制网格
    smoothed = [row[:] for row in grid]
    
    # 需要标记哪些格子被修改过
    modified = [[False] * width for _ in range(height)]
    
    for y in range(height):
        for x in range(width):
            current = grid[y][x]
            
            # 只处理陆地（正高度）
            if current is None or current < 0:
                continue
            
            # 检查四个方向邻居
            neighbors = []
            for dy, dx in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                ny, nx = y + dy, x + dx
                if 0 <= ny < height and 0 <= nx < width:
                    neighbor_h = grid[ny][nx]
                    # 只考虑陆地邻居
                    if neighbor_h is not None and neighbor_h >= 0:
                        neighbors.append((ny, nx, neighbor_h))
            
            if not neighbors:
                continue
            
            # 检查是否有邻居高度差超过max_diff
            for ny, nx, neighbor_h in neighbors:
                diff = current - neighbor_h
                if abs(diff) > max_diff:
                    # 高度差太大，需要平滑
                    # 取当前格子和邻居的平均值
                    all_heights = [current]
                    all_heights.extend([h for _, _, h in neighbors if abs(h - current) <= max_diff])
                    
                    if all_heights:
                        new_height = sum(all_heights) / len(all_heights)
                        # 保持整数/小数特性
                        if isinstance(current, int) and isinstance(neighbor_h, int):
                            new_height = round(new_height)
                        smoothed[y][x] = new_height
                        modified[y][x] = True
                    break
    
    # 迭代多次直到没有新的修改
    iteration = 0
    max_iterations = 10
    while iteration < max_iterations:
        iteration += 1
        any_modified = False
        
        for y in range(height):
            for x in range(width):
                if not modified[y][x]:
                    continue
                
                current = smoothed[y][x]
                if current is None or current < 0:
                    continue
                
                # 再次检查邻居
                for dy, dx in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                    ny, nx = y + dy, x + dx
                    if 0 <= ny < height and 0 <= nx < width:
                        neighbor_h = smoothed[ny][nx]
                        if neighbor_h is not None and neighbor_h >= 0:
                            diff = current - neighbor_h
                            if abs(diff) > max_diff:
                                # 再次平滑
                                all_heights = [current, neighbor_h]
                                # 加入更多有效邻居
                                for dy2, dx2 in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                                    ny2, nx2 = ny + dy2, nx + dx2
                                    if 0 <= ny2 < height and 0 <= nx2 < width:
                                        h2 = smoothed[ny2][nx2]
                                        if h2 is not None and h2 >= 0 and abs(h2 - current) <= max_diff:
                                            if h2 not in all_heights:
                                                all_heights.append(h2)
                                
                                new_height = sum(all_heights) / len(all_heights)
                                if isinstance(current, int):
                                    new_height = round(new_height)
                                smoothed[y][x] = new_height
                                any_modified = True
        
        if not any_modified:
            break
    
    return smoothed

# 执行平滑处理
print("执行高度平滑处理（规则2：相邻块高度差不大于2）...")
terrain_grid = smooth_terrain_height(terrain_grid, point_width, point_height, max_diff=2)

# 重新计算平滑后的高度范围
valid_heights = [h for row in terrain_grid for h in row if h is not None and h >= 0]
raw_min = min(valid_heights)
raw_max = max(valid_heights)
print('平滑后高度范围: %.1f - %.1f 米' % (raw_min, raw_max))

# 缩放函数 - 将绝对高度映射到相对高度
def normalize_height(h, raw_min, raw_max):
    """
    将上海绝对高度（米）映射到 Y3 引擎相对高度
    
    映射规则：
    - 2m (上海最低) -> -1
    - 4m (上海平均) -> 0
    - 10m (市区) -> 1
    - 97m (佘山) -> 6
    
    使用三段式映射来近似满足所有关键点：
    - 2m ~ 4m: 线性映射到 -1 ~ 0 (斜率=0.5)
    - 4m ~ 10m: 线性映射到 0 ~ 1 (斜率=1/6≈0.167)
    - 10m ~ 97m: 线性映射到 1 ~ 6 (斜率=5/87≈0.057)
    """
    if h <= 0:
        return -1
    
    # 三段式映射
    if h <= 4:
        # 2m -> -1, 4m -> 0
        # 斜率 = (0 - (-1)) / (4 - 2) = 0.5
        normalized = (h - 2) / (4 - 2)
        normalized = max(0, min(1, normalized))
        scaled = normalized * (0 - (-1)) + (-1)
    elif h <= 10:
        # 4m -> 0, 10m -> 1
        # 斜率 = (1 - 0) / (10 - 4) = 1/6 ≈ 0.167
        normalized = (h - 4) / (10 - 4)
        normalized = max(0, min(1, normalized))
        scaled = normalized * (1 - 0) + 0
    else:
        # 10m -> 1, 97m -> 6
        # 斜率 = (6 - 1) / (97 - 10) = 5/87 ≈ 0.057
        normalized = (h - 10) / (97 - 10)
        normalized = max(0, min(1, normalized))
        scaled = normalized * (6 - 1) + 1
    
    return scaled

# ============================================
# 将绝对高度转换为相对高度网格
# ============================================
rel_height_grid = []
for y in range(point_height):
    row = []
    for x in range(point_width):
        h = terrain_grid[y][x]
        if h is None or h < 0:
            row.append(None)  # 悬崖或水体用None标记
        else:
            row.append(normalize_height(h, raw_min, raw_max))
    rel_height_grid.append(row)

# ============================================
# 对相对高度进行平滑处理（确保相邻块高度差不大于2）
# ============================================
def smooth_rel_height(grid, width, height, max_diff=2):
    """对相对高度进行平滑 - 迭代直到满足max_diff约束"""
    smoothed = [row[:] for row in grid]
    
    # 持续迭代直到没有需要平滑的点
    max_iterations = 200
    for iteration in range(max_iterations):
        modified = False
        
        for y in range(height):
            for x in range(width):
                current = smoothed[y][x]
                if current is None:
                    continue
                
                # 检查四个方向邻居
                max_neighbor_diff = 0
                for dy, dx in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                    ny, nx = y + dy, x + dx
                    if 0 <= ny < height and 0 <= nx < width:
                        neighbor_h = smoothed[ny][nx]
                        if neighbor_h is None:
                            continue
                        
                        diff = current - neighbor_h
                        max_neighbor_diff = max(max_neighbor_diff, abs(diff))
                        
                        if abs(diff) > max_diff:
                            # 高度差太大，需要平滑
                            # 使用更大的调整幅度
                            if diff > 0:
                                # current > neighbor，向下调整
                                new_current = neighbor_h + max_diff * 0.95
                            else:
                                # current < neighbor，向上调整
                                new_current = neighbor_h - max_diff * 0.95
                            
                            smoothed[y][x] = new_current
                            modified = True
        
        if not modified:
            print(f'相对高度平滑在第{iteration+1}次迭代后收敛')
            break
    else:
        print(f'相对高度平滑达到最大迭代次数{max_iterations}')
    
    return smoothed

print("执行相对高度平滑处理...")
rel_height_grid = smooth_rel_height(rel_height_grid, point_width, point_height, max_diff=2)

# ============================================
# 生成CSV行 - 使用csv模块确保元组在单个单元格中
# 规则：绝大部分使用整数，只有凹凸处使用小数
# ============================================
output_rows = []
water_count = 0
ground_count = 0
cliff_count = 0

for y in range(point_height):
    row_data = []
    for x in range(point_width):
        h = terrain_grid[y][x]
        
        # ============================================
        # 水体高度计算：与周围陆地高度保持一致
        # ============================================
        def get_water_height(x, y, terrain_grid, rel_height_grid, width, height):
            """
            获取水体单元格周围陆地的平均高度
            
            规则：
            - 黄浦江（市区）→ 1（周边市区高度）
            - 淀山湖（郊区）→ 0（周边郊区高度）
            - 东海（沿海）→ -1（周边沿海低地）
            
            注意：必须从terrain_grid判断邻居是否为陆地（原始值>=0），
            因为rel_height_grid中水体是None，无法区分水体和悬崖
            
            搜索范围：扩展到8个方向（包含对角线），确保细窄河道也能找到岸边
            """
            # 获取8个方向邻居的陆地高度（包含对角线）
            neighbor_heights = []
            for dy, dx in [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]:
                ny, nx = y + dy, x + dx
                if 0 <= ny < height and 0 <= nx < width:
                    # 从terrain_grid判断是否为陆地（原始高度>=0）
                    original_h = terrain_grid[ny][nx]
                    if original_h is not None and original_h >= 0:
                        # 从rel_height_grid获取归一化后的相对高度
                        normalized_h = rel_height_grid[ny][nx]
                        if normalized_h is not None:
                            neighbor_heights.append(round(normalized_h))
            
            if neighbor_heights:
                # 返回周围陆地的平均高度（四舍五入到整数）
                return round(sum(neighbor_heights) / len(neighbor_heights))
            else:
                # 没有陆地邻居，返回默认值
                return 0
        
        if h is None:
            # 轮廓外 - 设为裂缝(cliff)
            terrain = '("cliff",)'
            cliff_count += 1
        elif h == -1:
            # 黄浦江 - 与周围陆地高度保持一致（市区高度约1）
            water_h = get_water_height(x, y, terrain_grid, rel_height_grid, point_width, point_height)
            terrain = f'("water", {water_h}, "deep", 3)'
            water_count += 1
        elif h == -2:
            # 淀山湖 - 与周围陆地高度保持一致（郊区高度约0）
            water_h = get_water_height(x, y, terrain_grid, rel_height_grid, point_width, point_height)
            terrain = f'("water", {water_h}, "deep", 4)'
            water_count += 1
        elif h == -3:
            # 东海/公海 - 与周围陆地高度保持一致（沿海低地约-1）
            water_h = get_water_height(x, y, terrain_grid, rel_height_grid, point_width, point_height)
            terrain = f'("water", {water_h}, "deep", 5)'
            water_count += 1
        elif h == -4:
            # 平面水 - 小水坑、沼泽、小溪流
            # 高度较低，通常接近0或-1
            water_h = get_water_height(x, y, terrain_grid, rel_height_grid, point_width, point_height)
            terrain = f'("water", {water_h}, "flat", 6)'
            water_count += 1
        elif is_right_of_coastline(float(x) / float(point_width), float(y) / float(point_height), COASTLINE_VERTICES):
            # 沿海水体 - 与周围陆地高度保持一致
            water_h = get_water_height(x, y, terrain_grid, rel_height_grid, point_width, point_height)
            terrain = f'("water", {water_h}, "shallow", 5)'
            water_count += 1
        else:
            # 陆地 - 使用平滑后的相对高度
            rel_h = rel_height_grid[y][x]
            
            # 规则1：绝大部分使用整数，只有凹凸处使用小数
            # 简化逻辑：先四舍五入到整数，然后检查与邻居的差异
            # 只有当差异>=2（需要过渡）时才用小数
            
            rounded_h = round(rel_h)
            
            # 检查与所有邻居（上下左右）的高度差异
            neighbor_int_diffs = []
            neighbor_values = []
            for dy, dx in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                ny, nx = y + dy, x + dx
                if 0 <= ny < point_height and 0 <= nx < point_width:
                    nh = rel_height_grid[ny][nx]
                    if nh is not None:
                        neighbor_values.append(nh)
                        neighbor_int_diffs.append(abs(rounded_h - round(nh)))
            
            max_int_diff = max(neighbor_int_diffs) if neighbor_int_diffs else 0
            
            # 获取悬崖纹理ID
            cliff_texture = get_cliff_texture(x, y, point_width, point_height)
            
            # 只有当与邻居的整数高度差>=2时才用小数（过渡）
            # 但需要确保小数也不会造成>2的差异
            if max_int_diff >= 2:
                # 计算安全范围：确保与所有邻居的差都<2
                min_safe = max(nh - 1.9 for nh in neighbor_values) if neighbor_values else rel_h
                max_safe = min(nh + 1.9 for nh in neighbor_values) if neighbor_values else rel_h
                # 限制在安全范围内
                safe_h = max(min_safe, min(rel_h, max_safe))
                terrain = '("ground", {:.1f}, {})'.format(safe_h, cliff_texture)
            else:
                terrain = '("ground", {}, {})'.format(rounded_h, cliff_texture)
            
            ground_count += 1
        
        row_data.append(terrain)
    output_rows.append(row_data)

print('cliff 数量: {}, water 数量: {}, ground 数量: {}'.format(cliff_count, water_count, ground_count))

# 写入CSV文件 - 使用csv writer确保每个单元格内容完整
output_dir = os.path.dirname(output_file)
if output_dir and not os.path.exists(output_dir):
    os.makedirs(output_dir)

# 手动写入CSV，确保每个单元格用引号包裹，且内部引号双写转义
import codecs
f = codecs.open(output_file, 'w', 'utf-8')
for row in output_rows:
    # 每个单元格: 先把内部引号双写转义，再用引号包裹
    # 例如: ("ground", 5.2) -> """("ground", 5.2)"""
    quoted_row = ['"%s"' % cell.replace('"', '""') for cell in row]
    f.write(','.join(quoted_row) + '\n')
f.close()

print('输出文件:', output_file)
print('生成完成!')
print('文件大小:', os.path.getsize(output_file), 'bytes')