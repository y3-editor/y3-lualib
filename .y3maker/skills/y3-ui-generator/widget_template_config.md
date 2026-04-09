# 复合控件模板配置

本文件定义了所有可用的 UI 复合控件模板。当用户描述 UI 需求时，AI 可通过匹配**识别关键字**自动选择对应模板，并在 HTML 中使用 `data-template="<模板ID>"` 引用。

> **扩展方法**：添加新模板时，在下方表格新增一行，并将对应的 `.json` 文件放入 `templates/` 目录。

---

## 模板列表

| 模板ID | 模板文件 | 默认尺寸 | Y3 type | 说明 |
|--------|----------|----------|---------|------|
| `hp_bar` | `templates/hp_bar.json` | 256×38 | 41 (进度条) | 进度条式血量显示，含背景图+填充条+数值文字 |
| `mp_bar` | `templates/mp_bar.json` | 256×38 | 41 (进度条) | 进度条式魔力显示，结构同血条 |
| `skill` | `templates/skill.json` | 100×100 | 17 (技能按钮) | Y3原生技能按钮，含图标、边框、CD进度、等级、快捷键、升级按钮、充能进度 |
| `buff_list` | `templates/buff_list.json` | 400×50 | 18 (横向列表) | 横向排列的魔法效果图标列表（8个槽位），每个含图标+时间进度+层数 |
| `chat_box` | `templates/chat_box.json` | 332×268 | 32 (聊天控件) | 含聊天消息滚动列表、输入框、发送按钮、频道切换 |
| `card` | `templates/card.json` | 354×500 | 7 (容器) | 羁绊卡牌，含卡面背景、边框、头像、羁绊/技能名称、获得/吞噬奖励描述、标签列表、故事文字、悬浮效果、点击区域 |
| `close_btn` | `templates/close_btn.json` | 50×50 | 7 (容器) | 关闭按钮，含圆形背景底图+关闭图标按钮，常用于面板右上角 |
| `exp_bar` | `templates/exp_bar.json` | 100×18 | 41 (进度条) | 经验条，含背景图+填充条+数值文字（hover时显示），来自 widget_bank |
| `audio_bar` | `templates/audio_bar.json` | 200×50 | 52 (语音聊天) | 语音聊天控件，含频道切换按钮、麦克风按钮（开/关图标）、玩家列表，来自 widget_bank |
| `exit_btn` | `templates/exit_btn.json` | 100×59 | 7 (容器) | 退出游戏按钮，含按钮（文字"退出游戏"，点击返回大厅），来自 widget_bank |
| `bag` | `templates/bag.json` | 560×644 | 7 (容器) | 背包面板，含背景、物品格子网格、分解/合成/丢弃按钮，来自 widget_bank |
| `minimap` | `templates/minimap.json` | 211×211 | 7 (容器) | 小地图控件，含地图图像、边框、缩放按钮，来自 widget_bank |
| `btn` | `templates/btn.json` | 166×45 | 1 (按钮) | 通用按钮，含正常/悬浮/按下/禁用四态图片，来自 widget_bank |
| `hero_bar` | `templates/hero_bar.json` | 150×150 | 7 (容器) | 英雄头像框，含3D模型显示+边框背景，来自 widget_bank |
| `check_box` | `templates/check_box.json` | 44×46 | 46 (复选框) | 复选框控件，Y3原生勾选框，来自 widget_bank |

---

## 识别关键字

当用户用自然语言描述 UI 需求时，根据以下关键字匹配对应模板。匹配不区分大小写。

### hp_bar — 血条
```
血条, 血槽, 血量条, 生命条, 生命值, 生命显示, 血量显示, HP条, HP Bar, HP bar,
health bar, health display, life bar, 体力条, 生命进度条
```

### mp_bar — 魔法条
```
魔法条, 魔力条, 蓝条, MP条, MP Bar, MP bar, 法力条, 法力值, 魔力显示, 魔法显示,
mana bar, mana display, 能量条, 魔法槽, 蓝量
```

### skill — 技能框
```
技能框, 技能格, 技能图标, 技能按钮, 技能栏, 技能槽, 技能CD, skill slot, skill icon,
skill button, skill bar, 技能面板, 主动技能, 被动技能, 技能快捷键, 技能升级
```

### buff_list — Buff列表
```
buff列表, buff栏, buff图标, buff显示, buff槽, 增益列表, 减益列表, 状态效果,
魔法效果, buff list, buff bar, buff display, 状态栏, 增减益, debuff,
效果图标, 光环图标, 状态图标
```

### chat_box — 聊天框
```
聊天框, 聊天窗口, 聊天面板, 消息框, 消息窗口, chat box, chat panel, chat window,
对话框, 频道聊天, 聊天输入, 发送消息, 聊天区域, 世界聊天, 同盟聊天
```

