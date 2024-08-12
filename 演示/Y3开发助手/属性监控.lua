-- 需要安装《Y3开发助手》版本 >= 1.11.1，附加调试器并在调试器界面中启用断点“Caught Errors By Lua”

local unit = y3.unit.get_by_res_id(1)

-- 当单位的最大生命恰好变为1000时引发一个特殊的异常断点
y3.develop.helper.createAttrWatcher(unit, '最大生命', 1000)

-- 当单位的生命值低至最大生命的一半时引发一个特殊的异常断点
y3.develop.helper.createAttrWatcher(unit, '生命', '<= `最大生命` / 2')

-- 你也可以在《Y3开发助手》中动态添加这些监视器
-- 1. 在游戏中选中要监控的单位
-- 2. 在“仪表盘”的“选中单位”中点击要监视的属性
-- 3. 输入断点表达式，按回车键确认
