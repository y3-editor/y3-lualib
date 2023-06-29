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
}

return enum
