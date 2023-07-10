-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class GameEvent
local M = {}

M.alias_map = {}

---@alias EventParam.时间-经过 EventParam.ET_TIMEOUT
M.alias_map["时间-经过"] = {
    desc = "游戏开始经过指定的时间后触发",
    key = "ET_TIMEOUT",
    name = "时间-经过",
    params = {
        [1] = {
            desc = "经过的时间",
            name = "time",
            type = "number",
        },
    },
}

---@alias EventParam.时间-周期 EventParam.ET_REPEAT_TIMEOUT
M.alias_map["时间-周期"] = {
    desc = "每隔指定的时间重复触发",
    key = "ET_REPEAT_TIMEOUT",
    name = "时间-周期",
    params = {
        [1] = {
            desc = "经过的时间",
            name = "time",
            type = "number",
        },
    },
}

---@alias EventParam.时间-周期帧 EventParam.ET_REPEAT_TIMEOUT_BY_FRAME
M.alias_map["时间-周期帧"] = {
    desc = "每隔指定的帧数重复触发",
    key = "ET_REPEAT_TIMEOUT_BY_FRAME",
    name = "时间-周期帧",
    params = {
        [1] = {
            desc = "经过的帧数",
            name = "count",
            type = "integer",
        },
    },
}

---@alias EventParam.游戏-初始化 EventParam.ET_GAME_INIT
M.alias_map["游戏-初始化"] = {
    desc = "游戏初始化时触发",
    key = "ET_GAME_INIT",
    name = "游戏-初始化",
    params = {
    },
}

---@alias EventParam.游戏-暂停 EventParam.ET_GAME_PAUSE
M.alias_map["游戏-暂停"] = {
    desc = "游戏暂停时触发",
    key = "ET_GAME_PAUSE",
    name = "游戏-暂停",
    params = {
    },
}

---@alias EventParam.游戏-恢复 EventParam.ET_GAME_RESUME
M.alias_map["游戏-恢复"] = {
    desc = "游戏恢复时触发",
    key = "ET_GAME_RESUME",
    name = "游戏-恢复",
    params = {
    },
}

---@alias EventParam.区域-进入 EventParam.ET_AREA_ENTER
M.alias_map["区域-进入"] = {
    desc = "任意单位进入区域时触发",
    key = "ET_AREA_ENTER",
    name = "区域-进入",
    params = {
        [1] = {
            desc = "区域",
            name = "area",
            type = "Area",
        },
    },
}

---@alias EventParam.区域-离开 EventParam.ET_AREA_LEAVE
M.alias_map["区域-离开"] = {
    desc = "任意单位离开区域时触发",
    key = "ET_AREA_LEAVE",
    name = "区域-离开",
    params = {
        [1] = {
            desc = "区域",
            name = "area",
            type = "Area",
        },
    },
}

---@alias EventParam.玩家-加入游戏 EventParam.ET_ROLE_JOIN_BATTLE
M.alias_map["玩家-加入游戏"] = {
    desc = "玩家加入游戏时触发",
    key = "ET_ROLE_JOIN_BATTLE",
    name = "玩家-加入游戏",
    params = {
        [1] = {
            desc = "玩家",
            name = "player",
            type = "Player",
        },
    },
}

---@alias EventParam.玩家-掉线 EventParam.ET_ROLE_LOSE_CONNECT
M.alias_map["玩家-掉线"] = {
    desc = "玩家掉线时触发",
    key = "ET_ROLE_LOSE_CONNECT",
    name = "玩家-掉线",
    params = {
        [1] = {
            desc = "玩家",
            name = "player",
            type = "Player",
        },
    },
}

---@alias EventParam.玩家-使用平台道具 EventParam.ET_ROLE_USE_STORE_ITEM_END
M.alias_map["玩家-使用平台道具"] = {
    desc = "玩家使用平台道具时触发",
    key = "ET_ROLE_USE_STORE_ITEM_END",
    name = "玩家-使用平台道具",
    params = {
        [1] = {
            desc = "道具编号",
            name = "store_key",
            type = "py.StoreKey",
        },
    },
}

---@alias EventParam.玩家-持有平台道具 EventParam.ET_ROLE_HOLD_STORE_ITEM
M.alias_map["玩家-持有平台道具"] = {
    desc = "玩家进入游戏时如果持有指定平台道具会触发",
    key = "ET_ROLE_HOLD_STORE_ITEM",
    name = "玩家-持有平台道具",
    params = {
        [1] = {
            desc = "道具编号",
            name = "store_key",
            type = "py.StoreKey",
        },
    },
}

---@alias EventParam.玩家-属性变化 EventParam.ET_ROLE_RESOURCE_CHANGED
M.alias_map["玩家-属性变化"] = {
    desc = "玩家属性变化时触发",
    key = "ET_ROLE_RESOURCE_CHANGED",
    name = "玩家-属性变化",
    params = {
    },
}

---@alias EventParam.玩家-发送指定消息 EventParam.ET_ROLE_INPUT_MSG
M.alias_map["玩家-发送指定消息"] = {
    desc = "玩家发送指定消息时触发",
    key = "ET_ROLE_INPUT_MSG",
    name = "玩家-发送指定消息",
    params = {
        [1] = {
            desc = "消息内容",
            name = "msg",
            type = "string",
        },
    },
}

---@alias EventParam.玩家-科技提升 EventParam.ET_ROLE_TECH_UPGRADE
M.alias_map["玩家-科技提升"] = {
    desc = "玩家科技每提升一级都会触发一次",
    key = "ET_ROLE_TECH_UPGRADE",
    name = "玩家-科技提升",
    params = {
    },
}

---@alias EventParam.玩家-科技降低 EventParam.ET_ROLE_TECH_DOWNGRADE
M.alias_map["玩家-科技降低"] = {
    desc = "玩家科技每降低一级都会触发一次",
    key = "ET_ROLE_TECH_DOWNGRADE",
    name = "玩家-科技降低",
    params = {
    },
}

---@alias EventParam.玩家-科技变化 EventParam.ET_ROLE_TECH_CHANGED
M.alias_map["玩家-科技变化"] = {
    desc = "玩家科技变化时触发，一次变化多个等级也只会触发一次",
    key = "ET_ROLE_TECH_CHANGED",
    name = "玩家-科技变化",
    params = {
    },
}

