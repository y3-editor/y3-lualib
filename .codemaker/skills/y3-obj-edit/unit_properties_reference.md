# 单位物编属性参考表

> 📦 提取自 Y3 编辑器源码，用于 `y3-obj-gen` 和 `y3-obj-edit` 技能

---

## 🎯 枚举属性速查表

### 1. `default_behaviour_type` - 默认行为模式

**⚠️ 回合制RPG必须设为空！**

| 值 | 说明 | 适用场景 |
|---|------|----------|
| `""` | **无** (NONE) | 回合制RPG（禁用自动攻击） |
| `"caution"` | **警戒** (ALERT) - 默认值 | RTS/MOBA |
| `"defense"` | **防守** (DEFENSE) | 塔防 |
| `"y3_tower"` | **防御塔** (TOWER) | 塔类单位 |

---

### 2. `attack_type` - 攻击类型

| 值 | 说明 |
|---|------|
| `1` | **物理** (PHY) - 默认 |
| `2` | **魔法** (MAG) |

---

### 3. `armor_type` - 护甲类型

| 值 | 说明 |
|---|------|
| `1` | **物理** (PHY) - 默认 |
| `2` | **魔法** (MAG) |

---

### 4. `common_atk_type` - 普攻类型

| 值 | 说明 |
|---|------|
| `0` | **近战** (Melee) - 默认 |
| `1` | **远程** (Remote) |
| `2` | **自定义** (Custom) |
| `999` | **无** (Empty) |

---

### 5. `move_channel` - 移动通道

| 值 | 说明 |
|---|------|
| `0` | **陆地** (Land) - 默认 |
| `1` | **空中** (Air) |

---

### 6. `move_limitation` - 移动限制（位运算）

**陆地单位 (move_channel=0):**

| 值 | 说明 |
|---|------|
| `1` | 陆地 (Land) |
| `2` | 摆件 (Item) |
| `4` | 海洋 (Water) |

**空中单位 (move_channel=1):**

| 值 | 说明 |
|---|------|
| `1` | 空中 (Air) |

---

### 7. `rescue_seeker_type` - 求援类型

| 值 | 说明 |
|---|------|
| `0` | **不求援** (NO_SEEK) - 默认 |
| `1` | 进入战斗时 (WHEN_ENTER_BATTLE) |
| `2` | 受伤时 (WHEN_DAMAGED) |
| `3` | 攻击或受伤时 (WHEN_ATTACK_OR_DAMAGED) |

---

### 8. `rescuer_type` - 救援类型

| 值 | 说明 |
|---|------|
| `0` | 不救援 (NO_RESCUE) |
| `1` | 救援到点 (RESCUE_TO_POINT) |
| `2` | **救援到目标** (RESCUE_TO_TARGET) - 默认 |

---

### 9. `bar_show_name` - 头顶名称显示

| 值 | 说明 |
|---|------|
| `0` | 不显示 |
| `1` | **玩家名字** - 默认 |
| `2` | 单位名字 |

---

### 10. `blood_show_type` - 血条显示类型

| 值 | 说明 |
|---|------|
| `0` | 全部显示 (ALL) |
| `1` | **非满血时显示** (NOT_FULL) - 默认 |

---

### 11. `type` - 单位类型

| 值 | 说明 |
|---|------|
| `1` | 英雄 |
| `2` | 普通单位 |
| `3` | 建筑 |
| ... | 见 `unit_category_list` |

---

### 12. `main_attr` - 主属性

| 值 | 说明 |
|---|------|
| `"strength"` | 力量 - 默认 |
| `"agility"` | 敏捷 |
| `"intelligence"` | 智力 |

---

## 📊 数值属性（基础）

