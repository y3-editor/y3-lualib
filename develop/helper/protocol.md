# 游戏 -> Y3开发助手

## print

在“终端”窗口打印消息

* `message`: `string` 要打印的内容

## createTreeView

创建树形视图

* `id`: `integer` 视图的唯一ID
* `name`: `string` 视图的名称
* `root`: `integer` 主节点的唯一ID

## removeTreeView

删除树形视图

* `id`: `integer` 视图的唯一ID

## refreshTreeNode

通知一下节点发生了变化

* `id`: `integer` 节点的唯一ID
* `complete?`: `boolean` 是否是个完整推送。如果不是，之后助手可以用 `getTreeNode` 重新获取数据
* `name?`: `string` 节点的名称
* `desc?`: `string` 节点的描述
* `tip?`: `string` 悬停提示
* `icon?`: `string` 节点的图标
* `check?`: `boolean` 当前的复选框状态
* `hasChilds?`: `boolean` 是否可以展开
* `canClick?`: `boolean` 是否可以点击

## command

执行命令，内置命令参考 https://code.visualstudio.com/api/references/commands

* `command`: `string` 命令
* `args?`: `any[]` 参数

返回 `any`

## prepareForRestart

通知开发助手游戏即将重启

* `debugger?`: `boolean` 是否需要启动调试器。如果省略，会根据当前是否附加了调试器来决定是否需要调试器。

## showInputBox

创建一个输入框

* `id`: `integer` 唯一ID
* `title?`: `string` 标题
* `value?`: `string` 初始值
* `valueSelection?`: `[integer, integer]` 初始选中的文本范围(光标位置，第一个字符前为0)
* `prompt?`: `string` 提示
* `placeHolder?`: `string` 占位符
* `password?`: `boolean` 是否是密码框
* `ignoreFocusOut?`: `boolean` 是否在失去焦点时关闭
* `hasValidateInput?`: `boolean` 是否有 `validateInput` 回调

返回输入结果

* `input?`: `string` 输入的内容。

# Y3开发助手 -> 游戏

## command

执行命令，如 `.rd` ， `1 + 2`，无返回值

* `data`: `string` 要执行的命令

## getTreeNode

获取树形视图节点

* `id`: `integer` 节点的唯一ID

返回节点的数据

* `name`: `string` 节点的名称
* `desc?`: `string` 节点的描述
* `tip?`: `string` 悬停提示
* `icon?`: `string` 节点的图标
* `check?`: `boolean` 当前的复选框状态
* `hasChilds?`: `boolean` 是否可以展开
* `canClick?`: `boolean` 是否可以点击

## getChildTreeNodes

获取树形视图节点的子节点

* `id`: `integer` 节点的唯一ID

返回子节点的唯一ID数组

* `childs`: `integer[]` 子节点的唯一ID数组

## changeTreeNodeVisible

树形视图节点的可见性变化

* `ids`: `integer` 节点的唯一ID数组
* `visible`: `boolean` 是否可见

## clickTreeNode

点击了树形视图节点

* `id`: `integer` 节点的唯一ID

## changeTreeNodeExpanded

树形视图展开状态变化

* `id`: `integer` 节点的唯一ID
* `expanded`: `boolean` 是否展开

## inputBoxValidate

检查输入框的输入合法性

* `id`: `integer` 输入框的唯一id
* `input`: `string` 输入的内容

## changeTreeNodeCheckBox

树形视图节点复选框变化

* `id`: `integer` 节点的唯一ID
* `checked`: `boolean` 是否被勾选
