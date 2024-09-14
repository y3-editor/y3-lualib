--常量
---@class y3.Const
local M = {}

---@enum y3.Const.EaseType
M.EaseType = {
    ['ease_in曲线'] = 1,
    ['ease_out曲线'] = 2,
    ['ease_in_out曲线'] = 3,
}

M.IterKey = {
    ['ITER_INT'] = "__iter_int",
    ['ITER_INDEX'] = "__iter_index",
    ['ITER_UNIT'] = 'pick_unit_id',
    ['ITER_ITEM'] = 'item_iter',
    ['ITER_ITEM_NO'] = '__iter_item_no',
    ['ITER_ABILITY'] = "ability_iter",
    ['ITER_MODIFIER'] = "modifier_iter",
    ['ITER_PROJECTILE'] = "pick_projectile_id",
    ['ITER_TECH'] = "__tech_iter",
    ['ITER_DEST'] = "destructible_iter",
    ['ITER_SHOP_ITEM'] = "shop_item_iter",
    ['ITER_UI_COMP'] = "ui_comp_iter",
    ['ITER_RECT_AREA'] = "rect_area_iter",
    ['ITER_CIRCLE_AREA'] = "circle_area_iter",
    ['ITER_POLY_AREA'] = "polygon_area_iter",
    ['ITER_POLY_AREA_POINT'] = "poly_area_point_iter",
    ['ITER_ROAD'] = "iter_road",
    ['ITER_RANDOM_POOL'] = "random_pool_iter",
    ['ITER_ROLE'] = "role_iter",
    ['ITER_ROLE_RES'] = "__role_res_key",
    ['ITER_TABLE_ITEM'] = "__ITER_TABLE_ITEM",
}

M.UnitCategory = {
    HERO = 1,
    BUILDING = 2,
    CREATURE = 4,
}

M.PatrolType = {
    ONE_WAY = 0,
    BACK_AND_FORTH = 1,
    LOOP = 2,
}

M.UnitState = {
    ALIVE = 'Alive',
    DEAD = 'Dead',
    DISSOLVE = 'Dissolve',
}

---@enum(key) y3.Const.UnitAttr
M.UnitAttr = {
    ['生命'] = 'hp_cur',
    ['魔法'] = 'mp_cur',
    ['最大生命'] = 'hp_max',
    ['生命恢复'] = 'hp_rec',
    ['最大魔法'] = 'mp_max',
    ['魔法恢复'] = 'mp_rec',
    ['物理攻击'] = 'attack_phy',
    ['法术攻击'] = 'attack_mag',
    ['物理防御'] = 'defense_phy',
    ['法术防御'] = 'defense_mag',
    ['攻击速度'] = 'attack_speed', --百分比
    ['冷却缩减'] = 'cd_reduce', --百分比
    ['命中率'] = 'hit_rate', --百分比
    ['躲避率'] = 'dodge_rate', --百分比
    ['暴击率'] = 'critical_chance', --百分比
    ['暴击伤害'] = 'critical_dmg', --百分比
    ['物理穿透'] = 'pene_phy',
    ['法术穿透'] = 'pene_mag',
    ['物理吸血'] = 'vampire_phy', --百分比
    ['法术吸血'] = 'vampire_mag', --百分比
    ['物理穿透比例'] = 'pene_phy_ratio', --百分比
    ['法术穿透比例'] = 'pene_mag_ratio', --百分比
    ['受伤减免'] = 'dmg_reduction', --百分比
    ['伤害加成'] = 'extra_dmg', --百分比
    ['被治疗加成'] = 'healing_effect', --百分比
    ['移动速度'] = 'ori_speed',
    ['真实视野'] = 'vision_true',
    ['攻击间隔'] = 'attack_interval',
    ['攻击范围'] = 'attack_range',
    ['白天视野'] = 'vision_rng',
    ['夜晚视野'] = 'vision_night',
    ['白天扇形视野半径'] = 'vision_sector_rng',
    ['夜晚扇形视野半径'] = 'vision_sector_night',
    ['白天扇形视野夹角'] = 'vision_sector_angle_day',
    ['夜晚扇形视野夹角'] = 'vision_sector_angle_night',
    ['百分比生命恢复'] = 'hp_rec_percent',
}

M.UnitKeyFloatAttr = {
    ['ROTATE_SPEED'] = 'rotate_speed', -- 转身速度
    ['CANCEL_ALARM_RANGE'] = 'cancel_alarm_range', -- 取消警戒范围
    ['ALARM_RANGE'] = 'alarm_range', -- 警戒范围
    ['BODY_SIZE'] = 'body_size', -- 缩放
    ['CD_REDUCE'] = 'cd_reduce', -- 冷却缩减
    ['VISION_RNG'] = 'vision_rng', -- 视野范围
    ['HP_MAX'] = 'hp_max', -- 最大生命
    ['HP_REC'] = 'hp_rec', -- 生命恢复
    ['MP_MAX'] = 'mp_max', -- 最大魔法
    ['MP_REC'] = 'mp_rec', -- 魔法恢复
    ['ORI_SPEED'] = 'ori_speed', -- 施法速度
    ['ATTACK_PHY'] = 'attack_phy', -- 物理攻击力
    ['ATTACK_MAG'] = 'attack_mag', -- 法术攻击力
    ['DEFENSE_PHY'] = 'defense_phy', -- 物理防御力
    ['DEFENSE_MAG'] = 'defense_mag', -- 法术防御力
    ['ATTACK_SPEED'] = 'attack_speed', -- 攻击速度
    ['CRITICAL_CHANCE'] = 'critical_chance', -- 暴击率
    ['CRITICAL_DMG'] = 'critical_dmg', -- 暴击伤害
    ['PENE_PHY'] = 'pene_phy', -- 物理穿透
    ['PENE_MAG'] = 'pene_mag', -- 法术穿透
    ['VAMPIRE_PHY'] = 'vampire_phy', -- 物理吸血
    ['VAMPIRE_MAG'] = 'vampire_mag', -- 法术吸血
    ['PENE_PHY_RATIO'] = 'pene_phy_ratio', -- 物理穿透
    ['PENE_MAG_RATIO'] = 'pene_mag_ratio', -- 法术穿透
    ['DMG_REDUCTION'] = 'dmg_reduction', -- 伤害减免
    ['HIT_RATE'] = 'hit_rate', -- 命中率
    ['DODGE_RATE'] = 'dodge_rate', -- 躲避率
    ['ATTACK_RANGE'] = 'attack_range', -- 攻速
}

