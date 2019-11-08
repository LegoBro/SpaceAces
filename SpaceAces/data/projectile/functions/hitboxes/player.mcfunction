#Hitbox for entities tagged with hb_player
execute positioned ~ ~-1.53125 ~ if entity @e[tag=hb_player,distance=..0.378,limit=1,sort=nearest] run function projectile:doubledamage
execute positioned ~ ~-0.984375 ~ if entity @e[tag=hb_player,distance=..0.557,limit=1,sort=nearest] run function projectile:damage
execute positioned ~ ~-0.328125 ~ if entity @e[tag=hb_player,distance=..0.409,limit=1,sort=nearest] run function projectile:damage