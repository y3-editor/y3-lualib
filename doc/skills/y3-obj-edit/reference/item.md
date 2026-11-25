# 物品脚本参数参考（Item）

本文只说明 `<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py` 当前对 `-type item` 实际处理的脚本参数。
完整物品物编字段、字段语义和更细枚举请参考：`<agent>/knowledge/物编系统/07-物品.md`（相对链接：[`../../../knowledge/物编系统/07-物品.md`](../../../knowledge/物编系统/07-物品.md)）。

- 对应脚本：`<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py`
- 对应类型：`-type item`


## 辅助使用规范（非脚本字段参数）

以下内容用于规划物品 ID 和理解常见字段；它们不是 `y3_obj_edit.py` 的新增命令行参数。

### 物品 ID 规划

```text
物品 ID：500001 - 599999（常用前缀 5）
消耗品：500001 - 509999
装备：  510001 - 519999
材料：  520001 - 529999
```

### 常见基础字段对应

| 概念 | 落盘字段 | 与脚本关系 |
|---|---|---|
| 物品 ID | `key` / `uid` / `_ref_` | 由 `-create` 的物品 ID 初始化；`-edit` 用该 ID 定位 |
| 名称 | `name` | `-create` 名称或 `-name` 写入多语言 TID |
| 描述 | `description` | `-description` 写入多语言 TID |
| 图标 | `icon` | `-create` 第 3 段或 `-icon` |
| 掉落物模型 | `model` | `-model` |
| 物品等级 | `level` | `-level` |

### 堆叠、充能与行为字段

| 分类 | 脚本参数 |
|---|---|
| 堆叠/充能上限 | `-maximum_stacking`、`-maximum_charging` |
| 初始数量 | `-cur_stack`、`-cur_charge` |
| 使用消耗 | `-use_consume` |
| 行为开关 | `-auto_use`、`-discard_enable`、`-discard_when_dead`、`-delete_on_discard`、`-sale_enable` |
| 掉落物状态 | `-drop_stay_time`、`-hp_max` |

### 附加属性字段

所有脚本开放的 `attached_*` 附加属性参数都会写入 5 元素数组：

```text
[基础属性, 基础加成, 增益属性, 增益加成, 总属性加成]
```

技能绑定类字段使用 tuple 整数数组：`-attached_ability`、`-attached_passive_abilities`。

## 基本命令

```bash
# 创建物品
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type item -create "500001,生命药水,100000" [字段参数...]

# 编辑已有物品
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type item -edit 500001 [字段参数...]
```

## 创建参数格式

| 参数 | 格式 | 说明 |
|---|---|---|
| `-create` | `"物品ID,名称,图标ID"` | 创建物品；名称写入多语言，图标 ID 写入 `icon`。 |
| `-edit` | `物品ID` | 编辑已有物品；与 `-create` 二选一。 |
| `-map` | 地图路径 | 例如 `maps/EntryMap`。 |
| `-type` | `item` | 固定写 `item`。 |

创建时：`-create` 的名称和图标 ID 已分别用于初始化 `name`、`icon`；如同时传入下表字段参数，脚本会按当前实现继续覆盖对应字段。`-description` 不填时默认使用名称作为描述。

## 当前脚本支持的字段参数表