| 属性键 | 说明 | 默认值 | 范围 |
|--------|------|--------|------|
| `hp_max` | 最大生命值 | 1000 | 动态 |
| `mp_max` | 最大技能资源 | 1000 | 动态 |
| `hp_rec` | 生命每5秒恢复 | 10 | 动态 |
| `mp_rec` | 技能资源每5秒恢复 | 10 | 动态 |
| `attack_phy` | 物理攻击 | 50 | 动态 |
| `attack_mag` | 魔法攻击 | 50 | 动态 |
| `defense_phy` | 物理防御 | 10 | 动态 |
| `defense_mag` | 魔法防御 | 10 | 动态 |
| `attack_speed` | 攻速 | 1 | 动态 |
| `attack_interval` | 攻击间隔 | 1.0 | 0.01~10 |
| `attack_range` | 攻击范围 | 10 | 0~1000000 |
| `cd_reduce` | 冷却缩减 | 0 | 动态 |
| `hit_rate` | 命中率 | 1 | 动态 |
| `dodge_rate` | 闪避率 | 0 | 动态 |
| `critical_chance` | 暴击率 | 0 | 动态 |
| `critical_dmg` | 暴击伤害 | 2 | 动态 |
| `pene_phy` | 物理穿透 | 0 | 动态 |
| `pene_mag` | 魔法穿透 | 0 | 动态 |
| `vampire_phy` | 物理吸血 | 0 | 动态 |
| `vampire_mag` | 魔法吸血 | 0 | 动态 |
| `dmg_reduction` | 伤害减免 | 0 | 动态 |
| `extra_dmg` | 伤害增幅 | 0 | 动态 |
| `healing_effect` | 治疗效果 | 0 | 动态 |
| `ori_speed` | 移动速度 | 0 | 动态 |
| `vision_rng` | 视野范围 | 80 | 0~100000 |
| `vision_night` | 夜间视野 | 80 | 0~100000 |
| `strength` | 力量 | 10 | - |
| `agility` | 敏捷 | 10 | - |
| `intelligence` | 智力 | 10 | - |

---

## 📈 成长属性

所有基础属性都有对应的 `_grow` 后缀版本，如：
- `hp_max_grow` - 每级生命成长
- `attack_phy_grow` - 每级物攻成长
- `strength_grow` - 每级力量成长

---

## 🎭 外观属性

| 属性键 | 说明 | 默认值 |
|--------|------|--------|
| `model` | 模型资源ID | 100028 |
| `icon` | 图标资源ID | 100000 |
| `body_size` | 身体尺寸 | 1 |
| `model_height` | 模型高度 | 1.5 |
| `idle_anim` | 待机动画 | "idle1" |
| `walk_anim` | 行走动画 | "walk" |
| `die_anim` | 死亡动画 | "die" |
| `rotate_speed` | 转身速度 | 12 |

---

## 🔧 其他关键属性

| 属性键 | 说明 | 默认值 |
|--------|------|--------|
| `level` | 等级 | 1 |
| `destroy_after_die` | 死后销毁 | true |
| `keep_dead_body_time` | 尸体保留时间(秒) | 2 |
| `is_mini_map_show` | 小地图显示 | true |
| `has_mp` | 有技能资源 | true |
| `keep_target` | 保持目标 | true |
| `can_flee` | 可逃跑 | true |
| `poolable` | 可池化 | false |
| `alarm_range` | 警戒范围 | 10 |
| `cancel_alarm_range` | 取消警戒范围 | 10 |
| `counterattack_range` | 反击范围 | 0 |

---

## 📌 使用示例

### 回合制单位配置
```json
{
  "default_behaviour_type": "",
  "attack_type": 1,
  "armor_type": 1,
  "common_atk_type": 0,
  "keep_target": false,
  "can_flee": false,
  "rescue_seeker_type": 0
}
```

### MOBA单位配置
```json
{
  "default_behaviour_type": "caution",
  "attack_type": 1,
  "armor_type": 1,
  "common_atk_type": 1,
  "rescue_seeker_type": 3,
  "rescuer_type": 2
}
```

---

## ⚠️ 注意事项

1. **centimeter 属性**: 标记了 `centimeter=True` 的属性在编辑器显示时会自动转换单位
2. **hide 属性**: `hide=True` 的属性在编辑器界面不显示，但仍可通过代码设置
3. **no_render 属性**: `no_render=True` 的属性不会渲染到UI
4. **范围限制**: 部分属性有 `range` 限制，超出会被截断

---

*最后更新: 基于 Y3 编辑器 2024 版本源码*
