playsound entity.firework_rocket.blast hostile @a
particle flash ~ ~ ~ 0 0 0 0 1 force
effect give @a[distance=..5] blindness 5
execute if entity @s[team=red] run scoreboard players add @e[team=blue,distance=..3] damage 10
execute if entity @s[team=blue] run scoreboard players add @e[team=red,distance=..3] damage 10
kill @s
