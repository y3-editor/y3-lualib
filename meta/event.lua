-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.Event
local event = {}

---@class EventParam.ET_TIMEOUT

event.ET_TIMEOUT = {}

---@class EventParam.ET_REPEAT_TIMEOUT

event.ET_REPEAT_TIMEOUT = {}

---@class EventParam.ET_REPEAT_TIMEOUT_BY_FRAME

event.ET_REPEAT_TIMEOUT_BY_FRAME = {}

---@class EventParam.ET_GAME_INIT

event.ET_GAME_INIT = {}

---@class EventParam.ET_GAME_PAUSE

event.ET_GAME_PAUSE = {}

---@class EventParam.ET_GAME_RESUME

event.ET_GAME_RESUME = {}

---@class EventParam.ET_AREA_ENTER

event.ET_AREA_ENTER = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
    [2] = {
        name = "__area_id",
        type = "py.AreaID",
        lua_name = "area",
        lua_type = "Area",
        desc = "区域ID",
        lua_desc = "区域",
    },
    [3] = {
        name = "__trigger_id",
        type = "py.TriggerID",
        lua_name = "trigger_id",
        lua_type = "py.TriggerID",
        desc = "触发器ID",
        lua_desc = "触发器ID",
    },
}

---@class EventParam.ET_AREA_LEAVE

event.ET_AREA_LEAVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
    [2] = {
        name = "__area_id",
        type = "py.AreaID",
        lua_name = "area",
        lua_type = "Area",
        desc = "区域ID",
        lua_desc = "区域",
    },
    [3] = {
        name = "__trigger_id",
        type = "py.TriggerID",
        lua_name = "trigger_id",
        lua_type = "py.TriggerID",
        desc = "触发器ID",
        lua_desc = "触发器ID",
    },
}

---@class EventParam.ET_ROLE_JOIN_BATTLE

event.ET_ROLE_JOIN_BATTLE = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__is_middle_join",
        type = "boolean",
        lua_name = "is_middle_join",
        lua_type = "boolean",
        desc = "是否中途加入",
        lua_desc = "是否中途加入",
    },
}

---@class EventParam.ET_ROLE_ACTIVE_EXIT_GAME_EVENT

event.ET_ROLE_ACTIVE_EXIT_GAME_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_ROLE_LOSE_CONNECT

event.ET_ROLE_LOSE_CONNECT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_ROLE_USE_STORE_ITEM_END

event.ET_ROLE_USE_STORE_ITEM_END = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__store_key",
        type = "py.StoreKey",
        lua_name = "store_key",
        lua_type = "py.StoreKey",
        desc = "收费道具编号",
        lua_desc = "收费道具编号",
    },
    [3] = {
        name = "__use_cnt",
        type = "integer",
        lua_name = "use_cnt",
        lua_type = "integer",
        desc = "使用次数",
        lua_desc = "使用次数",
    },
}

---@class EventParam.ET_ROLE_HOLD_STORE_ITEM

event.ET_ROLE_HOLD_STORE_ITEM = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__store_key",
        type = "py.StoreKey",
        lua_name = "store_key",
        lua_type = "py.StoreKey",
        desc = "收费道具编号",
        lua_desc = "收费道具编号",
    },
}

---@class EventParam.ET_ROLE_RESOURCE_CHANGED

event.ET_ROLE_RESOURCE_CHANGED = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__res_key",
        type = "py.RoleResKey",
        lua_name = "res_key",
        lua_type = "py.RoleResKey",
        desc = "玩家资源类型",
        lua_desc = "玩家资源类型",
    },
    [3] = {
        name = "__res_value",
        type = "integer",
        lua_name = "res_value",
        lua_type = "integer",
        desc = "玩家资源值",
        lua_desc = "玩家资源值",
    },
    [4] = {
        name = "__res_value_delta",
        type = "py.Fixed",
        lua_name = "res_value_delta",
        lua_type = "py.Fixed",
        desc = "玩家资源变量值",
        lua_desc = "玩家资源变量值",
    },
}

---@class EventParam.ET_ROLE_INPUT_MSG

event.ET_ROLE_INPUT_MSG = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__msg",
        type = "string",
        lua_name = "msg",
        lua_type = "string",
        desc = "字符串",
        lua_desc = "字符串",
    },
}

---@class EventParam.ET_ROLE_TECH_UPGRADE

event.ET_ROLE_TECH_UPGRADE = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技编号",
        lua_desc = "科技编号",
    },
    [3] = {
        name = "__curr_lv",
        type = "integer",
        lua_name = "curr_lv",
        lua_type = "integer",
        desc = "当前科技等级",
        lua_desc = "当前科技等级",
    },
}

---@class EventParam.ET_ROLE_TECH_DOWNGRADE

event.ET_ROLE_TECH_DOWNGRADE = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技编号",
        lua_desc = "科技编号",
    },
    [3] = {
        name = "__curr_lv",
        type = "integer",
        lua_name = "curr_lv",
        lua_type = "integer",
        desc = "当前科技等级",
        lua_desc = "当前科技等级",
    },
}

---@class EventParam.ET_ROLE_TECH_CHANGED

event.ET_ROLE_TECH_CHANGED = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技编号",
        lua_desc = "科技编号",
    },
    [3] = {
        name = "__curr_lv",
        type = "integer",
        lua_name = "curr_lv",
        lua_type = "integer",
        desc = "当前科技等级",
        lua_desc = "当前科技等级",
    },
    [4] = {
        name = "__delta_lv",
        type = "integer",
        lua_name = "delta_lv",
        lua_type = "integer",
        desc = "科技变化等级",
        lua_desc = "科技变化等级",
    },
}

---@class EventParam.ET_UNIT_UPGRADE_TECH

event.ET_UNIT_UPGRADE_TECH = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "单位所属玩家ID",
        lua_desc = "单位所属玩家",
    },
    [3] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技编号",
        lua_desc = "科技编号",
    },
}

---@class EventParam.ET_UNIT_ADD_TECH

event.ET_UNIT_ADD_TECH = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "单位所属玩家ID",
        lua_desc = "单位所属玩家",
    },
    [3] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技编号",
        lua_desc = "科技编号",
    },
}

