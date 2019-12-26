execute if score @s i matches 50.. facing entity @e[team=blue,tag=!invis,sort=nearest,limit=1] feet run function enemies:look/test
execute if score @s[tag=canSee] i matches 50.. facing entity @e[team=blue,tag=!invis,sort=nearest,limit=1] feet run function enemies:shoot
execute if score @s i matches 50.. run scoreboard players set @s i 0
