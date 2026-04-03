---
name: y3-obj-edit
description: Edit existing Y3 editor object data (物编) properties. Use this skill when user wants to modify, adjust, or update properties of existing units, abilities, modifiers, projectiles, or items. Triggers on phrases like "修改物编", "调整属性", "修改技能属性", "修改Buff", "批量修改", "更新数值", etc.
version: 2.0
updated: 2026-03-16
---

# Y3 物编属性编辑 v2.0

## 🔴 技能激活时自动读取（首要步骤）

**本技能激活后，开始任何物编修改之前，必须先读取：**

```
.codemaker/rules/mcp-rules.mdc     ← MCP 热更+保存流程规范
```

> 物编修改后必须按 `热更 → 等待 3 秒 → 保存` 的顺序执行，否则修改会丢失！

---

对现有物编内容进行属性调整，支持单位、技能、魔法效果、投射物等。

---

## 🎯 支持的物编类型

| 类型 | 目录 | 说明 |
|------|------|------|
| 单位 | `editorunit/` | 英雄、怪物、NPC等 |
| 技能 | `abilityall/` | 主动/被动技能 |
| 魔法效果 | `modifierall/` | Buff/Debuff |
| 投射物 | `projectileall/` | 弹道、技能特效 |

---

## 📋 工作流程

### 第一步：确认地图路径

```
{map_path}/editor_table/{type}/{id}.json
```

### 第二步：读取并修改 JSON

### 第三步：编辑器下载资源

**当修改涉及资源 ID 的字段时，需要通过 MCP 工具下载资源到编辑器。**

#### 触发下载的字段

| 资源类型 | 物编类型 | 字段路径 | MCP 工具 |
|----------|----------|----------|----------|
| **模型** | 单位 | `model` | `download_editor_model_resource` |
| **模型** | 物品 | `model` | `download_editor_model_resource` |
| **模型** | 魔法效果 | `model` | `download_editor_model_resource` |
| **模型** | 魔法效果 | `attach_model_list[*].model` | `download_editor_model_resource` |
| **模型** | 投射物 | `effect_foes[5]['model']` | `download_editor_model_resource` |
| **特效** | 投射物 | `effect_foes[0]` | `download_editor_effect_resource` |
| **特效** | 魔法效果 | `get_effect_list[*][0]` | `download_editor_effect_resource` |
| **特效** | 魔法效果 | `lose_effect_list[*][0]` | `download_editor_effect_resource` |
| **图标** | 单位 | `icon` | `download_editor_icon_resource` |
| **图标** | 技能 | `ability_icon` | `download_editor_icon_resource` |
| **图标** | 物品 | `icon` | `download_editor_icon_resource` |
| **图标** | 魔法效果 | `modifier_icon` | `download_editor_icon_resource` |
| **图标** | 投射物 | `icon` | `download_editor_icon_resource` |

#### 下载规则

1. **仅在字段值被修改时触发**：如果字段值未变化，无需下载
2. **资源 ID 为 `0` 时跳过**：`0` 表示无资源，无需下载
3. **批量修改时合并下载**：相同类型的资源 ID 合并到一个列表

#### 示例

修改单位模型和头像：
```
修改字段:
- model: 211030 → 211128 (变更)
- icon: 906907 → 133748 (变更)

MCP 调用:
1. download_editor_model_resource(editor_model_id_list=[211128])
2. download_editor_icon_resource(editor_icon_id_list=[133748])
```

### 第四步：热更并保存

**⚠️ 重要：必须先热更再保存，否则新修改的内容会丢失！**

```
# 1. 先热更物编（让编辑器重新读取 JSON 文件）
y3editor.hotfix_object_editor

# 2. 等待 3 秒（让编辑器完成内存同步）

# 3. 再保存（让编辑器将内存数据写入 GMP）
y3editor.save_editor
```

**错误做法（会导致内容丢失）：**
```
❌ 直接调用 save_editor，不调用 hotfix_object_editor
```

---

## 🧑‍🤝‍🧑 单位属性字段