---@class EventParam.ET_UNIT_REMOVE_TECH

event.ET_UNIT_REMOVE_TECH = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "单位所属玩家ID",
        lua_desc = "单位所属玩家",
    },
    [3] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技编号",
        lua_desc = "科技编号",
    },
}

---@class EventParam.ET_ABILITY_BUILD_FINISH

event.ET_ABILITY_BUILD_FINISH = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能",
        lua_desc = "技能",
    },
    [2] = {
        name = "__ability_type",
        type = "py.AbilityType",
        lua_name = "ability_type",
        lua_type = "py.AbilityType",
        desc = "技能类型",
        lua_desc = "技能类型",
    },
    [3] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能ID",
        lua_desc = "技能ID",
    },
    [4] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
    [5] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "主人",
        lua_desc = "主人",
    },
    [6] = {
        name = "__build_unit_id",
        type = "py.UnitID",
        lua_name = "build_unit",
        lua_type = "Unit",
        desc = "建造出来的单位ID",
        lua_desc = "建造出来的单位",
    },
}

---@class EventParam.ET_ABILITY_PLUS_POINT

event.ET_ABILITY_PLUS_POINT = {
    [1] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能坑位",
        lua_desc = "技能坑位",
    },
    [2] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [3] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_START_MOVE

event.ET_UNIT_START_MOVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_REMOVE

event.ET_UNIT_REMOVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_ATTR_CHANGE

event.ET_UNIT_ATTR_CHANGE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
    [2] = {
        name = "__attr",
        type = "string",
        lua_name = "attr",
        lua_type = "string",
        desc = "字符串",
        lua_desc = "字符串",
    },
}

---@class EventParam.ET_BEFORE_UNIT_DIE

event.ET_BEFORE_UNIT_DIE = {
    [1] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [2] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [5] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [6] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_DIE

event.ET_UNIT_DIE = {
    [1] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [2] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [5] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [6] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_BE_HURT

event.ET_UNIT_BE_HURT = {
    [1] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [2] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [5] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [6] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER

event.ET_UNIT_HURT_OTHER = {
    [1] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [2] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [5] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [6] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_BE_HURT_BEFORE_APPLY

event.ET_UNIT_BE_HURT_BEFORE_APPLY = {
    [1] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [2] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [5] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [6] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER_BEFORE_APPLY

event.ET_UNIT_HURT_OTHER_BEFORE_APPLY = {
    [1] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [2] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [5] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [6] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER_FINISH

event.ET_UNIT_HURT_OTHER_FINISH = {
    [1] = {
        name = "__is_critical_hit",
        type = "py.Fixed",
        lua_name = "is_critical_hit",
        lua_type = "py.Fixed",
        desc = "是否是暴击",
        lua_desc = "是否是暴击",
    },
    [2] = {
        name = "__is_normal_hit",
        type = "boolean",
        lua_name = "is_normal_hit",
        lua_type = "boolean",
        desc = "是否是普通攻击",
        lua_desc = "是否是普通攻击",
    },
    [3] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [4] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [5] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [6] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [7] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [8] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_BE_HURT_COMPLETE

event.ET_UNIT_BE_HURT_COMPLETE = {
    [1] = {
        name = "__is_critical_hit",
        type = "py.Fixed",
        lua_name = "is_critical_hit",
        lua_type = "py.Fixed",
        desc = "是否是暴击",
        lua_desc = "是否是暴击",
    },
    [2] = {
        name = "__is_normal_hit",
        type = "boolean",
        lua_name = "is_normal_hit",
        lua_type = "boolean",
        desc = "是否是普通攻击",
        lua_desc = "是否是普通攻击",
    },
    [3] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "受到的伤害值",
        lua_desc = "受到的伤害值",
    },
    [4] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "施加伤害的单位",
        lua_desc = "施加伤害的单位",
    },
    [5] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "承受伤害的单位",
        lua_desc = "承受伤害的单位",
    },
    [6] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前伤害所属技能",
        lua_desc = "当前伤害所属技能",
    },
    [7] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "伤害类型",
        lua_desc = "伤害类型",
    },
    [8] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_GET_CURE_BEFORE_APPLY

event.ET_UNIT_GET_CURE_BEFORE_APPLY = {
    [1] = {
        name = "__cured_value",
        type = "py.Fixed",
        lua_name = "cured_value",
        lua_type = "py.Fixed",
        desc = "受到的治疗值",
        lua_desc = "受到的治疗值",
    },
    [2] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前治疗所属技能",
        lua_desc = "当前治疗所属技能",
    },
}

---@class EventParam.ET_UNIT_GET_CURE_FINISH

event.ET_UNIT_GET_CURE_FINISH = {
    [1] = {
        name = "__cured_value",
        type = "py.Fixed",
        lua_name = "cured_value",
        lua_type = "py.Fixed",
        desc = "受到的治疗值",
        lua_desc = "受到的治疗值",
    },
    [2] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前治疗所属技能",
        lua_desc = "当前治疗所属技能",
    },
}

---@class EventParam.ET_UNIT_GET_CURE

event.ET_UNIT_GET_CURE = {
    [1] = {
        name = "__cured_value",
        type = "py.Fixed",
        lua_name = "cured_value",
        lua_type = "py.Fixed",
        desc = "受到的治疗值",
        lua_desc = "受到的治疗值",
    },
    [2] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "当前治疗所属技能",
        lua_desc = "当前治疗所属技能",
    },
}

---@class EventParam.ET_UNIT_RELEASE_ABILITY

event.ET_UNIT_RELEASE_ABILITY = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "施放的技能对象",
        lua_desc = "施放的技能对象",
    },
    [2] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "触发事件的单位unit_id",
        lua_desc = "触发事件的单位unit_",
    },
    [3] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能的目标单位ID",
        lua_desc = "技能的目标单位",
    },
}

---@class EventParam.ET_UNIT_PRE_ADD_EXP

event.ET_UNIT_PRE_ADD_EXP = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "获得经验的单位",
        lua_desc = "获得经验的单位",
    },
    [2] = {
        name = "__add_exp",
        type = "number",
        lua_name = "add_exp",
        lua_type = "number",
        desc = "增加的经验",
        lua_desc = "增加的经验",
    },
}

