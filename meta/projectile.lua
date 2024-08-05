-- 此文件由 `tools/genGameAPI` 生成，请勿手动修改。
---@meta

---@class py.ProjectileEntity
local ProjectileEntity = {}

--投射物本身对象
---@return py.Unit? # 投射物本身对象
function ProjectileEntity:api_get_self() end

--获取单位ID
---@return py.UnitID? # 单位ID
function ProjectileEntity:api_get_id() end

--投射物编号
---@return py.ProjectileKey? # 投射物的key
function ProjectileEntity:api_get_key() end

--投射物产生者
---@return py.Unit? # 投射物产生者
function ProjectileEntity:api_get_owner() end

--销毁投射物对象
---@param unit? py.Unit # 销毁的投射物对象
---@param immediately? boolean # 立即移除表现
function ProjectileEntity:api_delete(unit, immediately) end

--设置投射物位置
---@param point py.Point # 投射物位置
---@param interpolation? boolean # 是否平滑
function ProjectileEntity:api_set_position(point, interpolation) end

--设置投射物朝向
---@param face_angle number # 投射物朝向
function ProjectileEntity:api_set_face_angle(face_angle) end

--设置投射物旋转
---@param x number # x轴旋转
---@param z number # y轴旋转
---@param y number # z轴旋转
function ProjectileEntity:api_set_rotation(x, z, y) end

--设置投射物缩放
---@param x number # x轴缩放
---@param z number # y轴缩放
---@param y number # z轴缩放
function ProjectileEntity:api_set_scale(x, z, y) end

--设置投射物特效播放速度
---@param rate number # 播放速度
function ProjectileEntity:api_set_animation_speed(rate) end

--设置投射物持续时间
---@param duration number # 持续时间
function ProjectileEntity:api_set_duration(duration) end

--增加投射物持续时间
---@param extra_time number # 持续时间变化值
function ProjectileEntity:api_add_duration(extra_time) end

--获取投射物剩余持续时间
---@return number? # 投射物剩余持续时间
function ProjectileEntity:api_get_left_time() end

--获取投射物高度
---@return number? # 投射物高度
function ProjectileEntity:api_get_height() end

--获取投射物角度
---@return number? # 投射物的角度
function ProjectileEntity:api_get_face_angle() end

--获取投射物位置
---@return py.FVector3? # 投射物位置
function ProjectileEntity:api_get_position() end

--获取投射物朝向
---@return py.FVector3? # 投射物朝向
function ProjectileEntity:api_get_face_dir() end

--投射物抬高
---@param y py.Fixed # 定点数
function ProjectileEntity:api_raise_height(y) end

--获取投射物的字符串属性
---@param attr_name string # 属性名称
---@return string? # 字符串类型返回值
function ProjectileEntity:api_get_str_attr(attr_name) end

--设置投射物的字符串属性
---@param attr_name string # 属性名称
---@param value string # 属性取值
function ProjectileEntity:api_set_str_attr(attr_name, value) end

--投射物添加键值对
---@param tag string # TAG
function ProjectileEntity:api_add_tag(tag) end

--投射物移除键值对
---@param tag string # TAG
function ProjectileEntity:api_remove_tag(tag) end

--对投射物所属单位的所属玩家关系播放音乐
---@param camp_target py.RoleRelation # 玩家关系
---@param sid py.AudioKey # 乐曲编号
---@param loop boolean # 是否循环
function ProjectileEntity:api_play_sound_by_proj_for_role_relation(camp_target, sid, loop) end

--获取投射物的玩家
---@return py.Role? # 玩家
function ProjectileEntity:get_projectile_role() end

--设置投射物对玩家的可见性
---@param role py.Role # 玩家/玩家组
---@param is_visible boolean # 是否可见
function ProjectileEntity:api_set_projectile_visible(role, is_visible) end
