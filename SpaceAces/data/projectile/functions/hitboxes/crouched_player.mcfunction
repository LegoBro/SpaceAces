#Hitbox for entities tagged with hb_crouched_player
execute positioned ~ ~-1.09375 ~ if entity @e[tag=hb_crouched_player,distance=..0.378,limit=1,sort=nearest] run function projectile:doubledamage
execute positioned ~ ~-0.546875 ~ if entity @e[tag=hb_crouched_player,distance=..0.557,limit=1,sort=nearest] run function projectile:damage
execute positioned ~ ~-0.109375 ~ if entity @e[tag=hb_crouched_player,distance=..0.267,limit=1,sort=nearest] run function projectile:damage