replaceitem entity @s[tag=!invis,scores={crouching=0}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:0.1,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:6513507},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[tag=!invis,scores={crouching=1..}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.05,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:6513507},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if entity @s[scores={activate_second=0}] run replaceitem entity @s hotbar.1 carrot_on_a_stick{display:{Name:"{\"translate\":\"turret\",\"color\":\"white\"}",Lore:["{\"translate\":\"turret_lore1\",\"color\":\"white\"}","{\"translate\":\"turret_lore2\",\"color\":\"white\"}","{\"translate\":\"turret_lore3\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11090001,Unbreakable:1}
execute if entity @s[scores={activate_second=1..}] run replaceitem entity @s hotbar.1 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] activate_second 1
scoreboard players reset @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_second=1}] run function classes:mechanic/turret/activate
scoreboard players add @s[scores={activate_second=1..}] activate_second 1
execute if entity @s[scores={activate_second=100}] run function classes:mechanic/turret/deactivate
scoreboard players set @s[scores={activate_second=1000..}] activate_second 0
execute if entity @s[scores={activate_third=0}] run replaceitem entity @s hotbar.2 carrot_on_a_stick{display:{Name:"{\"translate\":\"wrench\",\"color\":\"white\"}",Lore:["{\"translate\":\"wrench_lore1\",\"color\":\"white\"}","{\"translate\":\"wrench_lore2\",\"color\":\"white\"}","{\"translate\":\"wrench_lore3\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11090002,Unbreakable:1}
execute if entity @s[scores={activate_third=1..}] run replaceitem entity @s hotbar.2 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] activate_third 1
scoreboard players reset @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_third=1}] run function classes:mechanic/wrench/activate
scoreboard players add @s[scores={activate_third=1..}] activate_third 1
execute if entity @s[scores={activate_third=15}] run function classes:mechanic/wrench/deactivate
scoreboard players set @s[scores={activate_third=30..}] activate_third 0
scoreboard players set @s maxHealth 150

replaceitem entity @s[scores={totalShots=0}] weapon.offhand arrow 2
replaceitem entity @s[scores={totalShots=1}] weapon.offhand arrow 1
replaceitem entity @s[scores={totalShots=2}] weapon.offhand air
replaceitem entity @s[scores={reload=0,shoot=0}] hotbar.0 carrot_on_a_stick{display:{Name:"{\"translate\":\"double_chambered_scattergun\"}",Lore:["{\"translate\":\"double_chambered_scattergun_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 7\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 2\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 2.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11090000,Unbreakable:1}
replaceitem entity @s[scores={reload=0,shoot=1..}] hotbar.0 paper{display:{Name:"{\"translate\":\"double_chambered_scattergun\"}",Lore:["{\"translate\":\"double_chambered_scattergun_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 7\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 2\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 2.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11090000}
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=0}] rightClick matches 1.. run scoreboard players set @s shoot 1
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=1}] rightClick matches 1.. run scoreboard players add @s totalShots 1
scoreboard players reset @s[nbt={SelectedItemSlot:0}] rightClick
execute if score @s shoot matches 1 run function classes:mechanic/shoot
scoreboard players add @s[scores={shoot=1..}] shoot 1
scoreboard players set @s[scores={shoot=20..}] shoot 0
scoreboard players add @s[scores={totalShots=2..,reload=0}] reload 1
execute if score @s reload matches 1.. run function classes:mechanic/reload
scoreboard players set @s[scores={crouching=1..}] crouching 0