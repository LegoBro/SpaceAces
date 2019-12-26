title @a[tag=escape] times 0 1 10
title @a[tag=escape] title ["",{"text":"Successful Escape!","color":"dark_blue"}]
scoreboard players remove @p[tag=escape] i 1
xp add @a[tag=escape] 1
execute if score @p[tag=escape] i matches ..-200 run function gamemode:reset
