effect give @a[team=!lobby] resistance 30 4 true
execute as @e store result score @s fire run data get entity @s Fire
scoreboard players add @e[scores={fire=1..},nbt=!{ActiveEffects:[{Id:12b}]},type=!item_frame,type=!arrow] raw_damage 3
scoreboard players add @e[nbt={ActiveEffects:[{Id:27b}]}] raw_damage 2
execute as @e[tag=entity] store result score @s displayHealth run data get entity @s Health
execute as @e[tag=entity] if score @s health > @s displayHealth run scoreboard players operation @s damage -= @s displayHealth
execute as @e[tag=entity] if score @s health > @s displayHealth run scoreboard players operation @s damage += @s health
execute as @e[scores={raw_damage=10..}] run function health:update
execute as @e[scores={2xdamage=1..}] run function health:update
execute as @e[scores={damage=1..},tag=!raycast] run function health:update
execute as @e[scores={healing=1..},tag=!turret_base] run function health:update
execute as @a[team=blue] if entity @s[nbt=!{Inventory:[{Slot:100b,id:"minecraft:leather_boots"}]}] if entity @s[nbt=!{Inventory:[{Slot:100b,id:"minecraft:chainmail_boots"}]}] run function health:update_armor_blue
execute as @a[team=red] if entity @s[nbt=!{Inventory:[{Slot:100b,id:"minecraft:leather_boots"}]}] if entity @s[nbt=!{Inventory:[{Slot:100b,id:"minecraft:golden_boots"}]}] run function health:update_armor_red
scoreboard players add @e[tag=health_pack,type=item_frame] i 1
scoreboard players add @e[tag=health_pack,scores={i=10}] j 1
scoreboard players set @e[tag=weak_health,scores={j=51..}] j 50
scoreboard players set @e[tag=strong_health,scores={j=101..}] j 100
scoreboard players reset @e[tag=health_pack,scores={i=10..}] i
execute as @e[tag=health_pack,scores={j=1..}] at @s if entity @p[distance=...5,team=!spectator] run scoreboard players operation @p healing += @s j
execute as @e[tag=health_pack,tag=weak_health,scores={j=50..}] at @s if entity @p[distance=...5,team=!spectator] run effect give @p saturation 4 0 true
execute as @e[tag=health_pack,tag=weak_health,scores={j=50..}] at @s if entity @p[distance=...5,team=!spectator] run playsound minecraft:health_pack master @a ~ ~ ~ 1 2
execute as @e[tag=health_pack,tag=strong_health,scores={j=100..}] at @s if entity @p[distance=...5,team=!spectator] run effect give @p saturation 4 0 true
execute as @e[tag=health_pack,tag=strong_health,scores={j=100..}] at @s if entity @p[distance=...5,team=!spectator] run playsound minecraft:health_pack master @a ~ ~ ~ 1 1
execute as @e[tag=health_pack,scores={j=1..}] at @s if entity @p[distance=...5,team=!spectator] run scoreboard players set @s j 0
scoreboard players add @a[scores={displayHealth=..2},team=!spectator,team=!lobby] lowHealth 1
scoreboard players add @a[scores={displayHealth=..1,lowHealth=..39},team=!spectator,team=!lobby] lowHealth 1
scoreboard players add @a[scores={displayHealth=..0,lowHealth=..39},team=!spectator,team=!lobby] lowHealth 1
execute as @a[scores={lowHealth=40}] at @s run playsound minecraft:block.note_block.basedrum player @a ~ ~ ~ 1 1.5 0
execute as @a[scores={lowHealth=43}] at @s run playsound minecraft:block.note_block.basedrum player @a ~ ~ ~ 1 1.75 0
execute as @a[scores={lowHealth=1..}] unless score @s lowHealth matches ..44 run scoreboard players reset @s lowHealth
execute as @a[scores={lowHealth=1..}] unless score @s displayHealth matches ..2 run scoreboard players reset @s lowHealth
execute as @a[scores={lowHealth=1..},team=!red,team=!blue] run scoreboard players reset @s lowHealth
