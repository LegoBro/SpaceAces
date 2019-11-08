#Commands ran every tick, all the time
execute as @e[team=lobby] at @s run function tick:lobby
execute as @a[tag=!spawned] at @s run function load:spawn
tag @a[scores={crouching=1},tag=hb_player] add hb_crouched_player
tag @a[scores={crouching=1},tag=hb_player] remove hb_player
tag @a[scores={crouching=0},tag=hb_crouched_player] remove hb_crouched_player
tag @a[tag=!hb_player,tag=!hb_crouched_player] add hb_player

#Entities that run independantly
execute as @e[tag=grenade] at @s run function tick:grenade
execute as @e[tag=raycast] at @s run function tick:raycast
execute as @e[tag=turret_base] at @s run function tick:turret_base
execute as @e[tag=turret] at @s run function tick:turret
execute as @e[tag=healing_machine] at @s run function classes:scientist/healing_machine/standby
execute as @e[type=armor_stand,tag=healing_machine_display] at @s unless entity @e[type=slime,tag=healing_machine,distance=..1] run kill @s
execute as @e[tag=mine] at @s run function classes:bomber/mine/standby
execute as @e[tag=flash_grenade,type=armor_stand,nbt={OnGround:1b}] at @s run function classes:mobility/flash_drop/land
execute as @e[tag=energy_orb,type=area_effect_cloud] at @s run function classes:shocksmith/energy_sap/follow
execute as @e[tag=deployed_health_pack,type=armor_stand] at @s run function classes:healer/health_pack/standby

#kill aoe's summoned by creepers
kill @e[nbt={Effects:[{Id:11b}]},type=area_effect_cloud]

