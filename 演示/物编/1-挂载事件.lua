local M = y3.物编.unit[134274912] -- 关羽

function M.on_create(unit)
    print("单位-创建：", unit)

    -- 将计时器绑定在单位上，单位移除时计时器会自动销毁
    unit:bindGC(y3.ltimer.loop(0.5, function()
        print("造成伤害！")
        unit:造成伤害 {
            damage = 100,
            target = unit,
            type = "物理",
        }
    end))
end

function M.on_dead(unit)
    print("单位-死亡：", unit)
    y3.ltimer.wait(2, function(timer, count)
        unit:移除()
    end)
end

function M.on_remove(unit)
    print("单位-移除：", unit)
end
