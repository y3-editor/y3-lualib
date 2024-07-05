local function eq(a, b)
    if a == b then
        return
    end
    local info = debug.getinfo(2)
    xpcall(error, print, string.format('未通过：[%s:%s]: %s != %s'
        , info.short_src
        , info.currentline
        , a
        , b
    ))
end

local function isNaN(a)
    if tostring(a):find('nan', 1, true) then
        return
    end
    local info = debug.getinfo(2)
    xpcall(error, print, string.format('未通过：[%s:%s]: %s != %s'
        , info.short_src
        , info.currentline
        , a
    ))
end

-- 基础等价
--eq(xdouble(1), 1) -- 由于Lua重载运算符的规则限制，无法进行这种等价判断
eq(xdouble(1),          xdouble(1))
eq(xdouble(xdouble(1)), xdouble(1))
eq(xdouble(1),          Fix32(1.0))
eq(xdouble('1.0'),      xdouble(1))
eq(xdouble('1.'),       xdouble(1))
eq(xdouble('.0'),       xdouble(0))
eq(xdouble(Fix32(1.0)), xdouble(1))

-- 负数
eq(xdouble(-1),   xdouble(-1))
eq(xdouble('-1'), xdouble(-1))

-- 特殊格式
eq(xdouble('0xff'),                 xdouble(255))
eq(xdouble('314.16e-2'),            xdouble('3.1416'))
eq(xdouble('0.31416E1'),            xdouble('3.1416'))
eq(xdouble('.31416E1'),             xdouble('3.1416'))
eq(xdouble('34e1'),                 xdouble('340.0'))
eq(xdouble('0x0.1E'),               xdouble('0.1171875'))
eq(xdouble('0xA23p-4'),             xdouble('162.1875'))
eq(xdouble('0X1.921FB54442D18P+1'), xdouble('3.14159265358979311600'))

-- 转换
eq(xdouble(1):float(), 1)
eq(xdouble(1):int(),   1)
eq(xdouble(1.5):int(), 1)
eq(math.type(xdouble(1):float()), 'float')
eq(math.type(xdouble(1):int()),   'integer')
eq(math.type(xdouble(1.5):int()), 'integer')

-- 基础运算
eq(-xdouble(3), xdouble(-3))

