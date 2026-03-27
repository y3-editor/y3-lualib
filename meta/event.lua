-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class EventConfig
local M = {}

M.config = {}

---@class EventParam.ET_LOGIC_UNIT_DESTROY
---@alias EventParam.未知-ET_LOGIC_UNIT_DESTROY EventParam.ET_LOGIC_UNIT_DESTROY
M.config["未知-ET_LOGIC_UNIT_DESTROY"] = {
    _deprecated = true,
    desc = "ET_LOGIC_UNIT_DESTROY",
    key = "ET_LOGIC_UNIT_DESTROY",
    name = "未知-ET_LOGIC_UNIT_DESTROY",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_GAME_INIT
---@alias EventParam.游戏-初始化 EventParam.ET_GAME_INIT
M.config["游戏-初始化"] = {
    desc = "游戏初始化时触发。",
    key = "ET_GAME_INIT",
    name = "游戏-初始化",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_RELAUNCH_FRAME_CATCHING_FINISHED
---@alias EventParam.游戏-追帧完成 EventParam.ET_RELAUNCH_FRAME_CATCHING_FINISHED
M.config["游戏-追帧完成"] = {
    desc = "",
    key = "ET_RELAUNCH_FRAME_CATCHING_FINISHED",
    name = "游戏-追帧完成",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_GAME_SNAPSHOT_MISMATCH
---@field int1 integer # 不同步帧号
---@alias EventParam.游戏-逻辑不同步 EventParam.ET_GAME_SNAPSHOT_MISMATCH
M.config["游戏-逻辑不同步"] = {
    desc = "",
    key = "ET_GAME_SNAPSHOT_MISMATCH",
    name = "游戏-逻辑不同步",
    params = {
    },
    event_params = {
        [1] = {
            name = "__int1",
            type = "integer",
            lua_name = "int1",
            lua_type = "integer",
            desc = "不同步帧号",
            lua_desc = "不同步帧号",
        },
    },
}

---@class EventParam.ET_SCENE_PRESET_LOADING_FINISH
---@field scene_preset py.ScenePreset # 场景预设hash
---@alias EventParam.游戏-地形预设加载完成 EventParam.ET_SCENE_PRESET_LOADING_FINISH
M.config["游戏-地形预设加载完成"] = {
    desc = "",
    key = "ET_SCENE_PRESET_LOADING_FINISH",
    name = "游戏-地形预设加载完成",
    params = {
    },
    event_params = {
        [1] = {
            name = "__scene_preset",
            type = "py.ScenePreset",
            lua_name = "scene_preset",
            lua_type = "py.ScenePreset",
            desc = "场景预设hash",
            lua_desc = "场景预设hash",
        },
    },
}

---@class EventParam.ET_RECV_TRIGGER
---@field trigger_id py.TriggerID # 触发器id
---@alias EventParam.未知-ET_RECV_TRIGGER EventParam.ET_RECV_TRIGGER
M.config["未知-ET_RECV_TRIGGER"] = {
    _deprecated = true,
    desc = "ET_RECV_TRIGGER",
    key = "ET_RECV_TRIGGER",
    name = "未知-ET_RECV_TRIGGER",
    params = {
    },
    event_params = {
        [1] = {
            name = "__trigger_id",
            type = "py.TriggerID",
            lua_name = "trigger_id",
            lua_type = "py.TriggerID",
            desc = "触发器id",
            lua_desc = "触发器id",
        },
    },
}

---@class EventParam.ET_GAME_END
---@alias EventParam.游戏-结束 EventParam.ET_GAME_END
M.config["游戏-结束"] = {
    desc = "游戏结束时触发",
    key = "ET_GAME_END",
    name = "游戏-结束",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_GAME_PAUSE
---@alias EventParam.游戏-暂停 EventParam.ET_GAME_PAUSE
M.config["游戏-暂停"] = {
    desc = "游戏暂停时触发",
    key = "ET_GAME_PAUSE",
    name = "游戏-暂停",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_GAME_RESUME
---@alias EventParam.游戏-恢复 EventParam.ET_GAME_RESUME
M.config["游戏-恢复"] = {
    desc = "游戏恢复时触发",
    key = "ET_GAME_RESUME",
    name = "游戏-恢复",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_EMPTY
---@alias EventParam.未知-ET_EMPTY EventParam.ET_EMPTY
M.config["未知-ET_EMPTY"] = {
    _deprecated = true,
    desc = "ET_EMPTY",
    key = "ET_EMPTY",
    name = "未知-ET_EMPTY",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.TIMER_TIMEOUT
---@field name string # 计时器名称
---@alias EventParam.未知-TIMER_TIMEOUT EventParam.TIMER_TIMEOUT
M.config["未知-TIMER_TIMEOUT"] = {
    _deprecated = true,
    desc = "TIMER_TIMEOUT",
    key = "TIMER_TIMEOUT",
    name = "未知-TIMER_TIMEOUT",
    params = {
    },
    event_params = {
        [1] = {
            name = "__name",
            type = "string",
            lua_name = "name",
            lua_type = "string",
            desc = "计时器名称",
            lua_desc = "计时器名称",
        },
    },
}

---@class EventParam.ET_DAY_NIGHT_CHANGE
---@field is_day_to_night boolean # 是否是白天转到黑夜
---@alias EventParam.游戏-昼夜变化 EventParam.ET_DAY_NIGHT_CHANGE
M.config["游戏-昼夜变化"] = {
    desc = "通过参数判断进入白天还是进入夜晚",
    key = "ET_DAY_NIGHT_CHANGE",
    name = "游戏-昼夜变化",
    params = {
    },
    event_params = {
        [1] = {
            name = "__is_day_to_night",
            type = "boolean",
            lua_name = "is_day_to_night",
            lua_type = "boolean",
            desc = "是否是白天转到黑夜",
            lua_desc = "是否是白天转到黑夜",
        },
    },
}

---@class EventParam.ET_CONTAINER_ADDED
---@field name string # 容器名
---@field container py.ActorContainer # 容器
---@alias EventParam.未知-ET_CONTAINER_ADDED EventParam.ET_CONTAINER_ADDED
M.config["未知-ET_CONTAINER_ADDED"] = {
    _deprecated = true,
    desc = "ET_CONTAINER_ADDED",
    key = "ET_CONTAINER_ADDED",
    name = "未知-ET_CONTAINER_ADDED",
    params = {
    },
    event_params = {
        [1] = {
            name = "__name",
            type = "string",
            lua_name = "name",
            lua_type = "string",
            desc = "容器名",
            lua_desc = "容器名",
        },
        [2] = {
            name = "__container",
            type = "py.ActorContainer",
            lua_name = "container",
            lua_type = "py.ActorContainer",
            desc = "容器",
            lua_desc = "容器",
        },
    },
}

---@class EventParam.ET_CONTAINER_ACTOR_ADDED
---@field owner py.Actor # 容器从属actor
---@alias EventParam.未知-ET_CONTAINER_ACTOR_ADDED EventParam.ET_CONTAINER_ACTOR_ADDED
M.config["未知-ET_CONTAINER_ACTOR_ADDED"] = {
    _deprecated = true,
    desc = "ET_CONTAINER_ACTOR_ADDED",
    key = "ET_CONTAINER_ACTOR_ADDED",
    name = "未知-ET_CONTAINER_ACTOR_ADDED",
    params = {
    },
    event_params = {
        [1] = {
            name = "__owner",
            type = "py.Actor",
            lua_name = "owner",
            lua_type = "py.Actor",
            desc = "容器从属actor",
            lua_desc = "容器从属actor",
        },
    },
}

---@class EventParam.ET_CONTAINER_ACTOR_REMOVED
---@field owner py.Actor # 原容器从属actor
---@alias EventParam.未知-ET_CONTAINER_ACTOR_REMOVED EventParam.ET_CONTAINER_ACTOR_REMOVED
M.config["未知-ET_CONTAINER_ACTOR_REMOVED"] = {
    _deprecated = true,
    desc = "ET_CONTAINER_ACTOR_REMOVED",
    key = "ET_CONTAINER_ACTOR_REMOVED",
    name = "未知-ET_CONTAINER_ACTOR_REMOVED",
    params = {
    },
    event_params = {
        [1] = {
            name = "__owner",
            type = "py.Actor",
            lua_name = "owner",
            lua_type = "py.Actor",
            desc = "原容器从属actor",
            lua_desc = "原容器从属actor",
        },
    },
}

---@class EventParam.ET_ACTOR_ATTR_UPDATED
---@field name string # 属性名
---@alias EventParam.未知-ET_ACTOR_ATTR_UPDATED EventParam.ET_ACTOR_ATTR_UPDATED
M.config["未知-ET_ACTOR_ATTR_UPDATED"] = {
    _deprecated = true,
    desc = "ET_ACTOR_ATTR_UPDATED",
    key = "ET_ACTOR_ATTR_UPDATED",
    name = "未知-ET_ACTOR_ATTR_UPDATED",
    params = {
    },
    event_params = {
        [1] = {
            name = "__name",
            type = "string",
            lua_name = "name",
            lua_type = "string",
            desc = "属性名",
            lua_desc = "属性名",
        },
    },
}

---@class EventParam.ET_AREA_ENTER
---@field unit Unit # 单位
---@field area Area # 区域
---@field trigger_id py.TriggerID # 触发器ID
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
    event_params = {
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
    },
}

---@class EventParam.ET_AREA_LEAVE
---@field unit Unit # 单位
---@field area Area # 区域
---@field trigger_id py.TriggerID # 触发器ID
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
    event_params = {
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
    },
}

---@class EventParam.ET_HTTP_RESPONSE
---@field http_req string # http请求
---@field http_resp_body string # 响应内容
---@field http_resp_status string # 响应状态
---@alias EventParam.游戏-http返回 EventParam.ET_HTTP_RESPONSE
M.config["游戏-http返回"] = {
    desc = "",
    key = "ET_HTTP_RESPONSE",
    name = "游戏-http返回",
    params = {
    },
    event_params = {
        [1] = {
            name = "__http_req",
            type = "string",
            lua_name = "http_req",
            lua_type = "string",
            desc = "http请求",
            lua_desc = "http请求",
        },
        [2] = {
            name = "__http_resp_body",
            type = "string",
            lua_name = "http_resp_body",
            lua_type = "string",
            desc = "响应内容",
            lua_desc = "响应内容",
        },
        [3] = {
            name = "__http_resp_status",
            type = "string",
            lua_name = "http_resp_status",
            lua_type = "string",
            desc = "响应状态",
            lua_desc = "响应状态",
        },
    },
}

---@class EventParam.ET_BROADCAST_LUA_MSG
---@field broadcast_lua_msg_id string # 消息id
---@field broadcast_lua_msg_content string # 消息内容
---@field player Player # 玩家
---@alias EventParam.游戏-接收广播信息 EventParam.ET_BROADCAST_LUA_MSG
M.config["游戏-接收广播信息"] = {
    desc = "",
    key = "ET_BROADCAST_LUA_MSG",
    name = "游戏-接收广播信息",
    params = {
    },
    event_params = {
        [1] = {
            name = "__broadcast_lua_msg_id",
            type = "string",
            lua_name = "broadcast_lua_msg_id",
            lua_type = "string",
            desc = "消息id",
            lua_desc = "消息id",
        },
        [2] = {
            name = "__broadcast_lua_msg_content",
            type = "string",
            lua_name = "broadcast_lua_msg_content",
            lua_type = "string",
            desc = "消息内容",
            lua_desc = "消息内容",
        },
        [3] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_ROLE_JOIN_BATTLE
---@field player Player # 玩家
---@field is_middle_join boolean # 是否中途加入
---@alias EventParam.玩家-加入游戏 EventParam.ET_ROLE_JOIN_BATTLE
M.config["玩家-加入游戏"] = {
    desc = "玩家加入游戏时触发",
    key = "ET_ROLE_JOIN_BATTLE",
    name = "玩家-加入游戏",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_ACTIVE_EXIT_GAME_EVENT
---@field player Player # 玩家
---@alias EventParam.玩家-离开游戏 EventParam.ET_ROLE_ACTIVE_EXIT_GAME_EVENT
M.config["玩家-离开游戏"] = {
    desc = "玩家离开游戏时触发",
    key = "ET_ROLE_ACTIVE_EXIT_GAME_EVENT",
    name = "玩家-离开游戏",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_ROLE_LOSE_CONNECT
---@field player Player # 玩家
---@alias EventParam.玩家-掉线 EventParam.ET_ROLE_LOSE_CONNECT
M.config["玩家-掉线"] = {
    desc = "玩家掉线时触发",
    key = "ET_ROLE_LOSE_CONNECT",
    name = "玩家-掉线",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_AI_TAKE_CONTROL
---@field player Player # 玩家
---@alias EventParam.未知-ET_AI_TAKE_CONTROL EventParam.ET_AI_TAKE_CONTROL
M.config["未知-ET_AI_TAKE_CONTROL"] = {
    _deprecated = true,
    desc = "ET_AI_TAKE_CONTROL",
    key = "ET_AI_TAKE_CONTROL",
    name = "未知-ET_AI_TAKE_CONTROL",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK
---@field player Player # 玩家
---@alias EventParam.未知-ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK EventParam.ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK
M.config["未知-ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK"] = {
    _deprecated = true,
    desc = "ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK",
    key = "ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK",
    name = "未知-ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_ROLE_USE_STORE_ITEM_END
---@field player Player # 玩家
---@field store_key py.StoreKey # 收费道具编号
---@field use_cnt integer # 使用次数
---@alias EventParam.玩家-使用平台道具 EventParam.ET_ROLE_USE_STORE_ITEM_END
M.config["玩家-使用平台道具"] = {
    desc = "玩家使用平台道具时触发",
    key = "ET_ROLE_USE_STORE_ITEM_END",
    name = "玩家-使用平台道具",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_CONSUME_STORE_ITEM
---@field player Player # 玩家
---@field store_key py.StoreKey # 收费道具编号
---@alias EventParam.未知-ET_CONSUME_STORE_ITEM EventParam.ET_CONSUME_STORE_ITEM
M.config["未知-ET_CONSUME_STORE_ITEM"] = {
    _deprecated = true,
    desc = "ET_CONSUME_STORE_ITEM",
    key = "ET_CONSUME_STORE_ITEM",
    name = "未知-ET_CONSUME_STORE_ITEM",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_HOLD_STORE_ITEM
---@field player Player # 玩家
---@field store_key py.StoreKey # 收费道具编号
---@alias EventParam.玩家-持有平台道具 EventParam.ET_ROLE_HOLD_STORE_ITEM
M.config["玩家-持有平台道具"] = {
    desc = "玩家进入游戏时如果持有指定平台道具会触发",
    key = "ET_ROLE_HOLD_STORE_ITEM",
    name = "玩家-持有平台道具",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_RESOURCE_CHANGED
---@field player Player # 玩家
---@field res_key py.RoleResKey # 玩家资源类型
---@field res_value integer # 玩家资源值
---@field res_value_delta number # 玩家资源变量值
---@alias EventParam.玩家-属性变化 EventParam.ET_ROLE_RESOURCE_CHANGED
M.config["玩家-属性变化"] = {
    desc = "玩家属性变化时触发",
    key = "ET_ROLE_RESOURCE_CHANGED",
    name = "玩家-属性变化",
    object = "Player",
    params = {
    },
    event_params = {
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
            lua_type = "number",
            desc = "玩家资源变量值",
            lua_desc = "玩家资源变量值",
        },
    },
}

---@class EventParam.ET_ROLE_INPUT_MSG
---@field player Player # 玩家
---@field msg string # 字符串
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
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_INPUT_ACTIVATION_CODE
---@field player Player # 玩家
---@field activation_code_group string # 激活码组
---@alias EventParam.未知-ET_ROLE_INPUT_ACTIVATION_CODE EventParam.ET_ROLE_INPUT_ACTIVATION_CODE
M.config["未知-ET_ROLE_INPUT_ACTIVATION_CODE"] = {
    _deprecated = true,
    desc = "ET_ROLE_INPUT_ACTIVATION_CODE",
    key = "ET_ROLE_INPUT_ACTIVATION_CODE",
    name = "未知-ET_ROLE_INPUT_ACTIVATION_CODE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
        [2] = {
            name = "__activation_code_group",
            type = "string",
            lua_name = "activation_code_group",
            lua_type = "string",
            desc = "激活码组",
            lua_desc = "激活码组",
        },
    },
}

---@class EventParam.ET_ROLE_TECH_UPGRADE
---@field player Player # 玩家
---@field tech_no py.TechKey # 科技编号
---@field curr_lv integer # 当前科技等级
---@alias EventParam.玩家-科技提升 EventParam.ET_ROLE_TECH_UPGRADE
M.config["玩家-科技提升"] = {
    desc = "玩家科技每提升一级都会触发一次",
    key = "ET_ROLE_TECH_UPGRADE",
    name = "玩家-科技提升",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_TECH_DOWNGRADE
---@field player Player # 玩家
---@field tech_no py.TechKey # 科技编号
---@field curr_lv integer # 当前科技等级
---@alias EventParam.玩家-科技降低 EventParam.ET_ROLE_TECH_DOWNGRADE
M.config["玩家-科技降低"] = {
    desc = "玩家科技每降低一级都会触发一次",
    key = "ET_ROLE_TECH_DOWNGRADE",
    name = "玩家-科技降低",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_TECH_CHANGED
---@field player Player # 玩家
---@field tech_no py.TechKey # 科技编号
---@field curr_lv integer # 当前科技等级
---@field delta_lv integer # 科技变化等级
---@alias EventParam.玩家-科技变化 EventParam.ET_ROLE_TECH_CHANGED
M.config["玩家-科技变化"] = {
    desc = "玩家科技变化时触发，一次变化多个等级也只会触发一次",
    key = "ET_ROLE_TECH_CHANGED",
    name = "玩家-科技变化",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_UPGRADE_TECH
---@field unit Unit # 单位
---@field player Player # 单位所属玩家
---@field tech_no py.TechKey # 科技编号
---@alias EventParam.单位-研发科技 EventParam.ET_UNIT_UPGRADE_TECH
M.config["单位-研发科技"] = {
    desc = "单位研发科技时触发",
    key = "ET_UNIT_UPGRADE_TECH",
    name = "单位-研发科技",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_ADD_TECH
---@field unit Unit # 单位
---@field player Player # 单位所属玩家
---@field tech_no py.TechKey # 科技编号
---@alias EventParam.单位-获得科技 EventParam.ET_UNIT_ADD_TECH
M.config["单位-获得科技"] = {
    desc = "单位获得科技时触发",
    key = "ET_UNIT_ADD_TECH",
    name = "单位-获得科技",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_REMOVE_TECH
---@field unit Unit # 单位
---@field player Player # 单位所属玩家
---@field tech_no py.TechKey # 科技编号
---@alias EventParam.单位-失去科技 EventParam.ET_UNIT_REMOVE_TECH
M.config["单位-失去科技"] = {
    desc = "单位失去科技时触发",
    key = "ET_UNIT_REMOVE_TECH",
    name = "单位-失去科技",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_CHANGE_RELATION
---@field src_player Player # 源玩家
---@field dst_player Player # 目标玩家
---@field relation py.RoleRelation # 关系
---@alias EventParam.玩家-关系变化 EventParam.ET_ROLE_CHANGE_RELATION
M.config["玩家-关系变化"] = {
    desc = "玩家之间的关系改变时触发",
    key = "ET_ROLE_CHANGE_RELATION",
    name = "玩家-关系变化",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__src_role_id",
            type = "py.RoleID",
            lua_name = "src_player",
            lua_type = "Player",
            desc = "源玩家ID",
            lua_desc = "源玩家",
        },
        [2] = {
            name = "__dst_role_id",
            type = "py.RoleID",
            lua_name = "dst_player",
            lua_type = "Player",
            desc = "目标玩家ID",
            lua_desc = "目标玩家",
        },
        [3] = {
            name = "__relation",
            type = "py.RoleRelation",
            lua_name = "relation",
            lua_type = "py.RoleRelation",
            desc = "关系",
            lua_desc = "关系",
        },
    },
}

---@class EventParam.ET_ROLE_RECONNECT
---@field player Player # 玩家
---@alias EventParam.玩家-重连 EventParam.ET_ROLE_RECONNECT
M.config["玩家-重连"] = {
    desc = "玩家重连时触发",
    key = "ET_ROLE_RECONNECT",
    name = "玩家-重连",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_UNIT_BUILD_UPGRADE_START
---@field unit Unit # 开始升级的建筑单位
---@field old_unit_key py.UnitKey # 老的单位物编
---@field new_unit_key py.UnitKey # 新的单位物编
---@alias EventParam.单位-建筑升级开始 EventParam.ET_UNIT_BUILD_UPGRADE_START
M.config["单位-建筑升级开始"] = {
    desc = "",
    key = "ET_UNIT_BUILD_UPGRADE_START",
    name = "单位-建筑升级开始",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "开始升级的建筑单位",
            lua_desc = "开始升级的建筑单位",
        },
        [2] = {
            name = "__old_unit_key",
            type = "py.UnitKey",
            lua_name = "old_unit_key",
            lua_type = "py.UnitKey",
            desc = "老的单位物编",
            lua_desc = "老的单位物编",
        },
        [3] = {
            name = "__new_unit_key",
            type = "py.UnitKey",
            lua_name = "new_unit_key",
            lua_type = "py.UnitKey",
            desc = "新的单位物编",
            lua_desc = "新的单位物编",
        },
    },
}

---@class EventParam.ET_UNIT_BUILD_UPGRADE_CANCEL
---@field unit Unit # 取消升级的建筑单位
---@field old_unit_key py.UnitKey # 老的单位物编
---@field new_unit_key py.UnitKey # 新的单位物编
---@alias EventParam.单位-建筑升级取消 EventParam.ET_UNIT_BUILD_UPGRADE_CANCEL
M.config["单位-建筑升级取消"] = {
    desc = "",
    key = "ET_UNIT_BUILD_UPGRADE_CANCEL",
    name = "单位-建筑升级取消",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "取消升级的建筑单位",
            lua_desc = "取消升级的建筑单位",
        },
        [2] = {
            name = "__old_unit_key",
            type = "py.UnitKey",
            lua_name = "old_unit_key",
            lua_type = "py.UnitKey",
            desc = "老的单位物编",
            lua_desc = "老的单位物编",
        },
        [3] = {
            name = "__new_unit_key",
            type = "py.UnitKey",
            lua_name = "new_unit_key",
            lua_type = "py.UnitKey",
            desc = "新的单位物编",
            lua_desc = "新的单位物编",
        },
    },
}

---@class EventParam.ET_UNIT_BUILD_UPGRADE_FINISH
---@field unit Unit # 升级完成的建筑单位
---@field old_unit_key py.UnitKey # 老的单位物编
---@field new_unit_key py.UnitKey # 新的单位物编
---@alias EventParam.单位-建筑升级完成 EventParam.ET_UNIT_BUILD_UPGRADE_FINISH
M.config["单位-建筑升级完成"] = {
    desc = "",
    key = "ET_UNIT_BUILD_UPGRADE_FINISH",
    name = "单位-建筑升级完成",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "升级完成的建筑单位",
            lua_desc = "升级完成的建筑单位",
        },
        [2] = {
            name = "__old_unit_key",
            type = "py.UnitKey",
            lua_name = "old_unit_key",
            lua_type = "py.UnitKey",
            desc = "老的单位物编",
            lua_desc = "老的单位物编",
        },
        [3] = {
            name = "__new_unit_key",
            type = "py.UnitKey",
            lua_name = "new_unit_key",
            lua_type = "py.UnitKey",
            desc = "新的单位物编",
            lua_desc = "新的单位物编",
        },
    },
}

---@class EventParam.ET_UNIT_CONSTRUCT_START
---@field unit Unit # 开始建造的单位
---@alias EventParam.单位-建造开始 EventParam.ET_UNIT_CONSTRUCT_START
M.config["单位-建造开始"] = {
    desc = "",
    key = "ET_UNIT_CONSTRUCT_START",
    name = "单位-建造开始",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "开始建造的单位",
            lua_desc = "开始建造的单位",
        },
    },
}

---@class EventParam.ET_UNIT_CONSTRUCT_CANCEL
---@field unit Unit # 取消建造的单位
---@alias EventParam.单位-建造取消 EventParam.ET_UNIT_CONSTRUCT_CANCEL
M.config["单位-建造取消"] = {
    desc = "",
    key = "ET_UNIT_CONSTRUCT_CANCEL",
    name = "单位-建造取消",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "取消建造的单位",
            lua_desc = "取消建造的单位",
        },
    },
}

---@class EventParam.ET_UNIT_CONSTRUCT_FINISH
---@field unit Unit # 建造完成的单位
---@alias EventParam.单位-建造完成 EventParam.ET_UNIT_CONSTRUCT_FINISH
M.config["单位-建造完成"] = {
    desc = "",
    key = "ET_UNIT_CONSTRUCT_FINISH",
    name = "单位-建造完成",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "建造完成的单位",
            lua_desc = "建造完成的单位",
        },
    },
}

---@class EventParam.ET_ABILITY_BUILD_FINISH
---@field ability Ability # 技能
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能ID
---@field ability_seq py.AbilitySeq # 技能Seq
---@field unit Unit # 主人
---@field build_unit Unit # 建造出来的单位
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
    event_params = {
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
    },
}

---@class EventParam.ET_ACTIVE_ABILITY_CHANGED
---@field ability_index py.AbilityIndex # 技能坑位
---@alias EventParam.未知-ET_ACTIVE_ABILITY_CHANGED EventParam.ET_ACTIVE_ABILITY_CHANGED
M.config["未知-ET_ACTIVE_ABILITY_CHANGED"] = {
    _deprecated = true,
    desc = "ET_ACTIVE_ABILITY_CHANGED",
    key = "ET_ACTIVE_ABILITY_CHANGED",
    name = "未知-ET_ACTIVE_ABILITY_CHANGED",
    params = {
    },
    event_params = {
        [1] = {
            name = "__ability_index",
            type = "py.AbilityIndex",
            lua_name = "ability_index",
            lua_type = "py.AbilityIndex",
            desc = "技能坑位",
            lua_desc = "技能坑位",
        },
    },
}

---@class EventParam.ET_ABILITY_PLUS_POINT
---@field ability_index py.AbilityIndex # 技能坑位
---@field ability Ability # 技能对象
---@field unit Unit # 单位
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
    event_params = {
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
    },
}

---@class EventParam.ET_ABILITY_FORBIDDEN_CHANGED
---@field ability_index py.AbilityIndex # 技能坑位
---@field is_forbidden boolean # 是否禁用
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
    event_params = {
        [1] = {
            name = "__ability_index",
            type = "py.AbilityIndex",
            lua_name = "ability_index",
            lua_type = "py.AbilityIndex",
            desc = "技能坑位",
            lua_desc = "技能坑位",
        },
        [2] = {
            name = "__is_forbidden",
            type = "boolean",
            lua_name = "is_forbidden",
            lua_type = "boolean",
            desc = "是否禁用",
            lua_desc = "是否禁用",
        },
    },
}

---@class EventParam.ET_ABILITY_SILENT_CHANGED
---@field is_silent boolean # 是否禁用
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
    event_params = {
        [1] = {
            name = "__is_silent",
            type = "boolean",
            lua_name = "is_silent",
            lua_type = "boolean",
            desc = "是否禁用",
            lua_desc = "是否禁用",
        },
    },
}

---@class EventParam.ET_ABILITY_ICON_CHANGED
---@alias EventParam.技能-图标变化 EventParam.ET_ABILITY_ICON_CHANGED
M.config["技能-图标变化"] = {
    desc = "",
    key = "ET_ABILITY_ICON_CHANGED",
    name = "技能-图标变化",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_UNIT_NAME_CHANGE
---@alias EventParam.单位-名称变化 EventParam.ET_UNIT_NAME_CHANGE
M.config["单位-名称变化"] = {
    desc = "",
    key = "ET_UNIT_NAME_CHANGE",
    name = "单位-名称变化",
    object = "Unit",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_UNIT_CHANGE_MINI_MAP_ICON
---@alias EventParam.单位-小地图图标变化 EventParam.ET_UNIT_CHANGE_MINI_MAP_ICON
M.config["单位-小地图图标变化"] = {
    desc = "",
    key = "ET_UNIT_CHANGE_MINI_MAP_ICON",
    name = "单位-小地图图标变化",
    object = "Unit",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_UNIT_ICON_CHANGE
---@field unit Unit # 无描述
---@alias EventParam.单位-头像变化 EventParam.ET_UNIT_ICON_CHANGE
M.config["单位-头像变化"] = {
    desc = "",
    key = "ET_UNIT_ICON_CHANGE",
    name = "单位-头像变化",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_ROLE_UNIT_CHANGE
---@field unit Unit # 无描述
---@alias EventParam.未知-ET_ROLE_UNIT_CHANGE EventParam.ET_ROLE_UNIT_CHANGE
M.config["未知-ET_ROLE_UNIT_CHANGE"] = {
    _deprecated = true,
    desc = "ET_ROLE_UNIT_CHANGE",
    key = "ET_ROLE_UNIT_CHANGE",
    name = "未知-ET_ROLE_UNIT_CHANGE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_ROLE_UNIT_TAG_CHANGE
---@field unit Unit # 无描述
---@alias EventParam.未知-ET_ROLE_UNIT_TAG_CHANGE EventParam.ET_ROLE_UNIT_TAG_CHANGE
M.config["未知-ET_ROLE_UNIT_TAG_CHANGE"] = {
    _deprecated = true,
    desc = "ET_ROLE_UNIT_TAG_CHANGE",
    key = "ET_ROLE_UNIT_TAG_CHANGE",
    name = "未知-ET_ROLE_UNIT_TAG_CHANGE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_UNIT_ENTER_MOVER_STATE
---@field unit Unit # 无描述
---@alias EventParam.未知-ET_UNIT_ENTER_MOVER_STATE EventParam.ET_UNIT_ENTER_MOVER_STATE
M.config["未知-ET_UNIT_ENTER_MOVER_STATE"] = {
    _deprecated = true,
    desc = "ET_UNIT_ENTER_MOVER_STATE",
    key = "ET_UNIT_ENTER_MOVER_STATE",
    name = "未知-ET_UNIT_ENTER_MOVER_STATE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_UNIT_REMOVE
---@field unit Unit # 无描述
---@alias EventParam.单位-移除 EventParam.ET_UNIT_REMOVE
M.config["单位-移除"] = {
    desc = "单位被移除后触发",
    key = "ET_UNIT_REMOVE",
    name = "单位-移除",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_UNIT_DELETE
---@field unit Unit # 无描述
---@alias EventParam.单位-移除后 EventParam.ET_UNIT_DELETE
M.config["单位-移除后"] = {
    desc = "",
    key = "ET_UNIT_DELETE",
    name = "单位-移除后",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_UNIT_END_TRANSLATE
---@field unit Unit # 无描述
---@alias EventParam.单位-传送结束 EventParam.ET_UNIT_END_TRANSLATE
M.config["单位-传送结束"] = {
    desc = "",
    key = "ET_UNIT_END_TRANSLATE",
    name = "单位-传送结束",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_UNIT_ATTR_CHANGE
---@field unit Unit # 无描述
---@field attr string # 无描述
---@field old_float_attr_value number # 无描述
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
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [2] = {
            name = "__attr",
            type = "string",
            lua_name = "attr",
            lua_type = "string",
        },
        [3] = {
            name = "__old_float_attr_value",
            type = "py.Fixed",
            lua_name = "old_float_attr_value",
            lua_type = "number",
        },
    },
}

---@class EventParam.ET_BEFORE_UNIT_DIE
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
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
    event_params = {
        [1] = {
            name = "__damage",
            type = "py.Fixed",
            lua_name = "damage",
            lua_type = "number",
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
        },
    },
}

---@class EventParam.ET_UNIT_DIE
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@alias EventParam.单位-死亡 EventParam.ET_UNIT_DIE
M.config["单位-死亡"] = {
    desc = "单位死亡后触发",
    key = "ET_UNIT_DIE",
    master = "unit",
    name = "单位-死亡",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__damage",
            type = "py.Fixed",
            lua_name = "damage",
            lua_type = "number",
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
        },
    },
}

---@class EventParam.ET_UNIT_ON_UNBIND_ROLE
---@field unit Unit # 无描述
---@field player Player # 无描述
---@alias EventParam.未知-ET_UNIT_ON_UNBIND_ROLE EventParam.ET_UNIT_ON_UNBIND_ROLE
M.config["未知-ET_UNIT_ON_UNBIND_ROLE"] = {
    _deprecated = true,
    desc = "ET_UNIT_ON_UNBIND_ROLE",
    key = "ET_UNIT_ON_UNBIND_ROLE",
    name = "未知-ET_UNIT_ON_UNBIND_ROLE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [2] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
        },
    },
}

---@class EventParam.ET_UNIT_ON_BIND_ROLE
---@field unit Unit # 无描述
---@field player Player # 无描述
---@alias EventParam.未知-ET_UNIT_ON_BIND_ROLE EventParam.ET_UNIT_ON_BIND_ROLE
M.config["未知-ET_UNIT_ON_BIND_ROLE"] = {
    _deprecated = true,
    desc = "ET_UNIT_ON_BIND_ROLE",
    key = "ET_UNIT_ON_BIND_ROLE",
    name = "未知-ET_UNIT_ON_BIND_ROLE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [2] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
        },
    },
}

---@class EventParam.ET_UNIT_BE_HURT
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例
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
    event_params = {
        [1] = {
            name = "__is_normal_hit",
            type = "boolean",
            lua_name = "is_normal_hit",
            lua_type = "boolean",
            desc = "是否是普通攻击",
            lua_desc = "是否是普通攻击",
        },
        [2] = {
            name = "__damage",
            type = "py.Fixed",
            lua_name = "damage",
            lua_type = "number",
            desc = "受到的伤害值",
            lua_desc = "受到的伤害值",
        },
        [3] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
            desc = "施加伤害的单位",
            lua_desc = "施加伤害的单位",
        },
        [4] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "承受伤害的单位",
            lua_desc = "承受伤害的单位",
        },
        [5] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "当前伤害所属技能",
            lua_desc = "当前伤害所属技能",
        },
        [6] = {
            name = "__damage_type",
            type = "integer",
            lua_name = "damage_type",
            lua_type = "integer",
            desc = "伤害类型",
            lua_desc = "伤害类型",
        },
        [7] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [8] = {
            lua_name = "damage_instance",
            lua_type = "DamageInstance",
            lua_desc = "伤害实例",
        },
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例
---@alias EventParam.单位-造成伤害前 EventParam.ET_UNIT_HURT_OTHER
M.config["单位-造成伤害前"] = {
    desc = "在其他计算前触发，可以修改闪避",
    dispatch = true,
    key = "ET_UNIT_HURT_OTHER",
    name = "单位-造成伤害前",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__is_normal_hit",
            type = "boolean",
            lua_name = "is_normal_hit",
            lua_type = "boolean",
            desc = "是否是普通攻击",
            lua_desc = "是否是普通攻击",
        },
        [2] = {
            name = "__damage",
            type = "py.Fixed",
            lua_name = "damage",
            lua_type = "number",
            desc = "受到的伤害值",
            lua_desc = "受到的伤害值",
        },
        [3] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
            desc = "施加伤害的单位",
            lua_desc = "施加伤害的单位",
        },
        [4] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "承受伤害的单位",
            lua_desc = "承受伤害的单位",
        },
        [5] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "当前伤害所属技能",
            lua_desc = "当前伤害所属技能",
        },
        [6] = {
            name = "__damage_type",
            type = "integer",
            lua_name = "damage_type",
            lua_type = "integer",
            desc = "伤害类型",
            lua_desc = "伤害类型",
        },
        [7] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [8] = {
            lua_name = "damage_instance",
            lua_type = "DamageInstance",
            lua_desc = "伤害实例",
        },
    },
}

