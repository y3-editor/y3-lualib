# 魔法效果脚本参数参考（Modifier / Buff）

本文只说明 `<agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py` 当前对 `-type modifier` 开放的脚本参数。

完整魔法效果物编字段、运行时机制、覆盖规则、光环配合关系等，请看：`<agent>/knowledge/物编系统/02-魔法效果.md`（相对链接：[`../../../knowledge/物编系统/02-魔法效果.md`](../../../knowledge/物编系统/02-魔法效果.md)）。

> 注意：本文只解释脚本当前开放的参数；完整字段和机制请看上面的 knowledge 文档。

## 基本命令

```bash
# 创建魔法效果：create 参数固定为 "效果ID,名称,图标ID"
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type modifier -create "100001101,眩晕,100008" [可选参数...]

# 修改已有魔法效果
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type modifier -edit 100001101 [可选参数...]
```

## 创建参数

| 参数 | 格式 | 说明 |
|---|---|---|
| `-create` | `"效果ID,名称,图标ID"` | 创建新魔法效果；会写入 `key`、`uid`、`_ref_`、`modifier_icon`，并把名称写入多语言 |
| `-edit` | `效果ID` | 修改已有魔法效果；与 `-create` 二选一 |
| `-map` | 地图路径 | 例如 `maps/EntryMap` |
| `-type` | `modifier` | 魔法效果固定写 `modifier` |

创建时：

- 名称使用 `-create` 的第二段；`-name` 不参与创建阶段的名称写入。
- 图标使用 `-create` 的第三段；`-modifier_icon` 不参与创建阶段的图标写入。
- `-description` 可选；不填时默认使用名称作为描述。

## 当前脚本支持的字段参数

| 参数 | 写入字段 | 脚本解析类型 | 说明 |
|---|---|---|---|
| `-name` | `name` | 字符串 | 更新名称多语言 TID；常用于 `-edit` |
| `-description` | `description` | 字符串 | 创建/修改均可用；写入多语言 TID |
| `-modifier_icon` | `modifier_icon` | 整数 | 魔法效果图标 ID；创建时图标来自 `-create` 第三段 |
| `-modifier_type` | `modifier_type` | 整数 | Buff 类型；见下方枚举 |
| `-modifier_effect` | `modifier_effect` | 整数 | Buff 影响分类，仅用于分类/筛选；见下方枚举 |
| `-layer_max` | `layer_max` | 整数 | 最大层数 |
| `-disappear_when_dead` | `disappear_when_dead` | 布尔 | `true/false`、`1/0`、`yes/no` |
| `-show_on_ui` | `show_on_ui` | 布尔 | 是否在 UI 显示图标 |
| `-shield_value` | `shield_value` | 浮点数 | 护盾值；脚本按 `float` 解析 |
| `-shield_type` | `shield_type` | 整数 | 护盾伤害类型；见下方枚举 |
| `-influence_rng` | `influence_rng` | 浮点数 | 光环影响范围 |
| `-is_influence_self` | `is_influence_self` | 布尔 | 光环是否影响自身 |
| `-material_color` | `material_color` | 整数数组 | 材质颜色 RGB，格式如 `"255,100,100"`，脚本写为 tuple-int |

## 常用枚举

### `modifier_type`：Buff 类型

| 值 | 含义 |
|---|---|
| `1` | 正常 |
| `2` | 光环 |
| `3` | 光环效果 |
| `4` | 护盾 |

### `modifier_effect`：Buff 影响倾向

| 值 | 含义 |
|---|---|
| `1` | 正常 |
| `2` | 正面 |
| `3` | 负面 |

### `shield_type`：护盾类型

| 值 | 含义 |
|---|---|
| `0` | 物理护盾 |
| `1` | 法术护盾 |
| `2` | 通用护盾 |

## 示例

```bash
# 创建负面普通 Buff
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type modifier -create "100001101,眩晕,100008" -modifier_type 1 -modifier_effect 3 -material_color "255,100,100" -description "无法移动和攻击"

# 创建护盾 Buff
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type modifier -create "100001102,能量护盾,100009" -modifier_type 4 -modifier_effect 2 -shield_value 200 -shield_type 2 -material_color "100,100,255"

# 创建光环 Buff（这里只设置脚本已开放的光环基础字段）
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type modifier -create "100001103,战斗光环,100010" -modifier_type 2 -modifier_effect 2 -influence_rng 8.0 -is_influence_self true

# 修改已有 Buff 的脚本支持字段
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type modifier -edit 100001101 -layer_max 3 -shield_value 150
```

