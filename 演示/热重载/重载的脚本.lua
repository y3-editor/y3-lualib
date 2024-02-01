-- 重载前交换下面2行的注释试试！
print("文件第一次被加载")
--print('文件第二次被加载')

y3.游戏:事件("键盘-按下", y3.const.KeyboardKey["SPACE"], function(trg, data)
    -- 重载前交换下面2行的注释试试！
    print("第一种敲空格")
    --print('第二种敲空格')
end)

y3.计时器.循环执行(1, function(timer, count)
    -- 重载前交换下面2行的注释试试！
    print("第一种计时器到期")
    --print('第二种计时器到期')
end)
