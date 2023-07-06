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

---@alias EventParam.技能-升级 EventParam.ET_ABILITY_PLUS_POINT
M.alias_map["技能-升级"] = {
    desc = "技能升级后触发",
    key = "ET_ABILITY_PLUS_POINT",
    name = "技能-升级",
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

---@alias EventParam.单位-属性变化 EventParam.ET_UNIT_ATTR_CHANGE
M.alias_map["单位-属性变化"] = {
    desc = "指定单位的指定属性变化后触发",
    key = "ET_UNIT_ATTR_CHANGE",
    name = "单位-属性变化",
    params = {
        [1] = {
            desc = "单位",
            name = "unit",
            type = "Unit",
        },
        [2] = {
            desc = "属性名",
            name = "attr",
            type = "string",
        },
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
---@field event fun(self: self, event: "技能-升级", callback: fun(trg: Trigger, data: EventParam.技能-升级)): Trigger
---@field event fun(self: self, event: "单位-开始移动", callback: fun(trg: Trigger, data: EventParam.单位-开始移动)): Trigger
---@field event fun(self: self, event: "单位-移除", callback: fun(trg: Trigger, data: EventParam.单位-移除)): Trigger
---@field event fun(self: self, event: "单位-属性变化", unit: Unit, attr: string, callback: fun(trg: Trigger, data: EventParam.单位-属性变化)): Trigger
---@field event fun(self: self, event: "玩家-发送消息", callback: fun(trg: Trigger, data: EventParam.玩家-发送消息)): Trigger

return M
