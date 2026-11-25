# 单位脚本参数参考（Unit）

本文只说明 `<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py` 当前对 `-type unit` 实际处理的脚本参数。
完整单位物编字段、字段语义和更细枚举请参考：`<agent>/knowledge/物编系统/08-单位.md`（相对链接：[`../../../knowledge/物编系统/08-单位.md`](../../../knowledge/物编系统/08-单位.md)）。

- 对应脚本：`<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py`
- 对应类型：`-type unit`


## 辅助使用规范（非脚本字段参数）

以下内容用于规划 ID、选资源和查询现有数据；它们不是 `y3_obj_edit.py` 的新增命令行参数。

### 单位类型与 ID 前缀

| 类型 | 建议 ID 前缀 |
|---|---|
| `近战小怪` | `2xxxxx` |
| `远程小怪` | `2xxxxx` |
| `近战精英` | `3xxxxx` |
| `远程精英` | `3xxxxx` |
| `近战boss` | `4xxxxx` |
| `远程boss` | `4xxxxx` |
| `近战英雄` | `1xxxxx` |
| `远程英雄` | `1xxxxx` |
| `建筑` | 按项目约定分配 |

### 获取已有单位物编列表

如项目环境提供 Y3 编辑器 MCP，可优先用 MCP 获取已有自定义单位，避免手工猜 ID 或重复创建。

```text
工具：y3editor.get_editor_unit_custom_data
常用参数：
  - 不传参数：返回所有自定义单位物编列表
  - id_list：指定单位 ID 列表，如 [200001, 200002]
  - key_list：指定属性字段列表，如 ["hp_max", "attack_phy"]
```

示例：

```python
# 获取所有自定义单位
y3editor.get_editor_unit_custom_data()

# 获取指定单位的指定属性
y3editor.get_editor_unit_custom_data(
    id_list=[200001, 200002],
    key_list=["hp_max", "attack_phy", "model"]
)
```

### 模型与头像选择流程

`-create` 的第 4 段模型 ID 和第 5 段头像 ID 不建议随意填写，应先从项目可用资源中选择：

1. 优先查项目预设资源表（如 y3-obj-edit 技能目录下的 `excels/resources.csv`，如果项目存在）。
2. 如果预设资源没有合适项，再通过 Y3 编辑器 MCP 查询官方模型/资源列表。
3. 根据名称、标签和用途匹配最合适资源，再把资源 ID 填入 `-create` 或 `-model` / `-icon`。

> **模型 ID ≠ 头像/图标 ID**：`-create` 的第 4 段是模型 ID，第 5 段才是头像 ID。
> UI 的 `data-image` / 控件 `image`、技能 `ability_icon`、物品 `icon`、Buff `modifier_icon`
> 都要填头像或图标资源 ID。把模型 ID 填进图片控件通常表现为空白图（实测）。
> `resources.csv` 中“模型ID”和“头像ID”是两列，不要混用。

```text
工具：y3editor.get_official_editor_model
常用方式：
  - 不传 ID：返回官方模型列表
  - 传入 ID：返回单个模型详情
```

MCP 返回数据量较大时，可在临时结果文件中搜索名称、标签或资源 ID 后再选用。

## 基本命令

```bash
# 创建单位
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type unit -create "200001,近战士兵,近战小怪,10001,10002" [字段参数...]

# 编辑已有单位
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type unit -edit 200001 [字段参数...]
```

## 创建参数格式

| 参数 | 格式 | 说明 |
|---|---|---|
| `-create` | `"单位ID,名称,单位类型,模型ID,头像ID"` | 创建单位；名称写入多语言，模型和头像分别写入 `model`、`icon`。 |
| `-edit` | `单位ID` | 编辑已有单位；与 `-create` 二选一。 |
| `-map` | 地图路径 | 例如 `maps/EntryMap`。 |
| `-type` | `unit` | 固定写 `unit`。 |

创建时：`-create` 的名称、模型 ID、头像 ID 已分别用于初始化 `name`、`model`、`icon`；如同时传入下表字段参数，脚本会按当前实现继续覆盖对应字段。`-description` 不填时默认使用名称作为描述。

## 当前脚本支持的字段参数表

