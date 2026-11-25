---@meta
--- [版本外放门禁说明]
--- v1.1.0 新增接口（MsBase64Encode/Decode、MlLuaErrorCode 全局表、
--- 17 个平台玩家信息查询 MsGetPlayer* 接口）预计于 2026.11.18 后正式外放。
--- 在 2026.11.18 之前运行时无法调用到上述新增接口，业务代码调用前请先用 type(fn) == "function" 判空并提供兼容兜底。

--- 注册云脚本事件, 返回值为事件唯一id(配合 UnRegisterEvent 反注册使用)
--- 下面特殊列出的均为内部事件, 客户端调用eca或者lua接口时不要发送相同名字的云脚本事件
--- 特殊事件的参数含义参考y3开发者文档 https://163.com/y3/docs/guides/FunctionManual/CloudScript

---@note 受限于Lua Language Server功能限制，在使用特化的事件比如_roomloaded时可能会提示两条内容，直接使用第一条既可

---@type fun(event_name: "_roomloaded", callback: fun(event_idx: integer, role_id: integer, event_name: string, player_roleids: integer[])): integer
function RegisterEvent(event_name, callback) end

---@type fun(event_name: "_roomover", callback: fun(event_idx: integer, role_id: integer, event_name: string, reason: string)): integer
function RegisterEvent(event_name, callback) end

---@type fun(event_name: "_playerexit", callback: fun(event_idx: integer, role_id: integer, event_name: string, reason: string)): integer
function RegisterEvent(event_name, callback) end

---@mock_diff mock环境下不会触发
---@type fun(event_name: "_playerleave", callback: fun(event_idx: integer, role_id: integer, event_name: string, reason: string)): integer
function RegisterEvent(event_name, callback) end

---@type fun(event_name: "_playerjoin", callback: fun(event_idx: integer, role_id: integer, event_name: string, data: string)): integer
function RegisterEvent(event_name, callback) end

---@type fun(event_name: "_playerreconnect", callback: fun(event_idx: integer, role_id: integer, event_name: string, reason: string)): integer
function RegisterEvent(event_name, callback) end

---@type fun(event_name: "_item_info_changed", callback: fun(event_idx: integer, role_id: integer, event_name: string, store_id: integer, before_cnt: integer, after_cnt: integer)): integer
function RegisterEvent(event_name, callback) end

---@mock_diff mock环境下不会触发
---@type fun(event_name: "_obtain_item_notify", callback: fun(event_idx: integer, role_id: integer, event_name: string, store_id: integer, before_cnt: integer, after_cnt: integer)): integer
function RegisterEvent(event_name, callback) end

---@type fun(event_name: "_consume_item_notify", callback: fun(event_idx: integer, role_id: integer, event_name: string, store_id: integer, before_cnt: integer, after_cnt: integer)): integer
function RegisterEvent(event_name, callback) end

---@mock_diff 仅mock环境触发，线上不会触发
---@type fun(event_name: "_localmodeloaded", callback: fun(event_idx: integer, role_id: integer, event_name: string)): integer
function RegisterEvent(event_name, callback) end

---- 内部事件结束

---comment 注册自定义云脚本事件回调(role_id: 触发玩家角色id, msg_json_val: 消息json字符串[客户端接口传入的是表, 会自动压成json字符串, 不要放userdata等不可序列化的东西])
---@type fun(event_name: string, callback: fun(event_idx: integer, role_id: integer, event_name: string, msg_json_val: string)): integer
function RegisterEvent(event_name, callback) end

---comment 注销事件
---@param event_idx integer 事件唯一id(RegisterEvent 的返回值)
function UnRegisterEvent(event_idx) end

---comment 尝试消耗道具。返回0仅代表校验通过并已发起扣除请求，实际扣除结果通过 _consume_item_notify / _item_info_changed 事件通知
---@param role_id integer 玩家角色id
---@param item_store_id integer 道具store_id(对应编辑器)
---@param cnt integer 数量
---@return integer err_code 错误码(取值见 MlLuaErrorCode, 0表示成功)
function MsTryConsumeItem(role_id, item_store_id, cnt) end

---comment 获取玩家名字
---@param role_id integer 玩家角色id
---@return string|nil 玩家名字，玩家或房间不存在时返回nil
function MsGetPlayerName(role_id) end

