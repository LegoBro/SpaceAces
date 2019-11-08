# Loads tdm (dynamic)
  scoreboard players set ActiveMode Numbers 2
    execute if score Map Numbers matches 0 run function arena:load_ruins
    execute if score Map Numbers matches 1 run function arena:load_aqua_base
    execute if score Map Numbers matches 2 run function arena:load_dust_temple
    execute if score Map Numbers matches 3 run function arena:load_snow_bowl
    execute if score Map Numbers matches 4 run function arena:load_gray_caves
    scoreboard players set blue_lives Numbers 10
    scoreboard players set red_lives Numbers 10
    bossbar set minecraft:blue name ["",{"text":"IGSR Lives Left","color":"blue"}]
    bossbar set minecraft:red name ["",{"text":"RLU Lives Left","color":"red"}]
    bossbar set minecraft:blue max 10
    bossbar set minecraft:red max 10