---
name: y3-cloud-script
description: >
  Y3 云脚本（cloud_script）开发与排错。Use when working on cloud_script/,
  RegisterEvent or Ms* APIs, MsGetScriptArchive player archives,
  redis.get_redis_client map archives, send_mlscript_msg / 玩家-收到云脚本消息
  dual-end messaging, or local MockMls logs.
---

# Y3 云脚本（`cloud_script`）

云脚本运行在独立的**云脚本服务进程**（Lua 5.4 VM），与客户端地图脚本进程完全隔离，负责服务端权威逻辑、商城道具核销、玩家脚本存档与地图全局存档（Redis）。

## 1. 环境隔离与加载边界

- **目录位置**：将 `cloud_script/` 放在 **Y3 项目根目录**（与 `maps/`、可选的 `global_script/` 同级）。根目录只保留唯一入口 `main.lua`（仅按依赖顺序执行 `require`）和类型提示 `meta.lua`（`---@meta` 文件，仅作静态检查，切勿在运行时 `require`）。
- **版本控制与打包卫生**：将本地运行产物 `dump/`、`mls_archive/`、`mls_log/`、`script_log/` 加入 `.gitignore` / `svn:ignore`，并在发布打包时排除。
- **模块搜索边界**：使用 `require 'subdir.mod'` 加载模块（不带 `.lua` 后缀，区分大小写）。`package.path` 仅搜索 `cloud_script/` 内部（`?.lua` 与 `lua/?.lua`），无法向上读取 `maps/` 或 `global_script/`。若云脚本需要读取配表，由导表工具额外导出一份纯 Lua 表到 `cloud_script/excel/`。
- **可用全局与标准库**：
  - 提供 `RegisterEvent`、`UnRegisterEvent`、`Ms*`、`redis`、`Log`、`Timer` 与预注册的全局 `cjson`（也可 `require("cjson")`；切勿在业务里写 `cjson = {}`、`Log = {}`、`Timer = {}` 覆盖宿主注入对象）。
  - `os` 库仅保留 `clock`、`date`、`difftime`、`time`（线上无 `getenv`、`execute` 等）。
  - 动态加载源码使用 `load(src, name, 't')`（Lua 5.4 无 `loadstring`）。云端 VM 浮点格式与桌面 `lua54.exe` 不同，**云端只 `load` 文本源码 `'t'`**；若用 `string.dump(fn)` 产出字节码下发客户端执行，需将所有常量写在 `fn` 函数体内部（`string.dump` 不保留 upvalue 值）。

## 2. 双端通信契约与工作流（客户端 ↔ 云脚本）

```text
[客户端 Lua（maps/<地图>/script/ 或 global_script/）]
  y3.game.send_mlscript_msg("EventName", { k = "v" })   -- 直接传 Lua 表（仅数字/布尔/字符串/嵌套表）
        ↓
[云脚本 cloud_script/]
  RegisterEvent("EventName", function(event_idx, role_id, event_name, evalue)
      local ok, req = pcall(json.decode, evalue)        -- evalue 是 JSON 字符串（上限 10 KB）
      local code = MsSendMlEvent(role_id, "ReplyName", json.encode({ ok = true }))
  end)
        ↓
[客户端 Lua]
  y3.game:event("玩家-收到云脚本消息", function(trg, data)
      -- data.player: 目标 Player；data.mlscript_event_name: 事件名；data.mlscript_event_data: py.Table
  end)
```

- **权威玩家标识**：
  - **`role_id`**（回调第 2 参数）：局内玩家槽位 ID。处理请求始终以回调参数 `role_id` 为准，忽略客户端在 JSON 里自报的玩家 ID。房间级事件（`_roomloaded` / `_localmodeloaded` / `_roomover`）中 `role_id` 为 `-1`。
  - **`plat_aid`**：跨局稳定的**账号级唯一 ID**，仅从 `_playerjoin` 第 4 参数 JSON 字符串 `{"plat_aid":"<ID>"}` 解析获取。
  - **`player_roleids`**（旧称 `player_guids`）：`_roomloaded` 第 4 参数，本局局内玩家 `role_id` 序列，类型为 `userdata`（非 table），使用 `ipairs(player_roleids)` 遍历，转存为普通 Lua 数组后再参与 `json.encode`。
