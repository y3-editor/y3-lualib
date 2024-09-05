# y3.Const

常量

## AbilityCastType

```lua
table
```

## AbilityCategory

```lua
table
```

## AbilityEventType

```lua
enum y3.Const.AbilityEventType
```

## AbilityFloatAttr

```lua
enum y3.Const.AbilityFloatAttr
```

## AbilityIndex

```lua
enum y3.Const.AbilityIndex
```

## AbilityIntAttr

```lua
enum y3.Const.AbilityIntAttr
```

## AbilityPointerType

```lua
enum y3.Const.AbilityPointerType
```

## AbilityStrAttr

```lua
enum y3.Const.AbilityStrAttr
```

## AbilityType

```lua
enum y3.Const.AbilityType
```

## AreaAction

```lua
table
```

## CameraMoveMode

```lua
enum y3.Const.CameraMoveMode
```

## CameraShakeMode

```lua
table
```

## CollisionLayers

```lua
enum y3.Const.CollisionLayers
```

## CursorState

```lua
table
```

## DMGType

```lua
enum y3.Const.DMGType
```

## DamageTypeMap

```lua
table
```

## DestructibleEventType

```lua
enum y3.Const.DestructibleEventType
```

## DialogDebugType

```lua
table
```

## EaseType

```lua
enum y3.Const.EaseType
```

## FloatTextJumpType

```lua
enum y3.Const.FloatTextJumpType
```

## FloatTextType

```lua
enum y3.Const.FloatTextType
```

## GameResult

```lua
table
```

## GlobalEventType

```lua
enum y3.Const.GlobalEventType
```

## HarmTextType

```lua
enum y3.Const.HarmTextType
```

## ItemEventType

```lua
enum y3.Const.ItemEventType
```

## IterKey

```lua
table
```

## KeyboardKey

```lua
enum y3.Const.KeyboardKey
```

## LinkSfxPointType

```lua
enum y3.Const.LinkSfxPointType
```

## ModifierEffectType

```lua
enum y3.Const.EffectType
```

## ModifierEventType

```lua
enum y3.Const.ModifierEventType
```

## ModifierType

```lua
enum y3.Const.ModifierType
```

## ModifyType

```lua
table
```

## MouseKey

```lua
enum y3.Const.MouseKey
```

## MovementObstacleProcessType

```lua
table
```

## OnOff

```lua
table
```

## OnceRecycle

```lua
table
```

## PatrolType

```lua
table
```

## PlatformEventType

```lua
enum y3.Const.PlatformEventType
```

## PlayerAttr

```lua
enum y3.Const.PlayerAttr
```

## ProjectileEventType

```lua
enum y3.Const.ProjectileEventType
```

## RoleStatus

```lua
enum y3.Const.RoleStatus
```

## RoleType

```lua
enum y3.Const.RoleType
```

## SfxRotateType

```lua
enum y3.Const.SfxRotateType
```

## ShiftSlotType

```lua
enum y3.Const.ShiftSlotType
```

## SignalType

```lua
enum y3.Const.SignalType
```

## SlotType

```lua
enum y3.Const.SlotType
```

## StateAction

```lua
table
```

## UIAnimKey

```lua
enum y3.Const.UIAnimKey
```

## UIAttr

```lua
enum y3.Const.UIAttr
```

## UIButtonStatus

```lua
enum y3.Const.UIButtonStatus
```

## UIComponentType

```lua
table
```

## UIEventMap

```lua
table
```

## UIEventType

```lua
enum y3.Const.UIEventType
```

## UIHAlignmentType

```lua
table
```

## UIRelativeParentPosType

```lua
table
```

## UIVAlignmentType

```lua
table
```

## UnitAttr

```lua
enum y3.Const.UnitAttr
```

## UnitAttrType

```lua
enum y3.Const.UnitAttrType
```

## UnitCategory

```lua
table
```

## UnitEnumState

```lua
enum y3.Const.UnitEnumState
```

## UnitEventType

```lua
enum y3.Const.UnitEventType
```

