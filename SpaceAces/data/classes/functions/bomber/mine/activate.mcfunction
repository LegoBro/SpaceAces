execute if entity @s[team=blue] run summon armor_stand ~ ~-.95 ~ {Small:1b,NoGravity:1b,Invisible:1b,Team:"blue",Tags:["mine","hb_mine","entity"],ArmorItems:[{},{},{},{id:"minecraft:turtle_helmet",Count:1b}]}
execute if entity @s[team=red] run summon armor_stand ~ ~-.95 ~ {Small:1b,NoGravity:1b,Invisible:1b,Team:"red",Tags:["mine","hb_mine","entity"],ArmorItems:[{},{},{},{id:"minecraft:turtle_helmet",Count:1b}]}
scoreboard players set @e[type=armor_stand,tag=mine,tag=!prepared] maxHealth 25
scoreboard players set @e[type=armor_stand,tag=mine,tag=!prepared] health 25
tag @e[type=armor_stand,tag=mine,tag=!prepared] add prepared
playsound minecraft:block.tripwire.click_on player @a ~ ~ ~ 1 1.5 0