### card — 卡牌
```
卡牌, 卡面, 卡, 羁绊卡, 核心卡, 词缀卡, 卡牌模板, 卡牌控件, 卡牌组件,
card, bond card, card template, 卡牌预览, 卡牌展示, 抽卡卡面, 卡牌UI
```

### close_btn — 关闭按钮
```
关闭按钮, 关闭, 叉号, 关闭图标, X按钮, close button, close btn, close icon,
面板关闭, 右上角关闭, 关闭键, 退出按钮, 返回按钮
```

### exp_bar — 经验条
```
经验条, 经验槽, 经验值, 经验, 经验显示, exp条, exp bar, exp_bar, EXP Bar,
experience bar, experience display, 升级进度, 升级条, 等级进度条, 经验进度条
```

### audio_bar — 语音聊天
```
语音, 语音聊天, 语音频道, 语音面板, audio bar, audio_bar, audio chat,
麦克风, 语音控件, 语音通讯, 频道语音, 玩家语音, 语音列表, 开麦, 静音,
voice chat, voice bar, voice channel, voice panel
```

### exit_btn — 退出按钮
```
退出按钮, 退出游戏, 退出, 返回大厅, 离开游戏, exit button, exit btn, exit game,
quit game, quit button, 退出键, 离开按钮, back to hall, 回到大厅, 结束游戏
```

### bag — 背包
```
背包, 物品栏, 道具栏, 装备栏, 物品面板, bag, inventory, backpack, item panel,
物品格子, 背包界面, 背包面板, 物品袋, 储物, 仓库
```

### minimap — 小地图
```
小地图, 迷你地图, 地图, 雷达, minimap, mini map, radar, 战场地图,
地图显示, 位置地图, 导航地图
```

### btn — 通用按钮
```
按钮, 普通按钮, 通用按钮, btn, button, 确认按钮, 操作按钮,
standard button, normal button, 默认按钮
```

### hero_bar — 英雄头像框
```
头像框, 英雄头像, 头像, 英雄框, 角色头像, 人物头像, hero bar, hero portrait,
avatar frame, portrait, 3D头像, 模型头像, 英雄模型框, 角色框
```

### check_box — 复选框
```
check_box, 复选框, 勾选框, 勾选, 选择框, 多选框, checkbox, check box,
选项勾选, 开关选项, toggle, 打勾, 勾选项, 单选框, 选择开关
```

---

## 模板内部结构

### hp_bar
```
hp_bar (type=41, 256×38)
├── progress_bg_img (type=4, 背景图 img=133173)
├── progress_bar_img (type=39, 填充条)
└── progress_percent_label (type=3, 文字 "50/100")
```

### mp_bar
```
mp_bar (type=41, 256×38)
├── progress_bg_img (type=4, 背景图 img=133173)
├── progress_bar_img (type=39, 填充条)
└── progress_percent_label (type=3, 文字 "50/100")
```

### skill
```
skill (type=17, 100×100)
├── skill_icon_img (type=4, 技能图标 img=100070, 100×100)
├── skill_frame_img (type=4, 图标边框 img=903689, 100×100)
├── skill_cd_progress (type=5, CD进度 圆形遮罩 img=903688, 100×100)
├── skill_cd_label (type=3, CD倒计时文字 "10", 粗体)
├── skill_stack_label (type=3, 技能层数 "5", 右上角 24×24)
├── skill_upgrade_btn (type=1, 升级按钮 img=903685, 100×42)
├── skill_shortcut_label (type=3, 快捷键 "Q", 左上角 24×24)
├── skill_level_label (type=3, 等级 "lv.1", 底部居中 100×24)
├── skill_consume_mask_img (type=4, 消耗不足遮罩 img=903686, 100×100)
├── skill_disable_img (type=4, 禁用遮罩 img=903687, 100×100)
│   └── skill_frame_img (type=4, 禁用边框 img=903690)
└── skill_charge_progress (type=42, 充能进度条 105×105)
    ├── progress_bg_img (type=4, 背景图 img=999, visible=false)
    ├── progress_bar_img (type=40, 充能填充 img=133155)
    └── progress_percent_label (type=3, 充能百分比, visible=false)
```
> 注意：`skill` 是 Y3 原生的技能按钮控件 (type=17)，引擎会自动管理：
> - CD 显示（skill_cd_progress + skill_cd_label）
> - 技能图标绑定（skill_icon_img）
> - 等级/层数显示（skill_level_label / skill_stack_label）
> - 消耗不足/禁用状态（skill_consume_mask_img / skill_disable_img）
> - 充能进度（skill_charge_progress）

