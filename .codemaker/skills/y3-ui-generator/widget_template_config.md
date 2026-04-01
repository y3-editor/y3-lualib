# 复合控件模板配置

本文件定义了所有可用的 UI 复合控件模板。当用户描述 UI 需求时，AI 可通过匹配**识别关键字**自动选择对应模板，并在 HTML 中使用 `data-template="<模板ID>"` 引用。

> **扩展方法**：添加新模板时，在下方表格新增一行，并将对应的 `.json` 文件放入 `templates/` 目录。

---

## 模板列表

| 模板ID | 模板文件 | 默认尺寸 | Y3 type | 说明 |
|--------|----------|----------|---------|------|
| `hp_bar` | `templates/hp_bar.json` | 256×38 | 41 (进度条) | 进度条式血量显示，含背景图+填充条+数值文字 |
| `mp_bar` | `templates/mp_bar.json` | 256×38 | 41 (进度条) | 进度条式魔力显示，结构同血条 |
| `skill` | `templates/skill.json` | 150×230 | 7 (容器) | 含背景、边框、图标、CD遮罩、等级文字、快捷键标签、升级按钮 |
| `buff_list` | `templates/buff_list.json` | 400×50 | 18 (横向列表) | 横向排列的魔法效果图标列表（8个槽位），每个含图标+时间进度+层数 |
| `chat_box` | `templates/chat_box.json` | 332×268 | 32 (聊天控件) | 含聊天消息滚动列表、输入框、发送按钮、频道切换 |
| `card` | `templates/card.json` | 354×500 | 7 (容器) | 羁绊卡牌，含卡面背景、边框、头像、羁绊/技能名称、获得/吞噬奖励描述、标签列表、故事文字、悬浮效果、点击区域 |
| `close_btn` | `templates/close_btn.json` | 50×50 | 7 (容器) | 关闭按钮，含圆形背景底图+关闭图标按钮，常用于面板右上角 |
| `exp_bar` | `templates/exp_bar.json` | 100×18 | 41 (进度条) | 经验条，含背景图+填充条+数值文字（hover时显示），来自 widget_bank |
| `audio_bar` | `templates/audio_bar.json` | 200×50 | 52 (语音聊天) | 语音聊天控件，含频道切换按钮、麦克风按钮（开/关图标）、玩家列表，来自 widget_bank |

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
skill (type=7, 150×230)
├── skill_bg (type=4, 背景 img=906366, 九宫格)
├── skill_frame (type=4, 边框 img=904120, 九宫格)
└── skill_btn (type=17, 按钮容器)
    ├── skill_icon_img (type=4, 技能图标 img=100070)
    ├── skill_frame_img (type=4, 图标边框 img=903689)
    ├── skill_cd_progress (type=5, CD进度 圆形遮罩)
    ├── skill_cd_label (type=3, CD倒计时文字)
    ├── skill_stack_label (type=3, 层数)
    ├── skill_upgrade_btn (type=1, 升级按钮)
    ├── skill_shortcut_label (type=3, 快捷键 "Q")
    ├── skill_level_label (type=3, 等级 "lv.1")
    ├── skill_consume_mask_img (type=4, 消耗不足遮罩)
    ├── skill_disable_img (type=4, 禁用遮罩)
    │   └── skill_frame_img (type=4)
    └── skill_charge_progress (type=42, 充能进度)
```

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

---

## 使用规则

1. **转换器行为**：遇到 `data-template="xxx"` 时自动从 `templates/xxx.json` 加载完整子树
2. **名称覆盖**：`data-name` 替换模板根节点 `name`，内部子节点名称保持不变
3. **尺寸缩放**：`data-w/h` 与默认尺寸不同时，内部子节点按比例递归缩放（size + pos_data + adapter_option）
4. **UUID 刷新**：注入时自动为所有节点生成新的 UUID
5. **跳过后处理**：模板内部结构不受 `post_process_tree` 和 `auto_inject_layout_bg` 影响
