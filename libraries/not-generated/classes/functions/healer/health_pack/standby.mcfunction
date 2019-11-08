execute unless score @s i matches 60 run scoreboard players add @s i 1
execute if entity @s[team=blue,scores={i=60}] as @a[team=blue,distance=..1,limit=1,sort=nearest] run function classes:healer/health_pack/deploy
execute if entity @s[team=red,scores={i=60}] as @a[team=red,distance=..1,limit=1,sort=nearest] run function classes:healer/health_pack/deploy
tp @s ~ ~ ~ ~1 ~
