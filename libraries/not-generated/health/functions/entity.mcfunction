scoreboard players operation @s health -= @s damage
#execute as @s[scores={health=..0}] run function health:display_death
execute store result entity @s Health float 1 run scoreboard players get @s health