---@class EventParam.ET_UNIT_BE_HURT_BEFORE_APPLY
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例
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
    event_params = {
        [1] = {
            name = "__is_normal_hit",
            type = "boolean",
            lua_name = "is_normal_hit",
            lua_type = "boolean",
            desc = "是否是普通攻击",
            lua_desc = "是否是普通攻击",
        },
        [2] = {
            name = "__damage",
            type = "py.Fixed",
            lua_name = "damage",
            lua_type = "number",
            desc = "受到的伤害值",
            lua_desc = "受到的伤害值",
        },
        [3] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
            desc = "施加伤害的单位",
            lua_desc = "施加伤害的单位",
        },
        [4] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "承受伤害的单位",
            lua_desc = "承受伤害的单位",
        },
        [5] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "当前伤害所属技能",
            lua_desc = "当前伤害所属技能",
        },
        [6] = {
            name = "__damage_type",
            type = "integer",
            lua_name = "damage_type",
            lua_type = "integer",
            desc = "伤害类型",
            lua_desc = "伤害类型",
        },
        [7] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [8] = {
            lua_name = "damage_instance",
            lua_type = "DamageInstance",
            lua_desc = "伤害实例",
        },
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER_BEFORE_APPLY
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例
---@alias EventParam.单位-造成伤害时 EventParam.ET_UNIT_HURT_OTHER_BEFORE_APPLY
M.config["单位-造成伤害时"] = {
    desc = "可以修改伤害值",
    dispatch = true,
    key = "ET_UNIT_HURT_OTHER_BEFORE_APPLY",
    name = "单位-造成伤害时",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__is_normal_hit",
            type = "boolean",
            lua_name = "is_normal_hit",
            lua_type = "boolean",
            desc = "是否是普通攻击",
            lua_desc = "是否是普通攻击",
        },
        [2] = {
            name = "__damage",
            type = "py.Fixed",
            lua_name = "damage",
            lua_type = "number",
            desc = "受到的伤害值",
            lua_desc = "受到的伤害值",
        },
        [3] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
            desc = "施加伤害的单位",
            lua_desc = "施加伤害的单位",
        },
        [4] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "承受伤害的单位",
            lua_desc = "承受伤害的单位",
        },
        [5] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "当前伤害所属技能",
            lua_desc = "当前伤害所属技能",
        },
        [6] = {
            name = "__damage_type",
            type = "integer",
            lua_name = "damage_type",
            lua_type = "integer",
            desc = "伤害类型",
            lua_desc = "伤害类型",
        },
        [7] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [8] = {
            lua_name = "damage_instance",
            lua_type = "DamageInstance",
            lua_desc = "伤害实例",
        },
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER_FINISH
---@field is_critical_hit boolean # 是否是暴击
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例
---@alias EventParam.单位-造成伤害后 EventParam.ET_UNIT_HURT_OTHER_FINISH
M.config["单位-造成伤害后"] = {
    desc = "伤害已结算，只能获取伤害值",
    key = "ET_UNIT_HURT_OTHER_FINISH",
    name = "单位-造成伤害后",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__is_critical_hit",
            type = "boolean",
            lua_name = "is_critical_hit",
            lua_type = "boolean",
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
            lua_type = "number",
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
        },
        [9] = {
            lua_name = "damage_instance",
            lua_type = "DamageInstance",
            lua_desc = "伤害实例",
        },
    },
}

