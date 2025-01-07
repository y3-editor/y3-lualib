---@class RSA
local M = {}

---生成一对秘钥。
---@return string 公钥
---@return string 私钥
function M.generate_keys()
    local keys = GameAPI.generate_rsa_keys()
    local public_key = keys[0]
    local private_key = keys[1]
    return public_key, private_key
end

---加密
---@param public_key string # 公钥
---@param data string # 要加密的内容
---@return string # 加密后的内容
function M.encrypt(public_key, data)
    return GameAPI.rsa_encrypt_message(public_key, data)
end

---解密
---@param private_key string # 私钥
---@param data string # 要解密的内容
---@return string # 解密后的内容
function M.decrypt(private_key, data)
    return GameAPI.rsa_decrypt_message(private_key, data)
end

return M