eq(xdouble(1)   +  xdouble(2), xdouble(3))
eq(xdouble(1)   -  xdouble(2), xdouble(-1))
eq(xdouble(1)   *  xdouble(2), xdouble(2))
eq(xdouble(1)   /  xdouble(2), xdouble(0.5))
eq(xdouble(5.5) // xdouble(2), xdouble(2))
eq(xdouble(5.5) %  xdouble(2), xdouble(1.5))
eq(xdouble(3)   ^  xdouble(2), xdouble(9))
eq(xdouble(2)   <  xdouble(3), true)
eq(xdouble(2)   <= xdouble(2), true)

eq(xdouble(1)   +  Fix32(2), xdouble(3))
eq(xdouble(1)   -  Fix32(2), xdouble(-1))
eq(xdouble(1)   *  Fix32(2), xdouble(2))
eq(xdouble(1)   /  Fix32(2), xdouble(0.5))
eq(xdouble(5.5) // Fix32(2), xdouble(2))
eq(xdouble(5.5) %  Fix32(2), xdouble(1.5))
eq(xdouble(3)   ^  Fix32(2), xdouble(9))
eq(xdouble(2)   <  Fix32(3), true)
eq(xdouble(2)   <= Fix32(2), true)

eq(xdouble(1)   +  2, xdouble(3))
eq(xdouble(1)   -  2, xdouble(-1))
eq(xdouble(1)   *  2, xdouble(2))
eq(xdouble(1)   /  2, xdouble(0.5))
eq(xdouble(5.5) // 2, xdouble(2))
eq(xdouble(5.5) %  2, xdouble(1.5))
eq(xdouble(3)   ^  2, xdouble(9))
eq(xdouble(2)   <  3, true)
eq(xdouble(2)   <= 2, true)

-- 高级运算
eq(tostring(xdouble('NaN')), 'nan')
isNaN(xdouble('NaN'))
eq(tostring(xdouble('inf')), 'inf')
eq(xdouble('inf') + 1, xdouble('inf'))
eq(xdouble('inf') - 1, xdouble('inf'))
eq(xdouble('inf')    , - xdouble('-inf'))

eq(2 ^ xdouble(50),                               xdouble(1 << 50))
eq(xdouble(2828389) % (xdouble(2) ^ xdouble(32)), xdouble(2828389))
eq(xdouble(1 << 63) + 1,                          xdouble(1 << 63))
eq(xdouble(1 << 62) * 4,                          xdouble(2) ^ 64)

eq(xdouble(2) ^ 100, xdouble('1267650600228229401496703205376'))
eq(xdouble(2) ^ 101, xdouble('2535301200456458802993406410752'))
eq(xdouble(2) ^ 102, xdouble('5070602400912917605986812821504'))
eq(xdouble(2) ^ 103, xdouble('10141204801825835211973625643008'))
eq(xdouble(2) ^ 104, xdouble('20282409603651670423947251286016'))
eq(xdouble(2) ^ 105, xdouble('40564819207303340847894502572032'))
eq(xdouble(2) ^ 106, xdouble('81129638414606681695789005144064'))
eq(xdouble(2) ^ 107, xdouble('162259276829213363391578010288128'))
eq(xdouble(2) ^ 108, xdouble('324518553658426726783156020576256'))
eq(xdouble(2) ^ 109, xdouble('649037107316853453566312041152512'))
eq(xdouble(2) ^ 110, xdouble('1298074214633706907132624082305024'))
eq(xdouble(2) ^ 111, xdouble('2596148429267413814265248164610048'))
eq(xdouble(2) ^ 112, xdouble('5192296858534827628530496329220096'))
eq(xdouble(2) ^ 113, xdouble('10384593717069655257060992658440192'))
eq(xdouble(2) ^ 114, xdouble('20769187434139310514121985316880384'))
eq(xdouble(2) ^ 115, xdouble('41538374868278621028243970633760768'))
eq(xdouble(2) ^ 116, xdouble('83076749736557242056487941267521536'))
eq(xdouble(2) ^ 117, xdouble('166153499473114484112975882535043072'))
eq(xdouble(2) ^ 118, xdouble('332306998946228968225951765070086144'))
eq(xdouble(2) ^ 119, xdouble('664613997892457936451903530140172288'))
eq(xdouble(2) ^ 120, xdouble('1329227995784915872903807060280344576'))

eq(xdouble(2) ^ 100 + xdouble(2) ^ 103 + xdouble(2) ^ 110,
   xdouble('1309483070035760971746094411153408'))

eq(xdouble('100000000000000') / (1 + xdouble('0.01') * xdouble('6000000')),
   xdouble('1666638889.35184407234191894531'))

-- 数学运算
eq(xdouble(-1):abs(), xdouble(1))
eq(xdouble(1):abs(),  xdouble(1))

eq(xdouble(0):acos(),   xdouble('1.57079632679489655800'))
eq(xdouble(0.5):acos(), xdouble('1.04719755119659785336'))
eq(xdouble(1):acos(),   xdouble('0'))
isNaN(xdouble(2):acos())

eq(xdouble(0):asin(),   xdouble('0'))
eq(xdouble(0.5):asin(), xdouble('0.52359877559829892668'))
eq(xdouble(1):asin(),   xdouble('1.57079632679489655800'))
isNaN(xdouble(2):asin())

eq(xdouble(0):atan(),   xdouble('0'))
eq(xdouble(0.5):atan(), xdouble('0.46364760900080609352'))
eq(xdouble(1):atan(),   xdouble('0.78539816339744827900'))
eq(xdouble(-1):atan(),  xdouble('-0.78539816339744827900'))

eq(xdouble(1.5):ceil(),  xdouble(2))
eq(xdouble(-1.5):ceil(), xdouble(-1))

eq(xdouble(0):cos(),  xdouble(1))
eq(xdouble(1):cos(),  xdouble('0.54030230586813976501'))
eq(xdouble(-1):cos(), xdouble('0.54030230586813976501'))

eq(xdouble(0):exp(),  xdouble(1))
eq(xdouble(1):exp(),  xdouble('2.71828182845904509080'))
eq(xdouble(2):exp(),  xdouble('7.38905609893065040694'))

eq(xdouble(1):log(),   xdouble('0'))
eq(xdouble(10):log(),  xdouble('2.30258509299404590109'))
eq(xdouble(100):log(), xdouble('4.60517018598809180219'))

eq(xdouble(1.5):round(),  xdouble(2))
eq(xdouble(2.1):round(),  xdouble(2))
eq(xdouble(2.5):round(),  xdouble(3))
eq(xdouble(-1.5):round(), xdouble(-2))
eq(xdouble(-2.1):round(), xdouble(-2))
eq(xdouble(-2.5):round(), xdouble(-3))

eq(xdouble(0):sin(),  xdouble(0))
eq(xdouble(1):sin(),  xdouble('0.84147098480789650488'))
eq(xdouble(-1):sin(), xdouble('-0.84147098480789650488'))

eq(xdouble(0):sqrt(),  xdouble(0))
eq(xdouble(1):sqrt(),  xdouble(1))
eq(xdouble(2):sqrt(),  xdouble('1.41421356237309514547'))

eq(xdouble(0):tan(),  xdouble(0))
eq(xdouble(1):tan(),  xdouble('1.55740772465490229237'))
eq(xdouble(-1):tan(), xdouble('-1.55740772465490229237'))

print('测试完成！')
