# HUD Main 界面规范 (MainConsole 核心控制台)

> **版本**: V4 - 仅还原 MainConsole 节点
> **来源**: `maps/EntryMap/ui/[HUD]Main.json` → `MainConsole` 子节点
> **节点数**: 619

---

## 📌 生成方式

HUD Main 采用**模板处理**方式生成，**仅提取 `MainConsole` 子节点**：

```python
# 模板处理流程
1. 读取 [HUD]Main.json 作为模板
2. 查找 MainConsole 子节点
3. 将 MainConsole 提升为根节点（type=2 Layer）
4. 修改名称为 "hud_main_panel"
5. 递归重新生成所有 uid (UUID v4)
6. 保留所有图片 ID、尺寸、位置、组件结构
7. 输出 hud_main_panel.json
```

### ⚠️ 与 V3 版本的区别

| 版本 | 内容 | 节点数 | 说明 |
|------|------|--------|------|
| V3 | 整个 `[HUD]Main` | 1314 | 包含所有功能区 |
| **V4** | **仅 `MainConsole`** | **619** | 核心控制台，不含小地图/商店等 |

---

## 🎮 MainConsole 详细结构 (1380×170)

这是 HUD 的核心区域，包含 19 个直接子组件：

```
MainConsole (1380×170) ← 根节点
├── bg (背景 1380×170)
│   └── line (分隔线)
├── attr_GRID (属性网格 196×140)
│   └── 1-4 (4个属性条目，含 icon/title/value)
├── avatar (英雄头像区 146×152)
│   ├── main
│   │   ├── mask → heroAvatar_IMG (圆形遮罩)
│   │   ├── title (名称)
│   │   ├── active (升级动画)
│   │   └── resurgence (复活进度)
│   ├── attr (小属性 1-2)
│   ├── frame (大边框)
│   ├── level_TEXT
│   └── exp_PROG (经验条)
├── main (技能/血条区 570×152)
│   ├── heroSkill (英雄技能 56×56)
│   ├── Bond_GRID (羁绊槽)
│   └── bar
│       ├── hp → heroHP_BAR (血条+动态遮罩)
│       └── mp → heroMP_BAR (蓝条+动态遮罩)
├── gearbag (装备栏 192×128)
│   └── item_GRID (6个物品槽 64×64)
├── common_skill (通用技能 51×117)
│   └── 1-2 (2个技能槽)
├── hex (六边形技能按钮)
├── absorbBtn (吸收按钮)
├── challeng_GRID (挑战按钮组 5个)
├── challenge (挑战滚动区)
├── power (战力显示)
├── buff (Buff列表 288×144)
│   └── buff_list (39个 buff 槽位)
├── Shenqi (神器槽 1-2)
├── treasure (宝物栏)
├── pick (选择按钮)
├── treasurePick (宝物选择面板)
├── ArtifactPick (神器选择面板)
├── detail (详情面板 900×587)
└── absorbInfo (吸收信息)
```

---

## 🚫 不再包含的功能区（V3 中有）

| 功能区 | 说明 | 如需使用 |
|--------|------|----------|
| `HelpInfo` | 快捷键帮助 | 用户自行添加 |
| `[TOP]HeadInfo` | 顶部信息栏 | 用户自行添加 |
| `[TOP]Warning` | Boss 警告 | 用户自行添加 |
| `Arcade_HpBar` | Boss 血条 | 用户自行添加 |
| `[RIGHT]Statistic` | 队伍统计 | 用户自行添加 |
| `[Right]Shop` | 商店 | 用户自行添加 |
| `[LEFT]Map` | 小地图 | 用户自行添加 |
| `[LEFT]BondItem` | 羁绊物品 | 用户自行添加 |

---

## 🎨 关键图片 ID

| 用途 | 图片 ID | 尺寸 |
|------|--------|------|
| MainConsole 背景 | `134237464` | 1380×170 |
| 英雄头像遮罩 | `134229939` | 128×128 |
| 英雄头像边框 | `134233913` | 146×152 |
| 血条背景 | `134271042` | 469×22 |
| 技能槽背景 | `134239299` | 42×42 |
| 技能框边 | `134264114` | 56×56 |
| 物品槽背景 | `134258703` | 64×64 |
| Buff 边框 | `134255098` | 36×36 |

---

## 🔧 使用说明

### 生成 HUD

当用户请求生成 HUD/主控界面时：

```python
# 1. 读取模板
template = load("[HUD]Main.json")

# 2. 查找 MainConsole 节点
main_console = find_node(template, "MainConsole")

# 3. 构建新的根节点
new_panel = {
    "type": 2,  # Layer
    "name": "hud_main_panel",
    "uid": uuid4(),
    "visible": True,
    "anim_data": {},
    "children": [main_console]  # MainConsole 作为唯一子节点
}

# 4. 递归重新生成所有 uid
regenerate_uids(new_panel)

# 5. 保存输出
save("hud_main_panel.json", new_panel)
```

### Lua 调用

```lua
-- 获取 HUD
local hud = y3.ui.get_ui(player, "hud_main_panel")

-- 访问子节点（路径从 MainConsole 开始）
local hp_bar = hud:get_child("MainConsole/main/bar/hp/heroHP_BAR")
local skill_1 = hud:get_child("MainConsole/main/heroSkill/slot")
local avatar = hud:get_child("MainConsole/avatar/main/heroAvatar_IMG")
```

---

## 📊 组件统计（MainConsole 内）

| 类型 | 数量 | 说明 |
|------|------|------|
| Layout (7) | ~80 | 布局容器 |
| Image (4) | ~150 | 图片 |
| TextLabel (3) | ~100 | 文本 |
| Button (1) | ~20 | 按钮 |
| GridView (25) | ~8 | 网格布局 |
| BarProgress (41) | ~5 | 进度条 |
| BuffList (18) | 1 | Buff 列表（含39槽） |
| Sequence (38) | ~10 | 序列动画 |

---

*最后更新: 2026-03-13*
*基于: [HUD]Main.json → MainConsole (619 节点)*