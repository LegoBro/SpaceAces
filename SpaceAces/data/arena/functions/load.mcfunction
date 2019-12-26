scoreboard players reset Mission
data merge block 8 200 65 {Text2:"{\"text\":\"Spectate\",\"color\":\"gray\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function arena:become_spectator\"}}",Text3:"{\"text\":\"Mission\",\"color\":\"gray\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"\"}}"}
kill @e[x=19999,y=0,z=-1,dx=129,dy=65,dz=65,type=!player]
fill 20000 0 0 20127 0 63 barrier
fill 20000 1 0 20127 1 63 barrier
fill 20000 2 0 20127 2 63 barrier
fill 20000 3 0 20127 3 63 barrier
fill 20000 4 0 20127 4 63 barrier
fill 20000 5 0 20127 5 63 barrier
fill 20000 6 0 20127 6 63 barrier
fill 20000 7 0 20127 7 63 barrier
fill 20000 8 0 20127 8 63 barrier
fill 20000 9 0 20127 9 63 barrier
fill 20000 10 0 20127 10 63 barrier
fill 20000 11 0 20127 11 63 barrier
fill 20000 12 0 20127 12 63 barrier
fill 20000 13 0 20127 13 63 barrier
fill 20000 14 0 20127 14 63 barrier
fill 20000 15 0 20127 15 63 barrier
fill 20000 16 0 20127 16 63 barrier
fill 20000 17 0 20127 17 63 barrier
fill 20000 18 0 20127 18 63 barrier
fill 20000 19 0 20127 19 63 barrier
fill 20000 20 0 20127 20 63 barrier
fill 20000 21 0 20127 21 63 barrier
fill 20000 22 0 20127 22 63 barrier
fill 20000 23 0 20127 23 63 barrier
fill 20000 24 0 20127 24 63 barrier
fill 20000 25 0 20127 25 63 barrier
fill 20000 26 0 20127 26 63 barrier
fill 20000 27 0 20127 27 63 barrier
fill 20000 28 0 20127 28 63 barrier
fill 20000 29 0 20127 29 63 barrier
fill 20000 30 0 20127 30 63 barrier
fill 20000 31 0 20127 31 63 barrier
fill 20000 32 0 20127 32 63 barrier
fill 20000 33 0 20127 33 63 barrier
fill 20000 34 0 20127 34 63 barrier
fill 20000 35 0 20127 35 63 barrier
fill 20000 36 0 20127 36 63 barrier
fill 20000 37 0 20127 37 63 barrier
fill 20000 38 0 20127 38 63 barrier
fill 20000 39 0 20127 39 63 barrier
fill 20000 40 0 20127 40 63 barrier
fill 20000 41 0 20127 41 63 barrier
fill 20000 42 0 20127 42 63 barrier
fill 20000 43 0 20127 43 63 barrier
fill 20000 44 0 20127 44 63 barrier
fill 20000 45 0 20127 45 63 barrier
fill 20000 46 0 20127 46 63 barrier
fill 20000 47 0 20127 47 63 barrier
fill 20000 48 0 20127 48 63 barrier
fill 20000 49 0 20127 49 63 barrier
fill 20000 50 0 20127 50 63 barrier
fill 20000 51 0 20127 51 63 barrier
fill 20000 52 0 20127 52 63 barrier
fill 20000 53 0 20127 53 63 barrier
fill 20000 54 0 20127 54 63 barrier
fill 20000 55 0 20127 55 63 barrier
fill 20000 56 0 20127 56 63 barrier
fill 20000 57 0 20127 57 63 barrier
fill 20000 58 0 20127 58 63 barrier
fill 20000 59 0 20127 59 63 barrier
fill 20000 60 0 20127 60 63 barrier
fill 20000 61 0 20127 61 63 barrier
fill 20000 62 0 20127 62 63 barrier
fill 20000 63 0 20127 63 63 barrier
scoreboard players operation Map Numbers = Maps Numbers
execute if score Map Numbers matches -1 run function scoreboard:rand_int
execute if score Map Numbers matches -1 run scoreboard players operation @e[tag=rng_one,type=area_effect_cloud,limit=1] Numbers %= 5 Numbers
execute if score Map Numbers matches -1 run scoreboard players operation Map Numbers = @e[tag=rng_one,type=area_effect_cloud,limit=1] Numbers

# Determines which gamemode is to be loaded (dynamic)
  execute if score Gamemode Numbers matches 0 run function gamemode:duel/load
  execute if score Gamemode Numbers matches 1 run function gamemode:tdm/load
  execute if score Gamemode Numbers matches 2 run function gamemode:setback/load
  execute if score Gamemode Numbers matches 3 run function gamemode:killstreak/load
  execute if score Gamemode Numbers matches 4 run function gamemode:escape/load
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:baked_potato",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000002}},Invulnerable:1b,Tags:["strong_health","health_pack"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:potato",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000003}},Invulnerable:1b,Tags:["weak_health","health_pack"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:lapis_lazuli",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:lapis_lazuli",Count:1b},Invulnerable:1b,Tags:["blue_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:red_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:red_dye",Count:1b},Invulnerable:1b,Tags:["red_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:bone_meal",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:bone_meal",Count:1b},Invulnerable:1b,Tags:["general_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:black_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:black_dye",Count:1b},Invulnerable:1b,Tags:["capture_point"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:pink_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:pink_dye",Count:1b},Invulnerable:1b,Tags:["forward_red_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:magenta_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:magenta_dye",Count:1b},Invulnerable:1b,Tags:["middle_red_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:cyan_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:cyan_dye",Count:1b},Invulnerable:1b,Tags:["middle_blue_spawn"]}
execute as @e[type=item_frame,tag=!processed,nbt={Item:{id:"minecraft:light_blue_dye",Count:1b}}] run data merge entity @s {Item:{id:"minecraft:light_blue_dye",Count:1b},Invulnerable:1b,Tags:["forward_blue_spawn"]}
tag @e[type=item_frame,tag=!processed] add processed
tag @a[tag=awaiting] add in_game
tag @a[tag=awaiting] remove awaiting