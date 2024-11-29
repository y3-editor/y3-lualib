-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class EventConfig
local M = {}

M.config = {}

---@alias EventParam.未知-ET_LOGIC_UNIT_DESTROY EventParam.ET_LOGIC_UNIT_DESTROY
M.config["未知-ET_LOGIC_UNIT_DESTROY"] = {
    _deprecated = true,
    desc = "ET_LOGIC_UNIT_DESTROY",
    key = "ET_LOGIC_UNIT_DESTROY",
    name = "未知-ET_LOGIC_UNIT_DESTROY",
    params = {
    },
}

---@alias EventParam.游戏-初始化 EventParam.ET_GAME_INIT
M.config["游戏-初始化"] = {
    desc = "游戏初始化时触发。",
    key = "ET_GAME_INIT",
    name = "游戏-初始化",
    params = {
    },
}

---@alias EventParam.游戏-追帧完成 EventParam.ET_RELAUNCH_FRAME_CATCHING_FINISHED
M.config["游戏-追帧完成"] = {
    desc = "",
    key = "ET_RELAUNCH_FRAME_CATCHING_FINISHED",
    name = "游戏-追帧完成",
    params = {
    },
}

---@alias EventParam.游戏-逻辑不同步 EventParam.ET_GAME_SNAPSHOT_MISMATCH
M.config["游戏-逻辑不同步"] = {
    desc = "",
    key = "ET_GAME_SNAPSHOT_MISMATCH",
    name = "游戏-逻辑不同步",
    params = {
    },
}

---@alias EventParam.游戏-地形预设加载完成 EventParam.ET_SCENE_PRESET_LOADING_FINISH
M.config["游戏-地形预设加载完成"] = {
    desc = "",
    key = "ET_SCENE_PRESET_LOADING_FINISH",
    name = "游戏-地形预设加载完成",
    params = {
    },
}

---@alias EventParam.未知-ET_RECV_TRIGGER EventParam.ET_RECV_TRIGGER
M.config["未知-ET_RECV_TRIGGER"] = {
    _deprecated = true,
    desc = "ET_RECV_TRIGGER",
    key = "ET_RECV_TRIGGER",
    name = "未知-ET_RECV_TRIGGER",
    params = {
    },
}

---@alias EventParam.游戏-结束 EventParam.ET_GAME_END
M.config["游戏-结束"] = {
    desc = "游戏结束时触发",
    key = "ET_GAME_END",
    name = "游戏-结束",
    params = {
    },
}

---@alias EventParam.游戏-暂停 EventParam.ET_GAME_PAUSE
M.config["游戏-暂停"] = {
    desc = "游戏暂停时触发",
    key = "ET_GAME_PAUSE",
    name = "游戏-暂停",
    params = {
    },
}

---@alias EventParam.游戏-恢复 EventParam.ET_GAME_RESUME
M.config["游戏-恢复"] = {
    desc = "游戏恢复时触发",
    key = "ET_GAME_RESUME",
    name = "游戏-恢复",
    params = {
    },
}

---@alias EventParam.未知-ET_EMPTY EventParam.ET_EMPTY
M.config["未知-ET_EMPTY"] = {
    _deprecated = true,
    desc = "ET_EMPTY",
    key = "ET_EMPTY",
    name = "未知-ET_EMPTY",
    params = {
    },
}

---@alias EventParam.未知-TIMER_TIMEOUT EventParam.TIMER_TIMEOUT
M.config["未知-TIMER_TIMEOUT"] = {
    _deprecated = true,
    desc = "TIMER_TIMEOUT",
    key = "TIMER_TIMEOUT",
    name = "未知-TIMER_TIMEOUT",
    params = {
    },
}

---@alias EventParam.游戏-昼夜变化 EventParam.ET_DAY_NIGHT_CHANGE
M.config["游戏-昼夜变化"] = {
    desc = "通过参数判断进入白天还是进入夜晚",
    key = "ET_DAY_NIGHT_CHANGE",
    name = "游戏-昼夜变化",
    params = {
    },
}

---@alias EventParam.未知-ET_CONTAINER_ADDED EventParam.ET_CONTAINER_ADDED
M.config["未知-ET_CONTAINER_ADDED"] = {
    _deprecated = true,
    desc = "ET_CONTAINER_ADDED",
    key = "ET_CONTAINER_ADDED",
    name = "未知-ET_CONTAINER_ADDED",
    params = {
    },
}

---@alias EventParam.未知-ET_CONTAINER_ACTOR_ADDED EventParam.ET_CONTAINER_ACTOR_ADDED
M.config["未知-ET_CONTAINER_ACTOR_ADDED"] = {
    _deprecated = true,
    desc = "ET_CONTAINER_ACTOR_ADDED",
    key = "ET_CONTAINER_ACTOR_ADDED",
    name = "未知-ET_CONTAINER_ACTOR_ADDED",
    params = {
    },
}

---@alias EventParam.未知-ET_CONTAINER_ACTOR_REMOVED EventParam.ET_CONTAINER_ACTOR_REMOVED
M.config["未知-ET_CONTAINER_ACTOR_REMOVED"] = {
    _deprecated = true,
    desc = "ET_CONTAINER_ACTOR_REMOVED",
    key = "ET_CONTAINER_ACTOR_REMOVED",
    name = "未知-ET_CONTAINER_ACTOR_REMOVED",
    params = {
    },
}

---@alias EventParam.未知-ET_ACTOR_ATTR_UPDATED EventParam.ET_ACTOR_ATTR_UPDATED
M.config["未知-ET_ACTOR_ATTR_UPDATED"] = {
    _deprecated = true,
    desc = "ET_ACTOR_ATTR_UPDATED",
    key = "ET_ACTOR_ATTR_UPDATED",
    name = "未知-ET_ACTOR_ATTR_UPDATED",
    params = {
    },
}

---@alias EventParam.区域-进入 EventParam.ET_AREA_ENTER
M.config["区域-进入"] = {
    desc = "任意单位进入区域时触发",
    key = "ET_AREA_ENTER",
    name = "区域-进入",
    object = "Area",
    params = {
        [1] = {
            call = true,
            desc = "区域",
            name = "area",
            type = "Area",
        },
    },
}

---@alias EventParam.区域-离开 EventParam.ET_AREA_LEAVE
M.config["区域-离开"] = {
    desc = "任意单位离开区域时触发",
    key = "ET_AREA_LEAVE",
    name = "区域-离开",
    object = "Area",
    params = {
        [1] = {
            call = true,
            desc = "区域",
            name = "area",
            type = "Area",
        },
    },
}

---@alias EventParam.游戏-http返回 EventParam.ET_HTTP_RESPONSE
M.config["游戏-http返回"] = {
    desc = "",
    key = "ET_HTTP_RESPONSE",
    name = "游戏-http返回",
    params = {
    },
}

---@alias EventParam.游戏-接收广播信息 EventParam.ET_BROADCAST_LUA_MSG
M.config["游戏-接收广播信息"] = {
    desc = "",
    key = "ET_BROADCAST_LUA_MSG",
    name = "游戏-接收广播信息",
    params = {
    },
}

