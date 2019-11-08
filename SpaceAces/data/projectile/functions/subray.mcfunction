#Activated every block, rather than every 1/16 of a block
scoreboard players remove @s[scores={falloffStart=1..}] falloffStart 1
execute if score @s falloffStart matches 0 run scoreboard players operation @s damage -= @s falloff
particle mycelium ~ ~ ~ 0 0 0 0 1 force @a
scoreboard players set @s i 0
