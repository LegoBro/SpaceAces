execute if entity @s[team=blue] run scoreboard players set @p[team=blue,distance=0.1..32] over_heal 200
execute if entity @s[team=red] run scoreboard players set @p[team=red,distance=0.1..32] over_heal 200
execute as @a[tag=maxless] at @s run particle minecraft:block sea_lantern ~ ~1 ~ .2 .5 .2 0 50 force @a
playsound minecraft:entity.zombie_villager.converted player @a ~ ~ ~ 1 2 0
