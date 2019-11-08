#Commands for fire_bomb spray impact
summon arrow ~.1 ~1 ~.1 {Fire:60,Motion:[0.7,-0.3,0.7],life:1150}
summon arrow ~.1 ~1 ~-.1 {Fire:60,Motion:[0.7,-0.3,-0.7],life:1150}
summon arrow ~-.1 ~1 ~.1 {Fire:60,Motion:[-0.7,-0.3,0.7],life:1150}
summon arrow ~-.1 ~1 ~-.1 {Fire:60,Motion:[-0.7,-0.3,-0.7],life:1150}

summon arrow ~.1 ~1 ~ {Fire:60,Motion:[1.0,-0.3,0.0],life:1150}
summon arrow ~ ~1 ~.1 {Fire:60,Motion:[0.0,-0.3,1.0],life:1150}
summon arrow ~ ~1 ~ {Fire:60,Motion:[0.0,-0.3,0.0],life:1150}
summon arrow ~ ~1 ~-.1 {Fire:60,Motion:[0.0,-0.3,-1.0],life:1150}
summon arrow ~-.1 ~1 ~ {Fire:60,Motion:[-1.0,-0.3,0.0],life:1150}
playsound block.fire.extinguish player @a ~ ~ ~ 2.0 2.0
