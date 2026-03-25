# 上海地形高度图生成技术文档

> 本文档记录了如何从 GPS 坐标数据生成上海市 256x256 网格地形高度图的完整流程。

---

## 一、任务目标

生成一个 256x256 的网格地形数据，用于 Y3 游戏引擎的上海市地图场景。

**输出要求：**
- CSV 格式
- 每行 256 个单元格（对应网格列）
- 共 256 行（对应网格行）
- 每个单元格包含地形类型和高度信息

---

## 二、技术方案

### 2.1 坐标系统

**GPS 坐标范围（上海市）：**
- 经度范围：120.852° ~ 121.995°
- 纬度范围：30.754° ~ 31.517°

**网格映射公式：**
```python
# X轴（经度）：东向增加
px = (lon - LON_MIN) / LON_RANGE

# Y轴（纬度）：北向减少（需反转）
py = (LAT_MAX - lat) / LAT_RANGE
```

> ⚠️ 重要：网格 Y 轴从 0（顶部/北）开始增加，而纬度从北向南递减，因此需要反转。

### 2.2 高度归一化

真实地形高度差异较小（上海平均海拔约 2-4 米，佘山约 10-15 米），需要非线性压缩：

```python
def normalize_height(h, min_h=0, max_h=20, target_max=5):
    normalized = (h - min_h) / (max_h - min_h)  # 0-1
    scaled = normalized ** 0.25 * target_max      # 非线性压缩
    return round(scaled + 1.0, 1)                # 偏移到 1-6 范围
```

### 2.3 区域判断算法

**行政边界判断（点是否在多边形内）：**
```python
def point_in_polygon(x, y, polygon):
    """射线法判断点是否在多边形内"""
    n = len(polygon)
    inside = False
    j = n - 1
    for i in range(n):
        if ((polygon[i][1] > y) != (polygon[j][1] > y)) and \
           (x < (polygon[j][0] - polygon[i][0]) * (y - polygon[i][1]) / (polygon[j][1] - polygon[i][1]) + polygon[i][0]):
            inside = not inside
        j = i
    return inside
```

**河流判断（点到线段距离）：**
```python
def point_to_segment_distance(px, py, p1, p2):
    """计算点到线段的最短距离"""
    x1, y1 = p1
    x2, y2 = p2
    
    dx = x2 - x1
    dy = y2 - y1
    
    if dx == 0 and dy == 0:
        return math.sqrt((px - x1)**2 + (py - y1)**2)
    
    t = max(0, min(1, ((px - x1) * dx + (py - y1) * dy) / (dx*dx + dy*dy)))
    
    proj_x = x1 + t * dx
    proj_y = y1 + t * dy
    
    return math.sqrt((px - proj_x)**2 + (py - proj_y)**2)
```

---

## 三、数据源

### 3.1 上海市行政边界（26个锚点）

按顺时针方向排列的 GPS 坐标：

| 序号 | 经度 | 纬度 | 区域 |
|------|------|------|------|
| 1 | 121.995 | 31.517 | 崇明岛北 |
| 2 | 121.885 | 31.510 | 崇明岛东北 |
| 3 | 121.730 | 31.460 | 崇明岛东 |
| 4 | 121.560 | 31.380 | 崇明岛东南 |
| 5 | 121.430 | 31.300 | 浦东机场北 |
| 6 | 121.380 | 31.220 | 浦东东 |
| 7 | 121.300 | 31.100 | 奉贤东 |
| 8 | 121.200 | 30.980 | 金山 |
| 9 | 121.050 | 30.850 | 金山南 |
| 10 | 120.990 | 30.754 | 杭州湾北 |
| 11 | 120.890 | 30.850 | 嘉兴边界 |
| 12 | 120.852 | 30.950 | 青浦西 |
| 13 | 120.880 | 31.050 | 吴江边界 |
| 14 | 120.950 | 31.150 | 苏州河源头 |
| 15 | 120.980 | 31.250 | 嘉定北 |
| 16 | 121.100 | 31.350 | 宝山 |
| 17 | 121.250 | 31.400 | 崇明西通道 |
| 18 | 121.400 | 31.450 | 崇明岛西 |
| 19 | 121.550 | 31.500 | 崇明北 |
| 20 | 121.700 | 31.510 | 崇明东北角 |
| 21 | 121.800 | 31.480 | 横沙岛 |
| 22 | 121.900 | 31.420 | 长兴岛 |
| 23 | 121.850 | 31.350 | 浦东北 |
| 24 | 121.700 | 31.250 | 陆家嘴北 |
| 25 | 121.600 | 31.150 | 浦东南 |
| 26 | 121.450 | 31.050 | 奉贤西 |

### 3.2 黄浦江轨迹（18个描点）

从闵行到入海口方向：

