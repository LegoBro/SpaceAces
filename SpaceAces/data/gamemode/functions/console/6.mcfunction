tag @e[type=villager,tag=pilot,tag=!balanceTeams] add temp
tag @e[type=villager,tag=pilot,tag=!balanceTeams] add balanceTeams
tag @e[type=villager,tag=pilot,tag=!temp] remove balanceTeams
tag @e[type=villager,tag=pilot,tag=temp] remove temp
execute if entity @e[type=villager,tag=pilot,tag=balanceTeams] run tellraw @a ["",{"text":"Balanced teams enabled","color":"green"}]
execute if entity @e[type=villager,tag=pilot,tag=!balanceTeams] run tellraw @a ["",{"text":"Balanced teams disabled","color":"red"}]
