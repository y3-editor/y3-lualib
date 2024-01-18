local 局_缓存_选中状态 = {}
local 局_缓存_切换界面 = {}
local 局_全局逻辑处理器 = nil
local 局_界面逻辑处理器 = {}

---@enum em界面变动类型
em界面变动类型 = {
    显示 = 1,
    隐藏 = 2,
    刷新 = 3,
}

---@enum em界面切换模式
em界面切换模式 = {
    同分组 = 1,
    全部分组 = 2,
    自身 = 3,
}

---@class 框架事件_界面被显示_参数
---@field 触发控件 UI
---@field 触发按钮 UI
---@field 触发玩家 Player
---@field 触发类型 em界面变动类型

---@param 控件 UI
---@param 回调函数_界面被显示_隐藏 fun(触发器:Trigger,参数:框架事件_界面被显示_参数)
function 事件_界面被显示_隐藏(控件, 回调函数_界面被显示_隐藏)
    ---@param 触发器 Trigger
    ---@param 参数 框架事件_界面被显示_参数
    全局事件.自定义带标识("框架事件_界面变动", 控件.handle, function(触发器, 参数)
        回调函数_界面被显示_隐藏(触发器, 参数)
    end)
end

---@param 逻辑处理器 fun(参数:par_界面_逻辑处理器参数) 参数值都可以修改, 影响后续切换界面操作逻辑
function 界面_设置全局逻辑处理器(逻辑处理器)
    局_全局逻辑处理器 = 逻辑处理器
end

---@class 界面_切换界面_参数
---@field 玩家 Player
---@field 控件? UI
---@field 按钮? UI
---@field 切换模式? integer
---@field 强制显示? boolean 最终显示界面
---@field 强制隐藏? boolean 最终隐藏界面
---@field 强制刷新? boolean 仅发送刷新事件
---@field 分组? string 区分界面层次, 只操作本分组的界面
---@field 操作层级? integer 默认所有父控件都遍历, 否则只操作指定层级以下的界面, 目标控件层级为1, 父控件依次递增
---@field 逻辑处理器? fun(参数:par_界面_逻辑处理器参数) 参数值都可以修改, 影响后续切换界面操作逻辑
---@field 强制执行? boolean 默认false 为true 则无视逻辑处理器

