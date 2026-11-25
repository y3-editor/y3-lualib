# Y3 云脚本通用工程模式与代码模板

> **版本兼容提示**：`v1.1.0` 新增接口（`MsBase64Encode/Decode`、`MlLuaErrorCode`、17 个新增 `MsGetPlayer*` 平台接口）**预计 2026.11.18 后才会外放**，此前环境无法调用。本文件中的模板均内置了存在性判断与向后兼容兜底。

## 1. 环境判定与 Base64 兼容封装（`core/env.lua` & `util/base64.lua`）

### 1.1 环境判定（`core/env.lua`）

`MsIsProdEnv()` 判断当前是否运行在**线上 `mlroom` 环境**（线上测试服［本地多开］与正式服均返回 `true`，仅本地 MockMls 返回 `false`）。接口异常或不存在时按线上环境处理（fail-closed）：

```lua
-- cloud_script/core/env.lua
local M = {}

function M.isOnline()
    if type(MsIsProdEnv) ~= 'function' then return true end
    local ok, res = pcall(MsIsProdEnv)
    return (not ok) or (res == true)
end

function M.isLocalMock()
    return not M.isOnline()
end

return M
```

### 1.2 Base64 编解码（优先内置 `MsBase64*` + 纯 Lua 兼容兜底）

`MsBase64Encode` / `MsBase64Decode` 预计 **2026.11.18 后外放**。在 `util/base64.lua` 中优先检测并调用内置 SIMD 实现，未外放时自动回退到纯 Lua 实现：

```lua
-- cloud_script/util/base64.lua
local M = {}
local B64_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local DEC_MAP = {}
for i = 1, #B64_CHARS do DEC_MAP[string.byte(B64_CHARS, i)] = i - 1 end

local function lua_encode(data)
    local out = {}
    for i = 1, #data, 3 do
        local b1, b2, b3 = string.byte(data, i, i + 2)
        local n = (b1 << 16) + ((b2 or 0) << 8) + (b3 or 0)
        local c1, c2, c3, c4 = (n >> 18) & 63, (n >> 12) & 63, (n >> 6) & 63, n & 63
        out[#out + 1] = string.sub(B64_CHARS, c1 + 1, c1 + 1)
        out[#out + 1] = string.sub(B64_CHARS, c2 + 1, c2 + 1)
        out[#out + 1] = b2 and string.sub(B64_CHARS, c3 + 1, c3 + 1) or '='
        out[#out + 1] = b3 and string.sub(B64_CHARS, c4 + 1, c4 + 1) or '='
    end
    return table.concat(out)
end

local function lua_decode(b64)
    if type(b64) ~= 'string' or (#b64 % 4) ~= 0 then return nil, 'invalid base64 input' end
    local out = {}
    for i = 1, #b64, 4 do
        local c1, c2, c3, c4 = string.byte(b64, i, i + 3)
        local v1, v2 = DEC_MAP[c1], DEC_MAP[c2]
        local v3 = (c3 == 61) and 0 or DEC_MAP[c3]
        local v4 = (c4 == 61) and 0 or DEC_MAP[c4]
        if not v1 or not v2 or not v3 or not v4 then return nil, 'invalid base64 input' end
        local n = (v1 << 18) | (v2 << 12) | (v3 << 6) | v4
        out[#out + 1] = string.char((n >> 16) & 255)
        if c3 ~= 61 then out[#out + 1] = string.char((n >> 8) & 255) end
        if c4 ~= 61 then out[#out + 1] = string.char(n & 255) end
    end
    return table.concat(out)
end

function M.encode(data)
    if type(MsBase64Encode) == 'function' then return MsBase64Encode(data) end
    return lua_encode(tostring(data))
end

function M.decode(b64)
    if type(MsBase64Decode) == 'function' then return MsBase64Decode(b64) end
    return lua_decode(b64)
end

return M
```

## 2. 本局房间与玩家名册（`core/room_registry.lua`）

