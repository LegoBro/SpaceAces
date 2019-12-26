execute if entity @e[type=villager,tag=randomClass,tag=pilot] run function classes:random
effect clear @s
effect give @s saturation 10 100 true
effect give @s jump_boost 1 255 true
scoreboard players set @s reload 50000
scoreboard players set @s totalShots 0
scoreboard players set @s activate_second 0
scoreboard players set @s activate_third 0
scoreboard players set @s health 1000
scoreboard players set @s healing 1000
playsound entity.player.death master @s ~ ~ ~ 1 0 1
scoreboard players reset @s invis
scoreboard players reset @s invulnerable
scoreboard players reset @s resist
scoreboard players reset @s over_heal
tag @s remove invis
tag @s remove maxless
tag @s remove resist
tag @s remove invulnerable
