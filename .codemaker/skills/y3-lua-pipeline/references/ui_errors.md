# Y3 UI 错误速查

记录 UI JSON 生成和场景 UI 常见错误。

---

## 🔴 UI JSON 致命错误

| 错误 | 后果 | 正确做法 |
|------|------|----------|
| 手动编写 UI JSON | `KeyError: 0` | 使用 `y3-ui-generator` skill |
| 生成到 `maps/.../ui/prefab/` | 地图打不开 | 生成到 `maps/.../ui/` |
| `alignment` 用非法值 | 编辑器崩溃 | 水平: 1/2/4，垂直: 0/8/16 |
| 按钮文本用 `text` | 显示异常 | 按钮用 `normal_text` |
| 子容器用 `type:2` (panel) | 布局错误 | 子容器用 `type:7` (layout) |
| 子元素缺少 `anchor` | 定位异常 | 必须设置 `anchor: [0.5, 0.5]` 等 |
| UI 目录留 `.bak` 备份文件 | 编辑器误读 | 必须删除备份文件 |

---

## 🔴 官方组件错误

### 物品槽 (type:20)
| 错误 | 正确做法 |
|------|----------|
| 缺少 `slot_id` | 必须设置 `slot_id: 1/2/3...` |
| `equip_bg_img` 为 `none_ref` | **必须指向 bg 子节点的 UID** |
| `equip_icon_img` 为 `none_ref` | **必须指向 icon 子节点的 UID** |
| 包含 `adapter_option`/`open_adapter` | **官方组件不需要这些字段** |
| `hover_child` 指向不存在的 UID | **必须指向 hover_resp 子节点的 UID** |

---

## 🔴 场景 UI 错误

| 错误 API | 正确 API |
|----------|----------|
| `y3.ui.create_ui_to_point` | `y3.scene_ui.create_scene_ui_at_point(name, point, range, height)` |
| `y3.ui.create_ui_to_unit_socket` | `y3.scene_ui.create_scene_ui_at_player_unit_socket(name, player, unit, socket, distance, follow_scale)` |
| 事件类型传数字 `28` | 使用中文名 `'左键-点击'`（值30） |
| `get_ui_comp_in_scene_ui` 不传 player | **必须传 player**：`scene_ui:get_ui_comp_in_scene_ui(player, path)` |

### 场景 UI 差异化规则
```
创建到场景点：修改对所有玩家生效
创建到单位挂点：可按玩家差异化
```

---

## 🔴 UI 模板安全规则

| 错误 | 正确做法 |
|------|----------|
| 模板复制后直接使用 | **必须执行 `postprocess_template.py` 重新生成所有 UID** |
| `pos_data` 为普通数组 | 后处理脚本会转换为 `{"__tuple__": true, "items": [...]}` |

---

## 坐标系
```
UI 坐标系：原点在左下角，Y↑ X→
```
