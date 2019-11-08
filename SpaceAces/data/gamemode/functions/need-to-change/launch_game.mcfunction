#Commands ran when game is launched
data merge block 8 200 65 {Text2:"{\"text\":\"Abort Mission\",\"color\":\"red\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:abort_game\"}}",Text3:"{\"text\":\"\",\"color\":\"green\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"\"}}"}
execute at @a run playsound minecraft:block.conduit.deactivate master @a ~ ~ ~ 1.0 2.0 1.0
scoreboard players set Mission Numbers 600
scoreboard objectives modify display displayname {"text":"Status:","color":"green"}
scoreboard players set Prestart Numbers 1
tellraw @a ["",{"text":"[","color":"dark_gray","bold":true},{"text":"Mission startup engaged, have players join both teams in the Team Selection area","color":"gray","clickEvent":{"action":"run_command","value":"trigger worm_hole set 1"},"bold":false},{"text":"]","color":"dark_gray"}]