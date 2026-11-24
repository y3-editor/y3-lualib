-- 客户端在云脚本执行 Lua：y3.cloud.run
-- 走云脚本 Develop.Eval；云脚本 y3.config.debug 为 true 才放行

---@class Cloud.Develop
local M = {}

---callback(suc, data, err)：data 是代码的第一个返回值，需要多个值时在代码里自己包成表
---@param code string
---@param callback? fun(suc: boolean, data: any, err: string?)
---@return integer 请求 id
function M.run(code, callback)
    return y3.cloud.rpc.request('Develop.Eval', { code = code }, callback)
end

y3.cloud.run = M.run
