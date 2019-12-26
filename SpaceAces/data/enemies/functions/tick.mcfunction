execute as @e[type=silverfish,tag=mine_runner] at @s if entity @p[team=blue,distance=..1] run summon creeper ~ ~ ~ {Fuse:0}
execute as @e[tag=ranged] at @s run function enemies:ranged
execute as @e[tag=slow_aura] at @s run effect give @e[team=blue,distance=..3] slowness 1 1
execute as @e[tag=zap_aura] at @s run effect give @e[team=blue,distance=..2] hunger 1 5
execute as @e[tag=poison_aura] at @s run effect give @e[team=blue,distance=..1] unluck 1 5
execute as @e[tag=poison_bot] at @s run function enemies:poison_bot_tick
execute as @e[tag=poison_trail] at @s run function enemies:poison_trail
