-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class Enum
local enum = {}

--None
---@enum Enum.SfxVisibleType
enum.SfxVisibleType = {
    ALL = 1,
    SELF = 2,
    SELF_AND_FRIEND = 3,
    NOT_SELF_AND_FRIEND = 4,
}

--None
---@enum Enum.UnitCommandTypeEnum
enum.UnitCommandTypeEnum = {
    MOVE_TO_POS = 1,
    ATTACK_MOVE = 2,
    ATTACK_TARGET = 3,
    PATROL = 4,
    STOP = 5,
    HOLD = 6,
    USE_SKILL = 7,
    PICK_ITEM = 8,
    DROP_ITEM = 9,
    TRANSFER_ITEM = 10,
    FOLLOW_TARGET = 11,
    MOVE_ALONG_ROAD = 12,
    USE_ITEM = 13,
    EMPTY = 14,
    AUTO_PICK = 15,
    MOVE_TO_POS_3D = 16,
    HOLD_3D = 17,
    ATTACK_POINT = 18,
    USE_ITEM_ON_TARGET = 19,
}

--None
---@enum Enum.UnitGroupCommandTypeEnum
enum.UnitGroupCommandTypeEnum = {
    MOVE_TO_POS = 1,
    ATTACK_MOVE = 2,
    ATTACK_TARGET = 3,
    PATROL = 4,
    STOP = 5,
    HOLD = 6,
    FOLLOW_TARGET = 11,
    MOVE_ALONG_ROAD = 12,
    EMPTY = 14,
    MOVE_TO_RANDOM_POS = 15,
    ATTACK_MOVE_RANDOM_POS = 16,
    ATTACK_POINT = 18,
    USE_ITEM_ON_TARGET = 19,
}

return enum
