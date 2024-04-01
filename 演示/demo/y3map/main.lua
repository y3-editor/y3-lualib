require 'y3'
require 'y3map'

-- 游戏启动后会自动运行此文件
y3.config.log.toGame = true

y3.game:event('游戏-初始化', function(trg, data)
    -- 初始化英雄
    y3map.create_hero:init()

    -- 初始化键盘
    y3map.keyboard_manager:init()

    -- 初始化ui
    y3map.ui_manager:init()

    -- 初始化刷怪
    y3map.generator_manager:init()

    -- 初始化所有模块后，再启动游戏时间
    y3map.timer_manager:init()

    -- 开始刷怪
    y3map.generator_manager:start()
end)