- **客户端收包三大准则**：
  1. **直接按字段读取**：`data.mlscript_event_data` 已被引擎解码为 `py.Table`，直接写 `data.mlscript_event_data.xxx`（无需 `json.decode`，也不要用 `type(x) == "table"` 判断）。
  2. **按目标玩家过滤**：`MsSendMlEvent(role_id, ...)` 会**广播给房间内所有客户端**，仅针对单人的消息在客户端先判 `data.player`。
  3. **同步帧上下文**：`'玩家-收到云脚本消息'` 回调运行在**同步帧**——可直接执行全局同步逻辑（造单位/发奖/改属性），无需套 `y3.sync.send`；同步遍历表一律用 `y3.util.sortPairs`；若需创建挂在**单位挂点**上的本地场景 UI，先用 `y3.ltimer.wait_frame(1, ...)` 切回本机帧再创建。
- **客户端发包防重**：按玩家发起的上行请求在本地输入上下文（或校验本机玩家后）调用 `send_mlscript_msg`；若在同步事件回调中无过滤裸调，房间内每个客户端都会发出一份重复请求。
- **跨端二进制数据一律 Base64 编码**：
  - 上行含非法 UTF-8 字节（如加密密文中的 `0xFF`）会被底层静默丢弃；
  - 下行 `MsSendMlEvent` 字符串一旦含内嵌 `\0`，虽返回 `0` 但客户端收不到，且会**卡死该房间后续所有上行消息处理**。
  - 任何非纯文本字节流（AES 密文、压缩包、`string.dump` 字节码）跨越客户端↔云脚本边界前，必须先编码为 Base64 ASCII 字符串。

## 3. API 返回值判定与存储铁律

Lua 中 **`0` 与 `""` 均为真值（truthy）**，必须按接口类别精确判定返回值：

| 接口类别 | 代表 API | 成功判据与硬性约束 |
|---|---|---|
| 玩家 / 房间查询 | `MsGetPlayerName` / `MsGetPlayerMapLevel` / `MsGetPlayedTime` / `MsGetPlayedCount` / `MsGetPlayerItem` / `MsGetRoom*` | **`ret ~= nil`**（房间/玩家不存在或 `role_id` 越界返回 `nil`） |
| 玩家脚本存档读 | `MsGetScriptArchive(role_id)` | 返回 `string \| nil`（**首次无存档返回空字符串 `""`，房间/玩家不存在返回 `nil`**）。最早在 **`_playerjoin`** 触发后读取；若非空但 `pcall(json.decode, raw)` 失败，**保留原档并中止写档**，严禁用默认空档覆盖 |
| 玩家脚本存档写 | `MsSaveScriptArchive(role_id, str)` | 返回 **`boolean`**（上限 1 MB = 1,048,576 字节；同房间内保存成功后立即 `MsGetScriptArchive` 即可读到新值；退出房间约 3 秒或房间结束时落库） |
| 下行消息 / 道具扣减 | `MsSendMlEvent` / `MsTryConsumeItem` | **`code == 0`**（下行 `event_name` > 32 字节返 `4`，`event_msg` > 10,240 字节返 `6`） |
| 环境判断 | `MsIsProdEnv()` | 返回 **`boolean`**（**线上 `mlroom` 环境［含本地多开连接的线上测试服与正式服］均返回 `true`，仅本地 MockMls 返回 `false`**） |
| 地图全局存档（Redis） | `client:Get` / `Set` / `IncrBy` | 先判第 1 返回值 **`ok == true`**，再校验第 2 返回值（`Set` 正常为 `"OK"`，`IncrBy` 正常为 `number`；若 Redis 报协议错误则 `ok == true` 但第 2 返回值为错误字符串） |