---@class EventParam.ET_UNIT_BE_HURT_COMPLETE
---@field is_critical_hit boolean # 是否是暴击
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例
---@alias EventParam.单位-受到伤害后 EventParam.ET_UNIT_BE_HURT_COMPLETE
M.config["单位-受到伤害后"] = {
    desc = "伤害已结算，只能获取伤害值",
    key = "ET_UNIT_BE_HURT_COMPLETE",
    master = "target_unit",
    name = "单位-受到伤害后",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__is_critical_hit",
            type = "boolean",
            lua_name = "is_critical_hit",
            lua_type = "boolean",
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
            lua_type = "number",
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
        },
        [9] = {
            lua_name = "damage_instance",
            lua_type = "DamageInstance",
            lua_desc = "伤害实例",
        },
    },
}

---@class EventParam.ET_UNIT_GET_CURE_BEFORE_APPLY
---@field source_unit Unit # 治疗来源单位
---@field target_unit Unit # 被治疗的单位
---@field cured_value number # 受到的治疗值
---@field ability Ability # 当前治疗所属技能
---@field heal_instance HealInstance # 治疗实例
---@alias EventParam.单位-受到治疗前 EventParam.ET_UNIT_GET_CURE_BEFORE_APPLY
M.config["单位-受到治疗前"] = {
    desc = "可在其他计算前触发，可以修改有效性",
    dispatch = true,
    key = "ET_UNIT_GET_CURE_BEFORE_APPLY",
    name = "单位-受到治疗前",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
            desc = "治疗来源单位",
            lua_desc = "治疗来源单位",
        },
        [2] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "被治疗的单位",
            lua_desc = "被治疗的单位",
        },
        [3] = {
            name = "__cured_value",
            type = "py.Fixed",
            lua_name = "cured_value",
            lua_type = "number",
            desc = "受到的治疗值",
            lua_desc = "受到的治疗值",
        },
        [4] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "当前治疗所属技能",
            lua_desc = "当前治疗所属技能",
        },
        [5] = {
            lua_name = "heal_instance",
            lua_type = "HealInstance",
            lua_desc = "治疗实例",
        },
    },
}

---@class EventParam.ET_UNIT_GET_CURE_FINISH
---@field source_unit Unit # 治疗来源单位
---@field target_unit Unit # 被治疗的单位
---@field cured_value number # 受到的治疗值
---@field ability Ability # 当前治疗所属技能
---@alias EventParam.单位-受到治疗后 EventParam.ET_UNIT_GET_CURE_FINISH
M.config["单位-受到治疗后"] = {
    desc = "治疗已结算，只能获取治疗值",
    key = "ET_UNIT_GET_CURE_FINISH",
    name = "单位-受到治疗后",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
            desc = "治疗来源单位",
            lua_desc = "治疗来源单位",
        },
        [2] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "被治疗的单位",
            lua_desc = "被治疗的单位",
        },
        [3] = {
            name = "__cured_value",
            type = "py.Fixed",
            lua_name = "cured_value",
            lua_type = "number",
            desc = "受到的治疗值",
            lua_desc = "受到的治疗值",
        },
        [4] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "当前治疗所属技能",
            lua_desc = "当前治疗所属技能",
        },
    },
}

---@class EventParam.ET_UNIT_GET_CURE
---@field source_unit Unit # 治疗来源单位
---@field target_unit Unit # 被治疗的单位
---@field cured_value number # 受到的治疗值
---@field ability Ability # 当前治疗所属技能
---@field heal_instance HealInstance # 治疗实例
---@alias EventParam.单位-受到治疗时 EventParam.ET_UNIT_GET_CURE
M.config["单位-受到治疗时"] = {
    desc = "可以修改治疗值",
    dispatch = true,
    key = "ET_UNIT_GET_CURE",
    name = "单位-受到治疗时",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
            desc = "治疗来源单位",
            lua_desc = "治疗来源单位",
        },
        [2] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "被治疗的单位",
            lua_desc = "被治疗的单位",
        },
        [3] = {
            name = "__cured_value",
            type = "py.Fixed",
            lua_name = "cured_value",
            lua_type = "number",
            desc = "受到的治疗值",
            lua_desc = "受到的治疗值",
        },
        [4] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "当前治疗所属技能",
            lua_desc = "当前治疗所属技能",
        },
        [5] = {
            lua_name = "heal_instance",
            lua_type = "HealInstance",
            lua_desc = "治疗实例",
        },
    },
}

---@class EventParam.ET_RES_ICON_CHANGED
---@field res_key py.RoleResKey # 资源
---@field icon_id integer # ICON ID
---@alias EventParam.玩家-属性图标变化 EventParam.ET_RES_ICON_CHANGED
M.config["玩家-属性图标变化"] = {
    desc = "",
    key = "ET_RES_ICON_CHANGED",
    name = "玩家-属性图标变化",
    params = {
    },
    event_params = {
        [1] = {
            name = "__res_key",
            type = "py.RoleResKey",
            lua_name = "res_key",
            lua_type = "py.RoleResKey",
            desc = "资源",
            lua_desc = "资源",
        },
        [2] = {
            name = "__icon_id",
            type = "integer",
            lua_name = "icon_id",
            lua_type = "integer",
            desc = "ICON ID",
            lua_desc = "ICON ID",
        },
    },
}

---@class EventParam.ET_UNIT_RELEASE_ABILITY
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_
---@field ability_target_unit Unit # 技能的目标单位
---@alias EventParam.单位-施放技能 EventParam.ET_UNIT_RELEASE_ABILITY
M.config["单位-施放技能"] = {
    desc = "单位施放技能时触发",
    key = "ET_UNIT_RELEASE_ABILITY",
    name = "单位-施放技能",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_RELEASE_ABILITY_START
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_
---@alias EventParam.未知-ET_UNIT_RELEASE_ABILITY_START EventParam.ET_UNIT_RELEASE_ABILITY_START
M.config["未知-ET_UNIT_RELEASE_ABILITY_START"] = {
    _deprecated = true,
    desc = "ET_UNIT_RELEASE_ABILITY_START",
    key = "ET_UNIT_RELEASE_ABILITY_START",
    name = "未知-ET_UNIT_RELEASE_ABILITY_START",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_RELEASE_ABILITY_END
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_
---@alias EventParam.未知-ET_UNIT_RELEASE_ABILITY_END EventParam.ET_UNIT_RELEASE_ABILITY_END
M.config["未知-ET_UNIT_RELEASE_ABILITY_END"] = {
    _deprecated = true,
    desc = "ET_UNIT_RELEASE_ABILITY_END",
    key = "ET_UNIT_RELEASE_ABILITY_END",
    name = "未知-ET_UNIT_RELEASE_ABILITY_END",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_RELEASE_MAGIC_BOOK
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_
---@alias EventParam.未知-ET_UNIT_RELEASE_MAGIC_BOOK EventParam.ET_UNIT_RELEASE_MAGIC_BOOK
M.config["未知-ET_UNIT_RELEASE_MAGIC_BOOK"] = {
    _deprecated = true,
    desc = "ET_UNIT_RELEASE_MAGIC_BOOK",
    key = "ET_UNIT_RELEASE_MAGIC_BOOK",
    name = "未知-ET_UNIT_RELEASE_MAGIC_BOOK",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_LEVEL_CHANGE
---@alias EventParam.未知-ET_UNIT_LEVEL_CHANGE EventParam.ET_UNIT_LEVEL_CHANGE
M.config["未知-ET_UNIT_LEVEL_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_LEVEL_CHANGE",
    key = "ET_UNIT_LEVEL_CHANGE",
    name = "未知-ET_UNIT_LEVEL_CHANGE",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_UNIT_EXP_CHANGE
---@alias EventParam.未知-ET_UNIT_EXP_CHANGE EventParam.ET_UNIT_EXP_CHANGE
M.config["未知-ET_UNIT_EXP_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_EXP_CHANGE",
    key = "ET_UNIT_EXP_CHANGE",
    name = "未知-ET_UNIT_EXP_CHANGE",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_UNIT_PRE_ADD_EXP
---@field unit Unit # 获得经验的单位
---@field add_exp number # 增加的经验
---@field set_exp fun(exp: number) # 修改经验
---@alias EventParam.单位-获得经验前 EventParam.ET_UNIT_PRE_ADD_EXP
M.config["单位-获得经验前"] = {
    desc = "单位获得经验前触发",
    dispatch = true,
    key = "ET_UNIT_PRE_ADD_EXP",
    name = "单位-获得经验前",
    object = "Unit",
    params = {
    },
    event_params = {
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
        [3] = {
            lua_name = "set_exp",
            lua_type = "fun(exp: number)",
            lua_desc = "修改经验",
        },
    },
}

---@class EventParam.ET_UNIT_ON_ADD_EXP
---@field unit Unit # 获得经验的单位
---@field add_exp number # 增加的经验
---@alias EventParam.单位-获得经验后 EventParam.ET_UNIT_ON_ADD_EXP
M.config["单位-获得经验后"] = {
    desc = "单位获得经验后触发",
    key = "ET_UNIT_ON_ADD_EXP",
    name = "单位-获得经验后",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_ON_COMMAND
---@field unit Unit # 单位
---@field cmd_type py.UnitCommand # 接收的命令
---@field target_unit Unit # 目标单位
---@field point Point # 目标点
---@field destructible Destructible # 目标可破坏物
---@field item Item # 目标物品
---@field ability Ability # 释放的技能
---@alias EventParam.单位-接收命令 EventParam.ET_UNIT_ON_COMMAND
M.config["单位-接收命令"] = {
    desc = "接收到命令时触发，如果命令有目标会根据目标类型存到不同的字段里",
    key = "ET_UNIT_ON_COMMAND",
    name = "单位-接收命令",
    object = "Unit",
    params = {
    },
    event_params = {
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
        [7] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "释放的技能",
            lua_desc = "释放的技能",
        },
    },
}

---@class EventParam.ET_KILL_UNIT
---@field damage number # 伤害值
---@field source_unit Unit # 杀手单位
---@field target_unit Unit # 死亡单位
---@field ability Ability # 致命伤害所属技能
---@field damage_type integer # 致命伤害类型
---@field unit Unit # 无描述
---@alias EventParam.单位-击杀 EventParam.ET_KILL_UNIT
M.config["单位-击杀"] = {
    desc = "单位击杀其他单位时触发",
    key = "ET_KILL_UNIT",
    name = "单位-击杀",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__damage",
            type = "py.Fixed",
            lua_name = "damage",
            lua_type = "number",
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
        },
    },
}

---@class EventParam.ET_UNIT_BORN
---@field unit Unit # 无描述
---@field lua_table py.Table # 用户自定义配置表
---@alias EventParam.单位-创建 EventParam.ET_UNIT_BORN
M.config["单位-创建"] = {
    desc = "单位被创建后触发",
    key = "ET_UNIT_BORN",
    name = "单位-创建",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
        [2] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_UNIT_ENTER_BATTLE
---@field unit Unit # 单位
---@alias EventParam.单位-进入战斗 EventParam.ET_UNIT_ENTER_BATTLE
M.config["单位-进入战斗"] = {
    desc = "单位进入战斗时触发",
    key = "ET_UNIT_ENTER_BATTLE",
    name = "单位-进入战斗",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
    },
}

---@class EventParam.ET_UNIT_EXIT_BATTLE
---@field unit Unit # 单位
---@alias EventParam.单位-脱离战斗 EventParam.ET_UNIT_EXIT_BATTLE
M.config["单位-脱离战斗"] = {
    desc = "单位离开战斗时触发",
    key = "ET_UNIT_EXIT_BATTLE",
    name = "单位-脱离战斗",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
    },
}

---@class EventParam.ET_UNIT_CREATE_SLAVE
---@field unit Unit # 仆从
---@alias EventParam.未知-ET_UNIT_CREATE_SLAVE EventParam.ET_UNIT_CREATE_SLAVE
M.config["未知-ET_UNIT_CREATE_SLAVE"] = {
    _deprecated = true,
    desc = "ET_UNIT_CREATE_SLAVE",
    key = "ET_UNIT_CREATE_SLAVE",
    name = "未知-ET_UNIT_CREATE_SLAVE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "仆从id",
            lua_desc = "仆从",
        },
    },
}

---@class EventParam.ET_UNIT_TRY_PICK_ITEM_NEW
---@field unit Unit # 单位
---@field equip_slot_type py.SlotType # 背包类型
---@field item Item # 目标物品
---@alias EventParam.单位-即将拾取物品 EventParam.ET_UNIT_TRY_PICK_ITEM_NEW
M.config["单位-即将拾取物品"] = {
    desc = "",
    key = "ET_UNIT_TRY_PICK_ITEM_NEW",
    name = "单位-即将拾取物品",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
        [2] = {
            name = "__equip_slot_type",
            type = "py.SlotType",
            lua_name = "equip_slot_type",
            lua_type = "py.SlotType",
            desc = "背包类型",
            lua_desc = "背包类型",
        },
        [3] = {
            name = "__item_id",
            type = "py.ItemID",
            lua_name = "item",
            lua_type = "Item",
            desc = "目标物品ID",
            lua_desc = "目标物品",
        },
    },
}