# Team setup
#Blue
execute if entity @a[tag=in_game] run particle minecraft:angry_villager 5.75 195.06 9.49 .5 .5 .5 .01 2 force
execute unless entity @a[tag=in_game] run team join blue @a[x=4,y=195,z=8,dx=2,dy=3,dz=2]
tp @a[x=4,y=195,z=8,dx=2,dy=3,dz=2,team=blue] 6 195 -1 90 0
#Red
execute if entity @a[tag=in_game] run particle minecraft:angry_villager 11.75 195.06 9.49 .5 .5 .5 .01 2 force
execute unless entity @a[tag=in_game] run team join red @a[x=10,y=195,z=8,dx=2,dy=3,dz=2]
tp @a[x=10,y=195,z=8,dx=2,dy=3,dz=2,team=red] 10 195 -1 -90 0
#spectator
execute as @a[x=7,y=195,z=27,dx=2,dy=3,dz=2] at @s if block ~ ~ ~ light_gray_carpet run team join spectator @s
execute if entity @a[tag=in_game] run gamemode spectator @a[x=7,y=195,z=27,dx=2,dy=3,dz=2,team=spectator]
execute if entity @a[tag=in_game] run tp @a[x=7,y=195,z=27,dx=2,dy=3,dz=2,team=spectator] 20015 15 15
title @a[team=spectator] actionbar ["",{"text":"[","color":"gray"},{"text":"Spectating, leave the area to quit.","color":"green"},{"text":"]","color":"gray"}]
execute as @a[gamemode=spectator,team=spectator,tag=!in_game] at @s if block ~ ~ ~ barrier run function load:spawn
#lobby
execute as @a[team=spectator,gamemode=adventure] at @s unless block ~ ~ ~ light_gray_carpet run team join lobby @s
#Lobby for team selection
execute as @a[tag=!awaiting,tag=!in_game,x=3,y=195,z=-10,dx=11,dy=1,dz=15] run function gamemode:new_player
# this allows the players to toggle between ready
replaceitem entity @a[tag=awaiting,tag=!ready] hotbar.8 carrot_on_a_stick{display:{Name:"{\"translate\":\"not_ready_item\",\"color\":\"white\"}",Lore:["{\"translate\":\"right_click\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11000002,Unbreakable:1}
replaceitem entity @a[tag=awaiting,tag=ready] hotbar.8 carrot_on_a_stick{display:{Name:"{\"translate\":\"ready_item\",\"color\":\"white\"}",Lore:["{\"translate\":\"right_click\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11000003,Unbreakable:1}
replaceitem entity @a[tag=awaiting,team=lobby] hotbar.8 air
tag @a[tag=awaiting,team=lobby] remove awaiting
execute as @a[tag=awaiting,scores={rightClick=1},nbt={SelectedItemSlot:8}] at @s run function gamemode:toggle_ready
kill @e[type=!player,x=3,y=195,z=-10,dx=11,dy=1,dz=15]
execute unless entity @a[tag=in_game] run particle minecraft:angry_villager 8.75 195.06 28.49 .5 .5 .5 .01 2 force

# Gamemode running/setup
execute if score Mission Numbers matches 1.. run function gamemode:countdown
execute if score ActiveMode Numbers matches 1.. if score Prestart Numbers matches ..119 run function gamemode:loading_gamemode
execute if score ActiveMode Numbers matches 1.. unless score Prestart Numbers matches ..119 run function gamemode:running

# if player is in training area
execute if entity @a[tag=trainee] run function gamemode:training

# various timers for classes
execute as @a[scores={invis=1..}] at @s run function classes:infiltraitor/cloak/timer
execute as @a[scores={over_heal=1..}] at @s run function classes:healer/over_heal/timer
execute as @a[scores={resist=1..}] at @s run function classes:rocketeer/resist/timer
execute as @a[scores={invulnerable=1..}] at @s run function classes:brawler/defensive_stance/timer

# !items
kill @e[type=item]

# clears inventory of players
execute as @a[gamemode=adventure] run function classes:clear_inventory

# prevents players from getting too low on energy (they won't take damage)
effect give @a[scores={energy=0}] saturation 1 1 true

# spins the heads
function gamemode:floating_heads

# makes worm_hole work
scoreboard players enable @a[team=lobby] worm_hole
execute as @a[team=!lobby] run trigger worm_hole add 0
execute as @a[scores={worm_hole=1..}] at @s run function gamemode:worm_hole_tp

# damages players if they are at a position less than y=-10
execute as @a at @s store result score @s ypos run data get entity @s Pos[1]
scoreboard players add @a[gamemode=adventure,scores={ypos=..-10}] damage 100

# changes health pack models when they are charged/used
execute as @e[type=item_frame,tag=weak_health,scores={j=50},nbt=!{Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000001}}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,Invulnerable:1b,tag:{CustomModelData:11000001}}}
execute as @e[type=item_frame,tag=weak_health,scores={j=0},nbt=!{Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000003}}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,Invulnerable:1b,tag:{CustomModelData:11000003}}}
execute as @e[type=item_frame,tag=strong_health,scores={j=100},nbt=!{Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000000}}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,Invulnerable:1b,tag:{CustomModelData:11000000}}}
execute as @e[type=item_frame,tag=strong_health,scores={j=0},nbt=!{Item:{id:"minecraft:baked_potato",Count:1b,tag:{CustomModelData:11000002}}}] run data merge entity @s {Item:{id:"minecraft:baked_potato",Count:1b,Invulnerable:1b,tag:{CustomModelData:11000002}}}
execute as @e[type=item_frame,nbt=!{ItemRotation:0b}] run data merge entity @s {ItemRotation:0b}

# if a player doesn't have arrows in their offhand, they shouldn't have anything
replaceitem entity @a[nbt={Inventory:[{Slot:-106b}]},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:arrow"}]}] weapon.offhand air


scoreboard players reset @a[scores={j=200..}] j

# runs when player talks to a character
execute as @a[scores={talkToCharacter=1..}] at @s run function tick:talk_to_character

# prevents right clicking in Lobby
#scoreboard players reset @a[x=8,y=200,z=8,distance=..250] rightClick

# finds which class each player has, and links it's ability to them
execute as @a[scores={Class=1..},team=!lobby,team=!spectator] at @s run function classes:finder

# makes players in the lobby invulnerable
scoreboard players set @a[x=8,y=200,z=8,distance=..250] invulnerable 100

# performs health functions
function health:tick

# performs functions for the archive room
function archives:main
