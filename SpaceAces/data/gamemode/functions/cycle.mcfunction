# Cycles the currently selected gamemode (dynamic)
scoreboard players add Gamemode Numbers 1
execute if score Gamemode Numbers matches 4.. run scoreboard players set Gamemode Numbers 0
  execute if score Gamemode Numbers matches 0 run data merge block 9 200 65 {Text2:"{\"text\":\"\",\"color\":\"black\"}",Text2:"{\"text\":\"Mission Type:\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:cycle\"}}",Text3:"{\"text\":\"Duel\",\"color\":\"dark_gray\",\"bold\":true}"}
  execute if score Gamemode Numbers matches 0 run function gamemode:duel/display
  execute if score Gamemode Numbers matches 0 run scoreboard players set MinPlay Numbers 2
  execute if score Gamemode Numbers matches 0 run scoreboard players set RecPlay Numbers 2
  execute if score Gamemode Numbers matches 1 run data merge block 9 200 65 {Text2:"{\"text\":\"\",\"color\":\"black\"}",Text2:"{\"text\":\"Mission Type:\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:cycle\"}}",Text3:"{\"text\":\"TDM\",\"color\":\"dark_gray\",\"bold\":true}"}
  execute if score Gamemode Numbers matches 1 run function gamemode:tdm/display
  execute if score Gamemode Numbers matches 1 run scoreboard players set MinPlay Numbers 2
  execute if score Gamemode Numbers matches 1 run scoreboard players set RecPlay Numbers 4
  execute if score Gamemode Numbers matches 2 run data merge block 9 200 65 {Text2:"{\"text\":\"\",\"color\":\"black\"}",Text2:"{\"text\":\"Mission Type:\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:cycle\"}}",Text3:"{\"text\":\"Setback\",\"color\":\"dark_gray\",\"bold\":true}"}
  execute if score Gamemode Numbers matches 2 run function gamemode:setback/display
  execute if score Gamemode Numbers matches 2 run scoreboard players set MinPlay Numbers 2
  execute if score Gamemode Numbers matches 2 run scoreboard players set RecPlay Numbers 6
  execute if score Gamemode Numbers matches 3 run data merge block 9 200 65 {Text2:"{\"text\":\"\",\"color\":\"black\"}",Text2:"{\"text\":\"Mission Type:\",\"color\":\"green\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function gamemode:cycle\"}}",Text3:"{\"text\":\"Killstreak\",\"color\":\"dark_gray\",\"bold\":true}"}
  execute if score Gamemode Numbers matches 3 run function gamemode:killstreak/display
  execute if score Gamemode Numbers matches 3 run scoreboard players set MinPlay Numbers 2
  execute if score Gamemode Numbers matches 3 run scoreboard players set RecPlay Numbers 2