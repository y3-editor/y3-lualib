
---@class y3.Const
local M = {}

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
    ['HERO'] = 1,
    ['BUILDING'] = 2,
    ['CREATURE'] = 4,
}

M.PatrolType = {
    ['ONE_WAY'] = 0,
    ['BACK_AND_FORTH'] = 1,
    ['LOOP'] = 2,
}

M.UnitState = {
    ['ALIVE'] = 'Alive',
    ['DEAD'] = 'Dead',
    ['DISSOLVE'] = 'Dissolve',
}

M.UnitKeyFloatAttr = {
    ['ROTATE_SPEED'] = 'rotate_speed',
    ['CANCEL_ALARM_RANGE'] = 'cancel_alarm_range',
    ['ALARM_RANGE'] = 'alarm_range',
    ['BODY_SIZE'] = 'body_size',
    ['CD_REDUCE'] = 'cd_reduce',
    ['VISION_RNG'] = 'vision_rng',
    ['HP_MAX'] = 'hp_max',
    ['HP_REC'] = 'hp_rec',
    ['MP_MAX'] = 'mp_max',
    ['MP_REC'] = 'mp_rec',
    ['ORI_SPEED'] = 'ori_speed',
    ['ATTACK_PHY'] = 'attack_phy',
    ['ATTACK_MAG'] = 'attack_mag',
    ['DEFENSE_PHY'] = 'defense_phy',
    ['DEFENSE_MAG'] = 'defense_mag',
    ['ATTACK_SPEED'] = 'attack_speed',
    ['CRITICAL_CHANCE'] = 'critical_chance',
    ['CRITICAL_DMG'] = 'critical_dmg',
    ['PENE_PHY'] = 'pene_phy',
    ['PENE_MAG'] = 'pene_mag',
    ['VAMPIRE_PHY'] = 'vampire_phy',
    ['VAMPIRE_MAG'] = 'vampire_mag',
    ['PENE_PHY_RATIO'] = 'pene_phy_ratio',
    ['PENE_MAG_RATIO'] = 'pene_mag_ratio',
    ['DMG_REDUCTION'] = 'dmg_reduction',
    ['HIT_RATE'] = 'hit_rate',
    ['DODGE_RATE'] = 'dodge_rate',
}

M.ModifyType = {
    ['ADD'] = 0,
    ['SUB'] = 1,
    ['SET'] = 2,
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
    ['PHY'] = 0,
    ['MAG'] = 1,
    ['REAL'] = 2,
}

M.AbilityCategory = {
    ['COMMON_ATK'] = 1,
    ['COMMON_ABILITY'] = 2,
    ['HERO_ABILITY'] = 3,
    ['PASSIVE_ABILITY'] = 0,
}

---@enum y3.Const.AbilityType
M.AbilityType = {
   HIDE   = 0,
   NORMAL = 1,
   COMMON = 2,
   HERO   = 3,
}

M.AbilityCastType = {
    ['COMMON_ATK'] = 1,
    ['ACTIVE_ABILITY'] = 2,
    ['PASSIVE_ABILITY'] = 3,
    ['BUILDING_ABILITY'] = 4,
    ['PICK_ABILITY'] = 6,
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
    ['USER'] = 1,
    ['COMPUTER'] = 2,
    ['AI_EASY'] = 5,
    ['AI_HARD'] = 6,
    ['OBSERVER'] = 10,
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
    ['LEFT'] = 0xF0,
    ['RIGHT'] = 0xF1,
    ['MIDDLE'] = 0xF2,
    ['WHEEL_UP'] = 0xF3,
    ['WHEEL_DOWN'] = 0xF4,
}

