execute if entity @s[team=blue] run summon armor_stand ~ ~ ~ {Team:"blue",Invulnerable:1b,Small:1b,Marker:0b,Invisible:1b,NoBasePlate:1b,Tags:["flash_grenade"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:emerald_block",Count:1b}]}
execute if entity @s[team=red] run summon armor_stand ~ ~ ~ {Team:"red",Invulnerable:1b,Small:1b,Marker:0b,Invisible:1b,NoBasePlate:1b,Tags:["flash_grenade"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:emerald_block",Count:1b}]}
playsound minecraft:entity.arrow.shoot player @a ~ ~ ~ 1 2 0
