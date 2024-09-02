local helper = require 'y3.develop.helper.helper'

---输入框的可选项，完全照抄的 VSCode 的接口
---@class Develop.Helper.InputBox.Optional
---@field title? string # 标题
---@field value? string # 初始值
---@field valueSelection? [integer, integer] # 初始选中的文本范围(光标位置，第一个字符前为0)
---@field prompt? string # 提示
---@field placeHolder? string # 占位符
---@field password? boolean # 是否是密码框
---@field ignoreFocusOut? boolean # 是否在失去焦点时关闭
---@field validateInput? fun(value: string): string | nil # 返回一个错误消息表示输入不合法

---@class Develop.Helper.InputBox: Develop.Helper.InputBox.Optional
---@overload fun(optional?: Develop.Helper.InputBox.Optional): Develop.Helper.InputBox
local M = Class 'Develop.Helper.InputBox'

---@private
M.maxID = 0

---@private
---@type table<integer, Develop.Helper.InputBox>
M.inputBoxMap = {}

---@param optional? Develop.Helper.InputBox.Optional
function M:__init(optional)
    M.maxID = M.maxID + 1
    self.id = M.maxID

    if optional then
        for k, v in pairs(optional) do
            self[k] = v
        end
    end
end

function M:__del()
    M.inputBoxMap[self.id] = nil
end

---删除输入框
function M:remove()
    Delete(self)
end

---显示输入框
---@param callback fun(value?: string) # 输入完成后的回调函数。如果用户取消输入，`value` 为 `nil`。
function M:show(callback)
    M.inputBoxMap[self.id] = self
    helper.request('showInputBox', {
        id = self.id,
        title = self.title,
        value = self.value,
        valueSelection = self.valueSelection,
        prompt = self.prompt,
        placeHolder = self.placeHolder,
        password = self.password,
        ignoreFocusOut = self.ignoreFocusOut,
        hasValidateInput = type(self.validateInput) == 'function',
    }, function (data)
        self:remove()
        callback(data)
    end)
end

helper.registerMethod('inputBoxValidate', function (params)
    local inputBox = M.inputBoxMap[params.id]
    if not inputBox then
        return nil
    end
    return inputBox.validateInput(params.input)
end)

return M
