execute if entity @s[team=blue] run scoreboard players add @a[team=blue,distance=..3] healing 25
execute if entity @s[team=red] run scoreboard players add @a[team=red,distance=..3] healing 25
playsound health_pack player @a ~ ~ ~ 1 2 0