---@class EventParam.ET_UNIT_LOAD_DEFAULT_AI
---@alias EventParam.单位-切换默认行为 EventParam.ET_UNIT_LOAD_DEFAULT_AI
M.config["单位-切换默认行为"] = {
    desc = "",
    key = "ET_UNIT_LOAD_DEFAULT_AI",
    name = "单位-切换默认行为",
    object = "Unit",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_UNIT_TRY_ACQUIRE_TARGET
---@field unit Unit # 单位
---@alias EventParam.单位-即将索敌 EventParam.ET_UNIT_TRY_ACQUIRE_TARGET
M.config["单位-即将索敌"] = {
    desc = "",
    key = "ET_UNIT_TRY_ACQUIRE_TARGET",
    name = "单位-即将索敌",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
    },
}

---@class EventParam.ET_UNIT_ACQUIRED_TARGET
---@field unit Unit # 单位
---@field target_unit Unit # 目标单位
---@alias EventParam.单位-发现目标 EventParam.ET_UNIT_ACQUIRED_TARGET
M.config["单位-发现目标"] = {
    desc = "",
    key = "ET_UNIT_ACQUIRED_TARGET",
    name = "单位-发现目标",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
        [2] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
            desc = "目标单位",
            lua_desc = "目标单位",
        },
    },
}

---@class EventParam.ET_DETECT_BONE_COLLISON
---@field source_unit Unit # 无描述
---@field target_unit Unit # 无描述
---@field src_bone string # 无描述
---@field target_bone string # 无描述
---@field hitPos Point # 无描述
---@field hitNormal Point # 无描述
---@alias EventParam.本地-骨骼碰撞 EventParam.ET_DETECT_BONE_COLLISON
M.config["本地-骨骼碰撞"] = {
    desc = "骨骼碰撞时触发",
    key = "ET_DETECT_BONE_COLLISON",
    name = "本地-骨骼碰撞",
    params = {
    },
    event_params = {
        [1] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
        },
        [2] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
        },
        [3] = {
            name = "__src_bone",
            type = "string",
            lua_name = "src_bone",
            lua_type = "string",
        },
        [4] = {
            name = "__target_bone",
            type = "string",
            lua_name = "target_bone",
            lua_type = "string",
        },
        [5] = {
            name = "__hitPos",
            type = "py.Vector3",
            lua_name = "hitPos",
            lua_type = "Point",
        },
        [6] = {
            name = "__hitNormal",
            type = "py.Vector3",
            lua_name = "hitNormal",
            lua_type = "Point",
        },
    },
}

---@alias EventParam.物理-骨骼碰撞 EventParam.ET_DETECT_BONE_COLLISON
M.config["物理-骨骼碰撞"] = {
    desc = "骨骼碰撞时触发",
    key = "ET_DETECT_BONE_COLLISON",
    name = "物理-骨骼碰撞",
    params = {
    },
    event_params = {
        [1] = {
            name = "__source_unit",
            type = "py.Unit",
            lua_name = "source_unit",
            lua_type = "Unit",
        },
        [2] = {
            name = "__target_unit",
            type = "py.Unit",
            lua_name = "target_unit",
            lua_type = "Unit",
        },
        [3] = {
            name = "__src_bone",
            type = "string",
            lua_name = "src_bone",
            lua_type = "string",
        },
        [4] = {
            name = "__target_bone",
            type = "string",
            lua_name = "target_bone",
            lua_type = "string",
        },
        [5] = {
            name = "__hitPos",
            type = "py.Vector3",
            lua_name = "hitPos",
            lua_type = "Point",
        },
        [6] = {
            name = "__hitNormal",
            type = "py.Vector3",
            lua_name = "hitNormal",
            lua_type = "Point",
        },
    },
}

---@class EventParam.ET_ITEM_ATTACHED_ATTR_CHANGED
---@field item Item # 无描述
---@field attr_key string # 无描述
---@field delta number # 无描述
---@alias EventParam.未知-ET_ITEM_ATTACHED_ATTR_CHANGED EventParam.ET_ITEM_ATTACHED_ATTR_CHANGED
M.config["未知-ET_ITEM_ATTACHED_ATTR_CHANGED"] = {
    _deprecated = true,
    desc = "ET_ITEM_ATTACHED_ATTR_CHANGED",
    key = "ET_ITEM_ATTACHED_ATTR_CHANGED",
    name = "未知-ET_ITEM_ATTACHED_ATTR_CHANGED",
    params = {
    },
    event_params = {
        [1] = {
            name = "__item_id",
            type = "py.ItemID",
            lua_name = "item",
            lua_type = "Item",
        },
        [2] = {
            name = "__attr_key",
            type = "string",
            lua_name = "attr_key",
            lua_type = "string",
        },
        [3] = {
            name = "__delta",
            type = "py.Fixed",
            lua_name = "delta",
            lua_type = "number",
        },
    },
}

---@class EventParam.ET_UNIT_SHOP_BUY_ITEM
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field cnt integer # 商品数量
---@field item Item # 商品物品
---@alias EventParam.单位-购买物品 EventParam.ET_UNIT_SHOP_BUY_ITEM
M.config["单位-购买物品"] = {
    desc = "购买物品时触发",
    key = "ET_UNIT_SHOP_BUY_ITEM",
    name = "单位-购买物品",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_SHOP_BUY_UNIT
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field cnt integer # 商品数量
---@field unit_stuff Unit # 商品单位
---@alias EventParam.单位-购买单位 EventParam.ET_UNIT_SHOP_BUY_UNIT
M.config["单位-购买单位"] = {
    desc = "购买单位时触发",
    key = "ET_UNIT_SHOP_BUY_UNIT",
    name = "单位-购买单位",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_ITEM_SELL
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field item Item # 道具
---@alias EventParam.单位-出售物品 EventParam.ET_UNIT_ITEM_SELL
M.config["单位-出售物品"] = {
    desc = "出售物品时触发",
    key = "ET_UNIT_ITEM_SELL",
    name = "单位-出售物品",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_SHOP_ITEM_CHANGED
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field shop_key string # 商品id
---@field curr_stock integer # 当前库存
---@alias EventParam.商店-商品变化 EventParam.ET_SHOP_ITEM_CHANGED
M.config["商店-商品变化"] = {
    desc = "",
    key = "ET_SHOP_ITEM_CHANGED",
    name = "商店-商品变化",
    params = {
    },
    event_params = {
        [1] = {
            name = "__shop_unit_id",
            type = "py.UnitID",
            lua_name = "shop_unit",
            lua_type = "Unit",
            desc = "商店单位id",
            lua_desc = "商店单位",
        },
        [2] = {
            name = "__tab_idx",
            type = "integer",
            lua_name = "tab_idx",
            lua_type = "integer",
            desc = "商店分页",
            lua_desc = "商店分页",
        },
        [3] = {
            name = "__shop_key",
            type = "string",
            lua_name = "shop_key",
            lua_type = "string",
            desc = "商品id",
            lua_desc = "商品id",
        },
        [4] = {
            name = "__curr_stock",
            type = "integer",
            lua_name = "curr_stock",
            lua_type = "integer",
            desc = "当前库存",
            lua_desc = "当前库存",
        },
    },
}

---@class EventParam.ET_SHOP_STOCK_CHANGED
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field shop_key string # 商品id
---@field curr_stock integer # 当前库存
---@alias EventParam.商店-库存变化 EventParam.ET_SHOP_STOCK_CHANGED
M.config["商店-库存变化"] = {
    desc = "",
    key = "ET_SHOP_STOCK_CHANGED",
    name = "商店-库存变化",
    params = {
    },
    event_params = {
        [1] = {
            name = "__shop_unit_id",
            type = "py.UnitID",
            lua_name = "shop_unit",
            lua_type = "Unit",
            desc = "商店单位id",
            lua_desc = "商店单位",
        },
        [2] = {
            name = "__tab_idx",
            type = "integer",
            lua_name = "tab_idx",
            lua_type = "integer",
            desc = "商店分页",
            lua_desc = "商店分页",
        },
        [3] = {
            name = "__shop_key",
            type = "string",
            lua_name = "shop_key",
            lua_type = "string",
            desc = "商品id",
            lua_desc = "商品id",
        },
        [4] = {
            name = "__curr_stock",
            type = "integer",
            lua_name = "curr_stock",
            lua_type = "integer",
            desc = "当前库存",
            lua_desc = "当前库存",
        },
    },
}

---@class EventParam.ET_SHOP_RES_COST_CHANGED
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field shop_key string # 商品id
---@field res_type py.RoleResKey # 资源编号
---@field res_cost integer # 当前售价
---@alias EventParam.商店-售价变化 EventParam.ET_SHOP_RES_COST_CHANGED
M.config["商店-售价变化"] = {
    desc = "",
    key = "ET_SHOP_RES_COST_CHANGED",
    name = "商店-售价变化",
    params = {
    },
    event_params = {
        [1] = {
            name = "__shop_unit_id",
            type = "py.UnitID",
            lua_name = "shop_unit",
            lua_type = "Unit",
            desc = "商店单位id",
            lua_desc = "商店单位",
        },
        [2] = {
            name = "__tab_idx",
            type = "integer",
            lua_name = "tab_idx",
            lua_type = "integer",
            desc = "商店分页",
            lua_desc = "商店分页",
        },
        [3] = {
            name = "__shop_key",
            type = "string",
            lua_name = "shop_key",
            lua_type = "string",
            desc = "商品id",
            lua_desc = "商品id",
        },
        [4] = {
            name = "__res_type",
            type = "py.RoleResKey",
            lua_name = "res_type",
            lua_type = "py.RoleResKey",
            desc = "资源编号",
            lua_desc = "资源编号",
        },
        [5] = {
            name = "__res_cost",
            type = "integer",
            lua_name = "res_cost",
            lua_type = "integer",
            desc = "当前售价",
            lua_desc = "当前售价",
        },
    },
}

---@class EventParam.ET_UNIT_ITEM_COMPOSE
---@field unit Unit # 单位
---@field compose_id py.ItemKey # 道具编号
---@field item_prop Item # 道具
---@alias EventParam.单位-物品合成 EventParam.ET_UNIT_ITEM_COMPOSE
M.config["单位-物品合成"] = {
    desc = "物品合成时触发",
    key = "ET_UNIT_ITEM_COMPOSE",
    name = "单位-物品合成",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_SHOP_BUY_WITH_COMPOSE
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field item Item # 物品编号
---@alias EventParam.单位-购买物品合成 EventParam.ET_UNIT_SHOP_BUY_WITH_COMPOSE
M.config["单位-购买物品合成"] = {
    desc = "购买物品合成时触发",
    key = "ET_UNIT_SHOP_BUY_WITH_COMPOSE",
    name = "单位-购买物品合成",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_REVIVE_UNIT
---@field unit Unit # 无描述
---@alias EventParam.单位-复活 EventParam.ET_REVIVE_UNIT
M.config["单位-复活"] = {
    desc = "单位复活后触发",
    key = "ET_REVIVE_UNIT",
    name = "单位-复活",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_UPGRADE_UNIT
---@field unit Unit # 无描述
---@alias EventParam.单位-升级 EventParam.ET_UPGRADE_UNIT
M.config["单位-升级"] = {
    desc = "单位升级后触发",
    key = "ET_UPGRADE_UNIT",
    name = "单位-升级",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_REACH_MOVE_TARGET_UNIT
---@field unit Unit # 无描述
---@alias EventParam.未知-ET_REACH_MOVE_TARGET_UNIT EventParam.ET_REACH_MOVE_TARGET_UNIT
M.config["未知-ET_REACH_MOVE_TARGET_UNIT"] = {
    _deprecated = true,
    desc = "ET_REACH_MOVE_TARGET_UNIT",
    key = "ET_REACH_MOVE_TARGET_UNIT",
    name = "未知-ET_REACH_MOVE_TARGET_UNIT",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_COLLIDE_OBSTACLE_UNIT
---@field unit Unit # 无描述
---@alias EventParam.未知-ET_COLLIDE_OBSTACLE_UNIT EventParam.ET_COLLIDE_OBSTACLE_UNIT
M.config["未知-ET_COLLIDE_OBSTACLE_UNIT"] = {
    _deprecated = true,
    desc = "ET_COLLIDE_OBSTACLE_UNIT",
    key = "ET_COLLIDE_OBSTACLE_UNIT",
    name = "未知-ET_COLLIDE_OBSTACLE_UNIT",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
        },
    },
}

---@class EventParam.ET_UNIT_ENTER_GRASS
---@field unit Unit # 单位
---@alias EventParam.单位-进入草丛 EventParam.ET_UNIT_ENTER_GRASS
M.config["单位-进入草丛"] = {
    desc = "单位进入草丛时触发",
    key = "ET_UNIT_ENTER_GRASS",
    name = "单位-进入草丛",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
    },
}

---@class EventParam.ET_UNIT_LEAVE_GRASS
---@field unit Unit # 单位
---@alias EventParam.单位-离开草丛 EventParam.ET_UNIT_LEAVE_GRASS
M.config["单位-离开草丛"] = {
    desc = "单位离开草丛时触发",
    key = "ET_UNIT_LEAVE_GRASS",
    name = "单位-离开草丛",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
    },
}

---@class EventParam.ET_MAP_VISIBILITY_CHANGE
---@alias EventParam.未知-ET_MAP_VISIBILITY_CHANGE EventParam.ET_MAP_VISIBILITY_CHANGE
M.config["未知-ET_MAP_VISIBILITY_CHANGE"] = {
    _deprecated = true,
    desc = "ET_MAP_VISIBILITY_CHANGE",
    key = "ET_MAP_VISIBILITY_CHANGE",
    name = "未知-ET_MAP_VISIBILITY_CHANGE",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_UNIT_ROLE_CHANGED
---@field unit Unit # 触发事件的单位
---@field old_player Player # 单位原所属玩家
---@field new_player Player # 单位新所属玩家
---@alias EventParam.单位-改变所属 EventParam.ET_UNIT_ROLE_CHANGED
M.config["单位-改变所属"] = {
    desc = "单位的所有者玩家发生变化时触发",
    key = "ET_UNIT_ROLE_CHANGED",
    name = "单位-改变所属",
    object = "Unit",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_KV_CHANGE
---@field kv_name string # KV名
---@alias EventParam.未知-ET_UNIT_KV_CHANGE EventParam.ET_UNIT_KV_CHANGE
M.config["未知-ET_UNIT_KV_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_KV_CHANGE",
    key = "ET_UNIT_KV_CHANGE",
    name = "未知-ET_UNIT_KV_CHANGE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__kv_name",
            type = "string",
            lua_name = "kv_name",
            lua_type = "string",
            desc = "KV名",
            lua_desc = "KV名",
        },
    },
}

---@class EventParam.ET_UNIT_MUL_KV_CHANGE
---@field kv_name_list py.List # 单位原所属玩家
---@alias EventParam.未知-ET_UNIT_MUL_KV_CHANGE EventParam.ET_UNIT_MUL_KV_CHANGE
M.config["未知-ET_UNIT_MUL_KV_CHANGE"] = {
    _deprecated = true,
    desc = "ET_UNIT_MUL_KV_CHANGE",
    key = "ET_UNIT_MUL_KV_CHANGE",
    name = "未知-ET_UNIT_MUL_KV_CHANGE",
    params = {
    },
    event_params = {
        [1] = {
            name = "__kv_name_list",
            type = "py.List",
            lua_name = "kv_name_list",
            lua_type = "py.List",
            desc = "单位原所属玩家",
            lua_desc = "单位原所属玩家",
        },
    },
}

---@class EventParam.ET_UNIT_PRECONDITION_SUCCEED
---@field unit_key py.UnitKey # 单位类型
---@field player Player # 玩家
---@alias EventParam.单位类型-前置条件成立 EventParam.ET_UNIT_PRECONDITION_SUCCEED
M.config["单位类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_UNIT_PRECONDITION_SUCCEED",
    name = "单位类型-前置条件成立",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_PRECONDITION_FAILED
---@field unit_key py.UnitKey # 单位类型
---@field player Player # 玩家
---@alias EventParam.单位类型-前置条件不成立 EventParam.ET_UNIT_PRECONDITION_FAILED
M.config["单位类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_UNIT_PRECONDITION_FAILED",
    name = "单位类型-前置条件不成立",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ITEM_PRECONDITION_SUCCEED
---@field item_no py.ItemKey # 物品类型
---@field player Player # 玩家
---@alias EventParam.物品类型-前置条件成立 EventParam.ET_ITEM_PRECONDITION_SUCCEED
M.config["物品类型-前置条件成立"] = {
    desc = "前置条件由不成立变为成立时触发",
    key = "ET_ITEM_PRECONDITION_SUCCEED",
    name = "物品类型-前置条件成立",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ITEM_PRECONDITION_FAILED
---@field item_no py.ItemKey # 物品类型
---@field player Player # 玩家
---@alias EventParam.物品类型-前置条件不成立 EventParam.ET_ITEM_PRECONDITION_FAILED
M.config["物品类型-前置条件不成立"] = {
    desc = "前置条件由成立变为不成立时触发",
    key = "ET_ITEM_PRECONDITION_FAILED",
    name = "物品类型-前置条件不成立",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ABILITY_PRECONDITION_SUCCEED
---@field ability_id py.AbilityKey # 技能类型
---@field player Player # 玩家
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
    event_params = {
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
    },
}

---@class EventParam.ET_ABILITY_PRECONDITION_FAILED
---@field ability_id py.AbilityKey # 技能类型
---@field player Player # 玩家
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
    event_params = {
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
    },
}

---@class EventParam.ET_TECH_PRECONDITION_SUCCEED
---@field tech_no py.TechKey # 科技类型
---@field player Player # 玩家
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
    event_params = {
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
    },
}

---@class EventParam.ET_TECH_PRECONDITION_FAILED
---@field tech_no py.TechKey # 科技类型
---@field player Player # 玩家
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
    event_params = {
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
    },
}

---@class EventParam.ET_ABILITY_UPGRADE
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
    },
}

---@class EventParam.ET_ABILITY_CS_START
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_CS_END
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@alias EventParam.未知-ET_ABILITY_CS_END EventParam.ET_ABILITY_CS_END
M.config["未知-ET_ABILITY_CS_END"] = {
    _deprecated = true,
    desc = "ET_ABILITY_CS_END",
    key = "ET_ABILITY_CS_END",
    name = "未知-ET_ABILITY_CS_END",
    params = {
    },
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
    },
}

---@class EventParam.ET_ABILITY_PS_START
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_PS_END
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ITEM_ABILITY_PS_END
---@field ability Ability # 技能对象
---@alias EventParam.未知-ET_ITEM_ABILITY_PS_END EventParam.ET_ITEM_ABILITY_PS_END
M.config["未知-ET_ITEM_ABILITY_PS_END"] = {
    _deprecated = true,
    desc = "ET_ITEM_ABILITY_PS_END",
    key = "ET_ITEM_ABILITY_PS_END",
    name = "未知-ET_ITEM_ABILITY_PS_END",
    params = {
    },
    event_params = {
        [1] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "技能对象",
            lua_desc = "技能对象",
        },
    },
}

