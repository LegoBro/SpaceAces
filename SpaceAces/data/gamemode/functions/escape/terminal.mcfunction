scoreboard players add @s i 1
execute if score @s i matches ..25 run data merge entity @s {CustomNameVisible:1b,CustomName:'{"translate":"terminal_1"}'}
execute if score @s i matches 26..50 run data merge entity @s {CustomNameVisible:1b,CustomName:'{"translate":"terminal_2"}'}
execute if score @s i matches 51..75 run data merge entity @s {CustomNameVisible:1b,CustomName:'{"translate":"terminal_3"}'}
execute if score @s i matches 76..100 run data merge entity @s {CustomNameVisible:1b,CustomName:'{"translate":"terminal_4"}'}
execute if score @s i matches 101.. run data merge entity @s {CustomNameVisible:1b,CustomName:'{"translate":"terminal_5"}'}
execute if score @s i matches 101.. run tag @s remove active