---@enum y3.Const.KeyboardKey
M.KeyboardKey = {
    ['NONE'] = 0x00,
    ['ESCAPE'] = 0x01,
    ['KEY_1'] = 0x02,
    ['KEY_2'] = 0x03,
    ['KEY_3'] = 0x04,
    ['KEY_4'] = 0x05,
    ['KEY_5'] = 0x06,
    ['KEY_6'] = 0x07,
    ['KEY_7'] = 0x08,
    ['KEY_8'] = 0x09,
    ['KEY_9'] = 0x0A,
    ['KEY_0'] = 0x0B,
    ['MINUS'] = 0x0C,
    ['EQUAL'] = 0x0D,
    ['BACKSPACE'] = 0x0E,
    ['TAB'] = 0x0F,
    ['Q'] = 0x10,
    ['W'] = 0x11,
    ['E'] = 0x12,
    ['R'] = 0x13,
    ['T'] = 0x14,
    ['Y'] = 0x15,
    ['U'] = 0x16,
    ['I'] = 0x17,
    ['O'] = 0x18,
    ['P'] = 0x19,
    ['LBRACKET'] = 0x1A,
    ['RBRACKET'] = 0x1B,
    ['RETURN'] = 0x1C,
    ['LCTRL'] = 0x1D,
    ['A'] = 0x1E,
    ['S'] = 0x1F,
    ['D'] = 0x20,
    ['F'] = 0x21,
    ['G'] = 0x22,
    ['H'] = 0x23,
    ['J'] = 0x24,
    ['K'] = 0x25,
    ['L'] = 0x26,
    ['SEMICOLON'] = 0x27,
    ['APOSTROPHE'] = 0x28,
    ['GRAVE'] = 0x29,
    ['LSHIFT'] = 0x2A,
    ['BACKSLASH'] = 0x2B,
    ['Z'] = 0x2C,
    ['X'] = 0x2D,
    ['C'] = 0x2E,
    ['V'] = 0x2F,
    ['B'] = 0x30,
    ['N'] = 0x31,
    ['M'] = 0x32,
    ['COMMA'] = 0x33,
    ['PERIOD'] = 0x34,
    ['SLASH'] = 0x35,
    ['RSHIFT'] = 0x36,
    ['NUM_STAR'] = 0x37,
    ['LALT'] = 0x38,
    ['SPACE'] = 0x39,
    ['CAPSLOCK'] = 0x3A,
    ['F1'] = 0x3B,
    ['F2'] = 0x3C,
    ['F3'] = 0x3D,
    ['F4'] = 0x3E,
    ['F5'] = 0x3F,
    ['F6'] = 0x40,
    ['F7'] = 0x41,
    ['F8'] = 0x42,
    ['F9'] = 0x43,
    ['F10'] = 0x44,
    ['PAUSE'] = 0x45,
    ['SCROLL_LOCK'] = 0x46,
    ['NUM_7'] = 0x47,
    ['NUM_8'] = 0x48,
    ['NUM_9'] = 0x49,
    ['NUM_MINUS'] = 0x4A,
    ['NUM_4'] = 0x4B,
    ['NUM_5'] = 0x4C,
    ['NUM_6'] = 0x4D,
    ['NUM_ADD'] = 0x4E,
    ['NUM_1'] = 0x4F,
    ['NUM_2'] = 0x50,
    ['NUM_3'] = 0x51,
    ['NUM_0'] = 0x52,
    ['NUM_PERIOD'] = 0x53,
    ['F11'] = 0x57,
    ['F12'] = 0x58,
    ['NUM_ENTER'] = 0x9C,
    ['RCTRL'] = 0x9D,
    ['NUM_COMMA'] = 0xB3,
    ['NUM_SLASH'] = 0xB5,
    ['SYSRQ'] = 0xB7,
    ['R_ALT'] = 0xB8,
    ['NUM_LOCK'] = 0xC5,
    ['HOME'] = 0xC7,
    ['UPARROW'] = 0xC8,
    ['PAGEUP'] = 0xC9,
    ['LEFTARROW'] = 0xCB,
    ['RIGHTARROW'] = 0xCD,
    ['END'] = 0xCF,
    ['DOWNARROW'] = 0xD0,
    ['PAGEDOWN'] = 0xD1,
    ['INSERT'] = 0xD2,
    ['DELETE'] = 0xD3,
    ['LWIN'] = 0xDB,
    ['RWIN'] = 0xDC,
    ['APPS'] = 0xDD,
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

M.SfxVisibleType = {
    ['ALL'] = 1,
    ['SELF'] = 2,
    ['ALLY'] = 3,
    ['ENEMY'] = 4,
}

---@enum y3.Const.LinkSfxPointType
M.LinkSfxPointType = {
    ['START'] = 1,
    ['END'] = 2,
}

M.SfxRotateType = {
    ['FOLLOW_SOCKET'] = 0,
    ['FOLLOW_MODEL'] = 1,
    ['NOT_FOLLOW'] = 2,
}

---@enum y3.Const.SlotType
M.SlotType = {
    ['PKG'] = 0,
    ['BAR'] = 1,
}

---@enum y3.Const.EffectType
M.ModifierEffectType = {
    ['NORMAL'] = 1,
    ['POSITIVE'] = 2,
    ['NEGATIVE'] = 3,
}

---@enum y3.Const.ModifierType
M.ModifierType = {
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

M.CameraMoveMode = {
    ['ACC'] = 1,
    ['SMOOTH'] = 0,
    ['DEC'] = 2,
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

M.SignalType = {
    ['WARNING_COMMON'] = 1,
    ['WARNING_YELLOW'] = 2,
    ['WARNING_BLUE'] = 3,
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
---| '空'
---| '点击-开始'
---| '点击-结束'
---| '鼠标-双击'
---| '鼠标-悬停'
---| '鼠标-移入'
---| '鼠标-移出'
---| '鼠标-右击'

M.UIEventMap = {
    ['空']       = -1,
    ['点击-开始'] = 1,
    ['点击-结束'] = 2,
    ['点击-持续'] = 3,
    ['鼠标-双击'] = 22,
    ['鼠标-悬停'] = 23,
    ['鼠标-移入'] = 24,
    ['鼠标-移出'] = 25,
    ['鼠标-右击'] = 26,
}

---@alias y3.Const.DamageTextType
---| 'get_gold' # 获取金币
---| 'heal'     # 治疗
---| 'magic'    # 法术
---| 'physics'  # 物理
---| 'real'     # 真实

return M
