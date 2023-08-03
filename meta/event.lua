-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.Event
local event = {}

---@class EventParam.ET_LOGIC_UNIT_DESTROY

--LOGIC_UNIT_DESTROY
event.ET_LOGIC_UNIT_DESTROY = {}

---@class EventParam.ET_TIMEOUT

--定时器超时
event.ET_TIMEOUT = {}

---@class EventParam.ET_REPEAT_TIMEOUT

--周期性定时器超时
event.ET_REPEAT_TIMEOUT = {}

---@class EventParam.ET_TIMEOUT_BY_FRAME

--经过一定帧数
event.ET_TIMEOUT_BY_FRAME = {}

---@class EventParam.ET_REPEAT_TIMEOUT_BY_FRAME

--周期性经过一定帧数
event.ET_REPEAT_TIMEOUT_BY_FRAME = {}

---@class EventParam.ET_GAME_INIT

--游戏初始化
event.ET_GAME_INIT = {}

---@class EventParam.ET_LOADING_END

--Loading结束
event.ET_LOADING_END = {}

---@class EventParam.ET_RELAUNCH_FRAME_CATCHING_FINISHED

--重启客户端追帧完成
event.ET_RELAUNCH_FRAME_CATCHING_FINISHED = {}

---@class EventParam.ET_RECV_TRIGGER
---@field trigger_id py.TriggerID # 触发器id

--接收触发事件
event.ET_RECV_TRIGGER = {
    [1] = {
        name = "__trigger_id",
        type = "py.TriggerID",
        lua_name = "trigger_id",
        lua_type = "py.TriggerID",
        desc = "触发器id",
        lua_desc = "触发器id",
    },
}

---@class EventParam.ET_GAME_END

--游戏结束
event.ET_GAME_END = {}

---@class EventParam.ET_GAME_PAUSE

--游戏暂停
event.ET_GAME_PAUSE = {}

---@class EventParam.ET_GAME_RESUME

--游戏恢复
event.ET_GAME_RESUME = {}

---@class EventParam.ET_EMPTY

--空事件
event.ET_EMPTY = {}

---@class EventParam.TIMER_TIMEOUT
---@field name string # 计时器名称

--全局计时器超时
event.TIMER_TIMEOUT = {
    [1] = {
        name = "__name",
        type = "string",
        lua_name = "name",
        lua_type = "string",
        desc = "计时器名称",
        lua_desc = "计时器名称",
    },
}

---@class EventParam.ET_DAY_NIGHT_CHANGE
---@field is_day_to_night boolean # 是否是白天转到黑夜

--昼夜发生变化
event.ET_DAY_NIGHT_CHANGE = {
    [1] = {
        name = "__is_day_to_night",
        type = "boolean",
        lua_name = "is_day_to_night",
        lua_type = "boolean",
        desc = "是否是白天转到黑夜",
        lua_desc = "是否是白天转到黑夜",
    },
}

---@class EventParam.ET_CONTAINER_ADDED
---@field name string # 容器名
---@field container py.ActorContainer # 容器

--添加容器
event.ET_CONTAINER_ADDED = {
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
}

---@class EventParam.ET_CONTAINER_ACTOR_ADDED
---@field owner py.Actor # 容器从属actor

--容器中添加actor
event.ET_CONTAINER_ACTOR_ADDED = {
    [1] = {
        name = "__owner",
        type = "py.Actor",
        lua_name = "owner",
        lua_type = "py.Actor",
        desc = "容器从属actor",
        lua_desc = "容器从属actor",
    },
}

---@class EventParam.ET_CONTAINER_ACTOR_REMOVED
---@field owner py.Actor # 原容器从属actor

--容器中删除actor
event.ET_CONTAINER_ACTOR_REMOVED = {
    [1] = {
        name = "__owner",
        type = "py.Actor",
        lua_name = "owner",
        lua_type = "py.Actor",
        desc = "原容器从属actor",
        lua_desc = "原容器从属actor",
    },
}

---@class EventParam.ET_ACTOR_ATTR_UPDATED
---@field name string # 属性名

--actor属性更新
event.ET_ACTOR_ATTR_UPDATED = {
    [1] = {
        name = "__name",
        type = "string",
        lua_name = "name",
        lua_type = "string",
        desc = "属性名",
        lua_desc = "属性名",
    },
}

---@class EventParam.ET_AREA_ENTER
---@field unit Unit # 单位
---@field area Area # 区域
---@field trigger_id py.TriggerID # 触发器ID

--单位进入区域
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
---@field unit Unit # 单位
---@field area Area # 区域
---@field trigger_id py.TriggerID # 触发器ID

--单位离开区域
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
---@field player Player # 玩家
---@field is_middle_join boolean # 是否中途加入

--玩家加入战斗
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
---@field player Player # 玩家

--玩家主动退出游戏
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
---@field player Player # 玩家

--玩家断开服务器连接
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

---@class EventParam.ET_AI_TAKE_CONTROL
---@field player Player # 玩家

--AI接管玩家
event.ET_AI_TAKE_CONTROL = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
}

---@class EventParam.ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK
---@field player Player # 玩家

--下载档案数据回调
event.ET_DOWNLOAD_MAP_ARCHIVE_CALLBACK = {
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
---@field player Player # 玩家
---@field store_key py.StoreKey # 收费道具编号
---@field use_cnt integer # 使用次数

--玩家成功使用收费道具
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

---@class EventParam.ET_CONSUME_STORE_ITEM
---@field player Player # 玩家
---@field store_key py.StoreKey # 收费道具编号

--玩家成功使用收费道具（触发器内）
event.ET_CONSUME_STORE_ITEM = {
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

---@class EventParam.ET_ROLE_HOLD_STORE_ITEM
---@field player Player # 玩家
---@field store_key py.StoreKey # 收费道具编号

--玩家持有收费道具
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
---@field player Player # 玩家
---@field res_key py.RoleResKey # 玩家资源类型
---@field res_value integer # 玩家资源值
---@field res_value_delta number # 玩家资源变量值

--玩家资源变化
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
        lua_type = "number",
        desc = "玩家资源变量值",
        lua_desc = "玩家资源变量值",
    },
}

---@class EventParam.ET_ROLE_INPUT_MSG
---@field player Player # 玩家
---@field msg string # 字符串

--玩家输入字符串
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

---@class EventParam.ET_ROLE_INPUT_ACTIVATION_CODE
---@field player Player # 玩家
---@field activation_code_group string # 激活码组

--玩家输入激活码
event.ET_ROLE_INPUT_ACTIVATION_CODE = {
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
}

---@class EventParam.ET_ROLE_TECH_UPGRADE
---@field player Player # 玩家
---@field tech_no py.TechKey # 科技编号
---@field curr_lv integer # 当前科技等级

--玩家科技升级
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
---@field player Player # 玩家
---@field tech_no py.TechKey # 科技编号
---@field curr_lv integer # 当前科技等级

--玩家科技降级
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
---@field player Player # 玩家
---@field tech_no py.TechKey # 科技编号
---@field curr_lv integer # 当前科技等级
---@field delta_lv integer # 科技变化等级

--玩家科技变化
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
---@field unit Unit # 单位
---@field player Player # 单位所属玩家
---@field tech_no py.TechKey # 科技编号

--单位研发科技
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
---@field unit Unit # 单位
---@field player Player # 单位所属玩家
---@field tech_no py.TechKey # 科技编号

--单位添加科技
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
---@field unit Unit # 单位
---@field player Player # 单位所属玩家
---@field tech_no py.TechKey # 科技编号

--单位删除科技
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

---@class EventParam.ET_ROLE_CHANGE_RELATION
---@field src_player Player # 源玩家
---@field dst_player Player # 目标玩家
---@field relation py.RoleRelation # 关系

--玩家敌对关系变化
event.ET_ROLE_CHANGE_RELATION = {
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
}

---@class EventParam.ET_ABILITY_BUILD_FINISH
---@field ability Ability # 技能
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能ID
---@field ability_seq py.AbilitySeq # 技能Seq
---@field unit Unit # 主人
---@field build_unit Unit # 建造出来的单位

--建筑技能建造成功
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

---@class EventParam.ET_ATTACK_HIT_TARGET
---@field ability_id integer # 技能id

--普通攻击命中
event.ET_ATTACK_HIT_TARGET = {
    [1] = {
        name = "__ability_id",
        type = "integer",
        lua_name = "ability_id",
        lua_type = "integer",
        desc = "技能id",
        lua_desc = "技能id",
    },
}

---@class EventParam.ET_ATTACK_HURT
---@field ability_id integer # 技能id
---@field other_unit Unit # 被伤害的单位

--普通攻击造成伤害
event.ET_ATTACK_HURT = {
    [1] = {
        name = "__ability_id",
        type = "integer",
        lua_name = "ability_id",
        lua_type = "integer",
        desc = "技能id",
        lua_desc = "技能id",
    },
    [2] = {
        name = "__other_unit",
        type = "py.Unit",
        lua_name = "other_unit",
        lua_type = "Unit",
        desc = "被伤害的单位",
        lua_desc = "被伤害的单位",
    },
}

