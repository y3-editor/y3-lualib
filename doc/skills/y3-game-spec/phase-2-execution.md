# 阶段 2：拆分为执行案 + API 预检 + 制作

> 本文件从 `SKILL.md` 拆分，详细定义阶段 2 的执行规范。
> 主文件 `SKILL.md` 中保留阶段 2 的入口和概要，详细规则引用本文件。

---

## 📋 触发条件

策划案已确认，用户说"开始制作"或"拆分为执行案"。

## 📋 输入

策划案文档（`{gameName}设计案.md`）

## 📋 输出物

按 `spec-config.json` 配置输出：`{paths.executionDoc}/{gameName}执行案.md`

---

## 🔨 执行步骤

### Step 1：从策划案拆分 Phase

执行案采用两级 Phase 结构：**开头固定 Phase 序列** + **末尾固定章节**。

#### 固定 Phase 序列（所有游戏类型必须包含）

```markdown
## Phase 1：物编准备 + 场景模板匹配
> 使用技能：`y3-obj-edit` + `y3-terrain-template`

### 场景模板匹配（优先执行）
（按策划案 §3.5 走模板匹配 → 命中导入 / 未命中手动摆放）

### 功能清单
| 策划案 ID | 功能 | 验收点 | 参考 API | 参考事件 | 依赖 | 状态 |
|-----------|------|--------|----------|----------|------|------|

## Phase 2：UI 开发
> 使用技能：`y3-ui-pipeline`
（功能清单同上格式）

## Phase 3：核心玩法（Lua）
> 使用技能：`y3-lua-pipeline`
（功能清单同上格式）

## Phase 4：扩展机制（Lua）
> 使用技能：`y3-lua-pipeline`
（功能清单同上格式）

## Phase 5：Lua 审查
> 使用技能：`y3-lua-review`

## Phase 6：测试验收
> 使用技能：`y3-auto-test`
```

> **规则**：
> - Phase 1 合并「物编生产 + 场景模板匹配 + 场景逻辑节点摆放」
> - Phase 2 放置所有 UI 开发功能
> - Phase 3/4 的具体功能从策划案第 2~7 章提取，按「核心玩法」和「扩展机制」分配
> - 若策划案功能不足，Phase 4 合并到 Phase 3，在执行案标注"Phase 4 已合并到 Phase 3"
> - Phase 5 Lua 审查始终在最后一个开发 Phase 之后
> - Phase 6 测试验收可选，但一旦进入必须走 `y3-auto-test` 完整流程

#### 动态 Phase 3/4 内容速查

| 游戏类型 | Phase 3（核心玩法） | Phase 4（扩展机制） |
|----------|-------------------|-------------------|
| **塔防** | 波次管理 + 塔建造 + 敌人行进 + 经济 | 塔升级 + 出售 + AOE/减速 + 胜负判定 |
| **RPG** | 英雄控制 + 战斗系统 + 技能释放 | 装备/物品 + 任务系统 + 存档 |
| **肉鸽** | 房间生成 + 战斗 + 选择系统 | 永久升级 + 成就 + 难度递增 |
| **生存** | 资源采集 + 建造系统 + 威胁系统 | 科技树 + 环境事件 + 存活评分 |
| **MOBA** | 英雄技能 + 兵线 + 野怪 | 装备商店 + 团战机制 + 推塔判定 |
| **休闲/解谜** | 核心交互 + 关卡逻辑 | 评分系统 + 关卡选择 + 成就 |

#### 🆕 Phase 3 强制必含模块（所有游戏类型适用）

> 以下模块为运行时基础设施，**所有游戏 Phase 3 功能清单必须包含**，缺失即判执行案不合规。

| 模块 ID | 用途 | 验收点 | 实现要点 |
|--------|------|--------|---------|
| **`M-reload`** | 初始化与热重载 | `可重载的代码.lua` 入口 include 所有模块；三层触发（`游戏-初始化` + `ltimer.wait(0.1)` + `onAfterReload`）；`init()` 幂等（4 项清理：timer / 单位 / 状态 / 路径） | 见 Phase 1 §🔄 热重载处理 |
| `M-lock-select`（按需） | 默认选中关键单位（基地/英雄）+ 禁用点选/框选 | RTS 类按需启用；建造类塔防必须启用 | `player:select_unit(base)` + `player:set_all_operation_key(1/2, false)` |

> 如游戏类型属于"点选驱动"（塔防/MOBA/RTS），`M-lock-select` 也应纳入 Phase 3 必含模块，由策划案 §6.4「默认 3C 禁用清单」决定。

### 🗺️ 场景逻辑节点强制规则（Phase 1）

> ⚠️ **场景中需要用到的逻辑节点（点、区域、路径等），必须通过专用 MCP 静态摆放到场景上，禁止在 Lua 代码中动态创建。**
> **`entity_create_block` 是装饰物用的（模型实体），不是逻辑节点用的！**

| 规则 | 说明 |
|------|------|
| **静态摆放** | 使用对应 MCP：点→`y3editor.add_point(pos_x, pos_y)`、路径→`y3editor.add_point_path(point_pos_list)`、矩形区域→`y3editor.add_rect_area(...)`、圆形区域→`y3editor.add_circle_area(...)` |
| **代码引用** | Lua 代码通过 `get_xxx_by_res_id(res_id)` 引用已摆放节点，不创建 |
| **禁止动态创建** | ❌ `y3.point.create()` / `y3.area.create_circle_area()` / `y3.road.create_path()` 等 |
| **禁止用 entity_create_block 创建逻辑节点** | ❌ `entity_create_block` 仅用于装饰物/模型实体（type=16777216），不可用于 type=1024/2048/4096/8192 等逻辑资源 |

**原因：**
- 动态创建的逻辑节点**不持久化**，关卡重启后消失
- 静态摆放写入 `logicres.json`，可被运行时稳定取回

**逻辑资源 type 位掩码速查：**

| 类型号 | 名称 | 常量 |
|--------|------|------|
| `1024` | 点 | `POINT = 2^10` |
| `2048` | 矩形区域 | `AREA_RECTANGLE = 2^11` |
| `4096` | 圆形区域 | `AREA_CIRCULAR = 2^12` |
| `8192` | 路径 | `ROAD_POINT_LIST = 2^13` |
| `4194304` | 多边形区域 | `AREA_POLY = 2^22` |

**示例：摆放一个刷怪点**
```
y3editor.add_point( pos_x=0, pos_y=500 )
// res_id 返回后记录，Lua 中通过 y3.point.get_point_by_res_id(res_id) 引用
```

### 🗺️ 路径使用实战手册（Phase 1 → Phase 3 必读）

> 场景模板导入后，路径（PointPath）已静态摆放在场景上，Lua 层需要通过 `res_id` 获取并使用。

#### 路径获取

```lua
-- 方式1：通过 res_id 获取（模板导入/手动 MCP 摆放后已知 res_id）
local ok, road = pcall(y3.road.get_road_by_res_id, 10000)
if ok and road then
    log.info('[TD] 使用编辑器路径，航点数=' .. road:get_point_count())
end

-- 方式2：兜底方案——写死坐标（当 res_id 未知或获取失败时）
-- 在 td_config.lua 中定义 PATH_POINTS 硬编码航点坐标（单位：编辑器 cm）
M.PATH_POINTS = {
    { x = -1323, y = -555 },
    { x = -920, y = -555 },
    -- ... 共 14 个航点
}
```

#### 怪物沿路径移动

```lua
-- 推荐：move_along_road（引擎路径系统，自动寻路）
enemy:move_along_road(ROAD, '单向', false, true, false)
-- 参数：(road, 巡逻模式, can_attack, start_from_nearest, back_to_nearest)
-- 巡逻模式: '单向' / '循环' / '往返'
```

> **路径模式常量**：`'once'`（等同于 `'单向'`）/ `'loop'` / `'ping_pong'`

#### 到达终点检测（lua 轮询版）

路径系统 `move_along_road` 不自动通知何时到终点，需轮询距离：

```lua
function M.check_arrival(unit, endpoint)
    local t = y3.ltimer.loop(0.5, function(t)
        if not unit:is_exist() then t:remove() return end
        local pos = unit:get_point()
        if pos and endpoint then
            local dist = pos:get_distance_with(endpoint)
            if dist <= 80 then
                t:remove()
                -- 扣除基地生命、移除怪物
                State.lose_life(dmg)
                unit:remove()
            end
        end
    end)
    table.insert(M.timers, t)  -- 追踪 timer 以便重新开始时清理
end
```

