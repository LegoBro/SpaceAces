scoreboard players set @s damage 3
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:paper",tag:{CustomModelData:11100003},Count:1b}]}
scoreboard players set @s arcRate 3
scoreboard players set @s speed 32
scoreboard players operation @s j = @s speed
scoreboard players set @s Numbers 5
function projectile:spread
execute unless entity @s[scores={Numbers=0..}] positioned ~ ~-.25 ~ run function projectile:ray