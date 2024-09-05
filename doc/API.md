# [Ability](API/Ability.md) 技能

# [Area](API/Area.md) 区域

# [Await](API/Await.md) 

# [Beam](API/Beam.md) 闪电特效（光束）

# [Buff](API/Buff.md) 魔法效果

# [Camera](API/Camera.md) 镜头

# [Cast](API/Cast.md) 施法实例

会在施法相关的事件中传递

# [ClientTimer](API/ClientTimer.md) 客户端计时器

由你自己电脑的CPU驱动的计时器，完全是异步的（即使是同步执行）
在游戏暂停时也会继续计时并回调
> 如果你不知道什么是异步，请不要使用这个模块！

# [Config](API/Config.md) 配置

可以设置日志、同步等相关的配置

# [DamageInstance](API/DamageInstance.md) 伤害实例

会在伤害相关的事件中传递

# [Destructible](API/Destructible.md) 可破坏物

# [Develop](API/Develop.md) 

# [ECAFunction](API/ECAFunction.md) 注册ECA函数

可以使用该功能让lua函数在ECA中被调用。

# [ECAHelper](API/ECAHelper.md) 

# [EditorObject](API/EditorObject.md)  物体编辑器

# [Enum](API/Enum.md) 

# [GCBuffer](API/GCBuffer.md) 

# [Game](API/Game.md) 游戏接口

# [Ground](API/Ground.md) 地面

地面碰撞相关方法

# [HealInstance](API/HealInstance.md) 治疗实例

在治疗相关的事件中传递

# [HttpRequestOptions](API/HttpRequestOptions.md) 

# [Item](API/Item.md) 物品

# [ItemGroup](API/ItemGroup.md) 物品组

# [KKNetwork](API/KKNetwork.md) 

# [Light](API/Light.md) 光照

用来修改光照、阴影等效果

# [LocalPlayer](API/LocalPlayer.md) 

# [LocalTimer](API/LocalTimer.md) 本地计时器

支持异步创建或回调（只要你自己保证不会引发其他不同步的问题）
如果是同步执行的，那么会确保同步回调

# [LocalUILogic](API/LocalUILogic.md) 本地UI逻辑框架

# [Math](API/Math.md) 数学库

均使用角度制

# [Mover](API/Mover.md) 

# [NPBehave](API/NPBehave.md) 

# [NPBehaveBlackboardType](API/NPBehaveBlackboardType.md) ```lua

{
    Add: string = Add,
    Remove: string = Remove,
    Change: string = Change,
}
```

# [NPBehaveClassName](API/NPBehaveClassName.md) ```lua

{
    Node: string = NPBehave.Node,
    Root: string = NPBehave.Root,
    Decorator: string = NPBehave.Decorator.Decorator,
    ObservingDecorator: string = NPBehave.Decorator.ObservingDecorator,
    BlackboardCondition: string = NPBehave.Decorator.BlackboardCondition,
    Service: string = NPBehave.Decorator.Service,
    BlackboardQuery: string = NPBehave.Decorator.BlackboardQuery,
    Condition: string = NPBehave.Decorator.Condition,
    Cooldown: string = NPBehave.Decorator.Cooldown,
    Failer: string = NPBehave.Decorator.Failer,
    Hook: string = NPBehave.Decorator.Hook,
    Inverter: string = NPBehave.Decorator.Inverter,
    Observer: string = NPBehave.Decorator.Observer,
    Random: string = NPBehave.Decorator.Random,
    Repeater: string = NPBehave.Decorator.Repeater,
    Succeeder: string = NPBehave.Decorator.Succeeder,
    TimeMax: string = NPBehave.Decorator.TimeMax,
    TimeMin: string = NPBehave.Decorator.TimeMin,
    WaitForCondition: string = NPBehave.Decorator.WaitForCondition,
    Composite: string = NPBehave.Composite.Composite,
    Sequence: string = NPBehave.Composite.Sequence,
    Parallel: string = NPBehave.Composite.Parallel,
    Selector: string = NPBehave.Composite.Selector,
    RandomSelector: string = NPBehave.Composite.RandomSelector,
    RandomSequence: string = NPBehave.Composite.RandomSequence,
    Action: string = NPBehave.Task.Action,
    Task: string = NPBehave.Task.Task,
    WaitUntilStopped: string = NPBehave.Task.WaitUntilStopped,
    Wait: string = NPBehave.Task.Wait,
}
```

# [NPBehaveTaskActionRequest](API/NPBehaveTaskActionRequest.md) ```lua

{
    Start: string = Start,
    Update: string = Update,
    Cancel: string = Cancel,
}
```

# [NPBehaveTaskActionResult](API/NPBehaveTaskActionResult.md) ```lua

{
    Success: string = Success,
    Failed: string = Failed,
    Blocked: string = Blocked,
    Progress: string = Progress,
}
```

# [Network](API/Network.md) 

# [Particle](API/Particle.md) 粒子特效

# [Player](API/Player.md) 玩家

# [PlayerGroup](API/PlayerGroup.md) 玩家组

# [Point](API/Point.md) 点

# [Pool](API/Pool.md) 

# [Projectile](API/Projectile.md) 投射物

# [ProjectileGroup](API/ProjectileGroup.md) 投射物组

# [PyProxy](API/PyProxy.md) 

# [Reload](API/Reload.md) 热重载

热重载相关的方法，详细请看 `演示/热重载`。

# [Road](API/Road.md) 路径

# [SDBMHash](API/SDBMHash.md) 

# [SandBox](API/SandBox.md) 

# [SaveData](API/SaveData.md) 存档

# [Selector](API/Selector.md) 选取器

用来选取某个区域内的单位

# [ServerTime](API/ServerTime.md) 

# [Shape](API/Shape.md) 形状

# [SortedDictionary](API/SortedDictionary.md) 

# [Sound](API/Sound.md) 声音

# [Sync](API/Sync.md)  将本地数据同步给所有玩家

# [Synthesis](API/Synthesis.md) 

# [Technology](API/Technology.md) 科技

# [Timer](API/Timer.md) 同步计时器

所有玩家必须使用一致的计时器，否则会造成不同步

# [Trigger](API/Trigger.md) 触发器

# [UIPrefab](API/UIPrefab.md) 界面元件

# [Unit](API/Unit.md) 单位

# [UnitGroup](API/UnitGroup.md) 单位组

# [UnitTest](API/UnitTest.md) 

# [XDouble](API/XDouble.md) 

# [oslib](API/oslib.md) 

[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-os"])

# [Const](API/Const.md) 

# [y3](API/y3.md) 

