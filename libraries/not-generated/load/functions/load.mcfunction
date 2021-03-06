function load:constants
function load:map_signs
function load:objectives
function load:random
function load:teams
function gamemode:cycle
team modify blue seeFriendlyInvisibles false
team modify red seeFriendlyInvisibles false
team modify blue nametagVisibility hideForOtherTeams
team modify red nametagVisibility hideForOtherTeams
team modify blue friendlyFire false
team modify red friendlyFire false
team modify lobby friendlyFire false
gamerule sendCommandFeedback false
execute unless entity @e[tag=greeter] run summon villager 11 200 15 {NoAI:1,Tags:["greeter"],Rotation:[135F,0F],Silent:1b,Invulnerable:1b,VillagerData:{type:"minecraft:snow"}}
execute unless entity @e[tag=training_adviser] run summon villager -1 199 32 {NoAI:1,Tags:["training_adviser"],Rotation:[-90F,0F],Silent:1b,Invulnerable:1b}
execute unless entity @e[tag=pilot] run summon villager 10 200 61 {NoAI:1,Tags:["pilot"],Rotation:[0F,35F],Silent:1b,Invulnerable:1b,VillagerData:{type:"minecraft:taiga"}}
execute unless entity @e[tag=gunner_1] run summon villager 14 199 38 {NoAI:1,Tags:["gunner_1"],Rotation:[-90F,-10F],Silent:1b,Invulnerable:1b,VillagerData:{type:"minecraft:desert"}}
execute unless entity @e[tag=gunner_2] run summon villager 2 199 38 {NoAI:1,Tags:["gunner_2"],Rotation:[90F,10F],Silent:1b,Invulnerable:1b,VillagerData:{type:"minecraft:savanna"}}
execute unless entity @e[tag=commander] run summon villager 13 205 32 {NoAI:1,Tags:["commander"],Rotation:[90F,0F],Silent:1b,Invulnerable:1b,VillagerData:{type:"minecraft:swamp"}}
execute unless entity @e[tag=archiver] run summon villager 5 215 5 {NoAI:1,Tags:["archiver"],Rotation:[-90F,0F],Silent:1b,Invulnerable:1b,VillagerData:{type:"minecraft:jungle"}}
execute unless entity @e[tag=frame_controller_1] run summon item_frame 10.00 201.37 62.55 {Invulnerable:1b,Facing:1b,Item:{id:"minecraft:lime_stained_glass_pane",Count:1b},Tags:["frame_controller_1"]}
execute unless entity @e[tag=frame_controller_2] run summon item_frame 6 201 62 {Invulnerable:1b,Facing:1b,Item:{id:"minecraft:lime_stained_glass_pane",Count:1b},Tags:["frame_controller_2"]}
execute unless entity @e[tag=gun_display_1] run summon armor_stand 0 195 15 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11020000}}],Tags:["gun_display_1"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_2] run summon armor_stand 0 195.2 14 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11030000}}],Tags:["gun_display_2"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_3] run summon armor_stand 0 195.2 13 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11040000}}],Tags:["gun_display_3"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_4] run summon armor_stand 0 195.4 12 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11150000}}],Tags:["gun_display_4"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_5] run summon armor_stand 16 195 15 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11010000}}],Tags:["gun_display_5"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_6] run summon armor_stand 16 196 15 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11060000}}],Tags:["gun_display_6"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_7] run summon armor_stand 16 196 12 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11110000}}],Tags:["gun_display_7"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_8] run summon armor_stand 16 195 12 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11090000}}],Tags:["gun_display_8"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_9] run summon armor_stand 16 195 13 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11050000}}],Tags:["gun_display_9"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_10] run summon armor_stand 16 195 14 {ArmorItems:[{},{},{},{id:"minecraft:paper",Count:1b,tag:{CustomModelData:11100000}}],Tags:["gun_display_10"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
execute unless entity @e[tag=gun_display_11] run summon armor_stand 16 196 14 {ArmorItems:[{},{},{},{id:"minecraft:golden_sword",Count:1b,tag:{CustomModelData:11070000}}],Tags:["gun_display_11"],Invisible:1b,NoGravity:1b,Pose:{Head:[-90f,0f,0f]}}
setblock 0 1 0 oak_sign
scoreboard objectives setdisplay sidebar display
scoreboard objectives setdisplay sidebar display
scoreboard objectives setdisplay belowName health
scoreboard objectives setdisplay list health
execute unless score Player_Amount Numbers matches 1.. run scoreboard players set Player_Amount Numbers 1
scoreboard players set Maps Numbers -1
