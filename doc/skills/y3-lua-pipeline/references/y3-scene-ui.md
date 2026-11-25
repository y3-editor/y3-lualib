# Y3 官方 UI API - 场景UI与界面元件

## SceneUI 场景UI

> 场景UI是一种直接放在场景内的类似 billboard 的结构，**始终朝向镜头**。
> 不会默认加载，需要在 Lua 逻辑中手动创建。
> 来源: `y3/object/scene_object/scene_ui.lua`

### 核心概念

| 特性 | 创建到场景（Point） | 创建到单位（Unit Socket） |
|------|---------------------|--------------------------|
| 可见性 | **所有玩家可见** | **仅指定玩家可见** |
| 可调整性 | 可以调整子控件，但**对所有玩家生效，无法按玩家差异化** | **可以自由调整子控件，按玩家独立生效** |
| 跟随 | 固定在世界坐标 | 跟随单位移动 |

### 创建

```lua
-- 在世界坐标点创建（所有玩家可见，整体不可单独调整）
---@param sceneui string|y3.Const.SceneUI  场景UI名称（如 'SceneUI_1'）
---@param point Point                       目标点
---@param range? number                     可见距离（默认10000）
---@param height? number                    离地高度（默认0）
---@return SceneUI
local scene_ui = y3.scene_ui.create_scene_ui_at_point(sceneui, point, range, height)

-- 在单位挂点创建（仅指定玩家可见，可自由调整子控件）
---@param scene_ui_type string|y3.Const.SceneUI  场景UI类型
---@param player Player                          目标玩家
---@param unit Unit                              目标单位
---@param socket_name string                     挂接点名称（如 "origin"）
---@param distance? number                       可见距离（默认100000）
---@param follow_scale? boolean                  是否跟随缩放（默认true）
---@return SceneUI
local scene_ui = y3.scene_ui.create_scene_ui_at_player_unit_socket(scene_ui_type, player, unit, socket_name, distance, follow_scale)
```

### 方法

```lua
-- 删除场景UI
scene_ui:remove_scene_ui()

-- 获取场景UI中的子控件
-- 底层 GameAPI.get_ui_comp_in_scene_ui(scene_node, comp_path) 与 player 无关
-- player 仅用于构造返回的 y3.ui 对象
---@param player Player    玩家（用于构造 UI 对象）
---@param comp_path string 控件路径（如 'layout_1.image_1'，对应编辑器节点树）
---@return UI
local ui_comp = scene_ui:get_ui_comp_in_scene_ui(player, comp_path)
-- 一个场景UI模板可以被多次创建，每次都是不同的实例

-- 设置场景UI对指定玩家的可见距离
---@param player Player 玩家
---@param dis number    可见距离
scene_ui:set_scene_ui_visible_distance(player, dis)
```

### 场景UI绑定事件

场景UI支持绑定事件。先通过 `get_ui_comp_in_scene_ui` 获取子控件，再调用 UI 的 `add_event` 方法。

```lua
-- 示例：获取场景UI中的控件并绑定点击事件
local scene_ui = y3.scene_ui.create_scene_ui_at_player_unit_socket('SceneUI_1', player, unit, 'origin')
local comp = scene_ui:get_ui_comp_in_scene_ui(player, 'layout_1.image_1')
comp:add_event('左键-点击', '我的点击事件')
```

可用的 UIEvent 事件类型：
| 事件名 | 值 | 说明 |
|--------|-----|------|
| `'左键-按下'` | 1 | 鼠标左键按下 |
| `'左键-抬起'` | 2 | 鼠标左键抬起 |
| `'左键-按住'` | 3 | 鼠标左键按住 |
| `'左键-点击'` | 30 | 鼠标左键点击（推荐用于普通点击） |
| `'左键-双击'` | 22 | 鼠标左键双击 |
| `'鼠标-悬停'` | 23 | 鼠标悬停 |
| `'鼠标-移入'` | 24 | 鼠标移入 |
| `'鼠标-移出'` | 25 | 鼠标移出 |
| `'右键-按下'` | 32 | 鼠标右键按下 |
| `'右键-抬起'` | 33 | 鼠标右键抬起 |
| `'右键-点击'` | 34 | 鼠标右键点击 |
| `'右键-双击'` | 35 | 鼠标右键双击 |

### 辅助方法

```lua
-- 从 py 层对象获取 lua 层场景UI实例
local scene_ui = y3.scene_ui.get_by_handle(py_scene_node)

-- 通过全局触发器变量获取场景UI
local py_node = GameAPI.get_trigger_variable_scene_ui('变量名')
local scene_ui = y3.scene_ui.get_by_handle(py_node)
```

### 注意事项

1. **场景UI不会自动加载**——必须在 Lua 中显式创建
2. **创建到场景点的场景UI修改对所有玩家生效**——可以获取并修改子控件，但无法按玩家做差异化调整
3. **创建到单位的场景UI仅指定玩家可见**——需要为每个需要看到的玩家分别创建
4. **`get_ui_comp_in_scene_ui` 需要 player 参数**——因为不同玩家看到的是不同的实例
5. **合理设置 `visible_distance`**——避免大量远距离场景UI造成性能问题
6. **控件路径使用 `.` 分隔**——如 `'layout_1.image_1'` 表示 layout_1 下的 image_1

---

## UIPrefab 界面元件

> 允许复用UI模块，类似于UI组件的"预制体"。
> 来源: `y3/object/scene_object/ui_prefab.lua`

### 创建

```lua
local prefab = y3.ui_prefab.create(player, prefab_name, parent_ui)
```

**参数说明**:
- `prefab_name`: 界面模块ID（在编辑器中定义）
- `parent_ui`: 父控件

### 方法

```lua
prefab:remove()                     -- 删除界面模块实例
local ui = prefab:get_child(path)   -- 获取子控件（path 可选，默认根节点）
```

### 内部方法

```lua
local prefab = y3.ui_prefab.get_by_handle(player, prefab_name)  -- 通过handle获取
```