---@enum(key) y3.Const.UnitAttrType
M.UnitAttrType = {
    ["基础"] = "ATTR_BASE",
    ["基础加成"] = "ATTR_BASE_RATIO", --百分比
    ["增益"] = "ATTR_BONUS",
    ["增益加成"] = "ATTR_BONUS_RATIO", --百分比
    ["最终加成"] = "ATTR_ALL_RATIO", --百分比
}

---@enum(key) y3.Const.UnitEnumState
M.UnitEnumState = {
    ["禁止普攻"] = 1 << 1,
    ["禁止施法"] = 1 << 2,
    ["禁止移动"] = 1 << 3,
    ["禁止转向"] = 1 << 4,
    ["动画定帧"] = 1 << 5,
    ["无法施加运动"] = 1 << 6,
    ["无法被技能指示器锁定"] = 1 << 7,
    ["无法被选中"] = 1 << 8,
    ["隐身"] = 1 << 9,
    ["无视静态碰撞"] = 1 << 10,
    ["无视动态碰撞"] = 1 << 11,
    ["不会死亡"] = 1 << 12,
    ["无敌"] = 1 << 13,
    ["无法控制"] = 1 << 14,
    ["无法被攻击"] = 1 << 15,
    ["AI无视"] = 1 << 16,
    ["物理伤害免疫"] = 1 << 17,
    ["魔法伤害免疫"] = 1 << 18,
    ["负面魔法效果免疫"] = 1 << 19,
    ["隐藏"] = 1 << 20,
    ["无法被筛选器选中"] = 1 << 21,
    ["真实伤害免疫"] = 1 << 22,
    ["禁止使用道具"] = 1 << 23,
}

---@enum(key) y3.Const.PlayerAttr
M.PlayerAttr = {}

M.ModifyType = {
    ADD = 0,
    SUB = 1,
    SET = 2,
}

---@alias y3.Const.DamageType
---| '物理'
---| '法术'
---| '真实'

M.DamageTypeMap = {
    ['物理'] = 0,
    ['法术'] = 1,
    ['真实'] = 2,
}

---@enum y3.Const.DMGType
M.DMGType = {
    PHY = 0,
    MAG = 1,
    REAL = 2,
}

M.AbilityCategory = {
    COMMON_ATK = 1,
    COMMON_ABILITY = 2,
    HERO_ABILITY = 3,
    PASSIVE_ABILITY = 0,
}

---@alias y3.Const.AbilityTypeAlias
---| '隐藏'
---| '普通'
---| '命令'
---| '英雄'

---@enum y3.Const.AbilityType
M.AbilityType = {
   HIDE    = 0,
   NORMAL  = 1,
   COMMON  = 2,
   HERO    = 3,
   ['隐藏'] = 0,
   ['普通'] = 1,
   ['命令'] = 2,
   ['英雄'] = 3,
}

M.AbilityCastType = {
    COMMON_ATK = 1,
    ACTIVE_ABILITY = 2,
    PASSIVE_ABILITY = 3,
    BUILDING_ABILITY = 4,
    PICK_ABILITY = 6,
}

---@enum y3.Const.AbilityIndex
M.AbilityIndex = {
    ['PASSIVE'] = 0,
    ['MOVE'] = 1,
    ['COMMON_ATK'] = 2,
    ['ABILITY1'] = 3,
    ['ABILITY2'] = 4,
    ['ABILITY3'] = 5,
    ['ABILITY4'] = 6,
    ['ABILITY5'] = 7,
    ['ABILITY6'] = 8,
    ['ABILITY7'] = 9,
    ['ABILITY8'] = 10,
    ['ABILITY9'] = 11,
    ['ABILITY10'] = 12,
    ['ABILITY11'] = 13,
    ['ABILITY12'] = 14,
}

---@enum y3.Const.RoleType
M.RoleType = {
    NONE = 0,
    USER = 1,
    COMPUTER = 2,
    AI_EASY = 5,
    AI_HARD = 6,
    OBSERVER = 10,
}

---@enum y3.Const.RoleStatus
M.RoleStatus = {
    ['PLAYING'] = 1,
    ['NONE'] = 2,
    ['LOST'] = 3,
    ['LEFT'] = 4,
    ['WATCHING'] = 5,
}

M.MovementObstacleProcessType = {
    ['IGNORE_OBSTACLE'] = 1,
    ['NOT_THROUGH'] = 2,
    ['POINT_BEFORE'] = 4,
    ['POINT_BEHIND'] = 8,
    ['POINT_MIDDLE'] = 16,
}

---@enum y3.Const.MouseKey
M.MouseKey = {
    LEFT = 0xF0, -- 左键
    RIGHT = 0xF1, -- 右键
    MIDDLE = 0xF2, -- 中键
    WHEEL_UP = 0xF3, -- 上滚
    WHEEL_DOWN = 0xF4, -- 下滚
}

