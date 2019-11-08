execute if entity @s[team=blue] run summon armor_stand ~ ~-.3 ~ {Pose:{Head:[180f,0f,0f]},NoGravity:1b,Small:1b,Invisible:1b,Team:"blue",Tags:["deployed_health_pack"],ArmorItems:[{},{},{},{id:"minecraft:golden_apple",Count:1b}]}
execute if entity @s[team=red] run summon armor_stand ~ ~-.3 ~ {Pose:{Head:[180f,0f,0f]},NoGravity:1b,Small:1b,Invisible:1b,Team:"red",Tags:["deployed_health_pack"],ArmorItems:[{},{},{},{id:"minecraft:golden_apple",Count:1b}]}
playsound minecraft:entity.evoker.cast_spell player @a ~ ~ ~ 1 1.5 0
