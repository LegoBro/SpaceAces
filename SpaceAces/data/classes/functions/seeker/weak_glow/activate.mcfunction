execute if entity @s[team=blue] run effect give @e[team=red,distance=..30,scores={health=..30}] glowing 5 0 true
execute if entity @s[team=red] run effect give @e[team=blue,distance=..30,scores={health=..30}] glowing 5 0 true
playsound minecraft:block.note_block.chime player @a ~ ~ ~ 1 2
