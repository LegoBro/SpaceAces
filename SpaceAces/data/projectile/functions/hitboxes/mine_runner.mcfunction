#Hitbox for entities tagged with hb_mine_runner
execute positioned ~ ~-0.15625 ~ if entity @e[tag=hb_mine_runner,distance=..0.427,limit=1,sort=nearest] run function projectile:doubledamage