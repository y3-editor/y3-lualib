# API问题

1. `ability` 的 `api_set_str_attr` 的 `attr` 参数，Lua会传入字符串 `"desc"` ，但是py的类型定义为 `AbilityStrAttr(UInt32)` 。
    
    该py函数会内部会调用 `setattr(self, attr, value)` 函数，此函数的签名为
    ```python
    (function) def setattr(
        __obj: object,
        __name: str,
        __value: Any,
        /
    ) -> None
    ```

2. 很多API会混用 `FPoint`, `Point`, `FVector3`, `Vector3`。

    在代码中搜索 "问题2" 查找所有此类API。

    目前这些类型在Python的定义为：

    1. `FPoint` 继承自 `FVector3`
    2. `Point` 继承自 `Vector3`
    3. `FVector3` 与 `Vector3` 均继承自 `ETypeMeta`

3. API `create_projectile_in_scene_new` 的第3个参数 `owner_unit_or_player` 语义为单位或玩家，但是注解的类型为 `Actor`，而玩家 `Role` 并不是 `Actor` 的子类。

4. API `GameAPI.create_unit` 的第4个参数 `role_or_unit` 语义和实现为单位或玩家，但是类型注解只写了 `Role`

5. API `get_visibility_of_unit` 的第1个参数 `role_or_unit` 语义为单位或玩家，但是类型注解只写了 `Role`

6. API `create_spot_light_to_point` 的第3个参数 `target` 实现中包含了 `Point`，但是类型标注为 `Actor` 不包含 `Point`。

7. API `play_ui_comp_anim` 使用不定参无法生成正确的文档。

8. 运动器相关的API支持 `Unit` 与 `Projectile`,但是注解只写了 `Unit``

# 备忘

1. Lua的 `Number` 实现是 `double` ，可能会造成不同步，建议修改Lua代码将实现改为自定义的定点数。

2. Lua注册对象的事件后不会释放，会产生内存泄露。
