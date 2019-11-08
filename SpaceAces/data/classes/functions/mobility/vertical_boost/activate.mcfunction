effect give @s levitation 1 15 true
effect give @s slow_falling 10 0 true
execute if entity @s[team=blue] run scoreboard players add @e[distance=..3,team=red] damage 15
execute if entity @s[team=red] run scoreboard players add @e[distance=..3,team=blue] damage 15
particle flame ~ ~ ~ 0.1 0 0.1 0 15 force
particle cloud ~ ~ ~ .3 0 .3 .1 25 force
playsound gun.heal_pistol player @a ~ ~ ~ 1.0 2.0
