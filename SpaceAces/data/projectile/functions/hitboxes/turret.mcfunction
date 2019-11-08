#Hitbox for entities tagged with hb_turret
execute positioned ~ ~-1.21875 ~ if entity @e[tag=hb_turret,distance=..0.451,limit=1,sort=nearest] run function projectile:doubledamage
execute positioned ~ ~-0.625 ~ if entity @e[tag=hb_turret,distance=..0.541,limit=1,sort=nearest] run function projectile:damage