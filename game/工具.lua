---如果 index 是个数字， 那么返回参数中第 index 个之后的部分； 负的数字会从后向前索引（-1 指最后一个参数）。 否则，index 必须是字符串 "#"， 此时 select 返回参数的个数。
---@generic T
---@param 索引 integer
---@param ... T
---@return T
function 多项选择(索引, ...)
    return select(索引, ...)
end

---@generic T
---@param 判断 any 判断为真返回结果1 否则返回结果2
---@param true值 T
---@param false值 T
---@return T
function 判断选择(判断, true值, false值)
    if 判断 then
        return true值
    else
        return false值
    end
end

--- ---@field [any] {a:integer}
---@return 模块.玩家数据
function 创建玩家数据表()
    ---@class 模块.玩家数据
    local 返回数据 = {}
    y3.玩家组.获取所有玩家():遍历(function(索引, 遍历到的玩家)
        返回数据[遍历到的玩家] = {}
    end)
    return 返回数据
end