- **存档与消息的 `cjson` 稀疏数组准则**：
  - 默认配置下，Lua 表含非连续数字键且 **`最大数字键 > 数组长度 + 10`**（如 `unlocked = { [37] = true }`）时，`cjson.encode` 直接抛 `Cannot serialise table: excessively sparse array` 导致写档失败。
  - **所有以 ID / 槽位 / 类型为键的映射表，一律用 `tostring(id)` 字符串键存储，读档后保持字符串键不转回数字**。
- **商城道具异步扣减准则**：
  - `MsTryConsumeItem(role_id, store_id, cnt)` 返回 `0` 仅代表扣减请求已提交，**当前回调内立刻调 `MsGetPlayerItem` 查到的仍是旧数量**。
  - 必须在 `_consume_item_notify` 或 `_item_info_changed` 回调中根据 `before_cnt` / `after_cnt` 确认实际扣减生效后再执行发奖与写档。
- **Redis 协程与类型约束**：
  - 省略 `callback` 的同步调用（`local ok, val = client:Get(key)`）标记了 `@async`，**必须包裹在 `coroutine.create` + `coroutine.resume` 内执行**（主线程直接调用会报错）。建议在 `.vscode/settings.json` 配置 `"Lua.diagnostics.neededFileStatus": { "await-in-sync": "Any" }` 开启静态拦截。
  - `key` 与 `value` 仅接受 `string|number`；不支持 `Del`（重置请用 `Set(key, 初始值)`）；单条 `IncrBy` 跨房间原子，多步读写无事务保证。
- **定时器参数约束**：
  - `Timer.new_timer(ms, callback)` 的 `ms` 必须传入**整数毫秒**（`>= 1`，传浮点数会报参数错误且不创建）；`callback` 返回 `true` 继续下一轮，返回 `false` 停止。
  - `Log.*(format, ...)` 底层无条件走 `string.format`，打印含 `%` 的动态字符串（如 JSON、玩家昵称）时请用 `Log.info("%s", text)`，避免直接单参传入触发格式化报错。
  - `MsEnd(role_id, reason)` 已废弃，切勿调用。

## 4. `v1.1.0` 新增接口与外放门禁（预计 2026.11.18 后外放）

> **版本门禁警告（重要）**：以下 `v1.1.0` 新增 API 与运行时特性**预计在 2026.11.18 后才会正式外放**。在 **2026.11.18 之前**（或面对未更新的客户端/开发助手环境），运行时**无法直接调用到这些新增接口**（对应全局变量为 `nil`）。在此日期前编写代码时，**必须先做存在性判断并提供降级兜底**！
> （注：`MsGetScriptRunStat()`、`Log.*(format, ...)` 变参格式化与 `cjson.null / new / encode_sparse_array` 早已在线上与本地运行时中导出，只是在 `v1.1.0` 才补齐到 `meta.lua` 类型提示中，可直接调用。）

| `v1.1.0` 新增能力（预计 2026.11.18 后外放） | 用途与签名 | 2026.11.18 前兼容兜底写法 |
|---|---|---|
| `MsBase64Encode(data)` / `MsBase64Decode(data)` | 内置 SIMD Base64 编解码（RFC 4648 标准字母表，支持内嵌 `\0`；解码失败返 `nil, "invalid base64 input"`） | 先判 `if type(MsBase64Encode) == "function" then`，否则回退到 `cloud_script/util/base64.lua` 纯 Lua 实现 |
| `MlLuaErrorCode` 全局错误码表 | 运行时全局导出 `{ OK=0, Unknown=1, RoomNotExist=2, PlayerNotExist=3, EventKeyLen=4, EventValueLen=6, ItemNotExisted=12, ItemNotEnough=13, ItemNotUse=14 }` | 用 `(type(MlLuaErrorCode) == "table" and MlLuaErrorCode.OK) or 0` 或直接比对整数常量 |
| 17 个平台玩家信息查询 API | VIP（`MsGetPlayerPlusVipLevel` / `MapVipLevel` / `IsHonorVip`）、排名（`MsGetPlayerMapLevelRank`）、社区（`IsCommunityMaster` / `CommunityLikeCount` / `ElitePostCount` / `ReplyCount` / `JoyCount` / `Posted` / `SubjectCount`）、签到（`SigninDays` / `SigninMaxConsecutiveDays` / `SigninCurConsecutiveDays`）、身份（`IsAuthor` / `IsReturningPlayer` / `IsBookmarkCurrentMap`） | 调用前先判 `type(MsGetPlayerXxx) == "function"`，未外放或本地 Mock 下按默认值（`0` / `false`）处理 |
| `RedisClient:Get/Set` 二进制 `\0` 安全 | `RedisClient:Get/Set` 改为按长度读取字符串，支持内嵌 `\0` | 2026.11.18 前避免在 Redis key/value 中直接存裸 `\0`，二进制数据先做 Base64 编码 |

