#Commands ran once game is Finished
data merge block 8 200 65 {Text2:"{\"text\":\"Launch Mission\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:launch_game\"}}",Text3:"{\"text\":\"\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"\"}}"}
execute as @a[tag=in_game] run function load:spawn
tag @a[tag=in_game] remove in_game
execute as @a[team=spectator] run function load:spawn
bossbar set blue players
bossbar set red players
bossbar set main players
scoreboard players reset ActiveMode
scoreboard players reset * display
tag @a[tag=ready] remove ready
setblock 9 195 5 oak_wall_sign[facing=east]
data merge block 9 195 5 {Text2:"{\"text\":\"[Exit]\",\"color\":\"dark_red\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:exit_team_selection\"}}"}
setblock 7 195 5 oak_wall_sign[facing=west]
data merge block 7 195 5 {Text2:"{\"text\":\"[Exit]\",\"color\":\"dark_red\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:exit_team_selection\"}}"}
scoreboard players reset @a i
