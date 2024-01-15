---@param 触发器 Trigger
function 触发器_禁用(触发器)
    触发器:disable()
end

---@param 触发器 Trigger
function 触发器_启用(触发器)
    触发器:enable()
end

---@param 触发器 Trigger
function 触发器_移除(触发器)
    触发器:remove()
end

---@param 触发器 Trigger
---@return boolean
function 触发器_是否已启用(触发器)
    return 触发器:is_enable()
end
