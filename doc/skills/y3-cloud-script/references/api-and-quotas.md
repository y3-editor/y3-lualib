# 云脚本 API 参考、运行配额与调试排错

> **版本外放门禁说明**：`v1.1.0` 新增接口（`MsBase64Encode`、`MsBase64Decode`、`MlLuaErrorCode` 全局表、17 个平台玩家信息查询 API）**预计 2026.11.18 后正式外放**，在此日期前运行时无法调用（对应全局变量为 `nil`），调用前需先用 `type(fn) == "function"` 判空并做兼容兜底。

## 1. 事件系统

调用形式：`local event_idx = RegisterEvent(event_name, callback)`；移除监听：`UnRegisterEvent(event_idx)`。回调公共参数依次为 `event_idx, role_id, event_name`，后接附加参数：

| 事件 | 用途与触发说明 | 附加参数 |
|---|---|---|
| `_roomloaded` | 房间加载完成 | `player_roleids`（旧称 `player_guids`）：本局局内玩家 ID 序列（`userdata`，用 `ipairs` 遍历）；`role_id` 为 `-1` |
| `_roomover` | 房间结束；`role_id` 固定为 `-1` | `reason: string`：如 `UnsafeMemory`、`UnsafeCostTime`、`UnsafeTimeout`、`DeleteRoom` |
| `_playerexit` | 玩家退出房间（主动退出、断线满 3 分钟、被服务端踢出） | `reason: string`：`CLIENT_GIVE_UP`、`CONNECTION_LOST`、`kick by server` |
| `_playerleave` | 玩家断线时触发，早于同一次断线的 `_playerexit`（本地 Mock 不触发） | `reason: string`：固定为 `player disconnect` |
| `_playerreconnect` | 断线玩家重连回本局时触发（只清除断线状态，不撤销已发生的退出） | `reason: string`：固定为 `player reconnect` |
| `_playerjoin` | 玩家存档加载完成、该玩家的云脚本数据可用时触发 | JSON 字符串 `{"plat_aid":"<用户唯一 ID>"}` |
| `_item_info_changed` | 道具信息变化；扣减或购买生效后触发 | `store_id, before_cnt, after_cnt`（均为 `integer`） |
| `_obtain_item_notify` | 获得道具通知；玩家购买道具时触发（本地 Mock 不触发） | `store_id, before_cnt, after_cnt`（均为 `integer`） |
| `_consume_item_notify` | 消耗道具通知；扣减生效后触发 | `store_id, before_cnt, after_cnt`（均为 `integer`） |
| `_localmodeloaded` | 本地模拟服务的房间加载（仅本地 Mock 触发）；`role_id` 为 `-1` | 无 |
| 业务自定义名称 | 接收客户端上行消息 | `evalue: string`，单条上限为 `10 KB` |

## 2. 玩家查询（含 `v1.1.0` 新增 17 个平台信息接口）

`role_id` 均为 `integer`；参数个数不为 `1` 或非整数时抛 Lua 参数错误；玩家不存在、`role_id < 0` 或超出 `uint32` 范围时返回 `nil`：