---@class EventParam.ET_ABILITY_SP_END
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_CST_END
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_BS_END
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_CS_INTERRUPT
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@alias EventParam.未知-ET_ABILITY_CS_INTERRUPT EventParam.ET_ABILITY_CS_INTERRUPT
M.config["未知-ET_ABILITY_CS_INTERRUPT"] = {
    _deprecated = true,
    desc = "ET_ABILITY_CS_INTERRUPT",
    key = "ET_ABILITY_CS_INTERRUPT",
    name = "未知-ET_ABILITY_CS_INTERRUPT",
    params = {
    },
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
    },
}

---@class EventParam.ET_ABILITY_PS_INTERRUPT
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_SP_INTERRUPT
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_CST_INTERRUPT
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_BS_INTERRUPT
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@alias EventParam.施法-打断完成 EventParam.ET_ABILITY_BS_INTERRUPT
M.config["施法-打断完成"] = {
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    _deprecated = true,
    desc = "ET_ABILITY_BS_INTERRUPT",
    key = "ET_ABILITY_BS_INTERRUPT",
    object = "Ability",
    name = "施法-打断完成",
    params = {
    },
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
    },
}

---@class EventParam.ET_ABILITY_END
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
        [3] = {
            name = "__ability_target_unit_id",
            type = "py.UnitID",
            lua_name = "ability_target_unit",
            lua_type = "Unit",
            desc = "技能目标单位ID",
            lua_desc = "技能目标单位",
        },
        [4] = {
            lua_name = "cast",
            lua_type = "Cast",
            lua_desc = "施法",
        },
    },
}

---@class EventParam.ET_ABILITY_OBTAIN
---@field ability Ability # 技能对象
---@field unit Unit # 单位
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
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
        [3] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_ABILITY_LOSE
---@field ability Ability # 技能对象
---@field unit Unit # 单位
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
    event_params = {
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
    },
}

---@class EventParam.ET_ABILITY_SWITCH
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
    },
}

---@class EventParam.ET_ABILITY_DISABLE
---@field ability Ability # 技能对象
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
    event_params = {
        [1] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "技能对象",
            lua_desc = "技能对象",
        },
    },
}

---@class EventParam.ET_ABILITY_ENABLE
---@field ability Ability # 技能对象
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
    event_params = {
        [1] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "技能对象",
            lua_desc = "技能对象",
        },
    },
}

---@class EventParam.ET_ABILITY_CD_END
---@field ability Ability # 技能对象
---@field unit Unit # 技能Owner
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
    event_params = {
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
            desc = "技能Owner",
            lua_desc = "技能Owner",
        },
    },
}

---@class EventParam.ET_ABILITY_SEND_CUE_EVENT
---@field ability Ability # 技能对象
---@alias EventParam.技能-自定义动画轴 EventParam.ET_ABILITY_SEND_CUE_EVENT
M.config["技能-自定义动画轴"] = {
    desc = "",
    extraObjs = {
        [1] = {
            getter = function (self) return self:get_owner() end,
            luaType = "Unit",
        },
    },
    key = "ET_ABILITY_SEND_CUE_EVENT",
    name = "技能-自定义动画轴",
    object = "Ability",
    params = {
        [1] = {
            desc = "CUE事件名",
            name = "string",
            type = "string",
        },
    },
    event_params = {
        [1] = {
            name = "__ability",
            type = "py.Ability",
            lua_name = "ability",
            lua_type = "Ability",
            desc = "技能对象",
            lua_desc = "技能对象",
        },
    },
}

---@class EventParam.ET_OBTAIN_MODIFIER
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
        [1] = {
            name = "__modifier",
            type = "py.ModifierEntity",
            lua_name = "buff",
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
            type = "py.UnitID",
            lua_name = "from_unit",
            lua_type = "Unit",
            desc = "效果施加者",
            lua_desc = "效果施加者",
        },
        [4] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_LOSS_MODIFIER
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
        [1] = {
            name = "__modifier",
            type = "py.ModifierEntity",
            lua_name = "buff",
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
            type = "py.UnitID",
            lua_name = "from_unit",
            lua_type = "Unit",
            desc = "效果施加者",
            lua_desc = "效果施加者",
        },
        [4] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_MODIFIER_CYCLE_TRIGGER
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
        [1] = {
            name = "__modifier",
            type = "py.ModifierEntity",
            lua_name = "buff",
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
            type = "py.UnitID",
            lua_name = "from_unit",
            lua_type = "Unit",
            desc = "效果施加者",
            lua_desc = "效果施加者",
        },
        [4] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_MODIFIER_ADDTION
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
        [1] = {
            name = "__modifier",
            type = "py.ModifierEntity",
            lua_name = "buff",
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
            type = "py.UnitID",
            lua_name = "from_unit",
            lua_type = "Unit",
            desc = "效果施加者",
            lua_desc = "效果施加者",
        },
        [4] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_MODIFIER_LAYER_CHANGE
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field layer_change_values integer # 层数变化值
---@field from_unit Unit # 效果施加者
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
        [1] = {
            name = "__modifier",
            type = "py.ModifierEntity",
            lua_name = "buff",
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
            type = "py.UnitID",
            lua_name = "from_unit",
            lua_type = "Unit",
            desc = "效果施加者",
            lua_desc = "效果施加者",
        },
        [5] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_MODIFIER_GET_BEFORE_CREATE
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
        [1] = {
            name = "__modifier",
            type = "py.ModifierEntity",
            lua_name = "buff",
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
            type = "py.UnitID",
            lua_name = "from_unit",
            lua_type = "Unit",
            desc = "效果施加者",
            lua_desc = "效果施加者",
        },
        [4] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_MODIFIER_BE_COVERED
---@field owner_unit Unit # 效果携带者
---@field old_buff Buff # 已有的魔法效果
---@field new_buff Buff # 新增的魔法效果
---@field lua_table py.Table # 用户自定义配置表
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
    event_params = {
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
            lua_name = "old_buff",
            lua_type = "Buff",
            desc = "已有的魔法效果",
            lua_desc = "已有的魔法效果",
        },
        [3] = {
            name = "__new_modifier",
            type = "py.ModifierEntity",
            lua_name = "new_buff",
            lua_type = "Buff",
            desc = "新增的魔法效果",
            lua_desc = "新增的魔法效果",
        },
        [4] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_DEST_CREATE_NEW