---comment 获取地图等级
---@mock_diff mock环境下恒返回1，不反映真实地图等级
---@param role_id integer 玩家角色id
---@return integer|nil 地图等级，玩家或房间不存在时返回nil
function MsGetPlayerMapLevel(role_id) end

---@class ItemInfo
---@field stack_cnt integer 当前堆叠数量
---@field can_use boolean 是否可使用
---@field expired_time integer 过期时间
---@field max_stack_cnt integer 最大堆叠数量

---comment 获取玩家道具信息
---@param role_id integer 玩家角色id
---@param goods_id integer 道具store_id(对应编辑器)
---@return ItemInfo|nil 道具信息，不存在时返回nil
function MsGetPlayerItem(role_id, goods_id) end

---comment 获取玩家游玩时长（秒）
---@mock_diff mock环境下恒返回0，不代表真实游玩时长
---@param role_id integer 玩家角色id
---@return integer|nil 游玩时长（秒），玩家不存在时返回nil
function MsGetPlayedTime(role_id) end

---comment 获取玩家附加VIP等级
---@mock_diff mock环境下恒返回0，不代表真实VIP等级
---@param role_id integer 玩家角色id
---@return integer|nil 附加VIP等级，玩家不存在时返回nil
function MsGetPlayerPlusVipLevel(role_id) end

---comment 获取玩家地图VIP等级
---@mock_diff mock环境下恒返回0，不代表真实VIP等级
---@param role_id integer 玩家角色id
---@return integer|nil 地图VIP等级，玩家不存在时返回nil
function MsGetPlayerMapVipLevel(role_id) end

---comment 获取玩家游玩次数
---@mock_diff mock环境下恒返回1，不代表真实游玩次数
---@param role_id integer 玩家角色id
---@return integer|nil 游玩次数，玩家不存在时返回nil
function MsGetPlayedCount(role_id) end

---comment 获取玩家是否为荣誉VIP
---@mock_diff mock环境下恒返回false
---@param role_id integer 玩家角色id
---@return boolean|nil 是否为荣誉VIP，玩家不存在时返回nil
function MsGetPlayerIsHonorVip(role_id) end

---comment 获取玩家地图等级排名
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 地图等级排名，玩家不存在时返回nil
function MsGetPlayerMapLevelRank(role_id) end

---comment 获取玩家是否为社区版主
---@mock_diff mock环境下恒返回false
---@param role_id integer 玩家角色id
---@return boolean|nil 是否为社区版主，玩家不存在时返回nil
function MsGetPlayerIsCommunityMaster(role_id) end

---comment 获取玩家社区点赞数
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 社区点赞数，玩家不存在时返回nil
function MsGetPlayerCommunityLikeCount(role_id) end

---comment 获取玩家社区精华帖数量
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 社区精华帖数量，玩家不存在时返回nil
function MsGetPlayerCommunityElitePostCount(role_id) end

---comment 获取玩家社区回复数量
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 社区回复数量，玩家不存在时返回nil
function MsGetPlayerCommunityReplyCount(role_id) end

---comment 获取玩家社区欢乐数
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 社区欢乐数，玩家不存在时返回nil
function MsGetPlayerCommunityJoyCount(role_id) end

---comment 获取玩家是否在社区发过帖
---@mock_diff mock环境下恒返回false
---@param role_id integer 玩家角色id
---@return boolean|nil 是否在社区发过帖，玩家不存在时返回nil
function MsGetPlayerCommunityPosted(role_id) end

---comment 获取玩家社区主题数量
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 社区主题数量，玩家不存在时返回nil
function MsGetPlayerCommunitySubjectCount(role_id) end

---comment 获取玩家累计签到天数
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 累计签到天数，玩家不存在时返回nil
function MsGetPlayerSigninDays(role_id) end

---comment 获取玩家最大连续签到天数
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 最大连续签到天数，玩家不存在时返回nil
function MsGetPlayerSigninMaxConsecutiveDays(role_id) end

---comment 获取玩家当前连续签到天数
---@mock_diff mock环境下恒返回0
---@param role_id integer 玩家角色id
---@return integer|nil 当前连续签到天数，玩家不存在时返回nil
function MsGetPlayerSigninCurConsecutiveDays(role_id) end

---comment 获取玩家是否为当前地图作者
---@mock_diff mock环境下恒返回false
---@param role_id integer 玩家角色id
---@return boolean|nil 是否为地图作者，玩家不存在时返回nil
function MsGetPlayerIsAuthor(role_id) end

