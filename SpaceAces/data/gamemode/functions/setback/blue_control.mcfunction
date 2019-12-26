execute as @a[team=blue,tag=in_game,distance=..5] if score point Numbers < setRate Numbers run scoreboard players add point Numbers 1
execute as @a[team=red,distance=..5,tag=in_game] if score point Numbers matches -1.. run scoreboard players remove point Numbers 1
bossbar set minecraft:blue players @a
bossbar set minecraft:red players
execute unless entity @a[team=red,tag=in_game,distance=..5] run scoreboard players operation blueCapture Numbers += point Numbers
execute store result bossbar minecraft:blue value run scoreboard players get blueCapture Numbers
execute if score point Numbers matches 0..49 as @a[tag=in_game] at @s if score captureSound i matches 50 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 .5 1
execute if score point Numbers matches 50..99 as @a[tag=in_game] at @s if score captureSound i matches 50 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 1 1
execute if score point Numbers matches 100..149 as @a[tag=in_game] at @s if score captureSound i matches 50 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 1.5 1
execute if score point Numbers matches 150.. as @a[tag=in_game] at @s if score captureSound i matches 50 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 2 1
execute if score blueCapture Numbers >= setScore Numbers run function gamemode:blue_win
