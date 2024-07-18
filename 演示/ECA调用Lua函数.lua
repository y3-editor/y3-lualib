-- 声明一个新的ECA函数，用于获取单位所有者
y3.eca.def '获取单位所有者'
    -- 声明第一个参数的ECA类型
    : with_param('单位', 'Unit')
    -- 声明返回值的ECA类型
    : with_return('玩家', 'Player')
    ---@param unit Unit
    ---@return Player?
    : call(function (unit)
        -- unit 已经是Lua框架的Unit类型
        local p = unit:get_owner()
        -- 直接返回Lua框架的Player类型即可
        return p
    end)

-- 编辑器中使用ECA “执行Lua代码” 来调用上述函数
-- 设置变量 玩家 = 执行Lua代码 “Bind['获取单位所有者'](args[1])”，参数列表： 单位