---@class EventParam.ET_ABILITY_CD_CHANGE
---@field ability_index py.AbilityIndex # 技能坑位
---@field left number # cd剩余时间
---@field total number # cd总时长
---@field ability_id py.AbilityKey # 技能id

--技能CD变化
event.ET_ABILITY_CD_CHANGE = {
    [1] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能坑位",
        lua_desc = "技能坑位",
    },
    [2] = {
        name = "__left",
        type = "py.Fixed",
        lua_name = "left",
        lua_type = "number",
        desc = "cd剩余时间",
        lua_desc = "cd剩余时间",
    },
    [3] = {
        name = "__total",
        type = "py.Fixed",
        lua_name = "total",
        lua_type = "number",
        desc = "cd总时长",
        lua_desc = "cd总时长",
    },
    [4] = {
        name = "__ability_id",
        type = "py.AbilityKey",
        lua_name = "ability_id",
        lua_type = "py.AbilityKey",
        desc = "技能id",
        lua_desc = "技能id",
    },
}

---@class EventParam.ET_ACTIVE_ABILITY_CHANGED
---@field ability_index py.AbilityIndex # 技能坑位

--单位获得新技能
event.ET_ACTIVE_ABILITY_CHANGED = {
    [1] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能坑位",
        lua_desc = "技能坑位",
    },
}

---@class EventParam.ET_ABILITY_STACK_CHANGE
---@field ability_index py.AbilityIndex # 技能坑位
---@field stack number # 技能充能层数

--技能充能层数变化
event.ET_ABILITY_STACK_CHANGE = {
    [1] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能坑位",
        lua_desc = "技能坑位",
    },
    [2] = {
        name = "__stack",
        type = "py.Fixed",
        lua_name = "stack",
        lua_type = "number",
        desc = "技能充能层数",
        lua_desc = "技能充能层数",
    },
}

---@class EventParam.ET_ABILITY_PLUS_POINT
---@field ability_index py.AbilityIndex # 技能坑位
---@field ability Ability # 技能对象
---@field unit Unit # 单位

--技能加点
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

---@class EventParam.ET_ABILITY_STACK_CD_CHANGE
---@field ability_index py.AbilityIndex # 技能坑位
---@field left number # 充能cd剩余时间
---@field total number # 充能cd总时长

--充能CD变化
event.ET_ABILITY_STACK_CD_CHANGE = {
    [1] = {
        name = "__ability_index",
        type = "py.AbilityIndex",
        lua_name = "ability_index",
        lua_type = "py.AbilityIndex",
        desc = "技能坑位",
        lua_desc = "技能坑位",
    },
    [2] = {
        name = "__left",
        type = "py.Fixed",
        lua_name = "left",
        lua_type = "number",
        desc = "充能cd剩余时间",
        lua_desc = "充能cd剩余时间",
    },
    [3] = {
        name = "__total",
        type = "py.Fixed",
        lua_name = "total",
        lua_type = "number",
        desc = "充能cd总时长",
        lua_desc = "充能cd总时长",
    },
}

---@class EventParam.ET_ABILITY_FORBIDDEN_CHANGED
---@field ability_index py.AbilityIndex # 技能坑位
---@field is_forbidden boolean # 是否禁用

--技能禁用状态发生变化
event.ET_ABILITY_FORBIDDEN_CHANGED = {
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
}

---@class EventParam.ET_ABILITY_SILENT_CHANGED
---@field is_silent boolean # 是否禁用

--技能的沉默状态发生变化
event.ET_ABILITY_SILENT_CHANGED = {
    [1] = {
        name = "__is_silent",
        type = "boolean",
        lua_name = "is_silent",
        lua_type = "boolean",
        desc = "是否禁用",
        lua_desc = "是否禁用",
    },
}

---@class EventParam.ET_ABILITY_ICON_CHANGED

--技能的图标发生变化
event.ET_ABILITY_ICON_CHANGED = {}

---@class EventParam.ET_UNIT_NAME_CHANGE

--单位的名称发生变化
event.ET_UNIT_NAME_CHANGE = {}

---@class EventParam.ET_UNIT_CHANGE_MINI_MAP_ICON

--单位的小地图图标发生变化
event.ET_UNIT_CHANGE_MINI_MAP_ICON = {}

---@class EventParam.ET_UNIT_ICON_CHANGE
---@field unit Unit # 无描述

--单位头像图标发生变化
event.ET_UNIT_ICON_CHANGE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_ROLE_UNIT_CHANGE
---@field unit Unit # 无描述

--阵营内单位变化
event.ET_ROLE_UNIT_CHANGE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_ROLE_UNIT_TAG_CHANGE
---@field unit Unit # 无描述

--阵营内单位标签变化
event.ET_ROLE_UNIT_TAG_CHANGE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_ENTER_MOVER_STATE
---@field unit Unit # 无描述

--单位进入运动器状态
event.ET_UNIT_ENTER_MOVER_STATE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_START_MOVE
---@field unit Unit # 无描述

--单位开始移动
event.ET_UNIT_START_MOVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_END_MOVE
---@field unit Unit # 无描述

--单位结束移动
event.ET_UNIT_END_MOVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_REMOVE
---@field unit Unit # 无描述

--单位删除（ECA专用）
event.ET_UNIT_REMOVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_DELETE
---@field unit Unit # 无描述

--单位删除（对象真正销毁）
event.ET_UNIT_DELETE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_END_TRANSLATE
---@field unit Unit # 无描述

--单位传送结束
event.ET_UNIT_END_TRANSLATE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_ATTR_CHANGE
---@field unit Unit # 无描述
---@field attr string # 无描述

--单位属性变化
event.ET_UNIT_ATTR_CHANGE = {
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
}

---@class EventParam.ET_BEFORE_UNIT_DIE
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述

--单位即将死亡
event.ET_BEFORE_UNIT_DIE = {
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
}

---@class EventParam.ET_UNIT_DIE
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述

--单位死亡
event.ET_UNIT_DIE = {
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
}

---@class EventParam.ET_UNIT_ON_UNBIND_ROLE
---@field unit Unit # 无描述
---@field player Player # 无描述

--单位解绑玩家
event.ET_UNIT_ON_UNBIND_ROLE = {
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
}

---@class EventParam.ET_UNIT_ON_BIND_ROLE
---@field unit Unit # 无描述
---@field player Player # 无描述

--单位绑定玩家
event.ET_UNIT_ON_BIND_ROLE = {
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
}

---@class EventParam.ET_UNIT_BE_HURT
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例