---@class EventParam.ET_UNIT_ON_ADD_EXP

event.ET_UNIT_ON_ADD_EXP = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "获得经验的单位",
        lua_desc = "获得经验的单位",
    },
    [2] = {
        name = "__add_exp",
        type = "number",
        lua_name = "add_exp",
        lua_type = "number",
        desc = "增加的经验",
        lua_desc = "增加的经验",
    },
}

---@class EventParam.ET_UNIT_ON_COMMAND

event.ET_UNIT_ON_COMMAND = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位",
        lua_desc = "单位",
    },
    [2] = {
        name = "__cmd_type",
        type = "py.UnitCommand",
        lua_name = "cmd_type",
        lua_type = "py.UnitCommand",
        desc = "接收的命令",
        lua_desc = "接收的命令",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "目标单位",
        lua_desc = "目标单位",
    },
    [4] = {
        name = "__point",
        type = "py.Point",
        lua_name = "point",
        lua_type = "Point",
        desc = "目标点",
        lua_desc = "目标点",
    },
    [5] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "目标可破坏物ID",
        lua_desc = "目标可破坏物",
    },
    [6] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "目标物品ID",
        lua_desc = "目标物品",
    },
}

---@class EventParam.ET_KILL_UNIT

event.ET_KILL_UNIT = {
    [1] = {
        name = "__damage",
        type = "py.Fixed",
        lua_name = "damage",
        lua_type = "py.Fixed",
        desc = "伤害值",
        lua_desc = "伤害值",
    },
    [2] = {
        name = "__source_unit",
        type = "py.Unit",
        lua_name = "source_unit",
        lua_type = "Unit",
        desc = "杀手单位",
        lua_desc = "杀手单位",
    },
    [3] = {
        name = "__target_unit",
        type = "py.Unit",
        lua_name = "target_unit",
        lua_type = "Unit",
        desc = "死亡单位",
        lua_desc = "死亡单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "致命伤害所属技能",
        lua_desc = "致命伤害所属技能",
    },
    [5] = {
        name = "__damage_type",
        type = "integer",
        lua_name = "damage_type",
        lua_type = "integer",
        desc = "致命伤害类型",
        lua_desc = "致命伤害类型",
    },
    [6] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_BORN

event.ET_UNIT_BORN = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_ENTER_BATTLE

event.ET_UNIT_ENTER_BATTLE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_EXIT_BATTLE

event.ET_UNIT_EXIT_BATTLE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_SHOP_BUY_ITEM

event.ET_UNIT_SHOP_BUY_ITEM = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "购买物品单位id",
        lua_desc = "购买物品单位",
    },
    [2] = {
        name = "__shop_unit_id",
        type = "py.UnitID",
        lua_name = "shop_unit",
        lua_type = "Unit",
        desc = "商店单位id",
        lua_desc = "商店单位",
    },
    [3] = {
        name = "__tab_idx",
        type = "integer",
        lua_name = "tab_idx",
        lua_type = "integer",
        desc = "商店分页",
        lua_desc = "商店分页",
    },
    [4] = {
        name = "__cnt",
        type = "integer",
        lua_name = "cnt",
        lua_type = "integer",
        desc = "商品数量",
        lua_desc = "商品数量",
    },
    [5] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "商品物品id",
        lua_desc = "商品物品",
    },
}

---@class EventParam.ET_UNIT_SHOP_BUY_UNIT

event.ET_UNIT_SHOP_BUY_UNIT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "购买物品单位id",
        lua_desc = "购买物品单位",
    },
    [2] = {
        name = "__shop_unit_id",
        type = "py.UnitID",
        lua_name = "shop_unit",
        lua_type = "Unit",
        desc = "商店单位id",
        lua_desc = "商店单位",
    },
    [3] = {
        name = "__tab_idx",
        type = "integer",
        lua_name = "tab_idx",
        lua_type = "integer",
        desc = "商店分页",
        lua_desc = "商店分页",
    },
    [4] = {
        name = "__cnt",
        type = "integer",
        lua_name = "cnt",
        lua_type = "integer",
        desc = "商品数量",
        lua_desc = "商品数量",
    },
    [5] = {
        name = "__unit_stuff_id",
        type = "py.UnitID",
        lua_name = "unit_stuff",
        lua_type = "Unit",
        desc = "商品单位id",
        lua_desc = "商品单位",
    },
}

---@class EventParam.ET_UNIT_ITEM_SELL

event.ET_UNIT_ITEM_SELL = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "购买物品单位id",
        lua_desc = "购买物品单位",
    },
    [2] = {
        name = "__shop_unit_id",
        type = "py.UnitID",
        lua_name = "shop_unit",
        lua_type = "Unit",
        desc = "商店单位id",
        lua_desc = "商店单位",
    },
    [3] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "道具id",
        lua_desc = "道具",
    },
}

---@class EventParam.ET_UNIT_ITEM_COMPOSE

event.ET_UNIT_ITEM_COMPOSE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
    [2] = {
        name = "__compose_id",
        type = "py.ItemKey",
        lua_name = "compose_id",
        lua_type = "py.ItemKey",
        desc = "道具编号",
        lua_desc = "道具编号",
    },
    [3] = {
        name = "__item_prop_id",
        type = "py.ItemID",
        lua_name = "item_prop",
        lua_type = "Item",
        desc = "道具id",
        lua_desc = "道具",
    },
}

---@class EventParam.ET_UNIT_SHOP_BUY_WITH_COMPOSE

event.ET_UNIT_SHOP_BUY_WITH_COMPOSE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "购买物品单位id",
        lua_desc = "购买物品单位",
    },
    [2] = {
        name = "__shop_unit_id",
        type = "py.UnitID",
        lua_name = "shop_unit",
        lua_type = "Unit",
        desc = "商店单位id",
        lua_desc = "商店单位",
    },
    [3] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "物品编号",
        lua_desc = "物品编号",
    },
}

---@class EventParam.ET_REVIVE_UNIT

event.ET_REVIVE_UNIT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UPGRADE_UNIT

event.ET_UPGRADE_UNIT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_ENTER_GRASS

