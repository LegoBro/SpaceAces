#Commands for wave 1 (dynamic)
scoreboard players set waveDelay Numbers 100
execute as @a[tag=escape] at @e[type=item_frame,sort=random,limit=1,tag=spawner,tag=active] run function enemies:summon/bot
bossbar set minecraft:main max 100
scoreboard players operation currency Numbers += wave Numbers
scoreboard players set wave Numbers 2