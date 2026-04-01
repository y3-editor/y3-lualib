# Y3 常见错误速查

> 📚 **详细案例和代码示例见**: `.codemaker/skills/y3-lua-pipeline/references/common_errors.md`

**最后更新**: 2026-03-20

---

## 🔴 致命错误

| 错误 | 正确做法 |
|------|----------|
| 物编生成到 `.codemaker/` | 必须生成到 `maps/EntryMap/editor_table/` |
| 物编 `uid` 是整数 | 必须是字符串 `"400001"` |
| 技能列表不用 `__tuple__` | 必须用 `{"__tuple__": true, "items": [...]}` |
| UI 按钮文本用 `text` | 按钮用 `normal_text` |
| UI 子容器用 `type:2` (panel) | 子容器应用 `type:7` (layout) |
| UI 子元素缺少 `anchor` | 必须设置 `anchor: [0.5, 0.5]` 等 |
| 物品槽缺少 `slot_id` | 必须设置 `slot_id: 1/2/3...` |
| 物品槽 `equip_bg_img` 为 `none_ref` | **必须指向 bg 子节点的 UID**，否则显示异常 |
| 物品槽 `equip_icon_img` 为 `none_ref` | **必须指向 icon 子节点的 UID**，否则物品图标不显示 |
| 物品槽包含 `adapter_option`/`open_adapter` 等字段 | **官方组件不需要这些字段**，会导致初始化异常 |
| 物品槽 `hover_child` 指向不存在的 UID | **必须指向 hover_resp 子节点的 UID**，否则悬停失效 |

---

## 🟠 API 错误

| 错误 | 正确做法 |
|------|----------|
| `y3.player.with_all_players` | `y3.player_group.get_all_players():pick()` |
| `player:camera_follow_unit` | `y3.camera.set_camera_follow_unit(...)` |
| `unit:attack(target)` | `unit:attack_target(target, 0)` |
| `unit:is_dead()` | `unit:is_alive()` |
| `unit:cause_damage_to_unit()` | `unit:damage({target=..., damage=..., type='physics'})` |

---

## 🟡 静默失败

| 错误 | 正确做法 |
|------|----------|
| 键盘常量 `'1'` | 使用 `'KEY_1'` |
| UI 回调 `add_event` | 使用 `add_fast_event` |
| 击杀奖励用 `dead_exp` | 使用 `reward_exp` |
| 击杀金币用 `dead_money` | 使用 `reward_official_res_1` |

---

## � 物编字段

| 字段 | 说明 |
|------|------|
| `sight_type` | **技能释放类型**：`0`=无目标直接释放，`4`=需要选择单位目标 |
| `pointer_limitation` | 指示器类型（非释放类型）：`0`=无，`1`=扇形，`4`=目标，`5`=点 |

---

## �📐 数值规范

| 项目 | 说明 |
|------|------|
| Y 轴 | Y- = 北/上，Y+ = 南/下 |
| 距离/范围 | 使用 **100-500** 级别（3位数） |
| 玩家 31 | 中立敌对（怪物） |
| 玩家 32 | 中立友好（NPC） |

### 距离参考值

| 用途 | 推荐值 |
|------|--------|
| 近战攻击 | 100-150 |
| 近战技能 | 200-400 |
| 远程攻击 | 500-800 |
| AOE 范围 | 400-600 |

---

## 🔴 场景UI 错误

| 错误 | 正确做法 |
|------|----------|
| 场景UI用 `y3.ui.create_ui_to_point` | 使用 `y3.scene_ui.create_scene_ui_at_point(name, point, range, height)` |
| 场景UI用 `y3.ui.create_ui_to_unit_socket` | 使用 `y3.scene_ui.create_scene_ui_at_player_unit_socket(name, player, unit, socket, distance, follow_scale)` |
| 事件类型传数字 `28` | 使用中文名 `'左键-点击'`（值30），参见 `UIEventMap` |
| `get_ui_comp_in_scene_ui` 不传 player | **必须传 player 参数**：`scene_ui:get_ui_comp_in_scene_ui(player, path)` |
| 对创建到场景点的场景UI按玩家差异化调整 | 创建到场景点的场景UI修改**对所有玩家生效**，需要按玩家差异化时改用创建到单位挂点 |
| UI 目录下留 `.bak` 等备份文件 | **必须删除**，编辑器可能误读导致加载异常 |

---

## 🔴 UI JSON 生成安全规则

| 错误 | 正确做法 |
|------|----------|
| 模板复制后直接使用（UID 冲突） | **必须执行 `postprocess_template.py` 重新生成所有 UID** |
| 模板中的硬编码 UID 未处理 | 后处理脚本会递归替换所有 `uid` 字段为新 UUID |
| `pos_data` 为普通数组 `[960, 540, ...]` | 后处理脚本会转换为 `{"__tuple__": true, "items": [...]}` |

---

## 🔴 MCP 操作安全规则

| 错误 | 正确做法 |
|------|----------|
| MCP 超时后重试 | **绝不重试！**重试导致请求积压，编辑器卡死 |
| 连续快速调用多个 MCP 工具 | 每两个 MCP 调用之间至少等待 **2 秒** |
| 直接调用 MCP 不做预检 | 先用 `save_editor` 做探针确认 MCP 可用 |
| 每个循环都调用 `hotfix_ui_editor` | 仅在流程开始时调用一次 |
| `screenshot_ui` 截图后立即操作 | 每两个 MCP 调用之间至少等待 **2 秒** |
| **热更后立即保存** | **热更后等待 3 秒再保存**，否则内容可能丢失！ |

### 熔断原则

任何 MCP 工具调用超时/报错 → 立即设置 `mcp_broken=true` → 当前及后续所有操作跳过 MCP → 进入降级模式

---

*详细案例和代码示例见 `.codemaker/skills/y3-lua-pipeline/references/common_errors.md`*