event.ET_UNIT_ENTER_GRASS = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_LEAVE_GRASS

event.ET_UNIT_LEAVE_GRASS = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_ROLE_CHANGED

event.ET_UNIT_ROLE_CHANGED = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "触发事件的单位",
        lua_desc = "触发事件的单位",
    },
    [2] = {
        name = "__old_role_id",
        type = "py.RoleID",
        lua_name = "old_player",
        lua_type = "Player",
        desc = "单位原所属玩家",
        lua_desc = "单位原所属玩家",
    },
    [3] = {
        name = "__new_role_id",
        type = "py.RoleID",
        lua_name = "new_player",
        lua_type = "Player",
        desc = "单位新所属玩家",
        lua_desc = "单位新所属玩家",
    },
}

---@class EventParam.ET_UNIT_PRECONDITION_SUCCEED

event.ET_UNIT_PRECONDITION_SUCCEED = {
    [1] = {
        name = "unit_key",
        type = "py.UnitKey",
        lua_name = "unit_key",
        lua_type = "py.UnitKey",
        desc = "单位类型",
        lua_desc = "单位类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_UNIT_PRECONDITION_FAILED

event.ET_UNIT_PRECONDITION_FAILED = {
    [1] = {
        name = "unit_key",
        type = "py.UnitKey",
        lua_name = "unit_key",
        lua_type = "py.UnitKey",
        desc = "单位类型",
        lua_desc = "单位类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_ITEM_PRECONDITION_SUCCEED

event.ET_ITEM_PRECONDITION_SUCCEED = {
    [1] = {
        name = "__item_no",
        type = "py.ItemKey",
        lua_name = "item_no",
        lua_type = "py.ItemKey",
        desc = "物品类型",
        lua_desc = "物品类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_ITEM_PRECONDITION_FAILED

event.ET_ITEM_PRECONDITION_FAILED = {
    [1] = {
        name = "__item_no",
        type = "py.ItemKey",
        lua_name = "item_no",
        lua_type = "py.ItemKey",
        desc = "物品类型",
        lua_desc = "物品类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_ABILITY_PRECONDITION_SUCCEED

event.ET_ABILITY_PRECONDITION_SUCCEED = {
    [1] = {
        name = "__ability_id",
        type = "py.AbilityKey",
        lua_name = "ability_id",
        lua_type = "py.AbilityKey",
        desc = "技能类型",
        lua_desc = "技能类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_ABILITY_PRECONDITION_FAILED

event.ET_ABILITY_PRECONDITION_FAILED = {
    [1] = {
        name = "__ability_id",
        type = "py.AbilityKey",
        lua_name = "ability_id",
        lua_type = "py.AbilityKey",
        desc = "技能类型",
        lua_desc = "技能类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_TECH_PRECONDITION_SUCCEED

event.ET_TECH_PRECONDITION_SUCCEED = {
    [1] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技类型",
        lua_desc = "科技类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_TECH_PRECONDITION_FAILED

event.ET_TECH_PRECONDITION_FAILED = {
    [1] = {
        name = "__tech_no",
        type = "py.TechKey",
        lua_name = "tech_no",
        lua_type = "py.TechKey",
        desc = "科技类型",
        lua_desc = "科技类型",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_ABILITY_UPGRADE

event.ET_ABILITY_UPGRADE = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
}

---@class EventParam.ET_ABILITY_CS_START

event.ET_ABILITY_CS_START = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_PS_START

event.ET_ABILITY_PS_START = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_PS_END

event.ET_ABILITY_PS_END = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_SP_END

event.ET_ABILITY_SP_END = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_CST_END

event.ET_ABILITY_CST_END = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_BS_END

event.ET_ABILITY_BS_END = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_PS_INTERRUPT

event.ET_ABILITY_PS_INTERRUPT = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_SP_INTERRUPT

event.ET_ABILITY_SP_INTERRUPT = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_CST_INTERRUPT

event.ET_ABILITY_CST_INTERRUPT = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_END

event.ET_ABILITY_END = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__ability_target_unit_id",
        type = "py.UnitID",
        lua_name = "ability_target_unit",
        lua_type = "Unit",
        desc = "技能目标单位ID",
        lua_desc = "技能目标单位",
    },
}

---@class EventParam.ET_ABILITY_OBTAIN

event.ET_ABILITY_OBTAIN = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_ABILITY_LOSE

event.ET_ABILITY_LOSE = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
    [2] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_ABILITY_SWITCH

event.ET_ABILITY_SWITCH = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
}

---@class EventParam.ET_ABILITY_CD_END

event.ET_ABILITY_CD_END = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
}

---@class EventParam.ET_OBTAIN_MODIFIER

event.ET_OBTAIN_MODIFIER = {
    [1] = {
        name = "__modifier",
        type = "py.ModifierEntity",
        lua_name = "modifier",
        lua_type = "Buff",
        desc = "触发的魔法效果",
        lua_desc = "触发的魔法效果",
    },
    [2] = {
        name = "__owner_unit",
        type = "py.Unit",
        lua_name = "owner_unit",
        lua_type = "Unit",
        desc = "效果携带者",
        lua_desc = "效果携带者",
    },
    [3] = {
        name = "__from_unit_id",
        type = "py.Unit",
        lua_name = "from_unit",
        lua_type = "Unit",
        desc = "效果施加者",
        lua_desc = "效果施加者",
    },
}

---@class EventParam.ET_LOSS_MODIFIER

event.ET_LOSS_MODIFIER = {
    [1] = {
        name = "__modifier",
        type = "py.ModifierEntity",
        lua_name = "modifier",
        lua_type = "Buff",
        desc = "触发的魔法效果",
        lua_desc = "触发的魔法效果",
    },
    [2] = {
        name = "__owner_unit",
        type = "py.Unit",
        lua_name = "owner_unit",
        lua_type = "Unit",
        desc = "效果携带者",
        lua_desc = "效果携带者",
    },
    [3] = {
        name = "__from_unit_id",
        type = "py.Unit",
        lua_name = "from_unit",
        lua_type = "Unit",
        desc = "效果施加者",
        lua_desc = "效果施加者",
    },
}

---@class EventParam.ET_MODIFIER_CYCLE_TRIGGER

event.ET_MODIFIER_CYCLE_TRIGGER = {
    [1] = {
        name = "__modifier",
        type = "py.ModifierEntity",
        lua_name = "modifier",
        lua_type = "Buff",
        desc = "触发的魔法效果",
        lua_desc = "触发的魔法效果",
    },
    [2] = {
        name = "__owner_unit",
        type = "py.Unit",
        lua_name = "owner_unit",
        lua_type = "Unit",
        desc = "效果携带者",
        lua_desc = "效果携带者",
    },
    [3] = {
        name = "__from_unit_id",
        type = "py.Unit",
        lua_name = "from_unit",
        lua_type = "Unit",
        desc = "效果施加者",
        lua_desc = "效果施加者",
    },
}

---@class EventParam.ET_MODIFIER_ADDTION

event.ET_MODIFIER_ADDTION = {
    [1] = {
        name = "__modifier",
        type = "py.ModifierEntity",
        lua_name = "modifier",
        lua_type = "Buff",
        desc = "触发的魔法效果",
        lua_desc = "触发的魔法效果",
    },
    [2] = {
        name = "__owner_unit",
        type = "py.Unit",
        lua_name = "owner_unit",
        lua_type = "Unit",
        desc = "效果携带者",
        lua_desc = "效果携带者",
    },
    [3] = {
        name = "__from_unit_id",
        type = "py.Unit",
        lua_name = "from_unit",
        lua_type = "Unit",
        desc = "效果施加者",
        lua_desc = "效果施加者",
    },
}

---@class EventParam.ET_MODIFIER_LAYER_CHANGE

event.ET_MODIFIER_LAYER_CHANGE = {
    [1] = {
        name = "__modifier",
        type = "py.ModifierEntity",
        lua_name = "modifier",
        lua_type = "Buff",
        desc = "触发的魔法效果",
        lua_desc = "触发的魔法效果",
    },
    [2] = {
        name = "__owner_unit",
        type = "py.Unit",
        lua_name = "owner_unit",
        lua_type = "Unit",
        desc = "效果携带者",
        lua_desc = "效果携带者",
    },
    [3] = {
        name = "__layer_change_values",
        type = "integer",
        lua_name = "layer_change_values",
        lua_type = "integer",
        desc = "层数变化值",
        lua_desc = "层数变化值",
    },
    [4] = {
        name = "__from_unit_id",
        type = "py.Unit",
        lua_name = "from_unit",
        lua_type = "Unit",
        desc = "效果施加者",
        lua_desc = "效果施加者",
    },
}

---@class EventParam.ET_MODIFIER_GET_BEFORE_CREATE

event.ET_MODIFIER_GET_BEFORE_CREATE = {
    [1] = {
        name = "__modifier",
        type = "py.ModifierEntity",
        lua_name = "modifier",
        lua_type = "Buff",
        desc = "触发的魔法效果",
        lua_desc = "触发的魔法效果",
    },
    [2] = {
        name = "__owner_unit",
        type = "py.Unit",
        lua_name = "owner_unit",
        lua_type = "Unit",
        desc = "效果携带者",
        lua_desc = "效果携带者",
    },
    [3] = {
        name = "__from_unit_id",
        type = "py.Unit",
        lua_name = "from_unit",
        lua_type = "Unit",
        desc = "效果施加者",
        lua_desc = "效果施加者",
    },
}

---@class EventParam.ET_MODIFIER_BE_COVERED

event.ET_MODIFIER_BE_COVERED = {
    [1] = {
        name = "__owner_unit",
        type = "py.Unit",
        lua_name = "owner_unit",
        lua_type = "Unit",
        desc = "效果携带者",
        lua_desc = "效果携带者",
    },
    [2] = {
        name = "__old_modifier",
        type = "py.ModifierEntity",
        lua_name = "old_modifier",
        lua_type = "Buff",
        desc = "已有的魔法效果",
        lua_desc = "已有的魔法效果",
    },
    [3] = {
        name = "__new_modifier",
        type = "py.ModifierEntity",
        lua_name = "new_modifier",
        lua_type = "Buff",
        desc = "新增的魔法效果",
        lua_desc = "新增的魔法效果",
    },
}

---@class EventParam.ET_DEST_CREATE_NEW

event.ET_DEST_CREATE_NEW = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "可破坏物ID",
        lua_desc = "可破坏物",
    },
}

---@class EventParam.ET_DEST_DIE_NEW

event.ET_DEST_DIE_NEW = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "可破坏物ID",
        lua_desc = "可破坏物",
    },
    [2] = {
        name = "__unit_id_of_dest_killer",
        type = "py.UnitID",
        lua_name = "unit_id_of_dest_killer",
        lua_type = "Unit",
        desc = "凶手单位ID",
        lua_desc = "凶手单位ID",
    },
}

---@class EventParam.ET_DEST_REVIVE_NEW

event.ET_DEST_REVIVE_NEW = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "可破坏物ID",
        lua_desc = "可破坏物",
    },
}

---@class EventParam.ET_DEST_RES_CNT_CHG_NEW

event.ET_DEST_RES_CNT_CHG_NEW = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "可破坏物ID",
        lua_desc = "可破坏物",
    },
    [2] = {
        name = "__res_chg_cnt_in_dest_event",
        type = "integer",
        lua_name = "res_chg_cnt_in_dest_event",
        lua_type = "integer",
        desc = "可破坏物资源变化量",
        lua_desc = "可破坏物资源变化量",
    },
}

---@class EventParam.ET_DEST_COLLECTED_NEW

event.ET_DEST_COLLECTED_NEW = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "可破坏物ID",
        lua_desc = "可破坏物",
    },
    [2] = {
        name = "__unit_id_in_dest_event",
        type = "py.UnitID",
        lua_name = "unit_id_in_dest_event",
        lua_type = "Unit",
        desc = "事件中的单位",
        lua_desc = "事件中的单位",
    },
    [3] = {
        name = "__ability_in_dest_event",
        type = "py.Ability",
        lua_name = "ability_in_dest_event",
        lua_type = "Ability",
        desc = "事件中的技能对象",
        lua_desc = "事件中的技能对象",
    },
    [4] = {
        name = "__role_res_cnt_in_event",
        type = "integer",
        lua_name = "player_res_cnt_in_event",
        lua_type = "integer",
        desc = "采集的玩家属性个数",
        lua_desc = "采集的玩家属性个数",
    },
}