| 属性 | JSON 字段 | 类型 |
|------|-----------|------|
| 名称 | `name` | TID (整数) |
| 描述 | `description` | TID (整数) |
| 模型 | `model` | 整数 |
| 头像 | `icon` | 整数 |
| 最大生命值 | `hp_max` | 浮点数 |
| 生命成长 | `hp_max_grow` | 浮点数 |
| 物理攻击 | `attack_phy` | 浮点数 |
| 攻击成长 | `attack_phy_grow` | 浮点数 |
| 物理防御 | `defense_phy` | 浮点数 |
| 魔法防御 | `defense_mag` | 浮点数 |
| 攻击速度 | `attack_speed` | 浮点数 |
| 攻击间隔 | `attack_interval` | 浮点数 |
| 攻击类型 | `common_atk_type` | 整数 (0=近战, 1=远程) |
| 移动速度 | `ori_speed` | 浮点数 |
| 英雄技能列表 | `hero_ability_list` | tuple 数组 |

### 简易普攻字段

```json
{
  "simple_common_atk": {
    "attack_trajectory": {
      "effect": 102892  // 弹道特效ID，近战为0
    },
    "hit_effect": {
      "effect": 104982  // 受击特效ID（必须是对象）
    }
  }
}
```

---

## ⚔️ 技能属性字段

| 属性 | JSON 字段 | 类型 | 说明 |
|------|-----------|------|------|
| 技能ID | `key` | 整数 | |
| 名称 | `name` | TID | |
| 描述 | `description` | TID | |
| 图标 | `ability_icon` | 整数 | |
| 技能类型 | `ability_cast_type` | 整数 | 2=主动技能 |
| **释放方式** | `sight_type` | 整数 | 见下表 |
| 冷却时间 | `cold_down_time` | tuple数组 | `["8"]` |
| 魔法消耗 | `ability_cost` | tuple数组 | `["70"]` |
| 生命消耗 | `ability_hp_cost` | tuple数组 | `["0"]` |
| 基础伤害 | `ability_damage` | tuple数组 | `["150"]` |
| 伤害范围 | `ability_damage_range` | tuple数组 | `["3.0"]` |
| 施法距离 | `ability_cast_range` | tuple数组 | `["10.0"]` |
| 最大等级 | `ability_max_level` | 整数 | |
| 立即释放 | `is_immediate` | 布尔 | |
| 近战技能 | `is_meele` | 布尔 | |
| 施法前摇 | `ability_cast_point` | 浮点数 | |
| 施法后摇 | `ability_bw_point` | 浮点数 | |
| 自定义KV | `kv` | 对象 | 自定义参数 |

### sight_type 释放方式

| 值 | 释放方式 | 说明 |
|----|----------|------|
| 0 | 立即释放 | 点击技能直接释放 |
| 1 | 选地点（圆形） | 显示圆形指示器 |
| 2 | 选地点（扇形） | 显示扇形指示器 |
| 3 | 选地点（箭头） | 显示矩形/箭头指示器 |
| 4 | 选目标单位 | 需要点选一个单位 |

### 指示器相关字段

| 字段 | 说明 |
|------|------|
| `circle_radius` | 圆形指示器半径 |
| `sector_radius` | 扇形指示器半径 |
| `sector_angle` | 扇形指示器角度 |
| `arrow_length` | 箭头指示器长度 |
| `arrow_width` | 箭头指示器宽度 |

### 技能等级需求

```json
"required_level": {
    "formula": "",
    "required_levels": {
        "__tuple__": true,
        "items": [1, 3, 5, 7, 9]  // 1/3/5/7/9 级可学习
    }
}
```

---

## 🛡️ 魔法效果（Buff）属性字段

| 属性 | JSON 字段 | 类型 | 说明 |
|------|-----------|------|------|
| 效果ID | `key` | 整数 | |
| 名称 | `name` | TID | |
| 描述 | `description` | TID | |
| 图标 | `modifier_icon` | 整数 | |
| **效果类型** | `modifier_type` | 整数 | 1=增益, 2=减益 |
| **效果表现** | `modifier_effect` | 整数 | 见下表 |
| 最大层数 | `layer_max` | 整数 | |
| 死亡消失 | `disappear_when_dead` | 布尔 | |
| UI显示 | `show_on_ui` | 布尔 | |
| 材质颜色 | `material_color` | 数组 | [R, G, B] |
| 护盾值 | `shield_value` | 浮点数 | 护盾类型时有效 |
| 护盾类型 | `shield_type` | 整数 | |
| 光环范围 | `influence_rng` | 浮点数 | 光环类型时有效 |
| 影响自身 | `is_influence_self` | 布尔 | |

