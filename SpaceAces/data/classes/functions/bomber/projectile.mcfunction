scoreboard players set @s damage 10
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:paper",tag:{CustomModelData:11020001},Count:1b}]}
scoreboard players set @s arcRate 10
scoreboard players set @s speed 24
scoreboard players operation @s j = @s speed
execute unless entity @s[scores={Numbers=0..}] positioned ~ ~-.25 ~ run function projectile:ray