---@class EventParam.ET_GET_HURT_NEW

event.ET_GET_HURT_NEW = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "可破坏物ID",
        lua_desc = "可破坏物",
    },
    [2] = {
        name = "__unit_id_of_hurt_dest",
        type = "py.UnitID",
        lua_name = "unit_id_of_hurt_dest",
        lua_type = "Unit",
        desc = "事件中的单位",
        lua_desc = "事件中的单位",
    },
    [3] = {
        name = "__damage_value_of_hurt_dest",
        type = "py.Fixed",
        lua_name = "damage_value_of_hurt_dest",
        lua_type = "py.Fixed",
        desc = "受到的伤害",
        lua_desc = "受到的伤害",
    },
}

---@class EventParam.ET_SELECT_DEST

event.ET_SELECT_DEST = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "点击到可破坏物id",
        lua_desc = "点击到可破坏物",
    },
}

---@class EventParam.ET_DEST_DELETE

event.ET_DEST_DELETE = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "触发事件的可破坏物",
        lua_desc = "触发事件的可破坏物",
    },
}

---@class EventParam.ET_PRODUCE_PROJECTILE

event.ET_PRODUCE_PROJECTILE = {}

---@class EventParam.ET_DEATH_PROJECTILE

event.ET_DEATH_PROJECTILE = {}

