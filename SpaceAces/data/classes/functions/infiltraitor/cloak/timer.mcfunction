tag @s add invis
scoreboard players remove @s invis 1
tag @s[scores={invis=..0}] remove invis
effect give @s invisibility 1 0 true
replaceitem entity @s armor.head air
replaceitem entity @s armor.chest air
replaceitem entity @s armor.legs air
replaceitem entity @s armor.feet air
title @s[scores={invis=1..}] actionbar ["",{"text":"Cloak: ","color":"white"},{"score":{"name":"@s","objective":"invis"},"color":"green"}]
title @s[scores={invis=..0}] actionbar ["",{"text":"Cloak: ","color":"white"},{"text":"Deactivated","color":"red"}]
execute if entity @s[scores={invis=..0}] run function health:update_health
scoreboard players reset @s[scores={invis=..0}] invis
