#Commands for wave 29 (dynamic)
scoreboard players set waveDelay Numbers 2900
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/mine_runner
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/mine_runner
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/mine_runner
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/ranged_bot
bossbar set minecraft:main max 2900
scoreboard players operation currency Numbers += wave Numbers
scoreboard players set wave Numbers 30