| 参数 | 写入字段 | 脚本解析类型 | 说明 |
|---|---|---|---|
| `-name` | `name` | 字符串 | 更新名称多语言 TID；常用于 `-edit`。 |
| `-description` | `description` | 字符串 | 更新描述多语言 TID；创建时不传则默认使用名称。 |
| `-model` | `model` | 整数 | 单位模型 ID。 |
| `-icon` | `icon` | 整数 | 单位头像/图标 ID。 |
| `-hp_max` | `hp_max` | 浮点数 | 最大生命。 |
| `-hp_max_grow` | `hp_max_grow` | 浮点数 | 最大生命成长。 |
| `-mp_max` | `mp_max` | 浮点数 | 最大魔法。 |
| `-mp_max_grow` | `mp_max_grow` | 浮点数 | 最大魔法成长。 |
| `-attack_phy` | `attack_phy` | 浮点数 | 物理攻击。 |
| `-attack_phy_grow` | `attack_phy_grow` | 浮点数 | 物理攻击成长。 |
| `-attack_mag` | `attack_mag` | 浮点数 | 魔法攻击。 |
| `-defense_phy` | `defense_phy` | 浮点数 | 物理防御。 |
| `-defense_mag` | `defense_mag` | 浮点数 | 魔法防御。 |
| `-attack_speed` | `attack_speed` | 浮点数 | 攻击速度。 |
| `-attack_interval` | `attack_interval` | 浮点数 | 攻击间隔。 |
| `-common_atk_type` | `common_atk_type` | 整数 | 普攻类型；完整取值说明见单位 knowledge 文档。 |
| `-ori_speed` | `ori_speed` | 浮点数 | 移动速度。**⚠️ 单位是引擎坐标/秒（1 引擎单位 ≈ 100 cm），正常范围 1.5~5，切勿填 cm 值（如 200、450）** |
| `-turn_speed` | `turn_speed` | 浮点数 | 转身速度。 |
| `-sight_range` | `sight_range` | 浮点数 | **视野范围**（单位可见性），不控制攻击距离。 |
| `-attack_range` | `attack_range`（根级） | 浮点数 | 根级攻击范围；对使用 `simple_common_atk` 模板的单位**无效**，请用 `-common_atk_range`。 |
| `-common_atk_range` | `attack_range`（根级）+ `simple_common_atk.attack_range` | 浮点数 | **⭐ 实际战斗射程**（同时写入两处）。远程/塔防单位调射程必用此参数。 |
| `-reward_exp` | `reward_exp` | 浮点数 | 击杀奖励经验。 |
| `-reward_official_res_1` | `reward_official_res_1` | 浮点数 | 击杀奖励资源类型 1。 |
| `-hero_ability_list` | `hero_ability_list` | tuple | 技能列表，格式见下方。 |
| `-common_ability_list` | `common_ability_list` | tuple | 普通技能列表，格式见下方。 |

## ⚠️ 数值填写规范（常见陷阱）

### 长度类字段的单位是「米」，不是厘米

`attack_range` / `simple_common_atk.attack_range` / `ori_speed` / `sight_range` /
`alarm_range` 等长度字段，**单位是引擎世界单位（1 ≈ 1 米 ≈ 100 厘米）**。

| 场地 | 口径 |
|------|------|
| 单位物编的 `attack_range`（本文件） | **米**（引擎自带「远程英雄」模板默认就是 `5.25`） |
| MCP `add_point` / `add_rect_area` 入参 | **厘米** |
| 逻辑资源 / 编辑器面板 / 镜头焦点 | **米** |
| 运行时 `y3.point.create` / `unit:get_point()` | **厘米**（= 米 × 100） |

> 策划案里的射程常写成厘米（如 `128 / 600`）→ 落到物编要 **÷100**（`1.28 / 6.0`）。
> 把 `600` 直接填进去 = 600 米射程（整张图），表现为「远程单位隔着半张图打人」。

### 普攻的实际生效字段在 `simple_common_atk` 里

单位普攻用的是模板 `simple_common_atk`，因此：

| 你想改的东西 | 真正生效的字段 |
|-------------|--------------|
| 攻击射程 | `simple_common_atk.attack_range`（根级 `attack_range` 只是镜像） |
| 攻击间隔 | `simple_common_atk.attack_interval`（根级 `attack_interval` 只是镜像） |

> **只写根级 = 改了没效果**（根级回读会变，但战斗行为不变）。
> `y3_obj_edit.py` 现在对 `-common_atk_range` / `-attack_range` / `-attack_interval`
> **自动同步到两处**，并在保存后打印「🔎 回读校验」表（请求值 vs 落盘值 vs 实际生效值），
> 不一致会明确报警 —— 请务必看这张表，别只看"✅ 已保存"。

> 历史坑（已修）：`common_atk_range` 原先**不在** `UNIT_ATTRIBUTES` 表里，导致 `-create`
> 静默忽略它、只有 `-edit` 生效。现在 `-create` / `-edit` 走同一条同步逻辑。

