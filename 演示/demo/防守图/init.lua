-- 加载演示用的技能
require 'y3.演示.demo.技能'
-- 加载演示用的UI
--require 'y3.演示.demo.主控UI'

y3.game:event('游戏-初始化', function(trg, data)
    require 'y3.演示.demo.防守图.主逻辑'
end)
