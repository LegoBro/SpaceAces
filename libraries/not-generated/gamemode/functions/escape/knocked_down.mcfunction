team join red @s
fill ~ ~1 ~ ~ ~1 ~ creeper_head replace air
effect give @s minecraft:jump_boost 1 129 true
effect give @s minecraft:slowness 1 100 true
effect give @s minecraft:weakness 1 100 true
effect give @s hunger 1 10 true
scoreboard players set @s health 0
scoreboard players set @s rightClick -1
execute if entity @p[team=blue,tag=escape,distance=..5,tag=hb_crouched_player] run scoreboard players add @s i 1
execute if score @s i matches 100.. run function gamemode:escape/revive
