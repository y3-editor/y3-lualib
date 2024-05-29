# Synthesis

## check

```lua
(method) Synthesis:check(items?: any[])
  -> { lost: any[], get: any }|nil
```

传入当前物品栏物品，检查合成

@*param* `items` — 物品栏物品 {"material1", "material2", "material3"}

@*return* — 作为合成素材的物品，合成的结果 {lost:{"material1", "material2"}, get:"target1"}
## get_material_map

```lua
(method) Synthesis:get_material_map()
  -> table<any, table<any, boolean>>
```

返回合成素材字典

@*return* — 合成素材字典
## get_recipes

```lua
(method) Synthesis:get_recipes()
  -> table<any, table<any, integer>>
```

返回配方表

@*return* — 配方表
## get_recipes_by_item

```lua
(method) Synthesis:get_recipes_by_item(item: any)
  -> { parents: any[], children: any[] }
```

根据物品获取其配方

@*param* `item` — 物品

@*return* — 该物品可合成的物品，该物品的合成素材 {parents:{"parent1"}, children:{"child1", "child2"}}
## material_map

```lua
table<any, table<any, boolean>>
```

记录合成素材可以合成的目标物品 {'material1':{'target1':true, 'target2':true}}
## recipes

```lua
table<any, table<any, integer>>
```

记录合成目标和其对应合成素材的出现次数 {'target1':{'material1':2, 'material2':4}}
## register

```lua
(method) Synthesis:register(result: any, ingredients: any[])
```

注册合成配方

@*param* `result` — 合成目标 "target"

@*param* `ingredients` — 合成素材 {"material1", "material2", "material3"}
## target_check

```lua
(method) Synthesis:target_check(target: any, items?: any[])
  -> { needs: any[], lost: any[] }|nil
```

传入目标物品和已有物品，返回结果

@*param* `target` — 目标物品 "target"

@*param* `items` — 物品集合 {"material1", "material2"}

@*return* — 合成还需的素材和会失去的已有合成素材 {needs:{"material3"}, lost:{"material1", "material2"}}