#### 路径终点坐标

```lua
local last_wp = Config.PATH_POINTS[#Config.PATH_POINTS]
local endpoint = y3.point.create(last_wp.x, last_wp.y, 0)
```

#### ⚠️ 已知陷阱

| 陷阱 | 说明 | 正确做法 |
|------|------|---------|
| `road:get_point(n)` 不存在 | Y3 路径对象无获取单点 API | 写死坐标数组兜底，或用 `get_point_count()` + 航点表索引 |
| 移动结束事件不可靠 | `'单位-移动结束'` 事件在 repeat-move 模式下不触发 | 用 ltimer 轮询距离检测 |
| 坐标单位 | 编辑器 MCP 使用 cm，Lua `point.create()` 也使用 cm | 保持一致即可 |

### 🔄 热重载处理（Phase 1C/3 必须）

> Y3 编辑器支持 **Lua 热重载**（`.rd` 命令 / 快捷键），开发阶段频繁使用。所有 Lua 模块必须正确处理重载，否则会出现事件叠加、timer 泄漏等问题。

#### 入口文件结构（`可重载的代码.lua`）

```lua
-- 使用 include 加载模块（require 不支持热重载）
include 'td_config'
include 'td_state'
include 'td_game'
-- ...

-- 首次初始化
y3.game:event('游戏-初始化', init_td)

-- 编辑器直接运行也初始化（延迟等模块加载完毕）
y3.ltimer.wait(0.1, function() init_td() end)

-- 重载时重新初始化
y3.reload.onAfterReload(function(_, has_reloaded)
    if has_reloaded then init_td() end
end)
```

> **关键区别**：
> - `require` — 只在首次加载，重载不刷新 → ❌ 开发阶段禁用
> - `include`（即 `y3.reload.include`）— 支持热重载，重载时重新执行 → ✅ 开发阶段必须

#### init() 幂等性（4 项强制清理）

每次 `init()` 可能被调用多次（启动 + 重载 + 重新开始），必须包含：

```lua
function M.init(player)
    -- 1. 清理旧 timer（防泄漏）
    for _, t in ipairs(M.timers) do
        if t then t:remove() end
    end
    M.timers = {}

    -- 2. 清理旧单位（防叠加）
    if M.base_unit and M.base_unit:is_exist() then M.base_unit:remove() end
    for _, m in ipairs(M.alive_monsters or {}) do
        if m and m:is_exist() then m:remove() end
    end
    M.alive_monsters = {}

    -- 3. 重置状态
    State.reset()

    -- 4. 重新获取路径（重载后旧引用可能失效）
    ROAD = get_road()
    -- ...
end
```

#### 事件幂等性（防重复注册）

全局事件 `y3.game:event(...)` 和 UI 事件 `player:event(...)` 多次注册会叠加回调：

```lua
M._events_registered = false

function M.register_events(player)
    if M._events_registered then return end  -- 关键！
    y3.game:event('技能-建造完成', callback)
    y3.game:event('单位-死亡', callback)
    M._events_registered = true
end
```

#### 重载快捷键（开发辅助）

```lua
y3.game:event('键盘-按下', 'R', function()
    print('按 R 键触发重载提示')
    print('1. 在游戏中输入 .rd')
    print('2. VSCode 中点击重载按钮')
    print('3. 执行代码 y3.reload.reload()')
end)
```

#### ⚠️ 重载常见问题

| 问题 | 根因 | 修复 |
|------|------|------|
| 按钮点一次触发两次 | `init()` 被调用两次，`player:event` 叠加两个回调 | 事件注册加 `_events_registered` 防重复 |
| 旧 timer 继续跑 | timer 未被追踪，`init()` 时未清理 | `M.timers = {}` 追踪所有 timer，init 时遍历 remove |
| 旧单位残留 | init 时未清理上次创建的怪物/建筑 | 遍历 `alive_monsters`、移除 `base_unit` |
| 路径引用失效 | 重载后旧 `road` 对象指针失效 | init 时重新 `get_road()` |

### 🏗️ 建造技能物编配置与使用（Phase 1/3 必读）

> **🔧 选型决策**：默认使用 **真·建造技能 `ability_cast_type=4`**，由引擎直接提供建造指示器+碰撞检查+区域判定。
> `ability_cast_type=1`（普通技能模拟建造）仅在极少数定制场景下使用（如需要 Lua 完全接管建造位置判定）。

> ⚠️ **修正历史 / 编辑器预制系统信任原则**：
> 早期文档曾评估认为 Y3 建造技能 `cast_type=4` "不可用"，需要用 `cast_type=1` 模拟。
> 实际验证后发现配置正确即可工作。
> 现已迁移到原生方案。**遵循根规则「🏭 编辑器预制系统信任原则」：默认信任引擎预制功能，先排查使用方法是否正确，不假设引擎 bug。**

#### 物编配置（以箭塔建造技能为例，cast_type=4）

用 `y3_obj_edit.py` 创建技能并挂载到基地：

```bash
# 1. 必须提前创建各塔的普通攻击技能（simple_common_atk）
#    确保有 attack_trajectory.effect / hit_effect.effect 配置

# 2. 创建真·建造技能（ability_cast_type=4 + sight_type=4 指示器 + is_immediate=false）
python3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py \
    -map maps/EntryMap -type ability \
    -create "700001,箭塔建造,普通技能,906660,906660" \
    -ability_cast_type 4 \
    -sight_type 4 \
    -is_immediate false \
    -ability_build_subtype 1

# 3. 设置技能的建造目标（build_list 中指定产出单位）
#    手动编辑 JSON 或使用后续脚本：ability.json → build_list.items: [[500001, 1]]

# 4. 将建造技能绑定到基地的 common_ability_list
python3 <agent>/skills/y3-obj-edit/scripts/y3_obj_edit.py \
    -map maps/EntryMap -type unit -edit 500010 \
    -common_ability_list "700001:1,134236443:1,134283151:1,134231230:1"
```

**关键物编字段对照**：

| 字段 | 真·建造技能（cast_type=4，推荐） | 普通技能模拟（cast_type=1，备选） |
|------|--------------------------------|--------------------------------|
| `ability_cast_type` | `4` 建造 | `1` 普通 |
| `sight_type` | `4`（建造指示器） | `0`（无指示器） |
| `is_immediate` | `false`（需玩家选位置） | `true`（立即释放） |
| `ability_build_subtype` | `1`（强制） | — |
| `build_list` | `[<塔单位ID>]` | `[<塔单位ID>]` |
| 引擎指示器+碰撞检查 | ✅ 自动 | ❌ 需 Lua 实现 |
| `common_ability_list` | 同样挂在基地上 | 同 |
| `simple_common_atk` | 配在**塔单位**上，不在 ability | 同 |

#### Lua 监听建造完成事件

```lua
-- '技能-建造完成' 事件携带 build_unit（被建造出来的单位）
y3.game:event('技能-建造完成', function(trg, data)
    local tower = data.build_unit          -- 注意：字段名是 build_unit，不是 unit
    if not tower or not tower:is_exist() then return end
    
    local key = tower:get_key()
    local tower_data = Config.TOWER_DATA[key]
    if not tower_data then
        tower:remove()
        return
    end
    
    -- 扣金币，不够则移除
    if State.gold < tower_data.cost then
        log.info("[TD] 金币不足建造 " .. tower_data.name)
        tower:remove()
        return
    end
    State.spend_gold(tower_data.cost)
    
    -- 覆盖物编默认攻击力为配置值
    tower:set_attr('物理攻击', tower_data.damage, '基础')
end)
```

#### UI 绑定建造按钮（cast_type=4 时无需自定义 UI）

> ✅ **`cast_type=4` 时引擎自动展示建造按钮**：玩家选中基地 → 引擎自动弹出 `common_ability_list` 中的建造技能按钮，无需自定义 UI 面板。
> ⚠️ 仅在使用 `cast_type=1` 模拟建造时才需要自己用 Type 17 技能按钮组件挂技能。

```json
// 仅 cast_type=1 备选方案下需要：在 UI JSON 中配置按钮（y3-ui-pipeline 生成）
{
    "type": 17,                      // 技能按钮
    "name": "btn_arrow_tower",
    "skill_id": "50000101",          // 绑定建造技能 ID
    "skill_type": 1,                 // 1 = 建造技能
    ...
}
```

> 参考：`knowledge/UI系统/03-官方组件.md` Type 17、`knowledge/物编系统/09-建造系统.md`

#### ⚠️ 建造系统已知陷阱

