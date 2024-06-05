local M = y3.object.unit[134274912] -- 关羽

M:event('单位-创建', function (trg, data)
    local unit = data.unit
    print('单位-创建：', unit)

    -- 将计时器绑定在单位上，单位移除时计时器会自动销毁
    unit:bindGC(y3.ltimer.loop(0.5, function ()
        print('造成伤害！')
        unit:damage {
            damage = 100,
            target = unit,
            type = '物理',
        }
    end))
end)

M:event('单位-死亡', function (trg, data)
    local unit = data.unit
    print('单位-死亡：', unit)
    y3.ltimer.wait(2, function (timer, count)
        unit:remove()
    end)
end)

M:event('单位-移除', function (trg, data)
    print('单位-移除：', data.unit)
end)
