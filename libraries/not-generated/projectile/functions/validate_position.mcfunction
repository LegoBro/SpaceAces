#Validates position of raycasting
tag @s[tag=continue] remove continue
execute if block ~ ~ ~ air run tag @s add continue
execute if block ~ ~ ~ #projectile:passable run function projectile:check
execute if score @s damage matches ..0 run tag @s add kill
tag @s[tag=explosive,tag=!continue] add explode
tag @s[tag=grenade,tag=!continue] add impact
tag @s[scores={speed=0},tag=!continue] add kill