### buff_list
```
buff_list (type=18, 400×50)
└── buff_item_1~8 (type=19, 每个48×48)
    ├── buff_grond_frame (type=4, 底框 img=131975)
    ├── buff_time_progress (type=5, 增益时间进度)
    ├── buff_time_progress_bad (type=5, 减益时间进度)
    ├── buff_icon_black (type=7, 黑底)
    ├── buff_icon_img (type=4, buff图标 img=131418)
    └── buff_stack_label (type=3, 层数文字)
```

### chat_box
```
chat_box (type=32, 332×268)
├── scroll_view_chat (type=10, 消息列表)
│   └── label_template (type=60, 消息模板)
├── input (type=7, 输入区域)
│   ├── button_send (type=1, 发送按钮)
│   ├── scroll_view_channel (type=10, 频道切换)
│   │   ├── button_alliance (type=1, 同盟频道)
│   │   └── button_all (type=1, 全部频道)
│   └── image_19 (type=4, 输入框背景)
│       └── input_field (type=15, 输入控件)
└── image_20 (type=4, 装饰)
```

### card
```
card (type=7, 354×500)
├── card (type=7, 卡面主体 350×500)
│   ├── card_bg (type=4, 卡面背景 img=133729, 320×455)
│   ├── card_bg_border (type=4, 卡牌边框 img=131020, 九宫格, 354×500)
│   ├── label_bond_title (type=3, 羁绊名称 "羁绊名称 #ffffff (0/5)")
│   ├── label_bond_skill_name (type=3, 卡牌名称)
│   ├── avatar (type=7, 头像容器 106×106)
│   │   ├── bg (type=4, 头像底图 img=134272235)
│   │   ├── image_bond_skill_icon (type=4, 技能图标 img=100000033)
│   │   └── frame (type=4, 头像边框 img=134281756)
│   ├── card_desc_list (type=10, 描述滚动列表 280×219)
│   │   ├── label_condition (type=3, 吞噬条件文字)
│   │   ├── gain_LIST (type=10, 获得奖励区域)
│   │   │   ├── attr_line (type=7, 分割线容器)
│   │   │   │   └── line (type=4, 分割线 img=134277364)
│   │   │   ├── title_TEXT (type=3, "[获得奖励]")
│   │   │   ├── label_gain_bonus (type=3, 属性加成文字)
│   │   │   ├── skillName (type=10, 技能名+CD区域)
│   │   │   │   ├── label_gain_skill_name (type=3, "[附加技能]")
│   │   │   │   ├── space (type=7, 间距)
│   │   │   │   └── widget_gain_skill_cd (type=4, CD标签容器)
│   │   │   │       ├── icon (type=4, CD图标 img=134225982)
│   │   │   │       └── label_gain_skill_cd (type=3, "2s")
│   │   │   └── label_gain_skill_desc (type=3, 技能描述文字)
│   │   ├── absorb_LIST (type=10, 吞噬奖励区域)
│   │   │   ├── attr_line → line (分割线，结构同上)
│   │   │   ├── title_TEXT (type=3, "[吞噬奖励]")
│   │   │   ├── label_absorb_desc (type=3, 属性加成文字)
│   │   │   ├── skillName → label_absorb_skill_name + space + cd
│   │   │   └── label_absorb_skill_desc (type=3, 技能描述文字)
│   │   └── bondTips_line → line (底部分割线)
│   ├── label_story_tips (type=3, 故事提示文字)
│   ├── tag_LIST (type=10, 标签列表 46×132, 纵向)
│   │   ├── top (type=7, 顶部间距)
│   │   ├── 1~3 (type=7, 标签槽位 46×40)
│   │   │   └── icon (type=4, 标签图标 img=134243158)
│   │   └── bottom (type=7, 底部间距)
│   ├── line (type=4, 底部装饰线 img=134277364)
│   ├── coreSymbol (type=4, 核心标记图标 img=134264183, 102×58)
│   └── hover_effect (type=4, 悬浮发光效果 img=108449, 九宫格, 354×500)
└── button_bond_card (type=7, 点击区域 354×473)
```

### close_btn
```
btn_close (type=7, 50×50)
├── bg (type=4, 圆形背景底图 img=120089, 九宫格, 50×50)
└── button_close (type=1, 关闭按钮 normal=109811, 36×36)
```

### exp_bar
```
exp_bar (type=41, 100×18)
├── progress_bg_img (type=4, 背景底图 img=999, 100×18, 九宫格)
├── progress_bar_img (type=39, 填充条 img=134254174, 100×12, 上下边距各3px)
└── exp_TEXT (type=3, 文字 "100/100", 字号8, hover时显示, visible=false)
```
> 注意：`exp_TEXT` 默认 `visible=false`，鼠标悬停时才显示（由 `hover_child` 控制）。  
> 经验条默认尺寸较小（100×18），通常需要放大使用，如 `data-w="400" data-h="24"`。