---@class EventParam.ET_TRIGGER_COMPONENT_EVENT

event.ET_TRIGGER_COMPONENT_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__ui_event_name",
        type = "string",
        lua_name = "ui_event_name",
        lua_type = "string",
        desc = "ui事件变量名",
        lua_desc = "ui事件变量名",
    },
    [3] = {
        name = "__comp_name",
        type = "string",
        lua_name = "comp_name",
        lua_type = "string",
        desc = "触发事件控件名称",
        lua_desc = "触发事件控件名称",
    },
    [4] = {
        name = "__pos",
        type = "py.Vector2",
        lua_name = "pos",
        lua_type = "py.Vector2",
        desc = "触碰坐标",
        lua_desc = "触碰坐标",
    },
    [5] = {
        name = "__touch_id",
        type = "integer",
        lua_name = "touch_id",
        lua_type = "integer",
        desc = "触碰ID",
        lua_desc = "触碰ID",
    },
}

---@class EventParam.ET_KEYBOARD_KEY_DOWN_EVENT

event.ET_KEYBOARD_KEY_DOWN_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.KeyboardKey",
        lua_name = "current_key",
        lua_type = "py.KeyboardKey",
        desc = "当前键盘按键",
        lua_desc = "当前键盘按键",
    },
}

---@class EventParam.ET_KEYBOARD_KEY_UP_EVENT

event.ET_KEYBOARD_KEY_UP_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.KeyboardKey",
        lua_name = "current_key",
        lua_type = "py.KeyboardKey",
        desc = "当前键盘按键",
        lua_desc = "当前键盘按键",
    },
}

---@class EventParam.ET_MOUSE_KEY_DOWN_EVENT

event.ET_MOUSE_KEY_DOWN_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.MouseKey",
        lua_name = "current_key",
        lua_type = "py.MouseKey",
        desc = "当前鼠标按键",
        lua_desc = "当前鼠标按键",
    },
    [3] = {
        name = "__pointing_world_pos",
        type = "py.Point",
        lua_name = "pointing_world_pos",
        lua_type = "Point",
        desc = "鼠标指向的世界坐标",
        lua_desc = "鼠标指向的世界坐标",
    },
}

---@class EventParam.ET_MOUSE_KEY_UP_EVENT

event.ET_MOUSE_KEY_UP_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.MouseKey",
        lua_name = "current_key",
        lua_type = "py.MouseKey",
        desc = "当前鼠标按键",
        lua_desc = "当前鼠标按键",
    },
    [3] = {
        name = "__pointing_world_pos",
        type = "py.Point",
        lua_name = "pointing_world_pos",
        lua_type = "Point",
        desc = "鼠标指向的世界坐标",
        lua_desc = "鼠标指向的世界坐标",
    },
}

---@class EventParam.MOUSE_KEY_DB_CLICK_EVENT

event.MOUSE_KEY_DB_CLICK_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.MouseKey",
        lua_name = "current_key",
        lua_type = "py.MouseKey",
        desc = "当前鼠标按键",
        lua_desc = "当前鼠标按键",
    },
    [3] = {
        name = "__pointing_world_pos",
        type = "py.Point",
        lua_name = "pointing_world_pos",
        lua_type = "Point",
        desc = "鼠标指向的世界坐标",
        lua_desc = "鼠标指向的世界坐标",
    },
}

---@class EventParam.MOUSE_KEY_DOWN_UNIT_EVENT

event.MOUSE_KEY_DOWN_UNIT_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.MouseKey",
        lua_name = "current_key",
        lua_type = "py.MouseKey",
        desc = "当前鼠标按键",
        lua_desc = "当前鼠标按键",
    },
    [3] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "当前操作的单位ID",
        lua_desc = "当前操作的单位",
    },
}

---@class EventParam.MOUSE_KEY_UP_UNIT_EVENT

event.MOUSE_KEY_UP_UNIT_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.MouseKey",
        lua_name = "current_key",
        lua_type = "py.MouseKey",
        desc = "当前鼠标按键",
        lua_desc = "当前鼠标按键",
    },
    [3] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "当前操作的单位ID",
        lua_desc = "当前操作的单位",
    },
}

---@class EventParam.MOUSE_KEY_DB_CLICK_UNIT_EVENT

event.MOUSE_KEY_DB_CLICK_UNIT_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__current_key",
        type = "py.MouseKey",
        lua_name = "current_key",
        lua_type = "py.MouseKey",
        desc = "当前鼠标按键",
        lua_desc = "当前鼠标按键",
    },
    [3] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "当前操作的单位ID",
        lua_desc = "当前操作的单位",
    },
}

