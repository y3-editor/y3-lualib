# y3-lualib

这是Y3编辑器的Lua开发框架，旨在帮助 **纯Lua开发者** 更好的开发地图。
本项目希望可以和广大用户共同开发此框架，因此希望大家可以积极提出建议，包括框架设计也可以提出自己的想法一起讨论。

# 快速开始

## 自动初始化
* 使用Y3编辑器创建一张地图，
* 在VSCode中安装扩展 `sumneko.y3-helper`
* 在左侧边栏选择“Y3开发助手”，点击“初始化Y3库”

## 手动初始化
* 使用Y3编辑器创建一张地图，并打开地图目录（默认为 `<地图工程>/maps/EntryMap`）
* 然后将地图内的 `script/y3` 目录替换为此工程
* 你可以双击运行一下 `script/y3/初始化配置.bat`，他可以帮你配置插件环境与调试器
* 使用VSCode打开 `script` 文件夹

> 注意：如果你是用的编辑器是1.0版本，请将此项目的分支切换到 `1.0`

# 演示图

从演示图开始学习Lua!

## 界面

包含：
* 主控面板（头像、属性、技能、物品栏、血条）
* 按住空格或点击头像将镜头聚焦在此单位身上

启用方法：
* 在Lua代码中加入 `require "y3.演示.demo.界面"`
* 在编辑器中点击 `菜单栏` -> `插件` -> `插件商城`，搜索 `LuaLib`，安装 `LuaLib示例-界面`（美术资源）

## 防守图

包含：
* 简单的5波怪物进攻
* 英雄死亡或场上的怪物超过30个后失败
* 消灭所有怪物后胜利

启用方法：
* 在Lua代码中加入 `require "y3.演示.demo.防守图"`
* 在编辑器中点击 `菜单栏` -> `插件` -> `插件商城`，搜索 `LuaLib`，安装 `LuaLib示例-防守图`（英雄、技能、怪物的物编数据）

# Q&A

### 该框架的代码与“ECA转Lua”的代码有什么关系？

绝大部分的接口会保持兼容，但是对于纯Lua作者来说，很多功能有更好的实现方式。比如ECA中的动作“将整数加一”在“ECA转Lua”时会生成函数调用，但在此框架中该函数被移除了。
而触发器、事件等功能也会和ECA中的有较大差异，利用Lua的语言特性使用了更加方便Lua开发的形式。

### 我看很多函数都是简单的转发，是否可以直接调用CAPI？

尽量不要直接调用。因为目前已经有计划修改CAPI，直接调用CAPI可能会在未来产生兼容性问题。

### ECA与Lua协同开发时，ECA如何调用Lua函数？

ECA可以直接执行Lua代码，你也可以参考[此代码](./演示/ECA调用Lua函数.lua)注册一个绑定函数供ECA调用。

### 在Lua中使用的模型与特效无法显示？

我们的模型资源是动态下载的，您需要显式申明你使用的模型。申明方式是在表格编辑器中新建一个表格，然后在里面填入你使用的模型或特效资源ID即可。这张表格无需在游戏中实际使用。

# 使用VSCode进行附加调试

1. VSCode在扩展市场中搜索安装插件 `actboy168.lua-debug`。
2. 将 `script/y3/演示/项目配置/launch.json` 复制到 `script/.vscode/launch.json`。
3. 启动游戏后，点击 `F5` 开始调试。

> 通常调试器附加成功时已经错过了游戏初始化时机，如果你想要追踪初始化相关的代码，可以在相关代码前面加一行 `LDBG:event 'wait'`。当游戏执行到此行代码时，游戏会“卡主”，直到调试器附加完成才会继续往下执行。

# Y3的Lua虚拟机与官方实现有什么差异？能否使用一些不安全的函数？

Y3的Lua虚拟机进行过修改与定制，详细请参阅[这篇文档](./doc/Lua虚拟机.md)。

### 已知问题

* 无法追踪一些内部函数的执行。

# 工程结构

<pre>

📦 y3/
    ├── 📁 <span title="演示代码">演示/</span>
    ├── 📁 <span title="游戏功能相关的实现">game/</span>
    │    ├── 📜 <span title="定义常量与枚举">const.lua</span>
    │    ├── 📜 <span title="实现游戏功能的接口">game.lua</span>
    │    ├── 📜 <span title="一些常用胶水功能">helper.lua</span>
    │    ├── 📜 <span title="转换引擎对象与Lua对象">py_converter.lua</span>
    │    ├── 📜 <span title="绑定引擎事件系统与Lua事件系统">py_event_subscribe.lua</span>
    ├── 📂 <span title="引擎的API元文件">meta/</span>
    ├── 📂 <span title="Lua对象实现">object/</span>
    │    ├── 📁 <span title="在物编中可编辑的对象（仅作为分类）">editable_object/</span>
    │    ├── 📁 <span title="运行时才有的抽象对象（仅作为分类）">runtime_object/</span>
    │    ├── 📁 <span title="在场景中可放置的对象（仅作为分类）">scene_object/</span>
    ├── 📂 <span title="一些通用的Lua工具">tools/</span>
    ├── 📂 <span title="基于此游戏引擎的工具">tools/</span>
    ├── 📜 <span title="调试器配置">debugger.lua</span>
    └── 📜 <span title="Y3库的入口">init.lua</span>

</pre>

# 想要做的事情

见 [开发计划](./开发计划.md)

# 贡献者

![GitHub Contributors Image](https://contrib.rocks/image?repo=y3-editor/y3-lualib)
