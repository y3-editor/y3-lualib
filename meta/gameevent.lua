-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class GameEvent
local M = {}

M.alias_map = {}

---@alias EventParam.时间-经过 EventParam.ET_TIMEOUT
M.alias_map["时间-经过"] = "ET_TIMEOUT"

---@alias EventParam.时间-周期 EventParam.ET_REPEAT_TIMEOUT
M.alias_map["时间-周期"] = "ET_REPEAT_TIMEOUT"

---@alias EventParam.时间-周期帧 EventParam.ET_REPEAT_TIMEOUT_BY_FRAME
M.alias_map["时间-周期帧"] = "ET_REPEAT_TIMEOUT_BY_FRAME"

---@alias EventParam.游戏-初始化 EventParam.ET_GAME_INIT
M.alias_map["游戏-初始化"] = "ET_GAME_INIT"

---@alias EventParam.游戏-暂停 EventParam.ET_GAME_PAUSE
M.alias_map["游戏-暂停"] = "ET_GAME_PAUSE"

---@alias EventParam.游戏-恢复 EventParam.ET_GAME_RESUME
M.alias_map["游戏-恢复"] = "ET_GAME_RESUME"

---@alias EventParam.区域-进入 EventParam.ET_AREA_ENTER
M.alias_map["区域-进入"] = "ET_AREA_ENTER"

---@alias EventParam.区域-离开 EventParam.ET_AREA_LEAVE
M.alias_map["区域-离开"] = "ET_AREA_LEAVE"

---@alias EventParam.玩家-加入游戏 EventParam.ET_ROLE_JOIN_BATTLE
M.alias_map["玩家-加入游戏"] = "ET_ROLE_JOIN_BATTLE"

---@alias EventParam.玩家-掉线 EventParam.ET_ROLE_LOSE_CONNECT
M.alias_map["玩家-掉线"] = "ET_ROLE_LOSE_CONNECT"

---@alias EventParam.玩家-使用平台道具 EventParam.ET_ROLE_USE_STORE_ITEM_END
M.alias_map["玩家-使用平台道具"] = "ET_ROLE_USE_STORE_ITEM_END"

---@alias EventParam.玩家-持有平台道具 EventParam.ET_ROLE_HOLD_STORE_ITEM
M.alias_map["玩家-持有平台道具"] = "ET_ROLE_HOLD_STORE_ITEM"

---@alias EventParam.玩家-属性变化 EventParam.ET_ROLE_RESOURCE_CHANGED
M.alias_map["玩家-属性变化"] = "ET_ROLE_RESOURCE_CHANGED"

---@alias EventParam.玩家-发送指定消息 EventParam.ET_ROLE_INPUT_MSG
M.alias_map["玩家-发送指定消息"] = "ET_ROLE_INPUT_MSG"

---@alias EventParam.玩家-科技提升 EventParam.ET_ROLE_TECH_UPGRADE
M.alias_map["玩家-科技提升"] = "ET_ROLE_TECH_UPGRADE"

---@alias EventParam.玩家-科技降低 EventParam.ET_ROLE_TECH_DOWNGRADE
M.alias_map["玩家-科技降低"] = "ET_ROLE_TECH_DOWNGRADE"

---@alias EventParam.玩家-科技变化 EventParam.ET_ROLE_TECH_CHANGED
M.alias_map["玩家-科技变化"] = "ET_ROLE_TECH_CHANGED"

---@alias EventParam.单位-研发科技 EventParam.ET_UNIT_UPGRADE_TECH
M.alias_map["单位-研发科技"] = "ET_UNIT_UPGRADE_TECH"

---@alias EventParam.单位-获得科技 EventParam.ET_UNIT_ADD_TECH
M.alias_map["单位-获得科技"] = "ET_UNIT_ADD_TECH"

---@alias EventParam.单位-失去科技 EventParam.ET_UNIT_REMOVE_TECH
M.alias_map["单位-失去科技"] = "ET_UNIT_REMOVE_TECH"

---@alias EventParam.技能-建造完成 EventParam.ET_ABILITY_BUILD_FINISH
M.alias_map["技能-建造完成"] = "ET_ABILITY_BUILD_FINISH"

---@alias EventParam.技能-升级 EventParam.ET_ABILITY_PLUS_POINT
M.alias_map["技能-升级"] = "ET_ABILITY_PLUS_POINT"

---@alias EventParam.单位-开始移动 EventParam.ET_UNIT_START_MOVE
M.alias_map["单位-开始移动"] = "ET_UNIT_START_MOVE"

---@alias EventParam.单位-移除 EventParam.ET_UNIT_REMOVE
M.alias_map["单位-移除"] = "ET_UNIT_REMOVE"

---@alias EventParam.单位-属性变化 EventParam.ET_UNIT_ATTR_CHANGE
M.alias_map["单位-属性变化"] = "ET_UNIT_ATTR_CHANGE"

---@alias EventParam.玩家-发送消息 EventParam.ET_CHAT_SEND_GM
M.alias_map["玩家-发送消息"] = "ET_CHAT_SEND_GM"

---@class Game
---@field event fun(self: self, event: "时间-经过", callback: fun(trg: Trigger, data: EventParam.时间-经过)): Trigger
---@field event fun(self: self, event: "时间-周期", callback: fun(trg: Trigger, data: EventParam.时间-周期)): Trigger
---@field event fun(self: self, event: "时间-周期帧", callback: fun(trg: Trigger, data: EventParam.时间-周期帧)): Trigger
---@field event fun(self: self, event: "游戏-初始化", callback: fun(trg: Trigger, data: EventParam.游戏-初始化)): Trigger
---@field event fun(self: self, event: "游戏-暂停", callback: fun(trg: Trigger, data: EventParam.游戏-暂停)): Trigger
---@field event fun(self: self, event: "游戏-恢复", callback: fun(trg: Trigger, data: EventParam.游戏-恢复)): Trigger
---@field event fun(self: self, event: "区域-进入", callback: fun(trg: Trigger, data: EventParam.区域-进入)): Trigger
---@field event fun(self: self, event: "区域-离开", callback: fun(trg: Trigger, data: EventParam.区域-离开)): Trigger
---@field event fun(self: self, event: "玩家-加入游戏", callback: fun(trg: Trigger, data: EventParam.玩家-加入游戏)): Trigger
---@field event fun(self: self, event: "玩家-掉线", callback: fun(trg: Trigger, data: EventParam.玩家-掉线)): Trigger
---@field event fun(self: self, event: "玩家-使用平台道具", callback: fun(trg: Trigger, data: EventParam.玩家-使用平台道具)): Trigger
---@field event fun(self: self, event: "玩家-持有平台道具", callback: fun(trg: Trigger, data: EventParam.玩家-持有平台道具)): Trigger
---@field event fun(self: self, event: "玩家-属性变化", callback: fun(trg: Trigger, data: EventParam.玩家-属性变化)): Trigger
---@field event fun(self: self, event: "玩家-发送指定消息", callback: fun(trg: Trigger, data: EventParam.玩家-发送指定消息)): Trigger
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
---@field event fun(self: self, event: "单位-属性变化", callback: fun(trg: Trigger, data: EventParam.单位-属性变化)): Trigger
---@field event fun(self: self, event: "玩家-发送消息", callback: fun(trg: Trigger, data: EventParam.玩家-发送消息)): Trigger

return M