## UnitKeyFloatAttr

```lua
table
```

## UnitState

```lua
table
```

## VisibleType

```lua
enum y3.Const.VisibleType
```


# y3.Const.AbilityEventType

```lua
{
    ABILITY_CS_START: string = ET_ABILITY_CS_START,
    ABILITY_PS_START: string = ET_ABILITY_PS_START,
    ABILITY_PS_END: string = ET_ABILITY_PS_END,
    ABILITY_SP_END: string = ET_ABILITY_SP_END,
    ABILITY_CST_END: string = ET_ABILITY_CST_END,
    ABILITY_BS_END: string = ET_ABILITY_BS_END,
    ABILITY_PS_INTERRUPT: string = ET_ABILITY_PS_INTERRUPT,
    ABILITY_SP_INTERRUPT: string = ET_ABILITY_SP_INTERRUPT,
    ABILITY_CST_INTERRUPT: string = ET_ABILITY_CST_INTERRUPT,
    ABILITY_END: string = ET_ABILITY_END,
    ABILITY_OBTAIN: string = ET_ABILITY_OBTAIN,
    ABILITY_LOSE: string = ET_ABILITY_LOSE,
    ABILITY_UPGRADE: string = ET_ABILITY_PLUS_POINT,
    ABILITY_LEVEL_CHANGED: string = ET_ABILITY_UPGRADE,
    ABILITY_CD_END: string = ET_ABILITY_CD_END,
    ABILITY_SWITCH: string = ET_ABILITY_SWITCH,
}
```


# y3.Const.AbilityFloatAttr

```lua
"技能消耗" | "生命值消耗" | "冷却时间" | "技能伤害值" | "释放范围" | "施法开始" | "施法完成" | "施法出手" | "施法引导" | "技能影响范围" | "充能时间"
```


# y3.Const.AbilityIndex

```lua
{
    PASSIVE: integer = 0,
    MOVE: integer = 1,
    COMMON_ATK: integer = 2,
    ABILITY1: integer = 3,
    ABILITY2: integer = 4,
    ABILITY3: integer = 5,
    ABILITY4: integer = 6,
    ABILITY5: integer = 7,
    ABILITY6: integer = 8,
    ABILITY7: integer = 9,
    ABILITY8: integer = 10,
    ABILITY9: integer = 11,
    ABILITY10: integer = 12,
    ABILITY11: integer = 13,
    ABILITY12: integer = 14,
}
```


# y3.Const.AbilityIntAttr

```lua
"最大等级" | "最大充能数" | "当前等级" | "当前充能数"
```


# y3.Const.AbilityPointerType

```lua
{
    NONE: integer = 0,
    SECTOR: integer = 1,
    ARROW: integer = 2,
    DOUBLE_CIRCLE: integer = 3,
    TARGET: integer = 4,
    LOCATION: integer = 5,
    BUILD: integer = 6,
    VECTOR: integer = 7,
}
```


# y3.Const.AbilityStrAttr

```lua
"名称" | "描述"
```


# y3.Const.AbilityType

```lua
{
    HIDE: integer = 0,
    NORMAL: integer = 1,
    COMMON: integer = 2,
    HERO: integer = 3,
    隐藏: integer = 0,
    普通: integer = 1,
    命令: integer = 2,
    英雄: integer = 3,
}
```


# y3.Const.AbilityType.命令


# y3.Const.AbilityType.普通


# y3.Const.AbilityType.英雄


# y3.Const.AbilityType.隐藏


# y3.Const.AbilityTypeAlias

```lua
y3.Const.AbilityTypeAlias:
    | '隐藏'
    | '普通'
    | '命令'
    | '英雄'
```


```lua
'命令'|'普通'|'英雄'|'隐藏'
```


# y3.Const.CameraMoveMode

```lua
"ACC" | "SMOOTH" | "DEC" | "匀速" | "匀加速" | "匀减速"
```


# y3.Const.CollisionLayers

```lua
"地面" | "空中" | "水面" | "物件"
```


# y3.Const.CursorState

