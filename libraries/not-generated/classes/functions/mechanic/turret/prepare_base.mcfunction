effect give @s health_boost 999999 25 true
effect give @s instant_health 10 15 true
execute if entity @s[team=blue] run summon armor_stand ~ ~-1 ~ {NoGravity:1b,Team:"blue",Small:1b,Marker:1b,Invisible:1b,Tags:["turret","standard"],ArmorItems:[{},{},{},{id:"minecraft:cod",Count:1b}]}
execute if entity @s[team=red] run summon armor_stand ~ ~-1 ~ {NoGravity:1b,Team:"red",Small:1b,Marker:1b,Invisible:1b,Tags:["turret","standard"],ArmorItems:[{},{},{},{id:"minecraft:cod",Count:1b}]}
scoreboard players operation @e[type=armor_stand,tag=turret,limit=1,sort=nearest] id = @s id
tag @s add prepared