| 序号 | 经度 | 纬度 | 河段 |
|------|------|------|------|
| 1 | 121.420 | 31.050 | 闵行 |
| 2 | 121.450 | 31.020 | 闵行 |
| 3 | 121.480 | 30.990 | 闵行 |
| 4 | 121.500 | 30.960 | 闵行-徐汇 |
| 5 | 121.520 | 30.930 | 徐汇 |
| 6 | 121.530 | 30.900 | 徐汇-黄浦 |
| 7 | 121.535 | 30.870 | 南市 |
| 8 | 121.540 | 30.840 | 外滩 |
| 9 | 121.545 | 30.810 | 陆家嘴 |
| 10 | 121.550 | 30.780 | 陆家嘴-浦东 |
| 11 | 121.555 | 30.750 | 浦东 |
| 12 | 121.560 | 30.720 | 高桥 |
| 13 | 121.570 | 30.690 | 外高桥 |
| 14 | 121.580 | 30.650 | 吴淞 |
| 15 | 121.590 | 30.610 | 宝山 |
| 16 | 121.600 | 30.570 | 崇明南 |
| 17 | 121.620 | 30.520 | 入海口 |
| 18 | 121.650 | 30.480 | 东海 |

**河段宽度配置：**
| 河段 | 阈值 | 说明 |
|------|------|------|
| 第一段 | 0.015 | 较细（闵行起始段） |
| 第二段 | 0.018 | 稍粗 |
| 第三段 | 0.012 | 最细（陆家嘴/外滩核心区） |
| 第四段 | 0.018 | 较粗（入海口） |

### 3.3 淀山湖

单点坐标：
```python
dianshan_lake = (120.965908, 31.081019)
```

半径设置：0.008

---

## 四、生成流程

### 步骤 1：初始化网格
```python
GRID_SIZE = 256
grid = [[None for _ in range(GRID_SIZE)] for _ in range(GRID_SIZE)]
```

### 步骤 2：遍历所有网格点
```python
for y in range(GRID_SIZE):
    for x in range(GRID_SIZE):
        # 转换为 GPS 坐标
        lon = LON_MIN + x / GRID_SIZE * LON_RANGE
        lat = LAT_MAX - y / GRID_SIZE * LAT_RANGE
        
        # 判断区域类型
        if not point_in_polygon(lon, lat, SHANGHAI_BOUNDARY):
            grid[y][x] = '("cliff",)'  # 边界外
        elif in_huangpu_river(lon, lat):
            grid[y][x] = '("water", 0.3, "deep")'  # 黄浦江
        elif in_dianshan_lake(lon, lat):
            grid[y][x] = '("water", 0.4, "deep")'  # 淀山湖
        elif in_east_china_sea(lon, lat):
            grid[y][x] = '("water", 0.5, "deep")'  # 东海
        else:
            # 地面：计算高度
            height = get_height(lon, lat)
            normalized_height = normalize_height(height)
            grid[y][x] = f'("ground", {normalized_height})'
```

### 步骤 3：写入 CSV
```python
import csv
import codecs

with codecs.open('shanghai_terrain.csv', 'w', 'utf-8') as f:
    writer = csv.writer(f)
    for row in grid:
        # 需要转义包含逗号的单元格
        escaped_row = []
        for cell in row:
            if ',' in cell:
                escaped_row.append(f'"{cell}"')
            else:
                escaped_row.append(cell)
        writer.writerow(escaped_row)
```

---

## 五、关键问题与解决方案

### 问题 1：CSV 解析问题

**现象**：Y3 引擎无法正确解析包含逗号的地形数据（如 `("water", 0.3, "deep")`）

**原因**：CSV 默认按逗号分隔，导致一个单元格被错误拆分

**解决方案**：使用三重引号包裹，或确保 Y3 引擎正确处理 CSV 格式

### 问题 2：Y轴反转

**现象**：生成的地图上下颠倒

**原因**：网格坐标 Y=0 在顶部（北），但纬度是北高南低

**解决方案**：使用 `py = (LAT_MAX - lat) / LAT_RANGE` 反转 Y 轴

### 问题 3：河道宽度调整

**现象**：陆家嘴段河道太粗

**解决**：分段设置阈值，核心区（第三段）使用更小的 0.012

### 问题 4：文件被占用

**现象**：`PermissionError: [Errno 13]` 写入失败

**原因**：CSV 文件被 Excel/WPS 打开

**解决**：切换到新文件名（如 `shanghai_terrain_v2.csv`）

---

## 六、输出格式

### 单元格格式
```
("cliff",)                    # 悬崖/边界，无高度
("ground", 1.8)               # 地面，高度 1.8
("water", 0.3, "deep")        # 水体，深度 0.3
```

### 统计信息
- Cliff：11,600 点
- Water：17,619 点
- Ground：36,317 点
- 总计：65,536 点（256 × 256）

---

## 七、相关文件

| 文件 | 说明 |
|------|------|
| `scripts/generate_shanghai.py` | 主生成脚本 |
| `output/shanghai_terrain.csv` | 生成的高度图数据 |
| `../../templates/moba_terrain.json` | Y3 引擎模板 |
| `../../../history/HISTORY.md` | 变更历史 |