```lua
y3.Const.CursorState:
    | '常态悬浮'
    | '常态选取'
    | '常态禁用'
    | '敌方建筑单位悬浮'
    | '敌方非建筑单位悬浮'
    | '敌方建筑单位选取'
    | '敌方非建筑单位选取'
    | '己方建筑单位悬浮'
    | '己方非建筑单位悬浮'
    | '己方建筑单位选取'
    | '己方非建筑单位选取'
    | '友方建筑单位悬浮'
    | '友方非建筑单位悬浮'
    | '友方建筑单位选取'
    | '友方非建筑单位选取'
```


```lua
'友方建筑单位悬浮'|'友方建筑单位选取'|'友方非建筑单位悬浮'|'友方非建筑单位选取'|'己方建筑单位悬浮'...(+10)
```


# y3.Const.DMGType

```lua
{
    PHY: integer = 0,
    MAG: integer = 1,
    REAL: integer = 2,
}
```


# y3.Const.DamageTextType

```lua
y3.Const.DamageTextType:
    | 'get_gold' -- 获取金币
    | 'heal' -- 治疗
    | 'magic' -- 法术
    | 'physics' -- 物理
    | 'real' -- 真实
```


```lua
'get_gold'|'heal'|'magic'|'physics'|'real'
```


# y3.Const.DamageType

```lua
y3.Const.DamageType:
    | '物理'
    | '法术'
    | '真实'
```


```lua
'法术'|'物理'|'真实'
```


# y3.Const.DestructibleEventType

```lua
{
    DEST_CREATE: string = ET_DEST_CREATE_NEW,
    DEST_DIE: string = ET_DEST_DIE_NEW,
    DEST_REVIVE: string = ET_DEST_REVIVE_NEW,
    DEST_RES_CNT_CHG: string = ET_DEST_RES_CNT_CHG_NEW,
    DEST_COLLECTED: string = ET_DEST_COLLECTED_NEW,
    DEST_GET_HURT: string = ET_GET_HURT_NEW,
    DEST_DELETE: string = ET_DEST_DELETE,
}
```


# y3.Const.EaseType

```lua
{
    ease_in曲线: integer = 1,
    ease_out曲线: integer = 2,
    ease_in_out曲线: integer = 3,
}
```


# y3.Const.EaseType.ease_in_out曲线


# y3.Const.EaseType.ease_in曲线


# y3.Const.EaseType.ease_out曲线


# y3.Const.EffectType

```lua
{
    NONE: integer = 0,
    NORMAL: integer = 1,
    POSITIVE: integer = 2,
    NEGATIVE: integer = 3,
}
```


# y3.Const.EventType


```lua
y3.Const.AbilityEventType|y3.Const.DestructibleEventType|y3.Const.GlobalEventType|y3.Const.ItemEventType|y3.Const.ModifierEventType...(+4)
```


# y3.Const.FloatTextJumpType

TODO：应该解析文件


# y3.Const.FloatTextType

```lua
"物理伤害" | "魔法伤害" | "真实伤害" | "治疗" | "获取金币" | "系统字体" | "微软雅黑" | "华康黑体W9" | "华康黑体W12" | "华康标题宋W9" | "华康魏碑W7" | "华康新综艺体W7" | "华康新综艺体W9" | "华康圆体W5" | "华康圆体W7" | "华康圆体W9"
```


# y3.Const.GlobalEventType

