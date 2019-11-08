tag @s add maxless
scoreboard players remove @s over_heal 1
tag @s[scores={over_heal=..0}] remove maxless
title @s[scores={over_heal=1..}] actionbar ["",{"text":"Overheal: ","color":"light_purple"},{"score":{"name":"@s","objective":"over_heal"},"color":"green"}]
title @s[scores={over_heal=..0}] actionbar ["",{"text":"Overheal: ","color":"light_purple"},{"text":"Deactivated","color":"red"}]
scoreboard players reset @s[scores={over_heal=..0}] over_heal
