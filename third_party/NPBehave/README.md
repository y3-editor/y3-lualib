# LuaNPBehave

[NPBehave](https://github.com/meniku/NPBehave/tree/2.0-dev) 的`lua`实现, API 基本一致, 但为了避免歧义, 修改了以下函数命名: 

```lua
DoStop->DoCancel
Stop->CancelWithoutReturnResult
```


具有完善的类型系统, 语言分析服务插件为: [sumneko.lua](https://github.com/LuaLS/lua-language-server) 