```lua
{
    GAME_INIT: string = ET_GAME_INIT,
    GAME_PAUSE: string = ET_GAME_PAUSE,
    GAME_RESUME: string = ET_GAME_RESUME,
    GAME_ELAPSE_ONCE: string = ET_TIMEOUT,
    GAME_ELAPSE_REPEAT: string = ET_REPEAT_TIMEOUT,
    BUILD_SUCCESS: string = ET_ABILITY_BUILD_FINISH,
    START_SKILL_POINTER: string = ET_START_SKILL_POINTER,
    STOP_SKILL_POINTER: string = ET_STOP_SKILL_POINTER,
    CUSTOM_EVENT: string = ET_EVENT_CUSTOM,
    UI_EVENT: string = ET_TRIGGER_COMPONENT_EVENT,
    UNIT_ATTR_CHANGE: string = ET_UNIT_ATTR_CHANGE,
    UNIT_START_NAVI: string = ET_UNIT_START_NAV_EVENT,
    UNIT_END_NAVI: string = ET_UNIT_END_NAV_EVENT,
    ITEM_BROKEN: string = ET_ITEM_BROKEN,
    ITEM_SOLD: string = ET_ITEM_SOLD,
    AREA_ENTER: string = ET_AREA_ENTER,
    AREA_LEAVE: string = ET_AREA_LEAVE,
    UNIT_PRECONDITION_MEET: string = ET_UNIT_PRECONDITION_SUCCEED,
    UNIT_PRECONDITION_FAILED: string = ET_UNIT_PRECONDITION_FAILED,
    ITEM_PRECONDITION_MEET: string = ET_ITEM_PRECONDITION_SUCCEED,
    ITEM_PRECONDITION_FAILED: string = ET_ITEM_PRECONDITION_FAILED,
    ABILITY_PRECONDITION_MEET: string = ET_ABILITY_PRECONDITION_SUCCEED,
    ABILITY_PRECONDITION_FAILED: string = ET_ABILITY_PRECONDITION_FAILED,
    TECH_PRECONDITION_MEET: string = ET_TECH_PRECONDITION_SUCCEED,
    TECH_PRECONDITION_FAILED: string = ET_TECH_PRECONDITION_FAILED,
    KEYBOARD_DOWN: string = ET_KEYBOARD_KEY_DOWN_EVENT,
    KEYBOARD_UP: string = ET_KEYBOARD_KEY_UP_EVENT,
    MOUSE_DOWN: string = ET_MOUSE_KEY_DOWN_EVENT,
    MOUSE_UP: string = ET_MOUSE_KEY_UP_EVENT,
    MOUSE_D_CLICK: string = MOUSE_KEY_DB_CLICK_EVENT,
    MOUSE_MOVE: string = MOUSE_MOVE_EVENT,
    MOUSE_WHEEL: string = ET_MOUSE_WHEEL_EVENT,
    MOUSE_DOWN_UNIT: string = MOUSE_KEY_DOWN_UNIT_EVENT,
    MOUSE_UP_UNIT: string = MOUSE_KEY_UP_UNIT_EVENT,
    MOUSE_D_CLICK_UNIT: string = MOUSE_KEY_DB_CLICK_UNIT_EVENT,
    MOUSE_HOVER: string = ET_MOUSE_HOVER_EVENT,
    SELECT_UNIT: string = ET_SELECT_UNIT,
    SELECT_UNIT_GROUP: string = ET_SELECT_UNIT_GROUP,
    SELECT_ITEM: string = ET_SELECT_ITEM,
    D_CLICK_ITEM: string = ET_DOUBLE_CLICK_ITEM,
    SELECT_DEST: string = ET_SELECT_DEST,
    D_CLICK_DEST: string = ET_DOUBLE_CLICK_DEST,
    PLAYER_JOIN: string = ET_ROLE_JOIN_BATTLE,
    PLAYER_EXIT: string = ET_ROLE_ACTIVE_EXIT_GAME_EVENT,
    PLAYER_LOSE_CONNECT: string = ET_ROLE_LOSE_CONNECT,
    PLAYER_RESOURCE_CHANGED: string = ET_ROLE_RESOURCE_CHANGED,
    PLAYER_SEND_STRING: string = ET_ROLE_INPUT_MSG,
    PLAYER_SEND_ANY: string = ET_CHAT_SEND_GM,
    PLAYER_UPGRADE_TECH: string = ET_ROLE_TECH_UPGRADE,
    PLAYER_DOWNGRADE_TECH: string = ET_ROLE_TECH_DOWNGRADE,
    PLAYER_CHANGE_TECH: string = ET_ROLE_TECH_CHANGED,
}
```


