# Unlocks entry
summon item_frame 29999 9 -35 {Facing:0b,Tags:["entry","active","spawner"],Item:{id:"minecraft:light_gray_dye",Count:1b},Invulnerable:1b}

# Locks Lab
fill 30004 1 -17 30004 4 -11 barrier replace air
fill 30000 1 -38 30000 2 -38 barrier replace air
summon minecraft:armor_stand 30004 1 -12 {Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:glass_bottle",Count:1b}],Rotation:[90.0f,0f],Tags:["door","south","lab"],NoGravity:1b}
summon minecraft:armor_stand 30004 1 -16 {Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:glass_bottle",Count:1b}],Rotation:[270.0f,0f],Tags:["door","north","lab"],NoGravity:1b}
summon minecraft:armor_stand 30000 1 -38 {Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:honey_bottle",Count:1b}],Rotation:[0.0f,0f],Tags:["door","up","lab"],NoGravity:1b}
setblock 30003 1 -14 minecraft:oak_wall_sign[facing=west]{Text2:'{"translate":"unlock","clickEvent":{"action":"run_command","value":"function gamemode:escape/purchase/lab"}}',Text3:'{"translate":"lab"}',Text4:'{"text":"3 Energy","color":"green"}'} replace
setblock 30000 1 -37 minecraft:oak_wall_sign[facing=south]{Text2:'{"translate":"unlock","clickEvent":{"action":"run_command","value":"function gamemode:escape/purchase/lab"}}',Text3:'{"translate":"lab"}',Text4:'{"text":"3 Energy","color":"green"}'} replace

# Locks Hangar
fill 29996 4 -11 29996 1 -17 barrier replace air
summon minecraft:armor_stand 29996 1 -12 {Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:glass_bottle",Count:1b}],Rotation:[90.0f,0f],Tags:["door","south","hangar"],NoGravity:1b}
summon minecraft:armor_stand 29996 1 -16 {Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:glass_bottle",Count:1b}],Rotation:[270.0f,0f],Tags:["door","north","hangar"],NoGravity:1b}
setblock 29997 1 -14 minecraft:oak_wall_sign[facing=east]{Text2:'{"translate":"unlock","clickEvent":{"action":"run_command","value":"function gamemode:escape/purchase/hangar"}}',Text3:'{"translate":"hangar"}',Text4:'{"text":"5 Energy","color":"green"}'} replace