| 接口与调用形式 | 用途 | 返回值 | 注意事项（本地模拟服务默认值） |
|---|---|---|---|
| `MsGetPlayerName(role_id)` | 查询玩家名字 | `string \| nil` | 玩家或房间不存在时返回 `nil` |
| `MsGetPlayerMapLevel(role_id)` | 查询地图等级 | `integer \| nil` | 本地模拟服务固定为 `1` |
| `MsGetPlayerMapLevelRank(role_id)` | 查询地图等级排名（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayedTime(role_id)` | 查询游玩时长（秒，64 位整数） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayedCount(role_id)` | 查询游玩次数 | `integer \| nil` | 本地模拟服务固定为 `1` |
| `MsGetPlayerPlusVipLevel(role_id)` | 查询附加 VIP 等级（2026.11.18 后外放） | `integer \| nil` | 平台未下发或本地模拟服务固定为 `0` |
| `MsGetPlayerMapVipLevel(role_id)` | 查询地图 VIP 等级（2026.11.18 后外放） | `integer \| nil` | 平台未下发或本地模拟服务固定为 `0` |
| `MsGetPlayerIsHonorVip(role_id)` | 查询是否为荣誉 VIP（2026.11.18 后外放） | `boolean \| nil` | 本地模拟服务固定为 `false` |
| `MsGetPlayerIsCommunityMaster(role_id)` | 查询是否为社区版主（2026.11.18 后外放） | `boolean \| nil` | 本地模拟服务固定为 `false` |
| `MsGetPlayerCommunityLikeCount(role_id)` | 查询社区点赞数（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerCommunityElitePostCount(role_id)` | 查询社区精华帖数量（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerCommunityReplyCount(role_id)` | 查询社区回复数量（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerCommunityJoyCount(role_id)` | 查询社区欢乐数（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerCommunityPosted(role_id)` | 查询是否在社区发过帖（2026.11.18 后外放） | `boolean \| nil` | 本地模拟服务固定为 `false` |
| `MsGetPlayerCommunitySubjectCount(role_id)` | 查询社区主题数量（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerSigninDays(role_id)` | 查询累计签到天数（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerSigninMaxConsecutiveDays(role_id)` | 查询最大连续签到天数（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerSigninCurConsecutiveDays(role_id)` | 查询当前连续签到天数（2026.11.18 后外放） | `integer \| nil` | 本地模拟服务固定为 `0` |
| `MsGetPlayerIsAuthor(role_id)` | 查询是否为当前地图作者（2026.11.18 后外放） | `boolean \| nil` | 本地模拟服务固定为 `false` |
| `MsGetPlayerIsReturningPlayer(role_id)` | 查询是否为回归玩家（2026.11.18 后外放） | `boolean \| nil` | 本地模拟服务固定为 `false` |
| `MsGetPlayerIsBookmarkCurrentMap(role_id)` | 查询是否收藏了当前地图（2026.11.18 后外放） | `boolean \| nil` | 本地模拟服务固定为 `false` |
| `MsGetPlayerItem(role_id, goods_id)` | 查询指定商城道具信息 | `ItemInfo \| nil` | `{ stack_cnt: integer, can_use: boolean, expired_time: integer, max_stack_cnt: integer }`（无过期为 `-1`） |

## 3. 存档、道具消耗、房间统计与错误码

### 玩家脚本存档与道具消耗

- `MsGetScriptArchive(role_id)` → `string | nil`（首次无存档返回空字符串 `""`，房间或玩家不存在返回 `nil`）
- `MsSaveScriptArchive(role_id, script_save_data)` → `boolean`（上限 1 MB = `1,048,576` 字节）
- `MsTryConsumeItem(role_id, item_store_id, cnt)` → 返回 `MlLuaErrorCode` 整数错误码，`0` 表示校验通过并已发起异步扣除请求，实际扣除结果通过 `_item_info_changed` / `_consume_item_notify` 带出。

### `MlLuaErrorCode`（全局表导出预计 2026.11.18 后外放）

| 错误码名称 | 值 | 含义 |
|---|---|---|
| `OK` | `0` | 操作成功 |
| `Unknown` | `1` | 未知错误 |
| `RoomNotExist` | `2` | 房间不存在 |
| `PlayerNotExist` | `3` | 玩家不存在 |
| `EventKeyLen` | `4` | 事件名超长（`MsSendMlEvent` 超过 32 字节） |
| `EventValueLen` | `6` | 事件消息超长（`MsSendMlEvent` 超过 10,240 字节） |
| `ItemNotExisted` | `12` | 道具不存在 |
| `ItemNotEnough` | `13` | 道具数量不足 |
| `ItemNotUse` | `14` | 道具不可使用 |

### 房间信息与运行统计

| 接口与调用形式 | 返回值 | 单位与说明 |
|---|---|---|
| `MsGetRoomLoadedTs()` | `integer \| nil` | 房间加载完成的时间戳（秒）；mock 环境未开始时返回 `0` |
| `MsGetRoomGameTime()` | `integer \| nil` | 房间从加载完成到现在的运行时长（秒）；mock 环境未开始时返回 `0` |
| `MsGetRoomPlayerCount()` | `integer \| nil` | 当前真实玩家数量 |
| `MsGetScriptRunStat()` | `ScriptRunStat \| nil` | 当前房间脚本运行耗时与内存统计（房间不存在时返回 `nil`） |
| `MsIsProdEnv()` | `boolean` | 判断当前是否运行在线上 `mlroom` 环境（线上测试服与正式服均为 `true`，本地 mock 为 `false`） |

`ScriptRunStat` 字段：
- `room_cur_max_tick_ms` / `room_max_tick_ms_limit`：单次 tick 最大耗时（毫秒）及上限
- `room_cur_tick_expired_count` / `room_tick_expired_limit`：tick 超时次数及上限
- `room_limit_ms_per_tick`：tick 超时判定阈值（毫秒）
- `room_cur_script_memory` / `room_script_memory_limit`：当前脚本内存（字节，每 5 秒统计一次）及上限

## 4. Base64、JSON、Redis、日志与定时器

- **`MsBase64Encode(data)` / `MsBase64Decode(data)`（预计 2026.11.18 后外放）**：
  - `MsBase64Encode(data)`：RFC 4648 标准字母表，带 `=` padding，二进制安全（支持内嵌 `\0`）。
  - `MsBase64Decode(data)`：严格模式（不接受空白/换行、缺失 padding 及 URL-safe 字母表），成功返回 `string`，失败返回 `nil, "invalid base64 input"`。
- **`cjson`**：通过 `local json = require("cjson")`（或直接使用预注册的全局 `cjson`）获取，提供 `encode`、`decode`、`null`（`lightuserdata`）、`new()`、`encode_sparse_array(convert, ratio, safe)`、`encode_max_depth`、`decode_max_depth`、`encode_number_precision` 等。
- **`redis.get_redis_client()`**：
  - `client:Get(key, callback)` / `client:Set(key, value, callback)` / `client:IncrBy(key, increment, callback)`。
  - `key` 和 `value` 仅接受 `string|number`（`v1.1.0` 起支持内嵌 `\0`），传入其他类型直接抛 Lua 参数错误。
  - 回调或协程接收 `(ok, res)`：连接失败为 `(false, err_str)`，协议错误为 `(true, err_str)`，正常响应为 `(true, result)`。协程外省略 `callback` 会报错。
- **`Log`**：`Log.trace/debug/info/warn/error/critical(format, ...)`（底层走 `string.format`，打印含 `%` 的动态文本请写 `Log.info("%s", text)`）。
- **`Timer`**：`Timer.new_timer(ms, callback)`（`ms` 为整数毫秒，`>= 1`；回调返 `true` 继续，`false` 停止）；`Timer.cancel_timer(timer_id)` 返回 `boolean`。

## 5. 运行限制、配额与 LuaDebug 断点调试

| 项目 | 限制与规则 |
|---|---|
| 单房间内存 | `50 MB`（`52,428,800` 字节，按 Lua VM GC 内存统计），tick 结束后检查，超限结束房间 |
| 单次回调与单 Tick 时长 | 单次事件回调上限 `10,000,000` 条 Lua 字节码指令；单次 tick 达 `5000 ms` 或超 `500 ms` 累计 `10` 次则结束房间 |
| 消息大小 | 上行单条 `10 KB`（`10,240` 字节）；下行 `event_name` 最长 `32` 字节（超限返 `4`），`event_msg` 最长 `10,240` 字节（超限返 `6`） |
| 玩家脚本存档 | 单份 `1 MB`（`1,048,576` 字节）；退出房间约 3 秒或房间结束时保存；房间运行期每 60 秒自动续期在线 Redis 锁，数据库落库带 `save_ts` 时间戳校验防止旧存档覆盖新存档 |
| 地图全局存档（Redis） | 正式环境不设过期；线上测试环境（本地多开）1 天未访问后过期；无删除接口，重置用 `Set(key, 初始值)` |
| 日志限制（仅线上生效） | 每房间每秒合计 `100` 条（超出丢弃）；单条最多 `2048` 字节（超出截断为 `...`） |

### 使用 LuaDebug 设置断点（仅限编辑器内启动或独立进程单开）

1. 在 Y3 开发助手中关闭“多开模式”（本地多开连接线上环境，不能启用 LuaDebug）。
2. 打开 VS Code 左侧“Y3 开发助手 -> 附加调试器”，勾选“启动后附加本地云脚本”。
3. 在已加载的云脚本模块中设置断点，点击“启动游戏”，确认出现 `Y3 Local Cloud Script` 调试会话后触发事件。
