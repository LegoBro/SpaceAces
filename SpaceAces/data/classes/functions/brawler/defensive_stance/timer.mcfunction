tag @s add invulnerable
scoreboard players remove @s invulnerable 1
tag @s[scores={invulnerable=..0}] remove invulnerable
execute unless entity @s[x=8,y=200,z=8,distance=..250] run title @s[scores={invulnerable=1..}] actionbar ["",{"text":"Invulnerable: ","color":"gold"},{"score":{"name":"@s","objective":"invulnerable"},"color":"green"}]
title @s[scores={invulnerable=..0}] actionbar ["",{"text":"Invulnerable: ","color":"gold"},{"text":"Deactivated","color":"red"}]
scoreboard players reset @s[scores={invulnerable=..0}] invulnerable
