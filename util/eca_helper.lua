---@class ECAHelper
local M = Class 'ECAHelper'

--注册ECA函数
--
--可以使用该功能让lua函数在ECA中被调用。
---@param name string
---@return ECAFunction
function M.def(name)
    return New 'ECAFunction' (name)
end

---@private
M._call_impls = {}

--调用ECA中定义的自定义事件
function M.call(...)
    local impl = M._call_impls[...]
    if not impl then
        error('不存在此自定义事件：' .. tostring(...))
    end
    impl(...)
end

---@private
---@param name string
---@param impl function
function M.register_custom_event_impl(name, impl)
    M._call_impls[name] = impl
end

return M
