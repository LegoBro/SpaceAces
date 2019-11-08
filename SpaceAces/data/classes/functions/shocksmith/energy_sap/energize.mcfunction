effect give @s saturation 1 5
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 1 2 0
scoreboard players add @s healing 10
kill @e[tag=energy_orb,distance=...5]
particle falling_dust yellow_stained_glass ~ ~ ~ 0.3 1.3 .3 .2 50 force @a
