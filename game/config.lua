---@class Config
local M = Class 'Config'

-- 同步相关的配置，当设置为 `true` 后将启用同步，
-- 会产生额外的流量。  
-- 同步需要一定的时间，获取到的是一小段时间前的状态，
-- 因此启用同步后不能立即获取状态。  
---@class Config.Sync
---@field mouse boolean # 同步玩家的鼠标位置
---@field key boolean # 同步玩家的键盘与鼠标按键
---@field camera boolean # 同步玩家的镜头
M.sync = y3.proxy.new({
    mouse  = false,
    key    = false,
    camera = false,
}, {
    updateRaw = true,
    setter = {
        mouse = function (self, raw, key, value, config)
            assert(type(value) == 'boolean', ('`Config.sync.%s` 的赋值类型必须是 `boolean`'):format(key))
            GameAPI.force_enable_mouse_sync(value)
            return value
        end,
        key = function (self, raw, key, value, config)
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

-- 是否是debug模式
---@type boolean|'auto'
M.debug = 'auto'

return M
