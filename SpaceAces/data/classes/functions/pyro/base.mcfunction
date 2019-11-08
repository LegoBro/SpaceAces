replaceitem entity @s[tag=!invis,scores={crouching=0}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.05,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:15202048},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[tag=!invis,scores={crouching=1..}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.05,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:15202048},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if entity @s[scores={activate_second=0}] run replaceitem entity @s hotbar.1 carrot_on_a_stick{display:{Name:"{\"translate\":\"fire_bomb\",\"color\":\"white\"}",Lore:["{\"translate\":\"fire_bomb_lore1\",\"color\":\"white\"}","{\"translate\":\"fire_bomb_lore2\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11120001,Unbreakable:1}
execute if entity @s[scores={activate_second=1..}] run replaceitem entity @s hotbar.1 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] activate_second 1
scoreboard players reset @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_second=1}] run function classes:pyro/fire_bomb/activate
scoreboard players add @s[scores={activate_second=1..}] activate_second 1
execute if entity @s[scores={activate_second=2}] run function classes:pyro/fire_bomb/deactivate
scoreboard players set @s[scores={activate_second=100..}] activate_second 0
execute if entity @s[scores={activate_third=0}] run replaceitem entity @s hotbar.2 carrot_on_a_stick{display:{Name:"{\"translate\":\"self_immunity\",\"color\":\"white\"}",Lore:["{\"translate\":\"self_immunity_lore1\",\"color\":\"white\"}","{\"translate\":\"self_immunity_lore2\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11120002,Unbreakable:1}
execute if entity @s[scores={activate_third=1..}] run replaceitem entity @s hotbar.2 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] activate_third 1
scoreboard players reset @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_third=1}] run function classes:pyro/self_immunity/activate
scoreboard players add @s[scores={activate_third=1..}] activate_third 1
execute if entity @s[scores={activate_third=100}] run function classes:pyro/self_immunity/deactivate
scoreboard players set @s[scores={activate_third=240..}] activate_third 0
scoreboard players set @s maxHealth 300

replaceitem entity @s hotbar.0 golden_shovel{display:{Name:"{\"translate\":\"super_heated_glove\"}",Lore:["{\"translate\":\"super_heated_glove_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 30\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11120000,Enchantments:[{id:"minecraft:fire_aspect",lvl:1}],HideFlags:63,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:30,Operation:0,UUIDLeast:369737,UUIDMost:252112,Slot:"mainhand"},{AttributeName:"generic.attackSpeed",Name:"generic.attackSpeed",Amount:-3.5,Operation:0,UUIDLeast:45318,UUIDMost:673759,Slot:"mainhand"}]}
scoreboard players set @s[scores={crouching=1..}] crouching 0
replaceitem entity @s weapon.offhand air