---

## 八、后续工作

1. **纹理图生成**：根据高度图生成对应的纹理数据
2. **Y3 API 集成**：调用引擎 API 导入地形数据

---

## 九、2026/3/11 更新：高度映射规则
=======
--- ## 八、后续工作

1. **纹理图生成**：根据高度图生成对应的纹理数据
2. **Y3 API 集成**：调用引擎 API 导入地形数据

---

## 九、2026/3/11 更新：高度映射规则

### 9.1 绝对高度 → 引擎高度 映射规则

根据用户最新要求，修改映射规则以更准确地反映上海地形：

| 绝对高度 (m) | 引擎高度 | 说明 |
|-------------|---------|------|
| 2 | -1 | 上海最低点 |
| 4 | 0 | 上海平均高度 |
| 10 | 1 | 上海市区 |
| 97 | 6 | 佘山（最高点） |

**实现方案**：三段式线性映射

```python
def normalize_height(h):
    """
    将上海绝对高度（米）映射到 Y3 引擎相对高度
    
    映射规则：
    - 2m (上海最低) -> -1
    - 4m (上海平均) -> 0
    - 10m (市区) -> 1
    - 97m (佘山) -> 6
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
```

### 9.2 水体高度与周边陆地一致（已修复 v2）

**问题**：之前从 `rel_height_grid` 获取邻居高度时，由于水体在 `rel_height_grid` 中是 `None`，且仅使用 4 方向搜索，导致细窄河道无法找到岸边。

**修复（v2）**：
1. 从 `terrain_grid`（原始高度网格）判断邻居是否为陆地（原始值 >= 0）
2. 从 `rel_height_grid` 获取归一化后的相对高度
3. 扩展到 8 方向搜索（包含对角线），确保细窄河道也能找到岸边

**规则**：水体高度与周边陆地保持一致，而非固定的负值。

| 水体 | 周边高度 | 原因 |
|------|---------|------|
| 黄浦江 | 1 | 位于市区，周边陆地高度约1 |
| 淀山湖 | 0 | 位于郊区，周边陆地高度约0 |
| 东海 | 0 | 位于沿海，周边有低地 |

**实现**：
```python
def get_water_height(x, y, terrain_grid, rel_height_grid, width, height):
    """
    获取水体单元格周围陆地的平均高度
    
    规则：
    - 黄浦江（市区）→ 1（周边市区高度）
    - 淀山湖（郊区）→ 0（周边郊区高度）
    - 东海（沿海）→ 0（周边沿海低地）
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
        return round(sum(neighbor_heights) / len(neighbor_heights))
    else:
        return 0  # 没有陆地邻居时返回0

# 输出示例
'("water", 1, "deep", 3)'   # 黄浦江（市区），引擎高度1
'("water", 0, "deep", 4)'  # 淀山湖（郊区），引擎高度0
'("water", 0, "deep", 5)'   # 东海，引擎高度0（沿海低地）
```

### 9.3 约束规则

1. **相邻高度差 ≤ 2**：相邻陆地地块之间的高度差不能超过 2
2. **整数优先**：99%+ 的地块使用整数高度，只有凹凸处使用小数过渡

### 9.4 验证结果

| 指标 | 结果 |
|------|------|
| 整数占比 | 99.2% |
| 相邻高度差 > 2 | 0 对 |
| 高度范围 | 0 ~ 6 |
| 水体高度 | -1, -2, -3 (整数) |

### 9.5 文件位置变更

- `generate_water_config.py`：从 `3_y3api_integration/scripts/` 移动到 `1_height_map/scripts/`
- 输出文件：`1_height_map/output/shanghai_water_materials.json`

### 9.6 水体分类（deep / shallow / flat）

Y3 引擎支持三种水体类型：

| 类型 | 标识 | 适用场景 | 素材ID |
|------|------|----------|--------|
| **deep** | `"deep"` | 主水体（黄浦江、淀山湖、东海） | 3, 4, 5 |
| **shallow** | `"shallow"` | 沿海浅水区域 | 5 |
| **flat** | `"flat"` | 小水坑、沼泽、小溪流 | 6 |

**平面水（flat）检测规则**：
- 位于沿海区域（海岸线右侧）但距离海岸线较近（0.02-0.15 归一化距离）
- 排除主水体（黄浦江、淀山湖、东海）
- 用于表现低洼地带的积水、沼泽、小溪流等小型水体

**输出格式**：
```python
'("water", 0, "deep", 3)'   # 黄浦江
'("water", 0, "deep", 4)'   # 淀山湖
'("water", 0, "deep", 5)'   # 东海
'("water", 0, "shallow", 5)' # 沿海浅水
'("water", 0, "flat", 6)'   # 平面水（小水坑/沼泽）
```

---

*文档创建日期：2026/3/10*
*最后更新：2026/3/11*