同时订阅 `_roomloaded`、`_localmodeloaded` 与 `_playerjoin`，兼容本地 MockMls 不下发 `_roomloaded` 的情况，并维护 `role_id <-> plat_aid` 映射：

```lua
-- cloud_script/core/room_registry.lua
local json = require 'cjson'
local M = {}
local roleIds, aidByRole, nameByRole = {}, {}, {}

local function hasRole(role_id)
    for _, id in ipairs(roleIds) do
        if id == role_id then return true end
    end
    return false
end

function M.onRoomLoaded(player_roleids)
    roleIds, aidByRole, nameByRole = {}, {}, {}
    if player_roleids ~= nil then
        for _, role_id in ipairs(player_roleids) do
            if type(role_id) == 'number' and role_id >= 0 then
                roleIds[#roleIds + 1] = role_id
            end
        end
    end
    Log.info('room_registry: players=[' .. table.concat(roleIds, ',') .. ']')
end

function M.onPlayerJoin(role_id, payload)
    if type(role_id) ~= 'number' or role_id < 0 then return end
    if not hasRole(role_id) then roleIds[#roleIds + 1] = role_id end
    local ok, data = pcall(json.decode, payload)
    if not ok or type(data) ~= 'table' or data.plat_aid == nil then
        Log.warn('room_registry: invalid _playerjoin payload role=' .. tostring(role_id))
        return
    end
    aidByRole[role_id] = tonumber(data.plat_aid) or data.plat_aid
    Log.info('room_registry: join role=' .. tostring(role_id) .. ' aid=' .. tostring(aidByRole[role_id]))
end

function M.getRoles() return roleIds end
function M.getAid(role_id) return aidByRole[role_id] end
function M.getName(role_id)
    if nameByRole[role_id] == nil then nameByRole[role_id] = MsGetPlayerName(role_id) end
    return nameByRole[role_id]
end

function M.isComplete()
    if #roleIds == 0 then return false end
    for _, role_id in ipairs(roleIds) do
        if aidByRole[role_id] == nil then return false end
    end
    return true
end

return M
```

## 3. 双端请求-响应 RPC 封装（`core/rpc.lua`）

- 在 payload 中携带自增序号 `seq` 与方法名 `method`，响应端原样带回 `seq`；
- 客户端接收时同时校验 **`事件名 + data.player:get_id() == 本机玩家 ID + seq`** 三重条件，并配超时清理。

```lua
-- cloud_script/core/rpc.lua
local json = require 'cjson'
local M = {}
local REQ_EVENT, RESP_EVENT = 'RpcReq', 'RpcResp'
local OK_CODE = (type(MlLuaErrorCode) == 'table' and MlLuaErrorCode.OK) or 0
local handlers = {}

function M.register(method, fn) handlers[method] = fn end

RegisterEvent(REQ_EVENT, function(_, role_id, _, evalue)
    local ok, pkt = pcall(json.decode, evalue)
    if not ok or type(pkt) ~= 'table' or type(pkt.method) ~= 'string' then return end
    local fn = handlers[pkt.method]
    if not fn then return end
    local call_ok, result, err = pcall(fn, role_id, pkt.params or {})
    local resp = { seq = pkt.seq, method = pkt.method }
    if not call_ok then
        Log.error('rpc: handler error method=' .. pkt.method .. ' err=' .. tostring(result))
        resp.error = { code = -500, message = 'internal_error' }
    elseif err ~= nil then
        resp.error = err
    else
        resp.result = result
    end
    local enc_ok, body = pcall(json.encode, resp)
    if enc_ok then MsSendMlEvent(role_id, RESP_EVENT, body) end
end)

return M
```

## 4. GM 鉴权与动态调试探针（`core/gm.lua` + `dev/debug_eval.lua`）