---@alias EventParam.单位-研发科技 EventParam.ET_UNIT_UPGRADE_TECH
M.alias_map["单位-研发科技"] = {
    desc = "单位研发科技时触发",
    key = "ET_UNIT_UPGRADE_TECH",
    name = "单位-研发科技",
    params = {
    },
}

---@alias EventParam.单位-获得科技 EventParam.ET_UNIT_ADD_TECH
M.alias_map["单位-获得科技"] = {
    desc = "单位获得科技时触发",
    key = "ET_UNIT_ADD_TECH",
    name = "单位-获得科技",
    params = {
    },
}

---@alias EventParam.单位-失去科技 EventParam.ET_UNIT_REMOVE_TECH
M.alias_map["单位-失去科技"] = {
    desc = "单位失去科技时触发",
    key = "ET_UNIT_REMOVE_TECH",
    name = "单位-失去科技",
    params = {
    },
}

---@alias EventParam.技能-建造完成 EventParam.ET_ABILITY_BUILD_FINISH
M.alias_map["技能-建造完成"] = {
    desc = "通过建造类技能建造完成时触发，可以获取到被建造出来的单位",
    key = "ET_ABILITY_BUILD_FINISH",
    name = "技能-建造完成",
    params = {
    },
}

---@alias EventParam.技能-学习 EventParam.ET_ABILITY_PLUS_POINT
M.alias_map["技能-学习"] = {
    desc = "学习技能后触发",
    key = "ET_ABILITY_PLUS_POINT",
    name = "技能-学习",
    params = {
    },
}

---@alias EventParam.单位-开始移动 EventParam.ET_UNIT_START_MOVE
M.alias_map["单位-开始移动"] = {
    desc = "单位开始移动时触发",
    key = "ET_UNIT_START_MOVE",
    name = "单位-开始移动",
    params = {
    },
}

---@alias EventParam.单位-移除 EventParam.ET_UNIT_REMOVE
M.alias_map["单位-移除"] = {
    desc = "单位被移除后触发",
    key = "ET_UNIT_REMOVE",
    name = "单位-移除",
    params = {
    },
}

---@alias EventParam.单位-即将死亡 EventParam.ET_UNIT_ATTR_CHANGE
M.alias_map["单位-即将死亡"] = {
    desc = "单位死亡前触发",
    key = "ET_UNIT_ATTR_CHANGE",
    name = "单位-即将死亡",
    params = {
    },
}

---@alias EventParam.单位-死亡 EventParam.ET_UNIT_DIE
M.alias_map["单位-死亡"] = {
    desc = "单位死亡后触发",
    key = "ET_UNIT_DIE",
    name = "单位-死亡",
    params = {
    },
}

---@alias EventParam.单位-受到伤害前 EventParam.ET_UNIT_BE_HURT
M.alias_map["单位-受到伤害前"] = {
    desc = "在其他计算前触发，可以修改闪避和暴击",
    key = "ET_UNIT_BE_HURT",
    name = "单位-受到伤害前",
    params = {
    },
}

---@alias EventParam.单位-造成伤害前 EventParam.ET_UNIT_HURT_OTHER
M.alias_map["单位-造成伤害前"] = {
    desc = "在其他计算前触发，可以修改闪避和暴击",
    key = "ET_UNIT_HURT_OTHER",
    name = "单位-造成伤害前",
    params = {
    },
}

---@alias EventParam.单位-受到伤害时 EventParam.ET_UNIT_BE_HURT_BEFORE_APPLY
M.alias_map["单位-受到伤害时"] = {
    desc = "可以修改伤害值",
    key = "ET_UNIT_BE_HURT_BEFORE_APPLY",
    name = "单位-受到伤害时",
    params = {
    },
}

---@alias EventParam.单位-造成伤害时 EventParam.ET_UNIT_HURT_OTHER_BEFORE_APPLY
M.alias_map["单位-造成伤害时"] = {
    desc = "可以修改伤害值",
    key = "ET_UNIT_HURT_OTHER_BEFORE_APPLY",
    name = "单位-造成伤害时",
    params = {
    },
}

---@alias EventParam.单位-造成伤害后 EventParam.ET_UNIT_HURT_OTHER_FINISH
M.alias_map["单位-造成伤害后"] = {
    desc = "伤害已结算，只能获取伤害值",
    key = "ET_UNIT_HURT_OTHER_FINISH",
    name = "单位-造成伤害后",
    params = {
    },
}

---@alias EventParam.单位-受到伤害后 EventParam.ET_UNIT_BE_HURT_COMPLETE
M.alias_map["单位-受到伤害后"] = {
    desc = "伤害已结算，只能获取伤害值",
    key = "ET_UNIT_BE_HURT_COMPLETE",
    name = "单位-受到伤害后",
    params = {
    },
}

---@alias EventParam.单位-受到治疗前 EventParam.ET_UNIT_GET_CURE_BEFORE_APPLY
M.alias_map["单位-受到治疗前"] = {
    desc = "可在其他计算前触发，可以修改有效性",
    key = "ET_UNIT_GET_CURE_BEFORE_APPLY",
    name = "单位-受到治疗前",
    params = {
    },
}

---@alias EventParam.单位-受到治疗后 EventParam.ET_UNIT_GET_CURE_FINISH
M.alias_map["单位-受到治疗后"] = {
    desc = "治疗已结算，只能获取治疗值",
    key = "ET_UNIT_GET_CURE_FINISH",
    name = "单位-受到治疗后",
    params = {
    },
}

---@alias EventParam.单位-受到治疗时 EventParam.ET_UNIT_GET_CURE
M.alias_map["单位-受到治疗时"] = {
    desc = "可以修改治疗值",
    key = "ET_UNIT_GET_CURE",
    name = "单位-受到治疗时",
    params = {
    },
}

---@alias EventParam.单位-施放技能 EventParam.ET_UNIT_RELEASE_ABILITY
M.alias_map["单位-施放技能"] = {
    desc = "单位施放技能时触发",
    key = "ET_UNIT_RELEASE_ABILITY",
    name = "单位-施放技能",
    params = {
    },
}

---@alias EventParam.单位-获得经验前 EventParam.ET_UNIT_PRE_ADD_EXP
M.alias_map["单位-获得经验前"] = {
    desc = "单位获得经验前触发",
    key = "ET_UNIT_PRE_ADD_EXP",
    name = "单位-获得经验前",
    params = {
    },
}