# y3.Const.HarmTextType

```lua
"系统字体" | "物理伤害" | "物理暴击" | "治疗" | "魔法伤害" | "魔法暴击" | "真实伤害" | "金币获取" | "魔兽获取金币" | "魔兽获取木材" | "嘲讽" | "沉默" | "定身" | "减速" | "晕眩" | "致盲"
```


# y3.Const.ItemEventType

```lua
{
    ITEM_CREATE: string = ET_ITEM_ON_CREATE,
    ITEM_ADD: string = ET_UNIT_ADD_ITEM,
    ITEM_ADD_TO_PKG: string = ET_UNIT_ADD_ITEM_TO_PKG,
    ITEM_ADD_TO_BAR: string = ET_UNIT_ADD_ITEM_TO_BAR,
    ITEM_REMOVE: string = ET_UNIT_REMOVE_ITEM,
    ITEM_REMOVE_FROM_PKG: string = ET_UNIT_REMOVE_ITEM_FROM_PKG,
    ITEM_REMOVE_FROM_BAR: string = ET_UNIT_REMOVE_ITEM_FROM_BAR,
    ITEM_USE: string = ET_UNIT_USE_ITEM,
    ITEM_CHANGE_STACK: string = ET_ITEM_STACK_CHANGED,
    ITEM_CHANGE_CHARGE: string = ET_ITEM_CHARGE_CHANGED,
    ITEM_DESTROY: string = ET_ITEM_ON_DESTROY,
    ITEM_CREATE_ON_DEST_COLLECTED: string = ET_ITEM_CREATE_ON_DEST_COLLECTED,
}
```


# y3.Const.KeyboardKey

```lua
{
    NONE: integer = 0,
    ESCAPE: integer = 1,
    KEY_1: integer = 2,
    KEY_2: integer = 3,
    KEY_3: integer = 4,
    KEY_4: integer = 5,
    KEY_5: integer = 6,
    KEY_6: integer = 7,
    KEY_7: integer = 8,
    KEY_8: integer = 9,
    KEY_9: integer = 10,
    KEY_0: integer = 11,
    MINUS: integer = 12,
    EQUAL: integer = 13,
    BACKSPACE: integer = 14,
    TAB: integer = 15,
    Q: integer = 16,
    W: integer = 17,
    E: integer = 18,
    R: integer = 19,
    T: integer = 20,
    Y: integer = 21,
    U: integer = 22,
    I: integer = 23,
    O: integer = 24,
    P: integer = 25,
    LBRACKET: integer = 26,
    RBRACKET: integer = 27,
    RETURN: integer = 28,
    ENTER: integer = 28,
    LCTRL: integer = 29,
    A: integer = 30,
    S: integer = 31,
    D: integer = 32,
    F: integer = 33,
    G: integer = 34,
    H: integer = 35,
    J: integer = 36,
    K: integer = 37,
    L: integer = 38,
    SEMICOLON: integer = 39,
    APOSTROPHE: integer = 40,
    GRAVE: integer = 41,
    LSHIFT: integer = 42,
    BACKSLASH: integer = 43,
    Z: integer = 44,
    X: integer = 45,
    C: integer = 46,
    V: integer = 47,
    B: integer = 48,
    N: integer = 49,
    M: integer = 50,
    COMMA: integer = 51,
    PERIOD: integer = 52,
    SLASH: integer = 53,
    RSHIFT: integer = 54,
    NUM_STAR: integer = 55,
    LALT: integer = 56,
    SPACE: integer = 57,
    CAPSLOCK: integer = 58,
    F1: integer = 59,
    F2: integer = 60,
    F3: integer = 61,
    F4: integer = 62,
    F5: integer = 63,
    F6: integer = 64,
    F7: integer = 65,
    F8: integer = 66,
    F9: integer = 67,
    F10: integer = 68,
    PAUSE: integer = 69,
    SCROLL_LOCK: integer = 70,
    NUM_7: integer = 71,
    NUM_8: integer = 72,
    NUM_9: integer = 73,
    NUM_MINUS: integer = 74,
    NUM_4: integer = 75,
    NUM_5: integer = 76,
    NUM_6: integer = 77,
    NUM_ADD: integer = 78,
    NUM_1: integer = 79,
    NUM_2: integer = 80,
    NUM_3: integer = 81,
    NUM_0: integer = 82,
    NUM_PERIOD: integer = 83,
    F11: integer = 87,
    F12: integer = 88,
    NUM_ENTER: integer = 156,
    RCTRL: integer = 157,
    NUM_COMMA: integer = 179,
    NUM_SLASH: integer = 181,
    SYSRQ: integer = 183,
    R_ALT: integer = 184,
    NUM_LOCK: integer = 197,
    HOME: integer = 199,
    UPARROW: integer = 200,
    PAGEUP: integer = 201,
    LEFTARROW: integer = 203,
    RIGHTARROW: integer = 205,
    END: integer = 207,
    DOWNARROW: integer = 208,
    PAGEDOWN: integer = 209,
    INSERT: integer = 210,
    DELETE: integer = 211,
    LWIN: integer = 219,
    RWIN: integer = 220,
    APPS: integer = 221,
}
```


