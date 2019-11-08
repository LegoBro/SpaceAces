execute as @a if score @s id = @p[distance=0] lastHurter run tag @s add killer
execute if entity @e[tag=killer] run tellraw @a ["",{"selector":"@s"},{"text":" was killed by "},{"selector":"@p[tag=killer]"}]
execute unless entity @e[tag=killer] run tellraw @a ["",{"selector":"@s"},{"text":" was killed"}]
xp add @p[tag=killer] 1
scoreboard players add @p[tag=killer] kills 1
scoreboard players add @p[tag=killer] totalKills 1
tag @a[tag=killer] remove killer