---@alias EventParam.单位-获得经验后 EventParam.ET_UNIT_ON_ADD_EXP
M.alias_map["单位-获得经验后"] = {
    desc = "单位获得经验后触发",
    key = "ET_UNIT_ON_ADD_EXP",
    name = "单位-获得经验后",
    params = {
    },
}

---@alias EventParam.单位-接收命令 EventParam.ET_UNIT_ON_COMMAND
M.alias_map["单位-接收命令"] = {
    desc = "接收到命令时触发，如果命令有目标会根据目标类型存到不同的字段里",
    key = "ET_UNIT_ON_COMMAND",
    name = "单位-接收命令",
    params = {
    },
}

---@alias EventParam.单位-击杀 EventParam.ET_KILL_UNIT
M.alias_map["单位-击杀"] = {
    desc = "单位击杀其他单位时触发",
    key = "ET_KILL_UNIT",
    name = "单位-击杀",
    params = {
    },
}

---@alias EventParam.单位-创建 EventParam.ET_UNIT_BORN
M.alias_map["单位-创建"] = {
    desc = "单位被创建后触发",
    key = "ET_UNIT_BORN",
    name = "单位-创建",
    params = {
    },
}

---@alias EventParam.单位-进入战斗 EventParam.ET_UNIT_ENTER_BATTLE
M.alias_map["单位-进入战斗"] = {
    desc = "单位进入战斗时触发",
    key = "ET_UNIT_ENTER_BATTLE",
    name = "单位-进入战斗",
    params = {
    },
}

---@alias EventParam.单位-脱离战斗 EventParam.ET_UNIT_EXIT_BATTLE
M.alias_map["单位-脱离战斗"] = {
    desc = "单位离开战斗时触发",
    key = "ET_UNIT_EXIT_BATTLE",
    name = "单位-脱离战斗",
    params = {
    },
}

---@alias EventParam.单位-购买物品 EventParam.ET_UNIT_SHOP_BUY_ITEM
M.alias_map["单位-购买物品"] = {
    desc = "购买物品时触发",
    key = "ET_UNIT_SHOP_BUY_ITEM",
    name = "单位-购买物品",
    params = {
    },
}

---@alias EventParam.单位-购买单位 EventParam.ET_UNIT_SHOP_BUY_UNIT
M.alias_map["单位-购买单位"] = {
    desc = "购买单位时触发",
    key = "ET_UNIT_SHOP_BUY_UNIT",
    name = "单位-购买单位",
    params = {
    },
}

---@alias EventParam.单位-出售物品 EventParam.ET_UNIT_ITEM_SELL
M.alias_map["单位-出售物品"] = {
    desc = "出售物品时触发",
    key = "ET_UNIT_ITEM_SELL",
    name = "单位-出售物品",
    params = {
    },
}

---@alias EventParam.单位-物品合成 EventParam.ET_UNIT_ITEM_COMPOSE
M.alias_map["单位-物品合成"] = {
    desc = "物品合成时触发",
    key = "ET_UNIT_ITEM_COMPOSE",
    name = "单位-物品合成",
    params = {
    },
}

---@alias EventParam.单位-购买物品合成 EventParam.ET_UNIT_SHOP_BUY_WITH_COMPOSE
M.alias_map["单位-购买物品合成"] = {
    desc = "购买物品合成时触发",
    key = "ET_UNIT_SHOP_BUY_WITH_COMPOSE",
    name = "单位-购买物品合成",
    params = {
    },
}

---@alias EventParam.单位-复活 EventParam.ET_REVIVE_UNIT
M.alias_map["单位-复活"] = {
    desc = "单位复活后触发",
    key = "ET_REVIVE_UNIT",
    name = "单位-复活",
    params = {
    },
}

---@alias EventParam.单位-升级 EventParam.ET_UPGRADE_UNIT
M.alias_map["单位-升级"] = {
    desc = "单位升级后触发",
    key = "ET_UPGRADE_UNIT",
    name = "单位-升级",
    params = {
    },
}

---@alias EventParam.单位-进入草丛 EventParam.ET_UNIT_ENTER_GRASS
M.alias_map["单位-进入草丛"] = {
    desc = "单位进入草丛时触发",
    key = "ET_UNIT_ENTER_GRASS",
    name = "单位-进入草丛",
    params = {
    },
}

---@alias EventParam.单位-离开草丛 EventParam.ET_UNIT_LEAVE_GRASS
M.alias_map["单位-离开草丛"] = {
    desc = "单位离开草丛时触发",
    key = "ET_UNIT_LEAVE_GRASS",
    name = "单位-离开草丛",
    params = {
    },
}

---@alias EventParam.单位-改变所属 EventParam.ET_UNIT_ROLE_CHANGED
M.alias_map["单位-改变所属"] = {
    desc = "单位的所有者玩家发生变化时触发",
    key = "ET_UNIT_ROLE_CHANGED",
    name = "单位-改变所属",
    params = {
    },
}

