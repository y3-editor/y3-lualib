local game_main_ui = y3.ui.get_ui(y3.player(1), 'GameMain')
game_main_ui:set_visible(true)

local head_info_ui = game_main_ui:get_child('HeadInfo')

-- 波次ui，例如 波次：1/5
assert(head_info_ui)
local batch_info_ui = head_info_ui:get_child('HeadInfo_BatchInfo')

assert(batch_info_ui)
local batch_info_txt = batch_info_ui:get_child('BatchInfo_TEXT')

---@param batch_index integer 刷的第几波怪
---@param total_batch_count integer 总共刷几波怪
local function update_batch_info(batch_index, total_batch_count)
    assert(batch_info_txt)
    batch_info_txt:set_text('波次:' .. batch_index .. '/' .. total_batch_count)
end

-- 初始时为0 0
update_batch_info(0, 0)

-- 每当刷怪的时候，更新此ui
y3.game:event_on('刷怪', function(_, data)
    update_batch_info(data.波次, data.总波次)
end)
