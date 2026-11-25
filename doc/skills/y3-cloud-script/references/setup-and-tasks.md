# 云脚本新项目初始化、目录结构与快速开始

你可以下载配套示例项目（`https://kk3.nosdn.127.net/y3docs/guides/FunctionManual/云脚本参考项目0916.zip`），建议用本地多开连接线上测试环境验证完整能力。

## 1. 新项目初始化与文件迁移

新建 Y3 项目默认没有 `cloud_script/`、云脚本入口和 `meta.lua`。该目录位于项目根目录，与 `maps/`、`global_script/` 同级，切勿放到 `maps/<地图名>/script/` 下。

### 建立目录并迁移基础文件

| 示例项目路径 | 新项目路径 | 必需性 | 用途与迁移说明 |
|---|---|---|---|
| `cloud_script/main.lua` | `cloud_script/main.lua` | 必需 | 云脚本唯一入口。保留基础 `require`，删除示例测试模块的加载行，再加入自己的业务模块 |
| `cloud_script/meta.lua` | `cloud_script/meta.lua` | 推荐 | 为 `RegisterEvent`、`Ms*`、`redis`、`Log`、`Timer` 等提供 Lua 类型提示；运行时不要 `require("meta")` |
| `cloud_script/com_api.lua` | `cloud_script/com_api.lua` | 按需 | 示例通用字符串工具。只有业务模块仍然 `require("com_api")` 时才复制 |
| `cloud_script/ms_api.lua` | `cloud_script/ms_api.lua` | 按需 | `LogInfo`、`LogWarn`、`LogClient` 等测试辅助封装。正式业务若不需要应删除对应 `require`；`LogClient` 上线前应移除或禁用 |
| `cloud_script/dao/*.lua` | `cloud_script/dao/*.lua` | 按需 | 示例的玩家/房间数据对象。复制后要改成自己的数据模型 |
| `cloud_script/testcase/*.lua` | `cloud_script/testcase/*.lua` | 测试专用 | 仅在复现示例或跑测试时复制；生产入口不要加载测试模块 |
| `cloud_script/game_entry.lua` | 不迁移 | 不需要 | 历史兼容文件，不会被云脚本服务自动加载 |
| `dump/`、`mls_archive/`、`mls_log/`、`script_log/` | 不迁移 | 不需要 | 运行或测试产生的文件，不是初始化依赖，不应作为模板复制 |

`require` 的模块根目录是 `cloud_script/`，不写 `.lua` 后缀：`cloud_script/dao/player.lua` 写成 `require("dao.player")`。路径区分大小写，应与实际文件名一致。

### 接上客户端入口并验证

1. 确认 `cloud_script/main.lua` 存在，且每个 `require` 都能在 `cloud_script/` 下找到对应文件。
2. 用 Y3 开发助手启动本地模拟服务，先不要开启多开模式。
3. 在云脚本日志中确认入口和自定义事件监听器已加载，再从客户端发送一次测试事件。

## 2. `cloud_script` 文件夹结构

```text
<项目根目录>/
├── cloud_script/                         # 云脚本服务目录，与 maps/ 同级
│   ├── main.lua                          # 必需：唯一云脚本入口
│   ├── meta.lua                          # 推荐：IDE 类型提示，不作为运行模块
│   ├── <业务模块>.lua                    # 按需：自定义业务模块
│   ├── dao/                              # 按需：数据访问或领域对象
│   ├── testcase/                         # 测试专用，不要从生产入口加载
│   ├── dump/                             # 产物：调试转储，不迁移
│   ├── mls_archive/                      # 产物：本地存档测试数据，不迁移
│   ├── mls_log/                          # 产物：云脚本服务日志，不迁移
│   └── script_log/                       # 产物：脚本日志，不迁移
├── maps/<地图名>/script/main.lua         # 客户端入口，与云脚本分开
└── global_script/                        # 可选：全局脚本，不属于云脚本服务
```

## 3. 快速开始（双端最小示例）

### 云脚本代码（`cloud_script/tutorial_hello.lua`）

```lua
local json = require("cjson")

RegisterEvent("GuideHello", function(event_idx, role_id, event_name, evalue)
    local ok, request = pcall(json.decode, evalue)
    if not ok or type(request) ~= "table" then
        Log.warn("GuideHello: invalid JSON object")
        return
    end
    local response = json.encode({
        msg = "Hello from cloud",
        client_msg = tostring(request.msg or ""),
    })
    local code = MsSendMlEvent(role_id, "GuideHelloReply", response)
    if code ~= 0 then
        Log.warn("GuideHello: send failed, code=" .. tostring(code))
        return
    end
    Log.info("GuideHello: reply submitted, role=" .. tostring(role_id))
end)

Log.info("GuideHello: listener ready")
-- 在 cloud_script/main.lua 中添加：require("tutorial_hello")
```

### 客户端代码（`maps/EntryMap/script/main.lua` 或 `global_script/`）

```lua
y3.game:event("玩家-收到云脚本消息", function(trg, data)
    if data.mlscript_event_name ~= "GuideHelloReply" then return end
    local response = data.mlscript_event_data
    if response == nil then return end
    print(tostring(response.msg))
end)

y3.game:event("键盘-按下", "SPACE", function()
    y3.game.send_mlscript_msg("GuideHello", { msg = "Hello from client" })
end)
```

### 用 ECA 发送与接收（可选）

- **发送请求**：调用动作【游戏 - 发送云脚本自定义消息】，事件名填 `GuideHello`，表类型数据含字符串字段 `msg`。
- **接收回复**：创建事件【游戏 - 收到云脚本自定义消息】，当【云脚本事件名】等于 `GuideHelloReply` 时，从【云脚本数据表】读取字符串字段 `msg`。

## 4. 核心概念速览

### 玩家标识来源

| 标识 | 来源 | 含义与常见用途 |
|---|---|---|
| `role_id` | 玩家相关事件或自定义事件的回调参数 | 局内玩家 ID，在对局开始时按槽位分配，一局内保持不变，但不保证连续；可直接传给 `MsGetPlayer*`、`MsGetScriptArchive`、`MsSendMlEvent` 等接口 |
| `plat_aid` | `_playerjoin` 事件附加参数中的 JSON 字符串 `{"plat_aid":"<用户唯一 ID>"}` | 用户唯一 ID，跨对局保持稳定 |
| `data.player:get_id()` | 客户端事件参数中的 `Player` 对象 | 客户端侧读取的局内玩家 ID，数值等于云脚本回调里的 `role_id`，只用于客户端过滤和自检 |
| `player_roleids` | `_roomloaded` 事件的附加参数 | 本局局内玩家 ID 序列（`userdata`），用于房间加载完成时遍历本局玩家 |

### 两类存档如何选择

| 存档类型 | 作用范围 | 适用数据 | 主要接口 |
|---|---|---|---|
| 玩家脚本存档 | 单个玩家在当前地图下的数据 | 个人统计、解锁记录、个人进度 | `MsGetScriptArchive`、`MsSaveScriptArchive` |
| 地图全局存档 | 当前地图跨房间共享的数据 | 全服计数、全图共享配置、公共统计 | `redis.get_redis_client()` 的 `Get`、`Set`、`IncrBy` |