| 陷阱 | 说明 | 正确做法 |
|------|------|---------|
| `ability_cast_type` 选型 | 默认应选 `4`（真·建造）；`1`（普通技能模拟）只在需要 Lua 完全接管时使用 | 优先用 type=4，引擎提供指示器+碰撞，UI 自动展示 |
| 误判 type=4 "不可用" | 早期评估有过此结论；实际配置正确即可工作（用户已验证） | 遵循「编辑器预制系统信任原则」，先验证使用方法 |
| `build_unit` 不是 `unit` | `'技能-建造完成'` 事件 data 中字段名是 `build_unit` | ❌ `data.unit` → ✅ `data.build_unit` |
| `common_ability_list` 格式 | 元组 `"id1:level1,id2:level2"`，不是整数 | 拼接时注意逗号分隔 |
| 建造前资源检查 | 扣费在 `技能-建造完成` 回调中执行，单位已创建 | 若金币不足需要 `tower:remove()` 回退 |
| 基地选中丢失 | 玩家点击空白处会取消基地选中 → 建造按钮消失 | 必须实现 `M-lock-select`：默认 `player:select_unit(base)` + `set_all_operation_key(1/2, false)` 禁用点选/框选 |

### 📊 数值调整方法（Phase 3/4 必读）

> 开发阶段快速迭代的核心：数值集中管理在 `td_config.lua` 中，通过 Lua 配置表统一控制所有游戏数值。

#### 数值集中管理

```lua
-- td_config.lua
M.TOWER_DATA = {
    [500001] = { name = "箭塔",  cost = 50,  damage = 50,  range = 600, speed = 0.8 },
    [500002] = { name = "魔法塔", cost = 80,  damage = 100, range = 800, speed = 1.5 },
    [500003] = { name = "炮塔",  cost = 100, damage = 80,  range = 500, speed = 2.0 },
    [500004] = { name = "冰塔",  cost = 70,  damage = 30,  range = 600, speed = 1.0 },
}

M.WAVE_INTERVAL = 12.0     -- 波次间隔（秒）
M.SPAWN_INTERVAL = 1.2     -- 怪物出生间隔（秒）
M.START_GOLD = 200         -- 初始金币
M.START_LIVES = 10         -- 初始生命

M.UPGRADE_DAMAGE_RATIO = { -- 每级提升比例
    [500001] = 0.20,       -- 箭塔 20%/级
    [500002] = 0.25,       -- 魔法塔 25%/级
    [500003] = 0.20,       -- 炮塔 20%/级
    [500004] = 0.15,       -- 冰塔 15%/级
}
```

#### 单位属性操作（set_attr / get_attr）

```lua
-- set_attr(属性名, 值, 属性类型)
-- 属性名   → y3.const.UnitAttr 中文键（推荐）或 UnitKeyFloatAttr 英文键
-- 属性类型 → y3.const.UnitAttrType["基础"] / ["增益"] / ["最终加成"] 等

-- ✅ 推荐：中文键 + 属性类型
tower:set_attr('物理攻击', 50, '基础')          -- 设置基础攻击力
tower:set_attr('移动速度', target, '基础')       -- 设置基础移速
local atk = tower:get_attr('物理攻击', '基础')   -- 获取基础攻击力

-- ✅ 英文键也可用（UnitKeyFloatAttr）
tower:set_attr('ATTACK_PHY', 50, '基础')

-- ❌ 错误：'atk_base' / 'ATTACK_PHY'（不区分大小写）不是合法 UnitAttr 键
tower:set_attr('atk_base', 50, '基础')  -- 不会报错但属性不改变！
```

**可用属性类型（UnitAttrType）**：

| 类型 | 中文键 | 说明 |
|------|--------|------|
| ATTR_BASE | `基础` | 基础属性（物编值） |
| ATTR_BASE_RATIO | `基础加成` | 百分比加成（按基础值比率） |
| ATTR_BONUS | `增益` | 增益属性（装备/Buff 等） |
| ATTR_BONUS_RATIO | `增益加成` | 百分比增益加成 |
| ATTR_ALL_RATIO | `最终加成` | 最终百分比加成 |

#### 常用属性速查

| 中文键 | 英文键 | 说明 |
|--------|--------|------|
| `'物理攻击'` | `'attack_phy'` | 物理攻击力 |
| `'法术攻击'` | `'attack_mag'` | 法术攻击力 |
| `'物理防御'` | `'defense_phy'` | 物理防御力 |
| `'法术防御'` | `'defense_mag'` | 法术防御力 |
| `'攻击速度'` | `'attack_speed'` | 攻击速度（百分比） |
| `'移动速度'` | `'ori_speed'` | 移动速度（cm/s） |
| `'最大生命'` | `'hp_max'` | 最大生命值 |
| `'攻击范围'` | `'attack_range'` | 攻击范围（cm） |
| `'攻击间隔'` | `'attack_interval'` | 攻击间隔（秒） |

#### 🆕 `添加` vs `设置`（add_attr vs set_attr）

```
add_attr(name, value, '基础')   →  基础属性 += value
set_attr(name, value, '基础')   →  基础属性  = value（完全覆盖物编基础值！）
```

> **必须**使用 `set_attr`（非 `add_attr`）：物编基础值只是一个模板，我们需要用 Lua 配置表的值**完全覆盖**它。

#### `ori_speed` 移速归一化

> ⚠️ Y3 物编 `ori_speed` 引擎内部 ×100 存储。物编写 100 → `get_attr('ori_speed','基础')` 返回 10000。

```lua
-- 在 spawn 时归一化（覆盖物编值）
enemy:set_attr('移动速度', speed_map[unit_id] or 100, '基础')
-- speed_map 中存储的是 cm/s 真实值（如 200=200cm/s）
```

#### 数值迭代工作流

```
修改 td_config.lua 数值
        ↓
send .rd（或 y3.reload.reload()）
        ↓
游戏自动重新初始化，加载新数值
        ↓
无需重启编辑器 / 无需重新启动游戏
```

> 所有游戏数值（塔属性、波次配置、升级比例、怪物移速等）集中在 `td_config.lua` 一个文件中管理，热重载即时生效。

### 🧩 场景模板匹配（Phase 1，强制优先于手动摆放）

> ⚠️ **场景诉求优先尝试复用现有模板，减少手工地形绘制和装饰物摆放。**
> 本步骤在「场景逻辑节点手动摆放」之前执行。

#### 流程

```
策划案 §3.5（场景设计）
    │
    ▼
提取需求特征:
  - 游戏类型（塔防/RPG/肉鸽/MOBA/生存/休闲）
  - 地图尺寸（小/中/大 或 格点数）
  - 区域类型（路径/建塔区/刷怪点/基地/Boss房 等）
  - 逻辑对象（路径航点数/区域数量/特殊对象）
    │
    ▼
扫描模板库 <agent>/skills/y3-terrain-template/library/
    │  对每个模板读取 template_meta.json + readme.md
    │
    ▼
匹配判定（按优先级）:
  ① 类型关键词命中（模板名含 "tower-defense"/"rpg"/"survival" 等）
  ② 尺寸兼容（模板尺寸 ≥ 需求尺寸 则可用 resize 适配）
  ③ 区域/逻辑对象类型重叠度（路径✓、区域✓、刷怪点✓ 等）
    │
    ▼
┌─ ✅ 匹配命中 → 向用户展示匹配结果 + 差异分析
│     └─ 用户确认 → 走 y3-terrain-template 导入流程（见下方 5 步）
│     └─ 用户拒绝 → 走手动摆放
│
└─ ❌ 无匹配 → 走手动摆放（场景逻辑节点 MCP）
```

#### 匹配展示模板

```markdown
### 场景模板匹配结果

| 模板名 | 尺寸 | 匹配度 | 类型 | 区域 | 路径 | 
|--------|------|--------|------|------|------|
| easy-tower-defense-terrain | 32×32 | 🟢 高 | 塔防 ✓ | 4 建造区 ✓ | 14 航点 ✓ |

差异说明:
- 模板 32×32 < 需求 128×128 → 导入后可 resize_terrain 扩容
- 模板附带 4 个矩形建造区域（与策划案 §3.5.2 匹配）
- 模板附带 14 航点怪物路径（与策划案 §7.3 匹配）
- ⚠️ 装饰物/资源摆件将被整体覆盖；如有自定义装饰物需在导入后补充
```

#### 命中后导入流程（5 步 MCP 串接）

> 来自 `y3-terrain-template` SKILL.md §3.2。步骤 2~5 之间用户禁止操作编辑器。

