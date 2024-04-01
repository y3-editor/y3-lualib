---@class UI
local M = Class "UI"

--设置文本
---@param str string 文本
---@param ...table<integer, 枚举.颜色>[]
---@return self
function M:设置文本_颜色格式化(str, ...)
    local 返回内容 = str
    for index, value in ipairs(...) do
        if value then
            local 替换文本 = value[2] .. 到字符串(value[1]) .. "#ffffff"
            返回内容 = 字符串.替换(str, "{}", 替换文本, 1)
        end
    end
    return self:设置文本(返回内容)
end

---@param 回调 fun(索引:integer,遍历到的控件:UI):any?
---@return any? return 当前回调返回值
function M:遍历子控件(回调)
    for index, value in ipairs(self:获取所有子控件()) do
        local r = 回调(index, value)
        if r then
            return r
        end
    end
end

---@param 回调 fun(深度:integer,父控件:UI)
function M:遍历父控件(回调)
    local 父控件 = self
    for i = 1, 30, 1 do
        if 回调(i, 父控件) then
            return
        end
        if 字符串.查找(父控件:获取_名称(), "画板_") then
            break
        end
        父控件 = 父控件:获取_父控件()
    end
end

---@param 公式 string
---@return self
function M:设置_绑定_公式(公式)
    GameAPI.set_ui_comp_bind_format(self.player.handle, self.handle, 公式)
    return self
end

local 控件存储值 = {}


---@param 名 string|integer
---@param 值 any
function M:设置存储值(名, 值)
    if 控件存储值[self.player.id][self.handle] == nil then
        控件存储值[self.player.id][self.handle] = {}
    end
    控件存储值[self.player.id][self.handle][名] = 值
end

---@param 名 string|integer
---@return any
function M:获取存储值(名)
    if 控件存储值[self.player.id][self.handle] == nil then
        return nil
    end
    return 控件存储值[self.player.id][self.handle][名]
end

---@return UIPrefab
function M:获取所属元件()
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.元件.从handle获取(self.player, GameAPI.get_ui_comp_prefab(self.player.handle, self.handle))
end

y3.游戏:事件("游戏-初始化", function(trg, data)
    y3.玩家组.获取所有玩家():遍历(function(索引, 遍历到的玩家)
        控件存储值[遍历到的玩家.id] = {}
    end)
end)
