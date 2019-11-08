xp add @a[team=red,tag=in_game] 10
tellraw @a {"text":"The RLU are victorious!","color":"red"}
execute at @a run playsound minecraft:ui.toast.challenge_complete master @s 8 200 8 50000 2
function gamemode:reset
