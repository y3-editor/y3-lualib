-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.GameAPI
GameAPI = {}

--平台道具是否相等
---@param store_key1 py.StoreKey # 平台道具
---@param store_key2 py.StoreKey # 平台道具
---@return boolean # 是否相等
function GameAPI.api_compare_store_key(store_key1, store_key2) end

--世界坐标转换屏幕坐标
---@param world_pos py.Point # 世界坐标
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_camera_pos_2d(world_pos) end

--世界坐标转换屏幕边缘坐标
---@param world_pos py.Point # 世界坐标
---@param delta_dis py.Fixed # 定点数
---@return py.Point # 屏幕坐标
function GameAPI.api_world_pos_to_screen_edge_pos_2d(world_pos, delta_dis) end

--平台外部服务器设置接口
---@param aes_key string # AESKey
---@param public_key string # PublicKey
---@param external_url string # ExternalUrl
function GameAPI.init_external_http_config(aes_key, public_key, external_url) end

--平台外部连接登录
---@param api_path string # 外部API路径
---@param external_data string # 自定义数据
---@return boolean # 调用结果
function GameAPI.platform_http_login(api_path, external_data) end

--平台外部http请求
---@param api string # 外部API路径
---@param is_post boolean # 是否是post请求
---@param data string # body数据
---@param disable_in_connect? boolean # 是否禁用在connect中
---@return string # 调用结果
function GameAPI.platform_http_request(api, is_post, data, disable_in_connect) end

--上传反作弊数值统计
---@param role py.Role # 玩家
---@param args py.List # 自定义参数
---@return string # 玩家全量昵称
function GameAPI.save_anticheat_data(role, args) end

--剔除字符串内富文本信息
---@param rich_text string # 富文本
---@return string # 普通文本
function GameAPI.get_plain_text_from_rich_text(rich_text) end

--点是否在范围内
---@param check_point py.Point # 待检查的点
---@param center_point py.Point # 中心点
---@param shape py.Shape # 范围
---@return boolean # 布尔值
function GameAPI.api_is_point_in_shape(check_point, center_point, shape) end