# y3.Const.LinkSfxPointType

```lua
{
    START: integer = 1,
    END: integer = 2,
}
```


# y3.Const.ModifierEventType

```lua
{
    OBTAIN_MODIFIER: string = ET_OBTAIN_MODIFIER,
    LOSS_MODIFIER: string = ET_LOSS_MODIFIER,
    MODIFIER_CYCLE_TRIGGER: string = ET_MODIFIER_CYCLE_TRIGGER,
    MODIFIER_LAYER_CHANGE: string = ET_MODIFIER_LAYER_CHANGE,
    MODIFIER_GET_BEFORE_CREATE: string = ET_MODIFIER_GET_BEFORE_CREATE,
    MODIFIER_BE_COVERED: string = ET_MODIFIER_BE_COVERED,
    MODIFIER_ADDTION: string = ET_MODIFIER_ADDTION,
}
```


# y3.Const.ModifierType

```lua
{
    NONE: integer = 0,
    NORMAL: integer = 1,
    HALO: integer = 2,
    HALO_EFFECT: integer = 3,
    SHIELD: integer = 4,
}
```


# y3.Const.MouseKey

```lua
{
    LEFT: integer = 240,
    RIGHT: integer = 241,
    MIDDLE: integer = 242,
    WHEEL_UP: integer = 243,
    WHEEL_DOWN: integer = 244,
}
```


# y3.Const.PlatformEventType

```lua
{
    HOLD_STORE_ITEM: string = ET_ROLE_HOLD_STORE_ITEM,
    USE_STORE_ITEM_END: string = ET_ROLE_USE_STORE_ITEM_END,
}
```


# y3.Const.PlayerAttr

```lua

```


# y3.Const.ProjectileEventType

```lua
{
    PROJECTILE_PRODUCE: string = ET_PRODUCE_PROJECTILE,
    PROJECTILE_END: string = ET_DEATH_PROJECTILE,
}
```


# y3.Const.RoleStatus

```lua
{
    PLAYING: integer = 1,
    NONE: integer = 2,
    LOST: integer = 3,
    LEFT: integer = 4,
    WATCHING: integer = 5,
}
```


# y3.Const.RoleType

```lua
{
    NONE: integer = 0,
    USER: integer = 1,
    COMPUTER: integer = 2,
    AI_EASY: integer = 5,
    AI_HARD: integer = 6,
    OBSERVER: integer = 10,
}
```


# y3.Const.SfxRotateType

```lua
"跟随节点" | "跟随模型" | "不跟随"
```


# y3.Const.ShiftSlotType

```lua
{
    物品栏: integer = 1,
    背包栏: integer = 0,
}
```


# y3.Const.ShiftSlotType.物品栏


# y3.Const.ShiftSlotType.背包栏


# y3.Const.ShiftSlotTypeAlias

