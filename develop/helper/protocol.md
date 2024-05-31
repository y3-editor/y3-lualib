# 游戏 -> Y3开发助手

## print

在“终端”窗口打印消息

* `message`: `string` 要打印的内容

## createTreeView

创建树形视图

* `id`: `integer` 视图的唯一ID
* `name`: `string` 视图的名称
* `root`: `integer` 主节点的唯一ID

## refreshTreeNode

通知一下节点发生了变化，Y3开发助手之后可以用 `getTreeNode` 重新获取数据

* `id`: `integer` 节点的唯一ID

# Y3开发助手 -> 游戏

## command

执行命令，如 `.rd` ， `1 + 2`，无返回值

* `data`: `string` 要执行的命令

## getTreeNode

获取树形视图节点

* `id`: `integer` 节点的唯一ID

返回节点的数据

* `name`: `string` 节点的名称
* `desc`: `string` 节点的描述
* `icon`: `string` 节点的图标
* `hasChilds`: `boolean` 是否可以展开

## getChildTreeNodes

获取树形视图节点的子节点

* `id`: `integer` 节点的唯一ID

返回子节点的唯一ID数组

* `childs`: `integer[]` 子节点的唯一ID数组

## changeTreeNodeVisible

树形视图节点的可见性变化

* `ids`: `integer` 节点的唯一ID数组
* `visible`: `boolean` 是否可见
