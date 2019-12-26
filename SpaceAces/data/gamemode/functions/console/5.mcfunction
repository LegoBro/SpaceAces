tag @e[type=villager,tag=pilot,tag=!randomClass] add temp
tag @e[type=villager,tag=pilot,tag=!randomClass] add randomClass
tag @e[type=villager,tag=pilot,tag=!temp] remove randomClass
tag @e[type=villager,tag=pilot,tag=temp] remove temp
execute if entity @e[type=villager,tag=pilot,tag=randomClass] run tellraw @a ["",{"text":"Random classes enabled","color":"green"}]
execute if entity @e[type=villager,tag=pilot,tag=!randomClass] run tellraw @a ["",{"text":"Random classes disabled","color":"red"}]