```lua
y3.Const.ShiftSlotTypeAlias:
    | '物品栏'
    | '背包栏'
```


```lua
'物品栏'|'背包栏'
```


# y3.Const.SignalType

```lua
"普通" | "黄色" | "蓝色"
```


# y3.Const.SlotType

```lua
{
    NOT_IN_BAG: integer = -1,
    PKG: integer = 0,
    BAR: integer = 1,
}
```


# y3.Const.UIAnimKey

```lua

```


# y3.Const.UIAttr

```lua
"文本" | "最大值" | "当前值"
```


# y3.Const.UIButtonStatus

```lua
{
    常态: integer = 1,
    悬浮: integer = 2,
    按下: integer = 3,
    禁用: integer = 4,
}
```


# y3.Const.UIButtonStatus.常态


# y3.Const.UIButtonStatus.悬浮


# y3.Const.UIButtonStatus.按下


# y3.Const.UIButtonStatus.禁用


# y3.Const.UIComponentType

```lua
y3.Const.UIComponentType:
    | '物品'
    | '按钮'
    | '富文本'
    | '文本'
    | '图片'
    | '进度条'
    | '模型'
    | '空节点'
    | '标签页'
    | '设置'
    | '列表'
    | '滑动条'
    | '聊天'
    | '轮播图'
    | '语音开关'
    | '输入框'
    | '地图'
    | '技能按钮'
    | '魔法效果'
    | '序列帧'
```


```lua
'列表'|'图片'|'地图'|'富文本'|'序列帧'...(+15)
```


# y3.Const.UIEvent

```lua
y3.Const.UIEvent:
    | '左键-按下'
    | '左键-抬起'
    | '左键-点击'
    | '左键-双击'
    | '鼠标-悬停'
    | '鼠标-移入'
    | '鼠标-移出'
    | '鼠标-右击'
    | '右键-按下'
    | '右键-抬起'
    | '右键-点击'
    | '右键-双击'
```


```lua
'右键-双击'|'右键-抬起'|'右键-按下'|'右键-点击'|'左键-双击'...(+7)
```


# y3.Const.UIEventType

```lua
{
    UI_CREATE: string = ET_UI_PREFAB_CREATE_EVENT,
    UI_DELETE: string = ET_UI_PREFAB_DEL_EVENT,
}
```


# y3.Const.UIHAlignmentType

```lua
y3.Const.UIHAlignmentType:
    | '左'
    | '中'
    | '右'
```


```lua
'中'|'右'|'左'
```


# y3.Const.UIRelativeParentPosType

```lua
y3.Const.UIRelativeParentPosType:
    | '顶部'
    | '底部'
    | '左侧'
    | '右侧'
```


```lua
'右侧'|'左侧'|'底部'|'顶部'
```


# y3.Const.UIVAlignmentType

```lua
y3.Const.UIVAlignmentType:
    | '上'
    | '中'
    | '下'
```


```lua
'上'|'下'|'中'
```


# y3.Const.UnitAttr

```lua
"生命" | "魔法" | "最大生命" | "生命恢复" | "最大魔法" | "魔法恢复" | "物理攻击" | "法术攻击" | "物理防御" | "法术防御" | "攻击速度" | "冷却缩减" | "命中率" | "躲避率" | "暴击率" | "暴击伤害" | "物理穿透" | "法术穿透" | "物理吸血" | "法术吸血" | "物理穿透比例" | "法术穿透比例" | "受伤减免" | "伤害加成" | "被治疗加成" | "移动速度" | "真实视野" | "攻击间隔" | "攻击范围" | "白天视野" | "夜晚视野" | "白天扇形视野半径" | "夜晚扇形视野半径" | "白天扇形视野夹角" | "夜晚扇形视野夹角" | "百分比生命恢复"
```


# y3.Const.UnitAttrType

```lua
"基础" | "基础加成" | "增益" | "增益加成" | "最终加成"
```


# y3.Const.UnitEnumState