---切换互斥界面, 递归显示参数.控件, 递归隐藏上次切换的控件, 通过 框架事件_界面变动 可以接收界面变动的事件
---@param 参数 界面_切换界面_参数 @控件默认空为隐藏所有界面  分组默认 __未分类
---@return boolean
function 界面_切换界面(参数)
    local 触发玩家 = 参数.玩家
    -- if 参数.控件 == nil then 参数.控件 = 控件_从路径获取(参数.玩家, '画板_空') end
    if 参数.强制显示 == nil then 参数.强制显示 = false end
    if 参数.强制隐藏 == nil then 参数.强制隐藏 = false end
    if 参数.强制刷新 == nil then 参数.强制刷新 = false end
    if 参数.分组 == nil then 参数.分组 = "__未分类" end
    if 参数.操作层级 == nil then 参数.操作层级 = 100 end
    参数.切换模式 = 参数.切换模式 or em界面切换模式.同分组
    local 玩家id = 触发玩家:id()
    ---@class 参_界面模块.界面缓存
    ---@field 层级 integer
    ---@field 控件 UI

    ---@type 参_界面模块.界面缓存[]
    local 新界面 = {}
    ---@type 参_界面模块.界面缓存[]
    local 旧界面 = 局_缓存_切换界面[玩家id][参数.分组] or {}
    local 最终可视
    ---@param 触发类型 em界面变动类型
    local function 发送框架事件_界面变动(当前界面, 触发类型)
        ---@type 框架事件_界面被显示_参数
        local 事件参数 = {
            触发类型 = 触发类型,
            触发按钮 = 参数.按钮,
            触发控件 = 当前界面,
            触发玩家 = 触发玩家
        }
        if 参数.按钮 and 当前界面.handle == 参数.控件.handle and 触发类型 == em界面变动类型.显示 then
            控件_显示选中标识(参数.按钮, "选中", 参数.分组)
        end

        全局事件.发送自定义带标识("框架事件_界面变动", 当前界面.handle, 事件参数)
    end
    -- 调试输出("初始参数", 参数)
    --#region 初步判断最总是否可视
    if 参数.控件 == nil then
        最终可视 = false
    elseif 参数.强制显示 then
        最终可视 = true
    elseif 参数.强制隐藏 then
        最终可视 = false
    else
        最终可视 = not 参数.控件:获取_是否可见()
    end
    --#endregion

    --#region 逻辑处理器
    ---@class par_界面_逻辑处理器参数
    ---@field 最终可视 boolean
    ---@field 中止操作 boolean
    local 逻辑处理器参数 = {
        新增显示界面 = {},
        新增隐藏界面 = {},
        中止操作 = false,
        触发界面 = 参数.控件,
        触发按钮 = 参数.按钮,
        强制刷新 = 参数.强制刷新,
        强制隐藏 = 参数.强制隐藏,
        强制显示 = 参数.强制显示,
        触发界面分组 = 参数.分组,
        触发玩家 = 参数.玩家,
        操作层级 = 参数.操作层级,
        最终可视 = 最终可视,
    }

    if 局_全局逻辑处理器 and 参数.强制执行 ~= true then
        局_全局逻辑处理器(逻辑处理器参数)
        if 逻辑处理器参数.中止操作 then
            -- 调试输出("全局逻辑处理器 中止操作")
            return false
        end
        最终可视 = 逻辑处理器参数.最终可视
    end

    if 参数.控件 and 参数.强制执行 ~= true then
        -- 调试输出("当前逻辑处理器", 参数.逻辑处理器, 局_界面逻辑处理器, 局_界面逻辑处理器[参数.控件.handle])
        if 参数.逻辑处理器 then
            -- 调试输出("调用当前逻辑处理器")
            参数.逻辑处理器(逻辑处理器参数)
        elseif 局_界面逻辑处理器[参数.控件.handle] then
            -- 调试输出("调用注册的逻辑处理器")
            局_界面逻辑处理器[参数.控件.handle](逻辑处理器参数)
        end

        if 逻辑处理器参数.中止操作 then
            -- 调试输出("界面逻辑处理器 中止操作")
            return false
        end
        最终可视 = 逻辑处理器参数.最终可视
    end

    for _, value in ipairs(逻辑处理器参数.新增显示界面) do
        -- 调试输出("新增显示界面", value)
        新界面[value.handle] = { 控件 = value, 层级 = 9999 }
    end
    for _, value in ipairs(逻辑处理器参数.新增隐藏界面) do
        -- 调试输出("新增隐藏界面", value)
        旧界面[value.handle] = { 控件 = value, 层级 = 9999 }
    end
    --#endregion

    --#region 强制刷新直接跳出
    if 参数.强制刷新 == true then
        发送框架事件_界面变动(参数.控件, em界面变动类型.刷新)
        -- 日志_调试("界面切换 强制刷新界面数据 提前跳出" .. 到字符串(参数.控件))
        return true
    end
    --#endregion

    --#region 遍历设置界面可见性
    if 参数.控件 then
        参数.控件:遍历父控件(function(深度, 父控件)
            新界面[父控件.handle] = {
                控件 = 父控件,
                层级 = 深度
            }
            if 深度 >= 参数.操作层级 then
                return true
            end
        end)


        局_缓存_切换界面[玩家id][参数.分组] = 新界面
    end

    -- 遍历旧界面表, 隐藏不相关旧界面
    if 参数.切换模式 == em界面切换模式.自身 then

    end
    for k, v in pairs(旧界面) do
        local 要隐藏的控件 = v.控件
        if 表_是否存在字段(新界面, k) == false then
            if 要隐藏的控件:获取_是否可见() then
                要隐藏的控件:设置是否可见(false)
                发送框架事件_界面变动(要隐藏的控件, em界面变动类型.隐藏)
            end
        end
    end

    表_排序后遍历({ 表 = 新界面, 字段 = "层级", 倒序 = true }, function(index, k, v)
        ---@type UI
        local 要显示的控件 = v.控件
        if 参数.强制显示 then
            if 要显示的控件:获取_是否可见() == false then
                要显示的控件:设置是否可见(最终可视)
            end
            发送框架事件_界面变动(要显示的控件, em界面变动类型.显示)
        elseif 参数.强制隐藏 then
            if 要显示的控件:获取_是否可见() == true then
                要显示的控件:设置是否可见(最终可视)
            end
            发送框架事件_界面变动(要显示的控件, em界面变动类型.隐藏)
        else
            if 要显示的控件:获取_是否可见() ~= 最终可视 then
                要显示的控件:设置是否可见(最终可视)
                if 最终可视 then
                    发送框架事件_界面变动(要显示的控件, em界面变动类型.显示)
                else
                    发送框架事件_界面变动(要显示的控件, em界面变动类型.隐藏)
                end
            end
        end
    end)
    -- 调试输出("新界面", 新界面)
    -- 调试输出("旧界面", 旧界面)
    -- 调试输出("最终参数", 最终可视, 参数)
    --#endregion


    -- 日志_调试("界面切换 切换成功" .. 到字符串(参数.控件))
    return 最终可视
end

