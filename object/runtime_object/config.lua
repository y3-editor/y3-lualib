---@class Config
local M = Class 'Config'

---@class Config.Sync
-- 同步相关的配置，当设置为 `true` 后将启用同步，
-- 会产生额外的流量。  
-- 同步需要一定的时间，获取到的是一小段时间前的状态，
-- 因此启用同步后不能立即获取状态。  
M.sync = y3.proxy.new({}, {
    updateRaw = true,
    setter = {
        mouse = function (self, raw, key, value, config)
            assert(type(value) == 'boolean', ('`Config.sync.%s` 的赋值类型必须是 `boolean`'):format(key))
            GameAPI.force_enable_mouse_sync(value)
            return value
        end,
        keyboard = function (self, raw, key, value, config)
            assert(type(value) == 'boolean', ('`Config.sync.%s` 的赋值类型必须是 `boolean`'):format(key))
            GameAPI.force_enable_keyboard_sync(value)
            return value
        end,
        camera = function (self, raw, key, value, config)
            assert(type(value) == 'boolean', ('`Config.sync.%s` 的赋值类型必须是 `boolean`'):format(key))
            GameAPI.force_enable_camera_sync(value)
            return value
        end,
    },
})

-- 同步玩家的鼠标
M.sync.mouse    = false
-- 同步玩家的键盘（好像没有相关的获取API？）
M.sync.keyboard = false
-- 同步玩家的镜头
M.sync.camera   = false

return M
