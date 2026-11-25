---
name: y3-obj-edit
description: >
  Y3 物编编辑器：查询、创建和修改物编数据（单位、技能、魔法效果、投射物、物品）。
  
  ALWAYS use this skill when user mentions: 生成物编、创建单位、生成怪物、生成敌人、生成英雄、创建技能、
  创建Buff、创建魔法效果、创建投射物、做个怪物、做个Boss、设计技能、设计Buff、
  修改物编、调整属性、修改技能属性、修改Buff、批量修改、更新数值、物编数据、
  查询物编、获取物编、查看物编、物编信息。
  
  This skill handles querying, creating and editing objects.
---

# Y3 物编编辑器 v5.0

> **分发型技能**：提供物编查询和创建/修改两大功能。

---

## 🎯 功能一览

| 功能 | 说明 | 方式 |
|------|------|------|
| **查询物编** | 查询现有物编数据 | MCP 工具 |
| **创建/修改物编** | 新建或修改物编属性 | 脚本命令 |

---

## 📖 功能一：查询现有物编数据

通过 MCP 工具 `y3editor` 查询当前地图中已有的物编数据。

### 查询 MCP 工具

| 物编类型 | MCP 工具 | 参数说明 |
|----------|----------|----------|
| **单位** | `y3editor.get_editor_unit_custom_data` | `id_list`: 物编ID数组，`key_list`: 字段名数组 |
| **技能** | `y3editor.get_ability_all_custom_data` | 同上 |
| **物品** | `y3editor.get_editor_item_custom_data` | 同上 |
| **魔法效果** | `y3editor.get_modifier_all_custom_data` | 同上 |
| **投射物** | `y3editor.get_projectile_all_custom_data` | 同上 |

### 查询示例

```json
// 查询所有自定义单位（无参数返回全部）
y3editor.get_editor_unit_custom_data {}

// 查询指定ID的单位
y3editor.get_editor_unit_custom_data {"id_list": [134200001, 134200002]}

// 查询指定字段
y3editor.get_editor_unit_custom_data {"key_list": ["name", "hp_max", "attack"]}

// 组合查询
y3editor.get_editor_unit_custom_data {"id_list": [134200001], "key_list": ["name", "hp_max"]}
```

### 查询流程

```
用户请求查询物编
    │
    ▼
确定物编类型（单位/技能/物品/魔法效果/投射物）
    │
    ▼
调用对应的 MCP 查询工具
    │
    ▼
返回物编数据给用户
```

---

## 📝 功能二：创建或修改物编

通过脚本命令创建新物编或修改现有物编。

### 物编类型路由

| 物编类型 | 参考文档 |
|----------|----------|
| **单位**（英雄、怪物、NPC） | `reference/unit.md` |
| **物品**（装备、消耗品、材料） | `reference/item.md` |
| **技能**（主动、被动技能） | `reference/ability.md` |
| **魔法效果**（Buff/Debuff） | `reference/modifier.md` |
| **投射物**（弹道、技能特效） | `reference/projectile.md` |

### 创建/修改流程

```
第一步：根据物编类型查找 reference/ 下的参考文档
       → 参考文档中包含脚本命令，用于新建或修改该类型物编

第二步：循环第一步，直到处理完所有需要处理的物编类型

第三步：热更并保存（一次性执行）
```

---

## ⛔ 核心禁令

| 禁止 | 正确做法 |
|------|----------|
| 读取 `data_template/` 下的模板 JSON | 通过脚本命令操作 |
| 读取或编辑生成的物编 JSON 文件 | 通过脚本命令操作 |
| 臆造物编 ID | 查询现有物编后再决定 |

> **说明**：所有物编创建/修改必须通过 `reference/` 中定义的脚本命令完成，查询则使用 MCP 工具。

---

## 🗑️ 删除物编

```bash
py -3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py -map maps/EntryMap -type unit -delete 299999
```

删除会备份到 `maps/<地图>/.deleted_object_backup/`。删完必须执行
`restart_editor(save_before_restart=false)`，中间不要 `save_editor`，否则编辑器内存会把物编写回磁盘。

建筑字段（`build_list` / `collision_points` / `dynamic_collision_r` / `collision_radius_2`）
和碰撞格点格式见 `reference/unit.md`、`reference/ability.md`。

## 🔴 热更并保存（创建/修改后必须执行）

```
# 1. 热更物编
y3editor.hotfix_object_editor

# 2. 等待 3 秒

# 3. 保存
y3editor.save_editor
```

> **注意**：查询操作不需要热更和保存。

---

## 🔎 保存后必看「回读校验」表

`y3_obj_edit.py` 在写盘后会**回读文件**并打印一张对照表：

```
🔎 回读校验（请求值 vs 落盘值）
   ✅ attack_phy: 请求=210.0 落盘=210.0
   ✅ common_atk_range: 请求=1.28 落盘=1.28｜实际生效 simple_common_atk.attack_range=1.28
   ⚠️ attack_interval: 请求=1.2 落盘=1.2｜实际生效 simple_common_atk.attack_interval=1.0
```

**「✅ 已保存」只代表写盘成功，不代表值生效。** 出现 ⚠️ 时按提示排查：
① 是否被模板默认值覆盖；② 真正生效的字段是否在 `simple_common_atk`（普攻）内。

---

## ⛔ 能力边界：没有「玩家属性定义」入口

本技能只覆盖 `unit` / `ability` / `item` / `modifier` / `projectile` 五类物编。
**工程根的 `attr.json`（玩家属性定义）没有脚本入口**，而项目约定又禁止手写该 JSON。

因此需要「金币 / 木材」这类自定义**玩家属性（`ROLE_RES_KEY`）**时，只有两条路：

| 方案 | 说明 |
|------|------|
| A. 在编辑器「物编 → 玩家属性定义」面板手工新增 | 唯一合规做法；改完走 `hotfix_object_editor` → 等 3 秒 → `save_editor` |
| B. 改用 **ECA 全局变量** 存这些数值 | 纯 ECA 工程的常用替代（单人对局没问题；多人对局会串号，需先做 A） |

> 选 B 时 `ROLE_CHANGE_RES` / `GET_ROLE_RES` / `SET_UI_COMP_BIND_PLAYER_PROP` 都用不上，
> 改用 `SET_VARIABLE` / `MATH_OPERATION` 与 `SET_UI_COMP_BIND_VAR`
> （详见 `skills/eca-json-builder/runtime_pitfalls.md`）。

---

## 📌 常见「改了没效果」速查

| 现象 | 原因 | 处理 |
|------|------|------|
| `-create` 时射程没生效 | 历史 bug：`common_atk_range` 未被 create 路径处理 | 已修；若仍异常用 `-edit` 二次应用 |
| 攻击间隔改了没效果 | 只改了根级，实际生效在 `simple_common_atk` | 已修（自动同步两处） |
| 射程大得离谱（隔着半张图打人） | 把厘米值当米填了 | ÷100（128 → 1.28），见 `reference/unit.md` |
| 远处怪物不主动扑过来 | `alarm_range`（警戒索敌）太小，模板默认约 8 米 | 调大 `-alarm_range` |
| 编辑器里看不到刚改的值 | 只写了磁盘，没热更 | `hotfix_object_editor` → 等 3 秒 → `save_editor` |