--单位即将受到攻击
event.ET_UNIT_BE_HURT = {
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
    [7] = {
        name = nil,
        type = nil,
        lua_name = "damage_instance",
        lua_type = "DamageInstance",
        lua_desc = "伤害实例",
        lua_code = function (data)
            local instance = New 'DamageInstance' (data, "伤害前")
            return instance
        end,
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例

--单位即将击中其他单位
event.ET_UNIT_HURT_OTHER = {
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
    [7] = {
        name = nil,
        type = nil,
        lua_name = "damage_instance",
        lua_type = "DamageInstance",
        lua_desc = "伤害实例",
        lua_code = function (data)
            local instance = New 'DamageInstance' (data, "伤害前")
            return instance
        end,
    },
}

---@class EventParam.ET_UNIT_BE_HURT_BEFORE_APPLY
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例

--单位即将受到攻击（计算加成后）
event.ET_UNIT_BE_HURT_BEFORE_APPLY = {
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
    [7] = {
        name = nil,
        type = nil,
        lua_name = "damage_instance",
        lua_type = "DamageInstance",
        lua_desc = "伤害实例",
        lua_code = function (data)
            local instance = New 'DamageInstance' (data, "伤害时")
            return instance
        end,
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER_BEFORE_APPLY
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例

--单位即将击中其他单位（计算加成后）
event.ET_UNIT_HURT_OTHER_BEFORE_APPLY = {
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
    [7] = {
        name = nil,
        type = nil,
        lua_name = "damage_instance",
        lua_type = "DamageInstance",
        lua_desc = "伤害实例",
        lua_code = function (data)
            local instance = New 'DamageInstance' (data, "伤害时")
            return instance
        end,
    },
}

---@class EventParam.ET_UNIT_HURT_OTHER_FINISH
---@field is_critical_hit number # 是否是暴击
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例

--单位实际对其他单位造成伤害
event.ET_UNIT_HURT_OTHER_FINISH = {
    [1] = {
        name = "__is_critical_hit",
        type = "py.Fixed",
        lua_name = "is_critical_hit",
        lua_type = "number",
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
        name = nil,
        type = nil,
        lua_name = "damage_instance",
        lua_type = "DamageInstance",
        lua_desc = "伤害实例",
        lua_code = function (data)
            local instance = New 'DamageInstance' (data, "伤害后")
            return instance
        end,
    },
}

---@class EventParam.ET_UNIT_BE_HURT_COMPLETE
---@field is_critical_hit number # 是否是暴击
---@field is_normal_hit boolean # 是否是普通攻击
---@field damage number # 受到的伤害值
---@field source_unit Unit # 施加伤害的单位
---@field target_unit Unit # 承受伤害的单位
---@field ability Ability # 当前伤害所属技能
---@field damage_type integer # 伤害类型
---@field unit Unit # 无描述
---@field damage_instance DamageInstance # 伤害实例

--单位实际受到伤害
event.ET_UNIT_BE_HURT_COMPLETE = {
    [1] = {
        name = "__is_critical_hit",
        type = "py.Fixed",
        lua_name = "is_critical_hit",
        lua_type = "number",
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
        name = nil,
        type = nil,
        lua_name = "damage_instance",
        lua_type = "DamageInstance",
        lua_desc = "伤害实例",
        lua_code = function (data)
            local instance = New 'DamageInstance' (data, "伤害后")
            return instance
        end,
    },
}

---@class EventParam.ET_UNIT_GET_CURE_BEFORE_APPLY
---@field cured_value number # 受到的治疗值
---@field ability Ability # 当前治疗所属技能

--单位即将受到治疗
event.ET_UNIT_GET_CURE_BEFORE_APPLY = {
    [1] = {
        name = "__cured_value",
        type = "py.Fixed",
        lua_name = "cured_value",
        lua_type = "number",
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
---@field cured_value number # 受到的治疗值
---@field ability Ability # 当前治疗所属技能

--单位受到治疗结束
event.ET_UNIT_GET_CURE_FINISH = {
    [1] = {
        name = "__cured_value",
        type = "py.Fixed",
        lua_name = "cured_value",
        lua_type = "number",
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
---@field cured_value number # 受到的治疗值
---@field ability Ability # 当前治疗所属技能

--单位受到治疗
event.ET_UNIT_GET_CURE = {
    [1] = {
        name = "__cured_value",
        type = "py.Fixed",
        lua_name = "cured_value",
        lua_type = "number",
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

---@class EventParam.ET_RES_ICON_CHANGED
---@field res_key py.RoleResKey # 资源
---@field icon_id integer # ICON ID

--修改玩家属性图标
event.ET_RES_ICON_CHANGED = {
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
}

---@class EventParam.ET_UNIT_RELEASE_ABILITY
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_
---@field ability_target_unit Unit # 技能的目标单位

--单位施放技能事件
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

---@class EventParam.ET_UNIT_RELEASE_ABILITY_START
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_

--单位施放技能开始事件
event.ET_UNIT_RELEASE_ABILITY_START = {
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
}

---@class EventParam.ET_UNIT_RELEASE_ABILITY_END
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_

--单位施放技能结束事件
event.ET_UNIT_RELEASE_ABILITY_END = {
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
}

---@class EventParam.ET_UNIT_RELEASE_MAGIC_BOOK
---@field ability Ability # 施放的技能对象
---@field unit Unit # 触发事件的单位unit_

--单位施放技能事件
event.ET_UNIT_RELEASE_MAGIC_BOOK = {
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
}

---@class EventParam.ET_UNIT_LEVEL_CHANGE

--单位技能变化事件
event.ET_UNIT_LEVEL_CHANGE = {}

---@class EventParam.ET_UNIT_EXP_CHANGE

--单位经验变化事件
event.ET_UNIT_EXP_CHANGE = {}

---@class EventParam.ET_UNIT_PRE_ADD_EXP
---@field unit Unit # 获得经验的单位
---@field add_exp number # 增加的经验

--单位即将获得经验
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
---@field unit Unit # 获得经验的单位
---@field add_exp number # 增加的经验

--单位获得经验
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
---@field unit Unit # 单位
---@field cmd_type py.UnitCommand # 接收的命令
---@field target_unit Unit # 目标单位
---@field point Point # 目标点
---@field destructible Destructible # 目标可破坏物
---@field item Item # 目标物品

--单位接收命令
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
---@field damage number # 伤害值
---@field source_unit Unit # 杀手单位
---@field target_unit Unit # 死亡单位
---@field ability Ability # 致命伤害所属技能
---@field damage_type integer # 致命伤害类型
---@field unit Unit # 无描述

--单位击杀其他单位
event.ET_KILL_UNIT = {
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
}

---@class EventParam.ET_UNIT_BORN
---@field unit Unit # 无描述

--单位出生
event.ET_UNIT_BORN = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_ENTER_BATTLE
---@field unit Unit # 单位

--单位进入战斗状态
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
---@field unit Unit # 单位

--单位脱离战斗状态
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

---@class EventParam.ET_UNIT_CREATE_SLAVE
---@field unit Unit # 仆从

--单位创建仆从
event.ET_UNIT_CREATE_SLAVE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "仆从id",
        lua_desc = "仆从",
    },
}

---@class EventParam.ET_ITEM_ATTACHED_ATTR_CHANGED
---@field item Item # 无描述
---@field attr_key string # 无描述
---@field delta number # 无描述

--物品附加属性变化
event.ET_ITEM_ATTACHED_ATTR_CHANGED = {
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
}

---@class EventParam.ET_UNIT_SHOP_BUY_ITEM
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field cnt integer # 商品数量
---@field item Item # 商品物品

--商品购买
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
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field cnt integer # 商品数量
---@field unit_stuff Unit # 商品单位

--商品购买
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
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field item Item # 道具

--道具出售
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

---@class EventParam.ET_SHOP_ITEM_CHANGED
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field shop_key string # 商品id
---@field curr_stock integer # 当前库存

--商店商品变化
event.ET_SHOP_ITEM_CHANGED = {
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
}

---@class EventParam.ET_SHOP_STOCK_CHANGED
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field shop_key string # 商品id
---@field curr_stock integer # 当前库存

--商品库存变化
event.ET_SHOP_STOCK_CHANGED = {
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
}

---@class EventParam.ET_SHOP_RES_COST_CHANGED
---@field shop_unit Unit # 商店单位
---@field tab_idx integer # 商店分页
---@field shop_key string # 商品id
---@field res_type py.RoleResKey # 资源编号
---@field res_cost integer # 当前售价

--商品售价变化
event.ET_SHOP_RES_COST_CHANGED = {
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
}

---@class EventParam.ET_UNIT_ITEM_COMPOSE
---@field unit Unit # 单位
---@field compose_id py.ItemKey # 道具编号
---@field item_prop Item # 道具

--道具合成事件
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
---@field unit Unit # 购买物品单位
---@field shop_unit Unit # 商店单位
---@field item Item # 物品编号

--商品合成购买
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
---@field unit Unit # 无描述

--单位重生
event.ET_REVIVE_UNIT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UPGRADE_UNIT
---@field unit Unit # 无描述

--单位升级
event.ET_UPGRADE_UNIT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_REACH_MOVE_TARGET_UNIT
---@field unit Unit # 无描述

--单位运动目标达成
event.ET_REACH_MOVE_TARGET_UNIT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_COLLIDE_OBSTACLE_UNIT
---@field unit Unit # 无描述

--单位碰撞到障碍
event.ET_COLLIDE_OBSTACLE_UNIT = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_ENTER_GRASS
---@field unit Unit # 单位

--单位进入草丛
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
---@field unit Unit # 单位

--单位离开草丛
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

---@class EventParam.ET_MAP_VISIBILITY_CHANGE

--地图显隐因触发器发生变化
event.ET_MAP_VISIBILITY_CHANGE = {}

---@class EventParam.ET_UNIT_ROLE_CHANGED
---@field unit Unit # 触发事件的单位
---@field old_player Player # 单位原所属玩家
---@field new_player Player # 单位新所属玩家

--单位所属玩家发生变化
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

---@class EventParam.ET_UNIT_KV_CHANGE
---@field kv_name string # KV名

--单位的kv属性发送变化
event.ET_UNIT_KV_CHANGE = {
    [1] = {
        name = "__kv_name",
        type = "string",
        lua_name = "kv_name",
        lua_type = "string",
        desc = "KV名",
        lua_desc = "KV名",
    },
}

---@class EventParam.ET_UNIT_MUL_KV_CHANGE
---@field kv_name_list py.List # 单位原所属玩家

--单位的多个kv属性发送变化
event.ET_UNIT_MUL_KV_CHANGE = {
    [1] = {
        name = "__kv_name_list",
        type = "py.List",
        lua_name = "kv_name_list",
        lua_type = "py.List",
        desc = "单位原所属玩家",
        lua_desc = "单位原所属玩家",
    },
}

---@class EventParam.ET_UNIT_PRECONDITION_SUCCEED
---@field unit_key py.UnitKey # 单位类型
---@field player Player # 玩家

--单位类型的前置条件满足要求
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
---@field unit_key py.UnitKey # 单位类型
---@field player Player # 玩家

--单位类型的前置条件不满足要求
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
---@field item_no py.ItemKey # 物品类型
---@field player Player # 玩家

--物品类型的前置条件满足要求
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
---@field item_no py.ItemKey # 物品类型
---@field player Player # 玩家

--物品类型的前置条件不满足要求
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
---@field ability_id py.AbilityKey # 技能类型
---@field player Player # 玩家

--技能类型的前置条件满足要求
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
---@field ability_id py.AbilityKey # 技能类型
---@field player Player # 玩家

--技能类型的前置条件不满足要求
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
---@field tech_no py.TechKey # 科技类型
---@field player Player # 玩家

--科技类型的前置条件满足要求
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
---@field tech_no py.TechKey # 科技类型
---@field player Player # 玩家

--科技类型的前置条件不满足要求
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
---@field ability Ability # 技能对象

--技能升级
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
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能开始施法
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_CS_END
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位

--技能开始施法结束
event.ET_ABILITY_CS_END = {
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
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能前摇开始
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_PS_END
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能前摇结束
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ITEM_ABILITY_PS_END
---@field ability Ability # 技能对象

--道具技能前摇结束
event.ET_ITEM_ABILITY_PS_END = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
}

---@class EventParam.ET_ABILITY_SP_END
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能准备结束
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_CST_END
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能持续施法结束
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_BS_END
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能后摇结束
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_CS_INTERRUPT
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位

--技能准备阶段被打断
event.ET_ABILITY_CS_INTERRUPT = {
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
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能前摇阶段被打断
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_SP_INTERRUPT
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能准备阶段被打断
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_CST_INTERRUPT
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能持续施法阶段被打断
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_BS_INTERRUPT
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位

--技能后摇阶段被打断
event.ET_ABILITY_BS_INTERRUPT = {
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
---@field ability Ability # 技能对象
---@field ability_target_unit Unit # 技能目标单位
---@field cast Cast # 施法

--技能结束（无论何种方式）
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
    [3] = {
        name = nil,
        type = nil,
        lua_name = "cast",
        lua_type = "Cast",
        lua_desc = "施法",
        lua_code = function (data)
            local ability = data.ability
            local id = data._py_params['__ability_runtime_id']
            local cast = New 'Cast' (ability, id)
            return cast
        end,
    },
}

---@class EventParam.ET_ABILITY_OBTAIN
---@field ability Ability # 技能对象
---@field unit Unit # 单位

--获得技能
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
---@field ability Ability # 技能对象
---@field unit Unit # 单位

--失去技能
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
---@field ability Ability # 技能对象

--交换技能
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

---@class EventParam.ET_ABILITY_DISABLE
---@field ability Ability # 技能对象

--技能禁用
event.ET_ABILITY_DISABLE = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
}

---@class EventParam.ET_ABILITY_ENABLE
---@field ability Ability # 技能对象

--技能启用
event.ET_ABILITY_ENABLE = {
    [1] = {
        name = "__ability",
        type = "py.Ability",
        lua_name = "ability",
        lua_type = "Ability",
        desc = "技能对象",
        lua_desc = "技能对象",
    },
}

---@class EventParam.ET_ABILITY_ATTR_CHANGED
---@field ability Ability # 技能对象

--技能属性变化
event.ET_ABILITY_ATTR_CHANGED = {
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
---@field ability Ability # 技能对象

--技能冷却事件
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

---@class EventParam.ET_ABILITY_AUTOCAST_CHANGED
---@field ability Ability # 技能对象

--技能自动释放状态变化
event.ET_ABILITY_AUTOCAST_CHANGED = {
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
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者

--获得效果
event.ET_OBTAIN_MODIFIER = {
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
}

---@class EventParam.ET_LOSS_MODIFIER
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者

--失去效果
event.ET_LOSS_MODIFIER = {
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
}

---@class EventParam.ET_MODIFIER_CYCLE_TRIGGER
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者

--循环触发事件
event.ET_MODIFIER_CYCLE_TRIGGER = {
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
}

---@class EventParam.ET_MODIFIER_UPDATE_TIMER

--BUFF更新事件
event.ET_MODIFIER_UPDATE_TIMER = {}

---@class EventParam.ET_MODIFIER_ADDTION
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者

--BUFF叠加事件
event.ET_MODIFIER_ADDTION = {
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
}

---@class EventParam.ET_MODIFIER_LAYER_CHANGE
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field layer_change_values integer # 层数变化值
---@field from_unit Unit # 效果施加者

--效果层数变化事件
event.ET_MODIFIER_LAYER_CHANGE = {
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
}

---@class EventParam.ET_MODIFIER_GET_BEFORE_CREATE
---@field buff Buff # 触发的魔法效果
---@field owner_unit Unit # 效果携带者
---@field from_unit Unit # 效果施加者

--魔法效果即将获得事件
event.ET_MODIFIER_GET_BEFORE_CREATE = {
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
}

---@class EventParam.ET_MODIFIER_BE_COVERED
---@field owner_unit Unit # 效果携带者
---@field old_buff Buff # 已有的魔法效果
---@field new_buff Buff # 新增的魔法效果

--魔法效果被覆盖事件
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
}

---@class EventParam.ET_MODIFIER_ATTR_CHANGE
---@field buff Buff # 魔法效果

--魔法效果属性变化事件
event.ET_MODIFIER_ATTR_CHANGE = {
    [1] = {
        name = "__modifier",
        type = "py.ModifierEntity",
        lua_name = "buff",
        lua_type = "Buff",
        desc = "魔法效果",
        lua_desc = "魔法效果",
    },
}

---@class EventParam.ET_SOURCE_NUMS_CHANGE

--可破坏物资源个数发生变化
event.ET_SOURCE_NUMS_CHANGE = {}

---@class EventParam.ET_NAME_CHANGE

--可破坏物的名称发生变化
event.ET_NAME_CHANGE = {}

---@class EventParam.ET_SOURCE_NAME_CHANGE

--可破坏物资源名称发生变化
event.ET_SOURCE_NAME_CHANGE = {}

---@class EventParam.ET_DEST_DIE
---@field destructible Destructible # 死亡的可破坏物
---@field unit_for_dest Unit # 凶手单位

--可破坏物死亡
event.ET_DEST_DIE = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "死亡的可破坏物",
        lua_desc = "死亡的可破坏物",
    },
    [2] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "凶手单位",
        lua_desc = "凶手单位",
    },
}

---@class EventParam.ET_DEST_SOURCE_DRY
---@field destructible Destructible # 资源枯竭的可破坏物
---@field unit_for_dest Unit # 采集的单位

--可破坏物被采集枯竭
event.ET_DEST_SOURCE_DRY = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "资源枯竭的可破坏物",
        lua_desc = "资源枯竭的可破坏物",
    },
    [2] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "采集的单位",
        lua_desc = "采集的单位",
    },
}

---@class EventParam.ET_DEST_ATTACKED
---@field destructible Destructible # 被攻击的可破坏物
---@field unit_for_dest Unit # 攻击的单位

--可破坏物被攻击
event.ET_DEST_ATTACKED = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "被攻击的可破坏物",
        lua_desc = "被攻击的可破坏物",
    },
    [2] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "攻击的单位",
        lua_desc = "攻击的单位",
    },
}

