#Commands for wave 27 (dynamic)
scoreboard players set waveDelay Numbers 2700
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/mine_runner
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/mine_runner
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/mine_runner
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/slow_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/zap_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/zap_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/zap_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/zap_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/zap_bot
bossbar set minecraft:main max 2700
scoreboard players operation currency Numbers += wave Numbers
scoreboard players set wave Numbers 28