playsound minecraft:gun.hit player @s ~ ~ ~ 1 0 0
execute as @s[scores={crouching=0}] at @s positioned ~ ~1.4 ~ run particle enchanted_hit ^ ^ ^1 0 0 0 0 1 force
execute as @s[scores={crouching=1}] at @s positioned ~ ~1.15 ~ run particle enchanted_hit ^ ^ ^1 0 0 0 0 1 force