---@field destructible Destructible # 可破坏物
---@field lua_table py.Table # 用户自定义配置表
---@alias EventParam.可破坏物-创建 EventParam.ET_DEST_CREATE_NEW
M.config["可破坏物-创建"] = {
    desc = "可破坏物创建后触发",
    key = "ET_DEST_CREATE_NEW",
    name = "可破坏物-创建",
    object = "Destructible",
    params = {
    },
    event_params = {
        [1] = {
            name = "__destructible_id",
            type = "py.DestructibleID",
            lua_name = "destructible",
            lua_type = "Destructible",
            desc = "可破坏物ID",
            lua_desc = "可破坏物",
        },
        [2] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_DEST_DIE_NEW
---@field destructible Destructible # 可破坏物
---@field unit_id_of_dest_killer Unit # 凶手单位ID
---@alias EventParam.可破坏物-死亡 EventParam.ET_DEST_DIE_NEW
M.config["可破坏物-死亡"] = {
    desc = "可破坏物死亡后触发",
    key = "ET_DEST_DIE_NEW",
    name = "可破坏物-死亡",
    object = "Destructible",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_DEST_REVIVE_NEW
---@field destructible Destructible # 可破坏物
---@alias EventParam.可破坏物-复活 EventParam.ET_DEST_REVIVE_NEW
M.config["可破坏物-复活"] = {
    desc = "可破坏物复活后触发",
    key = "ET_DEST_REVIVE_NEW",
    name = "可破坏物-复活",
    object = "Destructible",
    params = {
    },
    event_params = {
        [1] = {
            name = "__destructible_id",
            type = "py.DestructibleID",
            lua_name = "destructible",
            lua_type = "Destructible",
            desc = "可破坏物ID",
            lua_desc = "可破坏物",
        },
    },
}

---@class EventParam.ET_DEST_RES_CNT_CHG_NEW
---@field destructible Destructible # 可破坏物
---@field res_chg_cnt_in_dest_event integer # 可破坏物资源变化量
---@alias EventParam.可破坏物-资源变化 EventParam.ET_DEST_RES_CNT_CHG_NEW
M.config["可破坏物-资源变化"] = {
    desc = "可破坏物存储的资源变化后触发",
    key = "ET_DEST_RES_CNT_CHG_NEW",
    name = "可破坏物-资源变化",
    object = "Destructible",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_DEST_COLLECTED_NEW
---@field destructible Destructible # 可破坏物
---@field unit_id_in_dest_event Unit # 事件中的单位
---@field ability_in_dest_event Ability # 事件中的技能对象
---@field player_res_cnt_in_event integer # 采集的玩家属性个数
---@alias EventParam.可破坏物-采集 EventParam.ET_DEST_COLLECTED_NEW
M.config["可破坏物-采集"] = {
    desc = "可破坏物被采集后触发",
    key = "ET_DEST_COLLECTED_NEW",
    name = "可破坏物-采集",
    object = "Destructible",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_GET_HURT_NEW
---@field destructible Destructible # 可破坏物
---@field unit_id_of_hurt_dest Unit # 事件中的单位
---@field damage_value_of_hurt_dest number # 受到的伤害
---@alias EventParam.可破坏物-受到伤害 EventParam.ET_GET_HURT_NEW
M.config["可破坏物-受到伤害"] = {
    desc = "可破坏物受到伤害后触发",
    key = "ET_GET_HURT_NEW",
    name = "可破坏物-受到伤害",
    object = "Destructible",
    params = {
    },
    event_params = {
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
            lua_type = "number",
            desc = "受到的伤害",
            lua_desc = "受到的伤害",
        },
    },
}

---@class EventParam.ET_SELECT_DEST
---@field player Player # 玩家
---@field destructible Destructible # 点击到可破坏物
---@alias EventParam.选中-可破坏物 EventParam.ET_SELECT_DEST
M.config["选中-可破坏物"] = {
    desc = "玩家选中可破坏物被后触发",
    key = "ET_SELECT_DEST",
    name = "选中-可破坏物",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_SELECT_DEST
---@field player Player # 玩家
---@field destructible Destructible # 点击到可破坏物
---@alias EventParam.本地-选中-可破坏物 EventParam.ET_ASYNC_SELECT_DEST
M.config["本地-选中-可破坏物"] = {
    desc = "本地玩家选中可破坏物被后触发",
    key = "ET_ASYNC_SELECT_DEST",
    name = "本地-选中-可破坏物",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_DEST_DELETE
---@field destructible Destructible # 触发事件的可破坏物
---@alias EventParam.可破坏物-移除 EventParam.ET_DEST_DELETE
M.config["可破坏物-移除"] = {
    desc = "可破坏物被移除后触发",
    key = "ET_DEST_DELETE",
    name = "可破坏物-移除",
    object = "Destructible",
    params = {
    },
    event_params = {
        [1] = {
            name = "__destructible_id",
            type = "py.DestructibleID",
            lua_name = "destructible",
            lua_type = "Destructible",
            desc = "触发事件的可破坏物",
            lua_desc = "触发事件的可破坏物",
        },
    },
}

---@class EventParam.ET_PRODUCE_PROJECTILE
---@field projectile Projectile # 投射物
---@alias EventParam.投射物-创建 EventParam.ET_PRODUCE_PROJECTILE
M.config["投射物-创建"] = {
    desc = "投射物创建后触发",
    key = "ET_PRODUCE_PROJECTILE",
    name = "投射物-创建",
    object = "Projectile",
    params = {
    },
    event_params = {
        [1] = {
            lua_name = "projectile",
            lua_type = "Projectile",
            lua_desc = "投射物",
        },
    },
}

---@class EventParam.ET_DEATH_PROJECTILE
---@field projectile Projectile # 投射物
---@alias EventParam.投射物-死亡 EventParam.ET_DEATH_PROJECTILE
M.config["投射物-死亡"] = {
    desc = "投射物死亡后触发",
    key = "ET_DEATH_PROJECTILE",
    name = "投射物-死亡",
    object = "Projectile",
    params = {
    },
    event_params = {
        [1] = {
            lua_name = "projectile",
            lua_type = "Projectile",
            lua_desc = "投射物",
        },
    },
}

---@class EventParam.ET_TRIGGER_COMPONENT_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field pos py.Vector2 # 触碰坐标
---@field touch_id integer # 触碰ID
---@field str1 string # 自定义信息
---@field ui UI # ui
---@field data any # 自定义数据
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
    event_params = {
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
        [6] = {
            name = "__str1",
            type = "string",
            lua_name = "str1",
            lua_type = "string",
            desc = "自定义信息",
            lua_desc = "自定义信息",
        },
        [7] = {
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
        [8] = {
            lua_name = "data",
            lua_type = "any",
            lua_desc = "自定义数据",
        },
    },
}

---@class EventParam.ET_ON_CLICK_MINI_MAP_PANEL
---@field player Player # 玩家
---@field mini_map_touched_world_pos Point # 点击对应的世界坐标
---@alias EventParam.玩家-点击小地图 EventParam.ET_ON_CLICK_MINI_MAP_PANEL
M.config["玩家-点击小地图"] = {
    desc = "点击小地图时触发",
    from_global = true,
    key = "ET_ON_CLICK_MINI_MAP_PANEL",
    name = "玩家-点击小地图",
    object = "Player",
    params = {
        [1] = {
            call = false,
            desc = "按下的键",
            name = "key",
            resolve = function (key)
                return y3.const.ClickMiniMapKey[key] or key
            end,
            type = "y3.Const.ClickMiniMapKey|integer",
        },
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
        [2] = {
            name = "__mini_map_touched_world_pos",
            type = "py.Point",
            lua_name = "mini_map_touched_world_pos",
            lua_type = "Point",
            desc = "点击对应的世界坐标",
            lua_desc = "点击对应的世界坐标",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_SLIDER_CHANGE_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field float1 number # 自定义信息
---@field ui UI # ui
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
    event_params = {
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
            name = "__float1",
            type = "py.Fixed",
            lua_name = "float1",
            lua_type = "number",
            desc = "自定义信息",
            lua_desc = "自定义信息",
        },
        [5] = {
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_CHATBOX_VISIBLE_CHANGE_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field bool1 boolean # 自定义信息
---@field ui UI # ui
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
    event_params = {
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
            name = "__bool1",
            type = "boolean",
            lua_name = "bool1",
            lua_type = "boolean",
            desc = "自定义信息",
            lua_desc = "自定义信息",
        },
        [5] = {
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_EQUIP_SLOT_DRAG_EVENT
---@field ui_event_name string # 事件名
---@field player Player # 玩家
---@field equip_slot_id integer # 槽位索引
---@field equip_slot_type integer # 物品栏类型
---@field equip_slot_item Item # 物品
---@field equip_slot_unit Unit # 单位
---@field equip_slot_is_begin boolean # 是否拖拽开始
---@field ui UI # ui
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
    event_params = {
        [1] = {
            name = "__ui_event_name",
            type = "string",
            lua_name = "ui_event_name",
            lua_type = "string",
            desc = "事件名",
            lua_desc = "事件名",
        },
        [2] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
        [3] = {
            name = "__equip_slot_id",
            type = "integer",
            lua_name = "equip_slot_id",
            lua_type = "integer",
            desc = "槽位索引",
            lua_desc = "槽位索引",
        },
        [4] = {
            name = "__equip_slot_type",
            type = "integer",
            lua_name = "equip_slot_type",
            lua_type = "integer",
            desc = "物品栏类型",
            lua_desc = "物品栏类型",
        },
        [5] = {
            name = "__equip_slot_item",
            type = "py.Item",
            lua_name = "equip_slot_item",
            lua_type = "Item",
            desc = "物品",
            lua_desc = "物品",
        },
        [6] = {
            name = "__equip_slot_unit",
            type = "py.Unit",
            lua_name = "equip_slot_unit",
            lua_type = "Unit",
            desc = "单位",
            lua_desc = "单位",
        },
        [7] = {
            name = "__equip_slot_is_begin",
            type = "boolean",
            lua_name = "equip_slot_is_begin",
            lua_type = "boolean",
            desc = "是否拖拽开始",
            lua_desc = "是否拖拽开始",
        },
        [8] = {
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_CHECKBOX_CHANGE_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field bool1 boolean # 自定义信息
---@field ui UI # ui
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
    event_params = {
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
            name = "__bool1",
            type = "boolean",
            lua_name = "bool1",
            lua_type = "boolean",
            desc = "自定义信息",
            lua_desc = "自定义信息",
        },
        [5] = {
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_VIDEO_END_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field str1 string # 自定义信息
---@field ui UI # ui
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
    event_params = {
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
            name = "__str1",
            type = "string",
            lua_name = "str1",
            lua_type = "string",
            desc = "自定义信息",
            lua_desc = "自定义信息",
        },
        [5] = {
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_INPUT_FIELD_GET_FOCUS_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field ui UI # ui
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
    event_params = {
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
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_INPUT_FIELD_LOST_FOCUS_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field ui UI # ui
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
    event_params = {
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
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_TRIGGER_UI_INPUT_FIELD_TEXT_CHANGED_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field str1 string # 文本内容
---@field ui UI # ui
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
    event_params = {
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
            name = "__str1",
            type = "string",
            lua_name = "str1",
            lua_type = "string",
            desc = "文本内容",
            lua_desc = "文本内容",
        },
        [5] = {
            lua_name = "ui",
            lua_type = "UI",
            lua_desc = "ui",
        },
    },
}

---@class EventParam.ET_KEYBOARD_KEY_DOWN_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.KeyboardKey # 当前键盘按键
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
    event_params = {
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
    },
}

---@class EventParam.ET_KEYBOARD_KEY_UP_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.KeyboardKey # 当前键盘按键
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
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_KEYBOARD_KEY_DOWN_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.KeyboardKey # 当前键盘按键
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
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_KEYBOARD_KEY_UP_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.KeyboardKey # 当前键盘按键
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
    event_params = {
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
    },
}

---@class EventParam.ET_MOUSE_KEY_DOWN_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标
---@field is_click_swallowed_by_ui boolean # 点击事件是否被UI吞噬
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
    event_params = {
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
        [4] = {
            name = "__is_click_swallowed_by_ui",
            type = "boolean",
            lua_name = "is_click_swallowed_by_ui",
            lua_type = "boolean",
            desc = "点击事件是否被UI吞噬",
            lua_desc = "点击事件是否被UI吞噬",
        },
    },
}

---@class EventParam.ET_MOUSE_KEY_UP_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标
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
    event_params = {
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
    },
}

---@class EventParam.MOUSE_KEY_DB_CLICK_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标
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
    event_params = {
    },
}

---@class EventParam.ET_ASYNC_MOUSE_KEY_DOWN_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标
---@field is_click_swallowed_by_ui boolean # 点击事件是否被UI吞噬
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
    event_params = {
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
        [4] = {
            name = "__is_click_swallowed_by_ui",
            type = "boolean",
            lua_name = "is_click_swallowed_by_ui",
            lua_type = "boolean",
            desc = "点击事件是否被UI吞噬",
            lua_desc = "点击事件是否被UI吞噬",
        },
    },
}

---@class EventParam.ET_ASYNC_MOUSE_KEY_UP_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标
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
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_MOUSE_KEY_DB_CLICK_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标
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
    event_params = {
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
    },
}

---@class EventParam.MOUSE_KEY_DOWN_UNIT_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位
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
    event_params = {
    },
}

---@class EventParam.MOUSE_KEY_UP_UNIT_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位
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
    event_params = {
    },
}

---@class EventParam.MOUSE_KEY_DB_CLICK_UNIT_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位
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
    event_params = {
    },
}

---@class EventParam.ET_MOUSE_KEY_DOWN_UNIT_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位
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
    event_params = {
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
    },
}

---@class EventParam.ET_MOUSE_KEY_UP_UNIT_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位
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
    event_params = {
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
    },
}

---@class EventParam.ET_MOUSE_KEY_DB_CLICK_UNIT_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位
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
    event_params = {
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
    },
}

---@class EventParam.MOUSE_MOVE_EVENT
---@field player Player # 触发按键的玩家
---@field pointing_world_pos Point # 鼠标指向的世界坐标
---@field tar_x integer # 鼠标指向的屏幕坐标X
---@field tar_y integer # 鼠标指向的屏幕坐标Y
---@alias EventParam.鼠标-移动 EventParam.MOUSE_MOVE_EVENT
M.config["鼠标-移动"] = {
    desc = "鼠标移动时触发",
    from_global = true,
    key = "MOUSE_MOVE_EVENT",
    name = "鼠标-移动",
    object = "Player",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_ASYNC_MOUSE_MOVE_EVENT
---@field player Player # 触发按键的玩家
---@field pointing_world_pos Point # 鼠标指向的世界坐标
---@field tar_x integer # 鼠标指向的屏幕坐标X
---@field tar_y integer # 鼠标指向的屏幕坐标Y
---@alias EventParam.本地-鼠标-移动 EventParam.ET_ASYNC_MOUSE_MOVE_EVENT
M.config["本地-鼠标-移动"] = {
    desc = "鼠标移动时触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_MOVE_EVENT",
    name = "本地-鼠标-移动",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_MOUSE_WHEEL_EVENT
---@field player Player # 触发按键的玩家
---@field mouse_wheel py.MouseWheel # 当前鼠标滚轮
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
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_MOUSE_WHEEL_EVENT
---@field player Player # 触发按键的玩家
---@field mouse_wheel py.MouseWheel # 当前鼠标滚轮
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
    event_params = {
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
    },
}

---@class EventParam.ET_SELECT_UNIT
---@field player Player # 玩家
---@field unit Unit # 点击到单位
---@alias EventParam.选中-单位 EventParam.ET_SELECT_UNIT
M.config["选中-单位"] = {
    desc = "玩家选中单位时触发",
    key = "ET_SELECT_UNIT",
    name = "选中-单位",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_SELECT_UNIT
---@field player Player # 玩家
---@field unit Unit # 点击的单位
---@alias EventParam.本地-选中-单位 EventParam.ET_ASYNC_SELECT_UNIT
M.config["本地-选中-单位"] = {
    desc = "本地玩家选中单位时触发",
    key = "ET_ASYNC_SELECT_UNIT",
    name = "本地-选中-单位",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
        [2] = {
            lua_name = "unit",
            lua_type = "Unit",
            lua_desc = "点击的单位",
        },
    },
}

---@class EventParam.CANCEL_SELECT_UNIT
---@field player Player # 玩家
---@alias EventParam.选中-取消 EventParam.CANCEL_SELECT_UNIT
M.config["选中-取消"] = {
    desc = "玩家主动取消选中时触发",
    key = "CANCEL_SELECT_UNIT",
    name = "选中-取消",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_ASYNC_CANCEL_SELECT_UNIT
---@field player Player # 玩家
---@alias EventParam.本地-选中-取消 EventParam.ET_ASYNC_CANCEL_SELECT_UNIT
M.config["本地-选中-取消"] = {
    desc = "玩家的选中状态被取消时触发",
    key = "ET_ASYNC_CANCEL_SELECT_UNIT",
    name = "本地-选中-取消",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家ID",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.LOST_SELECT_UNIT
---@field player Player # 玩家
---@field unit Unit # 点击到单位
---@alias EventParam.选中-失去单位 EventParam.LOST_SELECT_UNIT
M.config["选中-失去单位"] = {
    desc = "玩家被动失去对单位的选中状态时触发",
    key = "LOST_SELECT_UNIT",
    name = "选中-失去单位",
    object = "Player",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_ASYNC_LOST_SELECT_UNIT
---@field player Player # 玩家
---@field unit Unit # 点击到单位
---@alias EventParam.本地-选中-失去单位 EventParam.ET_ASYNC_LOST_SELECT_UNIT
M.config["本地-选中-失去单位"] = {
    desc = "本地玩家被动失去对单位的选中状态时触发",
    key = "ET_ASYNC_LOST_SELECT_UNIT",
    name = "本地-选中-失去单位",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_SELECT_ITEM
---@field player Player # 玩家
---@field item Item # 点击到物品
---@alias EventParam.选中-物品 EventParam.ET_SELECT_ITEM
M.config["选中-物品"] = {
    desc = "物品被选中时触发",
    key = "ET_SELECT_ITEM",
    name = "选中-物品",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_SELECT_ITEM
---@field player Player # 玩家
---@field item Item # 点击到物品
---@alias EventParam.本地-选中-物品 EventParam.ET_ASYNC_SELECT_ITEM
M.config["本地-选中-物品"] = {
    desc = "本地玩家选中物品时触发",
    key = "ET_ASYNC_SELECT_ITEM",
    name = "本地-选中-物品",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ATTR_CHEATING_DETECTED
---@field player Player # 作弊玩家
---@field unit Unit # 作弊单位
---@field attr_key string # 作弊属性名
---@field cheating_value number # 作弊值
---@field real_value number # 真实值
---@alias EventParam.玩家-检测到作弊 EventParam.ET_ATTR_CHEATING_DETECTED
M.config["玩家-检测到作弊"] = {
    desc = "",
    key = "ET_ATTR_CHEATING_DETECTED",
    name = "玩家-检测到作弊",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "作弊玩家ID",
            lua_desc = "作弊玩家",
        },
        [2] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "作弊单位id",
            lua_desc = "作弊单位",
        },
        [3] = {
            name = "__attr_key",
            type = "string",
            lua_name = "attr_key",
            lua_type = "string",
            desc = "作弊属性名",
            lua_desc = "作弊属性名",
        },
        [4] = {
            name = "__cheating_value",
            type = "py.Fixed",
            lua_name = "cheating_value",
            lua_type = "number",
            desc = "作弊值",
            lua_desc = "作弊值",
        },
        [5] = {
            name = "__real_value",
            type = "py.Fixed",
            lua_name = "real_value",
            lua_type = "number",
            desc = "真实值",
            lua_desc = "真实值",
        },
    },
}

---@class EventParam.ET_DOUBLE_CLICK_ITEM
---@field player Player # 玩家
---@field item Item # 双击到物品
---@alias EventParam.鼠标-双击物品 EventParam.ET_DOUBLE_CLICK_ITEM
M.config["鼠标-双击物品"] = {
    desc = "鼠标上左键双击物品时触发",
    from_global = true,
    key = "ET_DOUBLE_CLICK_ITEM",
    name = "鼠标-双击物品",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_DOUBLE_CLICK_DEST
---@field player Player # 玩家
---@field destructible Destructible # 双击到可破坏物
---@alias EventParam.鼠标-双击可破坏物 EventParam.ET_DOUBLE_CLICK_DEST
M.config["鼠标-双击可破坏物"] = {
    desc = "鼠标上左键双击可破坏物时触发",
    from_global = true,
    key = "ET_DOUBLE_CLICK_DEST",
    name = "鼠标-双击可破坏物",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_SELECT_UNIT_GROUP
---@field player Player # 玩家
---@field unit_group_id_list UnitGroup # 框选到单位组id列表
---@field team_id integer # 队伍编号
---@alias EventParam.选中-单位组 EventParam.ET_SELECT_UNIT_GROUP
M.config["选中-单位组"] = {
    desc = "玩家选中单位组时触发",
    key = "ET_SELECT_UNIT_GROUP",
    name = "选中-单位组",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ASYNC_SELECT_UNIT_GROUP
---@field player Player # 玩家
---@field unit_group_id_list UnitGroup # 框选到单位组id列表
---@field team_id integer # 队伍编号
---@alias EventParam.本地-选中-单位组 EventParam.ET_ASYNC_SELECT_UNIT_GROUP
M.config["本地-选中-单位组"] = {
    desc = "本地玩家选中单位组时触发",
    key = "ET_ASYNC_SELECT_UNIT_GROUP",
    name = "本地-选中-单位组",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_START_SKILL_POINTER
---@field player Player # 玩家
---@field unit Unit # 释放单位
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能Index
---@field ability_seq py.AbilitySeq # 技能Seq
---@field ability Ability # 技能
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
    event_params = {
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
        [6] = {
            lua_name = "ability",
            lua_type = "Ability",
            lua_desc = "技能",
        },
    },
}

---@class EventParam.ET_BUILD_SKILL_BEFORE_RELEASE
---@field player Player # 玩家
---@field unit Unit # 释放单位
---@field ability_seq py.AbilitySeq # 技能Seq
---@field ability Ability # 技能
---@field new_unit_key py.UnitKey # 要建造单位的物编ID
---@field ability_target_pos Point # 施法目标位置
---@field ability_release_id py.AbilityReleaseId # 单次技能释放唯一ID
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
    event_params = {
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
            name = "__ability_seq",
            type = "py.AbilitySeq",
            lua_name = "ability_seq",
            lua_type = "py.AbilitySeq",
            desc = "技能Seq",
            lua_desc = "技能Seq",
        },
        [4] = {
            lua_name = "ability",
            lua_type = "Ability",
            lua_desc = "技能",
        },
        [5] = {
            name = "__new_unit_key",
            type = "py.UnitKey",
            lua_name = "new_unit_key",
            lua_type = "py.UnitKey",
            desc = "要建造单位的物编ID",
            lua_desc = "要建造单位的物编ID",
        },
        [6] = {
            name = "__ability_target_pos",
            type = "py.Point",
            lua_name = "ability_target_pos",
            lua_type = "Point",
            desc = "施法目标位置",
            lua_desc = "施法目标位置",
        },
        [7] = {
            name = "__ability_release_id",
            type = "py.AbilityReleaseId",
            lua_name = "ability_release_id",
            lua_type = "py.AbilityReleaseId",
            desc = "单次技能释放唯一ID",
            lua_desc = "单次技能释放唯一ID",
        },
    },
}

---@class EventParam.ET_STOP_SKILL_POINTER
---@field player Player # 玩家
---@field unit Unit # 释放单位
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能Index
---@field ability_seq py.AbilitySeq # 技能Seq
---@field ability Ability # 技能
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
    event_params = {
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
        [6] = {
            lua_name = "ability",
            lua_type = "Ability",
            lua_desc = "技能",
        },
    },
}

---@class EventParam.ET_UNIT_ADD_ITEM
---@field unit Unit # 获得该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@alias EventParam.物品-获得 EventParam.ET_UNIT_ADD_ITEM
M.config["物品-获得"] = {
    desc = "单位获得物品时触发",
    key = "ET_UNIT_ADD_ITEM",
    name = "物品-获得",
    object = "Item",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_ADD_ITEM_TO_BAR
---@field unit Unit # 获得该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@alias EventParam.物品-进入物品栏 EventParam.ET_UNIT_ADD_ITEM_TO_BAR
M.config["物品-进入物品栏"] = {
    desc = "物品进入单位的物品栏时触发",
    key = "ET_UNIT_ADD_ITEM_TO_BAR",
    name = "物品-进入物品栏",
    object = "Item",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_ADD_ITEM_TO_PKG
---@field unit Unit # 获得该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@alias EventParam.物品-进入背包 EventParam.ET_UNIT_ADD_ITEM_TO_PKG
M.config["物品-进入背包"] = {
    desc = "物品进入单位的背包时触发",
    key = "ET_UNIT_ADD_ITEM_TO_PKG",
    name = "物品-进入背包",
    object = "Item",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_REMOVE_ITEM
---@field unit Unit # 失去该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@alias EventParam.物品-失去 EventParam.ET_UNIT_REMOVE_ITEM
M.config["物品-失去"] = {
    desc = "单位失去物品时触发",
    key = "ET_UNIT_REMOVE_ITEM",
    name = "物品-失去",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "失去该物品的单位id",
            lua_desc = "失去该物品的单位",
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
    },
}

---@class EventParam.ET_UNIT_REMOVE_ITEM_FROM_BAR
---@field unit Unit # 失去该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@alias EventParam.物品-离开物品栏 EventParam.ET_UNIT_REMOVE_ITEM_FROM_BAR
M.config["物品-离开物品栏"] = {
    desc = "物品离开单位的物品栏时触发",
    key = "ET_UNIT_REMOVE_ITEM_FROM_BAR",
    name = "物品-离开物品栏",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "失去该物品的单位id",
            lua_desc = "失去该物品的单位",
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
    },
}

---@class EventParam.ET_UNIT_REMOVE_ITEM_FROM_PKG
---@field unit Unit # 失去该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@alias EventParam.物品-离开背包 EventParam.ET_UNIT_REMOVE_ITEM_FROM_PKG
M.config["物品-离开背包"] = {
    desc = "物品离开单位的背包时触发",
    key = "ET_UNIT_REMOVE_ITEM_FROM_PKG",
    name = "物品-离开背包",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "失去该物品的单位id",
            lua_desc = "失去该物品的单位",
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
    },
}

---@class EventParam.ET_UNIT_USE_ITEM
---@field unit Unit # 使用该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@alias EventParam.物品-使用 EventParam.ET_UNIT_USE_ITEM
M.config["物品-使用"] = {
    desc = "单位使用物品时触发",
    key = "ET_UNIT_USE_ITEM",
    name = "物品-使用",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "使用该物品的单位id",
            lua_desc = "使用该物品的单位",
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
    },
}

---@class EventParam.ET_UNIT_START_NAV_EVENT
---@field unit Unit # 单位
---@alias EventParam.单位-寻路开始 EventParam.ET_UNIT_START_NAV_EVENT
M.config["单位-寻路开始"] = {
    desc = "攻击、移动、施法等行为均可能导致寻路",
    key = "ET_UNIT_START_NAV_EVENT",
    name = "单位-寻路开始",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
    },
}

---@class EventParam.ET_UNIT_END_NAV_EVENT
---@field unit Unit # 单位
---@alias EventParam.单位-寻路结束 EventParam.ET_UNIT_END_NAV_EVENT
M.config["单位-寻路结束"] = {
    desc = "寻路到达目标位置或失败3次后触发",
    key = "ET_UNIT_END_NAV_EVENT",
    name = "单位-寻路结束",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "单位id",
            lua_desc = "单位",
        },
    },
}

---@class EventParam.ET_ITEM_STACK_CHANGED
---@field unit Unit # 单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@field delta_cnt integer # 变化值
---@alias EventParam.物品-堆叠变化 EventParam.ET_ITEM_STACK_CHANGED
M.config["物品-堆叠变化"] = {
    desc = "物品堆叠数变化时触发",
    key = "ET_ITEM_STACK_CHANGED",
    name = "物品-堆叠变化",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
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
    },
}

---@class EventParam.ET_ITEM_CHARGE_CHANGED
---@field unit Unit # 单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@field delta_cnt integer # 变化值
---@alias EventParam.物品-充能变化 EventParam.ET_ITEM_CHARGE_CHANGED
M.config["物品-充能变化"] = {
    desc = "物品充能层数变化时触发",
    key = "ET_ITEM_CHARGE_CHANGED",
    name = "物品-充能变化",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
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
    },
}

