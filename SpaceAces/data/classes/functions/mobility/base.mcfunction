replaceitem entity @s[tag=!invis,scores={crouching=0}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:0.3,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:3669775},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[tag=!invis,scores={crouching=1..}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:0.2,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:3669775},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if entity @s[scores={activate_second=0}] run replaceitem entity @s hotbar.1 carrot_on_a_stick{display:{Name:"{\"translate\":\"vertical_boost\",\"color\":\"white\"}",Lore:["{\"translate\":\"vertical_boost_lore1\",\"color\":\"white\"}","{\"translate\":\"vertical_boost_lore2\",\"color\":\"white\"}","{\"translate\":\"vertical_boost_lore3\",\"color\":\"white\"}","{\"translate\":\"vertical_boost_lore4\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11080001,Unbreakable:1}
execute if entity @s[scores={activate_second=1..}] run replaceitem entity @s hotbar.1 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] activate_second 1
scoreboard players reset @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_second=1}] run function classes:mobility/vertical_boost/activate
scoreboard players add @s[scores={activate_second=1..}] activate_second 1
execute if entity @s[scores={activate_second=20}] run function classes:mobility/vertical_boost/deactivate
scoreboard players set @s[scores={activate_second=150..}] activate_second 0
execute if entity @s[scores={activate_third=0}] run replaceitem entity @s hotbar.2 carrot_on_a_stick{display:{Name:"{\"translate\":\"flash_drop\",\"color\":\"white\"}",Lore:["{\"translate\":\"flash_drop_lore1\",\"color\":\"white\"}","{\"translate\":\"flash_drop_lore2\",\"color\":\"white\"}","{\"translate\":\"flash_drop_lore3\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11080002,Unbreakable:1}
execute if entity @s[scores={activate_third=1..}] run replaceitem entity @s hotbar.2 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] activate_third 1
scoreboard players reset @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_third=1}] run function classes:mobility/flash_drop/activate
scoreboard players add @s[scores={activate_third=1..}] activate_third 1
execute if entity @s[scores={activate_third=10}] run function classes:mobility/flash_drop/deactivate
scoreboard players set @s[scores={activate_third=200..}] activate_third 0
scoreboard players set @s maxHealth 100

replaceitem entity @s[scores={totalShots=0}] weapon.offhand arrow 15
replaceitem entity @s[scores={totalShots=1}] weapon.offhand arrow 14
replaceitem entity @s[scores={totalShots=2}] weapon.offhand arrow 13
replaceitem entity @s[scores={totalShots=3}] weapon.offhand arrow 12
replaceitem entity @s[scores={totalShots=4}] weapon.offhand arrow 11
replaceitem entity @s[scores={totalShots=5}] weapon.offhand arrow 10
replaceitem entity @s[scores={totalShots=6}] weapon.offhand arrow 9
replaceitem entity @s[scores={totalShots=7}] weapon.offhand arrow 8
replaceitem entity @s[scores={totalShots=8}] weapon.offhand arrow 7
replaceitem entity @s[scores={totalShots=9}] weapon.offhand arrow 6
replaceitem entity @s[scores={totalShots=10}] weapon.offhand arrow 5
replaceitem entity @s[scores={totalShots=11}] weapon.offhand arrow 4
replaceitem entity @s[scores={totalShots=12}] weapon.offhand arrow 3
replaceitem entity @s[scores={totalShots=13}] weapon.offhand arrow 2
replaceitem entity @s[scores={totalShots=14}] weapon.offhand arrow 1
replaceitem entity @s[scores={totalShots=15}] weapon.offhand air
replaceitem entity @s[scores={reload=0,shoot=0}] hotbar.0 carrot_on_a_stick{display:{Name:"{\"translate\":\"light_surge_rifle\"}",Lore:["{\"translate\":\"light_surge_rifle_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 9\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 15\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 2.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11080000,Unbreakable:1}
replaceitem entity @s[scores={reload=0,shoot=1..}] hotbar.0 paper{display:{Name:"{\"translate\":\"light_surge_rifle\"}",Lore:["{\"translate\":\"light_surge_rifle_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 9\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 15\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 2.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11080000}
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=0}] rightClick matches 1.. run scoreboard players set @s shoot 1
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=1}] rightClick matches 1.. run scoreboard players add @s totalShots 1
scoreboard players reset @s[nbt={SelectedItemSlot:0}] rightClick
execute if score @s shoot matches 1 run function classes:mobility/shoot
scoreboard players add @s[scores={shoot=1..}] shoot 1
scoreboard players set @s[scores={shoot=3..}] shoot 0
scoreboard players add @s[scores={totalShots=15..,reload=0}] reload 1
execute if score @s reload matches 1.. run function classes:mobility/reload
scoreboard players set @s[scores={crouching=1..}] crouching 0