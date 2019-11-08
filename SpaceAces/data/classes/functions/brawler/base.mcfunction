replaceitem entity @s[tag=!invis,scores={crouching=0}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:0,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:16743705},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[tag=!invis,scores={crouching=1..}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:0,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:16743705},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if entity @s[scores={activate_second=0}] run replaceitem entity @s hotbar.1 carrot_on_a_stick{display:{Name:"{\"translate\":\"offensive_push\",\"color\":\"white\"}",Lore:["{\"translate\":\"offensive_push_lore1\",\"color\":\"white\"}","{\"translate\":\"offensive_push_lore2\",\"color\":\"white\"}","{\"translate\":\"offensive_push_lore3\",\"color\":\"white\"}","{\"translate\":\"offensive_push_lore4\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11070001,Unbreakable:1}
execute if entity @s[scores={activate_second=1..}] run replaceitem entity @s hotbar.1 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] activate_second 1
scoreboard players reset @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_second=1}] run function classes:brawler/offensive_push/activate
scoreboard players add @s[scores={activate_second=1..}] activate_second 1
execute if entity @s[scores={activate_second=100}] run function classes:brawler/offensive_push/deactivate
scoreboard players set @s[scores={activate_second=400..}] activate_second 0
execute if entity @s[scores={activate_third=0}] run replaceitem entity @s hotbar.2 carrot_on_a_stick{display:{Name:"{\"translate\":\"defensive_stance\",\"color\":\"white\"}",Lore:["{\"translate\":\"defensive_stance_lore1\",\"color\":\"white\"}","{\"translate\":\"defensive_stance_lore2\",\"color\":\"white\"}","{\"translate\":\"defensive_stance_lore3\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11070002,Unbreakable:1}
execute if entity @s[scores={activate_third=1..}] run replaceitem entity @s hotbar.2 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] activate_third 1
scoreboard players reset @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_third=1}] run function classes:brawler/defensive_stance/activate
scoreboard players add @s[scores={activate_third=1..}] activate_third 1
execute if entity @s[scores={activate_third=80}] run function classes:brawler/defensive_stance/deactivate
scoreboard players set @s[scores={activate_third=300..}] activate_third 0
scoreboard players set @s maxHealth 400

replaceitem entity @s hotbar.0 golden_sword{display:{Name:"{\"translate\":\"phase_sword\"}",Lore:["{\"translate\":\"phase_sword_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 20\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11070000,HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:20,Operation:0,UUIDLeast:369737,UUIDMost:252112,Slot:"mainhand"},{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-3,Operation:0,UUIDLeast:45318,UUIDMost:673759,Slot:"mainhand"}]}
scoreboard players set @s[scores={crouching=1..}] crouching 0
replaceitem entity @s weapon.offhand air