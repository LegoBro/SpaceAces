#Commands when game is aborted
data merge block 8 200 65 {Text2:"{\"text\":\"Launch Mission\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:gamemode:cycle\"}}",Text3:"{\"text\":\"\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"\"}}"}
scoreboard players reset Mission Numbers
scoreboard players reset Mission display