```
Step 1  读模板 template_meta.json → 取 (w, h)
Step 2  MCP y3editor.save_editor                 # 保护未保存改动
Step 3  MCP y3editor.resize_terrain(w, h)         # 尺寸匹配
Step 4  python import_terrain_template.py --apply  # 备份 + 覆盖
Step 5  MCP y3editor.restart_editor               # 重启加载
```

> ⚠️ 导入前必须跑一次 dry-run（不带 `--apply`），展示覆盖清单和备份路径，用户二次确认后才执行 `--apply`。

#### 无匹配时的回退

若模板库无匹配模板，执行以下手动流程：

```
1. resize_terrain 到策划案指定的尺寸
2. 按 §3.5.2 逻辑对象清单，逐个调用 MCP 摆放:
   - y3editor.add_point(...)       → 刷怪点、基地
   - y3editor.add_point_path(...)  → 怪物路径
   - y3editor.add_rect_area(...)   → 建造/触发区域
   - y3editor.add_circle_area(...) → 圆形触发区域
3. 手动刷地形纹理/装饰物（或使用 terrain_* MCP 逐格绘制）
4. 记录 res_id 到执行案供 Lua 引用
```

> 回退方案的 MCP 操作次数可能极大（例如 128×128 地形纹理需数千次 MCP 调用），因此 **模板匹配应尽可能命中**。

#### 现有模板库速查

> 存放位置：`<agent>/skills/y3-terrain-template/library/`

| 模板名 | 尺寸 | 类型 | 区域 | 路径 | 
|--------|------|------|------|------|
| `easy-tower-defense-terrain` | 32×32 | 塔防 | 4 矩形建造区域 | 14 航点 |

> 模板库持续扩充。新模板可通过 `export_terrain_template.py` 入库。

#### 🔒 模板复用强制约束（命中模板后必须遵守）

> 模板命中导入后，**复现工程时禁止 AI 自由发挥**地形/装饰物/路径布局，**必须严格使用模板的原始配置**。
> 否则会引入"AI 重摆"和"随机种子"两个不可控变量，破坏跨工程复现性。

| 约束项 | 强制要求 | 禁止行为 |
|-------|---------|---------|
| **模板来源** | 必须使用 `<agent>/skills/y3-terrain-template/library/<template-name>/` 原始模板 | ❌ 禁用其他模板，禁用 `y3-gen-terrain-from-image` 重生成 |
| **导入方式** | 必须通过 `y3-terrain-template` skill 的 `import_terrain_template.py` 一次性导入完整 9 文件 | ❌ 禁止只导入部分文件，禁止 AI 手动摆放装饰物 |
| **装饰物** | 完全沿用模板 `decorationdata.data` + `editor_decoration.zip` | ❌ 禁止 AI 调用 `entity_create_block` 增删任何装饰物 |
| **资源摆件** | 完全沿用模板 `resourceobjectdata.data` | ❌ 禁止增删资源摆件 |
| **地形/纹理/植被** | 完全沿用模板 `terrain.json` / `texture.json` / `terrainedit.json` / `foliage.json` / `texturefoliage.json` | ❌ 禁止 AI 调用任何 `terrain_*` MCP 修改 |
| **路径航点** | 必须沿用模板的航点（编辑器 `res_id`），航点坐标由模板的 `editor_decoration.zip` 还原 | ❌ 禁止 AI 用 `add_point_path` 重新摆放，禁止微调任何航点坐标 |
| **刷怪点/基地坐标** | 取路径首/末航点（`Config.PATH_POINTS[1]` / `[#PATH_POINTS]`），与模板自动对齐 | ❌ 禁止写死其它坐标 |
| **地图尺寸** | 必须保留模板原尺寸 | ❌ 禁止 `resize_terrain` 改尺寸（改了路径会失配） |

**复现 SOP**：

```
1. python <agent>/skills/y3-terrain-template/scripts/import_terrain_template.py <template-name> EntryMap
2. MCP restart_editor 让模板生效
3. 直接进入 Phase 1 物编生成，不做任何地形/装饰物/路径调整
```

> ⚠️ 上述约束必须在执行案 Phase 1 章节内以"🔒 模板使用强制约束"标题原文写入，作为复现工程的执行纪律。

### Step 2：每个 Phase 必须包含

- **Phase 描述块**：技能路由说明（如 `> 使用技能：y3-lua-pipeline`）
- **功能清单**：每行含功能、验收点、参考 API、参考事件、依赖
- **详细验收点**：每个功能对应的可验证标准
- **参考 API 列**：标注来源（`y3/` 源码路径或 `references/` 文档位置）
- **参考事件列**：标注监听的事件名和来源
- **执行状态策略**：首次生成执行案时，所有功能行默认状态为 `待执行`；后续制作阶段只更新状态列或附录，不得破坏功能清单骨架和字段顺序

### Step 3：参考 API 规则（强制）

> ⚠️ 每个需要 Lua 实现的功能，必须在执行案中标注参考 API 和来源。
> 如果在 `y3/` 源码和 `y3/演示/` 中找不到对应 API，标注 `?` 并在开发前确认。
> **禁止留空、禁止臆造。**

### Step 4：🆕 一致性校验（强制，预检前置）

> ⚠️ 顺序修正：本步骤必须在 API 预检之前执行（与 `doc-consistency.mdc` 规则 1 保持一致）。

按 `doc-consistency.mdc` 规则 1 校验策划案→执行案覆盖率，**基于功能 ID 做集合差集**：

```
1. 提取策划案所有 F-x.x-xxx ID（来自第 3/3.5/4/6/7 章 + 第 9 章模块的关联引用）
   → design_ids = { F-3.1-英雄-战士, F-4.2-技能-火球术, ... }

2. 提取执行案 Phase 1~4 所有功能行的「策划案 ID」列
   → plan_ids = { F-3.1-英雄-战士, F-4.2-技能-火球术, ... }

3. 计算差集：
   missing = design_ids - plan_ids   （策划有但执行案未覆盖）
   extra   = plan_ids - design_ids   （执行案引用了不存在的 ID，即悬空引用）

4. 判定：
   - missing 非空 → ❌ 必须补齐执行案，或在执行案标注"已合并到 F-yyy"
   - extra 非空   → ❌ 必须修正悬空 ID（拼写错误 / 策划案未定义）
   - 两者均空    → ✅ 进入 Step 5 API 预检
```

> ID 集合差集比"功能名字符串匹配"严格得多，可消灭因重命名/同义词导致的漏判。

#### 🆕 二级校验：设计案章节 → 执行案承接覆盖表（强制）

> ID 差集只能查"个体覆盖"，无法查"整章遗漏后被同名 ID 凑数"的情况。
> 必须额外输出一张「设计案章节 → 执行案承接 Phase」矩阵，确保每个有 F-ID 的章节都有显式承接。

模板：

```markdown
### 设计案 → 执行案 覆盖

| 设计案章节 | 执行案承接 Phase | 状态 |
|----------|----------------|------|
| §3.1 玩家/英雄清单 | Phase 1 物编 | ✅ |
| §3.2 敌方单位清单 | Phase 1 物编 | ✅ |
| §3.3 NPC/建筑 | Phase 1 物编 | ✅ / ⏭️ 标注"本游戏无 NPC" |
| §3.4 建造/官方技能 | Phase 1 物编 | ✅ / ⏭️ 不适用 |
| §3.5 场景设计 | Phase 1 模板地形 + 场景节点 | ✅ |
| §4.2 技能 | Phase 1 物编 + Phase 3 Lua | ✅ |
| §4.3 Buff | Phase 1 物编 + Phase 4 Lua Buff | ✅ |
| §5 经济 | Phase 3 击杀奖励 | ✅ |
| §6 UI | Phase 2 UI | ✅ |
| §7.1 流程 | Phase 3/4 综合 | ✅ |
| §7.2 波次 | Phase 3 波次刷怪 | ✅ |
| §7.x 装备/复活/其它 | Phase 1 物编 + Phase 4 | ✅ |
| §8 数值 | Phase 1 物编属性 | ✅ |
| §11 视听 | Phase 1 特效/音效配置 | ✅ / ⚠️ 待补 |
```

**判定规则**：
- 状态列只能是 `✅` / `⚠️ 待补` / `⏭️ 不适用`
- `⚠️ 待补` 必须在「⚠️ 已知风险与未决项」章节登记
- `⏭️ 不适用` 必须标明跳过原因（如"本游戏无 NPC"）
- 矩阵任一行状态空白即判一致性校验失败