---@enum y3.Const.KeyboardKey
M.KeyboardKey = {
    ['NONE'] = 0x00,
    ['ESCAPE'] = 0x01, -- ESC
    ['KEY_1'] = 0x02, -- 1
    ['KEY_2'] = 0x03, -- 2
    ['KEY_3'] = 0x04, -- 3
    ['KEY_4'] = 0x05, -- 4
    ['KEY_5'] = 0x06, -- 5
    ['KEY_6'] = 0x07, -- 6
    ['KEY_7'] = 0x08, -- 7
    ['KEY_8'] = 0x09, -- 8
    ['KEY_9'] = 0x0A, -- 9
    ['KEY_0'] = 0x0B, -- 0
    ['MINUS'] = 0x0C, -- -
    ['EQUAL'] = 0x0D, -- =
    ['BACKSPACE'] = 0x0E, -- Backspace
    ['TAB'] = 0x0F, -- Tab
    ['Q'] = 0x10, -- Q
    ['W'] = 0x11, -- W
    ['E'] = 0x12, -- E
    ['R'] = 0x13, -- R
    ['T'] = 0x14, -- T
    ['Y'] = 0x15, -- Y
    ['U'] = 0x16, -- U
    ['I'] = 0x17, -- I
    ['O'] = 0x18, -- O
    ['P'] = 0x19, -- P
    ['LBRACKET'] = 0x1A, -- [
    ['RBRACKET'] = 0x1B, -- ]
    ['RETURN'] = 0x1C, -- Enter
    ['ENTER'] = 0x1C, -- Enter
    ['LCTRL'] = 0x1D, -- 左Ctrl
    ['A'] = 0x1E, -- A
    ['S'] = 0x1F, -- S
    ['D'] = 0x20, -- D
    ['F'] = 0x21, -- F
    ['G'] = 0x22, -- G
    ['H'] = 0x23, -- H
    ['J'] = 0x24, -- J
    ['K'] = 0x25, -- K
    ['L'] = 0x26, -- L
    ['SEMICOLON'] = 0x27, -- ;
    ['APOSTROPHE'] = 0x28, -- '
    ['GRAVE'] = 0x29, -- `
    ['LSHIFT'] = 0x2A, -- 左Shift
    ['BACKSLASH'] = 0x2B, -- \
    ['Z'] = 0x2C, -- Z
    ['X'] = 0x2D, -- X
    ['C'] = 0x2E, -- C
    ['V'] = 0x2F, -- V
    ['B'] = 0x30, -- B
    ['N'] = 0x31, -- N
    ['M'] = 0x32, -- M
    ['COMMA'] = 0x33, -- ,
    ['PERIOD'] = 0x34, -- .
    ['SLASH'] = 0x35, -- /
    ['RSHIFT'] = 0x36, -- 右Shift
    ['NUM_STAR'] = 0x37, -- 小键盘*
    ['LALT'] = 0x38, -- 左Alt
    ['SPACE'] = 0x39, -- Space
    ['CAPSLOCK'] = 0x3A, -- CAPSLOCK
    ['F1'] = 0x3B, -- F1
    ['F2'] = 0x3C, -- F2
    ['F3'] = 0x3D, -- F3
    ['F4'] = 0x3E, -- F4
    ['F5'] = 0x3F, -- F5
    ['F6'] = 0x40, -- F6
    ['F7'] = 0x41, -- F7
    ['F8'] = 0x42, -- F8
    ['F9'] = 0x43, -- F9
    ['F10'] = 0x44, -- F10
    ['PAUSE'] = 0x45, -- Pause
    ['SCROLL_LOCK'] = 0x46, -- Scroll Lock
    ['NUM_7'] = 0x47, -- 小键盘7
    ['NUM_8'] = 0x48, -- 小键盘8
    ['NUM_9'] = 0x49, -- 小键盘9
    ['NUM_MINUS'] = 0x4A, -- 小键盘-
    ['NUM_4'] = 0x4B, -- 小键盘4
    ['NUM_5'] = 0x4C, -- 小键盘5
    ['NUM_6'] = 0x4D, -- 小键盘6
    ['NUM_ADD'] = 0x4E, -- 小键盘+
    ['NUM_1'] = 0x4F, -- 小键盘1
    ['NUM_2'] = 0x50, -- 小键盘2
    ['NUM_3'] = 0x51, -- 小键盘3
    ['NUM_0'] = 0x52, -- 小键盘0
    ['NUM_PERIOD'] = 0x53, -- 小键盘.
    ['F11'] = 0x57, -- F11
    ['F12'] = 0x58, -- F12
    ['NUM_ENTER'] = 0x9C, -- 小键盘Enter
    ['RCTRL'] = 0x9D, -- 右Ctrl
    ['NUM_COMMA'] = 0xB3, -- 小键盘,
    ['NUM_SLASH'] = 0xB5, -- 小键盘/
    ['SYSRQ'] = 0xB7, -- 系统重启
    ['R_ALT'] = 0xB8, -- 右Alt
    ['NUM_LOCK'] = 0xC5, -- NumLock
    ['HOME'] = 0xC7, -- Home
    ['UPARROW'] = 0xC8, -- ↑
    ['PAGEUP'] = 0xC9, -- PageUp
    ['LEFTARROW'] = 0xCB, -- ←
    ['RIGHTARROW'] = 0xCD, -- →
    ['END'] = 0xCF, -- End
    ['DOWNARROW'] = 0xD0, -- ↓
    ['PAGEDOWN'] = 0xD1, -- PageDown
    ['INSERT'] = 0xD2, -- Insert
    ['DELETE'] = 0xD3, -- Delete
    ['LWIN'] = 0xDB, -- 左Win
    ['RWIN'] = 0xDC, -- 右Win
    ['APPS'] = 0xDD, -- 应用
}

M.GameResult = {
    ['VICTORY'] = 'victory',
    ['DEFEAT'] = 'defeat',
    ['NEUTRAL'] = 'neutral',
}

M.AreaAction = {
    ['ENTER'] = 1,
    ['LEAVE'] = 0,
}

M.StateAction = {
    ['ADD'] = true,
    ['REM'] = false,
}

M.OnOff = {
    ['ON'] = true,
    ['OFF'] = false,
}

M.OnceRecycle = {
    ['ONCE'] = true,
    ['RECYCLE'] = false,
}

---@enum(key) y3.Const.VisibleType
M.VisibleType = {
    ['全体'] = 1,
    ['自己'] = 2,
    ['友方'] = 3,
    ['敌方'] = 4,
}

---@enum y3.Const.LinkSfxPointType
M.LinkSfxPointType = {
    ['START'] = 1,
    ['END'] = 2,
}

---@enum(key) y3.Const.SfxRotateType
M.SfxRotateType = {
    ['跟随节点'] = 0,
    ['跟随模型'] = 1,
    ['不跟随'] = 2,
}

---@enum y3.Const.SlotType
M.SlotType = {
    ['NOT_IN_BAG'] = -1,
    ['PKG'] = 0,
    ['BAR'] = 1,
}

---@alias y3.Const.ShiftSlotTypeAlias
---| '物品栏'
---| '背包栏'

---@enum y3.Const.ShiftSlotType
M.ShiftSlotType = {
    ['物品栏'] = 1,
    ['背包栏'] = 0,
}

---@enum y3.Const.EffectType
M.ModifierEffectType = {
    ['NONE'] = 0,
    ['NORMAL'] = 1,
    ['POSITIVE'] = 2,
    ['NEGATIVE'] = 3,
}

---@enum y3.Const.ModifierType
M.ModifierType = {
    ['NONE'] = 0,
    ['NORMAL'] = 1,
    ['HALO'] = 2,
    ['HALO_EFFECT'] = 3,
    ['SHIELD'] = 4,
}

---@enum y3.Const.AbilityPointerType
M.AbilityPointerType = {
    ['NONE'] = 0,
    ['SECTOR'] = 1,
    ['ARROW'] = 2,
    ['DOUBLE_CIRCLE'] = 3,
    ['TARGET'] = 4,
    ['LOCATION'] = 5,
    ['BUILD'] = 6,
    ['VECTOR'] = 7,
}

M.DialogDebugType = {
    ['ERROR'] = 1,
    ['WARNING'] = 2,
    ['INFO'] = 3,
}

---@enum(key) y3.Const.CameraMoveMode
M.CameraMoveMode = {
    ['ACC'] = 1,
    ['SMOOTH'] = 0,
    ['DEC'] = 2,
    ['匀速'] = 0,
    ['匀加速'] = 1,
    ['匀减速'] = 2,
}

M.CameraShakeMode = {
    ['LEFT_RIGHT'] = 1,
    ['UP_DOWN'] = 2,
    ['FORWARD_BACKWARD'] = 4,
    ['LR_UD'] = 3,
    ['LR_FB'] = 5,
    ['UD_FB'] = 6,
    ['LR_UD_FB'] = 7,
}

---@enum(key) y3.Const.SignalType
M.SignalType = {
    ['普通'] = 1,
    ['黄色'] = 2,
    ['蓝色'] = 3,
}

---@enum y3.Const.GlobalEventType
M.GlobalEventType = {
    ['GAME_INIT'] = "ET_GAME_INIT",
    ['GAME_PAUSE'] = "ET_GAME_PAUSE",
    ['GAME_RESUME'] = "ET_GAME_RESUME",
    ['GAME_ELAPSE_ONCE'] = "ET_TIMEOUT",
    ['GAME_ELAPSE_REPEAT'] = "ET_REPEAT_TIMEOUT",
    ['BUILD_SUCCESS'] = "ET_ABILITY_BUILD_FINISH",
    ['START_SKILL_POINTER'] = "ET_START_SKILL_POINTER",
    ['STOP_SKILL_POINTER'] = "ET_STOP_SKILL_POINTER",
    ['CUSTOM_EVENT'] = "ET_EVENT_CUSTOM",
    ['UI_EVENT'] = "ET_TRIGGER_COMPONENT_EVENT",
    ['UNIT_ATTR_CHANGE'] = "ET_UNIT_ATTR_CHANGE",
    ['UNIT_START_NAVI'] = "ET_UNIT_START_NAV_EVENT",
    ['UNIT_END_NAVI'] = "ET_UNIT_END_NAV_EVENT",
    ['ITEM_BROKEN'] = "ET_ITEM_BROKEN",
    ['ITEM_SOLD'] = "ET_ITEM_SOLD",
    ['AREA_ENTER'] = "ET_AREA_ENTER",
    ['AREA_LEAVE'] = "ET_AREA_LEAVE",
    ['UNIT_PRECONDITION_MEET'] = "ET_UNIT_PRECONDITION_SUCCEED",
    ['UNIT_PRECONDITION_FAILED'] = "ET_UNIT_PRECONDITION_FAILED",
    ['ITEM_PRECONDITION_MEET'] = "ET_ITEM_PRECONDITION_SUCCEED",
    ['ITEM_PRECONDITION_FAILED'] = "ET_ITEM_PRECONDITION_FAILED",
    ['ABILITY_PRECONDITION_MEET'] = "ET_ABILITY_PRECONDITION_SUCCEED",
    ['ABILITY_PRECONDITION_FAILED'] = "ET_ABILITY_PRECONDITION_FAILED",
    ['TECH_PRECONDITION_MEET'] = "ET_TECH_PRECONDITION_SUCCEED",
    ['TECH_PRECONDITION_FAILED'] = "ET_TECH_PRECONDITION_FAILED",
    ['KEYBOARD_DOWN'] = "ET_KEYBOARD_KEY_DOWN_EVENT",
    ['KEYBOARD_UP'] = "ET_KEYBOARD_KEY_UP_EVENT",
    ['MOUSE_DOWN'] = "ET_MOUSE_KEY_DOWN_EVENT",
    ['MOUSE_UP'] = "ET_MOUSE_KEY_UP_EVENT",
    ['MOUSE_D_CLICK'] = "MOUSE_KEY_DB_CLICK_EVENT",
    ['MOUSE_MOVE'] = "MOUSE_MOVE_EVENT",
    ['MOUSE_WHEEL'] = "ET_MOUSE_WHEEL_EVENT",
    ['MOUSE_DOWN_UNIT'] = "MOUSE_KEY_DOWN_UNIT_EVENT",
    ['MOUSE_UP_UNIT'] = "MOUSE_KEY_UP_UNIT_EVENT",
    ['MOUSE_D_CLICK_UNIT'] = "MOUSE_KEY_DB_CLICK_UNIT_EVENT",
    ['MOUSE_HOVER'] = "ET_MOUSE_HOVER_EVENT",
    ['SELECT_UNIT'] = "ET_SELECT_UNIT",
    ['SELECT_UNIT_GROUP'] = "ET_SELECT_UNIT_GROUP",
    ['SELECT_ITEM'] = "ET_SELECT_ITEM",
    ['D_CLICK_ITEM'] = "ET_DOUBLE_CLICK_ITEM",
    ['SELECT_DEST'] = "ET_SELECT_DEST",
    ['D_CLICK_DEST'] = "ET_DOUBLE_CLICK_DEST",
    ['PLAYER_JOIN'] = "ET_ROLE_JOIN_BATTLE",
    ['PLAYER_EXIT'] = "ET_ROLE_ACTIVE_EXIT_GAME_EVENT",
    ['PLAYER_LOSE_CONNECT'] = "ET_ROLE_LOSE_CONNECT",
    ['PLAYER_RESOURCE_CHANGED'] = "ET_ROLE_RESOURCE_CHANGED",
    ['PLAYER_SEND_STRING'] = "ET_ROLE_INPUT_MSG",
    ['PLAYER_SEND_ANY'] = "ET_CHAT_SEND_GM",
    ['PLAYER_UPGRADE_TECH'] = "ET_ROLE_TECH_UPGRADE",
    ['PLAYER_DOWNGRADE_TECH'] = "ET_ROLE_TECH_DOWNGRADE",
    ['PLAYER_CHANGE_TECH'] = "ET_ROLE_TECH_CHANGED",
}

---@enum y3.Const.UIEventType
M.UIEventType = {
    ['UI_CREATE'] = "ET_UI_PREFAB_CREATE_EVENT",
    ['UI_DELETE'] = "ET_UI_PREFAB_DEL_EVENT",
}

---@enum y3.Const.UnitEventType
M.UnitEventType = {
    ['BEFORE_UNIT_DIE'] = "ET_BEFORE_UNIT_DIE",
    ['UNIT_DIE'] = "ET_UNIT_DIE",
    ['KILL_UNIT'] = "ET_KILL_UNIT",
    ['UNIT_BORN'] = "ET_UNIT_BORN",
    ['REVIVE_UNIT'] = "ET_REVIVE_UNIT",
    ['UPGRADE_UNIT'] = "ET_UPGRADE_UNIT",
    ['UNIT_PRE_ADD_EXP'] = "ET_UNIT_PRE_ADD_EXP",
    ['UNIT_ON_ADD_EXP'] = "ET_UNIT_ON_ADD_EXP",
    ['UNIT_BE_HURT'] = "ET_UNIT_BE_HURT",
    ['UNIT_HURT_OTHER'] = "ET_UNIT_HURT_OTHER",
    ['UNIT_BE_HURT_BEFORE_APPLY'] = "ET_UNIT_BE_HURT_BEFORE_APPLY",
    ['UNIT_HURT_OTHER_BEFORE_APPLY'] = "ET_UNIT_HURT_OTHER_BEFORE_APPLY",
    ['UNIT_BE_HURT_COMPLETE'] = "ET_UNIT_BE_HURT_COMPLETE",
    ['UNIT_HURT_OTHER_COMPLETE'] = "ET_UNIT_HURT_OTHER_FINISH",
    ['UNIT_GET_CURE_BEFORE_APPLY'] = "ET_UNIT_GET_CURE_BEFORE_APPLY",
    ['UNIT_GET_CURE_FINISH'] = "ET_UNIT_GET_CURE_FINISH",
    ['UNIT_GET_CURE'] = "ET_UNIT_GET_CURE",
    ['UNIT_RELEASE_ABILITY'] = "ET_UNIT_RELEASE_ABILITY",
    ['UNIT_START_MOVE'] = "ET_UNIT_START_MOVE",
    ['UNIT_ENTER_BATTLE'] = "ET_UNIT_ENTER_BATTLE",
    ['UNIT_EXIT_BATTLE'] = "ET_UNIT_EXIT_BATTLE",
    ['UNIT_ENTER_GRASS'] = "ET_UNIT_ENTER_GRASS",
    ['UNIT_LEAVE_GRASS'] = "ET_UNIT_LEAVE_GRASS",
    ['UNIT_ON_COMMAND'] = "ET_UNIT_ON_COMMAND",
    ['UNIT_ABILITY_UPGRADE'] = "ET_ABILITY_PLUS_POINT",
    ['UNIT_REMOVE'] = "ET_UNIT_REMOVE",
    ['UNIT_SHOP_BUY_UNIT'] = "ET_UNIT_SHOP_BUY_UNIT",
    ['UNIT_SHOP_BUY_ITEM'] = "ET_UNIT_SHOP_BUY_ITEM",
    ['UNIT_ITEM_SELL'] = "ET_UNIT_ITEM_SELL",
    ['UNIT_ITEM_COMPOSE'] = "ET_UNIT_ITEM_COMPOSE",
    ['UNIT_SHOP_BUY_WITH_COMPOSE'] = "ET_UNIT_SHOP_BUY_WITH_COMPOSE",
    ['UNIT_UPGRADE_TECH'] = "ET_UNIT_UPGRADE_TECH",
    ['UNIT_ADD_TECH'] = "ET_UNIT_ADD_TECH",
    ['UNIT_REMOVE_TECH'] = "ET_UNIT_REMOVE_TECH",
    ['UNIT_ROLE_CHANGED'] = "ET_UNIT_ROLE_CHANGED",
}

---@enum y3.Const.ItemEventType
M.ItemEventType = {
    ['ITEM_CREATE'] = "ET_ITEM_ON_CREATE",
    ['ITEM_ADD'] = "ET_UNIT_ADD_ITEM",
    ['ITEM_ADD_TO_PKG'] = "ET_UNIT_ADD_ITEM_TO_PKG",
    ['ITEM_ADD_TO_BAR'] = 'ET_UNIT_ADD_ITEM_TO_BAR',
    ['ITEM_REMOVE'] = 'ET_UNIT_REMOVE_ITEM',
    ['ITEM_REMOVE_FROM_PKG'] = 'ET_UNIT_REMOVE_ITEM_FROM_PKG',
    ['ITEM_REMOVE_FROM_BAR'] = 'ET_UNIT_REMOVE_ITEM_FROM_BAR',
    ['ITEM_USE'] = 'ET_UNIT_USE_ITEM',
    ['ITEM_CHANGE_STACK'] = "ET_ITEM_STACK_CHANGED",
    ['ITEM_CHANGE_CHARGE'] = "ET_ITEM_CHARGE_CHANGED",
    ['ITEM_DESTROY'] = "ET_ITEM_ON_DESTROY",
    ['ITEM_CREATE_ON_DEST_COLLECTED'] = "ET_ITEM_CREATE_ON_DEST_COLLECTED",
}

---@enum y3.Const.AbilityEventType
M.AbilityEventType = {
    ['ABILITY_CS_START'] = "ET_ABILITY_CS_START",
    ['ABILITY_PS_START'] = "ET_ABILITY_PS_START",
    ['ABILITY_PS_END'] = "ET_ABILITY_PS_END",
    ['ABILITY_SP_END'] = "ET_ABILITY_SP_END",
    ['ABILITY_CST_END'] = "ET_ABILITY_CST_END",
    ['ABILITY_BS_END'] = "ET_ABILITY_BS_END",
    ['ABILITY_PS_INTERRUPT'] = "ET_ABILITY_PS_INTERRUPT",
    ['ABILITY_SP_INTERRUPT'] = "ET_ABILITY_SP_INTERRUPT",
    ['ABILITY_CST_INTERRUPT'] = "ET_ABILITY_CST_INTERRUPT",
    ['ABILITY_END'] = "ET_ABILITY_END",
    ['ABILITY_OBTAIN'] = "ET_ABILITY_OBTAIN",
    ['ABILITY_LOSE'] = "ET_ABILITY_LOSE",
    ['ABILITY_UPGRADE'] = "ET_ABILITY_PLUS_POINT",
    ['ABILITY_LEVEL_CHANGED'] = "ET_ABILITY_UPGRADE",
    ['ABILITY_CD_END'] = "ET_ABILITY_CD_END",
    ['ABILITY_SWITCH'] = "ET_ABILITY_SWITCH",
}

---@enum y3.Const.ModifierEventType
M.ModifierEventType = {
    ['OBTAIN_MODIFIER'] = "ET_OBTAIN_MODIFIER",
    ['LOSS_MODIFIER'] = "ET_LOSS_MODIFIER",
    ['MODIFIER_CYCLE_TRIGGER'] = "ET_MODIFIER_CYCLE_TRIGGER",
    ['MODIFIER_LAYER_CHANGE'] = "ET_MODIFIER_LAYER_CHANGE",
    ['MODIFIER_GET_BEFORE_CREATE'] = "ET_MODIFIER_GET_BEFORE_CREATE",
    ['MODIFIER_BE_COVERED'] = "ET_MODIFIER_BE_COVERED",
    ['MODIFIER_ADDTION'] = "ET_MODIFIER_ADDTION",
}

---@enum y3.Const.ProjectileEventType
M.ProjectileEventType = {
    ['PROJECTILE_PRODUCE'] = "ET_PRODUCE_PROJECTILE",
    ['PROJECTILE_END'] = "ET_DEATH_PROJECTILE",
}

---@enum y3.Const.PlatformEventType
M.PlatformEventType = {
    ['HOLD_STORE_ITEM'] = "ET_ROLE_HOLD_STORE_ITEM",
    ['USE_STORE_ITEM_END'] = "ET_ROLE_USE_STORE_ITEM_END",
}

---@enum y3.Const.DestructibleEventType
M.DestructibleEventType = {
    ['DEST_CREATE'] = "ET_DEST_CREATE_NEW",
    ['DEST_DIE'] = "ET_DEST_DIE_NEW",
    ['DEST_REVIVE'] = "ET_DEST_REVIVE_NEW",
    ['DEST_RES_CNT_CHG'] = "ET_DEST_RES_CNT_CHG_NEW",
    ['DEST_COLLECTED'] = "ET_DEST_COLLECTED_NEW",
    ['DEST_GET_HURT'] = "ET_GET_HURT_NEW",
    ['DEST_DELETE'] = "ET_DEST_DELETE",
}

---@alias y3.Const.UIEvent
---| '左键-按下'
---| '左键-抬起'
---| '左键-点击'
---| '左键-双击'
---| '鼠标-悬停'
---| '鼠标-移入'
---| '鼠标-移出'
---| '鼠标-右击'
---| '右键-按下'
---| '右键-抬起'
---| '右键-点击'
---| '右键-双击'

M.UIEventMap = {
    -- 旧
    ['空']       = -1,
    ['点击-开始'] = 1,
    ['点击-结束'] = 2,
    ['点击-持续'] = 3,
    ['鼠标-双击'] = 22,
    --['鼠标-悬停'] = 23,
    --['鼠标-移入'] = 24,
    --['鼠标-移出'] = 25,
    ['鼠标-右击'] = 26,
    -- 新
    ['左键-按下'] = 1,
    ['左键-抬起'] = 2,
    ['左键-按住'] = 3,
    ['左键-点击'] = 30,
    ['左键-双击'] = 22,
    ['鼠标-悬停'] = 23,
    ['鼠标-移入'] = 24,
    ['鼠标-移出'] = 25,
    ['右键-按下'] = 32,
    ['右键-抬起'] = 33,
    ['右键-按住'] = 34,
    ['右键-点击'] = 34,
    ['右键-双击'] = 35,
}

---@alias y3.Const.DamageTextType
---| 'get_gold' # 获取金币
---| 'heal'     # 治疗
---| 'magic'    # 法术
---| 'physics'  # 物理
---| 'real'     # 真实

---@alias y3.Const.UIComponentType
---| '物品'
---| '按钮'
---| '富文本'
---| '文本'
---| '图片'
---| '进度条'
---| '模型'
---| '空节点'
---| '标签页'
---| '设置'
---| '列表'
---| '滑动条'
---| '聊天'
---| '轮播图'
---| '语音开关'
---| '输入框'
---| '地图'
---| '技能按钮'
---| '魔法效果'
---| '序列帧'

M.UIComponentType = {
    Node = 0,
    Button = 1,
    ['按钮'] = 1,
    Layer = 2,
    TextLabel = 3,
    ['文本'] = 3,
    Image = 4,
    ['图片'] = 4,
    Progress = 5,
    ['进度条'] = 5,
    Model = 6,
    ['模型'] = 6,
    Layout = 7,
    ['空节点'] = 7,
    TabWidget = 8,
    ['标签页'] = 8,
    TabPage = 9,
    ScrollView = 10,
    ['列表'] = 10,
    Slider = 11,
    ['滑动条'] = 11,
    Background = 14,
    InputField = 15,
    ['输入框'] = 15,
    MiniMap = 16,
    ['地图'] = 16,
    SkillBtn = 17,
    ['技能按钮'] = 17,
    BuffList = 18,
    ['魔法效果'] = 18,
    BuffItem = 19,
    EquipSlot = 20,
    ['物品'] = 20,
    ShopPanel = 21,
    GoodsItem = 22,
    ComposePanel = 23,
    ChatBox = 24,
    GridView = 25,
    RichText = 26,
    ['富文本'] = 26,
    SettingPanel = 27,
    ['设置'] = 27,
    -- timeline工程动画
    AnimationEffect = 28,
    ComboBox = 29,
    ComboBoxItem = 30,
    -- 序列帧动画
    SequenceAnimation = 31,
    -- 新聊天
    NewChatBox = 32,
    ['聊天'] = 32,
    PageView = 33,
    ['轮播图'] = 33,
    AudioSwitch = 34,
    ['语音开关'] = 34,
    -- spine骨骼动画
    Spine = 35,
    -- 新的序列帧动画组件
    NewSequenceAnimation = 38,
    ['序列帧'] = 38,
}

---@alias y3.Const.UIVAlignmentType
---| '上'
---| '中'
---| '下'

M.UIVAlignmentType = {
    ['上'] = 0,
    ['中'] = 8,
    ['下'] = 16,
}

---@alias y3.Const.UIHAlignmentType
---| '左'
---| '中'
---| '右'

M.UIHAlignmentType = {
    ['左'] = 1,
    ['中'] = 2,
    ['右'] = 4,
}

---@alias y3.Const.CursorState
---| '常态悬浮'
---| '常态选取'
---| '常态禁用'
---| '敌方建筑单位悬浮'
---| '敌方非建筑单位悬浮'
---| '敌方建筑单位选取'
---| '敌方非建筑单位选取'
---| '己方建筑单位悬浮'
---| '己方非建筑单位悬浮'
---| '己方建筑单位选取'
---| '己方非建筑单位选取'
---| '友方建筑单位悬浮'
---| '友方非建筑单位悬浮'
---| '友方建筑单位选取'
---| '友方非建筑单位选取'

M.CursorState = {
    ['常态悬浮'] = 'nm_hover',
    ['常态选取'] = 'nm_selected',
    ['常态禁用'] = 'nm_disabled',
    ['敌方建筑单位悬浮'] = 'e_b_u_hover',
    ['敌方非建筑单位悬浮'] = 'e_nb_u_hover',
    ['敌方建筑单位选取'] = 'e_b_u_selected',
    ['敌方非建筑单位选取'] = 'e_nb_u_selected',
    ['己方建筑单位悬浮'] = 'o_b_u_hover',
    ['己方非建筑单位悬浮'] = 'o_nb_u_hover',
    ['己方建筑单位选取'] = 'o_b_u_selected',
    ['己方非建筑单位选取'] = 'o_nb_u_selected',
    ['友方建筑单位悬浮'] = 'f_b_u_hover',
    ['友方非建筑单位悬浮'] = 'f_nb_u_hover',
    ['友方建筑单位选取'] = 'f_b_u_selected',
    ['友方非建筑单位选取'] = 'f_nb_u_selected',
}

---@enum(key) y3.Const.HarmTextType
M.HarmTextType = {
    ['系统字体'] = 0,
    ['物理伤害'] = 1,
    ['物理暴击'] = 2,
    ['治疗'] = 3,
    ['魔法伤害'] = 4,
    ['魔法暴击'] = 5,
    ['真实伤害'] = 6,
    ['金币获取'] = 7,
    ['魔兽获取金币'] = 90,
    ['魔兽获取木材'] = 91,
    ['嘲讽'] = 113,
    ['沉默'] = 114,
    ['定身'] = 115,
    ['减速'] = 116,
    ['晕眩'] = 117,
    ['致盲'] = 118,
}

---@enum(key) y3.Const.FloatTextType
M.FloatTextType = {
    ['物理伤害'] = 'physics',
    ['魔法伤害'] = 'magic',
    ['真实伤害'] = 'real',
    ['治疗'] = 'heal',
    ['获取金币'] = 'get_gold',
    ['系统字体'] = 0,
    --
    ['微软雅黑'] = 'MSYH',
    ['华康黑体W9'] = 'HKHeiW9',
    ['华康黑体W12'] = 'HKHeiW12',
    ['华康标题宋W9'] = 'HKSongW9',
    ['华康魏碑W7'] = 'HKWeiBeiW7',
    ['华康新综艺体W7'] = 'HKXinZongYiW7',
    ['华康新综艺体W9'] = 'HKXinZongYiW9',
    ['华康圆体W5'] = 'HKYuanW5',
    ['华康圆体W7'] = 'HKYuanW7',
    ['华康圆体W9'] = 'HKYuanW9',
}

--TODO：应该解析文件
---@enum(key) y3.Const.FloatTextJumpType
M.FloatTextJumpType = {
    ['伤害_左上'] = 934231441,
    ['伤害_中上'] = 934269508,
    ['伤害_右上'] = 934266669,
    ['伤害_左下'] = 934252831,
    ['金币跳字'] = 934277693,
}

---@enum(key) y3.Const.UIAnimKey
M.UIAnimKey = {}

---@alias y3.Const.UIRelativeParentPosType
---| '顶部'
---| '底部'
---| '左侧'
---| '右侧'

M.UIRelativeParentPosType = {
    ["顶部"] = 0,
    ["底部"] = 1,
    ["左侧"] = 2,
    ["右侧"] = 3,
}

---@enum y3.Const.UIButtonStatus
M.UIButtonStatus = {
    ['常态'] = 1,
    ['悬浮'] = 2,
    ['按下'] = 3,
    ['禁用'] = 4,
}

---@enum (key) y3.Const.UIAttr
M.UIAttr = {
    ["文本"] = "text_bind",
    ["最大值"] = "max_value_bind",
    ["当前值"] = "current_value_bind",
}

---@enum(key) y3.Const.AbilityIntAttr
M.AbilityIntAttr = {
    ["最大等级"] = "ability_max_level",
    ["最大充能数"] = "ability_max_stack_count",
    ["当前等级"] = "ability_level",
    ["当前充能数"] = "cur_stack_count",
}

---@enum(key) y3.Const.AbilityStrAttr
M.AbilityStrAttr = {
    ["名称"] = "name",
    ["描述"] = "description",
}

---@enum(key) y3.Const.AbilityFloatAttr
M.AbilityFloatAttr = {
    ['技能消耗'] = 'ability_cost',
    ['生命值消耗'] = 'ability_hp_cost',
    ['冷却时间'] = 'cold_down_time',
    ['技能伤害值'] = 'ability_damage',
    ['释放范围'] = 'ability_cast_range',
    ['施法开始'] = 'ability_cast_point',
    ['施法完成'] = 'ability_bw_point',
    ['施法出手'] = 'ability_channel_time',
    ['施法引导'] = 'ability_prepare_time',
    ['技能影响范围'] = 'ability_damage_range',
    ['充能时间'] = 'ability_stack_cd',
}

---@enum(key) y3.Const.CollisionLayers
M.CollisionLayers = {
    ['地面'] = 1 << 5,
    ['空中'] = 1 << 6,
    ['水面'] = 1 << 7,
    ['物件'] = 1 << 8,
}

---@enum(key) y3.Const.SceneUI
M.SceneUI = {}

---@enum(key) y3.Const.PlatFormRoleCommunityType
M.PlatFormRoleCommunityType = {
    ['发帖累计获赞'] = 0,
    ['精华帖数量'] = 1,
    ['回复帖子的次数'] = 2,
    ['帖子收到的欢乐数'] = 3,
    ['是否在社区发过贴'] = 4,
    ['是否版主'] = 5,
    ['社区主题数量'] = 6,
}

return M
