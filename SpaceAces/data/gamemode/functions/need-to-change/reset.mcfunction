#Commands ran once game is Finished
data merge block 8 200 65 {Text2:"{\"text\":\"Launch Mission\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:gamemode:cycle\"}}",Text3:"{\"text\":\"\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"\"}}"}
execute as @a[tag=in_game] run function load:spawn
tag @a[tag=in_game] remove in_game
execute as @a[team=spectator] run function load:spawn
bossbar set blue players
bossbar set red players
bossbar set main players
scoreboard players reset ActiveMode
