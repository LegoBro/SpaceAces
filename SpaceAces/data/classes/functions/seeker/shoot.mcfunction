
summon area_effect_cloud ~ ~ ~ {Particle:"dolphin",ReapplicationDelay:0,Radius:0f,RadiusPerTick:0f,RadiusOnUse:0f,Duration:600,DurationOnUse:0f,Age:0,Tags:["heavy_shotgun","raycast"]}
summon area_effect_cloud ~ ~ ~ {Particle:"dolphin",ReapplicationDelay:0,Radius:0f,RadiusPerTick:0f,RadiusOnUse:0f,Duration:600,DurationOnUse:0f,Age:0,Tags:["heavy_shotgun","raycast"]}
summon area_effect_cloud ~ ~ ~ {Particle:"dolphin",ReapplicationDelay:0,Radius:0f,RadiusPerTick:0f,RadiusOnUse:0f,Duration:600,DurationOnUse:0f,Age:0,Tags:["heavy_shotgun","raycast"]}
summon area_effect_cloud ~ ~ ~ {Particle:"dolphin",ReapplicationDelay:0,Radius:0f,RadiusPerTick:0f,RadiusOnUse:0f,Duration:600,DurationOnUse:0f,Age:0,Tags:["heavy_shotgun","raycast"]}
execute if entity @s[team=blue] run tag @e[type=area_effect_cloud,limit=4,sort=nearest] add blue
execute if entity @s[team=red] run tag @e[type=area_effect_cloud,limit=4,sort=nearest] add red
execute if entity @s[scores={crouching=0}] run tp @e[tag=heavy_shotgun,limit=4,sort=nearest] ~ ~1.6 ~ ~ ~
execute if entity @s[scores={crouching=1..}] run tp @e[tag=heavy_shotgun,limit=4,sort=nearest] ~ ~1.26 ~ ~ ~
execute store result score @e[tag=heavy_shotgun,limit=4,sort=nearest] id run scoreboard players get @s id
execute as @e[tag=heavy_shotgun,limit=4,sort=nearest] at @s run function classes:seeker/projectile
execute as @s at @s run playsound gun.heavy_shotgun hostile @a ~ ~ ~