### modifier_effect 效果表现

| 值 | 说明 |
|----|------|
| 1 | 普通效果 |
| 2 | 控制效果 |
| 3 | 护盾效果 |
| 4 | �光环效果 |

### modifier_type Buff 类型

| 值 | 说明 |
|----|------|
| 1 | 增益 (Buff) |
| 2 | 减益 (Debuff) |

---

## 🚀 投射物属性字段

| 属性 | JSON 字段 | 类型 | 说明 |
|------|-----------|------|------|
| 投射物ID | `key` | 整数 | |
| 名称 | `name` | TID | |
| 描述 | `description` | TID | |
| 图标 | `icon` | 整数 | |
| 最大持续时间 | `max_duration` | 整数 | 秒 |
| 移动通道 | `move_channel` | 整数 | |
| 移动限制 | `move_limitation` | 整数 | |
| 特效循环 | `sfx_loop` | 布尔 | |
| 对敌特效 | `effect_foes` | tuple | 复杂结构 |
| 对友特效 | `effect_friend` | tuple | 复杂结构 |

### 特效结构

```json
"effect_foes": {
    "__tuple__": true,
    "items": [
        100430,              // 特效ID
        [0.0, 0.0, 0.0],    // 偏移
        [0.0, 0.0, 0.0],    // 旋转
        [1.0, 1.0, 1.0],    // 缩放
        1.0,                 // 透明度
        {
            "model": 103014,
            "anim": "idle1",
            "is_loop": true,
            // ...
        }
    ]
}
```

---

## 📝 __tuple__ 格式说明

Y3 使用特殊的 tuple 格式表示可变等级数组：

```json
// 正确格式
"cold_down_time": {
    "__tuple__": true,
    "items": ["8", "7", "6", "5", "4"]  // 5个等级的冷却
}

// 错误格式
"cold_down_time": ["8", "7", "6", "5", "4"]
```

**注意**：数值是字符串格式 `"8"` 而不是数字 `8`。

---

## 🔧 批量修改示例

### 修改技能冷却和消耗

```python
import json

# 读取技能
with open("maps/EntryMap/editor_table/abilityall/100001001.json", "r", encoding="utf-8") as f:
    skill = json.load(f)

# 修改冷却（5个等级）
skill["cold_down_time"]["items"] = ["10", "9", "8", "7", "6"]

# 修改消耗
skill["ability_cost"]["items"] = ["50", "60", "70", "80", "90"]

# 保存
with open("maps/EntryMap/editor_table/abilityall/100001001.json", "w", encoding="utf-8") as f:
    json.dump(skill, f, ensure_ascii=False, indent=4)
```

### 修改释放方式

```python
# 改为选地点释放（圆形指示器）
skill["sight_type"] = 1
skill["is_immediate"] = False
skill["circle_radius"]["items"] = ["5.0"]
```

### 修改 Buff 为减益效果

```python
with open("maps/EntryMap/editor_table/modifierall/100001101.json", "r", encoding="utf-8") as f:
    buff = json.load(f)

buff["modifier_type"] = 2  # 减益
buff["modifier_effect"] = 2  # 控制效果
buff["material_color"]["items"] = [255, 100, 100]  # 红色
```

---

## 🔄 资源依赖管理

修改模型、特效等资源时，需同步更新 `cloudresdependence.json`：

```json
{
  "Model": [100146, 101415],
  "Effect": [102892, 104982],
  "Sound": [200001],
  "Icon": [903950, 903952]
}
```

---

## ⚠️ 注意事项

1. **字段类型**：`uid` 必须是字符串，`key` 必须是整数
2. **tuple 格式**：数组必须用 `__tuple__` 包装
3. **数值字符串**：tuple 内的数值通常是字符串格式
4. **热更物编**：修改后需要调用 `y3editor.hotfix_object_editor`
5. **备份**：建议修改前备份原文件

---

*最后更新: 2026-03-16 v2.0*