---@class EventParam.ET_ITEM_ON_CREATE
---@field item Item # 被创建的物品
---@field lua_table py.Table # 用户自定义配置表
---@alias EventParam.物品-创建 EventParam.ET_ITEM_ON_CREATE
M.config["物品-创建"] = {
    desc = "物品创建时触发",
    key = "ET_ITEM_ON_CREATE",
    name = "物品-创建",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__item",
            type = "py.Item",
            lua_name = "item",
            lua_type = "Item",
            desc = "被创建的物品",
            lua_desc = "被创建的物品",
        },
        [2] = {
            name = "__lua_table",
            type = "py.Table",
            lua_name = "lua_table",
            lua_type = "py.Table",
            desc = "用户自定义配置表",
            lua_desc = "用户自定义配置表",
        },
    },
}

---@class EventParam.ET_ITEM_ON_DESTROY
---@field item Item # 销毁的物品
---@alias EventParam.物品-移除 EventParam.ET_ITEM_ON_DESTROY
M.config["物品-移除"] = {
    desc = "物品移除时触发",
    key = "ET_ITEM_ON_DESTROY",
    name = "物品-移除",
    object = "Item",
    params = {
    },
    event_params = {
        [1] = {
            name = "__item_id",
            type = "py.ItemID",
            lua_name = "item",
            lua_type = "Item",
            desc = "销毁的物品",
            lua_desc = "销毁的物品",
        },
    },
}

---@class EventParam.ET_ITEM_SOLD
---@field unit Unit # 购买者
---@field unit2 Unit # 贩卖者
---@field item Item # 被售出的物品
---@field buy_unit Unit # 收购物品的单位
---@field shop_unit Unit # 出售物品的单位
---@alias EventParam.物品-出售 EventParam.ET_ITEM_SOLD
M.config["物品-出售"] = {
    desc = "将物品出售给商店时触发",
    key = "ET_ITEM_SOLD",
    name = "物品-出售",
    object = "Item",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ITEM_BROKEN
---@field item Item # 被破坏的物品
---@field unit Unit # 破坏物品的单位
---@alias EventParam.物品-死亡 EventParam.ET_ITEM_BROKEN
M.config["物品-死亡"] = {
    desc = "物品被破坏时触发",
    key = "ET_ITEM_BROKEN",
    name = "物品-死亡",
    object = "Item",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ITEM_CREATE_ON_DEST_COLLECTED
---@field item Item # 事件中的物品
---@field destructible Destructible # 事件中的可破坏物
---@field unit Unit # 采集可破坏物事件中的单位
---@field ability Ability # 采集可破坏物的捷能
---@alias EventParam.物品-采集创建 EventParam.ET_ITEM_CREATE_ON_DEST_COLLECTED
M.config["物品-采集创建"] = {
    desc = "物品通过采集被创建时会触发该事件。采集功能来自可破坏物。",
    key = "ET_ITEM_CREATE_ON_DEST_COLLECTED",
    name = "物品-采集创建",
    object = "Item",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ATTACK_MOVE_CMD
---@field unit Unit # 指定单位
---@field tar_x number # 点击位置X坐标
---@field tar_y number # 点击位置Y坐标
---@alias EventParam.命令-攻击移动 EventParam.ET_ATTACK_MOVE_CMD
M.config["命令-攻击移动"] = {
    desc = "",
    key = "ET_ATTACK_MOVE_CMD",
    name = "命令-攻击移动",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit",
            type = "py.Unit",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "指定单位",
            lua_desc = "指定单位",
        },
        [2] = {
            name = "__tar_x",
            type = "py.Fixed",
            lua_name = "tar_x",
            lua_type = "number",
            desc = "点击位置X坐标",
            lua_desc = "点击位置X坐标",
        },
        [3] = {
            name = "__tar_y",
            type = "py.Fixed",
            lua_name = "tar_y",
            lua_type = "number",
            desc = "点击位置Y坐标",
            lua_desc = "点击位置Y坐标",
        },
    },
}

---@class EventParam.ET_SELL_ITEM_CMD
---@field shop_unit Unit # 商店单位
---@field item Item # 商品
---@alias EventParam.命令-出售物品 EventParam.ET_SELL_ITEM_CMD
M.config["命令-出售物品"] = {
    desc = "",
    key = "ET_SELL_ITEM_CMD",
    name = "命令-出售物品",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__shop_unit_id",
            type = "py.UnitID",
            lua_name = "shop_unit",
            lua_type = "Unit",
            desc = "商店单位ID",
            lua_desc = "商店单位",
        },
        [2] = {
            name = "__item_id",
            type = "py.ItemID",
            lua_name = "item",
            lua_type = "Item",
            desc = "商品",
            lua_desc = "商品",
        },
    },
}

---@class EventParam.ET_AI_RELEASE_SKILL_CMD
---@field unit Unit # 指定单位
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能Index
---@field ability_seq py.AbilitySeq # 技能SEQ
---@field target_item py.Dict # 释放技能参数
---@field ability Ability # 技能
---@alias EventParam.命令-施放技能 EventParam.ET_AI_RELEASE_SKILL_CMD
M.config["命令-施放技能"] = {
    desc = "",
    key = "ET_AI_RELEASE_SKILL_CMD",
    name = "命令-施放技能",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit",
            type = "py.Unit",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "指定单位",
            lua_desc = "指定单位",
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
            desc = "技能Index",
            lua_desc = "技能Index",
        },
        [4] = {
            name = "__ability_seq",
            type = "py.AbilitySeq",
            lua_name = "ability_seq",
            lua_type = "py.AbilitySeq",
            desc = "技能SEQ",
            lua_desc = "技能SEQ",
        },
        [5] = {
            name = "__target_item",
            type = "py.Dict",
            lua_name = "target_item",
            lua_type = "py.Dict",
            desc = "释放技能参数",
            lua_desc = "释放技能参数",
        },
        [6] = {
            lua_name = "ability",
            lua_type = "Ability",
            lua_desc = "技能",
        },
    },
}

---@class EventParam.ET_PATROL_CMD
---@field unit Unit # 指定单位
---@field tar_x number # 点击位置X坐标
---@field tar_y number # 点击位置Y坐标
---@alias EventParam.命令-巡逻 EventParam.ET_PATROL_CMD
M.config["命令-巡逻"] = {
    desc = "",
    key = "ET_PATROL_CMD",
    name = "命令-巡逻",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit",
            type = "py.Unit",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "指定单位",
            lua_desc = "指定单位",
        },
        [2] = {
            name = "__tar_x",
            type = "py.Fixed",
            lua_name = "tar_x",
            lua_type = "number",
            desc = "点击位置X坐标",
            lua_desc = "点击位置X坐标",
        },
        [3] = {
            name = "__tar_y",
            type = "py.Fixed",
            lua_name = "tar_y",
            lua_type = "number",
            desc = "点击位置Y坐标",
            lua_desc = "点击位置Y坐标",
        },
    },
}

---@class EventParam.ET_MOVE_UNIT_TO_TARGET_CMD
---@field unit Unit # 指定单位
---@field tar_x number # 点击位置X坐标
---@field tar_y number # 点击位置Y坐标
---@alias EventParam.命令-移动 EventParam.ET_MOVE_UNIT_TO_TARGET_CMD
M.config["命令-移动"] = {
    desc = "",
    key = "ET_MOVE_UNIT_TO_TARGET_CMD",
    name = "命令-移动",
    object = "Unit",
    params = {
    },
    event_params = {
        [1] = {
            name = "__unit",
            type = "py.Unit",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "指定单位",
            lua_desc = "指定单位",
        },
        [2] = {
            name = "__tar_x",
            type = "py.Fixed",
            lua_name = "tar_x",
            lua_type = "number",
            desc = "点击位置X坐标",
            lua_desc = "点击位置X坐标",
        },
        [3] = {
            name = "__tar_y",
            type = "py.Fixed",
            lua_name = "tar_y",
            lua_type = "number",
            desc = "点击位置Y坐标",
            lua_desc = "点击位置Y坐标",
        },
    },
}

---@class EventParam.ET_MOUSE_HOVER_EVENT
---@field player Player # 玩家
---@field unit Unit # 悬浮单位
---@field item Item # 悬浮物品
---@field destructible Destructible # 悬浮可破坏物
---@alias EventParam.鼠标-悬停 EventParam.ET_MOUSE_HOVER_EVENT
M.config["鼠标-悬停"] = {
    desc = "悬停进入或离开都会触发",
    from_global = true,
    key = "ET_MOUSE_HOVER_EVENT",
    name = "鼠标-悬停",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家id",
            lua_desc = "玩家",
        },
        [2] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "悬浮单位ID",
            lua_desc = "悬浮单位",
        },
        [3] = {
            name = "__item_id",
            type = "py.ItemID",
            lua_name = "item",
            lua_type = "Item",
            desc = "悬浮物品ID",
            lua_desc = "悬浮物品",
        },
        [4] = {
            name = "__destructible_id",
            type = "py.DestructibleID",
            lua_name = "destructible",
            lua_type = "Destructible",
            desc = "悬浮可破坏物ID",
            lua_desc = "悬浮可破坏物",
        },
    },
}

---@class EventParam.ET_ASYNC_MOUSE_HOVER_EVENT
---@field player Player # 玩家
---@field unit Unit # 悬浮单位
---@field item Item # 悬浮物品
---@field destructible Destructible # 悬浮可破坏物
---@alias EventParam.本地-鼠标-悬停 EventParam.ET_ASYNC_MOUSE_HOVER_EVENT
M.config["本地-鼠标-悬停"] = {
    desc = "悬停进入或离开都会触发",
    from_global = true,
    key = "ET_ASYNC_MOUSE_HOVER_EVENT",
    name = "本地-鼠标-悬停",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家id",
            lua_desc = "玩家",
        },
        [2] = {
            name = "__unit_id",
            type = "py.UnitID",
            lua_name = "unit",
            lua_type = "Unit",
            desc = "悬浮单位ID",
            lua_desc = "悬浮单位",
        },
        [3] = {
            name = "__item_id",
            type = "py.ItemID",
            lua_name = "item",
            lua_type = "Item",
            desc = "悬浮物品ID",
            lua_desc = "悬浮物品",
        },
        [4] = {
            name = "__destructible_id",
            type = "py.DestructibleID",
            lua_name = "destructible",
            lua_type = "Destructible",
            desc = "悬浮可破坏物ID",
            lua_desc = "悬浮可破坏物",
        },
    },
}

---@class EventParam.ET_CHAT_SEND_GM
---@field str1 string # 指令字符串
---@field player Player # 玩家
---@alias EventParam.玩家-发送消息 EventParam.ET_CHAT_SEND_GM
M.config["玩家-发送消息"] = {
    desc = "玩家发送任意消息时触发",
    from_global = true,
    key = "ET_CHAT_SEND_GM",
    name = "玩家-发送消息",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_EVENT_CUSTOM
---@field c_param_1 integer # 事件参数
---@field c_param_dict py.Dict # 自定义参数列表
---@field data table # 
---@field event string # 
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
    event_params = {
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
        [3] = {
            lua_name = "data",
            lua_type = "table",
            lua_desc = "",
        },
        [4] = {
            lua_name = "event",
            lua_type = "string",
            lua_desc = "",
        },
    },
}

---@class EventParam.ET_MICRO_SPEAK
---@field player Player # 玩家
---@field audio_channel integer # 频道
---@field audio_bool boolean # 是否发言
---@alias EventParam.玩家-语音发言 EventParam.ET_MICRO_SPEAK
M.config["玩家-语音发言"] = {
    desc = "玩家开始语音和结束语音都会触发",
    from_global = true,
    key = "ET_MICRO_SPEAK",
    name = "玩家-语音发言",
    object = "Player",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_UNIT_3D_ACTIVE
---@field unit Unit # 单位
---@field is_active boolean # 是否开启
---@alias EventParam.未知-ET_UNIT_3D_ACTIVE EventParam.ET_UNIT_3D_ACTIVE
M.config["未知-ET_UNIT_3D_ACTIVE"] = {
    _deprecated = true,
    desc = "ET_UNIT_3D_ACTIVE",
    key = "ET_UNIT_3D_ACTIVE",
    name = "未知-ET_UNIT_3D_ACTIVE",
    params = {
    },
    event_params = {
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
    },
}

---@class EventParam.ET_ROLE_STORE_ITEM_CHANGED
---@field store_key py.StoreKey # 道具编号
---@field store_item_type py.StoreItemType # 道具类型
---@field store_item_change_count integer # 平台道具变化数
---@field store_item_expire_date integer # 平台道具到期时间戳
---@field player Player # 玩家
---@alias EventParam.玩家-平台道具变化 EventParam.ET_ROLE_STORE_ITEM_CHANGED
M.config["玩家-平台道具变化"] = {
    desc = "玩家平台道具变化时触发",
    key = "ET_ROLE_STORE_ITEM_CHANGED",
    name = "玩家-平台道具变化",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__store_key",
            type = "py.StoreKey",
            lua_name = "store_key",
            lua_type = "py.StoreKey",
            desc = "道具编号",
            lua_desc = "道具编号",
        },
        [2] = {
            name = "__store_item_type",
            type = "py.StoreItemType",
            lua_name = "store_item_type",
            lua_type = "py.StoreItemType",
            desc = "道具类型",
            lua_desc = "道具类型",
        },
        [3] = {
            name = "__store_item_change_count",
            type = "integer",
            lua_name = "store_item_change_count",
            lua_type = "integer",
            desc = "平台道具变化数",
            lua_desc = "平台道具变化数",
        },
        [4] = {
            name = "__store_item_expire_date",
            type = "integer",
            lua_name = "store_item_expire_date",
            lua_type = "integer",
            desc = "平台道具到期时间戳",
            lua_desc = "平台道具到期时间戳",
        },
        [5] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家id",
            lua_desc = "玩家",
        },
    },
}

