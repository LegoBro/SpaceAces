execute if entity @s[tag=standard,team=blue] if entity @e[limit=1,sort=nearest,team=red,distance=..15,tag=!invis] run function classes:mechanic/turret/standard
execute if entity @s[tag=sniper,team=blue] if entity @e[limit=1,sort=nearest,team=red,distance=..25,tag=!invis] run function classes:mechanic/turret/sniper
execute if entity @s[tag=rocket_launcher,team=blue] if entity @e[limit=1,sort=nearest,team=red,distance=..20,tag=!invis] run function classes:mechanic/turret/rocket
execute if entity @s[tag=standard,team=red] if entity @e[limit=1,sort=nearest,team=blue,distance=..15,tag=!invis] run function classes:mechanic/turret/standard
execute if entity @s[tag=sniper,team=red] if entity @e[limit=1,sort=nearest,team=blue,distance=..25,tag=!invis] run function classes:mechanic/turret/sniper
execute if entity @s[tag=rocket_launcher,team=red] if entity @e[limit=1,sort=nearest,team=blue,distance=..20,tag=!invis] run function classes:mechanic/turret/rocket
scoreboard players add @s[scores={reload=5..}] reload 1
scoreboard players set @s[scores={reload=10..},tag=standard] reload 0
scoreboard players set @s[scores={reload=40..},tag=sniper] reload 0
scoreboard players set @s[scores={reload=50..},tag=rocket_launcher] reload 0
execute unless entity @e[tag=turret_base,sort=nearest,distance=...001] run kill @s
