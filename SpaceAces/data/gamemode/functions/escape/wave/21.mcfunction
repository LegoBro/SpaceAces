#Commands for wave 21 (dynamic)
scoreboard players set waveDelay Numbers 2100
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
bossbar set minecraft:main max 2100
scoreboard players operation currency Numbers += wave Numbers
scoreboard players set wave Numbers 22