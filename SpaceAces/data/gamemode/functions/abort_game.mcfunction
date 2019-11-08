#Commands when game is aborted
data merge block 8 200 65 {Text2:"{\"text\":\"Launch Mission\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:launch_game\"}}",Text3:"{\"text\":\"\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"\"}}"}
scoreboard players reset Mission Numbers
scoreboard players reset Mission display
tellraw @a[tag=awaiting] ["",{"text":"[","color":"dark_gray","bold":true},{"text":"Mission startup disengaged, not all players are ready","color":"gray","clickEvent":{"action":"run_command","value":"trigger worm_hole set 1"},"bold":false},{"text":"]","color":"dark_gray"}]