### Step 4.5：🆕 测试案就绪自检表（强制，预检后追加）

> 用于在执行案完工、进入 Phase 6 前，确认每个功能行**三维齐备**（① 开发任务 + ② 参考 API + ③ 验收点），任一缺失则不可进入测试。

模板（追加到执行案末尾，章节名 `## 转换检查清单（供阶段 3 测试案生成用）`）：

```markdown
## 转换检查清单（供阶段 3 测试案生成用）

> 逐项检查每个功能是否满足：**① 有开发任务 + ② 有参考 API + ③ 有验收点**

| 功能 | ① 开发任务 | ② 参考 API | ③ 验收点 | 状态 |
|------|-----------|-----------|---------|------|
| 英雄物编 | Phase 1 | y3-obj-edit 脚本 | F-3.1-英雄-* | ✅ |
| 怪物物编 | Phase 1 | y3-obj-edit 脚本 | F-3.2-敌方-* | ✅ |
| 场景节点 | Phase 1 | MCP add_point / add_rect_area | F-3.5.2-* | ⚠️ TBD |
| ... | ... | ... | ... | ... |
```

**判定规则**：
- 三列任一空白 / 标 `?` → 标 `❌ 不齐备`
- 全列填 `?` 占位 → 整行驳回
- 全表 `❌` 数 > 0 → 不可进入 Phase 6 测试，必须先补齐
- 状态 `⚠️ TBD` 必须同时登记到「⚠️ 已知风险与未决项」

### Step 5：API/事件预检（强制）

一致性校验通过后、开始制作前，执行预检流程（见下方详细说明）。

### Step 6：按 Phase 顺序制作

依次激活对应子技能。Phase 5 Lua 代码 review 不可跳过。

### Step 7：制作期回归校验

每个 Phase 完成后，对受影响的功能行重新跑 Step 4 一致性校验（增量），确认未引入新的悬空 ID 或漏覆盖。

---

## 📋 功能清单格式要求

### 标准格式（所有 Phase 通用）

每个 Phase 的功能清单**必须**包含以下列：

```markdown
| 策划案 ID | 模块 | 功能 | 来源 | 依赖 | 使用 API | 使用事件 | 验收点 | API 来源 |
|-----------|------|------|------|------|---------|---------|--------|----------|
```

> **Phase 1（物编）功能清单可使用简化格式**（物编功能不涉及 Lua API/事件）：
> ```markdown
> | 策划案 ID | 功能 | 验收点 | 参考 API | 参考事件 | 依赖 | 状态 |
> |-----------|------|--------|----------|----------|------|------|
> ```

### 列说明

| 列名 | Phase 1（物编） | Phase 2~4（UI/Lua） | 是否必填 |
|------|:--:|:--:|:--:|
| **策划案 ID** | ✅ 必填 | ✅ 必填 | ✅ |
| **模块** | 可选 | ✅ 必填（逻辑归属分组） | Phase 2~4 必填 |
| **功能** | ✅ 必填 | ✅ 必填 | ✅ |
| **来源** | 可选 | ✅ 必填（`custom-built` / `template-backed: 模板名`） | Phase 2~4 必填 |
| **依赖** | ✅ 必填 | ✅ 必填（物编/Lua框架/UI/模板） | ✅ |
| **使用 API** | — | ✅ 必填 | Phase 2~4 必填 |
| **使用事件** | — | ✅ 必填 | Phase 2~4 必填 |
| **验收点** | ✅ 必填 | ✅ 必填 | ✅ |
| **API 来源** | — | ✅ 必填（`references/xxx.md` / `y3/xxx.lua`） | Phase 2~4 必填 |
| **状态**（可选） | `待执行` / `✅` / `🔄` | 同左 | 可选（制作阶段追加） |

### 🆔 策划案 ID 列规则（强制）

| 规则 | 说明 |
|------|------|
| **必填** | 每行至少引用 1 个策划案 ID；引用多个用 ` + ` 分隔 |
| **格式** | 必须是策划案中已定义的 `F-x.x-类别-简称`，禁止自创 |
| **基础设施例外** | 工程/初始化类功能（如 `main.lua` 框架、玩家槽位初始化）允许标 `INFRA-{简称}`，doc-consistency 不会判悬空 |
| **拆分** | 1 个策划案 ID 拆成多个执行案功能行 → 每行都重复填同一 ID（多对一允许） |
| **聚合** | 多个策划案 ID 由 1 个执行案功能统一实现 → 用 ` + ` 把所有 ID 列出来 |

### 🆕 跨 Phase 依赖列（强制）

为支持"修改 Phase 1 物编 / Phase 2 UI → 自动定位受影响的 Phase 3/4 功能"，功能清单**必须维护「来源」与「依赖」列**：

**依赖列填写规则**：

| 依赖类型 | 写法 | 例子 |
|---------|------|------|
| 物编依赖 | `Phase 1: {物编 key 或资源名}` | `Phase 1: 哥布林(200002)`、`Phase 1: 箭塔(500001)` |
| UI 依赖 | `Phase 2: {画板.控件名}` | `Phase 2: TopBar.金币Label`、`Phase 2: TowerSelectPanel` |
| 模板/UI 导入依赖 | `Phase 2: {模板名 或 .upui}` | `Phase 2: hud-status-bar.upui` |
| Lua 依赖 | `Lua: {模块名}` | `Lua: 经济系统`（同 Phase 内被引用的其他模块） |
| 无依赖 | 空或填 `—` | 工程基础设施类 |

**用途**：
- Phase 1/2 修改时，可反向定位所有受影响的功能行
- Phase 5 Lua 审查可按依赖顺序检查
- Phase 6 测试用例自动按依赖图拓扑排序

---

## 🔍 API/事件预检机制（强制，执行案生成后立即执行）

> **目的**：在执行案生成后、实际编码前，提前验证所有列出的 API 和事件是否真实存在，
> 消灭"写到一半发现 API 不存在"的问题。

### 预检流程

