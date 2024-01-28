---@class Unit
local m = y3.单位

---@class 参_单位事件
---@field 当前触发器 Trigger
---@field 触发单位 Unit

---@class 参_指定单位获得经验:参_单位事件
---@field 触发单位 Unit
---@field 经验值 number

---@param 回调 fun(参数:参_指定单位获得经验)
function m:事件_获得经验前(回调)
    self:event("单位-获得经验前", function(trg, data)
        回调({
            当前触发器 = trg,
            经验值 = data.add_exp,
            触发单位 = data.unit
        })
    end)
end

---@param 回调 fun(参数:参_指定单位获得经验)
function m:事件_获得经验后(回调)
    self:event("单位-获得经验前", function(trg, data)
        回调({
            当前触发器 = trg,
            经验值 = data.add_exp,
            触发单位 = data.unit
        })
    end)
end

---@param 回调 fun(参数:参_单位事件)
function m:事件_升级(回调)
    self:event("单位-升级", function(trg, data)
        回调({
            当前触发器 = trg,
            触发单位 = data.unit
        })
    end)
end
