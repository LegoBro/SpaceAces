#Commands ran for setback
bossbar set minecraft:main name ["",{"text":"Point Multiplier","color":"white"}]
bossbar set minecraft:main max 200
scoreboard players add captureSound i 1
execute at @e[type=item_frame,tag=capture_point] if entity @p[team=!spectator,distance=..5] run bossbar set main players @a
execute at @e[type=item_frame,tag=capture_point] unless entity @p[team=!spectator,distance=..5] run bossbar set main players
execute at @e[type=item_frame,tag=capture_point] if score point Numbers matches 0 if entity @p[team=blue,distance=..5] run setblock ~ ~-1 ~ lapis_block
execute at @e[type=item_frame,tag=capture_point] if score point Numbers matches 0 if entity @p[team=red,distance=..5] run setblock ~ ~-1 ~ redstone_block
execute at @e[type=item_frame,tag=capture_point] if score point Numbers matches 0 if entity @p[team=red,distance=..5] if entity @p[team=blue,distance=..5] run setblock ~ ~-1 ~ sea_lantern
execute at @e[type=item_frame,tag=capture_point] if block ~ ~-1 ~ redstone_block run function gamemode:setback/red_control
execute at @e[type=item_frame,tag=capture_point] if block ~ ~-1 ~ lapis_block run function gamemode:setback/blue_control
execute store result bossbar minecraft:main value run scoreboard players get point Numbers
tp @a[tag=in_game,scores={health=..0,fire=-19..}] -2 201 4
tp @a[team=blue,scores={health=..0,fire=..-20},tag=in_game] 6 195 -1 90 0
tp @a[team=red,scores={health=..0,fire=..-20},tag=in_game] 10 195 -1 -90 0
scoreboard players add @a[scores={health=..0,fire=..-20},tag=in_game] i 1
execute as @a[scores={health=..0,fire=..-20},tag=in_game] at @s run function gamemode:respawn
execute as @a[tag=in_game] unless entity @s[scores={i=99..}] run replaceitem entity @s hotbar.8 air
replaceitem entity @a[tag=in_game,scores={i=100..},nbt=!{Inventory:[{Slot:8b,id:"minecraft:carrot_on_a_stick"}]}] hotbar.8 carrot_on_a_stick{display:{Name:"{\"translate\":\"respawn_item\",\"color\":\"white\"}",Lore:["{\"translate\":\"right_click\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11000003,Unbreakable:1}
scoreboard players add @a[scores={i=1..},tag=in_game] i 1
title @a[scores={i=1..},tag=in_game] actionbar ["",{"text":"[","color":"dark_gray","bold":true},{"text":"Respawning","color":"gray","bold":false},{"text":"]","color":"dark_gray"}]
execute as @a[team=blue,scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] if score blueCapture Numbers matches 0..80000 run tp @s @e[type=item_frame,tag=forward_blue_spawn,limit=1]
execute as @a[team=blue,scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] if score blueCapture Numbers matches 80001..160000 run tp @s @e[type=item_frame,tag=middle_blue_spawn,limit=1]
execute as @a[team=blue,scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] if score blueCapture Numbers matches 160001.. run tp @s @e[type=item_frame,tag=blue_spawn,limit=1]
execute as @a[team=red,scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] if score redCapture Numbers matches 0..80000 run tp @s @e[type=item_frame,tag=forward_red_spawn,limit=1]
execute as @a[team=red,scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] if score redCapture Numbers matches 80001..160000 run tp @s @e[type=item_frame,tag=middle_red_spawn,limit=1]
execute as @a[team=red,scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] if score redCapture Numbers matches 160001.. run tp @s @e[type=item_frame,tag=red_spawn,limit=1]
execute as @a[scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] at @s run tp @s ~ ~ ~ 0 0
scoreboard players reset @a[scores={i=100..,rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] i
scoreboard players reset @a[scores={rightClick=1},tag=in_game,nbt={SelectedItemSlot:8}] rightClick
execute if score captureSound i matches 50.. run scoreboard players reset captureSound i
