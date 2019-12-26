function enemies:tick
execute store result score enemiesLeft Numbers if entity @e[tag=bot]
execute store result bossbar minecraft:main value run scoreboard players get waveDelay Numbers
scoreboard players remove waveDelay Numbers 1
execute if score waveDelay Numbers matches 61.. if score wave Numbers matches 2.. if score enemiesLeft Numbers matches 0 run scoreboard players set waveDelay Numbers 60
execute if score waveDelay Numbers matches ..0 run function gamemode:escape/wave/finder
scoreboard players operation Energy display = currency Numbers
scoreboard players operation Wave display = wave Numbers
scoreboard players set @a[tag=escape,tag=no_2] activate_second 2
scoreboard players set @a[tag=escape,tag=no_3] activate_third 2
data merge block 29889 2 19 {Text2:'{"translate":"unlock","clickEvent":{"action":"run_command","value":"function gamemode:escape/purchase/secondary"}}',Text3:'{"translate":"secondary"}'}
data merge block 30012 16 -45 {Text2:'{"translate":"unlock","clickEvent":{"action":"run_command","value":"function gamemode:escape/purchase/tertiary"}}',Text3:'{"translate":"tertiary"}'}
execute as @a[tag=escape,team=blue] at @s run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace creeper_head
execute as @a[tag=escape,scores={health=..0},team=!spectator] at @s unless block ~ ~-1 ~ air run function gamemode:escape/knocked_down
execute as @e[type=armor_stand,tag=north,tag=door,tag=opening] at @s run tp @s ~ ~ ~-.1
execute as @e[type=armor_stand,tag=north,tag=door,tag=opening] at @s unless block ~ ~ ~4 air run kill @s
execute as @e[type=armor_stand,tag=south,tag=door,tag=opening] at @s run tp @s ~ ~ ~.1
execute as @e[type=armor_stand,tag=south,tag=door,tag=opening] at @s unless block ~ ~ ~-4 air run kill @s
execute as @e[type=armor_stand,tag=up,tag=door,tag=opening] at @s run tp @s ~ ~.1 ~
execute as @e[type=armor_stand,tag=up,tag=door,tag=opening] at @s unless block ~ ~ ~ air unless block ~ ~-1 ~ air run kill @s
execute as @e[type=armor_stand,tag=east,tag=door,tag=opening] at @s run tp @s ~.1 ~ ~
execute as @e[type=armor_stand,tag=east,tag=door,tag=opening] at @s unless block ~-4 ~ ~ air run kill @s
execute as @e[type=armor_stand,tag=west,tag=door,tag=opening] at @s run tp @s ~-.1 ~ ~
execute as @e[type=armor_stand,tag=west,tag=door,tag=opening] at @s unless block ~4 ~ ~ air run kill @s
replaceitem entity @a[tag=escape,scores={ypos=14..29}] hotbar.8 filled_map{map:7}
replaceitem entity @a[tag=escape,scores={ypos=..13}] hotbar.8 filled_map{map:11}
replaceitem entity @a[tag=escape,scores={ypos=30..}] hotbar.8 filled_map{map:8}
scoreboard players set @a[team=red,scores={health=1..},tag=escape] health 0
tag @e[type=item_frame,tag=spawner,tag=active] remove active
execute as @a[tag=escape,team=blue] at @s run tag @e[type=item_frame,tag=spawner,limit=1,sort=nearest] add active
execute as @e[type=area_effect_cloud,tag=terminal,tag=active] at @s if entity @p[team=blue,tag=escape,distance=..5,tag=hb_crouched_player] run function gamemode:escape/terminal
execute store result score Terminals display if entity @e[type=area_effect_cloud,tag=terminal,tag=!active]
bossbar set minecraft:main name {"text":"Next Wave"}

# Win/Lose Conditions
execute unless entity @a[tag=escape,scores={health=1..}] run function gamemode:escape/death
execute if score wave Numbers matches 40.. unless entity @e[tag=bot] run function gamemode:escape/win
execute if score Terminals display matches 4.. positioned 29963 3 41 unless entity @a[tag=escape,distance=5..] run function gamemode:escape/win