1. **统一前缀**：所有特权指令统一使用 `GM.` 前缀（如 `GM.AddItem`、`GM.DebugEval`），普通业务协议不使用 `GM.` 前缀。
2. **权威身份**：本地 MockMls 环境（`env.isLocalMock()`）默认放行；线上环境（`MsIsProdEnv() == true`）仅按 `_playerjoin` 记录的**账号级 `plat_aid` 白名单**放行。
3. **前置拦截**：每个 GM handler 第一行先调 `if not gm.isAuthorized(role_id) then return nil, { code = -403, message = 'forbidden' } end`。

```lua
-- cloud_script/dev/debug_eval.lua
local gm = require 'core.gm'
local rpc = require 'core.rpc'
local json = require 'cjson'

rpc.register('GM.DebugEval', function(role_id, params)
    if not gm.isAuthorized(role_id) then return nil, { code = -12, message = 'eval_disabled' } end
    local code = type(params) == 'table' and params.code or nil
    if type(code) ~= 'string' or #code == 0 or #code > 4096 then
        return nil, { code = -1, message = 'invalid_code' }
    end
    local fn, load_err = load(code, '=(debug_eval)', 't')
    if not fn then return { ok = false, stage = 'load', error = tostring(load_err) } end
    local res = { pcall(fn) }
    if not res[1] then return { ok = false, stage = 'run', error = tostring(res[2]) } end
    local values = {}
    for i = 2, math.min(#res, 5) do
        local v = res[i]
        local ok, s = (type(v) == 'table') and pcall(json.encode, v) or false, nil
        values[#values + 1] = (type(v) == 'table' and ok) and s or tostring(v)
    end
    Log.info('[DebugEval] ok: ' .. table.concat(values, ', '))
    return { ok = true, values = values }
end)
```

## 5. 基础任务模板（玩家存档 / Redis / 道具扣减 / 定时器）

```lua
-- 5.1 安全读写玩家脚本存档（映射表字段统一用 tostring(id) 作为 key）
local json = require("cjson")
if type(json.encode_sparse_array) == "function" then json.encode_sparse_array(true) end

local function load_player_archive(role_id)
    local raw = MsGetScriptArchive(role_id)
    if raw == nil then return nil, "player_unavailable" end
    if raw == "" then
        return { schema_version = 1, visits = 0, unlocked = {} }, nil
    end
    local ok, decoded = pcall(json.decode, raw)
    if not ok or type(decoded) ~= "table" then return nil, "decode_failed" end
    if decoded.schema_version ~= 1 then return nil, "unsupported_schema" end
    return decoded, nil
end

local function save_player_archive(role_id, archive)
    local ok, encoded = pcall(json.encode, archive)
    if not ok or #encoded > 1048576 then return false end
    return MsSaveScriptArchive(role_id, encoded)
end

-- 5.2 Redis 协程写法（省略 callback 时必须包裹在 coroutine 内）
RegisterEvent("GuideRedisCo", function()
    local co = coroutine.create(function()
        local client = redis.get_redis_client()
        if client == nil then return end
        local set_ok, set_res = client:Set("game:counter:v1", 100)
        if not set_ok or set_res ~= "OK" then return end
        local get_ok, get_val = client:Get("game:counter:v1")
        if get_ok then Log.info("GuideRedisCo: val=" .. tostring(get_val)) end
    end)
    coroutine.resume(co)
end)

-- 5.3 商城道具预检与异步扣减（在 _consume_item_notify 回调中确认生效后再发奖）
local OK = (type(MlLuaErrorCode) == "table" and MlLuaErrorCode.OK) or 0
local function try_consume_item(role_id, item_id, count)
    if type(count) ~= "number" or count <= 0 or count % 1 ~= 0 then return false, "invalid_count" end
    local item = MsGetPlayerItem(role_id, item_id)
    if item == nil or not item.can_use or item.stack_cnt < count then return false, "not_available" end
    local code = MsTryConsumeItem(role_id, item_id, count)
    return code == OK, code
end
```
