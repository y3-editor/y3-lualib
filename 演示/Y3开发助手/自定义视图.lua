--需要安装VSCode扩展《Y3开发助手》，版本 >= 1.8.0

--创建节点的接口名比较长，这里重命名一下：
local Node = y3.develop.helper.createTreeNode

--在Y3开发助手的树形视图上创建一个你的视图
y3.develop.helper.createTreeView('作弊功能', Node('作弊功能', {
    --可用图标请参阅 https://code.visualstudio.com/api/references/icons-in-labels#icon-listing
    icon = 'call-incoming',
    --定义子节点
    childs = {
        Node('回满状态', {
            onClick = function (node)
                --点击事件是本地的，如果你需要联机测试，
                --请使用 `y3.sync` 库进行同步
                y3.player.with_local(function (local_player)
                    local unit = local_player:get_selecting_unit()
                    if unit then
                        unit:set_attr('生命', unit:get_attr("最大生命"))
                        unit:set_attr('魔法', unit:get_attr("最大魔法"))
                    end
                end)
            end
        }),
        Node('杀死单位', {
            onClick = function (node)
                y3.player.with_local(function (local_player)
                    local unit = local_player:get_selecting_unit()
                    if unit then
                        unit:kill_by(unit)
                    end
                end)
            end
        }),
        --一些比较复杂的功能可以封装成函数，
        --但作为演示我就直接写在这里了
        (function ()
            local node = Node('当前选中的单位', {
                description = '无',
            })

            node:bindGC(y3.ltimer.loop(0.2, function ()
                y3.player.with_local(function (local_player)
                    local unit = local_player:get_selecting_unit()
                    if unit then
                        node.description = tostring(unit)
                    else
                        node.description = '无'
                    end
                end)
            end))

            return node
        end)(),
    }
}))

--你一定已经注意到，自定义视图中已经有一个默认的“仪表盘”视图了。
--它的源代码可以在 `y3\develop\helper\explorer.lua` 中找到。