---@alias EventParam.玩家-加入游戏 EventParam.ET_ROLE_JOIN_BATTLE
M.config["玩家-加入游戏"] = {
    desc = "玩家加入游戏时触发",
    key = "ET_ROLE_JOIN_BATTLE",
    name = "玩家-加入游戏",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-离开游戏 EventParam.ET_ROLE_ACTIVE_EXIT_GAME_EVENT
M.config["玩家-离开游戏"] = {
    desc = "玩家离开游戏时触发",
    key = "ET_ROLE_ACTIVE_EXIT_GAME_EVENT",
    name = "玩家-离开游戏",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-掉线 EventParam.ET_ROLE_LOSE_CONNECT
M.config["玩家-掉线"] = {
    desc = "玩家掉线时触发",
    key = "ET_ROLE_LOSE_CONNECT",
    name = "玩家-掉线",
    object = "Player",
    params = {
    },
}

---@alias EventParam.未知-ET_AI_TAKE_CONTROL EventParam.ET_AI_TAKE_CONTROL
M.config["未知-ET_AI_TAKE_CONTROL"] = {
    _deprecated = true,
    desc = "ET_AI_TAKE_CONTROL",
    key = "ET_AI_TAKE_CONTROL",
    name = "未知-ET_AI_TAKE_CONTROL",
    params = {
    },
}

---@alias EventParam.未知-ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK EventParam.ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK
M.config["未知-ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK"] = {
    _deprecated = true,
    desc = "ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK",
    key = "ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK",
    name = "未知-ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK",
    params = {
    },
}

---@alias EventParam.玩家-使用平台道具 EventParam.ET_ROLE_USE_STORE_ITEM_END
M.config["玩家-使用平台道具"] = {
    desc = "玩家使用平台道具时触发",
    key = "ET_ROLE_USE_STORE_ITEM_END",
    name = "玩家-使用平台道具",
    object = "Player",
    params = {
    },
}

---@alias EventParam.未知-ET_CONSUME_STORE_ITEM EventParam.ET_CONSUME_STORE_ITEM
M.config["未知-ET_CONSUME_STORE_ITEM"] = {
    _deprecated = true,
    desc = "ET_CONSUME_STORE_ITEM",
    key = "ET_CONSUME_STORE_ITEM",
    name = "未知-ET_CONSUME_STORE_ITEM",
    params = {
    },
}

---@alias EventParam.玩家-持有平台道具 EventParam.ET_ROLE_HOLD_STORE_ITEM
M.config["玩家-持有平台道具"] = {
    desc = "玩家进入游戏时如果持有指定平台道具会触发",
    key = "ET_ROLE_HOLD_STORE_ITEM",
    name = "玩家-持有平台道具",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-属性变化 EventParam.ET_ROLE_RESOURCE_CHANGED
M.config["玩家-属性变化"] = {
    desc = "玩家属性变化时触发",
    key = "ET_ROLE_RESOURCE_CHANGED",
    name = "玩家-属性变化",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-发送指定消息 EventParam.ET_ROLE_INPUT_MSG
M.config["玩家-发送指定消息"] = {
    desc = "玩家发送指定消息时触发",
    from_global = true,
    key = "ET_ROLE_INPUT_MSG",
    name = "玩家-发送指定消息",
    object = "Player",
    params = {
        [1] = {
            desc = "消息内容",
            name = "msg",
            type = "string",
        },
    },
}

---@alias EventParam.未知-ET_ROLE_INPUT_ACTIVATION_CODE EventParam.ET_ROLE_INPUT_ACTIVATION_CODE
M.config["未知-ET_ROLE_INPUT_ACTIVATION_CODE"] = {
    _deprecated = true,
    desc = "ET_ROLE_INPUT_ACTIVATION_CODE",
    key = "ET_ROLE_INPUT_ACTIVATION_CODE",
    name = "未知-ET_ROLE_INPUT_ACTIVATION_CODE",
    params = {
    },
}

---@alias EventParam.玩家-科技提升 EventParam.ET_ROLE_TECH_UPGRADE
M.config["玩家-科技提升"] = {
    desc = "玩家科技每提升一级都会触发一次",
    key = "ET_ROLE_TECH_UPGRADE",
    name = "玩家-科技提升",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-科技降低 EventParam.ET_ROLE_TECH_DOWNGRADE
M.config["玩家-科技降低"] = {
    desc = "玩家科技每降低一级都会触发一次",
    key = "ET_ROLE_TECH_DOWNGRADE",
    name = "玩家-科技降低",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-科技变化 EventParam.ET_ROLE_TECH_CHANGED
M.config["玩家-科技变化"] = {
    desc = "玩家科技变化时触发，一次变化多个等级也只会触发一次",
    key = "ET_ROLE_TECH_CHANGED",
    name = "玩家-科技变化",
    object = "Player",
    params = {
    },
}

---@alias EventParam.单位-研发科技 EventParam.ET_UNIT_UPGRADE_TECH
M.config["单位-研发科技"] = {
    desc = "单位研发科技时触发",
    key = "ET_UNIT_UPGRADE_TECH",
    name = "单位-研发科技",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-获得科技 EventParam.ET_UNIT_ADD_TECH
M.config["单位-获得科技"] = {
    desc = "单位获得科技时触发",
    key = "ET_UNIT_ADD_TECH",
    name = "单位-获得科技",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-失去科技 EventParam.ET_UNIT_REMOVE_TECH
M.config["单位-失去科技"] = {
    desc = "单位失去科技时触发",
    key = "ET_UNIT_REMOVE_TECH",
    name = "单位-失去科技",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.玩家-关系变化 EventParam.ET_ROLE_CHANGE_RELATION
M.config["玩家-关系变化"] = {
    desc = "玩家之间的关系改变时触发",
    key = "ET_ROLE_CHANGE_RELATION",
    name = "玩家-关系变化",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-重连 EventParam.ET_ROLE_RECONNECT
M.config["玩家-重连"] = {
    desc = "玩家重连时触发",
    key = "ET_ROLE_RECONNECT",
    name = "玩家-重连",
    object = "Player",
    params = {
    },
}

---@alias EventParam.单位-建筑升级开始 EventParam.ET_UNIT_BUILD_UPGRADE_START
M.config["单位-建筑升级开始"] = {
    desc = "",
    key = "ET_UNIT_BUILD_UPGRADE_START",
    name = "单位-建筑升级开始",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-建筑升级取消 EventParam.ET_UNIT_BUILD_UPGRADE_CANCEL
M.config["单位-建筑升级取消"] = {
    desc = "",
    key = "ET_UNIT_BUILD_UPGRADE_CANCEL",
    name = "单位-建筑升级取消",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-建筑升级完成 EventParam.ET_UNIT_BUILD_UPGRADE_FINISH
M.config["单位-建筑升级完成"] = {
    desc = "",
    key = "ET_UNIT_BUILD_UPGRADE_FINISH",
    name = "单位-建筑升级完成",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-建造开始 EventParam.ET_UNIT_CONSTRUCT_START
M.config["单位-建造开始"] = {
    desc = "",
    key = "ET_UNIT_CONSTRUCT_START",
    name = "单位-建造开始",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-建造取消 EventParam.ET_UNIT_CONSTRUCT_CANCEL
M.config["单位-建造取消"] = {
    desc = "",
    key = "ET_UNIT_CONSTRUCT_CANCEL",
    name = "单位-建造取消",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-建造完成 EventParam.ET_UNIT_CONSTRUCT_FINISH
M.config["单位-建造完成"] = {
    desc = "",
    key = "ET_UNIT_CONSTRUCT_FINISH",
    name = "单位-建造完成",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.技能-建造完成 EventParam.ET_ABILITY_BUILD_FINISH
M.config["技能-建造完成"] = {
    desc = "通过建造类技能建造完成时触发，可以获取到被建造出来的单位",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_BUILD_FINISH",
    name = "技能-建造完成",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.单位-普攻命中 EventParam.ET_ATTACK_HIT_TARGET
M.config["单位-普攻命中"] = {
    _deprecated = true,
    desc = "",
    key = "ET_ATTACK_HIT_TARGET",
    name = "单位-普攻命中",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-普攻造成伤害 EventParam.ET_ATTACK_HURT
M.config["单位-普攻造成伤害"] = {
    _deprecated = true,
    desc = "",
    key = "ET_ATTACK_HURT",
    name = "单位-普攻造成伤害",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_ACTIVE_ABILITY_CHANGED EventParam.ET_ACTIVE_ABILITY_CHANGED
M.config["未知-ET_ACTIVE_ABILITY_CHANGED"] = {
    _deprecated = true,
    desc = "ET_ACTIVE_ABILITY_CHANGED",
    key = "ET_ACTIVE_ABILITY_CHANGED",
    name = "未知-ET_ACTIVE_ABILITY_CHANGED",
    params = {
    },
}

---@alias EventParam.技能-学习 EventParam.ET_ABILITY_PLUS_POINT
M.config["技能-学习"] = {
    desc = "学习技能后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_PLUS_POINT",
    name = "技能-学习",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-可用状态变化 EventParam.ET_ABILITY_FORBIDDEN_CHANGED
M.config["技能-可用状态变化"] = {
    desc = "",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_FORBIDDEN_CHANGED",
    name = "技能-可用状态变化",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-沉默状态变化 EventParam.ET_ABILITY_SILENT_CHANGED
M.config["技能-沉默状态变化"] = {
    desc = "",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_SILENT_CHANGED",
    name = "技能-沉默状态变化",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-图标变化 EventParam.ET_ABILITY_ICON_CHANGED
M.config["技能-图标变化"] = {
    desc = "",
    key = "ET_ABILITY_ICON_CHANGED",
    name = "技能-图标变化",
    params = {
    },
}

---@alias EventParam.单位-名称变化 EventParam.ET_UNIT_NAME_CHANGE
M.config["单位-名称变化"] = {
    desc = "",
    key = "ET_UNIT_NAME_CHANGE",
    name = "单位-名称变化",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-小地图图标变化 EventParam.ET_UNIT_CHANGE_MINI_MAP_ICON
M.config["单位-小地图图标变化"] = {
    desc = "",
    key = "ET_UNIT_CHANGE_MINI_MAP_ICON",
    name = "单位-小地图图标变化",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-头像变化 EventParam.ET_UNIT_ICON_CHANGE
M.config["单位-头像变化"] = {
    desc = "",
    key = "ET_UNIT_ICON_CHANGE",
    name = "单位-头像变化",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_ROLE_UNIT_CHANGE EventParam.ET_ROLE_UNIT_CHANGE
M.config["未知-ET_ROLE_UNIT_CHANGE"] = {
    _deprecated = true,
    desc = "ET_ROLE_UNIT_CHANGE",
    key = "ET_ROLE_UNIT_CHANGE",
    name = "未知-ET_ROLE_UNIT_CHANGE",
    params = {
    },
}

---@alias EventParam.未知-ET_ROLE_UNIT_TAG_CHANGE EventParam.ET_ROLE_UNIT_TAG_CHANGE
M.config["未知-ET_ROLE_UNIT_TAG_CHANGE"] = {
    _deprecated = true,
    desc = "ET_ROLE_UNIT_TAG_CHANGE",
    key = "ET_ROLE_UNIT_TAG_CHANGE",
    name = "未知-ET_ROLE_UNIT_TAG_CHANGE",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_ENTER_MOVER_STATE EventParam.ET_UNIT_ENTER_MOVER_STATE
M.config["未知-ET_UNIT_ENTER_MOVER_STATE"] = {
    _deprecated = true,
    desc = "ET_UNIT_ENTER_MOVER_STATE",
    key = "ET_UNIT_ENTER_MOVER_STATE",
    name = "未知-ET_UNIT_ENTER_MOVER_STATE",
    params = {
    },
}

---@alias EventParam.单位-移除 EventParam.ET_UNIT_REMOVE
M.config["单位-移除"] = {
    desc = "单位被移除后触发",
    key = "ET_UNIT_REMOVE",
    name = "单位-移除",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-移除后 EventParam.ET_UNIT_DELETE
M.config["单位-移除后"] = {
    desc = "",
    key = "ET_UNIT_DELETE",
    name = "单位-移除后",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-传送结束 EventParam.ET_UNIT_END_TRANSLATE
M.config["单位-传送结束"] = {
    desc = "",
    key = "ET_UNIT_END_TRANSLATE",
    name = "单位-传送结束",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-属性变化 EventParam.ET_UNIT_ATTR_CHANGE
M.config["单位-属性变化"] = {
    desc = "指定单位的指定属性变化后触发",
    key = "ET_UNIT_ATTR_CHANGE",
    name = "单位-属性变化",
    object = "Unit",
    params = {
        [1] = {
            call = true,
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

---@alias EventParam.单位-即将死亡 EventParam.ET_BEFORE_UNIT_DIE
M.config["单位-即将死亡"] = {
    desc = "单位死亡前触发",
    dispatch = true,
    key = "ET_BEFORE_UNIT_DIE",
    master = "target_unit",
    name = "单位-即将死亡",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-死亡 EventParam.ET_UNIT_DIE
M.config["单位-死亡"] = {
    desc = "单位死亡后触发",
    key = "ET_UNIT_DIE",
    master = "unit",
    name = "单位-死亡",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_ON_UNBIND_ROLE EventParam.ET_UNIT_ON_UNBIND_ROLE
M.config["未知-ET_UNIT_ON_UNBIND_ROLE"] = {
    _deprecated = true,
    desc = "ET_UNIT_ON_UNBIND_ROLE",
    key = "ET_UNIT_ON_UNBIND_ROLE",
    name = "未知-ET_UNIT_ON_UNBIND_ROLE",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_ON_BIND_ROLE EventParam.ET_UNIT_ON_BIND_ROLE
M.config["未知-ET_UNIT_ON_BIND_ROLE"] = {
    _deprecated = true,
    desc = "ET_UNIT_ON_BIND_ROLE",
    key = "ET_UNIT_ON_BIND_ROLE",
    name = "未知-ET_UNIT_ON_BIND_ROLE",
    params = {
    },
}

---@alias EventParam.单位-受到伤害前 EventParam.ET_UNIT_BE_HURT
M.config["单位-受到伤害前"] = {
    desc = "在其他计算前触发，可以修改闪避",
    dispatch = true,
    key = "ET_UNIT_BE_HURT",
    master = "target_unit",
    name = "单位-受到伤害前",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-造成伤害前 EventParam.ET_UNIT_HURT_OTHER
M.config["单位-造成伤害前"] = {
    desc = "在其他计算前触发，可以修改闪避",
    dispatch = true,
    key = "ET_UNIT_HURT_OTHER",
    name = "单位-造成伤害前",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-受到伤害时 EventParam.ET_UNIT_BE_HURT_BEFORE_APPLY
M.config["单位-受到伤害时"] = {
    desc = "可以修改伤害值",
    dispatch = true,
    key = "ET_UNIT_BE_HURT_BEFORE_APPLY",
    master = "target_unit",
    name = "单位-受到伤害时",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-造成伤害时 EventParam.ET_UNIT_HURT_OTHER_BEFORE_APPLY
M.config["单位-造成伤害时"] = {
    desc = "可以修改伤害值",
    dispatch = true,
    key = "ET_UNIT_HURT_OTHER_BEFORE_APPLY",
    name = "单位-造成伤害时",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-造成伤害后 EventParam.ET_UNIT_HURT_OTHER_FINISH
M.config["单位-造成伤害后"] = {
    desc = "伤害已结算，只能获取伤害值",
    key = "ET_UNIT_HURT_OTHER_FINISH",
    name = "单位-造成伤害后",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-受到伤害后 EventParam.ET_UNIT_BE_HURT_COMPLETE
M.config["单位-受到伤害后"] = {
    desc = "伤害已结算，只能获取伤害值",
    key = "ET_UNIT_BE_HURT_COMPLETE",
    master = "target_unit",
    name = "单位-受到伤害后",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-受到治疗前 EventParam.ET_UNIT_GET_CURE_BEFORE_APPLY
M.config["单位-受到治疗前"] = {
    desc = "可在其他计算前触发，可以修改有效性",
    dispatch = true,
    key = "ET_UNIT_GET_CURE_BEFORE_APPLY",
    name = "单位-受到治疗前",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-受到治疗后 EventParam.ET_UNIT_GET_CURE_FINISH
M.config["单位-受到治疗后"] = {
    desc = "治疗已结算，只能获取治疗值",
    key = "ET_UNIT_GET_CURE_FINISH",
    name = "单位-受到治疗后",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-受到治疗时 EventParam.ET_UNIT_GET_CURE
M.config["单位-受到治疗时"] = {
    desc = "可以修改治疗值",
    dispatch = true,
    key = "ET_UNIT_GET_CURE",
    name = "单位-受到治疗时",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.玩家-属性图标变化 EventParam.ET_RES_ICON_CHANGED
M.config["玩家-属性图标变化"] = {
    desc = "",
    key = "ET_RES_ICON_CHANGED",
    name = "玩家-属性图标变化",
    params = {
    },
}

---@alias EventParam.单位-施放技能 EventParam.ET_UNIT_RELEASE_ABILITY
M.config["单位-施放技能"] = {
    desc = "单位施放技能时触发",
    key = "ET_UNIT_RELEASE_ABILITY",
    name = "单位-施放技能",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_RELEASE_ABILITY_START EventParam.ET_UNIT_RELEASE_ABILITY_START
M.config["未知-ET_UNIT_RELEASE_ABILITY_START"] = {
    _deprecated = true,
    desc = "ET_UNIT_RELEASE_ABILITY_START",
    key = "ET_UNIT_RELEASE_ABILITY_START",
    name = "未知-ET_UNIT_RELEASE_ABILITY_START",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_RELEASE_ABILITY_END EventParam.ET_UNIT_RELEASE_ABILITY_END
M.config["未知-ET_UNIT_RELEASE_ABILITY_END"] = {
    _deprecated = true,
    desc = "ET_UNIT_RELEASE_ABILITY_END",
    key = "ET_UNIT_RELEASE_ABILITY_END",
    name = "未知-ET_UNIT_RELEASE_ABILITY_END",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_RELEASE_MAGIC_BOOK EventParam.ET_UNIT_RELEASE_MAGIC_BOOK
M.config["未知-ET_UNIT_RELEASE_MAGIC_BOOK"] = {
    _deprecated = true,
    desc = "ET_UNIT_RELEASE_MAGIC_BOOK",
    key = "ET_UNIT_RELEASE_MAGIC_BOOK",
    name = "未知-ET_UNIT_RELEASE_MAGIC_BOOK",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_LEVEL_CHANGE EventParam.ET_UNIT_LEVEL_CHANGE
M.config["未知-ET_UNIT_LEVEL_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_LEVEL_CHANGE",
    key = "ET_UNIT_LEVEL_CHANGE",
    name = "未知-ET_UNIT_LEVEL_CHANGE",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_EXP_CHANGE EventParam.ET_UNIT_EXP_CHANGE
M.config["未知-ET_UNIT_EXP_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_EXP_CHANGE",
    key = "ET_UNIT_EXP_CHANGE",
    name = "未知-ET_UNIT_EXP_CHANGE",
    params = {
    },
}

---@alias EventParam.单位-获得经验前 EventParam.ET_UNIT_PRE_ADD_EXP
M.config["单位-获得经验前"] = {
    desc = "单位获得经验前触发",
    dispatch = true,
    key = "ET_UNIT_PRE_ADD_EXP",
    name = "单位-获得经验前",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-获得经验后 EventParam.ET_UNIT_ON_ADD_EXP
M.config["单位-获得经验后"] = {
    desc = "单位获得经验后触发",
    key = "ET_UNIT_ON_ADD_EXP",
    name = "单位-获得经验后",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-接收命令 EventParam.ET_UNIT_ON_COMMAND
M.config["单位-接收命令"] = {
    desc = "接收到命令时触发，如果命令有目标会根据目标类型存到不同的字段里",
    key = "ET_UNIT_ON_COMMAND",
    name = "单位-接收命令",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-击杀 EventParam.ET_KILL_UNIT
M.config["单位-击杀"] = {
    desc = "单位击杀其他单位时触发",
    key = "ET_KILL_UNIT",
    name = "单位-击杀",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-创建 EventParam.ET_UNIT_BORN
M.config["单位-创建"] = {
    desc = "单位被创建后触发",
    key = "ET_UNIT_BORN",
    name = "单位-创建",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-进入战斗 EventParam.ET_UNIT_ENTER_BATTLE
M.config["单位-进入战斗"] = {
    desc = "单位进入战斗时触发",
    key = "ET_UNIT_ENTER_BATTLE",
    name = "单位-进入战斗",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-脱离战斗 EventParam.ET_UNIT_EXIT_BATTLE
M.config["单位-脱离战斗"] = {
    desc = "单位离开战斗时触发",
    key = "ET_UNIT_EXIT_BATTLE",
    name = "单位-脱离战斗",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_CREATE_SLAVE EventParam.ET_UNIT_CREATE_SLAVE
M.config["未知-ET_UNIT_CREATE_SLAVE"] = {
    _deprecated = true,
    desc = "ET_UNIT_CREATE_SLAVE",
    key = "ET_UNIT_CREATE_SLAVE",
    name = "未知-ET_UNIT_CREATE_SLAVE",
    params = {
    },
}

---@alias EventParam.单位-即将拾取物品 EventParam.ET_UNIT_TRY_PICK_ITEM_NEW
M.config["单位-即将拾取物品"] = {
    desc = "",
    key = "ET_UNIT_TRY_PICK_ITEM_NEW",
    name = "单位-即将拾取物品",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-即将索敌 EventParam.ET_UNIT_TRY_ACQUIRE_TARGET
M.config["单位-即将索敌"] = {
    desc = "",
    key = "ET_UNIT_TRY_ACQUIRE_TARGET",
    name = "单位-即将索敌",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-发现目标 EventParam.ET_UNIT_ACQUIRED_TARGET
M.config["单位-发现目标"] = {
    desc = "",
    key = "ET_UNIT_ACQUIRED_TARGET",
    name = "单位-发现目标",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.本地-骨骼碰撞 EventParam.ET_DETECT_BONE_COLLISON
M.config["本地-骨骼碰撞"] = {
    desc = "骨骼碰撞时触发",
    key = "ET_DETECT_BONE_COLLISON",
    name = "本地-骨骼碰撞",
    params = {
    },
}

---@alias EventParam.物理-骨骼碰撞 EventParam.ET_DETECT_BONE_COLLISON
M.config["物理-骨骼碰撞"] = {
    desc = "骨骼碰撞时触发",
    key = "ET_DETECT_BONE_COLLISON",
    name = "物理-骨骼碰撞",
    params = {
    },
}

---@alias EventParam.未知-ET_ITEM_ATTACHED_ATTR_CHANGED EventParam.ET_ITEM_ATTACHED_ATTR_CHANGED
M.config["未知-ET_ITEM_ATTACHED_ATTR_CHANGED"] = {
    _deprecated = true,
    desc = "ET_ITEM_ATTACHED_ATTR_CHANGED",
    key = "ET_ITEM_ATTACHED_ATTR_CHANGED",
    name = "未知-ET_ITEM_ATTACHED_ATTR_CHANGED",
    params = {
    },
}

---@alias EventParam.单位-购买物品 EventParam.ET_UNIT_SHOP_BUY_ITEM
M.config["单位-购买物品"] = {
    desc = "购买物品时触发",
    key = "ET_UNIT_SHOP_BUY_ITEM",
    name = "单位-购买物品",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-购买单位 EventParam.ET_UNIT_SHOP_BUY_UNIT
M.config["单位-购买单位"] = {
    desc = "购买单位时触发",
    key = "ET_UNIT_SHOP_BUY_UNIT",
    name = "单位-购买单位",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-出售物品 EventParam.ET_UNIT_ITEM_SELL
M.config["单位-出售物品"] = {
    desc = "出售物品时触发",
    key = "ET_UNIT_ITEM_SELL",
    name = "单位-出售物品",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.商店-商品变化 EventParam.ET_SHOP_ITEM_CHANGED
M.config["商店-商品变化"] = {
    desc = "",
    key = "ET_SHOP_ITEM_CHANGED",
    name = "商店-商品变化",
    params = {
    },
}

---@alias EventParam.商店-库存变化 EventParam.ET_SHOP_STOCK_CHANGED
M.config["商店-库存变化"] = {
    desc = "",
    key = "ET_SHOP_STOCK_CHANGED",
    name = "商店-库存变化",
    params = {
    },
}

---@alias EventParam.商店-售价变化 EventParam.ET_SHOP_RES_COST_CHANGED
M.config["商店-售价变化"] = {
    desc = "",
    key = "ET_SHOP_RES_COST_CHANGED",
    name = "商店-售价变化",
    params = {
    },
}

---@alias EventParam.单位-物品合成 EventParam.ET_UNIT_ITEM_COMPOSE
M.config["单位-物品合成"] = {
    desc = "物品合成时触发",
    key = "ET_UNIT_ITEM_COMPOSE",
    name = "单位-物品合成",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-购买物品合成 EventParam.ET_UNIT_SHOP_BUY_WITH_COMPOSE
M.config["单位-购买物品合成"] = {
    desc = "购买物品合成时触发",
    key = "ET_UNIT_SHOP_BUY_WITH_COMPOSE",
    name = "单位-购买物品合成",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-复活 EventParam.ET_REVIVE_UNIT
M.config["单位-复活"] = {
    desc = "单位复活后触发",
    key = "ET_REVIVE_UNIT",
    name = "单位-复活",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-升级 EventParam.ET_UPGRADE_UNIT
M.config["单位-升级"] = {
    desc = "单位升级后触发",
    key = "ET_UPGRADE_UNIT",
    name = "单位-升级",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_REACH_MOVE_TARGET_UNIT EventParam.ET_REACH_MOVE_TARGET_UNIT
M.config["未知-ET_REACH_MOVE_TARGET_UNIT"] = {
    _deprecated = true,
    desc = "ET_REACH_MOVE_TARGET_UNIT",
    key = "ET_REACH_MOVE_TARGET_UNIT",
    name = "未知-ET_REACH_MOVE_TARGET_UNIT",
    params = {
    },
}

---@alias EventParam.未知-ET_COLLIDE_OBSTACLE_UNIT EventParam.ET_COLLIDE_OBSTACLE_UNIT
M.config["未知-ET_COLLIDE_OBSTACLE_UNIT"] = {
    _deprecated = true,
    desc = "ET_COLLIDE_OBSTACLE_UNIT",
    key = "ET_COLLIDE_OBSTACLE_UNIT",
    name = "未知-ET_COLLIDE_OBSTACLE_UNIT",
    params = {
    },
}

---@alias EventParam.单位-进入草丛 EventParam.ET_UNIT_ENTER_GRASS
M.config["单位-进入草丛"] = {
    desc = "单位进入草丛时触发",
    key = "ET_UNIT_ENTER_GRASS",
    name = "单位-进入草丛",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-离开草丛 EventParam.ET_UNIT_LEAVE_GRASS
M.config["单位-离开草丛"] = {
    desc = "单位离开草丛时触发",
    key = "ET_UNIT_LEAVE_GRASS",
    name = "单位-离开草丛",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_MAP_VISIBILITY_CHANGE EventParam.ET_MAP_VISIBILITY_CHANGE
M.config["未知-ET_MAP_VISIBILITY_CHANGE"] = {
    _deprecated = true,
    desc = "ET_MAP_VISIBILITY_CHANGE",
    key = "ET_MAP_VISIBILITY_CHANGE",
    name = "未知-ET_MAP_VISIBILITY_CHANGE",
    params = {
    },
}

---@alias EventParam.单位-改变所属 EventParam.ET_UNIT_ROLE_CHANGED
M.config["单位-改变所属"] = {
    desc = "单位的所有者玩家发生变化时触发",
    key = "ET_UNIT_ROLE_CHANGED",
    name = "单位-改变所属",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_KV_CHANGE EventParam.ET_UNIT_KV_CHANGE
M.config["未知-ET_UNIT_KV_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_KV_CHANGE",
    key = "ET_UNIT_KV_CHANGE",
    name = "未知-ET_UNIT_KV_CHANGE",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_MUL_KV_CHANGE EventParam.ET_UNIT_MUL_KV_CHANGE
M.config["未知-ET_UNIT_MUL_KV_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_MUL_KV_CHANGE",
    key = "ET_UNIT_MUL_KV_CHANGE",
    name = "未知-ET_UNIT_MUL_KV_CHANGE",
    params = {
    },
}

---@alias EventParam.单位类型-前置条件成立 EventParam.ET_UNIT_PRECONDITION_SUCCEED
M.config["单位类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_UNIT_PRECONDITION_SUCCEED",
    name = "单位类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.单位类型-前置条件不成立 EventParam.ET_UNIT_PRECONDITION_FAILED
M.config["单位类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_UNIT_PRECONDITION_FAILED",
    name = "单位类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.物品类型-前置条件成立 EventParam.ET_ITEM_PRECONDITION_SUCCEED
M.config["物品类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_ITEM_PRECONDITION_SUCCEED",
    name = "物品类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.物品类型-前置条件不成立 EventParam.ET_ITEM_PRECONDITION_FAILED
M.config["物品类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_ITEM_PRECONDITION_FAILED",
    name = "物品类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.技能类型-前置条件成立 EventParam.ET_ABILITY_PRECONDITION_SUCCEED
M.config["技能类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_PRECONDITION_SUCCEED",
    name = "技能类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.技能类型-前置条件不成立 EventParam.ET_ABILITY_PRECONDITION_FAILED
M.config["技能类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_PRECONDITION_FAILED",
    name = "技能类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.科技类型-前置条件成立 EventParam.ET_TECH_PRECONDITION_SUCCEED
M.config["科技类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_TECH_PRECONDITION_SUCCEED",
    name = "科技类型-前置条件成立",
    params = {
    },
}

---@alias EventParam.科技类型-前置条件不成立 EventParam.ET_TECH_PRECONDITION_FAILED
M.config["科技类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_TECH_PRECONDITION_FAILED",
    name = "科技类型-前置条件不成立",
    params = {
    },
}

---@alias EventParam.技能-升级 EventParam.ET_ABILITY_UPGRADE
M.config["技能-升级"] = {
    desc = "技能升级后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_UPGRADE",
    name = "技能-升级",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.施法-即将开始 EventParam.ET_ABILITY_CS_START
M.config["施法-即将开始"] = {
    desc = "即将施法时触发",
    dispatch = true,
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_CS_START",
    name = "施法-即将开始",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.未知-ET_ABILITY_CS_END EventParam.ET_ABILITY_CS_END
M.config["未知-ET_ABILITY_CS_END"] = {
    _deprecated = true,
    desc = "ET_ABILITY_CS_END",
    key = "ET_ABILITY_CS_END",
    name = "未知-ET_ABILITY_CS_END",
    params = {
    },
}

---@alias EventParam.施法-开始 EventParam.ET_ABILITY_PS_START
M.config["施法-开始"] = {
    desc = "施法开始后，前摇开始前触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_PS_START",
    name = "施法-开始",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.施法-引导 EventParam.ET_ABILITY_PS_END
M.config["施法-引导"] = {
    desc = "前摇完成后，持续引导前触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_PS_END",
    name = "施法-引导",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.未知-ET_ITEM_ABILITY_PS_END EventParam.ET_ITEM_ABILITY_PS_END
M.config["未知-ET_ITEM_ABILITY_PS_END"] = {
    _deprecated = true,
    desc = "ET_ITEM_ABILITY_PS_END",
    key = "ET_ITEM_ABILITY_PS_END",
    name = "未知-ET_ITEM_ABILITY_PS_END",
    params = {
    },
}

---@alias EventParam.施法-出手 EventParam.ET_ABILITY_SP_END
M.config["施法-出手"] = {
    desc = "持续引导后，后摇开始前触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_SP_END",
    name = "施法-出手",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.施法-完成 EventParam.ET_ABILITY_CST_END
M.config["施法-完成"] = {
    desc = "后摇结束后触发。只有施法正常完成才会触发。",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_CST_END",
    name = "施法-完成",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.施法-结束 EventParam.ET_ABILITY_BS_END
M.config["施法-结束"] = {
    desc = "整个施法的表现结束后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_BS_END",
    name = "施法-结束",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.未知-ET_ABILITY_CS_INTERRUPT EventParam.ET_ABILITY_CS_INTERRUPT
M.config["未知-ET_ABILITY_CS_INTERRUPT"] = {
    _deprecated = true,
    desc = "ET_ABILITY_CS_INTERRUPT",
    key = "ET_ABILITY_CS_INTERRUPT",
    name = "未知-ET_ABILITY_CS_INTERRUPT",
    params = {
    },
}

---@alias EventParam.施法-打断开始 EventParam.ET_ABILITY_PS_INTERRUPT
M.config["施法-打断开始"] = {
    desc = "在“开始”到“引导”之间被打断",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_PS_INTERRUPT",
    name = "施法-打断开始",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.施法-打断引导 EventParam.ET_ABILITY_SP_INTERRUPT
M.config["施法-打断引导"] = {
    desc = "在“引导”到“出手”之间被打断",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_SP_INTERRUPT",
    name = "施法-打断引导",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.施法-打断出手 EventParam.ET_ABILITY_CST_INTERRUPT
M.config["施法-打断出手"] = {
    desc = "在“出手”到“完成”之间被打断",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_CST_INTERRUPT",
    name = "施法-打断出手",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.未知-ET_ABILITY_BS_INTERRUPT EventParam.ET_ABILITY_BS_INTERRUPT
M.config["未知-ET_ABILITY_BS_INTERRUPT"] = {
    _deprecated = true,
    desc = "ET_ABILITY_BS_INTERRUPT",
    key = "ET_ABILITY_BS_INTERRUPT",
    name = "未知-ET_ABILITY_BS_INTERRUPT",
    params = {
    },
}

---@alias EventParam.施法-停止 EventParam.ET_ABILITY_END
M.config["施法-停止"] = {
    desc = "施法停止后触发，是施法流程的最后一个事件。",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_END",
    name = "施法-停止",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-获得 EventParam.ET_ABILITY_OBTAIN
M.config["技能-获得"] = {
    desc = "获得技能后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_OBTAIN",
    name = "技能-获得",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-失去 EventParam.ET_ABILITY_LOSE
M.config["技能-失去"] = {
    desc = "失去技能后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_LOSE",
    name = "技能-失去",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-交换 EventParam.ET_ABILITY_SWITCH
M.config["技能-交换"] = {
    desc = "技能交换后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_SWITCH",
    name = "技能-交换",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-禁用 EventParam.ET_ABILITY_DISABLE
M.config["技能-禁用"] = {
    desc = "",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_DISABLE",
    name = "技能-禁用",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-启用 EventParam.ET_ABILITY_ENABLE
M.config["技能-启用"] = {
    desc = "",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_ENABLE",
    name = "技能-启用",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-冷却结束 EventParam.ET_ABILITY_CD_END
M.config["技能-冷却结束"] = {
    desc = "技能冷却结束后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_CD_END",
    name = "技能-冷却结束",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.效果-获得 EventParam.ET_OBTAIN_MODIFIER
M.config["效果-获得"] = {
    desc = "获得魔法效果后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_OBTAIN_MODIFIER",
    name = "效果-获得",
    object = "Buff",
    params = {
    },
}

---@alias EventParam.效果-失去 EventParam.ET_LOSS_MODIFIER
M.config["效果-失去"] = {
    desc = "失去魔法效果后触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_LOSS_MODIFIER",
    name = "效果-失去",
    object = "Buff",
    params = {
    },
}

---@alias EventParam.效果-心跳 EventParam.ET_MODIFIER_CYCLE_TRIGGER
M.config["效果-心跳"] = {
    desc = "魔法效果的周期性触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_MODIFIER_CYCLE_TRIGGER",
    name = "效果-心跳",
    object = "Buff",
    params = {
    },
}

---@alias EventParam.效果-叠加 EventParam.ET_MODIFIER_ADDTION
M.config["效果-叠加"] = {
    desc = "魔法效果叠加时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_MODIFIER_ADDTION",
    name = "效果-叠加",
    object = "Buff",
    params = {
    },
}

---@alias EventParam.效果-层数变化 EventParam.ET_MODIFIER_LAYER_CHANGE
M.config["效果-层数变化"] = {
    desc = "魔法效果层数变化时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_MODIFIER_LAYER_CHANGE",
    name = "效果-层数变化",
    object = "Buff",
    params = {
    },
}

---@alias EventParam.效果-即将获得 EventParam.ET_MODIFIER_GET_BEFORE_CREATE
M.config["效果-即将获得"] = {
    desc = "魔法效果获得前触发",
    dispatch = true,
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_MODIFIER_GET_BEFORE_CREATE",
    name = "效果-即将获得",
    object = "Buff",
    params = {
    },
}

---@alias EventParam.效果-覆盖 EventParam.ET_MODIFIER_BE_COVERED
M.config["效果-覆盖"] = {
    desc = "魔法效果覆盖时触发",
    dispatch = true,
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_MODIFIER_BE_COVERED",
    name = "效果-覆盖",
    object = "Buff",
    params = {
    },
}

---@alias EventParam.可破坏物-创建 EventParam.ET_DEST_CREATE_NEW
M.config["可破坏物-创建"] = {
    desc = "可破坏物创建后触发",
    key = "ET_DEST_CREATE_NEW",
    name = "可破坏物-创建",
    object = "Destructible",
    params = {
    },
}

---@alias EventParam.可破坏物-死亡 EventParam.ET_DEST_DIE_NEW
M.config["可破坏物-死亡"] = {
    desc = "可破坏物死亡后触发",
    key = "ET_DEST_DIE_NEW",
    name = "可破坏物-死亡",
    object = "Destructible",
    params = {
    },
}

---@alias EventParam.可破坏物-复活 EventParam.ET_DEST_REVIVE_NEW
M.config["可破坏物-复活"] = {
    desc = "可破坏物复活后触发",
    key = "ET_DEST_REVIVE_NEW",
    name = "可破坏物-复活",
    object = "Destructible",
    params = {
    },
}

---@alias EventParam.可破坏物-资源变化 EventParam.ET_DEST_RES_CNT_CHG_NEW
M.config["可破坏物-资源变化"] = {
    desc = "可破坏物存储的资源变化后触发",
    key = "ET_DEST_RES_CNT_CHG_NEW",
    name = "可破坏物-资源变化",
    object = "Destructible",
    params = {
    },
}

---@alias EventParam.可破坏物-采集 EventParam.ET_DEST_COLLECTED_NEW
M.config["可破坏物-采集"] = {
    desc = "可破坏物被采集后触发",
    key = "ET_DEST_COLLECTED_NEW",
    name = "可破坏物-采集",
    object = "Destructible",
    params = {
    },
}

---@alias EventParam.可破坏物-受到伤害 EventParam.ET_GET_HURT_NEW
M.config["可破坏物-受到伤害"] = {
    desc = "可破坏物受到伤害后触发",
    key = "ET_GET_HURT_NEW",
    name = "可破坏物-受到伤害",
    object = "Destructible",
    params = {
    },
}

---@alias EventParam.选中-可破坏物 EventParam.ET_SELECT_DEST
M.config["选中-可破坏物"] = {
    desc = "玩家选中可破坏物被后触发",
    key = "ET_SELECT_DEST",
    name = "选中-可破坏物",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-选中-可破坏物 EventParam.ET_ASYNC_SELECT_DEST
M.config["本地-选中-可破坏物"] = {
    desc = "本地玩家选中可破坏物被后触发",
    key = "ET_ASYNC_SELECT_DEST",
    name = "本地-选中-可破坏物",
    object = "Player",
    params = {
    },
}

---@alias EventParam.可破坏物-移除 EventParam.ET_DEST_DELETE
M.config["可破坏物-移除"] = {
    desc = "可破坏物被移除后触发",
    key = "ET_DEST_DELETE",
    name = "可破坏物-移除",
    object = "Destructible",
    params = {
    },
}

---@alias EventParam.投射物-创建 EventParam.ET_PRODUCE_PROJECTILE
M.config["投射物-创建"] = {
    desc = "投射物创建后触发",
    key = "ET_PRODUCE_PROJECTILE",
    name = "投射物-创建",
    object = "Projectile",
    params = {
    },
}

---@alias EventParam.投射物-死亡 EventParam.ET_DEATH_PROJECTILE
M.config["投射物-死亡"] = {
    desc = "投射物死亡后触发",
    key = "ET_DEATH_PROJECTILE",
    name = "投射物-死亡",
    object = "Projectile",
    params = {
    },
}

---@alias EventParam.界面-消息 EventParam.ET_TRIGGER_COMPONENT_EVENT
M.config["界面-消息"] = {
    desc = "触发界面上标记的自定义事件后触发",
    from_global = true,
    key = "ET_TRIGGER_COMPONENT_EVENT",
    name = "界面-消息",
    object = "Player",
    params = {
        [1] = {
            desc = "自定义事件名称",
            name = "event_name",
            type = "string",
        },
    },
}

---@alias EventParam.界面-滑动条变化 EventParam.ET_TRIGGER_UI_SLIDER_CHANGE_EVENT
M.config["界面-滑动条变化"] = {
    desc = "滑动条变化时触发",
    from_global = true,
    key = "ET_TRIGGER_UI_SLIDER_CHANGE_EVENT",
    name = "界面-滑动条变化",
    object = "Player",
    params = {
        [1] = {
            desc = "目标控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.界面-聊天框可见性变化 EventParam.ET_TRIGGER_UI_CHATBOX_VISIBLE_CHANGE_EVENT
M.config["界面-聊天框可见性变化"] = {
    desc = "聊天框可见性变化时触发",
    from_global = true,
    key = "ET_TRIGGER_UI_CHATBOX_VISIBLE_CHANGE_EVENT",
    name = "界面-聊天框可见性变化",
    object = "Player",
    params = {
        [1] = {
            desc = "目标控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.界面-装备拖拽 EventParam.ET_TRIGGER_UI_EQUIP_SLOT_DRAG_EVENT
M.config["界面-装备拖拽"] = {
    desc = "",
    from_global = true,
    key = "ET_TRIGGER_UI_EQUIP_SLOT_DRAG_EVENT",
    name = "界面-装备拖拽",
    object = "Player",
    params = {
        [1] = {
            desc = "目标控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.界面-复选框变化 EventParam.ET_TRIGGER_UI_CHECKBOX_CHANGE_EVENT
M.config["界面-复选框变化"] = {
    desc = "复选框变化时触发",
    from_global = true,
    key = "ET_TRIGGER_UI_CHECKBOX_CHANGE_EVENT",
    name = "界面-复选框变化",
    object = "Player",
    params = {
        [1] = {
            desc = "目标控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.界面-视频播放完成 EventParam.ET_TRIGGER_UI_VIDEO_END_EVENT
M.config["界面-视频播放完成"] = {
    desc = "",
    from_global = true,
    key = "ET_TRIGGER_UI_VIDEO_END_EVENT",
    name = "界面-视频播放完成",
    object = "Player",
    params = {
        [1] = {
            desc = "目标控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.本地-界面-输入框获取焦点 EventParam.ET_TRIGGER_UI_INPUT_FIELD_GET_FOCUS_EVENT
M.config["本地-界面-输入框获取焦点"] = {
    desc = "",
    from_global = true,
    key = "ET_TRIGGER_UI_INPUT_FIELD_GET_FOCUS_EVENT",
    name = "本地-界面-输入框获取焦点",
    object = "Player",
    params = {
        [1] = {
            desc = "输入框控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.本地-界面-输入框失去焦点 EventParam.ET_TRIGGER_UI_INPUT_FIELD_LOST_FOCUS_EVENT
M.config["本地-界面-输入框失去焦点"] = {
    desc = "",
    from_global = true,
    key = "ET_TRIGGER_UI_INPUT_FIELD_LOST_FOCUS_EVENT",
    name = "本地-界面-输入框失去焦点",
    object = "Player",
    params = {
        [1] = {
            desc = "输入框控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.本地-界面-输入框内容改变 EventParam.ET_TRIGGER_UI_INPUT_FIELD_TEXT_CHANGED_EVENT
M.config["本地-界面-输入框内容改变"] = {
    desc = "",
    from_global = true,
    key = "ET_TRIGGER_UI_INPUT_FIELD_TEXT_CHANGED_EVENT",
    name = "本地-界面-输入框内容改变",
    object = "Player",
    params = {
        [1] = {
            desc = "输入框控件",
            name = "ui",
            resolve = function (ui)
                return ui.handle
            end,
            type = "UI",
        },
    },
}

---@alias EventParam.键盘-按下 EventParam.ET_KEYBOARD_KEY_DOWN_EVENT
M.config["键盘-按下"] = {
    desc = "键盘上的某个键按下时触发",
    from_global = true,
    key = "ET_KEYBOARD_KEY_DOWN_EVENT",
    name = "键盘-按下",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "按下的键",
            name = "key",
            resolve = function (key)
                return y3.const.KeyboardKey[key] or key
            end,
            type = "y3.Const.KeyboardKey|integer",
        },
    },
}

---@alias EventParam.键盘-抬起 EventParam.ET_KEYBOARD_KEY_UP_EVENT
M.config["键盘-抬起"] = {
    desc = "键盘上的某个键抬起时触发",
    from_global = true,
    key = "ET_KEYBOARD_KEY_UP_EVENT",
    name = "键盘-抬起",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "抬起的键",
            name = "key",
            resolve = function (key)
                return y3.const.KeyboardKey[key] or key
            end,
            type = "y3.Const.KeyboardKey|integer",
        },
    },
}

---@alias EventParam.本地-键盘-按下 EventParam.ET_ASYNC_KEYBOARD_KEY_DOWN_EVENT
M.config["本地-键盘-按下"] = {
    desc = "键盘上的某个键按下时触发",
    from_global = true,
    key = "ET_ASYNC_KEYBOARD_KEY_DOWN_EVENT",
    name = "本地-键盘-按下",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "按下的键",
            name = "key",
            resolve = function (key)
                return y3.const.KeyboardKey[key] or key
            end,
            type = "y3.Const.KeyboardKey|integer",
        },
    },
}

---@alias EventParam.本地-键盘-抬起 EventParam.ET_ASYNC_KEYBOARD_KEY_UP_EVENT
M.config["本地-键盘-抬起"] = {
    desc = "键盘上的某个键抬起时触发",
    from_global = true,
    key = "ET_ASYNC_KEYBOARD_KEY_UP_EVENT",
    name = "本地-键盘-抬起",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "抬起的键",
            name = "key",
            resolve = function (key)
                return y3.const.KeyboardKey[key] or key
            end,
            type = "y3.Const.KeyboardKey|integer",
        },
    },
}

---@alias EventParam.鼠标-按下 EventParam.ET_MOUSE_KEY_DOWN_EVENT
M.config["鼠标-按下"] = {
    desc = "鼠标上的某个键按下时触发",
    from_global = true,
    key = "ET_MOUSE_KEY_DOWN_EVENT",
    name = "鼠标-按下",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "按下的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.鼠标-抬起 EventParam.ET_MOUSE_KEY_UP_EVENT
M.config["鼠标-抬起"] = {
    desc = "鼠标上的某个键抬起时触发",
    from_global = true,
    key = "ET_MOUSE_KEY_UP_EVENT",
    name = "鼠标-抬起",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "抬起的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.鼠标-双击 EventParam.MOUSE_KEY_DB_CLICK_EVENT
M.config["鼠标-双击"] = {
    desc = "鼠标上的某个键双击时触发",
    from_global = true,
    key = "MOUSE_KEY_DB_CLICK_EVENT",
    name = "鼠标-双击",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "双击的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.本地-鼠标-按下 EventParam.ET_ASYNC_MOUSE_KEY_DOWN_EVENT
M.config["本地-鼠标-按下"] = {
    desc = "鼠标上的某个键按下时触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_KEY_DOWN_EVENT",
    name = "本地-鼠标-按下",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "按下的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.本地-鼠标-抬起 EventParam.ET_ASYNC_MOUSE_KEY_UP_EVENT
M.config["本地-鼠标-抬起"] = {
    desc = "鼠标上的某个键抬起时触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_KEY_UP_EVENT",
    name = "本地-鼠标-抬起",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "抬起的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.本地-鼠标-双击 EventParam.ET_ASYNC_MOUSE_KEY_DB_CLICK_EVENT
M.config["本地-鼠标-双击"] = {
    desc = "鼠标上的某个键双击时触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_KEY_DB_CLICK_EVENT",
    name = "本地-鼠标-双击",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "双击的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.鼠标-按下单位 EventParam.MOUSE_KEY_DOWN_UNIT_EVENT
M.config["鼠标-按下单位"] = {
    desc = "鼠标上的某个键对着单位按下时触发",
    from_global = true,
    key = "MOUSE_KEY_DOWN_UNIT_EVENT",
    name = "鼠标-按下单位",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "按下的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.鼠标-抬起单位 EventParam.MOUSE_KEY_UP_UNIT_EVENT
M.config["鼠标-抬起单位"] = {
    desc = "鼠标上的某个键对着单位抬起时触发",
    from_global = true,
    key = "MOUSE_KEY_UP_UNIT_EVENT",
    name = "鼠标-抬起单位",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "抬起的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.鼠标-双击单位 EventParam.MOUSE_KEY_DB_CLICK_UNIT_EVENT
M.config["鼠标-双击单位"] = {
    desc = "鼠标上的某个键对着单位双击时触发",
    from_global = true,
    key = "MOUSE_KEY_DB_CLICK_UNIT_EVENT",
    name = "鼠标-双击单位",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "双击的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.本地-鼠标-按下单位 EventParam.ET_MOUSE_KEY_DOWN_UNIT_EVENT
M.config["本地-鼠标-按下单位"] = {
    desc = "鼠标上的某个键对着单位按下时触发",
    from_global = true,
    key = "ET_MOUSE_KEY_DOWN_UNIT_EVENT",
    name = "本地-鼠标-按下单位",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "按下的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.本地-鼠标-抬起单位 EventParam.ET_MOUSE_KEY_UP_UNIT_EVENT
M.config["本地-鼠标-抬起单位"] = {
    desc = "鼠标上的某个键对着单位抬起时触发",
    from_global = true,
    key = "ET_MOUSE_KEY_UP_UNIT_EVENT",
    name = "本地-鼠标-抬起单位",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "抬起的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.本地-鼠标-双击单位 EventParam.ET_MOUSE_KEY_DB_CLICK_UNIT_EVENT
M.config["本地-鼠标-双击单位"] = {
    desc = "鼠标上的某个键对着单位双击时触发",
    from_global = true,
    key = "ET_MOUSE_KEY_DB_CLICK_UNIT_EVENT",
    name = "本地-鼠标-双击单位",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "双击的键",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.鼠标-移动 EventParam.MOUSE_MOVE_EVENT
M.config["鼠标-移动"] = {
    desc = "鼠标移动时触发",
    from_global = true,
    key = "MOUSE_MOVE_EVENT",
    name = "鼠标-移动",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-鼠标-移动 EventParam.ET_ASYNC_MOUSE_MOVE_EVENT
M.config["本地-鼠标-移动"] = {
    desc = "鼠标移动时触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_MOVE_EVENT",
    name = "本地-鼠标-移动",
    object = "Player",
    params = {
    },
}

---@alias EventParam.鼠标-滚轮 EventParam.ET_MOUSE_WHEEL_EVENT
M.config["鼠标-滚轮"] = {
    desc = "鼠标滚轮滚动时触发",
    from_global = true,
    key = "ET_MOUSE_WHEEL_EVENT",
    name = "鼠标-滚轮",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "滚动方向",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.本地-鼠标-滚轮 EventParam.ET_ASYNC_MOUSE_WHEEL_EVENT
M.config["本地-鼠标-滚轮"] = {
    desc = "鼠标滚轮滚动时触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_WHEEL_EVENT",
    name = "本地-鼠标-滚轮",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "滚动方向",
            name = "key",
            resolve = function (key)
                return y3.const.MouseKey[key] or key
            end,
            type = "y3.Const.MouseKey|integer",
        },
    },
}

---@alias EventParam.选中-单位 EventParam.ET_SELECT_UNIT
M.config["选中-单位"] = {
    desc = "玩家选中单位时触发",
    key = "ET_SELECT_UNIT",
    name = "选中-单位",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-选中-单位 EventParam.ET_ASYNC_SELECT_UNIT
M.config["本地-选中-单位"] = {
    desc = "本地玩家选中单位时触发",
    key = "ET_ASYNC_SELECT_UNIT",
    name = "本地-选中-单位",
    object = "Player",
    params = {
    },
}

---@alias EventParam.选中-取消 EventParam.CANCEL_SELECT_UNIT
M.config["选中-取消"] = {
    desc = "玩家主动取消选中时触发",
    key = "CANCEL_SELECT_UNIT",
    name = "选中-取消",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-选中-取消 EventParam.ET_ASYNC_CANCEL_SELECT_UNIT
M.config["本地-选中-取消"] = {
    desc = "玩家的选中状态被取消时触发",
    key = "ET_ASYNC_CANCEL_SELECT_UNIT",
    name = "本地-选中-取消",
    object = "Player",
    params = {
    },
}

---@alias EventParam.选中-失去单位 EventParam.LOST_SELECT_UNIT
M.config["选中-失去单位"] = {
    desc = "玩家被动失去对单位的选中状态时触发",
    key = "LOST_SELECT_UNIT",
    name = "选中-失去单位",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-选中-失去单位 EventParam.ET_ASYNC_LOST_SELECT_UNIT
M.config["本地-选中-失去单位"] = {
    desc = "本地玩家被动失去对单位的选中状态时触发",
    key = "ET_ASYNC_LOST_SELECT_UNIT",
    name = "本地-选中-失去单位",
    object = "Player",
    params = {
    },
}

---@alias EventParam.选中-物品 EventParam.ET_SELECT_ITEM
M.config["选中-物品"] = {
    desc = "物品被选中时触发",
    key = "ET_SELECT_ITEM",
    name = "选中-物品",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-选中-物品 EventParam.ET_ASYNC_SELECT_ITEM
M.config["本地-选中-物品"] = {
    desc = "本地玩家选中物品时触发",
    key = "ET_ASYNC_SELECT_ITEM",
    name = "本地-选中-物品",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-检测到作弊 EventParam.ET_ATTR_CHEATING_DETECTED
M.config["玩家-检测到作弊"] = {
    desc = "",
    key = "ET_ATTR_CHEATING_DETECTED",
    name = "玩家-检测到作弊",
    object = "Player",
    params = {
    },
}

---@alias EventParam.鼠标-双击物品 EventParam.ET_DOUBLE_CLICK_ITEM
M.config["鼠标-双击物品"] = {
    desc = "鼠标上左键双击物品时触发",
    from_global = true,
    key = "ET_DOUBLE_CLICK_ITEM",
    name = "鼠标-双击物品",
    object = "Player",
    params = {
    },
}

---@alias EventParam.鼠标-双击可破坏物 EventParam.ET_DOUBLE_CLICK_DEST
M.config["鼠标-双击可破坏物"] = {
    desc = "鼠标上左键双击可破坏物时触发",
    from_global = true,
    key = "ET_DOUBLE_CLICK_DEST",
    name = "鼠标-双击可破坏物",
    object = "Player",
    params = {
    },
}

---@alias EventParam.选中-单位组 EventParam.ET_SELECT_UNIT_GROUP
M.config["选中-单位组"] = {
    desc = "玩家选中单位组时触发",
    key = "ET_SELECT_UNIT_GROUP",
    name = "选中-单位组",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-选中-单位组 EventParam.ET_ASYNC_SELECT_UNIT_GROUP
M.config["本地-选中-单位组"] = {
    desc = "本地玩家选中单位组时触发",
    key = "ET_ASYNC_SELECT_UNIT_GROUP",
    name = "本地-选中-单位组",
    object = "Player",
    params = {
    },
}

---@alias EventParam.技能-打开指示器 EventParam.ET_START_SKILL_POINTER
M.config["技能-打开指示器"] = {
    desc = "技能的瞄准指示器显示时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_START_SKILL_POINTER",
    name = "技能-打开指示器",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-建造技能释放前 EventParam.ET_BUILD_SKILL_BEFORE_RELEASE
M.config["技能-建造技能释放前"] = {
    desc = "建造技能的命令将要发布时",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_BUILD_SKILL_BEFORE_RELEASE",
    name = "技能-建造技能释放前",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.技能-关闭指示器 EventParam.ET_STOP_SKILL_POINTER
M.config["技能-关闭指示器"] = {
    desc = "技能的瞄准指示器消失时触发",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_STOP_SKILL_POINTER",
    name = "技能-关闭指示器",
    object = "Ability",
    params = {
    },
}

---@alias EventParam.物品-获得 EventParam.ET_UNIT_ADD_ITEM
M.config["物品-获得"] = {
    desc = "单位获得物品时触发",
    key = "ET_UNIT_ADD_ITEM",
    name = "物品-获得",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-进入物品栏 EventParam.ET_UNIT_ADD_ITEM_TO_BAR
M.config["物品-进入物品栏"] = {
    desc = "物品进入单位的物品栏时触发",
    key = "ET_UNIT_ADD_ITEM_TO_BAR",
    name = "物品-进入物品栏",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-进入背包 EventParam.ET_UNIT_ADD_ITEM_TO_PKG
M.config["物品-进入背包"] = {
    desc = "物品进入单位的背包时触发",
    key = "ET_UNIT_ADD_ITEM_TO_PKG",
    name = "物品-进入背包",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-失去 EventParam.ET_UNIT_REMOVE_ITEM
M.config["物品-失去"] = {
    desc = "单位失去物品时触发",
    key = "ET_UNIT_REMOVE_ITEM",
    name = "物品-失去",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-离开物品栏 EventParam.ET_UNIT_REMOVE_ITEM_FROM_BAR
M.config["物品-离开物品栏"] = {
    desc = "物品离开单位的物品栏时触发",
    key = "ET_UNIT_REMOVE_ITEM_FROM_BAR",
    name = "物品-离开物品栏",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-离开背包 EventParam.ET_UNIT_REMOVE_ITEM_FROM_PKG
M.config["物品-离开背包"] = {
    desc = "物品离开单位的背包时触发",
    key = "ET_UNIT_REMOVE_ITEM_FROM_PKG",
    name = "物品-离开背包",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-使用 EventParam.ET_UNIT_USE_ITEM
M.config["物品-使用"] = {
    desc = "单位使用物品时触发",
    key = "ET_UNIT_USE_ITEM",
    name = "物品-使用",
    object = "Item",
    params = {
    },
}

---@alias EventParam.单位-寻路开始 EventParam.ET_UNIT_START_NAV_EVENT
M.config["单位-寻路开始"] = {
    desc = "攻击、移动、施法等行为均可能导致寻路",
    key = "ET_UNIT_START_NAV_EVENT",
    name = "单位-寻路开始",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.单位-寻路结束 EventParam.ET_UNIT_END_NAV_EVENT
M.config["单位-寻路结束"] = {
    desc = "寻路到达目标位置或失败3次后触发",
    key = "ET_UNIT_END_NAV_EVENT",
    name = "单位-寻路结束",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.物品-堆叠变化 EventParam.ET_ITEM_STACK_CHANGED
M.config["物品-堆叠变化"] = {
    desc = "物品堆叠数变化时触发",
    key = "ET_ITEM_STACK_CHANGED",
    name = "物品-堆叠变化",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-充能变化 EventParam.ET_ITEM_CHARGE_CHANGED
M.config["物品-充能变化"] = {
    desc = "物品充能层数变化时触发",
    key = "ET_ITEM_CHARGE_CHANGED",
    name = "物品-充能变化",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-创建 EventParam.ET_ITEM_ON_CREATE
M.config["物品-创建"] = {
    desc = "物品创建时触发",
    key = "ET_ITEM_ON_CREATE",
    name = "物品-创建",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-移除 EventParam.ET_ITEM_ON_DESTROY
M.config["物品-移除"] = {
    desc = "物品移除时触发",
    key = "ET_ITEM_ON_DESTROY",
    name = "物品-移除",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-出售 EventParam.ET_ITEM_SOLD
M.config["物品-出售"] = {
    desc = "将物品出售给商店时触发",
    key = "ET_ITEM_SOLD",
    name = "物品-出售",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-死亡 EventParam.ET_ITEM_BROKEN
M.config["物品-死亡"] = {
    desc = "物品被破坏时触发",
    key = "ET_ITEM_BROKEN",
    name = "物品-死亡",
    object = "Item",
    params = {
    },
}

---@alias EventParam.物品-采集创建 EventParam.ET_ITEM_CREATE_ON_DEST_COLLECTED
M.config["物品-采集创建"] = {
    desc = "物品通过采集被创建时会触发该事件。采集功能来自可破坏物。",
    key = "ET_ITEM_CREATE_ON_DEST_COLLECTED",
    name = "物品-采集创建",
    object = "Item",
    params = {
    },
}

---@alias EventParam.命令-攻击移动 EventParam.ET_ATTACK_MOVE_CMD
M.config["命令-攻击移动"] = {
    desc = "",
    key = "ET_ATTACK_MOVE_CMD",
    name = "命令-攻击移动",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.命令-出售物品 EventParam.ET_SELL_ITEM_CMD
M.config["命令-出售物品"] = {
    desc = "",
    key = "ET_SELL_ITEM_CMD",
    name = "命令-出售物品",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.命令-施放技能 EventParam.ET_AI_RELEASE_SKILL_CMD
M.config["命令-施放技能"] = {
    desc = "",
    key = "ET_AI_RELEASE_SKILL_CMD",
    name = "命令-施放技能",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.命令-巡逻 EventParam.ET_PATROL_CMD
M.config["命令-巡逻"] = {
    desc = "",
    key = "ET_PATROL_CMD",
    name = "命令-巡逻",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.命令-移动 EventParam.ET_MOVE_UNIT_TO_TARGET_CMD
M.config["命令-移动"] = {
    desc = "",
    key = "ET_MOVE_UNIT_TO_TARGET_CMD",
    name = "命令-移动",
    object = "Unit",
    params = {
    },
}

---@alias EventParam.鼠标-悬停 EventParam.ET_MOUSE_HOVER_EVENT
M.config["鼠标-悬停"] = {
    desc = "悬停进入或离开都会触发",
    from_global = true,
    key = "ET_MOUSE_HOVER_EVENT",
    name = "鼠标-悬停",
    object = "Player",
    params = {
    },
}

---@alias EventParam.本地-鼠标-悬停 EventParam.ET_ASYNC_MOUSE_HOVER_EVENT
M.config["本地-鼠标-悬停"] = {
    desc = "悬停进入或离开都会触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_HOVER_EVENT",
    name = "本地-鼠标-悬停",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-发送消息 EventParam.ET_CHAT_SEND_GM
M.config["玩家-发送消息"] = {
    desc = "玩家发送任意消息时触发",
    from_global = true,
    key = "ET_CHAT_SEND_GM",
    name = "玩家-发送消息",
    object = "Player",
    params = {
    },
}

---@alias EventParam.游戏-消息 EventParam.ET_EVENT_CUSTOM
M.config["游戏-消息"] = {
    desc = "在事件管理处定义的事件通过这个方法进行触发",
    key = "ET_EVENT_CUSTOM",
    name = "游戏-消息",
    params = {
        [1] = {
            call = false,
            desc = "事件ID",
            name = "event_id",
            resolve = function (event_id)
                return y3.const.CustomEventName[event_id] or event_id
            end,
            type = "integer",
        },
    },
}

---@alias EventParam.玩家-语音发言 EventParam.ET_MICRO_SPEAK
M.config["玩家-语音发言"] = {
    desc = "玩家开始语音和结束语音都会触发",
    from_global = true,
    key = "ET_MICRO_SPEAK",
    name = "玩家-语音发言",
    object = "Player",
    params = {
    },
}

---@alias EventParam.未知-ET_UNIT_3D_ACTIVE EventParam.ET_UNIT_3D_ACTIVE
M.config["未知-ET_UNIT_3D_ACTIVE"] = {
    _deprecated = true,
    desc = "ET_UNIT_3D_ACTIVE",
    key = "ET_UNIT_3D_ACTIVE",
    name = "未知-ET_UNIT_3D_ACTIVE",
    params = {
    },
}

---@alias EventParam.玩家-平台道具变化 EventParam.ET_ROLE_STORE_ITEM_CHANGED
M.config["玩家-平台道具变化"] = {
    desc = "玩家平台道具变化时触发",
    key = "ET_ROLE_STORE_ITEM_CHANGED",
    name = "玩家-平台道具变化",
    object = "Player",
    params = {
    },
}

---@alias EventParam.玩家-平台商城窗口变化 EventParam.ET_ROLE_STORE_PAGE_STATE_CHANGED
M.config["玩家-平台商城窗口变化"] = {
    desc = "平台商城窗口变化事件",
    from_global = true,
    key = "ET_ROLE_STORE_PAGE_STATE_CHANGED",
    name = "玩家-平台商城窗口变化",
    object = "Player",
    params = {
    },
}

---@alias EventParam.控制台-输入 EventParam.ET_LUA_CONSOLE_COMMAND
M.config["控制台-输入"] = {
    desc = "",
    key = "ET_LUA_CONSOLE_COMMAND",
    name = "控制台-输入",
    params = {
    },
}

---@alias EventParam.控制台-请求补全 EventParam.ET_LUA_CONSOLE_TIPS
M.config["控制台-请求补全"] = {
    desc = "",
    key = "ET_LUA_CONSOLE_TIPS",
    name = "控制台-请求补全",
    params = {
    },
}

---@alias EventParam.steam-收到好友申请 EventParam.ET_MALL_NOTIFY_FRIEND_NEW
M.config["steam-收到好友申请"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_FRIEND_NEW",
    name = "steam-收到好友申请",
    params = {
    },
}

---@alias EventParam.steam-收到被好友删除 EventParam.ET_MALL_NOTIFY_FRIEND_DELETE
M.config["steam-收到被好友删除"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_FRIEND_DELETE",
    name = "steam-收到被好友删除",
    params = {
    },
}

---@alias EventParam.steam-好友在线状态变化 EventParam.ET_MALL_NOTIFY_FRIEND_UPDATE
M.config["steam-好友在线状态变化"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_FRIEND_UPDATE",
    name = "steam-好友在线状态变化",
    params = {
    },
}

---@alias EventParam.steam-本地玩家队伍变化 EventParam.ET_MALL_NOTIFY_TEAM_UPDATE
M.config["steam-本地玩家队伍变化"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_TEAM_UPDATE",
    name = "steam-本地玩家队伍变化",
    params = {
    },
}

---@alias EventParam.steam-收到队伍邀请 EventParam.ET_MALL_NOTIFY_TEAM_INVITE
M.config["steam-收到队伍邀请"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_TEAM_INVITE",
    name = "steam-收到队伍邀请",
    params = {
    },
}

---@alias EventParam.steam-进入大厅 EventParam.ET_MALL_NOTIFY_ENTER_LOBBY
M.config["steam-进入大厅"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_ENTER_LOBBY",
    name = "steam-进入大厅",
    params = {
    },
}

---@alias EventParam.steam-开始匹配 EventParam.ET_MALL_NOTIFY_START_MATCH
M.config["steam-开始匹配"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_START_MATCH",
    name = "steam-开始匹配",
    params = {
    },
}

---@alias EventParam.steam-取消匹配 EventParam.ET_MALL_NOTIFY_CANCEL_MATCH
M.config["steam-取消匹配"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_CANCEL_MATCH",
    name = "steam-取消匹配",
    params = {
    },
}

---@class Game
---@field event fun(self: self, event: "游戏-初始化", callback: fun(trg: Trigger, data: EventParam.游戏-初始化)): Trigger
---@field event fun(self: self, event: "游戏-追帧完成", callback: fun(trg: Trigger, data: EventParam.游戏-追帧完成)): Trigger
---@field event fun(self: self, event: "游戏-逻辑不同步", callback: fun(trg: Trigger, data: EventParam.游戏-逻辑不同步)): Trigger
---@field event fun(self: self, event: "游戏-地形预设加载完成", callback: fun(trg: Trigger, data: EventParam.游戏-地形预设加载完成)): Trigger
---@field event fun(self: self, event: "游戏-结束", callback: fun(trg: Trigger, data: EventParam.游戏-结束)): Trigger
---@field event fun(self: self, event: "游戏-暂停", callback: fun(trg: Trigger, data: EventParam.游戏-暂停)): Trigger
---@field event fun(self: self, event: "游戏-恢复", callback: fun(trg: Trigger, data: EventParam.游戏-恢复)): Trigger
---@field event fun(self: self, event: "游戏-昼夜变化", callback: fun(trg: Trigger, data: EventParam.游戏-昼夜变化)): Trigger
---@field event fun(self: self, event: "区域-进入", area: Area, callback: fun(trg: Trigger, data: EventParam.区域-进入)): Trigger
---@field event fun(self: self, event: "区域-离开", area: Area, callback: fun(trg: Trigger, data: EventParam.区域-离开)): Trigger
---@field event fun(self: self, event: "游戏-http返回", callback: fun(trg: Trigger, data: EventParam.游戏-http返回)): Trigger
---@field event fun(self: self, event: "游戏-接收广播信息", callback: fun(trg: Trigger, data: EventParam.游戏-接收广播信息)): Trigger
---@field event fun(self: self, event: "玩家-加入游戏", callback: fun(trg: Trigger, data: EventParam.玩家-加入游戏)): Trigger
---@field event fun(self: self, event: "玩家-离开游戏", callback: fun(trg: Trigger, data: EventParam.玩家-离开游戏)): Trigger
---@field event fun(self: self, event: "玩家-掉线", callback: fun(trg: Trigger, data: EventParam.玩家-掉线)): Trigger
---@field event fun(self: self, event: "玩家-使用平台道具", callback: fun(trg: Trigger, data: EventParam.玩家-使用平台道具)): Trigger
---@field event fun(self: self, event: "玩家-持有平台道具", callback: fun(trg: Trigger, data: EventParam.玩家-持有平台道具)): Trigger
---@field event fun(self: self, event: "玩家-属性变化", callback: fun(trg: Trigger, data: EventParam.玩家-属性变化)): Trigger
---@field event fun(self: self, event: "玩家-发送指定消息", msg: string, callback: fun(trg: Trigger, data: EventParam.玩家-发送指定消息)): Trigger
---@field event fun(self: self, event: "玩家-科技提升", callback: fun(trg: Trigger, data: EventParam.玩家-科技提升)): Trigger
---@field event fun(self: self, event: "玩家-科技降低", callback: fun(trg: Trigger, data: EventParam.玩家-科技降低)): Trigger
---@field event fun(self: self, event: "玩家-科技变化", callback: fun(trg: Trigger, data: EventParam.玩家-科技变化)): Trigger
---@field event fun(self: self, event: "单位-研发科技", callback: fun(trg: Trigger, data: EventParam.单位-研发科技)): Trigger
---@field event fun(self: self, event: "单位-获得科技", callback: fun(trg: Trigger, data: EventParam.单位-获得科技)): Trigger
---@field event fun(self: self, event: "单位-失去科技", callback: fun(trg: Trigger, data: EventParam.单位-失去科技)): Trigger
---@field event fun(self: self, event: "玩家-关系变化", callback: fun(trg: Trigger, data: EventParam.玩家-关系变化)): Trigger
---@field event fun(self: self, event: "玩家-重连", callback: fun(trg: Trigger, data: EventParam.玩家-重连)): Trigger
---@field event fun(self: self, event: "单位-建筑升级开始", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级开始)): Trigger
---@field event fun(self: self, event: "单位-建筑升级取消", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级取消)): Trigger
---@field event fun(self: self, event: "单位-建筑升级完成", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级完成)): Trigger
---@field event fun(self: self, event: "单位-建造开始", callback: fun(trg: Trigger, data: EventParam.单位-建造开始)): Trigger
---@field event fun(self: self, event: "单位-建造取消", callback: fun(trg: Trigger, data: EventParam.单位-建造取消)): Trigger
---@field event fun(self: self, event: "单位-建造完成", callback: fun(trg: Trigger, data: EventParam.单位-建造完成)): Trigger
---@field event fun(self: self, event: "技能-建造完成", callback: fun(trg: Trigger, data: EventParam.技能-建造完成)): Trigger
---@field event fun(self: self, event: "单位-普攻命中", callback: fun(trg: Trigger, data: EventParam.单位-普攻命中)): Trigger
---@field event fun(self: self, event: "单位-普攻造成伤害", callback: fun(trg: Trigger, data: EventParam.单位-普攻造成伤害)): Trigger
---@field event fun(self: self, event: "技能-学习", callback: fun(trg: Trigger, data: EventParam.技能-学习)): Trigger
---@field event fun(self: self, event: "技能-可用状态变化", callback: fun(trg: Trigger, data: EventParam.技能-可用状态变化)): Trigger
---@field event fun(self: self, event: "技能-沉默状态变化", callback: fun(trg: Trigger, data: EventParam.技能-沉默状态变化)): Trigger
---@field event fun(self: self, event: "技能-图标变化", callback: fun(trg: Trigger, data: EventParam.技能-图标变化)): Trigger
---@field event fun(self: self, event: "单位-名称变化", callback: fun(trg: Trigger, data: EventParam.单位-名称变化)): Trigger
---@field event fun(self: self, event: "单位-小地图图标变化", callback: fun(trg: Trigger, data: EventParam.单位-小地图图标变化)): Trigger
---@field event fun(self: self, event: "单位-头像变化", callback: fun(trg: Trigger, data: EventParam.单位-头像变化)): Trigger
---@field event fun(self: self, event: "单位-移除", callback: fun(trg: Trigger, data: EventParam.单位-移除)): Trigger
---@field event fun(self: self, event: "单位-移除后", callback: fun(trg: Trigger, data: EventParam.单位-移除后)): Trigger
---@field event fun(self: self, event: "单位-传送结束", callback: fun(trg: Trigger, data: EventParam.单位-传送结束)): Trigger
---@field event fun(self: self, event: "单位-属性变化", unit: Unit, attr: string, callback: fun(trg: Trigger, data: EventParam.单位-属性变化)): Trigger
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
---@field event fun(self: self, event: "玩家-属性图标变化", callback: fun(trg: Trigger, data: EventParam.玩家-属性图标变化)): Trigger
---@field event fun(self: self, event: "单位-施放技能", callback: fun(trg: Trigger, data: EventParam.单位-施放技能)): Trigger
---@field event fun(self: self, event: "单位-获得经验前", callback: fun(trg: Trigger, data: EventParam.单位-获得经验前)): Trigger
---@field event fun(self: self, event: "单位-获得经验后", callback: fun(trg: Trigger, data: EventParam.单位-获得经验后)): Trigger
---@field event fun(self: self, event: "单位-接收命令", callback: fun(trg: Trigger, data: EventParam.单位-接收命令)): Trigger
---@field event fun(self: self, event: "单位-击杀", callback: fun(trg: Trigger, data: EventParam.单位-击杀)): Trigger
---@field event fun(self: self, event: "单位-创建", callback: fun(trg: Trigger, data: EventParam.单位-创建)): Trigger
---@field event fun(self: self, event: "单位-进入战斗", callback: fun(trg: Trigger, data: EventParam.单位-进入战斗)): Trigger
---@field event fun(self: self, event: "单位-脱离战斗", callback: fun(trg: Trigger, data: EventParam.单位-脱离战斗)): Trigger
---@field event fun(self: self, event: "单位-即将拾取物品", callback: fun(trg: Trigger, data: EventParam.单位-即将拾取物品)): Trigger
---@field event fun(self: self, event: "单位-即将索敌", callback: fun(trg: Trigger, data: EventParam.单位-即将索敌)): Trigger
---@field event fun(self: self, event: "单位-发现目标", callback: fun(trg: Trigger, data: EventParam.单位-发现目标)): Trigger
---@field event fun(self: self, event: "本地-骨骼碰撞", callback: fun(trg: Trigger, data: EventParam.本地-骨骼碰撞)): Trigger
---@field event fun(self: self, event: "物理-骨骼碰撞", callback: fun(trg: Trigger, data: EventParam.物理-骨骼碰撞)): Trigger
---@field event fun(self: self, event: "单位-购买物品", callback: fun(trg: Trigger, data: EventParam.单位-购买物品)): Trigger
---@field event fun(self: self, event: "单位-购买单位", callback: fun(trg: Trigger, data: EventParam.单位-购买单位)): Trigger
---@field event fun(self: self, event: "单位-出售物品", callback: fun(trg: Trigger, data: EventParam.单位-出售物品)): Trigger
---@field event fun(self: self, event: "商店-商品变化", callback: fun(trg: Trigger, data: EventParam.商店-商品变化)): Trigger
---@field event fun(self: self, event: "商店-库存变化", callback: fun(trg: Trigger, data: EventParam.商店-库存变化)): Trigger
---@field event fun(self: self, event: "商店-售价变化", callback: fun(trg: Trigger, data: EventParam.商店-售价变化)): Trigger
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
---@field event fun(self: self, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: self, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
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
---@field event fun(self: self, event: "本地-选中-可破坏物", callback: fun(trg: Trigger, data: EventParam.本地-选中-可破坏物)): Trigger
---@field event fun(self: self, event: "可破坏物-移除", callback: fun(trg: Trigger, data: EventParam.可破坏物-移除)): Trigger
---@field event fun(self: self, event: "投射物-创建", callback: fun(trg: Trigger, data: EventParam.投射物-创建)): Trigger
---@field event fun(self: self, event: "投射物-死亡", callback: fun(trg: Trigger, data: EventParam.投射物-死亡)): Trigger
---@field event fun(self: self, event: "界面-消息", event_name: string, callback: fun(trg: Trigger, data: EventParam.界面-消息)): Trigger
---@field event fun(self: self, event: "界面-滑动条变化", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-滑动条变化)): Trigger
---@field event fun(self: self, event: "界面-聊天框可见性变化", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-聊天框可见性变化)): Trigger
---@field event fun(self: self, event: "界面-装备拖拽", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-装备拖拽)): Trigger
---@field event fun(self: self, event: "界面-复选框变化", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-复选框变化)): Trigger
---@field event fun(self: self, event: "界面-视频播放完成", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-视频播放完成)): Trigger
---@field event fun(self: self, event: "本地-界面-输入框获取焦点", ui: UI, callback: fun(trg: Trigger, data: EventParam.本地-界面-输入框获取焦点)): Trigger
---@field event fun(self: self, event: "本地-界面-输入框失去焦点", ui: UI, callback: fun(trg: Trigger, data: EventParam.本地-界面-输入框失去焦点)): Trigger
---@field event fun(self: self, event: "本地-界面-输入框内容改变", ui: UI, callback: fun(trg: Trigger, data: EventParam.本地-界面-输入框内容改变)): Trigger
---@field event fun(self: self, event: "键盘-按下", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.键盘-按下)): Trigger
---@field event fun(self: self, event: "键盘-抬起", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.键盘-抬起)): Trigger
---@field event fun(self: self, event: "本地-键盘-按下", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-键盘-按下)): Trigger
---@field event fun(self: self, event: "本地-键盘-抬起", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-键盘-抬起)): Trigger
---@field event fun(self: self, event: "鼠标-按下", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-按下)): Trigger
---@field event fun(self: self, event: "鼠标-抬起", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-抬起)): Trigger
---@field event fun(self: self, event: "鼠标-双击", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-双击)): Trigger
---@field event fun(self: self, event: "本地-鼠标-按下", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-按下)): Trigger
---@field event fun(self: self, event: "本地-鼠标-抬起", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-抬起)): Trigger
---@field event fun(self: self, event: "本地-鼠标-双击", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-双击)): Trigger
---@field event fun(self: self, event: "鼠标-按下单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-按下单位)): Trigger
---@field event fun(self: self, event: "鼠标-抬起单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-抬起单位)): Trigger
---@field event fun(self: self, event: "鼠标-双击单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-双击单位)): Trigger
---@field event fun(self: self, event: "本地-鼠标-按下单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-按下单位)): Trigger
---@field event fun(self: self, event: "本地-鼠标-抬起单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-抬起单位)): Trigger
---@field event fun(self: self, event: "本地-鼠标-双击单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-双击单位)): Trigger
---@field event fun(self: self, event: "鼠标-移动", callback: fun(trg: Trigger, data: EventParam.鼠标-移动)): Trigger
---@field event fun(self: self, event: "本地-鼠标-移动", callback: fun(trg: Trigger, data: EventParam.本地-鼠标-移动)): Trigger
---@field event fun(self: self, event: "鼠标-滚轮", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-滚轮)): Trigger
---@field event fun(self: self, event: "本地-鼠标-滚轮", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-滚轮)): Trigger
---@field event fun(self: self, event: "选中-单位", callback: fun(trg: Trigger, data: EventParam.选中-单位)): Trigger
---@field event fun(self: self, event: "本地-选中-单位", callback: fun(trg: Trigger, data: EventParam.本地-选中-单位)): Trigger
---@field event fun(self: self, event: "选中-取消", callback: fun(trg: Trigger, data: EventParam.选中-取消)): Trigger
---@field event fun(self: self, event: "本地-选中-取消", callback: fun(trg: Trigger, data: EventParam.本地-选中-取消)): Trigger
---@field event fun(self: self, event: "选中-失去单位", callback: fun(trg: Trigger, data: EventParam.选中-失去单位)): Trigger
---@field event fun(self: self, event: "本地-选中-失去单位", callback: fun(trg: Trigger, data: EventParam.本地-选中-失去单位)): Trigger
---@field event fun(self: self, event: "选中-物品", callback: fun(trg: Trigger, data: EventParam.选中-物品)): Trigger
---@field event fun(self: self, event: "本地-选中-物品", callback: fun(trg: Trigger, data: EventParam.本地-选中-物品)): Trigger
---@field event fun(self: self, event: "玩家-检测到作弊", callback: fun(trg: Trigger, data: EventParam.玩家-检测到作弊)): Trigger
---@field event fun(self: self, event: "鼠标-双击物品", callback: fun(trg: Trigger, data: EventParam.鼠标-双击物品)): Trigger
---@field event fun(self: self, event: "鼠标-双击可破坏物", callback: fun(trg: Trigger, data: EventParam.鼠标-双击可破坏物)): Trigger
---@field event fun(self: self, event: "选中-单位组", callback: fun(trg: Trigger, data: EventParam.选中-单位组)): Trigger
---@field event fun(self: self, event: "本地-选中-单位组", callback: fun(trg: Trigger, data: EventParam.本地-选中-单位组)): Trigger
---@field event fun(self: self, event: "技能-打开指示器", callback: fun(trg: Trigger, data: EventParam.技能-打开指示器)): Trigger
---@field event fun(self: self, event: "技能-建造技能释放前", callback: fun(trg: Trigger, data: EventParam.技能-建造技能释放前)): Trigger
---@field event fun(self: self, event: "技能-关闭指示器", callback: fun(trg: Trigger, data: EventParam.技能-关闭指示器)): Trigger
---@field event fun(self: self, event: "物品-获得", callback: fun(trg: Trigger, data: EventParam.物品-获得)): Trigger
---@field event fun(self: self, event: "物品-进入物品栏", callback: fun(trg: Trigger, data: EventParam.物品-进入物品栏)): Trigger
---@field event fun(self: self, event: "物品-进入背包", callback: fun(trg: Trigger, data: EventParam.物品-进入背包)): Trigger
---@field event fun(self: self, event: "物品-失去", callback: fun(trg: Trigger, data: EventParam.物品-失去)): Trigger
---@field event fun(self: self, event: "物品-离开物品栏", callback: fun(trg: Trigger, data: EventParam.物品-离开物品栏)): Trigger
---@field event fun(self: self, event: "物品-离开背包", callback: fun(trg: Trigger, data: EventParam.物品-离开背包)): Trigger
---@field event fun(self: self, event: "物品-使用", callback: fun(trg: Trigger, data: EventParam.物品-使用)): Trigger
---@field event fun(self: self, event: "单位-寻路开始", callback: fun(trg: Trigger, data: EventParam.单位-寻路开始)): Trigger
---@field event fun(self: self, event: "单位-寻路结束", callback: fun(trg: Trigger, data: EventParam.单位-寻路结束)): Trigger
---@field event fun(self: self, event: "物品-堆叠变化", callback: fun(trg: Trigger, data: EventParam.物品-堆叠变化)): Trigger
---@field event fun(self: self, event: "物品-充能变化", callback: fun(trg: Trigger, data: EventParam.物品-充能变化)): Trigger
---@field event fun(self: self, event: "物品-创建", callback: fun(trg: Trigger, data: EventParam.物品-创建)): Trigger
---@field event fun(self: self, event: "物品-移除", callback: fun(trg: Trigger, data: EventParam.物品-移除)): Trigger
---@field event fun(self: self, event: "物品-出售", callback: fun(trg: Trigger, data: EventParam.物品-出售)): Trigger
---@field event fun(self: self, event: "物品-死亡", callback: fun(trg: Trigger, data: EventParam.物品-死亡)): Trigger
---@field event fun(self: self, event: "物品-采集创建", callback: fun(trg: Trigger, data: EventParam.物品-采集创建)): Trigger
---@field event fun(self: self, event: "命令-攻击移动", callback: fun(trg: Trigger, data: EventParam.命令-攻击移动)): Trigger
---@field event fun(self: self, event: "命令-出售物品", callback: fun(trg: Trigger, data: EventParam.命令-出售物品)): Trigger
---@field event fun(self: self, event: "命令-施放技能", callback: fun(trg: Trigger, data: EventParam.命令-施放技能)): Trigger
---@field event fun(self: self, event: "命令-巡逻", callback: fun(trg: Trigger, data: EventParam.命令-巡逻)): Trigger
---@field event fun(self: self, event: "命令-移动", callback: fun(trg: Trigger, data: EventParam.命令-移动)): Trigger
---@field event fun(self: self, event: "鼠标-悬停", callback: fun(trg: Trigger, data: EventParam.鼠标-悬停)): Trigger
---@field event fun(self: self, event: "本地-鼠标-悬停", callback: fun(trg: Trigger, data: EventParam.本地-鼠标-悬停)): Trigger
---@field event fun(self: self, event: "玩家-发送消息", callback: fun(trg: Trigger, data: EventParam.玩家-发送消息)): Trigger
---@field event fun(self: self, event: "游戏-消息", event_id: integer, callback: fun(trg: Trigger, data: EventParam.游戏-消息)): Trigger
---@field event fun(self: self, event: "玩家-语音发言", callback: fun(trg: Trigger, data: EventParam.玩家-语音发言)): Trigger
---@field event fun(self: self, event: "玩家-平台道具变化", callback: fun(trg: Trigger, data: EventParam.玩家-平台道具变化)): Trigger
---@field event fun(self: self, event: "玩家-平台商城窗口变化", callback: fun(trg: Trigger, data: EventParam.玩家-平台商城窗口变化)): Trigger
---@field event fun(self: self, event: "控制台-输入", callback: fun(trg: Trigger, data: EventParam.控制台-输入)): Trigger
---@field event fun(self: self, event: "控制台-请求补全", callback: fun(trg: Trigger, data: EventParam.控制台-请求补全)): Trigger
---@field event fun(self: self, event: "steam-收到好友申请", callback: fun(trg: Trigger, data: EventParam.steam-收到好友申请)): Trigger
---@field event fun(self: self, event: "steam-收到被好友删除", callback: fun(trg: Trigger, data: EventParam.steam-收到被好友删除)): Trigger
---@field event fun(self: self, event: "steam-好友在线状态变化", callback: fun(trg: Trigger, data: EventParam.steam-好友在线状态变化)): Trigger
---@field event fun(self: self, event: "steam-本地玩家队伍变化", callback: fun(trg: Trigger, data: EventParam.steam-本地玩家队伍变化)): Trigger
---@field event fun(self: self, event: "steam-收到队伍邀请", callback: fun(trg: Trigger, data: EventParam.steam-收到队伍邀请)): Trigger
---@field event fun(self: self, event: "steam-进入大厅", callback: fun(trg: Trigger, data: EventParam.steam-进入大厅)): Trigger
---@field event fun(self: self, event: "steam-开始匹配", callback: fun(trg: Trigger, data: EventParam.steam-开始匹配)): Trigger
---@field event fun(self: self, event: "steam-取消匹配", callback: fun(trg: Trigger, data: EventParam.steam-取消匹配)): Trigger

---@class Ability
---@field event fun(self: Ability, event: "技能-建造完成", callback: fun(trg: Trigger, data: EventParam.技能-建造完成)): Trigger
---@field event fun(self: Ability, event: "技能-学习", callback: fun(trg: Trigger, data: EventParam.技能-学习)): Trigger
---@field event fun(self: Ability, event: "技能-可用状态变化", callback: fun(trg: Trigger, data: EventParam.技能-可用状态变化)): Trigger
---@field event fun(self: Ability, event: "技能-沉默状态变化", callback: fun(trg: Trigger, data: EventParam.技能-沉默状态变化)): Trigger
---@field event fun(self: Ability, event: "技能-升级", callback: fun(trg: Trigger, data: EventParam.技能-升级)): Trigger
---@field event fun(self: Ability, event: "施法-即将开始", callback: fun(trg: Trigger, data: EventParam.施法-即将开始)): Trigger
---@field event fun(self: Ability, event: "施法-开始", callback: fun(trg: Trigger, data: EventParam.施法-开始)): Trigger
---@field event fun(self: Ability, event: "施法-引导", callback: fun(trg: Trigger, data: EventParam.施法-引导)): Trigger
---@field event fun(self: Ability, event: "施法-出手", callback: fun(trg: Trigger, data: EventParam.施法-出手)): Trigger
---@field event fun(self: Ability, event: "施法-完成", callback: fun(trg: Trigger, data: EventParam.施法-完成)): Trigger
---@field event fun(self: Ability, event: "施法-结束", callback: fun(trg: Trigger, data: EventParam.施法-结束)): Trigger
---@field event fun(self: Ability, event: "施法-打断开始", callback: fun(trg: Trigger, data: EventParam.施法-打断开始)): Trigger
---@field event fun(self: Ability, event: "施法-打断引导", callback: fun(trg: Trigger, data: EventParam.施法-打断引导)): Trigger
---@field event fun(self: Ability, event: "施法-打断出手", callback: fun(trg: Trigger, data: EventParam.施法-打断出手)): Trigger
---@field event fun(self: Ability, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: Ability, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: Ability, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: Ability, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: Ability, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: Ability, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: Ability, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: Ability, event: "技能-打开指示器", callback: fun(trg: Trigger, data: EventParam.技能-打开指示器)): Trigger
---@field event fun(self: Ability, event: "技能-建造技能释放前", callback: fun(trg: Trigger, data: EventParam.技能-建造技能释放前)): Trigger
---@field event fun(self: Ability, event: "技能-关闭指示器", callback: fun(trg: Trigger, data: EventParam.技能-关闭指示器)): Trigger

---@class Area
---@field event fun(self: Area, event: "区域-进入", callback: fun(trg: Trigger, data: EventParam.区域-进入)): Trigger
---@field event fun(self: Area, event: "区域-离开", callback: fun(trg: Trigger, data: EventParam.区域-离开)): Trigger

---@class Buff
---@field event fun(self: Buff, event: "效果-获得", callback: fun(trg: Trigger, data: EventParam.效果-获得)): Trigger
---@field event fun(self: Buff, event: "效果-失去", callback: fun(trg: Trigger, data: EventParam.效果-失去)): Trigger
---@field event fun(self: Buff, event: "效果-心跳", callback: fun(trg: Trigger, data: EventParam.效果-心跳)): Trigger
---@field event fun(self: Buff, event: "效果-叠加", callback: fun(trg: Trigger, data: EventParam.效果-叠加)): Trigger
---@field event fun(self: Buff, event: "效果-层数变化", callback: fun(trg: Trigger, data: EventParam.效果-层数变化)): Trigger
---@field event fun(self: Buff, event: "效果-即将获得", callback: fun(trg: Trigger, data: EventParam.效果-即将获得)): Trigger
---@field event fun(self: Buff, event: "效果-覆盖", callback: fun(trg: Trigger, data: EventParam.效果-覆盖)): Trigger

---@class Destructible
---@field event fun(self: Destructible, event: "可破坏物-创建", callback: fun(trg: Trigger, data: EventParam.可破坏物-创建)): Trigger
---@field event fun(self: Destructible, event: "可破坏物-死亡", callback: fun(trg: Trigger, data: EventParam.可破坏物-死亡)): Trigger
---@field event fun(self: Destructible, event: "可破坏物-复活", callback: fun(trg: Trigger, data: EventParam.可破坏物-复活)): Trigger
---@field event fun(self: Destructible, event: "可破坏物-资源变化", callback: fun(trg: Trigger, data: EventParam.可破坏物-资源变化)): Trigger
---@field event fun(self: Destructible, event: "可破坏物-采集", callback: fun(trg: Trigger, data: EventParam.可破坏物-采集)): Trigger
---@field event fun(self: Destructible, event: "可破坏物-受到伤害", callback: fun(trg: Trigger, data: EventParam.可破坏物-受到伤害)): Trigger
---@field event fun(self: Destructible, event: "可破坏物-移除", callback: fun(trg: Trigger, data: EventParam.可破坏物-移除)): Trigger

---@class Item
---@field event fun(self: Item, event: "物品-获得", callback: fun(trg: Trigger, data: EventParam.物品-获得)): Trigger
---@field event fun(self: Item, event: "物品-进入物品栏", callback: fun(trg: Trigger, data: EventParam.物品-进入物品栏)): Trigger
---@field event fun(self: Item, event: "物品-进入背包", callback: fun(trg: Trigger, data: EventParam.物品-进入背包)): Trigger
---@field event fun(self: Item, event: "物品-失去", callback: fun(trg: Trigger, data: EventParam.物品-失去)): Trigger
---@field event fun(self: Item, event: "物品-离开物品栏", callback: fun(trg: Trigger, data: EventParam.物品-离开物品栏)): Trigger
---@field event fun(self: Item, event: "物品-离开背包", callback: fun(trg: Trigger, data: EventParam.物品-离开背包)): Trigger
---@field event fun(self: Item, event: "物品-使用", callback: fun(trg: Trigger, data: EventParam.物品-使用)): Trigger
---@field event fun(self: Item, event: "物品-堆叠变化", callback: fun(trg: Trigger, data: EventParam.物品-堆叠变化)): Trigger
---@field event fun(self: Item, event: "物品-充能变化", callback: fun(trg: Trigger, data: EventParam.物品-充能变化)): Trigger
---@field event fun(self: Item, event: "物品-创建", callback: fun(trg: Trigger, data: EventParam.物品-创建)): Trigger
---@field event fun(self: Item, event: "物品-移除", callback: fun(trg: Trigger, data: EventParam.物品-移除)): Trigger
---@field event fun(self: Item, event: "物品-出售", callback: fun(trg: Trigger, data: EventParam.物品-出售)): Trigger
---@field event fun(self: Item, event: "物品-死亡", callback: fun(trg: Trigger, data: EventParam.物品-死亡)): Trigger
---@field event fun(self: Item, event: "物品-采集创建", callback: fun(trg: Trigger, data: EventParam.物品-采集创建)): Trigger

---@class Player
---@field event fun(self: Player, event: "玩家-加入游戏", callback: fun(trg: Trigger, data: EventParam.玩家-加入游戏)): Trigger
---@field event fun(self: Player, event: "玩家-离开游戏", callback: fun(trg: Trigger, data: EventParam.玩家-离开游戏)): Trigger
---@field event fun(self: Player, event: "玩家-掉线", callback: fun(trg: Trigger, data: EventParam.玩家-掉线)): Trigger
---@field event fun(self: Player, event: "玩家-使用平台道具", callback: fun(trg: Trigger, data: EventParam.玩家-使用平台道具)): Trigger
---@field event fun(self: Player, event: "玩家-持有平台道具", callback: fun(trg: Trigger, data: EventParam.玩家-持有平台道具)): Trigger
---@field event fun(self: Player, event: "玩家-属性变化", callback: fun(trg: Trigger, data: EventParam.玩家-属性变化)): Trigger
---@field event fun(self: Player, event: "玩家-发送指定消息", msg: string, callback: fun(trg: Trigger, data: EventParam.玩家-发送指定消息)): Trigger
---@field event fun(self: Player, event: "玩家-科技提升", callback: fun(trg: Trigger, data: EventParam.玩家-科技提升)): Trigger
---@field event fun(self: Player, event: "玩家-科技降低", callback: fun(trg: Trigger, data: EventParam.玩家-科技降低)): Trigger
---@field event fun(self: Player, event: "玩家-科技变化", callback: fun(trg: Trigger, data: EventParam.玩家-科技变化)): Trigger
---@field event fun(self: Player, event: "玩家-关系变化", callback: fun(trg: Trigger, data: EventParam.玩家-关系变化)): Trigger
---@field event fun(self: Player, event: "玩家-重连", callback: fun(trg: Trigger, data: EventParam.玩家-重连)): Trigger
---@field event fun(self: Player, event: "选中-可破坏物", callback: fun(trg: Trigger, data: EventParam.选中-可破坏物)): Trigger
---@field event fun(self: Player, event: "本地-选中-可破坏物", callback: fun(trg: Trigger, data: EventParam.本地-选中-可破坏物)): Trigger
---@field event fun(self: Player, event: "界面-消息", event_name: string, callback: fun(trg: Trigger, data: EventParam.界面-消息)): Trigger
---@field event fun(self: Player, event: "界面-滑动条变化", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-滑动条变化)): Trigger
---@field event fun(self: Player, event: "界面-聊天框可见性变化", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-聊天框可见性变化)): Trigger
---@field event fun(self: Player, event: "界面-装备拖拽", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-装备拖拽)): Trigger
---@field event fun(self: Player, event: "界面-复选框变化", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-复选框变化)): Trigger
---@field event fun(self: Player, event: "界面-视频播放完成", ui: UI, callback: fun(trg: Trigger, data: EventParam.界面-视频播放完成)): Trigger
---@field event fun(self: Player, event: "本地-界面-输入框获取焦点", ui: UI, callback: fun(trg: Trigger, data: EventParam.本地-界面-输入框获取焦点)): Trigger
---@field event fun(self: Player, event: "本地-界面-输入框失去焦点", ui: UI, callback: fun(trg: Trigger, data: EventParam.本地-界面-输入框失去焦点)): Trigger
---@field event fun(self: Player, event: "本地-界面-输入框内容改变", ui: UI, callback: fun(trg: Trigger, data: EventParam.本地-界面-输入框内容改变)): Trigger
---@field event fun(self: Player, event: "键盘-按下", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.键盘-按下)): Trigger
---@field event fun(self: Player, event: "键盘-抬起", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.键盘-抬起)): Trigger
---@field event fun(self: Player, event: "本地-键盘-按下", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-键盘-按下)): Trigger
---@field event fun(self: Player, event: "本地-键盘-抬起", key: y3.Const.KeyboardKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-键盘-抬起)): Trigger
---@field event fun(self: Player, event: "鼠标-按下", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-按下)): Trigger
---@field event fun(self: Player, event: "鼠标-抬起", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-抬起)): Trigger
---@field event fun(self: Player, event: "鼠标-双击", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-双击)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-按下", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-按下)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-抬起", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-抬起)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-双击", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-双击)): Trigger
---@field event fun(self: Player, event: "鼠标-按下单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-按下单位)): Trigger
---@field event fun(self: Player, event: "鼠标-抬起单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-抬起单位)): Trigger
---@field event fun(self: Player, event: "鼠标-双击单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-双击单位)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-按下单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-按下单位)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-抬起单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-抬起单位)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-双击单位", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-双击单位)): Trigger
---@field event fun(self: Player, event: "鼠标-移动", callback: fun(trg: Trigger, data: EventParam.鼠标-移动)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-移动", callback: fun(trg: Trigger, data: EventParam.本地-鼠标-移动)): Trigger
---@field event fun(self: Player, event: "鼠标-滚轮", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.鼠标-滚轮)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-滚轮", key: y3.Const.MouseKey|integer, callback: fun(trg: Trigger, data: EventParam.本地-鼠标-滚轮)): Trigger
---@field event fun(self: Player, event: "选中-单位", callback: fun(trg: Trigger, data: EventParam.选中-单位)): Trigger
---@field event fun(self: Player, event: "本地-选中-单位", callback: fun(trg: Trigger, data: EventParam.本地-选中-单位)): Trigger
---@field event fun(self: Player, event: "选中-取消", callback: fun(trg: Trigger, data: EventParam.选中-取消)): Trigger
---@field event fun(self: Player, event: "本地-选中-取消", callback: fun(trg: Trigger, data: EventParam.本地-选中-取消)): Trigger
---@field event fun(self: Player, event: "选中-失去单位", callback: fun(trg: Trigger, data: EventParam.选中-失去单位)): Trigger
---@field event fun(self: Player, event: "本地-选中-失去单位", callback: fun(trg: Trigger, data: EventParam.本地-选中-失去单位)): Trigger
---@field event fun(self: Player, event: "选中-物品", callback: fun(trg: Trigger, data: EventParam.选中-物品)): Trigger
---@field event fun(self: Player, event: "本地-选中-物品", callback: fun(trg: Trigger, data: EventParam.本地-选中-物品)): Trigger
---@field event fun(self: Player, event: "玩家-检测到作弊", callback: fun(trg: Trigger, data: EventParam.玩家-检测到作弊)): Trigger
---@field event fun(self: Player, event: "鼠标-双击物品", callback: fun(trg: Trigger, data: EventParam.鼠标-双击物品)): Trigger
---@field event fun(self: Player, event: "鼠标-双击可破坏物", callback: fun(trg: Trigger, data: EventParam.鼠标-双击可破坏物)): Trigger
---@field event fun(self: Player, event: "选中-单位组", callback: fun(trg: Trigger, data: EventParam.选中-单位组)): Trigger
---@field event fun(self: Player, event: "本地-选中-单位组", callback: fun(trg: Trigger, data: EventParam.本地-选中-单位组)): Trigger
---@field event fun(self: Player, event: "鼠标-悬停", callback: fun(trg: Trigger, data: EventParam.鼠标-悬停)): Trigger
---@field event fun(self: Player, event: "本地-鼠标-悬停", callback: fun(trg: Trigger, data: EventParam.本地-鼠标-悬停)): Trigger
---@field event fun(self: Player, event: "玩家-发送消息", callback: fun(trg: Trigger, data: EventParam.玩家-发送消息)): Trigger
---@field event fun(self: Player, event: "玩家-语音发言", callback: fun(trg: Trigger, data: EventParam.玩家-语音发言)): Trigger
---@field event fun(self: Player, event: "玩家-平台道具变化", callback: fun(trg: Trigger, data: EventParam.玩家-平台道具变化)): Trigger
---@field event fun(self: Player, event: "玩家-平台商城窗口变化", callback: fun(trg: Trigger, data: EventParam.玩家-平台商城窗口变化)): Trigger

---@class Projectile
---@field event fun(self: Projectile, event: "投射物-创建", callback: fun(trg: Trigger, data: EventParam.投射物-创建)): Trigger
---@field event fun(self: Projectile, event: "投射物-死亡", callback: fun(trg: Trigger, data: EventParam.投射物-死亡)): Trigger

---@class Unit
---@field event fun(self: Unit, event: "单位-研发科技", callback: fun(trg: Trigger, data: EventParam.单位-研发科技)): Trigger
---@field event fun(self: Unit, event: "单位-获得科技", callback: fun(trg: Trigger, data: EventParam.单位-获得科技)): Trigger
---@field event fun(self: Unit, event: "单位-失去科技", callback: fun(trg: Trigger, data: EventParam.单位-失去科技)): Trigger
---@field event fun(self: Unit, event: "单位-建筑升级开始", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级开始)): Trigger
---@field event fun(self: Unit, event: "单位-建筑升级取消", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级取消)): Trigger
---@field event fun(self: Unit, event: "单位-建筑升级完成", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级完成)): Trigger
---@field event fun(self: Unit, event: "单位-建造开始", callback: fun(trg: Trigger, data: EventParam.单位-建造开始)): Trigger
---@field event fun(self: Unit, event: "单位-建造取消", callback: fun(trg: Trigger, data: EventParam.单位-建造取消)): Trigger
---@field event fun(self: Unit, event: "单位-建造完成", callback: fun(trg: Trigger, data: EventParam.单位-建造完成)): Trigger
---@field event fun(self: Unit, event: "技能-建造完成", callback: fun(trg: Trigger, data: EventParam.技能-建造完成)): Trigger
---@field event fun(self: Unit, event: "单位-普攻命中", callback: fun(trg: Trigger, data: EventParam.单位-普攻命中)): Trigger
---@field event fun(self: Unit, event: "单位-普攻造成伤害", callback: fun(trg: Trigger, data: EventParam.单位-普攻造成伤害)): Trigger
---@field event fun(self: Unit, event: "技能-学习", callback: fun(trg: Trigger, data: EventParam.技能-学习)): Trigger
---@field event fun(self: Unit, event: "技能-可用状态变化", callback: fun(trg: Trigger, data: EventParam.技能-可用状态变化)): Trigger
---@field event fun(self: Unit, event: "技能-沉默状态变化", callback: fun(trg: Trigger, data: EventParam.技能-沉默状态变化)): Trigger
---@field event fun(self: Unit, event: "单位-名称变化", callback: fun(trg: Trigger, data: EventParam.单位-名称变化)): Trigger
---@field event fun(self: Unit, event: "单位-小地图图标变化", callback: fun(trg: Trigger, data: EventParam.单位-小地图图标变化)): Trigger
---@field event fun(self: Unit, event: "单位-头像变化", callback: fun(trg: Trigger, data: EventParam.单位-头像变化)): Trigger
---@field event fun(self: Unit, event: "单位-移除", callback: fun(trg: Trigger, data: EventParam.单位-移除)): Trigger
---@field event fun(self: Unit, event: "单位-移除后", callback: fun(trg: Trigger, data: EventParam.单位-移除后)): Trigger
---@field event fun(self: Unit, event: "单位-传送结束", callback: fun(trg: Trigger, data: EventParam.单位-传送结束)): Trigger
---@field event fun(self: Unit, event: "单位-属性变化", attr: string, callback: fun(trg: Trigger, data: EventParam.单位-属性变化)): Trigger
---@field event fun(self: Unit, event: "单位-即将死亡", callback: fun(trg: Trigger, data: EventParam.单位-即将死亡)): Trigger
---@field event fun(self: Unit, event: "单位-死亡", callback: fun(trg: Trigger, data: EventParam.单位-死亡)): Trigger
---@field event fun(self: Unit, event: "单位-受到伤害前", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害前)): Trigger
---@field event fun(self: Unit, event: "单位-造成伤害前", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害前)): Trigger
---@field event fun(self: Unit, event: "单位-受到伤害时", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害时)): Trigger
---@field event fun(self: Unit, event: "单位-造成伤害时", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害时)): Trigger
---@field event fun(self: Unit, event: "单位-造成伤害后", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害后)): Trigger
---@field event fun(self: Unit, event: "单位-受到伤害后", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害后)): Trigger
---@field event fun(self: Unit, event: "单位-受到治疗前", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗前)): Trigger
---@field event fun(self: Unit, event: "单位-受到治疗后", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗后)): Trigger
---@field event fun(self: Unit, event: "单位-受到治疗时", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗时)): Trigger
---@field event fun(self: Unit, event: "单位-施放技能", callback: fun(trg: Trigger, data: EventParam.单位-施放技能)): Trigger
---@field event fun(self: Unit, event: "单位-获得经验前", callback: fun(trg: Trigger, data: EventParam.单位-获得经验前)): Trigger
---@field event fun(self: Unit, event: "单位-获得经验后", callback: fun(trg: Trigger, data: EventParam.单位-获得经验后)): Trigger
---@field event fun(self: Unit, event: "单位-接收命令", callback: fun(trg: Trigger, data: EventParam.单位-接收命令)): Trigger
---@field event fun(self: Unit, event: "单位-击杀", callback: fun(trg: Trigger, data: EventParam.单位-击杀)): Trigger
---@field event fun(self: Unit, event: "单位-创建", callback: fun(trg: Trigger, data: EventParam.单位-创建)): Trigger
---@field event fun(self: Unit, event: "单位-进入战斗", callback: fun(trg: Trigger, data: EventParam.单位-进入战斗)): Trigger
---@field event fun(self: Unit, event: "单位-脱离战斗", callback: fun(trg: Trigger, data: EventParam.单位-脱离战斗)): Trigger
---@field event fun(self: Unit, event: "单位-即将拾取物品", callback: fun(trg: Trigger, data: EventParam.单位-即将拾取物品)): Trigger
---@field event fun(self: Unit, event: "单位-即将索敌", callback: fun(trg: Trigger, data: EventParam.单位-即将索敌)): Trigger
---@field event fun(self: Unit, event: "单位-发现目标", callback: fun(trg: Trigger, data: EventParam.单位-发现目标)): Trigger
---@field event fun(self: Unit, event: "单位-购买物品", callback: fun(trg: Trigger, data: EventParam.单位-购买物品)): Trigger
---@field event fun(self: Unit, event: "单位-购买单位", callback: fun(trg: Trigger, data: EventParam.单位-购买单位)): Trigger
---@field event fun(self: Unit, event: "单位-出售物品", callback: fun(trg: Trigger, data: EventParam.单位-出售物品)): Trigger
---@field event fun(self: Unit, event: "单位-物品合成", callback: fun(trg: Trigger, data: EventParam.单位-物品合成)): Trigger
---@field event fun(self: Unit, event: "单位-购买物品合成", callback: fun(trg: Trigger, data: EventParam.单位-购买物品合成)): Trigger
---@field event fun(self: Unit, event: "单位-复活", callback: fun(trg: Trigger, data: EventParam.单位-复活)): Trigger
---@field event fun(self: Unit, event: "单位-升级", callback: fun(trg: Trigger, data: EventParam.单位-升级)): Trigger
---@field event fun(self: Unit, event: "单位-进入草丛", callback: fun(trg: Trigger, data: EventParam.单位-进入草丛)): Trigger
---@field event fun(self: Unit, event: "单位-离开草丛", callback: fun(trg: Trigger, data: EventParam.单位-离开草丛)): Trigger
---@field event fun(self: Unit, event: "单位-改变所属", callback: fun(trg: Trigger, data: EventParam.单位-改变所属)): Trigger
---@field event fun(self: Unit, event: "技能类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.技能类型-前置条件成立)): Trigger
---@field event fun(self: Unit, event: "技能类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.技能类型-前置条件不成立)): Trigger
---@field event fun(self: Unit, event: "科技类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.科技类型-前置条件成立)): Trigger
---@field event fun(self: Unit, event: "科技类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.科技类型-前置条件不成立)): Trigger
---@field event fun(self: Unit, event: "技能-升级", callback: fun(trg: Trigger, data: EventParam.技能-升级)): Trigger
---@field event fun(self: Unit, event: "施法-即将开始", callback: fun(trg: Trigger, data: EventParam.施法-即将开始)): Trigger
---@field event fun(self: Unit, event: "施法-开始", callback: fun(trg: Trigger, data: EventParam.施法-开始)): Trigger
---@field event fun(self: Unit, event: "施法-引导", callback: fun(trg: Trigger, data: EventParam.施法-引导)): Trigger
---@field event fun(self: Unit, event: "施法-出手", callback: fun(trg: Trigger, data: EventParam.施法-出手)): Trigger
---@field event fun(self: Unit, event: "施法-完成", callback: fun(trg: Trigger, data: EventParam.施法-完成)): Trigger
---@field event fun(self: Unit, event: "施法-结束", callback: fun(trg: Trigger, data: EventParam.施法-结束)): Trigger
---@field event fun(self: Unit, event: "施法-打断开始", callback: fun(trg: Trigger, data: EventParam.施法-打断开始)): Trigger
---@field event fun(self: Unit, event: "施法-打断引导", callback: fun(trg: Trigger, data: EventParam.施法-打断引导)): Trigger
---@field event fun(self: Unit, event: "施法-打断出手", callback: fun(trg: Trigger, data: EventParam.施法-打断出手)): Trigger
---@field event fun(self: Unit, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: Unit, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: Unit, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: Unit, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: Unit, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: Unit, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: Unit, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: Unit, event: "效果-获得", callback: fun(trg: Trigger, data: EventParam.效果-获得)): Trigger
---@field event fun(self: Unit, event: "效果-失去", callback: fun(trg: Trigger, data: EventParam.效果-失去)): Trigger
---@field event fun(self: Unit, event: "效果-心跳", callback: fun(trg: Trigger, data: EventParam.效果-心跳)): Trigger
---@field event fun(self: Unit, event: "效果-叠加", callback: fun(trg: Trigger, data: EventParam.效果-叠加)): Trigger
---@field event fun(self: Unit, event: "效果-层数变化", callback: fun(trg: Trigger, data: EventParam.效果-层数变化)): Trigger
---@field event fun(self: Unit, event: "效果-即将获得", callback: fun(trg: Trigger, data: EventParam.效果-即将获得)): Trigger
---@field event fun(self: Unit, event: "效果-覆盖", callback: fun(trg: Trigger, data: EventParam.效果-覆盖)): Trigger
---@field event fun(self: Unit, event: "技能-打开指示器", callback: fun(trg: Trigger, data: EventParam.技能-打开指示器)): Trigger
---@field event fun(self: Unit, event: "技能-建造技能释放前", callback: fun(trg: Trigger, data: EventParam.技能-建造技能释放前)): Trigger
---@field event fun(self: Unit, event: "技能-关闭指示器", callback: fun(trg: Trigger, data: EventParam.技能-关闭指示器)): Trigger
---@field event fun(self: Unit, event: "单位-寻路开始", callback: fun(trg: Trigger, data: EventParam.单位-寻路开始)): Trigger
---@field event fun(self: Unit, event: "单位-寻路结束", callback: fun(trg: Trigger, data: EventParam.单位-寻路结束)): Trigger
---@field event fun(self: Unit, event: "命令-攻击移动", callback: fun(trg: Trigger, data: EventParam.命令-攻击移动)): Trigger
---@field event fun(self: Unit, event: "命令-出售物品", callback: fun(trg: Trigger, data: EventParam.命令-出售物品)): Trigger
---@field event fun(self: Unit, event: "命令-施放技能", callback: fun(trg: Trigger, data: EventParam.命令-施放技能)): Trigger
---@field event fun(self: Unit, event: "命令-巡逻", callback: fun(trg: Trigger, data: EventParam.命令-巡逻)): Trigger
---@field event fun(self: Unit, event: "命令-移动", callback: fun(trg: Trigger, data: EventParam.命令-移动)): Trigger

---@class EditorObject.Ability
---@field event fun(self: EditorObject.Ability, event: "技能-建造完成", callback: fun(trg: Trigger, data: EventParam.技能-建造完成)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-学习", callback: fun(trg: Trigger, data: EventParam.技能-学习)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-可用状态变化", callback: fun(trg: Trigger, data: EventParam.技能-可用状态变化)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-沉默状态变化", callback: fun(trg: Trigger, data: EventParam.技能-沉默状态变化)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-升级", callback: fun(trg: Trigger, data: EventParam.技能-升级)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-即将开始", callback: fun(trg: Trigger, data: EventParam.施法-即将开始)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-开始", callback: fun(trg: Trigger, data: EventParam.施法-开始)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-引导", callback: fun(trg: Trigger, data: EventParam.施法-引导)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-出手", callback: fun(trg: Trigger, data: EventParam.施法-出手)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-完成", callback: fun(trg: Trigger, data: EventParam.施法-完成)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-结束", callback: fun(trg: Trigger, data: EventParam.施法-结束)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-打断开始", callback: fun(trg: Trigger, data: EventParam.施法-打断开始)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-打断引导", callback: fun(trg: Trigger, data: EventParam.施法-打断引导)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-打断出手", callback: fun(trg: Trigger, data: EventParam.施法-打断出手)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-打开指示器", callback: fun(trg: Trigger, data: EventParam.技能-打开指示器)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-建造技能释放前", callback: fun(trg: Trigger, data: EventParam.技能-建造技能释放前)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-关闭指示器", callback: fun(trg: Trigger, data: EventParam.技能-关闭指示器)): Trigger

---@class EditorObject.Buff
---@field event fun(self: EditorObject.Buff, event: "效果-获得", callback: fun(trg: Trigger, data: EventParam.效果-获得)): Trigger
---@field event fun(self: EditorObject.Buff, event: "效果-失去", callback: fun(trg: Trigger, data: EventParam.效果-失去)): Trigger
---@field event fun(self: EditorObject.Buff, event: "效果-心跳", callback: fun(trg: Trigger, data: EventParam.效果-心跳)): Trigger
---@field event fun(self: EditorObject.Buff, event: "效果-叠加", callback: fun(trg: Trigger, data: EventParam.效果-叠加)): Trigger
---@field event fun(self: EditorObject.Buff, event: "效果-层数变化", callback: fun(trg: Trigger, data: EventParam.效果-层数变化)): Trigger
---@field event fun(self: EditorObject.Buff, event: "效果-即将获得", callback: fun(trg: Trigger, data: EventParam.效果-即将获得)): Trigger
---@field event fun(self: EditorObject.Buff, event: "效果-覆盖", callback: fun(trg: Trigger, data: EventParam.效果-覆盖)): Trigger

---@class EditorObject.Item
---@field event fun(self: EditorObject.Item, event: "物品-获得", callback: fun(trg: Trigger, data: EventParam.物品-获得)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-进入物品栏", callback: fun(trg: Trigger, data: EventParam.物品-进入物品栏)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-进入背包", callback: fun(trg: Trigger, data: EventParam.物品-进入背包)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-失去", callback: fun(trg: Trigger, data: EventParam.物品-失去)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-离开物品栏", callback: fun(trg: Trigger, data: EventParam.物品-离开物品栏)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-离开背包", callback: fun(trg: Trigger, data: EventParam.物品-离开背包)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-使用", callback: fun(trg: Trigger, data: EventParam.物品-使用)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-堆叠变化", callback: fun(trg: Trigger, data: EventParam.物品-堆叠变化)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-充能变化", callback: fun(trg: Trigger, data: EventParam.物品-充能变化)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-创建", callback: fun(trg: Trigger, data: EventParam.物品-创建)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-移除", callback: fun(trg: Trigger, data: EventParam.物品-移除)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-出售", callback: fun(trg: Trigger, data: EventParam.物品-出售)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-死亡", callback: fun(trg: Trigger, data: EventParam.物品-死亡)): Trigger
---@field event fun(self: EditorObject.Item, event: "物品-采集创建", callback: fun(trg: Trigger, data: EventParam.物品-采集创建)): Trigger

---@class EditorObject.Projectile
---@field event fun(self: EditorObject.Projectile, event: "投射物-创建", callback: fun(trg: Trigger, data: EventParam.投射物-创建)): Trigger
---@field event fun(self: EditorObject.Projectile, event: "投射物-死亡", callback: fun(trg: Trigger, data: EventParam.投射物-死亡)): Trigger

---@class EditorObject.Unit
---@field event fun(self: EditorObject.Unit, event: "单位-研发科技", callback: fun(trg: Trigger, data: EventParam.单位-研发科技)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-获得科技", callback: fun(trg: Trigger, data: EventParam.单位-获得科技)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-失去科技", callback: fun(trg: Trigger, data: EventParam.单位-失去科技)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-建筑升级开始", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级开始)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-建筑升级取消", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级取消)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-建筑升级完成", callback: fun(trg: Trigger, data: EventParam.单位-建筑升级完成)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-建造开始", callback: fun(trg: Trigger, data: EventParam.单位-建造开始)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-建造取消", callback: fun(trg: Trigger, data: EventParam.单位-建造取消)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-建造完成", callback: fun(trg: Trigger, data: EventParam.单位-建造完成)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-建造完成", callback: fun(trg: Trigger, data: EventParam.技能-建造完成)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-普攻命中", callback: fun(trg: Trigger, data: EventParam.单位-普攻命中)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-普攻造成伤害", callback: fun(trg: Trigger, data: EventParam.单位-普攻造成伤害)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-学习", callback: fun(trg: Trigger, data: EventParam.技能-学习)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-可用状态变化", callback: fun(trg: Trigger, data: EventParam.技能-可用状态变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-沉默状态变化", callback: fun(trg: Trigger, data: EventParam.技能-沉默状态变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-名称变化", callback: fun(trg: Trigger, data: EventParam.单位-名称变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-小地图图标变化", callback: fun(trg: Trigger, data: EventParam.单位-小地图图标变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-头像变化", callback: fun(trg: Trigger, data: EventParam.单位-头像变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-移除", callback: fun(trg: Trigger, data: EventParam.单位-移除)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-移除后", callback: fun(trg: Trigger, data: EventParam.单位-移除后)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-传送结束", callback: fun(trg: Trigger, data: EventParam.单位-传送结束)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-即将死亡", callback: fun(trg: Trigger, data: EventParam.单位-即将死亡)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-死亡", callback: fun(trg: Trigger, data: EventParam.单位-死亡)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-受到伤害前", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害前)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-造成伤害前", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害前)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-受到伤害时", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害时)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-造成伤害时", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害时)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-造成伤害后", callback: fun(trg: Trigger, data: EventParam.单位-造成伤害后)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-受到伤害后", callback: fun(trg: Trigger, data: EventParam.单位-受到伤害后)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-受到治疗前", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗前)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-受到治疗后", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗后)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-受到治疗时", callback: fun(trg: Trigger, data: EventParam.单位-受到治疗时)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-施放技能", callback: fun(trg: Trigger, data: EventParam.单位-施放技能)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-获得经验前", callback: fun(trg: Trigger, data: EventParam.单位-获得经验前)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-获得经验后", callback: fun(trg: Trigger, data: EventParam.单位-获得经验后)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-接收命令", callback: fun(trg: Trigger, data: EventParam.单位-接收命令)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-击杀", callback: fun(trg: Trigger, data: EventParam.单位-击杀)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-创建", callback: fun(trg: Trigger, data: EventParam.单位-创建)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-进入战斗", callback: fun(trg: Trigger, data: EventParam.单位-进入战斗)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-脱离战斗", callback: fun(trg: Trigger, data: EventParam.单位-脱离战斗)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-即将拾取物品", callback: fun(trg: Trigger, data: EventParam.单位-即将拾取物品)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-即将索敌", callback: fun(trg: Trigger, data: EventParam.单位-即将索敌)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-发现目标", callback: fun(trg: Trigger, data: EventParam.单位-发现目标)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-购买物品", callback: fun(trg: Trigger, data: EventParam.单位-购买物品)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-购买单位", callback: fun(trg: Trigger, data: EventParam.单位-购买单位)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-出售物品", callback: fun(trg: Trigger, data: EventParam.单位-出售物品)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-物品合成", callback: fun(trg: Trigger, data: EventParam.单位-物品合成)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-购买物品合成", callback: fun(trg: Trigger, data: EventParam.单位-购买物品合成)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-复活", callback: fun(trg: Trigger, data: EventParam.单位-复活)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-升级", callback: fun(trg: Trigger, data: EventParam.单位-升级)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-进入草丛", callback: fun(trg: Trigger, data: EventParam.单位-进入草丛)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-离开草丛", callback: fun(trg: Trigger, data: EventParam.单位-离开草丛)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-改变所属", callback: fun(trg: Trigger, data: EventParam.单位-改变所属)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.技能类型-前置条件成立)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.技能类型-前置条件不成立)): Trigger
---@field event fun(self: EditorObject.Unit, event: "科技类型-前置条件成立", callback: fun(trg: Trigger, data: EventParam.科技类型-前置条件成立)): Trigger
---@field event fun(self: EditorObject.Unit, event: "科技类型-前置条件不成立", callback: fun(trg: Trigger, data: EventParam.科技类型-前置条件不成立)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-升级", callback: fun(trg: Trigger, data: EventParam.技能-升级)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-即将开始", callback: fun(trg: Trigger, data: EventParam.施法-即将开始)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-开始", callback: fun(trg: Trigger, data: EventParam.施法-开始)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-引导", callback: fun(trg: Trigger, data: EventParam.施法-引导)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-出手", callback: fun(trg: Trigger, data: EventParam.施法-出手)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-完成", callback: fun(trg: Trigger, data: EventParam.施法-完成)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-结束", callback: fun(trg: Trigger, data: EventParam.施法-结束)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-打断开始", callback: fun(trg: Trigger, data: EventParam.施法-打断开始)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-打断引导", callback: fun(trg: Trigger, data: EventParam.施法-打断引导)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-打断出手", callback: fun(trg: Trigger, data: EventParam.施法-打断出手)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: EditorObject.Unit, event: "效果-获得", callback: fun(trg: Trigger, data: EventParam.效果-获得)): Trigger
---@field event fun(self: EditorObject.Unit, event: "效果-失去", callback: fun(trg: Trigger, data: EventParam.效果-失去)): Trigger
---@field event fun(self: EditorObject.Unit, event: "效果-心跳", callback: fun(trg: Trigger, data: EventParam.效果-心跳)): Trigger
---@field event fun(self: EditorObject.Unit, event: "效果-叠加", callback: fun(trg: Trigger, data: EventParam.效果-叠加)): Trigger
---@field event fun(self: EditorObject.Unit, event: "效果-层数变化", callback: fun(trg: Trigger, data: EventParam.效果-层数变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "效果-即将获得", callback: fun(trg: Trigger, data: EventParam.效果-即将获得)): Trigger
---@field event fun(self: EditorObject.Unit, event: "效果-覆盖", callback: fun(trg: Trigger, data: EventParam.效果-覆盖)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-打开指示器", callback: fun(trg: Trigger, data: EventParam.技能-打开指示器)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-建造技能释放前", callback: fun(trg: Trigger, data: EventParam.技能-建造技能释放前)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-关闭指示器", callback: fun(trg: Trigger, data: EventParam.技能-关闭指示器)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-寻路开始", callback: fun(trg: Trigger, data: EventParam.单位-寻路开始)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-寻路结束", callback: fun(trg: Trigger, data: EventParam.单位-寻路结束)): Trigger
---@field event fun(self: EditorObject.Unit, event: "命令-攻击移动", callback: fun(trg: Trigger, data: EventParam.命令-攻击移动)): Trigger
---@field event fun(self: EditorObject.Unit, event: "命令-出售物品", callback: fun(trg: Trigger, data: EventParam.命令-出售物品)): Trigger
---@field event fun(self: EditorObject.Unit, event: "命令-施放技能", callback: fun(trg: Trigger, data: EventParam.命令-施放技能)): Trigger
---@field event fun(self: EditorObject.Unit, event: "命令-巡逻", callback: fun(trg: Trigger, data: EventParam.命令-巡逻)): Trigger
---@field event fun(self: EditorObject.Unit, event: "命令-移动", callback: fun(trg: Trigger, data: EventParam.命令-移动)): Trigger

return M