---@class EventParam.ET_ROLE_STORE_PAGE_STATE_CHANGED
---@field player Player # 玩家
---@field store_page_state boolean # 商城界面状态
---@alias EventParam.玩家-平台商城窗口变化 EventParam.ET_ROLE_STORE_PAGE_STATE_CHANGED
M.config["玩家-平台商城窗口变化"] = {
    desc = "平台商城窗口变化事件",
    from_global = true,
    key = "ET_ROLE_STORE_PAGE_STATE_CHANGED",
    name = "玩家-平台商城窗口变化",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家id",
            lua_desc = "玩家",
        },
        [2] = {
            name = "__store_page_state",
            type = "boolean",
            lua_name = "store_page_state",
            lua_type = "boolean",
            desc = "商城界面状态",
            lua_desc = "商城界面状态",
        },
    },
}

---@class EventParam.ET_LUA_CONSOLE_COMMAND
---@field str1 string # 指令字符串
---@alias EventParam.控制台-输入 EventParam.ET_LUA_CONSOLE_COMMAND
M.config["控制台-输入"] = {
    desc = "",
    key = "ET_LUA_CONSOLE_COMMAND",
    name = "控制台-输入",
    params = {
    },
    event_params = {
        [1] = {
            name = "__str1",
            type = "string",
            lua_name = "str1",
            lua_type = "string",
            desc = "指令字符串",
            lua_desc = "指令字符串",
        },
    },
}

---@class EventParam.ET_LUA_CONSOLE_TIPS
---@field str1 string # 指令前缀
---@alias EventParam.控制台-请求补全 EventParam.ET_LUA_CONSOLE_TIPS
M.config["控制台-请求补全"] = {
    desc = "",
    key = "ET_LUA_CONSOLE_TIPS",
    name = "控制台-请求补全",
    params = {
    },
    event_params = {
        [1] = {
            name = "__str1",
            type = "string",
            lua_name = "str1",
            lua_type = "string",
            desc = "指令前缀",
            lua_desc = "指令前缀",
        },
    },
}

---@class EventParam.ET_MALL_NOTIFY_FRIEND_NEW
---@field nick_name string # 申请者名称
---@alias EventParam.steam-收到好友申请 EventParam.ET_MALL_NOTIFY_FRIEND_NEW
M.config["steam-收到好友申请"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_FRIEND_NEW",
    name = "steam-收到好友申请",
    params = {
    },
    event_params = {
        [1] = {
            name = "__NICK_NAME__",
            type = "string",
            lua_name = "nick_name",
            lua_type = "string",
            desc = "申请者名称",
            lua_desc = "申请者名称",
        },
    },
}

---@class EventParam.ET_MALL_NOTIFY_FRIEND_DELETE
---@field player_aid integer # 删除者ID
---@alias EventParam.steam-收到被好友删除 EventParam.ET_MALL_NOTIFY_FRIEND_DELETE
M.config["steam-收到被好友删除"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_FRIEND_DELETE",
    name = "steam-收到被好友删除",
    params = {
    },
    event_params = {
        [1] = {
            name = "__PLAYER_AID__",
            type = "integer",
            lua_name = "player_aid",
            lua_type = "integer",
            desc = "删除者ID",
            lua_desc = "删除者ID",
        },
    },
}

---@class EventParam.ET_MALL_NOTIFY_FRIEND_UPDATE
---@field online_state y3.Const.SteamOnlineState # 好友在线状态
---@field player_aid integer # 好友ID
---@alias EventParam.steam-好友在线状态变化 EventParam.ET_MALL_NOTIFY_FRIEND_UPDATE
M.config["steam-好友在线状态变化"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_FRIEND_UPDATE",
    name = "steam-好友在线状态变化",
    params = {
    },
    event_params = {
        [1] = {
            name = "__ONLINE_STATE__",
            type = "integer",
            lua_name = "online_state",
            lua_type = "y3.Const.SteamOnlineState",
            desc = "好友在线状态",
            lua_desc = "好友在线状态",
        },
        [2] = {
            name = "__PLAYER_AID__",
            type = "integer",
            lua_name = "player_aid",
            lua_type = "integer",
            desc = "好友ID",
            lua_desc = "好友ID",
        },
    },
}

---@class EventParam.ET_MALL_NOTIFY_TEAM_UPDATE
---@alias EventParam.steam-本地玩家队伍变化 EventParam.ET_MALL_NOTIFY_TEAM_UPDATE
M.config["steam-本地玩家队伍变化"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_TEAM_UPDATE",
    name = "steam-本地玩家队伍变化",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_MALL_NOTIFY_TEAM_INVITE
---@field player_aid integer # 发送方ID
---@field nick_name string # 发送方名称
---@field team_id integer # 队伍ID
---@alias EventParam.steam-收到队伍邀请 EventParam.ET_MALL_NOTIFY_TEAM_INVITE
M.config["steam-收到队伍邀请"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_TEAM_INVITE",
    name = "steam-收到队伍邀请",
    params = {
    },
    event_params = {
        [1] = {
            name = "__PLAYER_AID__",
            type = "integer",
            lua_name = "player_aid",
            lua_type = "integer",
            desc = "发送方ID",
            lua_desc = "发送方ID",
        },
        [2] = {
            name = "__NICK_NAME__",
            type = "string",
            lua_name = "nick_name",
            lua_type = "string",
            desc = "发送方名称",
            lua_desc = "发送方名称",
        },
        [3] = {
            name = "__team_id",
            type = "integer",
            lua_name = "team_id",
            lua_type = "integer",
            desc = "队伍ID",
            lua_desc = "队伍ID",
        },
    },
}

---@class EventParam.ET_MALL_NOTIFY_ENTER_LOBBY
---@alias EventParam.steam-进入大厅 EventParam.ET_MALL_NOTIFY_ENTER_LOBBY
M.config["steam-进入大厅"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_ENTER_LOBBY",
    name = "steam-进入大厅",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_MALL_NOTIFY_START_MATCH
---@alias EventParam.steam-开始匹配 EventParam.ET_MALL_NOTIFY_START_MATCH
M.config["steam-开始匹配"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_START_MATCH",
    name = "steam-开始匹配",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_MALL_NOTIFY_CANCEL_MATCH
---@alias EventParam.steam-取消匹配 EventParam.ET_MALL_NOTIFY_CANCEL_MATCH
M.config["steam-取消匹配"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_CANCEL_MATCH",
    name = "steam-取消匹配",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_MALL_NOTIFY_ROOM_INFO_CHANGE
---@alias EventParam.steam-本地房间信息变化 EventParam.ET_MALL_NOTIFY_ROOM_INFO_CHANGE
M.config["steam-本地房间信息变化"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_ROOM_INFO_CHANGE",
    name = "steam-本地房间信息变化",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_MALL_NOTIFY_ROOM_INVITE
---@field room_id integer # 房间号
---@field player_aid integer # 邀请人ID
---@field nick_name string # 邀请人名称
---@alias EventParam.steam-被邀请加入房间 EventParam.ET_MALL_NOTIFY_ROOM_INVITE
M.config["steam-被邀请加入房间"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_ROOM_INVITE",
    name = "steam-被邀请加入房间",
    params = {
    },
    event_params = {
        [1] = {
            name = "__room_id",
            type = "integer",
            lua_name = "room_id",
            lua_type = "integer",
            desc = "房间号",
            lua_desc = "房间号",
        },
        [2] = {
            name = "__PLAYER_AID__",
            type = "integer",
            lua_name = "player_aid",
            lua_type = "integer",
            desc = "邀请人ID",
            lua_desc = "邀请人ID",
        },
        [3] = {
            name = "__NICK_NAME__",
            type = "string",
            lua_name = "nick_name",
            lua_type = "string",
            desc = "邀请人名称",
            lua_desc = "邀请人名称",
        },
    },
}

---@class EventParam.ET_MALL_NOTIFY_ROOM_KICK_OFF
---@alias EventParam.steam-被踢出房间 EventParam.ET_MALL_NOTIFY_ROOM_KICK_OFF
M.config["steam-被踢出房间"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_ROOM_KICK_OFF",
    name = "steam-被踢出房间",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_MALL_NOTIFY_ROOM_BUILD
---@alias EventParam.steam-创建房间成功 EventParam.ET_MALL_NOTIFY_ROOM_BUILD
M.config["steam-创建房间成功"] = {
    desc = "",
    key = "ET_MALL_NOTIFY_ROOM_BUILD",
    name = "steam-创建房间成功",
    params = {
    },
    event_params = {
    },
}

---@class EventParam.ET_ON_MLS_SCRIPT_EVENT
---@field player Player # 玩家
---@field mlscript_event_name string # 事件名
---@field mlscript_event_data py.Table # 事件数据一维表
---@alias EventParam.玩家-收到云脚本消息 EventParam.ET_ON_MLS_SCRIPT_EVENT
M.config["玩家-收到云脚本消息"] = {
    desc = "收到云脚本消息时触发",
    from_global = true,
    key = "ET_ON_MLS_SCRIPT_EVENT",
    name = "玩家-收到云脚本消息",
    object = "Player",
    params = {
    },
    event_params = {
        [1] = {
            name = "__role_id",
            type = "py.RoleID",
            lua_name = "player",
            lua_type = "Player",
            desc = "玩家id",
            lua_desc = "玩家",
        },
        [2] = {
            name = "__mlscript_event_name",
            type = "string",
            lua_name = "mlscript_event_name",
            lua_type = "string",
            desc = "事件名",
            lua_desc = "事件名",
        },
        [3] = {
            name = "__mlscript_event_data",
            type = "py.Table",
            lua_name = "mlscript_event_data",
            lua_type = "py.Table",
            desc = "事件数据一维表",
            lua_desc = "事件数据一维表",
        },
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
---@field event fun(self: self, event: "单位-切换默认行为", callback: fun(trg: Trigger, data: EventParam.单位-切换默认行为)): Trigger
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
---@field event fun(self: self, event: "施法-打断完成", callback: fun(trg: Trigger, data: EventParam.施法-打断完成)): Trigger
---@field event fun(self: self, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: self, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: self, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: self, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: self, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: self, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: self, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: self, event: "技能-自定义动画轴", string: string, callback: fun(trg: Trigger, data: EventParam.技能-自定义动画轴)): Trigger
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
---@field event fun(self: self, event: "玩家-点击小地图", key: y3.Const.ClickMiniMapKey|integer, callback: fun(trg: Trigger, data: EventParam.玩家-点击小地图)): Trigger
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
---@field event fun(self: self, event: "steam-本地房间信息变化", callback: fun(trg: Trigger, data: EventParam.steam-本地房间信息变化)): Trigger
---@field event fun(self: self, event: "steam-被邀请加入房间", callback: fun(trg: Trigger, data: EventParam.steam-被邀请加入房间)): Trigger
---@field event fun(self: self, event: "steam-被踢出房间", callback: fun(trg: Trigger, data: EventParam.steam-被踢出房间)): Trigger
---@field event fun(self: self, event: "steam-创建房间成功", callback: fun(trg: Trigger, data: EventParam.steam-创建房间成功)): Trigger
---@field event fun(self: self, event: "云脚本-接收自定义消息", callback: fun(trg: Trigger, data: EventParam.云脚本-接收自定义消息)): Trigger
---@field event fun(self: self, event: "玩家-收到云脚本消息", callback: fun(trg: Trigger, data: EventParam.玩家-收到云脚本消息)): Trigger

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
---@field event fun(self: Ability, event: "施法-打断完成", callback: fun(trg: Trigger, data: EventParam.施法-打断完成)): Trigger
---@field event fun(self: Ability, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: Ability, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: Ability, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: Ability, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: Ability, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: Ability, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: Ability, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: Ability, event: "技能-自定义动画轴", string: string, callback: fun(trg: Trigger, data: EventParam.技能-自定义动画轴)): Trigger
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
---@field event fun(self: Player, event: "玩家-点击小地图", key: y3.Const.ClickMiniMapKey|integer, callback: fun(trg: Trigger, data: EventParam.玩家-点击小地图)): Trigger
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
---@field event fun(self: Player, event: "玩家-收到云脚本消息", callback: fun(trg: Trigger, data: EventParam.玩家-收到云脚本消息)): Trigger

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
---@field event fun(self: Unit, event: "单位-切换默认行为", callback: fun(trg: Trigger, data: EventParam.单位-切换默认行为)): Trigger
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
---@field event fun(self: Unit, event: "施法-打断完成", callback: fun(trg: Trigger, data: EventParam.施法-打断完成)): Trigger
---@field event fun(self: Unit, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: Unit, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: Unit, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: Unit, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: Unit, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: Unit, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: Unit, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: Unit, event: "技能-自定义动画轴", string: string, callback: fun(trg: Trigger, data: EventParam.技能-自定义动画轴)): Trigger
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
---@field event fun(self: EditorObject.Ability, event: "施法-打断完成", callback: fun(trg: Trigger, data: EventParam.施法-打断完成)): Trigger
---@field event fun(self: EditorObject.Ability, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: EditorObject.Ability, event: "技能-自定义动画轴", callback: fun(trg: Trigger, data: EventParam.技能-自定义动画轴)): Trigger
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
---@field event fun(self: EditorObject.Unit, event: "技能-学习", callback: fun(trg: Trigger, data: EventParam.技能-学习)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-可用状态变化", callback: fun(trg: Trigger, data: EventParam.技能-可用状态变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-沉默状态变化", callback: fun(trg: Trigger, data: EventParam.技能-沉默状态变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-名称变化", callback: fun(trg: Trigger, data: EventParam.单位-名称变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-小地图图标变化", callback: fun(trg: Trigger, data: EventParam.单位-小地图图标变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-头像变化", callback: fun(trg: Trigger, data: EventParam.单位-头像变化)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-移除", callback: fun(trg: Trigger, data: EventParam.单位-移除)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-移除后", callback: fun(trg: Trigger, data: EventParam.单位-移除后)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-传送结束", callback: fun(trg: Trigger, data: EventParam.单位-传送结束)): Trigger
---@field event fun(self: EditorObject.Unit, event: "单位-属性变化", callback: fun(trg: Trigger, data: EventParam.单位-属性变化)): Trigger
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
---@field event fun(self: EditorObject.Unit, event: "单位-切换默认行为", callback: fun(trg: Trigger, data: EventParam.单位-切换默认行为)): Trigger
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
---@field event fun(self: EditorObject.Unit, event: "施法-打断完成", callback: fun(trg: Trigger, data: EventParam.施法-打断完成)): Trigger
---@field event fun(self: EditorObject.Unit, event: "施法-停止", callback: fun(trg: Trigger, data: EventParam.施法-停止)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-获得", callback: fun(trg: Trigger, data: EventParam.技能-获得)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-失去", callback: fun(trg: Trigger, data: EventParam.技能-失去)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-交换", callback: fun(trg: Trigger, data: EventParam.技能-交换)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-禁用", callback: fun(trg: Trigger, data: EventParam.技能-禁用)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-启用", callback: fun(trg: Trigger, data: EventParam.技能-启用)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-冷却结束", callback: fun(trg: Trigger, data: EventParam.技能-冷却结束)): Trigger
---@field event fun(self: EditorObject.Unit, event: "技能-自定义动画轴", callback: fun(trg: Trigger, data: EventParam.技能-自定义动画轴)): Trigger
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

-- ============================================================
-- 辅助函数：通过引擎事件 key 查找事件参数
-- ============================================================

---@type table<string, table>
M.key_map = {}

-- 构建 key -> event_params 的映射
for name, cfg in pairs(M.config) do
    if cfg.key and cfg.event_params then
        M.key_map[cfg.key] = cfg.event_params
    end
end

--- 通过引擎事件 key 获取事件参数列表
---@param event_key string 引擎事件 key (如 "ET_GAME_INIT")
---@return table|nil event_params 事件参数列表
function M.get_event_params_by_key(event_key)
    return M.key_map[event_key]
end

return M
