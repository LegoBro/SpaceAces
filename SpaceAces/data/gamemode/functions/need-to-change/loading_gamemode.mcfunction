#Commands ran to allow the normal mode to kick-start
scoreboard players add Prestart Numbers 1
execute if score Prestart Numbers matches 2 as @a[tag=in_game] at @s run playsound countdown voice @s ~ ~ ~ 50 1 1
bossbar set main name ["",{"text":"Loading...","color":"white"}]
bossbar set main players @a[tag=in_game]
bossbar set main max 120
execute store result bossbar main value run scoreboard players get Prestart Numbers
execute if score Prestart Numbers matches 120.. run bossbar set main players @a[tag=in_game]
execute if score Prestart Numbers matches 120.. as @e[type=item_frame,tag=blue_spawn] at @s run tp @a[tag=in_game,team=blue] ~ ~.5 ~
execute if score Prestart Numbers matches 120.. as @e[type=item_frame,tag=red_spawn] at @s run tp @a[tag=in_game,team=red] ~ ~.5 ~
execute if score Prestart Numbers matches 119 as @a[tag=in_game] at @s run function gamemode:respawn
