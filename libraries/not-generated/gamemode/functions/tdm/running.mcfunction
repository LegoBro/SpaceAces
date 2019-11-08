#Commands ran for tdm
bossbar set main players
bossbar set minecraft:blue players @a
bossbar set minecraft:red players @a
execute store result bossbar minecraft:blue value run scoreboard players get blue_lives Numbers
execute store result bossbar minecraft:red value run scoreboard players get red_lives Numbers
execute as @a[scores={health=..0,fire=..-20},tag=in_game,team=blue] run scoreboard players remove blue_lives Numbers 1
execute as @a[scores={health=..0,fire=..-20},tag=in_game,team=red] run scoreboard players remove red_lives Numbers 1
execute if score blue_lives Numbers matches ..0 run team join spectator @a[scores={health=..0},tag=in_game,team=blue]
execute if score red_lives Numbers matches ..0 run team join spectator @a[scores={health=..0},tag=in_game,team=red]
gamemode spectator @a[tag=in_game,team=spectator]
tag @a[tag=in_game,team=spectator] remove in_game
execute as @a[tag=in_game,scores={health=..0,fire=..-20}] run tp @s @e[type=item_frame,tag=general_spawn,limit=1,sort=random]
execute at @a[scores={health=..0,fire=..-20},tag=in_game] run playsound minecraft:item.totem.use player @a ~ ~ ~ 50 2 1
tp @a[tag=in_game,scores={health=..0,fire=-19..}] -2 201 4
execute as @a[scores={health=..0,fire=..-20},tag=in_game] at @s run tp @s ~ ~ ~ 0 0
execute as @a[scores={health=..0,fire=..-20},tag=in_game] at @s run function gamemode:respawn
execute unless entity @a[tag=in_game,team=blue] unless entity @a[tag=in_game,team=red] run scoreboard players set ActiveMode Numbers 0
execute if entity @a[tag=in_game,team=red] unless entity @a[tag=in_game,team=blue] run function gamemode:red_win
execute if entity @a[tag=in_game,team=blue] unless entity @a[tag=in_game,team=red] run function gamemode:blue_win
replaceitem entity @a[tag=in_game] hotbar.8 air
