local shop = require 'y3.演示.demo.合成.商店合成'
local pick = require 'y3.演示.demo.合成.拾取合成'

-- 实现商店购买界面，点击商店按钮UI（或按Z键）可以打开或关闭商店界面
include 'y3.演示.demo.合成.商店界面'

-- 设置玩家gold属性
y3.player(1):set('gold', 2000)

-- 商店物品配置
local shop_item_config = {
    刑天斧      = 134257216,
    血翼魔刃    = 134268943,
    裂甲戟      = 134233952,
    圆月弯刀    = 134244701,
    碎牙        = 134280428,
    羽裂斧      = 201390088,
    刹那靴      = 134276637,
    疾风靴      = 134250168,
    蚀魔靴      = 134257230
}

-- 初始化商店配置
shop.init_item_config(shop_item_config)

-- 注册商店物品合成配方
shop.register('刑天斧', {'血翼魔刃', '裂甲戟', '裂甲戟', '裂甲戟'})
shop.register('刹那靴', {'疾风靴', '蚀魔靴'})
shop.register('羽裂斧', {'刑天斧', '刑天斧', '刑天斧'})

-- 商店物品初始化
shop.init_shop_item({'刑天斧', '血翼魔刃', '裂甲戟', '羽裂斧', '刹那靴', '疾风靴', '蚀魔靴'})

-- 拾取物品配置
local pick_item_config = {
    天眼符      = 134245520,
    燧石        = 201390023,
    神力丹      = 201390001,
    神术丹      = 201390002,
    狼锋破      = 134253209
}

-- 初始化拾取配置
pick.init_item_config(pick_item_config)

-- 注册拾取物品合成配方
pick.register('天眼符', {'神力丹', '神术丹'})
pick.register('神力丹', {'狼锋破', '狼锋破'})
pick.register('燧石', {'天眼符', '神力丹'})

-- 监听获得物品时是否合成
pick.pick_synthesis_check()
