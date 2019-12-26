#Commands for wave 5 (dynamic)
scoreboard players set waveDelay Numbers 500
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/armored_bot
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/armored_bot
bossbar set minecraft:main max 500
scoreboard players operation currency Numbers += wave Numbers
scoreboard players set wave Numbers 6