# Y3 官方 UI API - 网格 / 列表控件

> 从 `y3-ui-instance.md` 拆出，避免单文件过长。

## 网格/列表控件 (GridView type 25 / ScrollView type 10)

⚠️ **重要**：网格控件和列表控件本身都只是空容器，**必须先创建 prefab 子节点才能显示内容**。单纯的控件没有任何作用！

两种控件的使用方式完全相同：通过 `y3.ui_prefab.create` 动态创建子节点，然后操控子节点内容。

### 核心 API

```lua
-- 创建 prefab 子节点（必须）
-- player: 玩家对象
-- prefab_name: prefab 名称（命名规则见下方）
-- container: 网格/列表控件
local child = y3.ui_prefab.create(player, prefab_name, container)

-- 移除子节点
child:remove()

-- 设置列表滚动位置（仅 ScrollView）
ui:set_list_view_percent(0-100)  -- 0=顶部, 100=底部
```

### Prefab 命名规则

Prefab 名称格式：`<PanelName>-<节点路径（.替换为-）>-template`

| 组成部分 | 说明 | 示例 |
|----------|------|------|
| `PanelName` | 画板名称 | `MyPanel` |
| `节点路径` | 控件在 UI 中的路径，`.` 替换为 `-` | `block.item_grid` → `block-item_grid` |
| `template` | 固定后缀 | `template` |

**完整示例**：`MyPanel-block-item_grid-template`

### 示例：排行榜列表 (ScrollView)

```lua
local player = y3.player.get_by_id(1)

-- 获取列表控件
local rank_list = y3.ui.get_ui(player, "RankPanel.block.rank_list")

-- Prefab 名称（对应 prefab 文件：RankPanel-block-rank_list-template.json）
local prefab_name = "RankPanel-block-rank_list-template"

-- 排行榜数据
local rank_data = {
    { name = "玩家1", score = 1000 },
    { name = "玩家2", score = 800 },
    { name = "玩家3", score = 600 },
}

-- 为每条数据创建一个列表项
for i, data in ipairs(rank_data) do
    -- 创建 prefab 子节点
    local item = y3.ui_prefab.create(player, prefab_name, rank_list)
    
    -- 修改子节点内容（根据 prefab 内部结构）
    local name_label = item:get_child("label_name")
    local score_label = item:get_child("label_score")
    local rank_label = item:get_child("label_rank")
    
    if name_label then name_label:set_text(data.name) end
    if score_label then score_label:set_text(tostring(data.score)) end
    if rank_label then rank_label:set_text("#" .. i) end
end
```