---comment 获取玩家是否为回归玩家
---@mock_diff mock环境下恒返回false
---@param role_id integer 玩家角色id
---@return boolean|nil 是否为回归玩家，玩家不存在时返回nil
function MsGetPlayerIsReturningPlayer(role_id) end

---comment 获取玩家是否收藏了当前地图
---@mock_diff mock环境下恒返回false
---@param role_id integer 玩家角色id
---@return boolean|nil 是否收藏了当前地图，玩家不存在时返回nil
function MsGetPlayerIsBookmarkCurrentMap(role_id) end

---comment 获取房间加载完成的时间戳（秒）
---@mock_diff mock环境下游戏未开始时返回0
---@return integer|nil 房间加载完成时间戳（秒），房间不存在时返回nil
function MsGetRoomLoadedTs() end

---comment 获取房间从加载完成到现在的运行时长（秒）
---@mock_diff mock环境下游戏未开始时返回0
---@return integer|nil 运行时长（秒），房间不存在时返回nil
function MsGetRoomGameTime() end

---comment 获取房间当前玩家数量(仅统计真实玩家)
---@return integer|nil 玩家数量，房间不存在时返回nil
function MsGetRoomPlayerCount() end

---comment 获取玩家脚本存档数据
---@param role_id integer 玩家角色id
---@return string|nil 脚本存档字符串，玩家不存在时返回nil
function MsGetScriptArchive(role_id) end

---comment 保存玩家脚本存档数据
---@param role_id integer 玩家角色id
---@param script_save_data string 存档数据字符串（最大1MB）
---@return boolean 是否保存成功，玩家不存在或数据超过1MB时返回false
function MsSaveScriptArchive(role_id, script_save_data) end

---comment 向玩家客户端发送自定义ML事件
---@param role_id integer 玩家角色id
---@param event_name string 事件名（最长32字节）
---@param event_msg string 事件消息内容（最长10KB）
---@return integer err_code 错误码（0表示成功，事件名超长返回4，消息超长返回6）
function MsSendMlEvent(role_id, event_name, event_msg) end

---comment 结束玩家的脚本流程（已废弃，调用无任何效果）
---@param role_id integer 玩家角色id
---@param reason string 结束原因
---@deprecated
function MsEnd(role_id, reason) end

---@class ScriptRunStat
---@field room_cur_max_tick_ms integer 单次tick最大耗时(毫秒)
---@field room_max_tick_ms_limit integer 单次tick耗时上限(毫秒)，超过后脚本被熔断退出
---@field room_cur_tick_expired_count integer tick超时次数
---@field room_tick_expired_limit integer tick超时次数上限，超过后脚本被熔断退出
---@field room_limit_ms_per_tick integer tick超时判定阈值(毫秒)
---@field room_cur_script_memory integer 当前脚本内存(字节)，每5秒统计一次
---@field room_script_memory_limit integer 脚本内存上限(字节)，超过后脚本被熔断退出

---comment 获取脚本运行统计信息
---@mock_diff mock环境下各项上限为固定值，不代表线上配置
---@return ScriptRunStat|nil 运行统计，房间不存在时返回nil
function MsGetScriptRunStat() end

---comment 判断当前是否运行在线上mlroom环境（区别于本地mock调试环境，线上测试服同样返回true）
---@mock_diff mock环境下恒返回false
---@return boolean 是否为线上mlroom环境
function MsIsProdEnv() end

---comment base64编码（RFC 4648 标准字母表，带 = padding，二进制安全）
---@param data string 待编码的字节串，number 会按 Lua 规则转为字符串
---@return string 编码结果
function MsBase64Encode(data) end

---comment base64解码（严格模式：不接受空白/换行、缺失 padding 及 URL-safe 字母表）
---@param data string base64字符串，number 会按 Lua 规则转为字符串
---@return string? data 解码后的字节串，解码失败时为nil
---@return string? err 解码失败时为 "invalid base64 input"
function MsBase64Decode(data) end

