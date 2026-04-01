# Y3 Lua API 错误速查

记录 Y3 Lua API 常见错误和正确用法。

---

## 玩家相关

| 错误 API | 正确 API |
|----------|----------|
| `y3.player.with_all_players(fn)` | `y3.player_group.get_all_players():pick()` 遍历 |
| `player:camera_follow_unit(unit)` | `y3.camera.set_camera_follow_unit(player, unit, 0, 0, 0)` |
| `y3.player.get_enemy_player_group_by_player(p)` | `y3.player_group.get_enemy_player_group_by_player(p)` |

---

## 单位相关

| 错误 API | 正确 API |
|----------|----------|
| `unit:attack(target)` | `unit:attack_target(target, 0)` |
| `unit:is_dead()` | `unit:is_alive()` 取反 |
| `unit:cause_damage_to_unit(...)` | `unit:damage({target=..., damage=..., type='physics'})` |

---

## 事件参数

### 单位-死亡
```lua
-- ❌ 错误
data.dying_unit, data.killer_unit

-- ✅ 正确
data.unit, data.source_unit
```

### 单位-造成伤害
```lua
-- ❌ 错误
data.damage_value

-- ✅ 正确
data.damage
```

---

## 键盘常量

```lua
-- ❌ 错误
y3.game:event('键盘-按下', function(trg, data)
    if data.key == '1' then  -- 静默失败
end)

-- ✅ 正确
if data.key == y3.const.KeyboardKey['KEY_1'] then
```

---

## UI 回调

```lua
-- ❌ 错误（静默失败）
comp:add_event('左键-点击', function() end)

-- ✅ 正确
comp:add_fast_event('左键-点击', player, function() end)
```

---

## 坐标与角度

```lua
-- ❌ Y 轴方向错误
point:add(0, 100)  -- 向南移动（Y+）

-- ✅ 正确（向北移动）
point:add(0, -100)  -- Y- = 北/上

-- ❌ 角度单位错误
y3.mover.create_mover_line(point, 45, ...)

-- ✅ 转换为弧度
y3.mover.create_mover_line(point, math.rad(45), ...)
```

---

## 快速验证

```bash
# 验证 API 存在
grep -rn "function.*方法名" y3/

# 验证事件参数
grep -A 10 "事件名" y3/meta/event.lua
```