```
执行案生成完成
    │
    ▼
┌─ 预检 Step 1: 提取 API 清单 ─────────────────────────────────────────┐
│ 从执行案 Phase 3/4 的功能清单中，提取所有「使用 API」和「使用事件」列    │
│ 生成待验证清单：                                                       │
│   api_list = [所有列出的 API 调用]                                     │
│   event_list = [所有列出的事件名]                                      │
└────────────────────────────────────────────────────────────────────────┘
    │
    ▼
┌─ 预检 Step 2: 验证 API 存在性 ────────────────────────────────────────┐
│ 对每个 API：                                                           │
│   1. 先查 references/ 目录下的参考文档                                  │
│   2. 再用 grep_search 在 y3/ 源码中搜索函数名                         │
│   3. 标注结果：                                                        │
│      ✅ 已确认 — 在 references/ 或 y3/ 源码中找到                     │
│      ❓ 待确认 — 名称相似但参数/用法需核实                             │
│      ❌ 不存在 — 找不到，可能是臆造                                    │
│   4. 🆕 错题本优先：在上面任一步标 ❌ 之前，必须先查                   │
│      `../../memory/lua-issues/api_issues.md`，                         │
│      若错题本里已有"X 不存在 → 用 Y"的对应，直接采纳并标 ⚠️ 已替换    │
└────────────────────────────────────────────────────────────────────────┘
    │
    ▼
┌─ 预检 Step 3: 验证事件存在性 ─────────────────────────────────────────┐
│ 对每个事件名：                                                         │
│   1. 在 y3/ 源码中搜索事件字符串（如 '单位-死亡'、'游戏-初始化'）       │
│   2. 检查事件回调参数是否匹配                                          │
│   3. 标注结果：✅ 已确认 / ❓ 待确认 / ❌ 不存在                      │
└────────────────────────────────────────────────────────────────────────┘
    │
    ▼
┌─ 预检 Step 3.5: 🆕 参数签名核对（强制） ──────────────────────────────┐
│ 对所有 ✅ 已确认存在的 API，必须再做一次参数核对（消灭"函数对了参数错"）│
│ 对每个 API：                                                           │
│   1. 用 grep_search 找到函数定义（function 关键字所在行）              │
│   2. 读取定义位置前后 5~10 行，提取参数列表 + 期望类型                  │
│   3. 与执行案中标注的调用写法对比：                                    │
│      - 参数个数一致？                                                  │
│      - 必填参数全部提供？                                              │
│      - 字符串枚举类参数（如 attribute key、event name）是否在合法集合？│
│      - self 参数（冒号 vs 点）调用方式正确？                           │
│   4. 标注结果：                                                        │
│      ✅ 参数 OK   — 个数、类型、枚举均对齐                            │
│      ⚠️ 参数可疑 — 个数对但有可疑枚举/类型，需在 Lua 阶段二次验证      │
│      ❌ 参数错误 — 个数不符 / 必填缺失 / 字符串枚举非法                │
│   5. 同步查 `lua-issues/api_issues.md` 中是否记录过同一函数的参数错题  │
└────────────────────────────────────────────────────────────────────────┘
    │
    ▼
┌─ 预检 Step 4: 输出预检报告 ───────────────────────────────────────────┐
│ 生成「API/事件预检报告」，追加到执行案末尾：                             │
│                                                                        │
│ ### API/事件预检报告                                                   │
│ | 项目 | 类型 | 存在性 | 参数核对 | 来源/备注 |                       │
│ |------|------|--------|---------|----------|                          │
│ | y3.player(id):create_unit(unit_id, point, facing) | API | ✅ | ✅ | references/player.md，实例方法非 y3.player.create_unit │
│ | y3.point.create(x, y, z) | API | ✅ | ✅ | 非 create_point         │
│ | unit:reborn(point) | API | ✅ | ✅ | 复活，非 revive               │
│ | unit:damage{target=, type=, damage=} | API | ✅ | ✅ | 表参数，非位置参数 │
│ | unit:add_buff{key=, source=, time=, stacks=} | API | ✅ | ✅ | 同上 │
│ | unit:has_modifier(buff_key) | API | ✅ | ✅ | 不是 has_buff         │
│ | y3.game:event('单位-死亡') | 事件 | ✅ | ✅ | data.unit/data.killer  │
│ | y3.game:event('单位-施放技能') | 事件 | ✅ | ✅ | 主动技能用此，不要用 施法-完成 │
│ | y3.game.exit() | API | ❌ | — | 不存在，改用结算页 + Alt+F4         │
│ | y3.ui.get_ui(player, path) | API | ✅ | ⚠️ | UI 不存在时 throw 而非 nil，必须 pcall │
│ | unit:set_attr('生命值', ...) | API | ✅ | ❌ | UnitAttr 中文键是 '生命'，非 '生命值' │
│ | bind_unit_attr('进度', ...) | API | ✅ | ❌ | UIAttr 是 '当前值'，非 '进度' │
│ | ... | ... | ... | ... | ... |                                        │
│                                                                        │
│ **预检统计**（典型项目 ≥ 30 条，覆盖 Phase 3/4 所有 API/事件）：      │
│   存在性: ✅ X / ❓ Y / ❌ Z                                          │
│   参数核对: ✅ A / ⚠️ B / ❌ C                                       │
│                                                                        │
│ **🆕 错题本回填模板**（每条 ❌ / ⚠️ 必须同时落盘到错题本）：           │
│   - API 不存在 → 追加到 `<agent>/memory/lua-issues/api_issues.md`     │
│     格式: `| <api_name> | 不存在 | 替代: <replacement> | <project> |` │
│   - 参数错误（枚举/类型） → 同上                                       │
│   - 事件名/字段名错误 → 同上                                           │
│   - 运行时 Trace → 追加到 `<agent>/memory/lua-issues/trace_issues.md` │
│                                                                        │
│ **🆕 衍生副产物：物编关键陷阱表**（追加到执行案附录 K「实战陷阱沉淀表」）：│
│   预检过程中暴露的物编字段错误（如 ori_speed ×100 / common_atk_type=0 │
│   默认近战 / sight_type 配错等）必须沉淀到执行案附录 K，方便后续工程查阅。│
└────────────────────────────────────────────────────────────────────────┘
    │
    ▼
┌─ 预检 Step 5: 处理问题项 ────────────────────────────────────────────┐
│ ❌ 存在性不存在的 API/事件：                                           │
│   - 优先查 lua-issues/api_issues.md 错题本中的替代方案                 │
│   - 错题本无记录 → 搜索 y3/ 源码找替代 API                            │
│   - 仍找不到 → 标注 ⚠️ 并 ask_user_question 协商                      │
│                                                                        │
│ ❓ 待确认的 API/事件：                                                 │
│   - 查阅 y3/ 源码确认参数签名                                         │
│   - 更新执行案中的调用写法                                             │
│                                                                        │
│ ❌ 参数错误：                                                          │
│   - 必须修正调用写法（个数/枚举/self 调用方式）                         │
│   - 修正后重新走 Step 3.5 参数核对                                     │
│                                                                        │
│ ⚠️ 参数可疑：                                                          │
│   - 在执行案对应行追加备注 "Phase 3 编码前由 y3-lua-pipeline 二次验证" │
│   - 不阻塞预检通过                                                     │
│                                                                        │
│ 📊 预检通过条件（🆕 分级判定）：                                       │
│   硬约束（必须满足）：                                                 │
│     ❌ 存在性 = 0  且  ❌ 参数错误 = 0                                │
│   软约束（满足任一即可）：                                             │
│     ❓ 待确认 ≤ 3 项  或  ❓ 比例 ≤ 5%                                │
│     ⚠️ 参数可疑无上限（已在执行案标注二次验证）                        │
│   兜底出口：                                                           │
│     若软约束未达标，使用 ask_user_question 让用户选择：                │
│       - 继续修正再预检（推荐）                                         │
│       - 强制通过并在执行案末尾「⚠️ 已知风险」章节登记                  │
│                                                                        │
│ 未通过 → 修正后重新预检（最多 2 轮，第 3 轮强制走 ask_user_question）  │
│ 通过 → ✅ 进入制作阶段                                                │
└────────────────────────────────────────────────────────────────────────┘
```

### 预检参考路径

| 验证目标 | 查找路径 | 说明 |
|----------|---------|------|
| API 函数 | `skills/y3-lua-pipeline/references/*.md` | 首选：参考文档速查 |
| API 函数 | `maps/EntryMap/script/y3/` 或 `global_script/y3/` | 次选：源码搜索（含函数定义/参数） |
| 事件名称 | `maps/EntryMap/script/y3/` grep 事件字符串 | 搜索事件注册/定义 |
| 🆕 错题本（强制） | `../../memory/lua-issues/api_issues.md` | **❌ 判定前必查**，含 API 不存在 + 参数错误两类 |
| 🆕 错题本（强制） | `../../memory/lua-issues/trace_issues.md` | 含运行时报错对应的 API 误用 |
| UI API | `references/y3-ui-*.md`、`references/ui-events.md` | Phase 2 UI 交互 API 也纳入预检 |

---

## 🆕 执行案尾部固定章节

执行案末尾**必须**包含以下章节（按顺序），这些章节由实战验证为必需：

### 章节 1: 🐛 Bug 修复记录

> 制作阶段和测试阶段发现的所有 Bug，统一登记于此。追溯链：执行案 Bug 记录 ↔ 测试报告 ↔ 错题本。

```markdown
## 🐛 Bug 修复记录

| # | Bug | 根因 | 修复 | 影响文件 |
|---|-----|------|------|---------|
| 1 | ... | ... | ... | ... |
```

**填写规则**：
- 每次修复 Bug 后即时追加新行，不改写旧行
- `#` 列自增编号
- `影响文件` 列标注修改的文件路径（相对于项目根目录）

### 章节 2: ⚠️ 已知风险与未决项（强制）

> 集中登记执行过程中识别的风险和未解决问题。测试阶段优先从此表提取 KNOWN ISSUE 候选。

| 类别 | 登记内容 |
|------|---------|
| API 预检 ⚠️ 参数可疑项 | 预检 Step 3.5 输出 |
| 预检软约束兜底强制通过项 | 预检 Step 5 输出 |
| Phase 4 合并到 Phase 3 决策 | 合并理由 |
| 一致性校验已知 missing/extra 例外 | 例外理由（如"策划已撤销但保留以备复用"） |
| 运行时发现的系统性风险 | 如"建造技能方案目前用普通技能替代，无引擎碰撞检查" |

### 章节 3: 📖 附录：关键实现参考（强制）

> 记录开发过程中积累的非平凡实现细节，作为知识沉淀和后续维护参考。

```markdown
## 📖 附录：关键实现参考

### A. 标题
（记录架构决策、API 用法、关键配置、陷阱规避等，命名自定）

### J. 资源 ID 总表（强制条目）

（按下方「资源 ID 总表」模板填写）

### K. 实战陷阱沉淀表（强制条目）

（按下方「实战陷阱沉淀表」模板填写）
```

