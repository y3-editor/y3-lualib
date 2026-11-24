-- 通讯层命名空间：功能按模块挂在 y3.cloud.<name> 下
-- 当前实现：rpc（请求 / 应答 / 通知）、handshake（握手，状态直接挂在 y3.cloud 上）、develop（执行云端 Lua）、player（玩家属性）、unit（云端单位与属性）

---@class Cloud
y3.cloud = {}

require 'y3.cloud.rpc'
require 'y3.cloud.develop'
require 'y3.cloud.handshake'
require 'y3.cloud.player'
require 'y3.cloud.unit'
