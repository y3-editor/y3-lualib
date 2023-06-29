# y3-lualib

这是Y3编辑器的Lua开发框架，旨在帮助 **纯Lua开发者** 更好的开发地图。
本项目希望可以和广大用户共同开发此框架，因此希望大家可以积极提出建议，包括框架设计也可以提出自己的想法一起讨论。

# 快速开始

使用Y3编辑器创建一张地图，然后将地图内的 `script/y3` 目录替换为此工程即可

# Q&A

### 该框架的代码与“ECA转Lua”的代码有什么关系？

绝大部分的接口会保持兼容，但是对于纯Lua作者来说，很多功能有更好的实现方式。比如ECA中的动作“将整数加一”在“ECA转Lua”时会生成函数调用，但在此框架中该函数被移除了。
而触发器、事件等功能也会和ECA中的有较大差异，利用Lua的语言特性使用了更加方便Lua开发的形式。

### 我看很多函数都是简单的转发，是否可以直接调用CAPI？

尽量不要直接调用。因为目前已经有计划修改CAPI，直接调用CAPI可能会在未来产生兼容性问题。

# 工程结构

<pre>

📦 y3/
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

# 已知问题

### Lua的数字由于浮点数误差问题可能会造成客户端之间不同步

未来会将Lua的数字实现改为定点数

### 给对象注册事件会产生泄露

正在讨论解决方法

# 想要做的事情

- [ ] 可以不用打开编辑器直接运行地图
- [ ] 可以重启游戏并应用新的Lua代码
  - [ ] 可以在游戏内直接应用新的Lua代码（热重载）
- [ ] Lua专用的日志系统
- [ ] Lua调试器
- [ ] 枚举值使用更加友好的表示方式