---@class cjson
---@field encode fun(val: any):string
---@field decode fun(str: string):any 解析失败时抛 Lua 错误
---@field null lightuserdata json 中的 null，decode 时 null 会被解析为该值，encode 时可用它输出 null
---@field new fun():cjson 创建一个配置独立的 cjson 实例
---@field encode_sparse_array fun(convert?: boolean, ratio?: integer, safe?: integer):boolean, integer, integer 稀疏数组编码配置
---@field encode_max_depth fun(depth?: integer):integer 编码最大嵌套深度
---@field decode_max_depth fun(depth?: integer):integer 解码最大嵌套深度
---@field encode_number_precision fun(precision?: integer):integer 编码浮点数有效位数(1~14)
---@field encode_keep_buffer fun(keep?: boolean):boolean 是否复用编码缓冲区
---@field encode_invalid_numbers fun(setting?: boolean|"null"):boolean|"null" NaN/Inf 的编码方式
---@field decode_invalid_numbers fun(setting?: boolean):boolean 是否允许解码 NaN/Inf

---@class cjson
cjson = {}

-- 日志调用方法类似string.format()
---@class Log
---@field trace fun(format: string, ...)
---@field debug fun(format: string, ...)
---@field info fun(format: string, ...)
---@field warn fun(format: string, ...)
---@field error fun(format: string, ...)
---@field critical fun(format: string, ...)

---@class Log
Log = {}

---@class Timer
---@field new_timer fun(ms: integer, callback : fun(timer_id: integer):boolean):integer 创建定时器，callback 返回true时按相同间隔重复触发，返回false/报错时停止；ms<0时创建失败返回0，ms=0按1ms处理
---@field cancel_timer fun(timer_id: integer):boolean 取消定时器，timer_id不存在时返回false

---@class Timer
Timer = {}

---@class MlLuaErrorCode 错误码（对应 src/mlroom/lua/vm_base.hpp MlLuaErrorCode）
---@field OK integer 操作成功（值=0）
---@field Unknown integer 未知错误（值=1）
---@field RoomNotExist integer 房间不存在（值=2）
---@field PlayerNotExist integer 玩家不存在（值=3）
---@field EventKeyLen integer 事件名超长（值=4）
---@field EventValueLen integer 事件消息超长（值=6）
---@field ItemNotExisted integer 道具不存在（值=12）
---@field ItemNotEnough integer 道具数量不足（值=13）
---@field ItemNotUse integer 道具不可使用（值=14）

---@class MlLuaErrorCode
MlLuaErrorCode = {}

---以下涉及到协程接口，建议开启Lauguage Server的await-in-sync检测
---开启方法: 新建.vscode目录, 目录下新建settings.json，复制内容
---
--- {
---   "Lua.diagnostics.neededFileStatus": {
---     "await-in-sync": "Any"
---   }
--- }
---

---@class RedisClient
local RedisClient = {}

---comment 同步方式获取值(必须在协程里调用, 在主线程直接调用会报错 "cannot call get in main thread with sync signature")
---@async
---@param key string|number
---@return boolean is_success 是否成功
---@return any ret_val 成功时为redis回复值(key不存在时为nil); 失败时为错误信息字符串
function RedisClient:Get(key) end

---comment 异步回调方式获取值(不需要协程), 本次调用立即返回, 结果在之后的逻辑帧通过callback异步通知
---@param key string|number
---@param callback fun(is_success: boolean, ret_val: any) is_success=是否成功, ret_val=成功时为redis回复值, 失败时为错误信息字符串
function RedisClient:Get(key, callback) end

---comment 同步方式写入值(必须在协程里调用, 在主线程直接调用会报错)
---@async
---@param key string|number
---@param val string|number
---@return boolean is_success 是否成功
---@return any ret_val 成功时为redis回复值(正常为"OK"); 失败时为错误信息字符串
function RedisClient:Set(key, val) end

---comment 异步回调方式写入值(不需要协程), 立即返回, 结果通过callback异步通知
---@param key string|number
---@param val string|number
---@param callback fun(is_success: boolean, ret_val: any)
function RedisClient:Set(key, val, callback) end

---comment 同步方式自增(必须在协程里调用, 在主线程直接调用会报错)
---@async
---@param key string|number
---@param increment integer
---@return boolean is_success 是否成功
---@return integer|string ret_val 成功时为自增后的值; 失败时为错误信息字符串
function RedisClient:IncrBy(key, increment) end

---comment 异步回调方式自增(不需要协程), 立即返回, 结果通过callback异步通知
---@param key string|number
---@param increment integer
---@param callback fun(is_success: boolean, ret_val: integer|string)
function RedisClient:IncrBy(key, increment, callback) end

---@class Redis
---@field get_redis_client fun(): RedisClient|nil 获取redis客户端，未初始化时返回nil

---@class Redis
redis = {}
