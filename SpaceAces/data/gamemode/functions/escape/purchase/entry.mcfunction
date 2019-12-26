summon item_frame 29999 9 -35 {Facing:0b,Tags:["entry","active","spawner"],Item:{id:"minecraft:light_gray_dye",Count:1b},Invulnerable:1b}
fill 29996 4 -11 29996 1 -17 barrier replace air
execute positioned 29997 1 -11 run function gamemode:escape/purchase/summon_door_south
execute positioned 29996 1 -16 run function gamemode:escape/purchase/summon_door_north
