tag @s add kill
execute if entity @s[tag=stun] run function classes:shocksmith/stun/land
execute if entity @s[tag=fire_bomb] run function classes:pyro/fire_bomb/land
execute if entity @s[tag=plasma_grenade] run execute facing entity @p eyes run summon creeper ^ ^ ^1 {ExplosionRadius:2b,Fuse:0,ignited:1b}
execute if entity @s[tag=rocket] run execute facing entity @p eyes run summon creeper ^ ^ ^1 {ExplosionRadius:2b,Fuse:0,ignited:1b}
execute if entity @s[tag=chem] run function classes:scientist/chem_impact
execute if entity @s[tag=shock_grenade] run function classes:shocksmith/shock_grenade_impact