**必须包含的内容**（典型追加项，因项目而异）：
- 架构决策（如建造技能为何选 `cast_type=4` 而非 `cast_type=1`，附修正历史）
- 路径系统使用（获取 → 移动 → 监测到达，见 Phase 1 §🗺️ 路径使用实战手册）
- 热重载处理（init 幂等性 → 事件防重复 → timer 追踪，见 Phase 1 §🔄 热重载处理）
- 关键 API 的正确用法（附加陷阱说明）
- 引擎特殊行为（如 `ori_speed` 内部 ×100 存储）
- 防重复注册等幂等性方案
- 不同于常规的注意事项

**🆕 强制条目模板（每个执行案的附录都必须包含）**：

#### J. 资源 ID 总表（强制条目）

> 复现工程时按本表配置物编 model/icon/弹道/受击，确保跨工程一致性。

```markdown
### J. 资源 ID 总表

#### 单位

| 单位 | 单位 ID | 模型 ID | 图标 ID | 备注 |
|------|--------|--------|--------|------|
| <怪物名> | 200001 | 211065 | 906660 | 普通怪 |
| <Boss名> | 400001 | 211061 | 906522 | 最终 Boss |
| <塔/建筑名> | 500001 | 100977 | 0 | icon 由建造技能图标承担 |

#### 技能

| 技能 | 技能 ID | 类型 | 关键字段 | 挂载位置 |
|------|--------|------|---------|---------|
| <建造技能名> | 700001 | 真·建造（cast_type=4） | `sight_type=4` / `is_immediate=false` / `build_list=[500001]` | 基地(500010) |
| <普攻技能名> | 50000101 | 普通（cast_type=1） | `sight_type=0` / `is_immediate=true` | 塔单位(500001) |

#### 弹道 / 受击特效（配在**单位** `simple_common_atk` 上）

| 单位 | 弹道 ID | 受击 ID | 颜色风格 |
|------|--------|--------|---------|
| <塔1>(500001) | 104656 | 104657 | 绿色箭+毒受击 |

#### 残留物编（不被 Lua 引用，但保留备用）

| 文件 | 类型 | 说明 |
|------|------|------|
| `modifierall/xxxxxxxx.json` | 减速 modifier | 已改 Lua 实现，物编保留备用 |
```

#### K. 实战陷阱沉淀表（强制条目）

> 累积开发/测试中实际踩过的陷阱（不是文档式速查），每条必须含「现象 / 根因 / 正确做法」三栏。

```markdown
### K. 实战陷阱沉淀表

| # | 陷阱 | 现象 | 根因 | 正确做法 |
|---|------|------|------|---------|
| 1 | `ori_speed` ×100 存储 | 编辑器值 280 → 单位瞬移 | Y3 物编 `ori_speed` 引擎内部 ×100 存储 | 编辑器填 `期望cm/s ÷ 100`，或 spawn 时 `set_attr('移动速度', 真实cm/s, '基础')` 归一化 |
| 2 | 运行时改移速破坏动画 | `set_attr('移动速度', X)` 后动画卡帧/飞动 | 动画速率 = `当前速度 / (物编ori_speed × 100)`，改速度未改 ori_speed → 失配 | 长期速度调整必须改物编源值，禁止运行时 `set_attr('移动速度', ...)` |
| 3 | 主动技能事件错位 | 监听 `施法-完成` 但技能释放无效果 | 该事件仅持续/通道施法触发，主动 `cast_type=2` 不触发 | 改监听 `单位-施放技能`，caster 通过 `ability:get_owner()` 取 |
| 4 | AOE 技能未命中怪物 | 物编 `ability_damage_range=200`，Lua AOE 直读 200 但实际距离远超 | `ability_damage_range` 仅决定指示器/施法范围，AOE 实际命中范围在 Lua 独立判定 | 在 Lua 集中维护 `SKILL_EFFECT[skill_id].radius`，按地图尺寸定半径（中心防守 64×64 场景建议 600+） |
| 5 | UI 路径不含中间 layout | `Panel.label_xxx` 报"UI 不存在" | UI 转换后 label 在中间 `block` / `status_bar` 层级下 | UI 生成后必跑 `gen_ui_tree.py`，按节点树写完整路径 |
| 6 | `y3.ui.get_ui` UI 不存在时 throw | 直接报错而非返回 nil | 引擎行为 | 所有手写绑定加 `pcall` 包裹 |
| 7 | `unit:damage(...)` 位置参数错误 | 报参数错误 | 实际签名是 table 参数 | 改 `unit:damage{target=..., type=..., damage=...}` |
| 8 | `unit:add_buff(...)` 位置参数错误 | 同上 | 同上 | 改 `unit:add_buff{key=..., source=..., time=..., stacks=...}` |
| 9 | `has_buff` 不存在 | API 不存在 | y3 用 `has_modifier(buff_key)` | 改名 |
| 10 | UnitAttr 中文键写错 | `'生命值'/'魔法值'` 不合法 | `y3.const.UnitAttr` 中是 `'生命'/'魔法'/'最大生命'/'最大魔法'` | 替换为短名 |
| 11 | UIAttr 中文键写错 | `'进度'/'进度最大值'` 不合法 | 实际是 `'当前值'/'最大值'/'文本'` | 替换 |
| 12 | `y3.game.exit()` 不存在 | API 臆造 | 该 API 不存在 | 改用 `pcall + GameAPI['quit_game']` 兜底，或隐藏 UI/展示结算页 |
| 13 | `init()` 被多次调用 → 事件回调叠加 | 按钮点一次触发两次 | 全局/UI 事件多次注册会叠加 | 加 `_events_registered` 防重复 + 4 项 init 清理（timer / 单位 / 状态 / 路径） |
| 14 | `'单位-移动结束'` 事件不可靠 | `move_along_road` repeat-move 不触发 | 引擎事件机制限制 | 改 ltimer 0.5s 轮询单位坐标与终点距离，≤80 判到达 |
```

**填写规则**：
- `#` 列自增编号
- 三栏齐备（现象 / 根因 / 正确做法），任一空白 → 不接受
- 同一陷阱出现于多个项目，必须沉淀到 `<agent>/memory/lua-issues/api_issues.md` 错题本
- 新陷阱发现时即时追加，不改写旧行

### 章节 4: 📝 修改记录（强制）

> 用于追踪执行案的版本演进和级联影响，所有结构性变更必须登记。

```markdown
## 📝 修改记录

| 时间 | 修改内容 | 触发原因 | 级联影响 |
|------|---------|----------|---------|
| YYYY-MM-DD | 初始创建 | — | — |
| YYYY-MM-DD | 建造机制：固定建筑点 → 真·建造技能 cast_type=4 | 场景模板导入 + 编辑器预制系统验证 | 执行案 Phase 1/3 建造逻辑重做；UI 删除自定义建造面板 |
```

**填写规则**：
- 4 列齐备（时间 / 修改内容 / 触发原因 / 级联影响）
- `触发原因` 必须可追溯（用户要求 / 实战巡检 / 上游变更 / Bug 修复）
- `级联影响` 必须具体到受影响的 Phase / 文件 / 模块
- 仅记录**结构性变更**（功能增删、流程改向、F-ID/M-ID 调整），不记常规 Bug 修复（那已在「Bug 修复记录」表）

### 章节 5: 🐛 实战沉淀附加表（可选，复杂项目推荐）

> 当 Bug 修复记录超过 10 条时，建议提炼成「分类索引」放在附录开头，方便快速定位同类问题。

| 分类 | 涉及 Bug# | 共性根因 | 通用修复模式 |
|------|-----------|---------|------------|
| 事件机制 | #1, #6, #10, #14 | 事件签名/字段名/重复注册 | 查 references + 加幂等标记 |
| 属性 API | #2, #11, #12 | 中文枚举键写错 | 必查 `y3.const` 表 |
| 移速/动画 | #1, #2 | ori_speed ×100 存储 | 编辑器值 ÷100；不在运行时改移速 |
| UI 绑定 | #3, #6, #7 | 路径错 / 不同步 / throw | 节点树校验 + pcall + 手动刷新 |

---

## 🧾 执行案文档形态约束（强制）

### 1. 执行案本体 vs 执行状态

执行案默认承担**计划文档**角色，必须优先保证：

- 功能清单字段稳定
- 核心列（策划案 ID / 模块 / 功能 / 来源 / 依赖 / 使用 API / 使用事件 / 验收点 / API 来源）不被状态信息污染
- 可供阶段 3 继续解析与生成测试案

允许记录执行进度，但必须遵循以下规则：

