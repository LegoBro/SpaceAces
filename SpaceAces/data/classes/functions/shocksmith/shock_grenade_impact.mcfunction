execute if entity @s[tag=blue] run effect give @a[team=red,distance=..3] hunger 5 5
execute if entity @s[tag=blue] run scoreboard players add @e[team=red,distance=..3] damage 5
execute if entity @s[tag=blue] run effect give @a[team=blue,distance=..3] saturation 1 0
execute if entity @s[tag=blue] run scoreboard players add @a[team=blue,distance=..3] healing 5
execute if entity @s[tag=red] run effect give @a[team=blue,distance=..3] hunger 5 5
execute if entity @s[tag=red] run scoreboard players add @e[team=blue,distance=..3] damage 5
execute if entity @s[tag=red] run effect give @a[team=red,distance=..3] saturation 1 0
execute if entity @s[tag=red] run scoreboard players add @a[team=red,distance=..3] healing 5
particle block yellow_concrete_powder ~ ~1 ~ 2 2 2 1 50 force @a
playsound minecraft:item.trident.thunder player @a ~ ~ ~ 2.0 2.0
