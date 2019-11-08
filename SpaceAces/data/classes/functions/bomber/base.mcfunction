replaceitem entity @s[tag=!invis,scores={crouching=0}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:0.05,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:2593195},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[tag=!invis,scores={crouching=1..}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:2593195},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if entity @s[scores={activate_second=0}] run replaceitem entity @s hotbar.1 carrot_on_a_stick{display:{Name:"{\"translate\":\"concussive_blast\",\"color\":\"white\"}",Lore:["{\"translate\":\"concussive_blast_lore1\",\"color\":\"white\"}","{\"translate\":\"concussive_blast_lore2\",\"color\":\"white\"}","{\"translate\":\"concussive_blast_lore3\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11040001,Unbreakable:1}
execute if entity @s[scores={activate_second=1..}] run replaceitem entity @s hotbar.1 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] activate_second 1
scoreboard players reset @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_second=1}] run function classes:bomber/concussive_blast/activate
scoreboard players add @s[scores={activate_second=1..}] activate_second 1
execute if entity @s[scores={activate_second=5}] run function classes:bomber/concussive_blast/deactivate
scoreboard players set @s[scores={activate_second=200..}] activate_second 0
execute if entity @s[scores={activate_third=0}] run replaceitem entity @s hotbar.2 carrot_on_a_stick{display:{Name:"{\"translate\":\"mine\",\"color\":\"white\"}",Lore:["{\"translate\":\"mine_lore1\",\"color\":\"white\"}","{\"translate\":\"mine_lore2\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11040002,Unbreakable:1}
execute if entity @s[scores={activate_third=1..}] run replaceitem entity @s hotbar.2 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] activate_third 1
scoreboard players reset @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_third=1}] run function classes:bomber/mine/activate
scoreboard players add @s[scores={activate_third=1..}] activate_third 1
execute if entity @s[scores={activate_third=20}] run function classes:bomber/mine/deactivate
scoreboard players set @s[scores={activate_third=300..}] activate_third 0
scoreboard players set @s maxHealth 125

replaceitem entity @s[scores={totalShots=0}] weapon.offhand arrow 8
replaceitem entity @s[scores={totalShots=1}] weapon.offhand arrow 7
replaceitem entity @s[scores={totalShots=2}] weapon.offhand arrow 6
replaceitem entity @s[scores={totalShots=3}] weapon.offhand arrow 5
replaceitem entity @s[scores={totalShots=4}] weapon.offhand arrow 4
replaceitem entity @s[scores={totalShots=5}] weapon.offhand arrow 3
replaceitem entity @s[scores={totalShots=6}] weapon.offhand arrow 2
replaceitem entity @s[scores={totalShots=7}] weapon.offhand arrow 1
replaceitem entity @s[scores={totalShots=8}] weapon.offhand air
replaceitem entity @s[scores={reload=0,shoot=0}] hotbar.0 carrot_on_a_stick{display:{Name:"{\"translate\":\"plasma_grenade_launcher\"}",Lore:["{\"translate\":\"plasma_grenade_launcher_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 10\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 8\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 2.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11040000,Unbreakable:1}
replaceitem entity @s[scores={reload=0,shoot=1..}] hotbar.0 paper{display:{Name:"{\"translate\":\"plasma_grenade_launcher\"}",Lore:["{\"translate\":\"plasma_grenade_launcher_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 10\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 8\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 2.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11040000}
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=0}] rightClick matches 1.. run scoreboard players set @s shoot 1
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=1}] rightClick matches 1.. run scoreboard players add @s totalShots 1
scoreboard players reset @s[nbt={SelectedItemSlot:0}] rightClick
execute if score @s shoot matches 1 run function classes:bomber/shoot
scoreboard players add @s[scores={shoot=1..}] shoot 1
scoreboard players set @s[scores={shoot=15..}] shoot 0
scoreboard players add @s[scores={totalShots=8..,reload=0}] reload 1
execute if score @s reload matches 1.. run function classes:bomber/reload
scoreboard players set @s[scores={crouching=1..}] crouching 0