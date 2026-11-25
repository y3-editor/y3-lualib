# 技能脚本参数参考（Ability）

本文只说明 `<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py` 当前对 `-type ability` 实际处理的脚本参数。
完整技能物编字段、字段语义和更细枚举请参考：`<agent>/knowledge/物编系统/06-技能.md`（相对链接：[`../../../knowledge/物编系统/06-技能.md`](../../../knowledge/物编系统/06-技能.md)）。

- 对应脚本：`<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py`
- 对应类型：`-type ability`


## 辅助使用规范（非脚本字段参数）

以下内容用于规划技能 ID 和理解常见字段；它们不是 `y3_obj_edit.py` 的新增命令行参数。

### 技能 ID 规划

常用做法是把技能 ID 编排为：

```text
[英雄ID][技能槽位][等级/变体修饰]
  100001  00       1
     ↓     ↓       ↓
   英雄    Q      基础
```

| 英雄 | Q 技能 | W 技能 | E 技能 | R 技能 |
|---|---:|---:|---:|---:|
| 洛坦 (`100001`) | `100001001` | `100001002` | `100001003` | `100001004` |
| 莉莉娅 (`100002`) | `100002001` | `100002002` | `100002003` | `100002004` |

### 常见基础字段对应

| 概念 | 落盘字段 | 与脚本关系 |
|---|---|---|
| 技能 ID | `key` / `uid` / `_ref_` | 由 `-create` 的技能 ID 初始化；`-edit` 用该 ID 定位 |
| 名称 | `name` | `-create` 名称或 `-name` 写入多语言 TID |
| 描述 | `description` | `-description` 写入多语言 TID |
| 图标 | `ability_icon` | `-create` 第 3 段或 `-ability_icon` |
| 技能类型 | `ability_cast_type` | 脚本按整数写入，具体枚举看完整字段文档 |
| 最大等级 | `ability_max_level` | `-ability_max_level` |

### 指示器相关字段

`-sight_type` 决定使用哪类指示器；对应尺寸参数按等级数组写入：

| 指示器参数 | 用途 |
|---|---|
| `-circle_radius` | 圆形指示器半径 |
| `-sector_radius` | 扇形指示器半径 |
| `-sector_angle` | 扇形指示器角度 |
| `-arrow_length` | 箭头/向量指示器长度 |
| `-arrow_width` | 箭头/向量指示器宽度 |

## 基本命令

```bash
# 创建技能
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type ability -create "100001001,火球术,100000" [字段参数...]

# 编辑已有技能
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type ability -edit 100001001 [字段参数...]
```

## 创建参数格式

| 参数 | 格式 | 说明 |
|---|---|---|
| `-create` | `"技能ID,名称,图标ID"` | 创建技能；名称写入多语言，图标 ID 写入 `ability_icon`。 |
| `-edit` | `技能ID` | 编辑已有技能；与 `-create` 二选一。 |
| `-map` | 地图路径 | 例如 `maps/EntryMap`。 |
| `-type` | `ability` | 固定写 `ability`。 |

创建时：`-create` 的名称和图标 ID 已分别用于初始化 `name`、`ability_icon`；如同时传入下表字段参数，脚本会按当前实现继续覆盖对应字段。`-description` 不填时默认使用名称作为描述。

## 当前脚本支持的字段参数表

