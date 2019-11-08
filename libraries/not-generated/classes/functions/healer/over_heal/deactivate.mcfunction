execute as @a[tag=maxless] at @s run particle minecraft:block pumpkin ~ ~1 ~ .2 .5 .2 0 50 force @a
execute if entity @s[team=blue] run tag @p[team=blue,distance=0.1..32] remove maxless
execute if entity @s[team=red] run tag @p[team=red,distance=0.1..32] remove maxless
playsound minecraft:block.bell.resonate player @a ~ ~ ~ 1 2 0