---@class EventParam.ET_DEST_COLLECTED
---@field destructible Destructible # 被采集的可破坏物
---@field unit_for_dest Unit # 采集的单位

--可破坏物被采集
event.ET_DEST_COLLECTED = {
    [1] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "被采集的可破坏物",
        lua_desc = "被采集的可破坏物",
    },
    [2] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "采集的单位",
        lua_desc = "采集的单位",
    },
}

---@class EventParam.ET_DEST_AREA_DIE
---@field area Area # 可破坏物死亡的区域
---@field destructible Destructible # 死亡的可破坏物
---@field unit_for_dest Unit # 杀手单位

--区域内的可破坏物死亡
event.ET_DEST_AREA_DIE = {
    [1] = {
        name = "__area",
        type = "py.Area",
        lua_name = "area",
        lua_type = "Area",
        desc = "可破坏物死亡的区域",
        lua_desc = "可破坏物死亡的区域",
    },
    [2] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "死亡的可破坏物",
        lua_desc = "死亡的可破坏物",
    },
    [3] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "杀手单位",
        lua_desc = "杀手单位",
    },
}

---@class EventParam.ET_DEST_AREA_DRY
---@field area Area # 可破坏物被采集枯竭的区域
---@field destructible Destructible # 资源枯竭的可破坏物
---@field unit_for_dest Unit # 采集单位

--区域内的可破坏物被采集枯竭
event.ET_DEST_AREA_DRY = {
    [1] = {
        name = "__area",
        type = "py.Area",
        lua_name = "area",
        lua_type = "Area",
        desc = "可破坏物被采集枯竭的区域",
        lua_desc = "可破坏物被采集枯竭的区域",
    },
    [2] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "资源枯竭的可破坏物",
        lua_desc = "资源枯竭的可破坏物",
    },
    [3] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "采集单位",
        lua_desc = "采集单位",
    },
}

