scoreboard players set @s damage 8
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:paper",tag:{CustomModelData:11150003},Count:1b}]}
scoreboard players set @s arcRate 0
scoreboard players set @s speed 32
scoreboard players operation @s j = @s speed
execute unless entity @s[scores={Numbers=0..}] positioned ~ ~-.25 ~ run function projectile:ray