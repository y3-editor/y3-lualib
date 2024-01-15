---@param 单位组 UnitGroup
---@param 回调函数 fun(索引:integer,遍历到的单位:Unit)
---@return Unit[] 返回单位数组
function 单位组_遍历(单位组, 回调函数)
    local 返回单位数组 = 单位组:pick()
    for index, value in ipairs(返回单位数组) do
        if 回调函数(index, value) == false then
            break
        end
    end
    return 返回单位数组
end

---@param 单位组 UnitGroup
---@param 单位 Unit
function 单位组_移除单位(单位组, 单位)
    y3.unit_group.remove_unit(单位组, 单位)
end

---@param 单位组 UnitGroup
---@param 单位 Unit
function 单位组_添加单位(单位组, 单位)
    y3.unit_group.add_unit(单位组, 单位)
end

---@param 单位组 UnitGroup
function 单位组_清空(单位组)
    单位组_遍历(单位组, function(索引, 遍历到的单位)
        单位组_移除单位(单位组, 遍历到的单位)
    end)
end

调试事件_即将重载(function(reload, willReload)
    玩家组_遍历(玩家组_获取所有玩家(), function(索引, 遍历到的玩家)
        单位组_遍历(玩家_获取所有单位(遍历到的玩家), function(索引, 遍历到的单位)
            单位_删除(遍历到的单位)
        end)
    end)
end)
