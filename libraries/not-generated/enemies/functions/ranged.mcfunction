execute if entity @e[distance=..64,team=blue,tag=!invis] run scoreboard players add @s i 1
execute as @s[type=skeleton,tag=ranged,tag=standard,scores={i=45..}] at @s run function enemies:standard
execute as @s[type=stray,tag=ranged,tag=explosive,scores={i=45..}] at @s run function enemies:explosive
execute if entity @e[distance=..16,team=blue,tag=!invis] run effect give @s slowness 1 10 true
