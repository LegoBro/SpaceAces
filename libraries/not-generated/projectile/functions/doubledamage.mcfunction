#Double Damages or Normal heals enemies/team-mates
execute if entity @s[tag=blue] at @e[type=!item_frame,tag=!turret,limit=1,sort=nearest,tag=!raycast] run scoreboard players operation @e[type=!item_frame,tag=!turret,distance=0,limit=1,sort=nearest,team=!blue,tag=!raycast] 2xdamage += @s damage
execute if entity @s[tag=blue] at @e[type=!item_frame,tag=!turret,limit=1,sort=nearest,tag=!raycast] run scoreboard players operation @e[type=!item_frame,tag=!turret,distance=0,limit=1,sort=nearest,team=!blue,tag=!raycast] lastHurter = @s id
execute if entity @s[tag=blue] at @e[type=!item_frame,tag=!turret,limit=1,sort=nearest,tag=!raycast] run scoreboard players operation @e[type=!item_frame,tag=!turret,distance=0,limit=1,sort=nearest,team=blue,tag=!raycast] healing += @s healing
execute if entity @s[tag=red] at @e[type=!item_frame,tag=!turret,limit=1,sort=nearest,tag=!raycast] run scoreboard players operation @e[type=!item_frame,tag=!turret,distance=0,limit=1,sort=nearest,team=!red,tag=!raycast] 2xdamage += @s damage
execute if entity @s[tag=red] at @e[type=!item_frame,tag=!turret,limit=1,sort=nearest,tag=!raycast] run scoreboard players operation @e[type=!item_frame,tag=!turret,distance=0,limit=1,sort=nearest,team=!red,tag=!raycast] lastHurter = @s id
execute if entity @s[tag=red] at @e[type=!item_frame,tag=!turret,limit=1,sort=nearest,tag=!raycast] run scoreboard players operation @e[type=!item_frame,tag=!turret,distance=0,limit=1,sort=nearest,team=red,tag=!raycast] healing += @s healing
scoreboard players operation place_id id = @s id
execute as @a if score @s id = place_id id at @s run function projectile:big_hit_indicator
tag @s[tag=grenade] add impact
tag @s[tag=explosive] add explode
tag @s add kill