| 参数 | 写入字段 | 脚本解析类型 | 说明 |
|---|---|---|---|
| `-name` | `name` | 字符串 | 更新名称多语言 TID；常用于 `-edit`。 |
| `-description` | `description` | 字符串 | 更新描述多语言 TID；创建时不传则默认使用名称。 |
| `-ability_icon` | `ability_icon` | 整数 | 技能图标 ID；创建时图标来自 `-create` 第 3 段。 |
| `-ability_max_level` | `ability_max_level` | 整数 | 技能最大等级。 |
| `-sight_type` | `sight_type` | 整数 | 技能指示器类型；常用取值见下方。 |
| `-ability_cast_type` | `ability_cast_type` | 整数 | 技能释放类型；完整取值说明见技能 knowledge 文档。 |
| `-ability_cast_point` | `ability_cast_point` | 浮点数 | 施法开始时间。 |
| `-ability_bw_point` | `ability_bw_point` | 浮点数 | 施法完成时间。 |
| `-is_immediate` | `is_immediate` | 布尔 | 是否立即释放。 |
| `-is_meele` | `is_meele` | 布尔 | 是否近战技能（参数名按脚本拼写为 `meele`）。 |
| `-cold_down_time` | `cold_down_time` | 字符串数组 | 等级数组，格式见下方。 |
| `-ability_cost` | `ability_cost` | 字符串数组 | 魔法消耗等级数组。 |
| `-ability_hp_cost` | `ability_hp_cost` | 字符串数组 | 生命消耗等级数组。 |
| `-ability_damage` | `ability_damage` | 字符串数组 | 伤害等级数组。 |
| `-ability_damage_range` | `ability_damage_range` | 字符串数组 | 伤害范围等级数组。 |
| `-ability_cast_range` | `ability_cast_range` | 字符串数组 | 施法距离等级数组。 |
| `-circle_radius` | `circle_radius` | 字符串数组 | 圆形指示器半径等级数组。 |
| `-sector_radius` | `sector_radius` | 字符串数组 | 扇形指示器半径等级数组。 |
| `-sector_angle` | `sector_angle` | 字符串数组 | 扇形指示器角度等级数组。 |
| `-arrow_length` | `arrow_length` | 字符串数组 | 箭头指示器长度等级数组。 |
| `-arrow_width` | `arrow_width` | 字符串数组 | 箭头指示器宽度等级数组。 |
| `-required_level` | `required_level` | 整数数组 | 学习等级数组；脚本写入 `{formula:"", required_levels: ...}`。 |

## 常用枚举或取值说明

### 布尔参数

`-is_immediate`、`-is_meele` 可写：`true/false`、`1/0`、`yes/no`。

### 等级数组格式

`tuple_str` 参数使用逗号分隔，脚本会按字符串数组写入：

```bash
-cold_down_time "8,7,6,5,4"
-ability_damage "100,150,200,250,300"
```

`-required_level` 使用逗号分隔整数：

```bash
-required_level "1,3,5,7,9"
```

### `sight_type` 常用取值

| 值 | 指示器含义 |
|---|---|
| `0` | 无指示器，直接释放 |
| `1` | 扇形指示器，返回角度 |
| `2` | 箭头指示器，返回角度 |
| `3` | 圆形指示器，返回点 |
| `4` | 目标指示器，返回单位、物品或可破坏物目标 |
| `5` | 单位或地点指示器，返回单位或点 |
| `6` | 建造指示器 |
| `7` | 多段/向量指示器，返回点和角度 |

脚本只按整数写入；更完整的技能字段说明请看技能 knowledge 文档。

## 常用示例命令

```bash
# 创建 5 级主动技能
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type ability -create "100001001,火球术,100000" -ability_max_level 5 -ability_cast_type 2 -sight_type 1 -circle_radius "3,3,3,3,3" -cold_down_time "8,7,6,5,4" -ability_cost "50,60,70,80,90" -ability_damage "100,150,200,250,300" -required_level "1,3,5,7,9"

# 创建立即释放技能
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type ability -create "100001002,战吼,100001" -sight_type 0 -is_immediate true -ability_max_level 1 -cold_down_time "12"

# 编辑已有技能描述和施法距离
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type ability -edit 100001001 -description "向目标区域发射火球" -ability_cast_range "10,10,11,11,12"
```








## 建造技能字段（补充）

| 参数 | 写入字段 | 类型 | 说明 |
|------|---------|------|------|
| `-ability_cast_type` | `ability_cast_type` | int | 建造技能设为 `4` |
| `-build_list` | `build_list` | tuple-int | 可建造的建筑 UnitKey 列表，例如 `"200001"` |
| `-ability_build_subtype` | `ability_build_subtype` | int | 建造方式；塔防/即时放置用 `1`（Default） |
| `-ability_cast_range` | `ability_cast_range` | tuple-str | 建造施法距离等级数组 |
| `-cold_down_time` | `cold_down_time` | tuple-str | 冷却等级数组，建造技能通常 `"0"` |
| `-ability_cost` | `ability_cost` | tuple-str | 魔法消耗等级数组，建造技能通常 `"0"` |

示例：

```bash
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type ability   -create "300001,建造箭塔,906746"   -ability_cast_type 4 -ability_max_level 1   -build_list 200001 -ability_build_subtype 1   -cold_down_time "0" -ability_cost "0" -ability_cast_range "30"
```

> 建造技能不需要配置指示器类型，编辑器会自动使用 BUILD 指示器。
