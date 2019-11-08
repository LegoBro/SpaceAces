#These commands are for the training area_effect_cloud
tp @a[tag=trainee,scores={health=..0}] 10000 100 0
execute as @a[scores={health=..0},tag=trainee] at @s run function gamemode:respawn
scoreboard players set @e[tag=training_bot,tag=!prepared] health 100
tag @e[type=zombie,tag=training_bot,tag=!prepared] add prepared
execute unless entity @e[type=zombie,tag=a,tag=training_bot] run summon zombie 10043 115 8 {CustomNameVisible:1b,Team:"red",Health:100f,Tags:["entity","hb_training","training_bot","a"],CustomName:"{\"text\":\"Training Bot\"}",ArmorItems:[{id:"minecraft:golden_boots",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:93983,UUIDMost:647152}]}},{id:"minecraft:golden_leggings",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:201320,UUIDMost:650020}]}},{id:"minecraft:golden_chestplate",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:416141,UUIDMost:193552}]}},{id:"minecraft:golden_helmet",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:333292,UUIDMost:692200}]}}],ActiveEffects:[{Id:28b,Amplifier:1b,Duration:80}],Attributes:[{Name:generic.maxHealth,Base:100},{Name:generic.followRange,Base:64},{Name:generic.movementSpeed,Base:.3},{Name:generic.attackDamage,Base:20},{Name:generic.armor,Base:0},{Name:generic.armorToughness,Base:0}]}
execute unless entity @e[type=zombie,tag=b,tag=training_bot] run summon zombie 10015 115 -9 {CustomNameVisible:1b,Team:"red",Health:100f,Tags:["entity","hb_training","training_bot","b"],CustomName:"{\"text\":\"Training Bot\"}",ArmorItems:[{id:"minecraft:golden_boots",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:93983,UUIDMost:647152}]}},{id:"minecraft:golden_leggings",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:201320,UUIDMost:650020}]}},{id:"minecraft:golden_chestplate",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:416141,UUIDMost:193552}]}},{id:"minecraft:golden_helmet",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:333292,UUIDMost:692200}]}}],ActiveEffects:[{Id:28b,Amplifier:1b,Duration:80}],Attributes:[{Name:generic.maxHealth,Base:100},{Name:generic.followRange,Base:64},{Name:generic.movementSpeed,Base:.3},{Name:generic.attackDamage,Base:20},{Name:generic.armor,Base:0},{Name:generic.armorToughness,Base:0}]}
execute unless entity @e[type=zombie,tag=c,tag=training_bot] run summon zombie 10016 115 25 {CustomNameVisible:1b,Team:"red",Health:100f,Tags:["entity","hb_training","training_bot","c"],CustomName:"{\"text\":\"Training Bot\"}",ArmorItems:[{id:"minecraft:golden_boots",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:93983,UUIDMost:647152}]}},{id:"minecraft:golden_leggings",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:201320,UUIDMost:650020}]}},{id:"minecraft:golden_chestplate",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:416141,UUIDMost:193552}]}},{id:"minecraft:golden_helmet",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:333292,UUIDMost:692200}]}}],ActiveEffects:[{Id:28b,Amplifier:1b,Duration:80}],Attributes:[{Name:generic.maxHealth,Base:100},{Name:generic.followRange,Base:64},{Name:generic.movementSpeed,Base:.3},{Name:generic.attackDamage,Base:20},{Name:generic.armor,Base:0},{Name:generic.armorToughness,Base:0}]}
execute unless entity @e[type=zombie,tag=d,tag=training_bot] run summon zombie 10027 115 3 {CustomNameVisible:1b,Team:"red",Health:100f,Tags:["entity","hb_training","training_bot","d"],CustomName:"{\"text\":\"Training Bot\"}",ArmorItems:[{id:"minecraft:golden_boots",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:93983,UUIDMost:647152}]}},{id:"minecraft:golden_leggings",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:201320,UUIDMost:650020}]}},{id:"minecraft:golden_chestplate",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:416141,UUIDMost:193552}]}},{id:"minecraft:golden_helmet",Count:1b,tag:{AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:333292,UUIDMost:692200}]}}],ActiveEffects:[{Id:28b,Amplifier:1b,Duration:80}],Attributes:[{Name:generic.maxHealth,Base:100},{Name:generic.followRange,Base:64},{Name:generic.movementSpeed,Base:.3},{Name:generic.attackDamage,Base:20},{Name:generic.armor,Base:0},{Name:generic.armorToughness,Base:0}]}
execute if entity @e[tag=a,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] if entity @e[tag=b,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] if entity @e[tag=c,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] if entity @e[tag=d,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] run fill 10001 90 -9 10004 90 -9 air destroy
scoreboard players add @a[x=10006,y=87,z=-12,dx=4,dy=0,dz=6,tag=trainee] damage 1
execute unless entity @e[tag=a,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] run fill 10001 90 -9 10004 90 -9 lime_stained_glass
execute unless entity @e[tag=b,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] run fill 10001 90 -9 10004 90 -9 lime_stained_glass
execute unless entity @e[tag=c,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] run fill 10001 90 -9 10004 90 -9 lime_stained_glass
execute unless entity @e[tag=d,type=zombie,x=10006,y=87,z=-12,dx=4,dy=0,dz=6] run fill 10001 90 -9 10004 90 -9 lime_stained_glass
