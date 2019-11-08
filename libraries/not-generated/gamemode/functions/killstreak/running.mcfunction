#Commands ran for killstreak
execute at @a[scores={health=..0},tag=in_game] run playsound minecraft:item.totem.use master @a ~ ~ ~ 50 2 1
execute as @a[scores={health=..0},tag=in_game] run scoreboard players reset @s kills
tp @a[tag=in_game,scores={health=..0,fire=-19..}] -2 201 4
execute as @a[scores={health=..0,fire=..-20},tag=in_game,team=blue] run tp @s @e[limit=1,tag=blue_spawn]
execute as @a[scores={health=..0,fire=..-20},tag=in_game,team=red] run tp @s @e[limit=1,tag=red_spawn]
execute as @a[scores={health=..0,fire=..-20},tag=in_game] at @s run tp @s ~ ~ ~ 0 0
execute as @a[scores={health=..0,fire=..-20},tag=in_game] at @s run function gamemode:respawn
execute unless entity @a[tag=in_game,team=blue] unless entity @a[tag=in_game,team=red] run scoreboard players set ActiveMode Numbers 0
execute if entity @a[tag=in_game,team=red,scores={kills=3..}] run function gamemode:red_win
execute if entity @a[tag=in_game,team=blue,scores={kills=3..}] run function gamemode:blue_win
bossbar set main players
scoreboard objectives modify display displayname {"text":"Killstreaks:","color":"green"}
execute as @a[tag=in_game] run scoreboard players operation @s display = @s kills
replaceitem entity @a[tag=in_game] hotbar.8 air