| 参数 | 写入字段 | 脚本解析类型 | 说明 |
|---|---|---|---|
| `-name` | `name` | 字符串 | 更新名称多语言 TID；常用于 `-edit`。 |
| `-description` | `description` | 字符串 | 更新描述多语言 TID；创建时不传则默认使用名称。 |
| `-icon` | `icon` | 整数 | 物品图标 ID；创建时图标来自 `-create` 第 3 段。 |
| `-model` | `model` | 整数 | 掉落物模型 ID。 |
| `-level` | `level` | 整数 | 物品等级。 |
| `-maximum_stacking` | `maximum_stacking` | 整数 | 最大堆叠数量。 |
| `-maximum_charging` | `maximum_charging` | 整数 | 最大充能数量。 |
| `-cur_stack` | `cur_stack` | 整数 | 初始堆叠数量。 |
| `-cur_charge` | `cur_charge` | 整数 | 初始充能数量。 |
| `-auto_use` | `auto_use` | 布尔 | 是否自动使用。 |
| `-use_consume` | `use_consume` | 整数 | 每次使用消耗的堆叠数或充能数；无堆叠/充能类型时运行时不消耗。 |
| `-discard_enable` | `discard_enable` | 布尔 | 是否可丢弃。 |
| `-discard_when_dead` | `discard_when_dead` | 布尔 | 死亡时是否丢弃。 |
| `-delete_on_discard` | `delete_on_discard` | 布尔 | 丢弃时是否删除。 |
| `-sale_enable` | `sale_enable` | 布尔 | 是否可出售。 |
| `-drop_stay_time` | `drop_stay_time` | 整数 | 掉落物存在时间。 |
| `-hp_max` | `hp_max` | 整数 | 掉落物最大生命。 |
| `-attached_hp_max` | `attached_hp_max` | 附加属性数组 | 格式见下方。 |
| `-attached_hp_rec` | `attached_hp_rec` | 附加属性数组 | 格式见下方。 |
| `-attached_mp_max` | `attached_mp_max` | 附加属性数组 | 格式见下方。 |
| `-attached_mp_rec` | `attached_mp_rec` | 附加属性数组 | 格式见下方。 |
| `-attached_attack_phy` | `attached_attack_phy` | 附加属性数组 | 格式见下方。 |
| `-attached_attack_mag` | `attached_attack_mag` | 附加属性数组 | 格式见下方。 |
| `-attached_defense_phy` | `attached_defense_phy` | 附加属性数组 | 格式见下方。 |
| `-attached_defense_mag` | `attached_defense_mag` | 附加属性数组 | 格式见下方。 |
| `-attached_strength` | `attached_strength` | 附加属性数组 | 格式见下方。 |
| `-attached_agility` | `attached_agility` | 附加属性数组 | 格式见下方。 |
| `-attached_intelligence` | `attached_intelligence` | 附加属性数组 | 格式见下方。 |
| `-attached_critical_chance` | `attached_critical_chance` | 附加属性数组 | 格式见下方。 |
| `-attached_critical_dmg` | `attached_critical_dmg` | 附加属性数组 | 格式见下方。 |
| `-attached_dodge_rate` | `attached_dodge_rate` | 附加属性数组 | 格式见下方。 |
| `-attached_hit_rate` | `attached_hit_rate` | 附加属性数组 | 格式见下方。 |
| `-attached_pene_phy` | `attached_pene_phy` | 附加属性数组 | 格式见下方。 |
| `-attached_pene_mag` | `attached_pene_mag` | 附加属性数组 | 格式见下方。 |
| `-attached_attack_speed` | `attached_attack_speed` | 附加属性数组 | 格式见下方。 |
| `-attached_move_speed` | `attached_move_speed` | 附加属性数组 | 格式见下方。 |
| `-attached_ability` | `attached_ability` | 整数数组 | 主动技能 ID 列表，逗号分隔。 |
| `-attached_passive_abilities` | `attached_passive_abilities` | 整数数组 | 被动技能 ID 列表，逗号分隔。 |

## 常用枚举或取值说明

### 布尔参数

`-auto_use`、`-discard_enable`、`-discard_when_dead`、`-delete_on_discard`、`-sale_enable` 可写：`true/false`、`1/0`、`yes/no`。

### 附加属性数组格式

所有 `attached_*` 附加属性参数支持两种输入：

```bash
-attached_attack_phy "50,0,0,0,0"  # 5 个值：[基础属性, 基础加成, 增益属性, 增益加成, 总属性加成]
-attached_attack_phy 50              # 单值简写，脚本补齐为 [50,0,0,0,0]
```

### 使用消耗

`-use_consume` 表示每次使用时扣除的数量：堆叠物品扣堆叠数，充能物品扣充能数；如果物品不是堆叠/充能类型，运行时按 0 消耗处理。

### 整数数组格式

`-attached_ability`、`-attached_passive_abilities` 使用逗号分隔整数：

```bash
-attached_ability "100001001,100001002"
-attached_passive_abilities "100001101"
```

脚本只按上述格式写入；更完整的物品字段和枚举说明请看物品 knowledge 文档。

## 常用示例命令

```bash
# 创建可堆叠消耗品
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type item -create "500001,生命药水,100000" -level 1 -maximum_stacking 10 -cur_stack 1 -use_consume 1 -discard_enable true

# 创建装备并附加攻击力和生命
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type item -create "510001,勇气长剑,100010" -level 3 -attached_attack_phy "50,0,0,0,0" -attached_hp_max 200 -sale_enable true

# 编辑已有物品绑定技能
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type item -edit 510001 -attached_ability "100001001" -attached_passive_abilities "100001101,100001102"
```