| 场景 | 允许做法 | 禁止做法 |
|------|---------|---------|
| 首次生成执行案 | 所有功能项默认标记 `待执行` 或不写状态 | 首次生成时直接把功能项写成 `已完成` |
| 制作阶段更新进度 | 仅更新 `状态` 列，或追加 `附录：执行进度` | 改写/删除原有功能行，导致一致性校验字段丢失 |
| Phase 合并说明 | 在功能行备注或风险章节说明 | 用删除整个 Phase 的方式表达"已合并" |
| 回归修复记录 | 记入 `Bug 修复记录` 表或附录 | 把验收点改写成纯进度描述 |

### 2. 旧命名兼容

- 历史文档中的 `ExecPlan.md` 视为旧版执行案文件名，可兼容读取
- `Y3AgentTestPlan.md` 仅作为极旧格式兜底，不再作为主 fallback 名称
- 新生成文档统一使用 `{gameName}执行案.md`

### 3. 多文档拆分（推荐大型项目使用）

> **目的**：避免单一执行案文件过大导致维护困难、上下文窗口溢出、协作冲突。

#### 触发条件

| 条件 | 说明 |
|------|------|
| 策划案 F-ID 数量 > 30 | 功能点多，单文档预估超 500 行 |
| Phase 3/4 功能跨 3+ 独立模块 | 模块间低耦合，天然可拆 |
| 用户主动要求拆分 | 直接按用户意愿拆分 |

> 小型项目（F-ID < 20）保持单文档即可，无需强制拆分。

#### 文档命名规范

```
{gameName}执行案_主控.md        ← 索引文档（必须存在）
{gameName}执行案_Phase1.md      ← Phase 1 物编+场景
{gameName}执行案_Phase2.md      ← Phase 2 UI
{gameName}执行案_Phase3.md      ← Phase 3 核心玩法
{gameName}执行案_Phase4.md      ← Phase 4 扩展机制
```

> 可按 Phase 拆分，也可按**功能模块**拆分（如 `{gameName}执行案_建造系统.md`、`{gameName}执行案_波次系统.md`），只要满足低耦合原则即可。

#### 主控文档结构（`{gameName}执行案_主控.md`）

```markdown
# {gameName} 执行案（主控）

> 本执行案由多个子文档组合构成，本文件为索引。

## 📋 文档索引

| 子文档 | 职责 | 包含 Phase | F-ID 范围 |
|--------|------|-----------|-----------|
| `{gameName}执行案_Phase1.md` | 物编 + 场景模板 | Phase 1 | F-3.x, F-4.x |
| `{gameName}执行案_Phase2.md` | UI 开发 | Phase 2 | F-5.x |
| `{gameName}执行案_Phase3.md` | 核心玩法 Lua | Phase 3 | F-6.x, F-7.x |
| `{gameName}执行案_Phase4.md` | 扩展机制 Lua | Phase 4 | F-8.x |

## 📋 全局一致性校验

（策划案 ID 集合 vs 所有子文档 ID 集合的差集检查，格式同单文档版）

## ⚠️ 已知风险与未决项

（全局共享，不拆分到子文档）

## 🐛 Bug 修复记录

（全局共享，不拆分到子文档）

## 📖 附录：关键实现参考

（全局共享，不拆分到子文档）
```

#### 拆分原则（低耦合强制）

| 规则 | 说明 |
|------|------|
| **按 Phase 拆分优先** | Phase 1~4 天然按技能路由分离，耦合度最低 |
| **模块内聚** | 同一子文档内的功能属于同一逻辑模块，共享相同的依赖图 |
| **跨文档依赖显式声明** | 子文档头部必须声明 `前置依赖: {gameName}执行案_Phase1.md`，标注依赖的物编/UI 资源 |
| **禁止循环依赖** | 子文档间依赖必须是 DAG（有向无环），Phase1 → Phase2 → Phase3/4，不可反向 |
| **尾部章节归主控** | Bug 记录、已知风险、附录等**全局章节**统一放主控文档，子文档不重复 |
| **一致性校验归主控** | 全局 ID 差集校验在主控文档执行，子文档只负责各自 Phase 的功能清单 |

#### 子文档结构模板

```markdown
# {gameName} 执行案 — {Phase/模块名}

> 前置依赖: {gameName}执行案_Phase1.md（物编 500001~500010）
> 使用技能: `y3-lua-pipeline`

## Phase 3：核心玩法

### 功能清单

| 策划案 ID | 模块 | 功能 | 来源 | 依赖 | 使用 API | 使用事件 | 验收点 | API 来源 |
|-----------|------|------|------|------|---------|---------|--------|----------|
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

## 🔍 API/事件预检报告

（本子文档涉及的 API/事件预检结果）
```

#### 与一致性校验的关系

- `doc-consistency.mdc` 规则 1 的 `plan_ids` 提取改为：**遍历主控索引中列出的所有子文档**，合并所有功能行的「策划案 ID」列
- 测试案生成时同理：遍历所有子文档提取验收点
- 追溯矩阵仍然只有一份（放在测试案中），通过「子文档:行号」标注来源

#### 何时合并回单文档

- 项目进入维护期、不再活跃迭代时
- 子文档 < 3 个且各自不超过 100 行时

---

## 🔀 子技能路由

| 任务类型 | 路由到 | 说明 |
|----------|--------|------|
| 生成、修改、查询物编 | `y3-obj-edit` | 必须用脚本，禁止手写 JSON |
| 导入/导出地编模板 | `y3-terrain-template` | Phase 1 场景模板匹配 |
| 生成 UI JSON | `y3-ui-pipeline` | 生成 JSON + 节点树 |
| 导入模板 `.upui` | `y3editor.import_ui` | 有模板匹配时使用 |
| 写 Lua 代码 / 生成框架 / 融合模板 `logic.lua` | `y3-lua-pipeline` | 所有 Lua 逻辑 |
| review Lua 代码 | `y3-lua-review` | Lua 代码检查 |

---

*拆分自 SKILL.md 阶段 2*
*最后更新：基于多个实战案沉淀经验，反哺流程文档：*
  - *🔧 修复尾部固定章节重复段落 bug（合并行 684/860 两份雷同章节为一份）*
  - *🔒 §🧩 场景模板匹配 新增「模板复用强制约束」子章节（8 项约束 + 复现 SOP）*
  - *🏗️ 修正 §🏗️ 建造技能小节：示例 `cast_type=1` → `cast_type=4` 真·建造（推荐）；加入「修正历史 / 编辑器预制系统信任原则」追溯，对齐根规则；保留 cast_type=1 作为备选并说明边界*
  - *📊 Step 4 一致性校验新增「设计案章节 → 执行案承接覆盖表」二级校验*
  - *✅ 新增 Step 4.5「测试案就绪自检表」三维齐备校验（开发任务/参考 API/验收点）*
  - *🔍 API/事件预检报告模板扩充：典型项数量预期 ≥30 条 + 错题本回填模板 + 物编关键陷阱衍生副产物*
  - *📖 附录章节强制条目新增：J 资源 ID 总表 + K 实战陷阱沉淀表（15 条预设条目，覆盖移速/事件/UI 绑定/属性枚举等高频陷阱）*
  - *📝 新增「修改记录」强制章节（4 列：时间/修改内容/触发原因/级联影响）*
  - *🐛 新增可选「实战沉淀附加表」（分类索引，复杂项目推荐）*
  - *🔄 Phase 3 强制必含模块清单新增 `M-reload`（初始化与热重载，三层触发 + init 幂等），点选驱动游戏追加 `M-lock-select`*
*建造技能 + 数值调整实战手册：*
  - *🏗️ 新增「建造技能物编配置与使用」：ability_cast_type 选型 / 物编字段 / build_list / common_ability_list / Lua 监听 + UI 绑定 / 已知陷阱*
  - *📊 新增「数值调整方法」：td_config 集中管理 / set_attr 正确用法 / 属性类型速查 / ori_speed 归一化 / 数值迭代工作流*
  - *🗺️ 「路径使用实战手册」：获取/移动/到达检测/陷阱*
  - *🔄 「热重载处理」：init 幂等性(4项清理)/事件防重复/timer 追踪/快捷键*
  - *Phase 结构从 1A/1B/1C/2/2.a/2.b 简化为 Phase 1~6 直线序列（塔防实战验证更高效）*
  - *功能清单新增 Phase 1 简化格式（物编不涉及 Lua API/事件）*
  - *所有尾部章节统一归类为「执行案尾部固定章节」*
  - *模块模板匹配表不再强制（仅在存在可用模板时生成）*
