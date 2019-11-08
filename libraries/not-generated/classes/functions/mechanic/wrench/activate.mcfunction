execute if entity @s[team=blue] run tag @e[distance=..3,sort=nearest,limit=1,tag=turret_base,team=blue] add wrenched
execute if entity @s[team=red] run tag @e[distance=..3,sort=nearest,limit=1,tag=turret_base,team=red] add wrenched
execute as @e[distance=..3,tag=wrenched,type=slime,tag=turret_base,nbt={Health:105f}] at @s run tag @e[type=armor_stand,sort=nearest,limit=1,tag=turret] add change
tag @e[tag=wrenched,type=slime,tag=turret_base,nbt=!{Health:105f}] add repair
tag @e[distance=..3,tag=change,tag=standard,limit=1] add sniper
tag @e[distance=..3,tag=change,tag=sniper,tag=!standard,limit=1] add rocket_launcher
tag @e[distance=..3,tag=change,tag=rocket_launcher,tag=!sniper] add standard
tag @e[distance=..3,tag=change,tag=standard,tag=rocket_launcher] remove rocket_launcher
tag @e[distance=..3,tag=change,tag=standard,tag=sniper,limit=1] remove standard
tag @e[distance=..3,tag=change,tag=sniper,tag=rocket_launcher] remove sniper
replaceitem entity @e[tag=change,tag=standard,limit=1,sort=nearest] armor.head tropical_fish
replaceitem entity @e[tag=change,tag=sniper,limit=1,sort=nearest] armor.head pufferfish
replaceitem entity @e[tag=change,tag=rocket_launcher,limit=1,sort=nearest] armor.head cooked_cod
execute at @e[tag=change,limit=1,sort=nearest] run particle enchanted_hit ~ ~ ~ .5 .5 .5 0 10 force @a
execute as @e[distance=..3,sort=nearest,limit=1,tag=turret_base,tag=repair] at @s store result score @s health run data get entity @s Health
scoreboard players add @e[distance=..3,sort=nearest,limit=1,tag=turret_base,tag=repair] health 10
execute as @e[distance=..3,sort=nearest,limit=1,tag=turret_base,tag=repair] at @s store result entity @s Health float 1 run scoreboard players get @s health
execute at @e[tag=repair,limit=1,sort=nearest] run particle crit ~ ~ ~ .5 .5 .5 0 10 force @a
tag @e[distance=..3,tag=wrenched,limit=1] remove wrenched
tag @e[distance=..3,tag=change,limit=1] remove change
tag @e[distance=..3,tag=repair,limit=1] remove repair
playsound minecraft:block.anvil.land player @a ~ ~ ~ 1 1.5 0