---@class EventParam.MOUSE_MOVE_EVENT

event.MOUSE_MOVE_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__pointing_world_pos",
        type = "py.Point",
        lua_name = "pointing_world_pos",
        lua_type = "Point",
        desc = "鼠标指向的世界坐标",
        lua_desc = "鼠标指向的世界坐标",
    },
    [3] = {
        name = "__tar_x",
        type = "integer",
        lua_name = "tar_x",
        lua_type = "integer",
        desc = "鼠标指向的屏幕坐标X",
        lua_desc = "鼠标指向的屏幕坐标X",
    },
    [4] = {
        name = "__tar_y",
        type = "integer",
        lua_name = "tar_y",
        lua_type = "integer",
        desc = "鼠标指向的屏幕坐标Y",
        lua_desc = "鼠标指向的屏幕坐标Y",
    },
}

---@class EventParam.ET_MOUSE_WHEEL_EVENT

event.ET_MOUSE_WHEEL_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "触发按键的玩家ID",
        lua_desc = "触发按键的玩家",
    },
    [2] = {
        name = "__mouse_wheel",
        type = "py.MouseWheel",
        lua_name = "mouse_wheel",
        lua_type = "py.MouseWheel",
        desc = "当前鼠标滚轮",
        lua_desc = "当前鼠标滚轮",
    },
}

---@class EventParam.ET_SELECT_UNIT

event.ET_SELECT_UNIT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "点击到单位id",
        lua_desc = "点击到单位",
    },
}

---@class EventParam.ET_SELECT_ITEM

event.ET_SELECT_ITEM = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "点击到物品id",
        lua_desc = "点击到物品",
    },
}

---@class EventParam.ET_DOUBLE_CLICK_ITEM

event.ET_DOUBLE_CLICK_ITEM = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "双击到物品id",
        lua_desc = "双击到物品",
    },
}

---@class EventParam.ET_DOUBLE_CLICK_DEST

event.ET_DOUBLE_CLICK_DEST = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "双击到可破坏物id",
        lua_desc = "双击到可破坏物",
    },
}

---@class EventParam.ET_SELECT_UNIT_GROUP

event.ET_SELECT_UNIT_GROUP = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__unit_group_id_list",
        type = "py.UnitGroup",
        lua_name = "unit_group_id_list",
        lua_type = "UnitGroup",
        desc = "框选到单位组id列表",
        lua_desc = "框选到单位组id列表",
    },
    [3] = {
        name = "__team_id",
        type = "integer",
        lua_name = "team_id",
        lua_type = "integer",
        desc = "队伍编号",
        lua_desc = "队伍编号",
    },
}

---@class EventParam.ET_START_SKILL_POINTER

event.ET_START_SKILL_POINTER = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "释放单位id",
        lua_desc = "释放单位",
    },
    [3] = {
        name = "__ability_type",
        type = "py.AbilityType",
        lua_name = "ability_type",
        lua_type = "py.AbilityType",
        desc = "技能类型",
        lua_desc = "技能类型",
    },
    [4] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能Index",
        lua_desc = "技能Index",
    },
    [5] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
}

---@class EventParam.ET_STOP_SKILL_POINTER

event.ET_STOP_SKILL_POINTER = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "释放单位id",
        lua_desc = "释放单位",
    },
    [3] = {
        name = "__ability_type",
        type = "py.AbilityType",
        lua_name = "ability_type",
        lua_type = "py.AbilityType",
        desc = "技能类型",
        lua_desc = "技能类型",
    },
    [4] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能Index",
        lua_desc = "技能Index",
    },
    [5] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
}

---@class EventParam.ET_UNIT_ADD_ITEM

event.ET_UNIT_ADD_ITEM = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "获得该物品的单位id",
        lua_desc = "获得该物品的单位",
    },
    [2] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "物品id",
        lua_desc = "物品",
    },
    [3] = {
        name = "__item_no",
        type = "py.ItemKey",
        lua_name = "item_no",
        lua_type = "py.ItemKey",
        desc = "物品编号",
        lua_desc = "物品编号",
    },
}

---@class EventParam.ET_UNIT_ADD_ITEM_TO_PKG

event.ET_UNIT_ADD_ITEM_TO_PKG = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "获得该物品的单位id",
        lua_desc = "获得该物品的单位",
    },
    [2] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "物品id",
        lua_desc = "物品",
    },
    [3] = {
        name = "__item_no",
        type = "py.ItemKey",
        lua_name = "item_no",
        lua_type = "py.ItemKey",
        desc = "物品编号",
        lua_desc = "物品编号",
    },
}

---@class EventParam.ET_UNIT_START_NAV_EVENT

event.ET_UNIT_START_NAV_EVENT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_UNIT_END_NAV_EVENT

event.ET_UNIT_END_NAV_EVENT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_ITEM_STACK_CHANGED

event.ET_ITEM_STACK_CHANGED = {
    [1] = {
        name = "__unit_id",
        type = "py.ItemID",
        lua_name = "unit",
        lua_type = "Item",
        desc = "单位id",
        lua_desc = "单位",
    },
    [2] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "物品id",
        lua_desc = "物品",
    },
    [3] = {
        name = "__item_no",
        type = "py.ItemKey",
        lua_name = "item_no",
        lua_type = "py.ItemKey",
        desc = "物品编号",
        lua_desc = "物品编号",
    },
    [4] = {
        name = "__delta_cnt",
        type = "integer",
        lua_name = "delta_cnt",
        lua_type = "integer",
        desc = "变化值",
        lua_desc = "变化值",
    },
}

---@class EventParam.ET_ITEM_CHARGE_CHANGED

event.ET_ITEM_CHARGE_CHANGED = {
    [1] = {
        name = "__unit_id",
        type = "py.ItemID",
        lua_name = "unit",
        lua_type = "Item",
        desc = "单位id",
        lua_desc = "单位",
    },
    [2] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "物品id",
        lua_desc = "物品",
    },
    [3] = {
        name = "__item_no",
        type = "py.ItemKey",
        lua_name = "item_no",
        lua_type = "py.ItemKey",
        desc = "物品编号",
        lua_desc = "物品编号",
    },
    [4] = {
        name = "__delta_cnt",
        type = "integer",
        lua_name = "delta_cnt",
        lua_type = "integer",
        desc = "变化值",
        lua_desc = "变化值",
    },
}

