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

`移除`

* 所有和table相关的API，请改用Lua自己的API。
