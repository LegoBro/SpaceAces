#Runs when as a new player when they join/rejoin/remove from spectating
tp @s 8 200 8
scoreboard players set @s reload 0
scoreboard players set @s rightClick 0
scoreboard players set @s shoot 0
scoreboard players set @s totalShots 0
scoreboard players set @s Class 2
scoreboard players set @s activate_second 0
scoreboard players set @s activate_third 0
scoreboard players set @s crouching 0
scoreboard players set @s health 100
execute unless score @s id matches 0.. run scoreboard players add Player_Amount Numbers 1
execute unless score @s id matches 0.. run scoreboard players operation @s id = Player_Amount Numbers
team join lobby @s
gamemode adventure
tag @s add spawned
tag @s add hb_player
tag @s remove trainee
tag @s remove awaiting
clear @s