---@class EventParam.ET_DEST_AREA_ATTACKED
---@field area Area # 可破坏物被攻击的区域
---@field destructible Destructible # 被攻击的可破坏物
---@field unit_for_dest Unit # 攻击单位

--区域内的可破坏物被攻击
event.ET_DEST_AREA_ATTACKED = {
    [1] = {
        name = "__area",
        type = "py.Area",
        lua_name = "area",
        lua_type = "Area",
        desc = "可破坏物被攻击的区域",
        lua_desc = "可破坏物被攻击的区域",
    },
    [2] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "被攻击的可破坏物",
        lua_desc = "被攻击的可破坏物",
    },
    [3] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "攻击单位",
        lua_desc = "攻击单位",
    },
}

---@class EventParam.ET_DEST_AREA_COLLECTED
---@field area Area # 可破坏物被采集的区域
---@field destructible Destructible # 被采集的可破坏物
---@field unit_for_dest Unit # 采集单位

--区域内的可破坏物被采集
event.ET_DEST_AREA_COLLECTED = {
    [1] = {
        name = "__area",
        type = "py.Area",
        lua_name = "area",
        lua_type = "Area",
        desc = "可破坏物被采集的区域",
        lua_desc = "可破坏物被采集的区域",
    },
    [2] = {
        name = "__destructible_id",
        type = "py.DestructibleID",
        lua_name = "destructible",
        lua_type = "Destructible",
        desc = "被采集的可破坏物",
        lua_desc = "被采集的可破坏物",
    },
    [3] = {
        name = "__unit_for_dest",
        type = "py.Unit",
        lua_name = "unit_for_dest",
        lua_type = "Unit",
        desc = "采集单位",
        lua_desc = "采集单位",
    },
}

---@class EventParam.ET_DEST_CREATE_NEW
---@field destructible Destructible # 可破坏物

--可破坏物创建
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
---@field destructible Destructible # 可破坏物
---@field unit_id_of_dest_killer Unit # 凶手单位ID

--可破坏物死亡
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
---@field destructible Destructible # 可破坏物

--可破坏物复活
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
---@field destructible Destructible # 可破坏物
---@field res_chg_cnt_in_dest_event integer # 可破坏物资源变化量

--可破坏物资源量变化
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
---@field destructible Destructible # 可破坏物
---@field unit_id_in_dest_event Unit # 事件中的单位
---@field ability_in_dest_event Ability # 事件中的技能对象
---@field player_res_cnt_in_event integer # 采集的玩家属性个数

--可破坏物被采集
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
---@field destructible Destructible # 可破坏物
---@field unit_id_of_hurt_dest Unit # 事件中的单位
---@field damage_value_of_hurt_dest number # 受到的伤害

--可破坏物受到伤害
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
        lua_type = "number",
        desc = "受到的伤害",
        lua_desc = "受到的伤害",
    },
}

---@class EventParam.ET_SELECT_DEST
---@field player Player # 玩家
---@field destructible Destructible # 点击到可破坏物

--玩家选中可破坏物
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
---@field destructible Destructible # 触发事件的可破坏物

--删除可破坏物
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

--投射物产生
event.ET_PRODUCE_PROJECTILE = {}

---@class EventParam.ET_DEATH_PROJECTILE

--投射物死亡
event.ET_DEATH_PROJECTILE = {}

---@class EventParam.ET_START_MOVE_PROJECTILE

--投射物运动开始
event.ET_START_MOVE_PROJECTILE = {}

---@class EventParam.ET_REACH_MOVE_TARGET_PROJECTILE

--投射物运动目标达成
event.ET_REACH_MOVE_TARGET_PROJECTILE = {}

---@class EventParam.ET_COLLIDE_OBSTACLE_PROJECTILE
---@field unit Unit # 无描述

--投射物碰撞到障碍
event.ET_COLLIDE_OBSTACLE_PROJECTILE = {
    [1] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
    },
}

---@class EventParam.ET_UNIT_PRODUCE_PROJECTILE

--给单位创建投射物
event.ET_UNIT_PRODUCE_PROJECTILE = {}

---@class EventParam.ET_TRIGGER_COMPONENT_EVENT
---@field player Player # 玩家
---@field ui_event_name string # ui事件变量名
---@field comp_name string # 触发事件控件名称
---@field pos py.Vector2 # 触碰坐标
---@field touch_id integer # 触碰ID

--ui编辑器事件
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

---@class EventParam.ET_GLOBAL_EVENT_TO_UI_WITH_DICT
---@field event_name string # ui事件名
---@field args py.Dict # 参数

--全局触发器发送ui事件
event.ET_GLOBAL_EVENT_TO_UI_WITH_DICT = {
    [1] = {
        name = "__event_name",
        type = "string",
        lua_name = "event_name",
        lua_type = "string",
        desc = "ui事件名",
        lua_desc = "ui事件名",
    },
    [2] = {
        name = "__args",
        type = "py.Dict",
        lua_name = "args",
        lua_type = "py.Dict",
        desc = "参数",
        lua_desc = "参数",
    },
}

---@class EventParam.ET_KEYBOARD_KEY_DOWN_EVENT
---@field player Player # 触发按键的玩家
---@field current_key py.KeyboardKey # 当前键盘按键

--键盘按键按下
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
---@field player Player # 触发按键的玩家
---@field current_key py.KeyboardKey # 当前键盘按键

--键盘按键抬起
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
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标

--鼠标按键按下
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
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标

--鼠标按键抬起
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
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field pointing_world_pos Point # 鼠标指向的世界坐标

--鼠标按键双击
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
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位

--鼠标按键按下单位
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
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位

--鼠标按键抬起单位
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
---@field player Player # 触发按键的玩家
---@field current_key py.MouseKey # 当前鼠标按键
---@field unit Unit # 当前操作的单位

--鼠标按键双击单位
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
---@field player Player # 触发按键的玩家
---@field pointing_world_pos Point # 鼠标指向的世界坐标
---@field tar_x integer # 鼠标指向的屏幕坐标X
---@field tar_y integer # 鼠标指向的屏幕坐标Y

--鼠标移动事件
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
---@field player Player # 触发按键的玩家
---@field mouse_wheel py.MouseWheel # 当前鼠标滚轮

--鼠标滚轮事件
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

---@class EventParam.LOCAL_MOUSE_MOVE_EVENT

--本地鼠标移动事件(勿通过该事件进行逻辑操作)
event.LOCAL_MOUSE_MOVE_EVENT = {}

---@class EventParam.ET_UNIT_EVENT_TO_GLOBAL
---@field event_name string # 事件名
---@field point Point # 点
---@field int1 integer # 整数1
---@field float1 number # 实数1
---@field bool1 boolean # 布尔1
---@field str1 string # 字符串1
---@field unit Unit # 单位

