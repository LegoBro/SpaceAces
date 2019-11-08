tag @s add resistive
scoreboard players remove @s resist 1
tag @s[scores={resist=..0}] remove resistive
title @s[scores={resist=1..}] actionbar ["",{"text":"Resistant: ","color":"dark_aqua"},{"score":{"name":"@s","objective":"resist"},"color":"green"}]
title @s[scores={resist=..0}] actionbar ["",{"text":"Resistant: ","color":"dark_aqua"},{"text":"Deactivated","color":"red"}]
scoreboard players reset @s[scores={resist=..0}] resist
