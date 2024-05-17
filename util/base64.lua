    ---@diagnostic disable-next-line: undefined-global
local y3_crypto = y3_crypto

---@class BASE64
local M = {}

--将字符串编码为base64
---@param str string
---@return string
function M.encode(str)
    return y3_crypto.base64_encode(str, #str)
end

--将base64解码为字符串
---@param base64 string
---@return string
function M.decode(base64)
    return y3_crypto.base64_decode(base64)
end

return M