### audio_bar
```
audio_bar (type=52, 200×50)
├── btn_channel (type=1, 频道切换按钮, 含频道图标和弹出面板)
│   └── popup_channel (type=7, 频道弹出面板, 含频道列表)
├── btn_mic (type=1, 麦克风开关按钮)
│   ├── image_mic_on  (type=4, 开麦图标)
│   └── image_mic_off (type=4, 静音图标)
└── scroll_player_list (type=10, 玩家列表)
    └── player_item (type=19, 玩家条目模板)
        ├── label_player_name (type=3, 玩家名)
        └── image_speaking (type=4, 正在发言图标)
```
> 注意：`audio_bar` 对应 Y3 引擎内置 type=52（Voice Chat）控件，引擎会自动管理语音状态，  
> 无需额外 Lua 代码初始化，但可通过 API 控制频道/静音状态。

### exit_btn
```
exit (type=7, 100×59)
└── button_1 (type=1, 按钮 文字"退出游戏", 点击触发 BackToHall 返回大厅)
```
> 注意：`exit_btn` 内置了 `BackToHall` 事件动作（type=28 点击事件 → type=5 返回大厅），  
> 无需额外 Lua 代码，引擎会自动处理返回大厅逻辑。

### bag
```
bag (type=7, 560×644)
├── image_bg (type=4, 背景图 560×644)
├── widget_grid (type=7, 网格容器 437×447)
│   ├── image_grid_bg (type=4, 网格背景 439×452)
│   └── grid_view (type=25, 物品网格列表 442×446)
├── widget_bottom_bar (type=7, 底部按钮栏 680×70)
│   ├── button_decompose (type=1, 分解按钮 120×40)
│   ├── button_craft (type=1, 合成按钮 120×40)
│   └── button_drop (type=1, 丢弃按钮 120×40)
└── label_title (type=3, 标题文字 300×40)
```
> 注意：`bag` 使用 GridView (type=25) 来自动排列物品格子。
> Lua 中可通过以下 API 操作：
> - 添加物品到格子：通过物品系统绑定，引擎自动管理
> - 获取格子列表：`grid_view:get_children()`
> - 分解/合成/丢弃按钮需要在 Lua 中绑定事件

### minimap
```
Minimap (type=7, 211×211)
├── bg (type=4, 背景图)
├── mini_map (type=16, 小地图控件)
├── frame (type=4, 边框)
└── token (type=7, 功能按钮组)
    ├── repick (type=7, 重选按钮)
    │   ├── icon (type=4, 图标)
    │   └── text (type=3, 文字)
    └── revive (type=7, 复活按钮)
        ├── icon (type=4, 图标)
        └── text (type=3, 文字)
```

### btn
```
btn (type=1, 166×45)
```
> 注意：`btn` 是一个纯按钮控件，不含子节点，使用 Y3 标准四态图片（正常/悬浮/按下/禁用）。

### hero_bar
```
hero_bar (type=7, 150×150)
├── model (type=6, 3D模型显示 80×80)
│   └── 内置模型 editor_model:203000, scale=1.2
└── bg (type=4, 边框背景 img=132013, 200×200, 九宫格)
```
> 注意：`hero_bar` 使用 Y3 引擎的 type=6 (3D模型) 控件来显示英雄模型。  
> 可通过 Lua 代码动态设置模型 ID：`ui:set_model(model_id)`

### check_box
```
check_box (type=46, 44×46)
```
> 注意：`check_box` 是 Y3 原生的复选框控件 (type=46)，无子节点。  
> 引擎会自动管理选中/未选中状态的显示切换。  
> Lua 中可通过以下 API 操作：
> - 获取选中状态：`ui:is_checked()` 
> - 设置选中状态：`ui:set_checked(true/false)`
> - 监听状态变化：`ui:add_event('选中状态改变', callback)`

---

## 使用规则

1. **转换器行为**：遇到 `data-template="xxx"` 时自动从 `templates/xxx.json` 加载完整子树
2. **名称覆盖**：`data-name` 替换模板根节点 `name`，内部子节点名称保持不变
3. **尺寸缩放**：`data-w/h` 与默认尺寸不同时，内部子节点按比例递归缩放（size + pos_data + adapter_option）
4. **UUID 刷新**：注入时自动为所有节点生成新的 UUID
5. **跳过后处理**：模板内部结构不受 `post_process_tree` 和 `auto_inject_layout_bg` 影响
