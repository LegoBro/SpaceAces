playsound minecraft:block.note_block.xylophone player @s ~ ~ ~ 1 2 0
execute as @s[scores={crouching=0}] at @s positioned ~ ~1.4 ~ run particle crit ^ ^ ^1 0 0 0 0 1 force
execute as @s[scores={crouching=1}] at @s positioned ~ ~1.15 ~ run particle crit ^ ^ ^1 0 0 0 0 1 force
