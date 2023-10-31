# y3-lualib

这是Y3编辑器的Lua开发框架，旨在帮助 **纯Lua开发者** 更好的开发地图。
本项目希望可以和广大用户共同开发此框架，因此希望大家可以积极提出建议，包括框架设计也可以提出自己的想法一起讨论。

# 快速开始

使用Y3编辑器创建一张地图，然后将地图内的 `script/y3` 目录替换为此工程即可

> 为了方便编程，你可以双击运行一下 `script/y3/初始化配置.bat`，他可以帮你配置插件环境与调试器

> 注意：如果你是用的编辑器是1.0版本，请将此项目的分支切换到 `1.0`

# Q&A

### 该框架的代码与“ECA转Lua”的代码有什么关系？

绝大部分的接口会保持兼容，但是对于纯Lua作者来说，很多功能有更好的实现方式。比如ECA中的动作“将整数加一”在“ECA转Lua”时会生成函数调用，但在此框架中该函数被移除了。
而触发器、事件等功能也会和ECA中的有较大差异，利用Lua的语言特性使用了更加方便Lua开发的形式。

### 我看很多函数都是简单的转发，是否可以直接调用CAPI？

尽量不要直接调用。因为目前已经有计划修改CAPI，直接调用CAPI可能会在未来产生兼容性问题。

### ECA与Lua协同开发时，ECA如何调用Lua函数？

ECA可以直接执行Lua代码，你也可以参考[此代码](./演示/ECA调用Lua函数.lua)注册一个绑定函数供ECA调用。

# 使用VSCode进行附加调试

1. VSCode在扩展市场中搜索安装插件 `actboy168.lua-debug`。
2. 将 `script/y3/演示/项目配置/launch.json` 复制到 `script/.vscode/launch.json`。
3. 启动游戏后，点击 `F5` 开始调试。

> 通常调试器附加成功时已经错过了游戏初始化时机，如果你想要追踪初始化相关的代码，可以在相关代码前面加一行 `LDBG:event 'wait'`。当游戏执行到此行代码时，游戏会“卡主”，直到调试器附加完成才会继续往下执行。

### 已知问题

* 无法追踪一些内部函数的执行。
* 由于修改了浮点数的实现（替换为了定点数），在调试器中查看浮点数的数值会不正确
* 触发异常断点后偶现游戏闪退

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