---@class EventParam.ET_ITEM_ON_CREATE

event.ET_ITEM_ON_CREATE = {
    [1] = {
        name = "__item",
        type = "py.Item",
        lua_name = "item",
        lua_type = "Item",
        desc = "被创建的物品",
        lua_desc = "被创建的物品",
    },
}

---@class EventParam.ET_ITEM_ON_DESTROY

event.ET_ITEM_ON_DESTROY = {
    [1] = {
        name = "__item_id",
        type = "py.ItemKey",
        lua_name = "item_id",
        lua_type = "py.ItemKey",
        desc = "销毁的物品",
        lua_desc = "销毁的物品",
    },
}

---@class EventParam.ET_ITEM_SOLD

event.ET_ITEM_SOLD = {
    [1] = {
        name = "__unit",
        type = "py.Unit",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "购买者",
        lua_desc = "购买者",
    },
    [2] = {
        name = "__unit2",
        type = "py.Unit",
        lua_name = "unit2",
        lua_type = "Unit",
        desc = "贩卖者",
        lua_desc = "贩卖者",
    },
    [3] = {
        name = "__item",
        type = "py.Item",
        lua_name = "item",
        lua_type = "Item",
        desc = "被售出的物品",
        lua_desc = "被售出的物品",
    },
    [4] = {
        name = "__buy_unit_id",
        type = "py.UnitID",
        lua_name = "buy_unit",
        lua_type = "Unit",
        desc = "收购物品的单位id",
        lua_desc = "收购物品的单位",
    },
    [5] = {
        name = "__shop_unit_id",
        type = "py.UnitID",
        lua_name = "shop_unit",
        lua_type = "Unit",
        desc = "出售物品的单位id",
        lua_desc = "出售物品的单位",
    },
}

---@class EventParam.ET_ITEM_BROKEN

event.ET_ITEM_BROKEN = {
    [1] = {
        name = "__item",
        type = "py.Item",
        lua_name = "item",
        lua_type = "Item",
        desc = "被破坏的物品",
        lua_desc = "被破坏的物品",
    },
    [2] = {
        name = "__unit",
        type = "py.Unit",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "破坏物品的单位",
        lua_desc = "破坏物品的单位",
    },
}

---@class EventParam.ET_ITEM_CREATE_ON_DEST_COLLECTED

event.ET_ITEM_CREATE_ON_DEST_COLLECTED = {
    [1] = {
        name = "__item_id",
        type = "py.Item",
        lua_name = "item",
        lua_type = "Item",
        desc = "事件中的物品",
        lua_desc = "事件中的物品",
    },
    [2] = {
        name = "__destructible_id",
        type = "py.Destructible",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "事件中的可破坏物",
        lua_desc = "事件中的可破坏物",
    },
    [3] = {
        name = "__unit_id",
        type = "py.Unit",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "采集可破坏物事件中的单位",
        lua_desc = "采集可破坏物事件中的单位",
    },
    [4] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "采集可破坏物的捷能",
        lua_desc = "采集可破坏物的捷能",
    },
}

---@class EventParam.ET_CHAT_SEND_GM

event.ET_CHAT_SEND_GM = {
    [1] = {
        name = "__str1",
        type = "string",
        lua_name = "str1",
        lua_type = "string",
        desc = "指令字符串",
        lua_desc = "指令字符串",
    },
    [2] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家id",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_EVENT_CUSTOM

event.ET_EVENT_CUSTOM = {
    [1] = {
        name = "__c_param_1",
        type = "integer",
        lua_name = "c_param_1",
        lua_type = "integer",
        desc = "事件参数",
        lua_desc = "事件参数",
    },
    [2] = {
        name = "__c_param_dict",
        type = "py.Dict",
        lua_name = "c_param_dict",
        lua_type = "py.Dict",
        desc = "自定义参数列表",
        lua_desc = "自定义参数列表",
    },
}

---@class EventParam.ET_UI_PREFAB_CREATE_EVENT

event.ET_UI_PREFAB_CREATE_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__ui_prefab",
        type = "string",
        lua_name = "ui_prefab",
        lua_type = "string",
        desc = "ui模块id",
        lua_desc = "ui模块id",
    },
    [3] = {
        name = "__ui_prefab_ins",
        type = "py.UIPrefabIns",
        lua_name = "ui_prefab_ins",
        lua_type = "py.UIPrefabIns",
        desc = "创建出的实例控件",
        lua_desc = "创建出的实例控件",
    },
}

---@class EventParam.ET_UI_PREFAB_DEL_EVENT

event.ET_UI_PREFAB_DEL_EVENT = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__ui_prefab",
        type = "string",
        lua_name = "ui_prefab",
        lua_type = "string",
        desc = "ui模块id",
        lua_desc = "ui模块id",
    },
    [3] = {
        name = "__ui_prefab_ins",
        type = "py.UIPrefabIns",
        lua_name = "ui_prefab_ins",
        lua_type = "py.UIPrefabIns",
        desc = "销毁的模块实例控件",
        lua_desc = "销毁的模块实例控件",
    },
}

---@class EventParam.ET_MICRO_SPEAK

event.ET_MICRO_SPEAK = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__audio_channel",
        type = "integer",
        lua_name = "audio_channel",
        lua_type = "integer",
        desc = "频道",
        lua_desc = "频道",
    },
    [3] = {
        name = "__audio_bool",
        type = "boolean",
        lua_name = "audio_bool",
        lua_type = "boolean",
        desc = "是否发言",
        lua_desc = "是否发言",
    },
}

---@class EventParam.ET_UNIT_3D_ACTIVE

event.ET_UNIT_3D_ACTIVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位ID",
        lua_desc = "单位",
    },
    [2] = {
        name = "__is_active",
        type = "boolean",
        lua_name = "is_active",
        lua_type = "boolean",
        desc = "是否开启",
        lua_desc = "是否开启",
    },
}

return event
