# Loads escape (dynamic)
  scoreboard players set ActiveMode Numbers 5
    tag @a[tag=awaiting] add in_game
    tag @a[tag=in_game] remove awaiting
    bossbar set minecraft:main name ["",{"text":"Next Wave","color":"white"}]
    bossbar set main players @a[tag=in_game]
    execute positioned 29960 4 10 run kill @e[tag=door,distance=..1000]
    execute positioned 29960 4 10 run kill @e[tag=spawner,distance=..1000]
    execute positioned 29960 4 10 run kill @e[tag=bot,distance=..1000]
    execute positioned 29960 4 10 run kill @e[tag=terminal,distance=..1000]
    scoreboard players set wave Numbers 1
    scoreboard players set waveDelay Numbers 200
    bossbar set minecraft:main max 200
    scoreboard objectives modify display displayname {"text":"Escape:","color":"green"}
    scoreboard players reset Mission display
    scoreboard players set currency Numbers 0
    function gamemode:escape/unlock/entry
    tag @a[tag=in_game] add escape
    tag @a[tag=escape] add no_2
    tag @a[tag=escape] add no_3
    summon minecraft:area_effect_cloud 30004 2 56 {CustomNameVisible:1b,CustomName:'{"translate":"terminal_0"}',Duration:2000000000,Tags:["terminal","active"]}
    summon minecraft:area_effect_cloud 29901 16 47 {CustomNameVisible:1b,CustomName:'{"translate":"terminal_0"}',Duration:2000000000,Tags:["terminal","active"]}
    summon minecraft:area_effect_cloud 29911 16 -36 {CustomNameVisible:1b,CustomName:'{"translate":"terminal_0"}',Duration:2000000000,Tags:["terminal","active"]}
    summon minecraft:area_effect_cloud 29924 40 -4 {CustomNameVisible:1b,CustomName:'{"translate":"terminal_0"}',Duration:2000000000,Tags:["terminal","active"]}
    summon minecraft:area_effect_cloud 30008 2 45 {CustomNameVisible:1b,CustomName:'{"translate":"terminal_0"}',Duration:2000000000,Tags:["terminal","active"]}