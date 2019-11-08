execute if entity @s[tag=blue] run effect give @e[team=red,distance=..2] unluck 3 0
execute if entity @s[tag=red] run effect give @e[team=blue,distance=..2] unluck 3 0
particle block slime_block ~ ~ ~ 0 0 0 0 3 force
playsound block.slime_block.place player @a ~ ~ ~ 2.0 2.0