### ori_speed — 移动速度

| 单位类型 | 推荐值 | 说明 |
|---|---|---|
| 普通小怪 | `2.0` | 正常步行速度 |
| 精英 | `2.5` | 略快于小怪 |
| Boss | `1.5 ~ 1.8` | 大型单位偏慢 |
| 建筑/固定炮塔 | `0` | 不可移动 |
| 英雄 | `3.0 ~ 5.0` | 玩家控制单位 |

> **根本原因**：Y3 坐标系 1 单位 ≈ 100 cm（编辑器中 `add_point` 传 600 → 实际 6.0 m）。`ori_speed` 的单位是**引擎坐标/秒**，不是厘米/秒。若错填为 cm 量级（如 200、450），怪物将以 20000 cm/s（200 m/s）的速度移动，远超正常。

### sight_range — 视野范围

> 参考单位同 `ori_speed`：1 引擎单位 ≈ 100 cm。普通怪视野 `1200`（约 120 m），大地图塔防刷怪点距离通常 `2000~3000`，视野设 `1500` 即可让怪发现并追击目标。

---

## 常用枚举或取值说明

### 单位类型（`-create` 第 3 段）

脚本当前接受以下单位类型，并据此选择创建模板：

| 单位类型 |
|---|
| `近战小怪` |
| `远程小怪` |
| `近战精英` |
| `远程精英` |
| `近战boss` |
| `远程boss` |
| `近战英雄` |
| `远程英雄` |
| `建筑` |

### tuple 技能列表格式

`-hero_ability_list`、`-common_ability_list` 使用逗号分隔；每项建议写 `技能ID:初始等级`。只写 `技能ID` 时脚本也会写入单元素项，但编辑器运行时按二元项读取时可能不满足预期。

```bash
-hero_ability_list "100001001:1,100001002:2"
-common_ability_list "100001101"
```

脚本只按上述格式写入；更完整的单位字段和枚举说明请看单位 knowledge 文档。

## 常用示例命令

```bash
# 创建近战小怪并设置基础战斗属性
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type unit -create "200001,近战士兵,近战小怪,10001,10002" -hp_max 500 -attack_phy 35 -defense_phy 5 -ori_speed 2 -sight_range 1500

# 创建英雄并绑定英雄技能
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type unit -create "100001,洛坦,近战英雄,10011,10012" -hp_max 1200 -mp_max 300 -hero_ability_list "100001001:1,100001002:2,100001003:3,100001004:4"

# 编辑已有单位描述和成长属性
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type unit -edit 200001 -description "基础近战敌人" -hp_max_grow 20 -attack_phy_grow 2
```






## 建筑 / 碰撞字段（补充）

| 参数 | 写入字段 | 类型 | 说明 |
|------|---------|------|------|
| `-unit_type` | `type` | int | 单位分类：`1`=英雄，`2`=建筑，`4`=小怪 |
| `-build_time` | `build_time` | float | 建筑建造耗时（秒） |
| `-build_ignore_dyn_collision` | `build_ignore_dyn_collision` | bool | 建造时是否忽略其他单位的动态碰撞；陷阱类可开 |
| `-dynamic_collision_r` | `dynamic_collision_r` | float | **寻路碰撞网格边长**，每 50 为 1 个标准格；怪物要互相穿过时设 `0` |
| `-collision_radius_2` | `collision_radius_2` | float | 动态碰撞半径，默认 `0.7` |
| `-collision_points` | `collision_points` | JSON | **碰撞格点**（建筑建造占位）。格式见下 |
| `-collision_box_turning_enable` | `collision_box_turning_enable` | bool | 静态碰撞是否跟随建筑朝向，仅建筑生效 |
| `-path_finding_external_size` | `path_finding_external_size` | int | 寻路外部尺寸 |

### `collision_points` 格式

```bash
-collision_points "[[-1,-1],[2,2],[256,256,256,256,256,256,256,256,256],1.5]"
```

落盘为：

```json
{"__tuple__": true, "items": [[min_x,min_y],[max_x,max_y],[格点...],高度]}
```

- `max` 为开区间，格点数量 = `(max_x-min_x)*(max_y-min_y)`
- `256` 表示占用/碰撞层，`0` 表示空
- 3×3 建筑用 `[[-1,-1],[2,2],[256×9],1.5]`

### 删除物编

```bash
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type unit -delete 299999
```

删除会备份到 `maps/<地图>/.deleted_object_backup/`。删完必须执行
`restart_editor(save_before_restart=false)`，中间不要 `save_editor`，否则编辑器内存会把物编写回磁盘。
