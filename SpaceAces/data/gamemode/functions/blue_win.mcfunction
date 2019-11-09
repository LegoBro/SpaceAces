xp add @a[team=blue,tag=in_game] 1 levels
title @a title ["",{"text":"The IGSR Wins!","color":"dark_blue"}]
tellraw @a {"text":"The IGSR are victorious!","color":"blue"}
execute at @a run playsound minecraft:ui.toast.challenge_complete master @s 8 200 8 50000 2
function gamemode:reset