--单位触发器向全局触发器发送事件
event.ET_UNIT_EVENT_TO_GLOBAL = {
    [1] = {
        name = "__event_name",
        type = "string",
        lua_name = "event_name",
        lua_type = "string",
        desc = "事件名",
        lua_desc = "事件名",
    },
    [2] = {
        name = "__point",
        type = "py.Point",
        lua_name = "point",
        lua_type = "Point",
        desc = "点",
        lua_desc = "点",
    },
    [3] = {
        name = "__int1",
        type = "integer",
        lua_name = "int1",
        lua_type = "integer",
        desc = "整数1",
        lua_desc = "整数1",
    },
    [4] = {
        name = "__float1",
        type = "py.Fixed",
        lua_name = "float1",
        lua_type = "number",
        desc = "实数1",
        lua_desc = "实数1",
    },
    [5] = {
        name = "__bool1",
        type = "boolean",
        lua_name = "bool1",
        lua_type = "boolean",
        desc = "布尔1",
        lua_desc = "布尔1",
    },
    [6] = {
        name = "__str1",
        type = "string",
        lua_name = "str1",
        lua_type = "string",
        desc = "字符串1",
        lua_desc = "字符串1",
    },
    [7] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_ABILITY_EVENT_TO_GLOBAL
---@field event_name string # 事件名
---@field point Point # 点
---@field int1 integer # 整数1
---@field float1 number # 实数1
---@field bool1 boolean # 布尔1
---@field str1 string # 字符串1
---@field unit Unit # 单位

--技能触发器向全局触发器发送事件
event.ET_ABILITY_EVENT_TO_GLOBAL = {
    [1] = {
        name = "__event_name",
        type = "string",
        lua_name = "event_name",
        lua_type = "string",
        desc = "事件名",
        lua_desc = "事件名",
    },
    [2] = {
        name = "__point",
        type = "py.Point",
        lua_name = "point",
        lua_type = "Point",
        desc = "点",
        lua_desc = "点",
    },
    [3] = {
        name = "__int1",
        type = "integer",
        lua_name = "int1",
        lua_type = "integer",
        desc = "整数1",
        lua_desc = "整数1",
    },
    [4] = {
        name = "__float1",
        type = "py.Fixed",
        lua_name = "float1",
        lua_type = "number",
        desc = "实数1",
        lua_desc = "实数1",
    },
    [5] = {
        name = "__bool1",
        type = "boolean",
        lua_name = "bool1",
        lua_type = "boolean",
        desc = "布尔1",
        lua_desc = "布尔1",
    },
    [6] = {
        name = "__str1",
        type = "string",
        lua_name = "str1",
        lua_type = "string",
        desc = "字符串1",
        lua_desc = "字符串1",
    },
    [7] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_MODIFIER_EVENT_TO_GLOBAL
---@field event_name string # 事件名
---@field point Point # 点
---@field int1 integer # 整数1
---@field float1 number # 实数1
---@field bool1 boolean # 布尔1
---@field str1 string # 字符串1
---@field unit Unit # 单位

--效果触发器向全局触发器发送事件
event.ET_MODIFIER_EVENT_TO_GLOBAL = {
    [1] = {
        name = "__event_name",
        type = "string",
        lua_name = "event_name",
        lua_type = "string",
        desc = "事件名",
        lua_desc = "事件名",
    },
    [2] = {
        name = "__point",
        type = "py.Point",
        lua_name = "point",
        lua_type = "Point",
        desc = "点",
        lua_desc = "点",
    },
    [3] = {
        name = "__int1",
        type = "integer",
        lua_name = "int1",
        lua_type = "integer",
        desc = "整数1",
        lua_desc = "整数1",
    },
    [4] = {
        name = "__float1",
        type = "py.Fixed",
        lua_name = "float1",
        lua_type = "number",
        desc = "实数1",
        lua_desc = "实数1",
    },
    [5] = {
        name = "__bool1",
        type = "boolean",
        lua_name = "bool1",
        lua_type = "boolean",
        desc = "布尔1",
        lua_desc = "布尔1",
    },
    [6] = {
        name = "__str1",
        type = "string",
        lua_name = "str1",
        lua_type = "string",
        desc = "字符串1",
        lua_desc = "字符串1",
    },
    [7] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_PROJECTILE_EVENT_TO_GLOBAL
---@field event_name string # 事件名
---@field point Point # 点
---@field int1 integer # 整数1
---@field float1 number # 实数1
---@field bool1 boolean # 布尔1
---@field str1 string # 字符串1
---@field unit Unit # 单位

--投射物触发器向全局触发器发送事件
event.ET_PROJECTILE_EVENT_TO_GLOBAL = {
    [1] = {
        name = "__event_name",
        type = "string",
        lua_name = "event_name",
        lua_type = "string",
        desc = "事件名",
        lua_desc = "事件名",
    },
    [2] = {
        name = "__point",
        type = "py.Point",
        lua_name = "point",
        lua_type = "Point",
        desc = "点",
        lua_desc = "点",
    },
    [3] = {
        name = "__int1",
        type = "integer",
        lua_name = "int1",
        lua_type = "integer",
        desc = "整数1",
        lua_desc = "整数1",
    },
    [4] = {
        name = "__float1",
        type = "py.Fixed",
        lua_name = "float1",
        lua_type = "number",
        desc = "实数1",
        lua_desc = "实数1",
    },
    [5] = {
        name = "__bool1",
        type = "boolean",
        lua_name = "bool1",
        lua_type = "boolean",
        desc = "布尔1",
        lua_desc = "布尔1",
    },
    [6] = {
        name = "__str1",
        type = "string",
        lua_name = "str1",
        lua_type = "string",
        desc = "字符串1",
        lua_desc = "字符串1",
    },
    [7] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_ITEM_EVENT_TO_GLOBAL
---@field event_name string # 事件名
---@field point Point # 点
---@field int1 integer # 整数1
---@field float1 number # 实数1
---@field bool1 boolean # 布尔1
---@field str1 string # 字符串1
---@field unit Unit # 单位

--物品触发器向全局触发器发送事件
event.ET_ITEM_EVENT_TO_GLOBAL = {
    [1] = {
        name = "__event_name",
        type = "string",
        lua_name = "event_name",
        lua_type = "string",
        desc = "事件名",
        lua_desc = "事件名",
    },
    [2] = {
        name = "__point",
        type = "py.Point",
        lua_name = "point",
        lua_type = "Point",
        desc = "点",
        lua_desc = "点",
    },
    [3] = {
        name = "__int1",
        type = "integer",
        lua_name = "int1",
        lua_type = "integer",
        desc = "整数1",
        lua_desc = "整数1",
    },
    [4] = {
        name = "__float1",
        type = "py.Fixed",
        lua_name = "float1",
        lua_type = "number",
        desc = "实数1",
        lua_desc = "实数1",
    },
    [5] = {
        name = "__bool1",
        type = "boolean",
        lua_name = "bool1",
        lua_type = "boolean",
        desc = "布尔1",
        lua_desc = "布尔1",
    },
    [6] = {
        name = "__str1",
        type = "string",
        lua_name = "str1",
        lua_type = "string",
        desc = "字符串1",
        lua_desc = "字符串1",
    },
    [7] = {
        name = "__unit_id",
        type = "py.UnitID",
        lua_name = "unit",
        lua_type = "Unit",
        desc = "单位id",
        lua_desc = "单位",
    },
}

---@class EventParam.ET_SELECT_UNIT
---@field player Player # 玩家
---@field unit Unit # 点击到单位

--玩家选中单位
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

---@class EventParam.ET_HIGH_LIGHT_UNIT_CHANGE
---@field player Player # 玩家
---@field high_light_unit_id py.HighLightUnitID # 高亮单位id

--玩家控制的高亮单位
event.ET_HIGH_LIGHT_UNIT_CHANGE = {
    [1] = {
        name = "__role_id",
        type = "py.RoleID",
        lua_name = "player",
        lua_type = "Player",
        desc = "玩家ID",
        lua_desc = "玩家",
    },
    [2] = {
        name = "__high_light_unit_id",
        type = "py.HighLightUnitID",
        lua_name = "high_light_unit_id",
        lua_type = "py.HighLightUnitID",
        desc = "高亮单位id",
        lua_desc = "高亮单位id",
    },
}

---@class EventParam.ET_SELECT_ITEM
---@field player Player # 玩家
---@field item Item # 点击到物品

--玩家选中物品
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
---@field player Player # 玩家
---@field item Item # 双击到物品

--玩家双击选中物品
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

---@class EventParam.ET_OPEN_SHOP_PANEL
---@field player Player # 玩家
---@field unit Unit # 商店单位

--打开商店界面
event.ET_OPEN_SHOP_PANEL = {
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
        desc = "商店单位ID",
        lua_desc = "商店单位",
    },
}

---@class EventParam.ET_DOUBLE_CLICK_DEST
---@field player Player # 玩家
---@field destructible Destructible # 双击到可破坏物

--玩家双击选中可破坏物
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
---@field player Player # 玩家
---@field unit_group_id_list UnitGroup # 框选到单位组id列表
---@field team_id integer # 队伍编号

--玩家选中单位组
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
---@field player Player # 玩家
---@field unit Unit # 释放单位
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能Index
---@field ability_seq py.AbilitySeq # 技能Seq

--打开技能指示器
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
---@field player Player # 玩家
---@field unit Unit # 释放单位
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能Index
---@field ability_seq py.AbilitySeq # 技能Seq

--关闭技能指示器
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

---@class EventParam.ET_RESIZE_SKILL_POINTER
---@field player Player # 玩家
---@field unit Unit # 释放单位
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能Index
---@field ability_seq py.AbilitySeq # 技能Seq

--缩放技能指示器范围圈
event.ET_RESIZE_SKILL_POINTER = {
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

---@class EventParam.ET_SET_ABILITY_SECTOR_RADIUS
---@field ability_seq py.AbilitySeq # 技能Seq

--设置扇形指示器半径
event.ET_SET_ABILITY_SECTOR_RADIUS = {
    [1] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
}

---@class EventParam.ET_SET_ABILITY_SECTOR_ANGLE
---@field ability_seq py.AbilitySeq # 技能Seq

--设置扇形指示器角度
event.ET_SET_ABILITY_SECTOR_ANGLE = {
    [1] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
}

---@class EventParam.ET_SET_ABILITY_ARROW_LENGTH
---@field ability_seq py.AbilitySeq # 技能Seq

--设置箭头/多段指示器长度
event.ET_SET_ABILITY_ARROW_LENGTH = {
    [1] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
}

---@class EventParam.ET_SET_ABILITY_ARROW_WIDTH
---@field ability_seq py.AbilitySeq # 技能Seq

--设置箭头/多段指示器宽度
event.ET_SET_ABILITY_ARROW_WIDTH = {
    [1] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
}

---@class EventParam.ET_SET_ABILITY_CIRCLE_RADIUS
---@field ability_seq py.AbilitySeq # 技能Seq

--设置圆形指示器半径
event.ET_SET_ABILITY_CIRCLE_RADIUS = {
    [1] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
}

---@class EventParam.ET_SET_ABILITY_POINTER_TYPE
---@field ability_seq py.AbilitySeq # 技能Seq
---@field skill_pointer_type py.SkillPointerType # 技能指示器类型

--设置技能指示器类型
event.ET_SET_ABILITY_POINTER_TYPE = {
    [1] = {
        name = "__ability_seq",
        type = "py.AbilitySeq",
        lua_name = "ability_seq",
        lua_type = "py.AbilitySeq",
        desc = "技能Seq",
        lua_desc = "技能Seq",
    },
    [2] = {
        name = "__skill_pointer_type",
        type = "py.SkillPointerType",
        lua_name = "skill_pointer_type",
        lua_type = "py.SkillPointerType",
        desc = "技能指示器类型",
        lua_desc = "技能指示器类型",
    },
}

---@class EventParam.ET_TOUCH_BEGIN
---@field touch_id integer # 触碰(鼠标)id
---@field pos py.Vector2 # 触碰(鼠标)坐标

--触碰（鼠标）开始事件
event.ET_TOUCH_BEGIN = {
    [1] = {
        name = "__touch_id",
        type = "integer",
        lua_name = "touch_id",
        lua_type = "integer",
        desc = "触碰(鼠标)id",
        lua_desc = "触碰(鼠标)id",
    },
    [2] = {
        name = "__pos",
        type = "py.Vector2",
        lua_name = "pos",
        lua_type = "py.Vector2",
        desc = "触碰(鼠标)坐标",
        lua_desc = "触碰(鼠标)坐标",
    },
}

---@class EventParam.ET_TOUCH_MOVE
---@field touch_id integer # 触碰(鼠标)id
---@field pos py.Vector2 # 触碰(鼠标)坐标

--触碰（鼠标）移动事件
event.ET_TOUCH_MOVE = {
    [1] = {
        name = "__touch_id",
        type = "integer",
        lua_name = "touch_id",
        lua_type = "integer",
        desc = "触碰(鼠标)id",
        lua_desc = "触碰(鼠标)id",
    },
    [2] = {
        name = "__pos",
        type = "py.Vector2",
        lua_name = "pos",
        lua_type = "py.Vector2",
        desc = "触碰(鼠标)坐标",
        lua_desc = "触碰(鼠标)坐标",
    },
}

---@class EventParam.ET_TOUCH_END
---@field touch_id integer # 触碰(鼠标)id
---@field pos py.Vector2 # 触碰(鼠标)坐标

--触碰（鼠标）结束事件
event.ET_TOUCH_END = {
    [1] = {
        name = "__touch_id",
        type = "integer",
        lua_name = "touch_id",
        lua_type = "integer",
        desc = "触碰(鼠标)id",
        lua_desc = "触碰(鼠标)id",
    },
    [2] = {
        name = "__pos",
        type = "py.Vector2",
        lua_name = "pos",
        lua_type = "py.Vector2",
        desc = "触碰(鼠标)坐标",
        lua_desc = "触碰(鼠标)坐标",
    },
}

---@class EventParam.ET_TOP_TOUCH_END

--最底层的触摸结束事件
event.ET_TOP_TOUCH_END = {}

---@class EventParam.RANK_LIST_INFO_CHANGE

--排位变更事件
event.RANK_LIST_INFO_CHANGE = {}

---@class EventParam.ET_UNIT_ADD_ITEM
---@field unit Unit # 获得该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位获得物品
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

---@class EventParam.ET_UNIT_ADD_ITEM_FOR_COMPOSE
---@field unit Unit # 获得该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位添加物品用于物品合成事件的判断
event.ET_UNIT_ADD_ITEM_FOR_COMPOSE = {
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

---@class EventParam.ET_UNIT_ADD_ITEM_TO_BAR
---@field unit Unit # 获得该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位获得物品到物品栏
event.ET_UNIT_ADD_ITEM_TO_BAR = {
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
---@field unit Unit # 获得该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位获得物品到背包栏
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

---@class EventParam.ET_UNIT_REMOVE_ITEM
---@field unit Unit # 失去该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位失去物品
event.ET_UNIT_REMOVE_ITEM = {
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
}

---@class EventParam.ET_UNIT_REMOVE_ITEM_FROM_BAR
---@field unit Unit # 失去该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位物品从物品栏离开
event.ET_UNIT_REMOVE_ITEM_FROM_BAR = {
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
}

---@class EventParam.ET_UNIT_REMOVE_ITEM_FROM_PKG
---@field unit Unit # 失去该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位物品从背包栏离开
event.ET_UNIT_REMOVE_ITEM_FROM_PKG = {
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
}

---@class EventParam.ET_UNIT_USE_ITEM
---@field unit Unit # 使用该物品的单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号

--单位使用物品
event.ET_UNIT_USE_ITEM = {
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
}

---@class EventParam.ET_UNIT_USE_ITEM_END
---@field item_no py.ItemKey # 物品编号

--单位使用物品后
event.ET_UNIT_USE_ITEM_END = {
    [1] = {
        name = "__item_no",
        type = "py.ItemKey",
        lua_name = "item_no",
        lua_type = "py.ItemKey",
        desc = "物品编号",
        lua_desc = "物品编号",
    },
}

---@class EventParam.ET_UNIT_START_NAV_EVENT
---@field unit Unit # 单位

--单位开始寻路时
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
---@field unit Unit # 单位

--单位结束寻路时
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

---@class EventParam.ET_UNIT_BAG_REFRESH

--背包刷新
event.ET_UNIT_BAG_REFRESH = {}

---@class EventParam.ET_ITEM_STACK_CHANGED
---@field unit Item # 单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@field delta_cnt integer # 变化值

--物品层数变化
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
---@field unit Item # 单位
---@field item Item # 物品
---@field item_no py.ItemKey # 物品编号
---@field delta_cnt integer # 变化值

--物品充能变化
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
---@field item Item # 被创建的物品

--物品创建
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
---@field item Item # 销毁的物品

--物品销毁
event.ET_ITEM_ON_DESTROY = {
    [1] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "销毁的物品",
        lua_desc = "销毁的物品",
    },
}

---@class EventParam.ET_ITEM_ENTITY_ON_DESTROY
---@field item_unit Item # 物品实体
---@field item Item # 物品

--物品实体销毁
event.ET_ITEM_ENTITY_ON_DESTROY = {
    [1] = {
        name = "__item_unit_id",
        type = "py.ItemID",
        lua_name = "item_unit",
        lua_type = "Item",
        desc = "物品实体id",
        lua_desc = "物品实体",
    },
    [2] = {
        name = "__item_id",
        type = "py.ItemID",
        lua_name = "item",
        lua_type = "Item",
        desc = "物品id",
        lua_desc = "物品",
    },
}

---@class EventParam.ET_ITEM_SOLD
---@field unit Unit # 购买者
---@field unit2 Unit # 贩卖者
---@field item Item # 被售出的物品
---@field buy_unit Unit # 收购物品的单位
---@field shop_unit Unit # 出售物品的单位

--出售物品
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
---@field item Item # 被破坏的物品
---@field unit Unit # 破坏物品的单位

--破坏物品
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

---@class EventParam.ET_ITEM_NAME_CHANGED
---@field item Item # 改变名称的物体
---@field name string # 改变后的名称

--物品名称改变
event.ET_ITEM_NAME_CHANGED = {
    [1] = {
        name = "__item",
        type = "py.Item",
        lua_name = "item",
        lua_type = "Item",
        desc = "改变名称的物体",
        lua_desc = "改变名称的物体",
    },
    [2] = {
        name = "__name",
        type = "string",
        lua_name = "name",
        lua_type = "string",
        desc = "改变后的名称",
        lua_desc = "改变后的名称",
    },
}

---@class EventParam.ET_ITEM_DESC_CHANGED
---@field item Item # 改变描述的物体
---@field name string # 改变后的描述

--破坏物品
event.ET_ITEM_DESC_CHANGED = {
    [1] = {
        name = "__item",
        type = "py.Item",
        lua_name = "item",
        lua_type = "Item",
        desc = "改变描述的物体",
        lua_desc = "改变描述的物体",
    },
    [2] = {
        name = "__name",
        type = "string",
        lua_name = "name",
        lua_type = "string",
        desc = "改变后的描述",
        lua_desc = "改变后的描述",
    },
}

---@class EventParam.ET_ITEM_CREATE_ON_DEST_COLLECTED
---@field item Item # 事件中的物品
---@field destructible Destructible # 事件中的可破坏物
---@field unit Unit # 采集可破坏物事件中的单位
---@field ability Ability # 采集可破坏物的捷能

--物品被采集创建
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

---@class EventParam.ET_ATTACK_MOVE_CMD
---@field unit Unit # 指定单位
---@field tar_x number # 点击位置X坐标
---@field tar_y number # 点击位置Y坐标

--左键A地板
event.ET_ATTACK_MOVE_CMD = {
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
}

---@class EventParam.ET_SELL_ITEM_CMD
---@field shop_unit Unit # 商店单位
---@field item Item # 商品

--出售物品
event.ET_SELL_ITEM_CMD = {
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
}

---@class EventParam.ET_AI_RELEASE_SKILL_CMD
---@field unit Unit # 指定单位
---@field ability_type py.AbilityType # 技能类型
---@field ability_index py.AbilityIndex # 技能Index
---@field ability_seq py.AbilitySeq # 技能SEQ
---@field target_item py.Dict # 释放技能参数

--释放技能
event.ET_AI_RELEASE_SKILL_CMD = {
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
}

---@class EventParam.ET_PATROL_CMD
---@field unit Unit # 指定单位
---@field tar_x number # 点击位置X坐标
---@field tar_y number # 点击位置Y坐标

--巡逻
event.ET_PATROL_CMD = {
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
}

---@class EventParam.ET_MOVE_UNIT_TO_TARGET_CMD
---@field unit Unit # 指定单位
---@field tar_x number # 点击位置X坐标
---@field tar_y number # 点击位置Y坐标

--寻路到位置
event.ET_MOVE_UNIT_TO_TARGET_CMD = {
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
}

---@class EventParam.ET_MOUSE_HOVER_EVENT
---@field player Player # 玩家
---@field unit Unit # 悬浮单位
---@field item Item # 悬浮物品
---@field destructible Destructible # 悬浮可破坏物

--鼠标悬停事件
event.ET_MOUSE_HOVER_EVENT = {
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
}

---@class EventParam.ET_CATCH_FRAME_FINISHED

--追帧结束事件
event.ET_CATCH_FRAME_FINISHED = {}

---@class EventParam.ET_MOVER_INTERRUPT

--运动器打断
event.ET_MOVER_INTERRUPT = {}

---@class EventParam.ET_MOVER_REMOVED

--运动器移除
event.ET_MOVER_REMOVED = {}

---@class EventParam.ET_MOVER_UNIT_COLLISION

--运动器单位碰撞
event.ET_MOVER_UNIT_COLLISION = {}

---@class EventParam.ET_MOVER_UNIT_COLLISION_ENTER

--运动器单位碰撞
event.ET_MOVER_UNIT_COLLISION_ENTER = {}

---@class EventParam.ET_MOVER_UNIT_COLLISION_LEAVE

--运动器单位碰撞结束
event.ET_MOVER_UNIT_COLLISION_LEAVE = {}

---@class EventParam.ET_MOVER_TERRAIN_COLLISION

--运动器地形碰撞
event.ET_MOVER_TERRAIN_COLLISION = {}

---@class EventParam.ET_CHAT_SEND_GM
---@field str1 string # 指令字符串
---@field player Player # 玩家

--聊天中发送指令
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

---@class EventParam.ET_CUSTOM_EVENT
---@field c_param_1 integer # 自定义参数1
---@field c_param_2 integer # 自定义参数2
---@field c_param_3 integer # 自定义参数3
---@field c_param_4 integer # 自定义参数4
---@field c_param_5 integer # 自定义参数5

--触发器自定义事件
event.ET_CUSTOM_EVENT = {
    [1] = {
        name = "__c_param_1",
        type = "integer",
        lua_name = "c_param_1",
        lua_type = "integer",
        desc = "自定义参数1",
        lua_desc = "自定义参数1",
    },
    [2] = {
        name = "__c_param_2",
        type = "integer",
        lua_name = "c_param_2",
        lua_type = "integer",
        desc = "自定义参数2",
        lua_desc = "自定义参数2",
    },
    [3] = {
        name = "__c_param_3",
        type = "integer",
        lua_name = "c_param_3",
        lua_type = "integer",
        desc = "自定义参数3",
        lua_desc = "自定义参数3",
    },
    [4] = {
        name = "__c_param_4",
        type = "integer",
        lua_name = "c_param_4",
        lua_type = "integer",
        desc = "自定义参数4",
        lua_desc = "自定义参数4",
    },
    [5] = {
        name = "__c_param_5",
        type = "integer",
        lua_name = "c_param_5",
        lua_type = "integer",
        desc = "自定义参数5",
        lua_desc = "自定义参数5",
    },
}

---@class EventParam.ET_EVENT_CUSTOM
---@field c_param_1 integer # 事件参数
---@field c_param_dict py.Dict # 自定义参数列表

--自定义事件
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

---@class EventParam.UI_VX_EVENT
---@field ui_vx_handler string # 动销回调句柄
---@field comp_name string # 控件uid
---@field int1 integer # 动效id

--界面控件动效播放事件
event.UI_VX_EVENT = {
    [1] = {
        name = "__ui_vx_handler",
        type = "string",
        lua_name = "ui_vx_handler",
        lua_type = "string",
        desc = "动销回调句柄",
        lua_desc = "动销回调句柄",
    },
    [2] = {
        name = "__comp_name",
        type = "string",
        lua_name = "comp_name",
        lua_type = "string",
        desc = "控件uid",
        lua_desc = "控件uid",
    },
    [3] = {
        name = "__int1",
        type = "integer",
        lua_name = "int1",
        lua_type = "integer",
        desc = "动效id",
        lua_desc = "动效id",
    },
}

---@class EventParam.ET_UI_PREFAB_CREATE_EVENT
---@field player Player # 玩家
---@field ui_prefab string # ui模块id
---@field ui_prefab_ins py.UIPrefabIns # 创建出的实例控件

--界面模块被创建
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
---@field player Player # 玩家
---@field ui_prefab string # ui模块id
---@field ui_prefab_ins py.UIPrefabIns # 销毁的模块实例控件

--界面模块被销毁
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

---@class EventParam.ROLE_INPUT_FIELD_EDIT_MSG
---@field player Player # 玩家
---@field msg string # 字符串

--输入框控件玩家输入
event.ROLE_INPUT_FIELD_EDIT_MSG = {
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

---@class EventParam.ET_MICRO_SPEAK
---@field player Player # 玩家
---@field audio_channel integer # 频道
---@field audio_bool boolean # 是否发言

--语音说话
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
---@field unit Unit # 单位
---@field is_active boolean # 是否开启

--聊天中发送指令
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

---@class EventParam.ET_PHYSICS_ENTITY_ON_CREATE
---@field physics_entity py.PhysicsEntity # 被创建的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件创建
event.ET_PHYSICS_ENTITY_ON_CREATE = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被创建的组件",
        lua_desc = "被创建的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_ACTIVE
---@field physics_entity py.PhysicsEntity # 被激活的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件激活
event.ET_PHYSICS_ENTITY_ON_ACTIVE = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被激活的组件",
        lua_desc = "被激活的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_DEACTIVE
---@field physics_entity py.PhysicsEntity # 被关闭的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件关闭
event.ET_PHYSICS_ENTITY_ON_DEACTIVE = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被关闭的组件",
        lua_desc = "被关闭的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_RUNNING
---@field physics_entity py.PhysicsEntity # 运行的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件运行
event.ET_PHYSICS_ENTITY_ON_RUNNING = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "运行的组件",
        lua_desc = "运行的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_PAUSE
---@field physics_entity py.PhysicsEntity # 被暂停的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件暂停
event.ET_PHYSICS_ENTITY_ON_PAUSE = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被暂停的组件",
        lua_desc = "被暂停的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_RESET
---@field physics_entity py.PhysicsEntity # 被重置的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件重置
event.ET_PHYSICS_ENTITY_ON_RESET = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被重置的组件",
        lua_desc = "被重置的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_DESTROY
---@field physics_entity py.PhysicsEntity # 被销毁的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件销毁
event.ET_PHYSICS_ENTITY_ON_DESTROY = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被销毁的组件",
        lua_desc = "被销毁的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_OBTAIN
---@field physics_entity py.PhysicsEntity # 被获得的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件被获得
event.ET_PHYSICS_ENTITY_ON_OBTAIN = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被获得的组件",
        lua_desc = "被获得的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_USE
---@field physics_entity py.PhysicsEntity # 被使用的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件使用
event.ET_PHYSICS_ENTITY_ON_USE = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被使用的组件",
        lua_desc = "被使用的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_STOP_USE
---@field physics_entity py.PhysicsEntity # 被使用结束的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件使用结束
event.ET_PHYSICS_ENTITY_ON_STOP_USE = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被使用结束的组件",
        lua_desc = "被使用结束的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

---@class EventParam.ET_PHYSICS_ENTITY_ON_LOSE
---@field physics_entity py.PhysicsEntity # 被失去的组件
---@field physics_entity_id py.PhysicsEntityKey # 组件id

--逻辑物理组件失去
event.ET_PHYSICS_ENTITY_ON_LOSE = {
    [1] = {
        name = "__physics_entity",
        type = "py.PhysicsEntity",
        lua_name = "physics_entity",
        lua_type = "py.PhysicsEntity",
        desc = "被失去的组件",
        lua_desc = "被失去的组件",
    },
    [2] = {
        name = "__physics_entity_id",
        type = "py.PhysicsEntityKey",
        lua_name = "physics_entity_id",
        lua_type = "py.PhysicsEntityKey",
        desc = "组件id",
        lua_desc = "组件id",
    },
}

return event
