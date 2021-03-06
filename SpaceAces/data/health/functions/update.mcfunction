#Called when damage is taken, or when healing is applied; updates health

# These apply healing and damage
effect give @s[tag=!entity,scores={healing=1..}] regeneration 3 1
execute as @s[scores={raw_damage=1..}] at @s if entity @p[scores={raw_dealt=-1..},distance=..5] run scoreboard players operation @s lastHurter = @p[scores={raw_dealt=-1..},distance=..5] id
scoreboard players reset * raw_dealt

execute if entity @s[scores={2xdamage=1..}] run scoreboard players operation @s 2xdamage *= 20 Numbers
execute if entity @s[scores={2xdamage=1..}] run scoreboard players operation @s 2xdamage /= 10 Numbers
execute if entity @s[scores={2xdamage=1..}] run scoreboard players operation @s damage += @s 2xdamage
scoreboard players reset @s[scores={2xdamage=1..}] 2xdamage
execute if score @s damage matches 1.. run effect give @s[type=player] minecraft:wither 1 0 true
execute if entity @s[scores={raw_damage=1..}] run scoreboard players operation @s raw_damage /= 10 Numbers
execute if entity @s[scores={raw_damage=1..}] run scoreboard players operation @s damage += @s raw_damage
scoreboard players reset @s[scores={raw_damage=1..}] raw_damage
scoreboard players set @s[tag=invulnerable] damage 0
scoreboard players operation @s[tag=resistive] damage /= 2 Numbers
execute if score @s[tag=!entity] damage matches 1.. run scoreboard players operation @s health -= @s damage

# Chunk for indicator
tag @s add indicator
execute at @s if score @s damage matches 1.. run summon area_effect_cloud ~ ~1.5 ~ {CustomNameVisible:1b,Particle:"item_slime",ReapplicationDelay:500,Radius:0f,RadiusPerTick:0f,RadiusOnUse:0f,Duration:50,DurationOnUse:0f,Age:0,WaitTime:0,Tags:["damage_indicator"]}
execute at @s if score @s damage matches 1.. run data merge block 0 1 0 {Text1:"[\"\",{\"score\":{\"name\":\"@e[tag=indicator,limit=1,sort=nearest]\",\"objective\":\"damage\"},\"color\":\"red\"}]"}
execute at @s if score @s damage matches 1.. run data modify entity @e[tag=damage_indicator,limit=1,sort=nearest] CustomName set from block 0 1 0 Text1
execute if score @s[tag=entity] damage matches 1.. run function health:entity
execute at @s if score @s damage matches 1..49 run playsound minecraft:entity.generic.hurt player @a ~ ~ ~ 1 1 0
execute at @s if score @s damage matches 50.. run playsound minecraft:entity.generic.hurt player @a ~ ~ ~ 1 .5 0
scoreboard players reset @s damage
execute at @s if score @s healing matches 1.. run summon area_effect_cloud ~ ~1.5 ~ {CustomNameVisible:1b,Particle:"item_slime",ReapplicationDelay:500,Radius:0f,RadiusPerTick:0f,RadiusOnUse:0f,Duration:50,DurationOnUse:0f,Age:0,WaitTime:0,Tags:["heal_indicator"]}
execute at @s if score @s healing matches 1.. run data merge block 0 1 0 {Text1:"[\"\",{\"score\":{\"name\":\"@e[tag=indicator,limit=1,sort=nearest]\",\"objective\":\"healing\"},\"color\":\"green\"}]"}
execute at @s if score @s healing matches 1.. run data modify entity @e[tag=heal_indicator,limit=1,sort=nearest] CustomName set from block 0 1 0 Text1
execute if score @s[type=player] healing matches 1.. run effect give @s minecraft:poison 1 0 true
execute if score @s[tag=!entity] healing matches 1.. run scoreboard players operation @s health += @s healing
scoreboard players reset @s healing
tag @s remove indicator

#Display Health
scoreboard players operation @s[tag=!entity] displayHealth = @s health
scoreboard players operation @s[tag=!entity] displayHealth -= 2 Numbers
scoreboard players operation @s[tag=!entity] displayHealth *= 10 Numbers
scoreboard players operation @s[tag=!entity] displayHealth /= @s maxHealth
execute if score @s[tag=!maxless,tag=!entity] health > @s maxHealth run scoreboard players operation @s health = @s maxHealth

#Armor
execute if entity @s[team=blue,tag=!entity] run function health:update_armor_blue
execute if entity @s[team=red,tag=!entity] run function health:update_armor_red

#Run if you die
execute as @s[gamemode=adventure,scores={health=..0},tag=!entity] at @s run function health:death
