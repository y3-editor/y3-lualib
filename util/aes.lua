---@diagnostic disable-next-line: undefined-global
local y3_crypto = y3_crypto

--aes加密解密
---@class AES
local M = {}

--加密字符串
---@param key string # 长度必须是16/24/32
---@param iv string # 长度必须是16
---@param source_text string # 要加密的文本
---@return string
function M.encrypt(key, iv, source_text)
    if #key ~= 16 and #key ~= 24 and #key ~= 32 then
        error('key长度必须是16/24/32')
    end
    if #iv ~= 16 then
        error('iv长度必须是16')
    end
    local ret, err = y3_crypto.aes_encrypt(key, iv, source_text, #source_text)
    if not ret then
        error(err)
    end
    return ret
end

--解密字符串
---@param key string # 长度必须是16/24/32
---@param iv string # 长度必须是16
---@param crypted_text string # 要解密的文本
---@return string
function M.decrypt(key, iv, crypted_text)
    if #key ~= 16 and #key ~= 24 and #key ~= 32 then
        error('key长度必须是16/24/32')
    end
    if #iv ~= 16 then
        error('iv长度必须是16')
    end
    local ret, err = y3_crypto.aes_decrypt(key, iv, crypted_text, #crypted_text)
    if not ret then
        error(err)
    end
    return ret
end

return M
