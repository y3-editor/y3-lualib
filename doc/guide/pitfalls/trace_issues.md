> 本文档自动同步自 [y3-maker-config](https://github.com/y3-editor/y3-maker-config/blob/main/memory/lua-issues/trace_issues.md)，请勿直接编辑本文件；如需修改请向源仓库提交 PR。

# Lua Trace 问题归档

> 记录运行期 Trace / stack traceback 类问题，便于后续复用修复经验。
> ⚠️ 每次自动化测试或手动调试遇到 trace 时，必须在此沉淀。

## 记录规范

- 问题现象：简述报错内容或触发场景
- 根因：说明为什么会出现该 Trace
- 解决方案：记录最终有效的修复方式
- 预防建议：总结后续如何避免重复出现

---

## 1. include 路径错误导致模块加载失败

- 时间：2026-05-14
- 场景：热重载时 `include 'td_game'` 报 `module not found`
- Trace：`attempt to call a nil value` — 模块未加载导致后续函数调用 nil
- 根因：`include` 路径基于 `script/` 目录，不需要加前缀。写成 `include 'script/td_game'` 会找不到
- 解决方案：`include 'td_game'`（直接模块名，不含路径前缀）
- 预防建议：include 路径 = 文件名去 `.lua` 后缀，不加目录前缀

---

## 2. 事件回调中 unit 已被移除

- 时间：2026-05-14
- 场景：怪物死亡事件回调中访问 `unit:get_point()`，偶发 nil
- Trace：`attempt to index a nil value (local 'pos')`
- 根因：事件回调时 unit 可能已被 `remove()` 或引擎回收，`get_point()` 返回 nil
- 解决方案：回调内先 `if not unit:is_exist() then return end`
- 预防建议：所有事件回调中操作 unit 前必须 `is_exist()` 守卫

---

*最后更新: 2026-05-15*
