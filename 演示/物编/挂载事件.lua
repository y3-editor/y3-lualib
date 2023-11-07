local M = y3.object.unit[134274912] -- 关羽

function M.on_create(unit)
    print('单位-创建')
    unit:bindGC(y3.ltimer.loop(0.1, function ()
        unit:damage {
            damage = 10,
            target = unit,
            type = '物理',
        }
    end))
end

function M.on_dead(unit)
    print('单位-死亡')
end