## 5. 运行配额、本地 Mock 差异与调试排错

- **线上硬性配额（超限直接触发 `_roomover` 终止房间）**：
  - **单房间内存**：上限 **50 MB**（Lua VM GC 内存，超限报 `UnsafeMemory`）。
  - **单次回调指令数**：上限 **10,000,000 条** Lua 字节码指令（`main.lua` 启动阶段同样受限；大批量循环需分块 ≤ 1000 次/批）。
  - **单 Tick 耗时**：单次 tick 达 **5000 ms**，或单次超 **500 ms** 累计达 **10 次**（超限报 `UnsafeCostTime` / `UnsafeTimeout`）。
  - **线上日志限流**：每房间每秒最多 **100 条**（含 `Log.*` 与 `print`，超出丢弃），单条最多 **2048 字节**（超出按字节截断为 `...`）。
- **本地模拟服务（MockMls）vs 线上环境**：
  - **启动时机判据**：本地 `MockMls` 由 Y3 开发助手随游戏进程拉起，**待地图资源加载完毕、客户端 Lua 开始执行时才同步启动**。排查服务是否启动时，先确认客户端 Lua 已在运行，再看 `cloud_script/mls_log/` 与 `script_log/` 是否有新增日志（切勿按进程启动秒数盲判）。
  - **日志转发差异**：本地调试时 **`Log.info` 会转发到客户端日志（`[mlscript]: ...`），但 `Log.warn` 和 `Log.error` 不会转发到客户端**，只会写入 `cloud_script/script_log/mls_local_mls_<日期>.txt`。排查报错或警告时必须直接读取 `script_log/`。
  - **存储持久性差异**：本地玩家存档持久化在 `cloud_script/mls_archive/<plat_aid>.json`（`saved_at` + `script_data_b64`）；**本地 Mock 的 Redis 仅存于当前进程内存，重启游戏即清空**（线上测试服 Redis 1 天未访问过期，正式服永不过期）。
  - **模块热改缓存**：同一局内修改已加载的云脚本文件，需先执行 `package.loaded['mod'] = nil` 再 `require` 才会重读磁盘。

## 6. 按需加载参考文档（Context Pointers）

- **初始化或更新 `cloud_script/meta.lua`、查阅全部 `Ms*` / `RedisClient` / `cjson` 完整类型签名** → 读取 [`references/meta.lua`](references/meta.lua)。
- **编写环境门禁（`env.lua`）、Base64 兼容封装（`base64.lua`）、房间与玩家名册（`room_registry.lua`）、双向请求-响应 RPC（`rpc.lua`）、GM `plat_aid` 白名单鉴权与 `DebugEval` 探针、或复制存档/Redis/道具扣减代码模板** → 读取 [`references/patterns.md`](references/patterns.md)。
- **从官方《云脚本参考项目》迁移文件、查看快速开始与官方任务教程** → 读取 [`references/setup-and-tasks.md`](references/setup-and-tasks.md)。
- **查阅 22 个玩家查询 API 表、`ScriptRunStat`、`MlLuaErrorCode`、系统事件详情、运行配额表与 LuaDebug 断点调试步骤** → 读取 [`references/api-and-quotas.md`](references/api-and-quotas.md)。
