`2023-7-27`

`修改`

* `y3.game.get_max_tech_level` -> `y3.game.get_tech_max_level`
* `y3.game.get_tech_type_description` -> `y3.game.get_tech_description`
* `y3.game.get_tech_type_name` -> `y3.game.get_tech_name`
* `y3.game.start_new_round_of_game` -> `y3.game.restart_game`
* `y3.game.set_damage_factor` -> `y3.game.set_damage_ratio`
* `y3.game.set_game_time_elapsing_rate` -> `y3.game.set_day_night_speed`
* `y3.game.set_game_time` -> `y3.game.set_day_night_time`
* `y3.game.create_artificial_time` -> `y3.game.create_day_night_human_time`
* `y3.game.toggle_time_elapsing_is_on` -> `y3.game.toggle_day_night_time`
* `y3.game.toggle_target_point_grassland_is_on` -> `y3.game.enable_grass_by_pos`
* `y3.game.get_current_game_time` -> `y3.game.get_day_night_time`
* `y3.game.get_damage_factor` -> `y3.game.get_damage_ratio`
* `y3.game.get_coefficient` -> `y3.game.get_compound_attributes`
* `y3.game.get_game_environment_of_current_round` -> `y3.game.get_start_mode`
* `y3.game.if_pri_attr_state_open` -> `y3.game.is_compound_attributes_enabled`

`移除`

* 所有和table相关的API，请改用Lua自己的API。
* 所有用于事件响应获取参数的API，请在事件的回调参数中获得。
* `y3.game.get_local_language_environment`
* `y3.game.get_mover_bound_projectiles`
* `y3.game.get_ability_owner`，改用 `Ability:get_owner()`
* `y3.game.modifier_provider`，改用 `Buff:get_source()`
* `y3.game.get_number_interval`，改用 `y3.math.isBetween`
