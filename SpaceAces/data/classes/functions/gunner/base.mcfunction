replaceitem entity @s[tag=!invis,scores={crouching=0}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:0,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:8462507},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
replaceitem entity @s[tag=!invis,scores={crouching=1..}] armor.head minecraft:leather_helmet{HideFlags:63,AttributeModifiers:[{AttributeName:"generic.movementSpeed",Name:"generic.movementSpeed",Amount:-0.1,Operation:2,UUIDLeast:513394,UUIDMost:210043}],Unbreakable:1,display:{color:8462507},Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}
execute if entity @s[scores={activate_second=0}] run replaceitem entity @s hotbar.1 carrot_on_a_stick{display:{Name:"{\"translate\":\"infinite_ammo\",\"color\":\"white\"}",Lore:["{\"translate\":\"infinite_ammo_lore1\",\"color\":\"white\"}","{\"translate\":\"infinite_ammo_lore2\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11050001,Unbreakable:1}
execute if entity @s[scores={activate_second=1..}] run replaceitem entity @s hotbar.1 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] activate_second 1
scoreboard players reset @s[nbt={SelectedItemSlot:1},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_second=1}] run function classes:gunner/infinite_ammo/activate
scoreboard players add @s[scores={activate_second=1..}] activate_second 1
execute if entity @s[scores={activate_second=200}] run function classes:gunner/infinite_ammo/deactivate
scoreboard players set @s[scores={activate_second=600..}] activate_second 0
execute if entity @s[scores={activate_third=0}] run replaceitem entity @s hotbar.2 carrot_on_a_stick{display:{Name:"{\"translate\":\"large_heal\",\"color\":\"white\"}",Lore:["{\"translate\":\"large_heal_lore1\",\"color\":\"white\"}","{\"translate\":\"large_heal_lore2\",\"color\":\"white\"}"]},HideFlags:63,CustomModelData:11050002,Unbreakable:1}
execute if entity @s[scores={activate_third=1..}] run replaceitem entity @s hotbar.2 gray_dye
scoreboard players set @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] activate_third 1
scoreboard players reset @s[nbt={SelectedItemSlot:2},scores={rightClick=1..}] rightClick
execute if entity @s[scores={activate_third=1}] run function classes:gunner/large_heal/activate
scoreboard players add @s[scores={activate_third=1..}] activate_third 1
execute if entity @s[scores={activate_third=20}] run function classes:gunner/large_heal/deactivate
scoreboard players set @s[scores={activate_third=400..}] activate_third 0
scoreboard players set @s maxHealth 300

replaceitem entity @s[scores={totalShots=0}] weapon.offhand arrow 30
replaceitem entity @s[scores={totalShots=1}] weapon.offhand arrow 29
replaceitem entity @s[scores={totalShots=2}] weapon.offhand arrow 28
replaceitem entity @s[scores={totalShots=3}] weapon.offhand arrow 27
replaceitem entity @s[scores={totalShots=4}] weapon.offhand arrow 26
replaceitem entity @s[scores={totalShots=5}] weapon.offhand arrow 25
replaceitem entity @s[scores={totalShots=6}] weapon.offhand arrow 24
replaceitem entity @s[scores={totalShots=7}] weapon.offhand arrow 23
replaceitem entity @s[scores={totalShots=8}] weapon.offhand arrow 22
replaceitem entity @s[scores={totalShots=9}] weapon.offhand arrow 21
replaceitem entity @s[scores={totalShots=10}] weapon.offhand arrow 20
replaceitem entity @s[scores={totalShots=11}] weapon.offhand arrow 19
replaceitem entity @s[scores={totalShots=12}] weapon.offhand arrow 18
replaceitem entity @s[scores={totalShots=13}] weapon.offhand arrow 17
replaceitem entity @s[scores={totalShots=14}] weapon.offhand arrow 16
replaceitem entity @s[scores={totalShots=15}] weapon.offhand arrow 15
replaceitem entity @s[scores={totalShots=16}] weapon.offhand arrow 14
replaceitem entity @s[scores={totalShots=17}] weapon.offhand arrow 13
replaceitem entity @s[scores={totalShots=18}] weapon.offhand arrow 12
replaceitem entity @s[scores={totalShots=19}] weapon.offhand arrow 11
replaceitem entity @s[scores={totalShots=20}] weapon.offhand arrow 10
replaceitem entity @s[scores={totalShots=21}] weapon.offhand arrow 9
replaceitem entity @s[scores={totalShots=22}] weapon.offhand arrow 8
replaceitem entity @s[scores={totalShots=23}] weapon.offhand arrow 7
replaceitem entity @s[scores={totalShots=24}] weapon.offhand arrow 6
replaceitem entity @s[scores={totalShots=25}] weapon.offhand arrow 5
replaceitem entity @s[scores={totalShots=26}] weapon.offhand arrow 4
replaceitem entity @s[scores={totalShots=27}] weapon.offhand arrow 3
replaceitem entity @s[scores={totalShots=28}] weapon.offhand arrow 2
replaceitem entity @s[scores={totalShots=29}] weapon.offhand arrow 1
replaceitem entity @s[scores={totalShots=30}] weapon.offhand air
replaceitem entity @s[scores={reload=0,shoot=0}] hotbar.0 carrot_on_a_stick{display:{Name:"{\"translate\":\"plasma_cannon\"}",Lore:["{\"translate\":\"plasma_cannon_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 8\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 30\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 3.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11050000,Unbreakable:1}
replaceitem entity @s[scores={reload=0,shoot=1..}] hotbar.0 paper{display:{Name:"{\"translate\":\"plasma_cannon\"}",Lore:["{\"translate\":\"plasma_cannon_lore\",\"color\":\"white\"}","{\"text\":\" - damage: 8\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - ammo: 30\",\"color\":\"white\",\"italic\":false}","{\"text\":\" - reload speed: 3.5s\",\"color\":\"white\",\"italic\":false}"]},HideFlags:63,CustomModelData:11050000}
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=0}] rightClick matches 1.. run scoreboard players set @s shoot 1
execute if score @s[nbt={SelectedItemSlot:0},scores={shoot=1}] rightClick matches 1.. run scoreboard players add @s totalShots 1
scoreboard players reset @s[nbt={SelectedItemSlot:0}] rightClick
execute if score @s shoot matches 1 run function classes:gunner/shoot
scoreboard players add @s[scores={shoot=1..}] shoot 1
scoreboard players set @s[scores={shoot=1..}] shoot 0
scoreboard players add @s[scores={totalShots=30..,reload=0}] reload 1
execute if score @s reload matches 1.. run function classes:gunner/reload
scoreboard players set @s[scores={crouching=1..}] crouching 0