---@param 参数 界面_切换界面_参数 @分组默认__子界面
---@return boolean
function 界面_切换_主界面(参数)
    参数.分组 = "__主界面"
    参数.操作层级 = 1
    return 界面_切换界面(参数)
end

---@param 参数 界面_切换界面_参数 @分组默认__子界面
---@return boolean
function 界面_切换_子界面(参数)
    参数.分组 = "__子界面" .. 参数.控件.handle
    参数.操作层级 = 1
    return 界面_切换界面(参数)
end

--绑定快捷键 和 绑定按钮 必须至少有1个, 初始可见性 默认false 分组默认__主界面
---@class par界面_注册事件
---@field 玩家 Player
---@field 界面 UI
---@field 绑定按钮 UI
---@field 绑定快捷键? 键盘按类型
---@field 初始可见性? boolean
---@field 分组? string
---@field 操作层级? integer
---@field 逻辑处理器? fun(参数:par_界面_逻辑处理器参数)


---@param 参数 par界面_注册事件
function 界面_注册事件(参数)
    local 界面 = 参数.界面
    界面_切换界面({
        玩家 = 参数.玩家,
        控件 = 界面,
        按钮 = 参数.绑定按钮,
        强制显示 = 参数.初始可见性,
        强制隐藏 = not 参数.初始可见性,
        分组 = 参数.分组,
        操作层级 = 参数.操作层级,
        强制执行 = true
    })

    if 参数.逻辑处理器 then
        局_界面逻辑处理器[界面.handle] = 参数.逻辑处理器
    end

    参数.绑定按钮:添加事件("点击-结束", 界面.handle, {})
    全局事件.指定控件(界面.handle, function(事件参数)
        界面_切换界面({
            玩家 = 事件参数.触发玩家,
            控件 = 界面,
            按钮 = 事件参数.触发控件,
            强制显示 = true,
            分组 = 参数.分组,
            操作层级 = 参数.操作层级,
        })
    end)

    if 参数.绑定快捷键 then
        全局事件.键盘抬起(参数.绑定快捷键, function(按键参数)
            界面_切换界面({
                玩家 = 按键参数.触发玩家,
                控件 = 界面,
                按钮 = 参数.绑定按钮,
                分组 = 参数.分组,
                操作层级 = 参数.操作层级
            })
        end)
    end
end

---@param 主界面表 par界面_注册事件[] 分组默认为 主界面
function 界面_注册事件_主界面(主界面表)
    表_排序后遍历2(主界面表,
             function(k, v)
                 if v.初始可见性 then
                     return 2
                 else
                     return 1
                 end
             end,
             function(i, k, v)
                 界面_注册事件({
                     玩家 = v.玩家,
                     界面 = v.界面,
                     绑定按钮 = v.绑定按钮,
                     绑定快捷键 = v.绑定快捷键,
                     初始可见性 = v.初始可见性,
                     分组 = "__主界面",
                     操作层级 = 100,
                     逻辑处理器 = v.逻辑处理器
                 })
             end)
end

---@param 子界面表 par界面_注册事件[] 分组默认为 __子界面 .. 父控件.handle
function 界面_注册事件_子界面(子界面表)
    表_排序后遍历2(子界面表,
             function(k, v)
                 if v.初始可见性 then
                     return 2
                 else
                     return 1
                 end
             end,
             function(i, k, v)
                 ---@cast v +par界面_注册事件
                 界面_注册事件({
                     玩家 = v.玩家,
                     界面 = v.界面,
                     绑定按钮 = v.绑定按钮,
                     绑定快捷键 = v.绑定快捷键,
                     初始可见性 = v.初始可见性,
                     分组 = "__子界面" .. v.界面.handle,
                     操作层级 = 1,
                     逻辑处理器 = v.逻辑处理器
                 })
             end)
end

---@param 控件 UI
---@param 路径 string 相对父控件的路径
---@param 标识 string 同名标识只会显示1个, 如果有其他显示的, 会先隐藏
function 控件_显示选中标识(控件, 路径, 标识)
    local 选中标识控件 = 控件:获取子控件(路径)
    local 玩家id = 控件.player.id
    if 选中标识控件 then
        选中标识控件:设置是否可见(true)
        if 局_缓存_选中状态[玩家id][标识] and 选中标识控件.handle ~= 局_缓存_选中状态[玩家id][标识].handle then
            局_缓存_选中状态[玩家id][标识]:设置可见性(false)
        end
        局_缓存_选中状态[玩家id][标识] = 选中标识控件
    end
end

插件.初始化(function()
    玩家组.获取所有玩家():遍历(function(索引, 遍历到的玩家)
        local 玩家id = 遍历到的玩家.id
        局_缓存_选中状态[玩家id] = {}
        局_缓存_切换界面[玩家id] = {}
    end)
end)