```lua
"禁止普攻" | "禁止施法" | "禁止移动" | "禁止转向" | "动画定帧" | "无法施加运动" | "无法被技能指示器锁定" | "无法被选中" | "隐身" | "无视静态碰撞" | "无视动态碰撞" | "不会死亡" | "无敌" | "无法控制" | "无法被攻击" | "AI无视" | "物理伤害免疫" | "魔法伤害免疫" | "负面魔法效果免疫" | "隐藏" | "无法被筛选器选中" | "真实伤害免疫" | "禁止使用道具"
```


# y3.Const.UnitEventType

```lua
{
    BEFORE_UNIT_DIE: string = ET_BEFORE_UNIT_DIE,
    UNIT_DIE: string = ET_UNIT_DIE,
    KILL_UNIT: string = ET_KILL_UNIT,
    UNIT_BORN: string = ET_UNIT_BORN,
    REVIVE_UNIT: string = ET_REVIVE_UNIT,
    UPGRADE_UNIT: string = ET_UPGRADE_UNIT,
    UNIT_PRE_ADD_EXP: string = ET_UNIT_PRE_ADD_EXP,
    UNIT_ON_ADD_EXP: string = ET_UNIT_ON_ADD_EXP,
    UNIT_BE_HURT: string = ET_UNIT_BE_HURT,
    UNIT_HURT_OTHER: string = ET_UNIT_HURT_OTHER,
    UNIT_BE_HURT_BEFORE_APPLY: string = ET_UNIT_BE_HURT_BEFORE_APPLY,
    UNIT_HURT_OTHER_BEFORE_APPLY: string = ET_UNIT_HURT_OTHER_BEFORE_APPLY,
    UNIT_BE_HURT_COMPLETE: string = ET_UNIT_BE_HURT_COMPLETE,
    UNIT_HURT_OTHER_COMPLETE: string = ET_UNIT_HURT_OTHER_FINISH,
    UNIT_GET_CURE_BEFORE_APPLY: string = ET_UNIT_GET_CURE_BEFORE_APPLY,
    UNIT_GET_CURE_FINISH: string = ET_UNIT_GET_CURE_FINISH,
    UNIT_GET_CURE: string = ET_UNIT_GET_CURE,
    UNIT_RELEASE_ABILITY: string = ET_UNIT_RELEASE_ABILITY,
    UNIT_START_MOVE: string = ET_UNIT_START_MOVE,
    UNIT_ENTER_BATTLE: string = ET_UNIT_ENTER_BATTLE,
    UNIT_EXIT_BATTLE: string = ET_UNIT_EXIT_BATTLE,
    UNIT_ENTER_GRASS: string = ET_UNIT_ENTER_GRASS,
    UNIT_LEAVE_GRASS: string = ET_UNIT_LEAVE_GRASS,
    UNIT_ON_COMMAND: string = ET_UNIT_ON_COMMAND,
    UNIT_ABILITY_UPGRADE: string = ET_ABILITY_PLUS_POINT,
    UNIT_REMOVE: string = ET_UNIT_REMOVE,
    UNIT_SHOP_BUY_UNIT: string = ET_UNIT_SHOP_BUY_UNIT,
    UNIT_SHOP_BUY_ITEM: string = ET_UNIT_SHOP_BUY_ITEM,
    UNIT_ITEM_SELL: string = ET_UNIT_ITEM_SELL,
    UNIT_ITEM_COMPOSE: string = ET_UNIT_ITEM_COMPOSE,
    UNIT_SHOP_BUY_WITH_COMPOSE: string = ET_UNIT_SHOP_BUY_WITH_COMPOSE,
    UNIT_UPGRADE_TECH: string = ET_UNIT_UPGRADE_TECH,
    UNIT_ADD_TECH: string = ET_UNIT_ADD_TECH,
    UNIT_REMOVE_TECH: string = ET_UNIT_REMOVE_TECH,
    UNIT_ROLE_CHANGED: string = ET_UNIT_ROLE_CHANGED,
}
```


# y3.Const.VisibleType

```lua
"全体" | "自己" | "友方" | "敌方"
```


