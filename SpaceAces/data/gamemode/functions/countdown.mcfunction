scoreboard players operation Mission display = Mission Numbers
scoreboard players operation Mission display /= 20 Numbers
scoreboard players remove Mission Numbers 1
execute if score Mission Numbers matches 0 unless score Gamemode Numbers matches 4 if entity @p[tag=awaiting,team=blue] if entity @p[tag=awaiting,team=red] run function arena:load
execute if score Mission Numbers matches 0 unless score Gamemode Numbers matches 4 unless entity @p[tag=awaiting,team=blue] run function gamemode:nep
execute if score Mission Numbers matches 0 unless score Gamemode Numbers matches 4 if entity @p[tag=awaiting,team=blue] unless entity @p[tag=awaiting,team=red] run function gamemode:nep
execute if entity @a[tag=awaiting,tag=!ready] run function gamemode:abort_game
execute if score Mission Numbers matches 0 if score Gamemode Numbers matches 4 run function gamemode:escape/load