---@alias EventParam.单位类型-前置条件成立 EventParam.ET_UNIT_PRECONDITION_SUCCEED
M.alias_map["单位类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_UNIT_PRECONDITION_SUCCEED",
    name = "单位类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.单位类型-前置条件不成立 EventParam.ET_UNIT_PRECONDITION_FAILED
M.alias_map["单位类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_UNIT_PRECONDITION_FAILED",
    name = "单位类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.物品类型-前置条件成立 EventParam.ET_ITEM_PRECONDITION_SUCCEED
M.alias_map["物品类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_ITEM_PRECONDITION_SUCCEED",
    name = "物品类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.物品类型-前置条件不成立 EventParam.ET_ITEM_PRECONDITION_FAILED
M.alias_map["物品类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_ITEM_PRECONDITION_FAILED",
    name = "物品类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.技能类型-前置条件成立 EventParam.ET_ABILITY_PRECONDITION_SUCCEED
M.alias_map["技能类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_ABILITY_PRECONDITION_SUCCEED",
    name = "技能类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.技能类型-前置条件不成立 EventParam.ET_ABILITY_PRECONDITION_FAILED
M.alias_map["技能类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_ABILITY_PRECONDITION_FAILED",
    name = "技能类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.科技类型-前置条件成立 EventParam.ET_TECH_PRECONDITION_SUCCEED
M.alias_map["科技类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_TECH_PRECONDITION_SUCCEED",
    name = "科技类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.科技类型-前置条件不成立 EventParam.ET_TECH_PRECONDITION_FAILED
M.alias_map["科技类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_TECH_PRECONDITION_FAILED",
    name = "科技类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.技能-升级 EventParam.ET_ABILITY_UPGRADE
M.alias_map["技能-升级"] = {
    desc = "技能升级后触发",
    key = "ET_ABILITY_UPGRADE",
    name = "技能-升级",
    params = {
    },
}

---@alias EventParam.施法-即将开始 EventParam.ET_ABILITY_CS_START
M.alias_map["施法-即将开始"] = {
    desc = "即将施法时触发",
    key = "ET_ABILITY_CS_START",
    name = "施法-即将开始",
    params = {
    },
}

---@alias EventParam.施法-开始 EventParam.ET_ABILITY_PS_START
M.alias_map["施法-开始"] = {
    desc = "施法开始后，前摇开始前触发",
    key = "ET_ABILITY_PS_START",
    name = "施法-开始",
    params = {
    },
}

---@alias EventParam.施法-引导 EventParam.ET_ABILITY_PS_END
M.alias_map["施法-引导"] = {
    desc = "前摇完成后，持续引导前触发",
    key = "ET_ABILITY_PS_END",
    name = "施法-引导",
    params = {
    },
}

---@alias EventParam.施法-出手 EventParam.ET_ABILITY_SP_END
M.alias_map["施法-出手"] = {
    desc = "持续引导后，后摇开始前触发",
    key = "ET_ABILITY_SP_END",
    name = "施法-出手",
    params = {
    },
}

---@alias EventParam.施法-完成 EventParam.ET_ABILITY_CST_END
M.alias_map["施法-完成"] = {
    desc = "后摇结束后触发。只有施法正常完成才会触发。",
    key = "ET_ABILITY_CST_END",
    name = "施法-完成",
    params = {
    },
}

---@alias EventParam.施法-结束 EventParam.ET_ABILITY_BS_END
M.alias_map["施法-结束"] = {
    desc = "整个施法的表现结束后触发",
    key = "ET_ABILITY_BS_END",
    name = "施法-结束",
    params = {
    },
}

---@alias EventParam.施法-打断开始 EventParam.ET_ABILITY_PS_INTERRUPT
M.alias_map["施法-打断开始"] = {
    desc = "在“开始”到“引导”之间被打断",
    key = "ET_ABILITY_PS_INTERRUPT",
    name = "施法-打断开始",
    params = {
    },
}

---@alias EventParam.施法-打断引导 EventParam.ET_ABILITY_SP_INTERRUPT
M.alias_map["施法-打断引导"] = {
    desc = "在“引导”到“出手”之间被打断",
    key = "ET_ABILITY_SP_INTERRUPT",
    name = "施法-打断引导",
    params = {
    },
}

---@alias EventParam.施法-打断出手 EventParam.ET_ABILITY_CST_INTERRUPT
M.alias_map["施法-打断出手"] = {
    desc = "在“出手”到“完成”之间被打断",
    key = "ET_ABILITY_CST_INTERRUPT",
    name = "施法-打断出手",
    params = {
    },
}

---@alias EventParam.施法-停止 EventParam.ET_ABILITY_END
M.alias_map["施法-停止"] = {
    desc = "施法停止后触发，是施法流程的最后一个事件。",
    key = "ET_ABILITY_END",
    name = "施法-停止",
    params = {
    },
}

---@alias EventParam.技能-获得 EventParam.ET_ABILITY_OBTAIN
M.alias_map["技能-获得"] = {
    desc = "获得技能后触发",
    key = "ET_ABILITY_OBTAIN",
    name = "技能-获得",
    params = {
    },
}

---@alias EventParam.技能-失去 EventParam.ET_ABILITY_LOSE
M.alias_map["技能-失去"] = {
    desc = "失去技能后触发",
    key = "ET_ABILITY_LOSE",
    name = "技能-失去",
    params = {
    },
}

---@alias EventParam.技能-交换 EventParam.ET_ABILITY_SWITCH
M.alias_map["技能-交换"] = {
    desc = "技能交换后触发",
    key = "ET_ABILITY_SWITCH",
    name = "技能-交换",
    params = {
    },
}

---@alias EventParam.技能-冷却结束 EventParam.ET_ABILITY_CD_END
M.alias_map["技能-冷却结束"] = {
    desc = "技能冷却结束后触发",
    key = "ET_ABILITY_CD_END",
    name = "技能-冷却结束",
    params = {
    },
}

---@alias EventParam.效果-获得 EventParam.ET_OBTAIN_MODIFIER
M.alias_map["效果-获得"] = {
    desc = "获得魔法效果后触发",
    key = "ET_OBTAIN_MODIFIER",
    name = "效果-获得",
    params = {
    },
}

---@alias EventParam.效果-失去 EventParam.ET_LOSS_MODIFIER
M.alias_map["效果-失去"] = {
    desc = "失去魔法效果后触发",
    key = "ET_LOSS_MODIFIER",
    name = "效果-失去",
    params = {
    },
}

---@alias EventParam.效果-心跳 EventParam.ET_MODIFIER_CYCLE_TRIGGER
M.alias_map["效果-心跳"] = {
    desc = "魔法效果的周期性触发",
    key = "ET_MODIFIER_CYCLE_TRIGGER",
    name = "效果-心跳",
    params = {
    },
}

---@alias EventParam.效果-叠加 EventParam.ET_MODIFIER_ADDTION
M.alias_map["效果-叠加"] = {
    desc = "魔法效果叠加时触发",
    key = "ET_MODIFIER_ADDTION",
    name = "效果-叠加",
    params = {
    },
}

---@alias EventParam.效果-层数变化 EventParam.ET_MODIFIER_LAYER_CHANGE
M.alias_map["效果-层数变化"] = {
    desc = "魔法效果层数变化时触发",
    key = "ET_MODIFIER_LAYER_CHANGE",
    name = "效果-层数变化",
    params = {
    },
}

---@alias EventParam.效果-即将获得 EventParam.ET_MODIFIER_GET_BEFORE_CREATE
M.alias_map["效果-即将获得"] = {
    desc = "魔法效果获得前触发",
    key = "ET_MODIFIER_GET_BEFORE_CREATE",
    name = "效果-即将获得",
    params = {
    },
}

---@alias EventParam.效果-覆盖 EventParam.ET_MODIFIER_BE_COVERED
M.alias_map["效果-覆盖"] = {
    desc = "魔法效果覆盖时触发",
    key = "ET_MODIFIER_BE_COVERED",
    name = "效果-覆盖",
    params = {
    },
}

---@alias EventParam.可破坏物-创建 EventParam.ET_DEST_CREATE_NEW
M.alias_map["可破坏物-创建"] = {
    desc = "可破坏物创建后触发",
    key = "ET_DEST_CREATE_NEW",
    name = "可破坏物-创建",
    params = {
    },
}

---@alias EventParam.可破坏物-死亡 EventParam.ET_DEST_DIE_NEW
M.alias_map["可破坏物-死亡"] = {
    desc = "可破坏物死亡后触发",
    key = "ET_DEST_DIE_NEW",
    name = "可破坏物-死亡",
    params = {
    },
}

---@alias EventParam.可破坏物-复活 EventParam.ET_DEST_REVIVE_NEW
M.alias_map["可破坏物-复活"] = {
    desc = "可破坏物复活后触发",
    key = "ET_DEST_REVIVE_NEW",
    name = "可破坏物-复活",
    params = {
    },
}

---@alias EventParam.可破坏物-资源变化 EventParam.ET_DEST_RES_CNT_CHG_NEW
M.alias_map["可破坏物-资源变化"] = {
    desc = "可破坏物存储的资源变化后触发",
    key = "ET_DEST_RES_CNT_CHG_NEW",
    name = "可破坏物-资源变化",
    params = {
    },
}

---@alias EventParam.可破坏物-采集 EventParam.ET_DEST_COLLECTED_NEW
M.alias_map["可破坏物-采集"] = {
    desc = "可破坏物被采集后触发",
    key = "ET_DEST_COLLECTED_NEW",
    name = "可破坏物-采集",
    params = {
    },
}

---@alias EventParam.可破坏物-受到伤害 EventParam.ET_GET_HURT_NEW
M.alias_map["可破坏物-受到伤害"] = {
    desc = "可破坏物受到伤害后触发",
    key = "ET_GET_HURT_NEW",
    name = "可破坏物-受到伤害",
    params = {
    },
}

---@alias EventParam.选中-可破坏物 EventParam.ET_SELECT_DEST
M.alias_map["选中-可破坏物"] = {
    desc = "玩家选中可破坏物被后触发",
    key = "ET_SELECT_DEST",
    name = "选中-可破坏物",
    params = {
    },
}

---@alias EventParam.可破坏物-移除 EventParam.ET_DEST_DELETE
M.alias_map["可破坏物-移除"] = {
    desc = "可破坏物被移除后触发",
    key = "ET_DEST_DELETE",
    name = "可破坏物-移除",
    params = {
    },
}

---@alias EventParam.投射物-创建 EventParam.ET_PRODUCE_PROJECTILE
M.alias_map["投射物-创建"] = {
    desc = "投射物创建后触发",
    key = "ET_PRODUCE_PROJECTILE",
    name = "投射物-创建",
    params = {
    },
}

---@alias EventParam.投射物-死亡 EventParam.ET_DEATH_PROJECTILE
M.alias_map["投射物-死亡"] = {
    desc = "投射物死亡后触发",
    key = "ET_DEATH_PROJECTILE",
    name = "投射物-死亡",
    params = {
    },
}

---@alias EventParam.界面-消息 EventParam.ET_TRIGGER_COMPONENT_EVENT
M.alias_map["界面-消息"] = {
    desc = "触发界面上标记的自定义事件后触发",
    key = "ET_TRIGGER_COMPONENT_EVENT",
    name = "界面-消息",
    params = {
        [1] = {
            desc = "自定义事件名称",
            name = "event_name",
            type = "string",
        },
    },
}

---@alias EventParam.键盘-按下 EventParam.ET_KEYBOARD_KEY_DOWN_EVENT
M.alias_map["键盘-按下"] = {
    desc = "键盘上的某个键按下时触发",
    key = "ET_KEYBOARD_KEY_DOWN_EVENT",
    name = "键盘-按下",
    params = {
        [1] = {
            desc = "按下的键",
            name = "key",
            type = "y3.Const.KeyboardKey",
        },
    },
}

---@alias EventParam.键盘-抬起 EventParam.ET_KEYBOARD_KEY_UP_EVENT
M.alias_map["键盘-抬起"] = {
    desc = "键盘上的某个键抬起时触发",
    key = "ET_KEYBOARD_KEY_UP_EVENT",
    name = "键盘-抬起",
    params = {
        [1] = {
            desc = "抬起的键",
            name = "key",
            type = "y3.Const.KeyboardKey",
        },
    },
}

---@alias EventParam.鼠标-按下 EventParam.ET_MOUSE_KEY_DOWN_EVENT
M.alias_map["鼠标-按下"] = {
    desc = "鼠标上的某个键按下时触发",
    key = "ET_MOUSE_KEY_DOWN_EVENT",
    name = "鼠标-按下",
    params = {
        [1] = {
            desc = "按下的键",
            name = "key",
            type = "y3.Const.MouseKey",
        },
    },
}

---@alias EventParam.鼠标-抬起 EventParam.ET_MOUSE_KEY_UP_EVENT
M.alias_map["鼠标-抬起"] = {
    desc = "鼠标上的某个键抬起时触发",
    key = "ET_MOUSE_KEY_UP_EVENT",
    name = "鼠标-抬起",
    params = {
        [1] = {
            desc = "抬起的键",
            name = "key",
            type = "y3.Const.MouseKey",
        },
    },
}

---@alias EventParam.鼠标-双击 EventParam.MOUSE_KEY_DB_CLICK_EVENT
M.alias_map["鼠标-双击"] = {
    desc = "鼠标上的某个键双击时触发",
    key = "MOUSE_KEY_DB_CLICK_EVENT",
    name = "鼠标-双击",
    params = {
        [1] = {
            desc = "双击的键",
            name = "key",
            type = "y3.Const.MouseKey",
        },
    },
}

---@alias EventParam.鼠标-按下单位 EventParam.MOUSE_KEY_DOWN_UNIT_EVENT
M.alias_map["鼠标-按下单位"] = {
    desc = "鼠标上的某个键对着单位按下时触发",
    key = "MOUSE_KEY_DOWN_UNIT_EVENT",
    name = "鼠标-按下单位",
    params = {
        [1] = {
            desc = "按下的键",
            name = "key",
            type = "y3.Const.MouseKey",
        },
    },
}

---@alias EventParam.鼠标-抬起单位 EventParam.MOUSE_KEY_UP_UNIT_EVENT
M.alias_map["鼠标-抬起单位"] = {
    desc = "鼠标上的某个键对着单位抬起时触发",
    key = "MOUSE_KEY_UP_UNIT_EVENT",
    name = "鼠标-抬起单位",
    params = {
        [1] = {
            desc = "抬起的键",
            name = "key",
            type = "y3.Const.MouseKey",
        },
    },
}

---@alias EventParam.鼠标-双击单位 EventParam.MOUSE_KEY_DB_CLICK_UNIT_EVENT
M.alias_map["鼠标-双击单位"] = {
    desc = "鼠标上的某个键对着单位双击时触发",
    key = "MOUSE_KEY_DB_CLICK_UNIT_EVENT",
    name = "鼠标-双击单位",
    params = {
        [1] = {
            desc = "双击的键",
            name = "key",
            type = "y3.Const.MouseKey",
        },
    },
}

---@alias EventParam.鼠标-移动 EventParam.MOUSE_MOVE_EVENT
M.alias_map["鼠标-移动"] = {
    desc = "鼠标移动时触发",
    key = "MOUSE_MOVE_EVENT",
    name = "鼠标-移动",
    params = {
    },
}

---@alias EventParam.鼠标-滚轮 EventParam.ET_MOUSE_WHEEL_EVENT
M.alias_map["鼠标-滚轮"] = {
    desc = "鼠标滚轮滚动时触发",
    key = "ET_MOUSE_WHEEL_EVENT",
    name = "鼠标-滚轮",
    params = {
        [1] = {
            name = "key",
            type = "y3.Const.MouseKey",
        },
    },
}

---@alias EventParam.选中-单位 EventParam.ET_SELECT_UNIT
M.alias_map["选中-单位"] = {
    desc = "玩家选中单位时触发",
    key = "ET_SELECT_UNIT",
    name = "选中-单位",
    params = {
    },
}

---@alias EventParam.选中-物品 EventParam.ET_SELECT_ITEM
M.alias_map["选中-物品"] = {
    desc = "物品被选中时触发",
    key = "ET_SELECT_ITEM",
    name = "选中-物品",
    params = {
    },
}

---@alias EventParam.鼠标-双击物品 EventParam.ET_DOUBLE_CLICK_ITEM
M.alias_map["鼠标-双击物品"] = {
    desc = "鼠标上左键双击物品时触发",
    key = "ET_DOUBLE_CLICK_ITEM",
    name = "鼠标-双击物品",
    params = {
    },
}

---@alias EventParam.鼠标-双击可破坏物 EventParam.ET_DOUBLE_CLICK_DEST
M.alias_map["鼠标-双击可破坏物"] = {
    desc = "鼠标上左键双击可破坏物时触发",
    key = "ET_DOUBLE_CLICK_DEST",
    name = "鼠标-双击可破坏物",
    params = {
    },
}

---@alias EventParam.选中-单位组 EventParam.ET_SELECT_UNIT_GROUP
M.alias_map["选中-单位组"] = {
    desc = "玩家选中单位组时触发",
    key = "ET_SELECT_UNIT_GROUP",
    name = "选中-单位组",
    params = {
    },
}

---@alias EventParam.技能-打开指示器 EventParam.ET_START_SKILL_POINTER
M.alias_map["技能-打开指示器"] = {
    desc = "技能的瞄准指示器显示时触发",
    key = "ET_START_SKILL_POINTER",
    name = "技能-打开指示器",
    params = {
    },
}

---@alias EventParam.技能-关闭指示器 EventParam.ET_STOP_SKILL_POINTER
M.alias_map["技能-关闭指示器"] = {
    desc = "技能的瞄准指示器消失时触发",
    key = "ET_STOP_SKILL_POINTER",
    name = "技能-关闭指示器",
    params = {
    },
}

---@alias EventParam.玩家-发送消息 EventParam.ET_CHAT_SEND_GM
M.alias_map["玩家-发送消息"] = {
    desc = "玩家发送任意消息时触发",
    key = "ET_CHAT_SEND_GM",
    name = "玩家-发送消息",
    params = {
    },
}

---@class Game
---@field event fun(self: self, event: "时间-经过", time: number, callback: fun(trg: Trigger, data: EventParam.时间-经过)): Trigger
---@field event fun(self: self, event: "时间-周期", time: number, callback: fun(trg: Trigger, data: EventParam.时间-周期)): Trigger
---@field event fun(self: self, event: "时间-周期帧", count: integer, callback: fun(trg: Trigger, data: EventParam.时间-周期帧)): Trigger
---@field event fun(self: self, event: "游戏-初始化", callback: fun(trg: Trigger, data: EventParam.游戏-初始化)): Trigger
---@field event fun(self: self, event: "游戏-暂停", callback: fun(trg: Trigger, data: EventParam.游戏-暂停)): Trigger
---@field event fun(self: self, event: "游戏-恢复", callback: fun(trg: Trigger, data: EventParam.游戏-恢复)): Trigger
---@field event fun(self: self, event: "区域-进入", area: Area, callback: fun(trg: Trigger, data: EventParam.区域-进入)): Trigger
---@field event fun(self: self, event: "区域-离开", area: Area, callback: fun(trg: Trigger, data: EventParam.区域-离开)): Trigger
---@field event fun(self: self, event: "玩家-加入游戏", player: Player, callback: fun(trg: Trigger, data: EventParam.玩家-加入游戏)): Trigger
---@field event fun(self: self, event: "玩家-掉线", player: Player, callback: fun(trg: Trigger, data: EventParam.玩家-掉线)): Trigger
---@field event fun(self: self, event: "玩家-使用平台道具", store_key: py.StoreKey, callback: fun(trg: Trigger, data: EventParam.玩家-使用平台道具)): Trigger
---@field event fun(self: self, event: "玩家-持有平台道具", store_key: py.StoreKey, callback: fun(trg: Trigger, data: EventParam.玩家-持有平台道具)): Trigger
---@field event fun(self: self, event: "玩家-属性变化", callback: fun(trg: Trigger, data: EventParam.玩家-属性变化)): Trigger
---@field event fun(self: self, event: "玩家-发送指定消息", msg: string, callback: fun(trg: Trigger, data: EventParam.玩家-发送指定消息)): Trigger
---@field event fun(self: self, event: "玩家-科技提升", callback: fun(trg: Trigger, data: EventParam.玩家-科技提升)): Trigger
---@field event fun(self: self, event: "玩家-科技降低", callback: fun(trg: Trigger, data: EventParam.玩家-科技降低)): Trigger
---@field event fun(self: self, event: "玩家-科技变化", callback: fun(trg: Trigger, data: EventParam.玩家-科技变化)): Trigger
---@field event fun(self: self, event: "单位-研发科技", callback: fun(trg: Trigger, data: EventParam.单位-研发科技)): Trigger
---@field event fun(self: self, event: "单位-获得科技", callback: fun(trg: Trigger, data: EventParam.单位-获得科技)): Trigger
---@field event fun(self: self, event: "单位-失去科技", callback: fun(trg: Trigger, data: EventParam.单位-失去科技)): Trigger
---@field event fun(self: self, event: "技能-建造完成", callback: fun(trg: Trigger, data: EventParam.技能-建造完成)): Trigger
---@field event fun(self: self, event: "技能-学习", callback: fun(trg: Trigger, data: EventParam.技能-学习)): Trigger
---@field event fun(self: self, event: "单位-开始移动", callback: fun(trg: Trigger, data: EventParam.单位-开始移动)): Trigger
---@field event fun(self: self, event: "单位-移除", callback: fun(trg: Trigger, data: EventParam.单位-移除)): Trigger
---@field event fun(self: self, event: "单位-即将死亡", callback: fun(trg: Trigger, data: EventParam.单位-即将死亡)): Trigger
---@field event fun(self: self, event: "单位-死亡", callback: fun(trg: Trigger, data: EventParam.单位-死亡)): Trigger
---@field event fun(self: self, event: "单位-受到伤害前", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害前)): Trigger
---@field event fun(self: self, event: "单位-造成伤害前", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害前)): Trigger
---@field event fun(self: self, event: "单位-受到伤害时", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害时)): Trigger
---@field event fun(self: self, event: "单位-造成伤害时", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害时)): Trigger
---@field event fun(self: self, event: "单位-造成伤害后", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害后)): Trigger
---@field event fun(self: self, event: "单位-受到伤害后", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害后)): Trigger
---@field event fun(self: self, event: "单位-受到治疗前", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗前)): Trigger
---@field event fun(self: self, event: "单位-受到治疗后", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗后)): Trigger
---@field event fun(self: self, event: "单位-受到治疗时", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗时)): Trigger
---@field event fun(self: self, event: "单位-施放技能", callback: fun(trg: Trigger, data: EventParam.单位-施放技能)): Trigger
---@field event fun(self: self, event: "单位-获得经验前", callback: fun(trg: Trigger, data: EventParam.单位-获得经验前)): Trigger
---@field event fun(self: self, event: "单位-获得经验后", callback: fun(trg: Trigger, data: EventParam.单位-获得经验后)): Trigger
---@field event fun(self: self, event: "单位-接收命令", callback: fun(trg: Trigger, data: EventParam.单位-接收命令)): Trigger
---@field event fun(self: self, event: "单位-击杀", callback: fun(trg: Trigger, data: EventParam.单位-击杀)): Trigger
---@field event fun(self: self, event: "单位-创建", callback: fun(trg: Trigger, data: EventParam.单位-创建)): Trigger
---@field event fun(self: self, event: "单位-进入战斗", callback: fun(trg: Trigger, data: EventParam.单位-进入战斗)): Trigger
---@field event fun(self: self, event: "单位-脱离战斗", callback: fun(trg: Trigger, data: EventParam.单位-脱离战斗)): Trigger
---@field event fun(self: self, event: "单位-购买物品", callback: fun(trg: Trigger, data: EventParam.单位-购买物品)): Trigger
---@field event fun(self: self, event: "单位-购买单位", callback: fun(trg: Trigger, data: EventParam.单位-购买单位)): Trigger
---@field event fun(self: self, event: "单位-出售物品", callback: fun(trg: Trigger, data: EventParam.单位-出售物品)): Trigger
---@field event fun(self: self, event: "单位-物品合成", callback: fun(trg: Trigger, data: EventParam.单位-物品合成)): Trigger
---@field event fun(self: self, event: "单位-购买物品合成", callback: fun(trg: Trigger, data: EventParam.单位-购买物品合成)): Trigger
---@field event fun(self: self, event: "单位-复活", callback: fun(trg: Trigger, data: EventParam.单位-复活)): Trigger
---@field event fun(self: self, event: "单位-升级", callback: fun(trg: Trigger, data: EventParam.单位-升级)): Trigger
---@field event fun(self: self, event: "单位-进入草丛", callback: fun(trg: Trigger, data: EventParam.单位-进入草丛)): Trigger
---@field event fun(self: self, event: "单位-离开草丛", callback: fun(trg: Trigger, data: EventParam.单位-离开草丛)): Trigger
---@field event fun(self: self, event: "单位-改变所属", callback: fun(trg: Trigger, data: EventParam.单位-改变所属)): Trigger
---@field event fun(self: self, event: "单位类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.单位类型-前置条件成立)): Trigger
---@field event fun(self: self, event: "单位类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.单位类型-前置条件不成立)): Trigger
---@field event fun(self: self, event: "物品类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.物品类型-前置条件成立)): Trigger
---@field event fun(self: self, event: "物品类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.物品类型-前置条件不成立)): Trigger
---@field event fun(self: self, event: "技能类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.技能类型-前置条件成立)): Trigger
---@field event fun(self: self, event: "技能类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.技能类型-前置条件不成立)): Trigger
---@field event fun(self: self, event: "科技类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.科技类型-前置条件成立)): Trigger
---@field event fun(self: self, event: "科技类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.科技类型-前置条件不成立)): Trigger
---@field event fun(self: self, event: "技能-升级", callback: fun(trg: Trigger, data: EventParam.技能-升级)): Trigger
---@field event fun(self: self, event: "施法-即将开始", callback: fun(trg: Trigger, data: EventParam.施法-即将开始)): Trigger
---@field event fun(self: self, event: "施法-开始", callback: fun(trg: Trigger, data: EventParam.施法-开始)): Trigger
---@field event fun(self: self, event: "施法-引导", callback: fun(trg: Trigger, data: EventParam.施法-引导)): Trigger
---@field event fun(self: self, event: "施法-出手", callback: fun(trg: Trigger, data: EventParam.施法-出手)): Trigger
---@field event fun(self: self, event: "施法-完成", callback: fun(trg: Trigger, data: EventParam.施法-完成)): Trigger
---@field event fun(self: self, event: "施法-结束", callback: fun(trg: Trigger, data: EventParam.施法-结束)): Trigger
---@field event fun(self: self, event: "施法-打断开始", callback: fun(trg: Trigger, data: EventParam.施法-打断开始)): Trigger
---@field event fun(self: self, event: "施法-打断引导", callback: fun(trg: Trigger, data: EventParam.施法-打断引导)): Trigger
---@field event fun(self: self, event: "施法-打断出手", callback: fun(trg: Trigger, data: EventParam.施法-打断出手)): Trigger
---@field event fun(self: self, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: self, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: self, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: self, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: self, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: self, event: "效果-获得", callback: fun(trg: Trigger, data: EventParam.效果-获得)): Trigger
---@field event fun(self: self, event: "效果-失去", callback: fun(trg: Trigger, data: EventParam.效果-失去)): Trigger
---@field event fun(self: self, event: "效果-心跳", callback: fun(trg: Trigger, data: EventParam.效果-心跳)): Trigger
---@field event fun(self: self, event: "效果-叠加", callback: fun(trg: Trigger, data: EventParam.效果-叠加)): Trigger
---@field event fun(self: self, event: "效果-层数变化", callback: fun(trg: Trigger, data: EventParam.效果-层数变化)): Trigger
---@field event fun(self: self, event: "效果-即将获得", callback: fun(trg: Trigger, data: EventParam.效果-即将获得)): Trigger
---@field event fun(self: self, event: "效果-覆盖", callback: fun(trg: Trigger, data: EventParam.效果-覆盖)): Trigger
---@field event fun(self: self, event: "可破坏物-创建", callback: fun(trg: Trigger, data: EventParam.可破坏物-创建)): Trigger
---@field event fun(self: self, event: "可破坏物-死亡", callback: fun(trg: Trigger, data: EventParam.可破坏物-死亡)): Trigger
---@field event fun(self: self, event: "可破坏物-复活", callback: fun(trg: Trigger, data: EventParam.可破坏物-复活)): Trigger
---@field event fun(self: self, event: "可破坏物-资源变化", callback: fun(trg: Trigger, data: EventParam.可破坏物-资源变化)): Trigger
---@field event fun(self: self, event: "可破坏物-采集", callback: fun(trg: Trigger, data: EventParam.可破坏物-采集)): Trigger
---@field event fun(self: self, event: "可破坏物-受到伤害", callback: fun(trg: Trigger, data: EventParam.可破坏物-受到伤害)): Trigger
---@field event fun(self: self, event: "选中-可破坏物", callback: fun(trg: Trigger, data: EventParam.选中-可破坏物)): Trigger
---@field event fun(self: self, event: "可破坏物-移除", callback: fun(trg: Trigger, data: EventParam.可破坏物-移除)): Trigger
---@field event fun(self: self, event: "投射物-创建", callback: fun(trg: Trigger, data: EventParam.投射物-创建)): Trigger
---@field event fun(self: self, event: "投射物-死亡", callback: fun(trg: Trigger, data: EventParam.投射物-死亡)): Trigger
---@field event fun(self: self, event: "界面-消息", event_name: string, callback: fun(trg: Trigger, data: EventParam.界面-消息)): Trigger
---@field event fun(self: self, event: "键盘-按下", key: y3.Const.KeyboardKey, callback: fun(trg: Trigger, data: EventParam.键盘-按下)): Trigger
---@field event fun(self: self, event: "键盘-抬起", key: y3.Const.KeyboardKey, callback: fun(trg: Trigger, data: EventParam.键盘-抬起)): Trigger
---@field event fun(self: self, event: "鼠标-按下", key: y3.Const.MouseKey, callback: fun(trg: Trigger, data: EventParam.鼠标-按下)): Trigger
---@field event fun(self: self, event: "鼠标-抬起", key: y3.Const.MouseKey, callback: fun(trg: Trigger, data: EventParam.鼠标-抬起)): Trigger
---@field event fun(self: self, event: "鼠标-双击", key: y3.Const.MouseKey, callback: fun(trg: Trigger, data: EventParam.鼠标-双击)): Trigger
---@field event fun(self: self, event: "鼠标-按下单位", key: y3.Const.MouseKey, callback: fun(trg: Trigger, data: EventParam.鼠标-按下单位)): Trigger
---@field event fun(self: self, event: "鼠标-抬起单位", key: y3.Const.MouseKey, callback: fun(trg: Trigger, data: EventParam.鼠标-抬起单位)): Trigger
---@field event fun(self: self, event: "鼠标-双击单位", key: y3.Const.MouseKey, callback: fun(trg: Trigger, data: EventParam.鼠标-双击单位)): Trigger
---@field event fun(self: self, event: "鼠标-移动", callback: fun(trg: Trigger, data: EventParam.鼠标-移动)): Trigger
---@field event fun(self: self, event: "鼠标-滚轮", key: y3.Const.MouseKey, callback: fun(trg: Trigger, data: EventParam.鼠标-滚轮)): Trigger
---@field event fun(self: self, event: "选中-单位", callback: fun(trg: Trigger, data: EventParam.选中-单位)): Trigger
---@field event fun(self: self, event: "选中-物品", callback: fun(trg: Trigger, data: EventParam.选中-物品)): Trigger
---@field event fun(self: self, event: "鼠标-双击物品", callback: fun(trg: Trigger, data: EventParam.鼠标-双击物品)): Trigger
---@field event fun(self: self, event: "鼠标-双击可破坏物", callback: fun(trg: Trigger, data: EventParam.鼠标-双击可破坏物)): Trigger
---@field event fun(self: self, event: "选中-单位组", callback: fun(trg: Trigger, data: EventParam.选中-单位组)): Trigger
---@field event fun(self: self, event: "技能-打开指示器", callback: fun(trg: Trigger, data: EventParam.技能-打开指示器)): Trigger
---@field event fun(self: self, event: "技能-关闭指示器", callback: fun(trg: Trigger, data: EventParam.技能-关闭指示器)): Trigger
---@field event fun(self: self, event: "玩家-发送消息", callback: fun(trg: Trigger, data: EventParam.玩家-发送消息)): Trigger

return M
