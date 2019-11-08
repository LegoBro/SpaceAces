#Used when reloading
replaceitem entity @s[scores={reload=5}] hotbar.0 golden_hoe{Damage:29.714285714285715,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=10}] hotbar.0 golden_hoe{Damage:27.42857142857143,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=15}] hotbar.0 golden_hoe{Damage:25.142857142857142,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=20}] hotbar.0 golden_hoe{Damage:22.857142857142858,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=25}] hotbar.0 golden_hoe{Damage:20.57142857142857,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=30}] hotbar.0 golden_hoe{Damage:18.285714285714285,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=35}] hotbar.0 golden_hoe{Damage:16,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=40}] hotbar.0 golden_hoe{Damage:13.714285714285715,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=45}] hotbar.0 golden_hoe{Damage:11.428571428571427,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=50}] hotbar.0 golden_hoe{Damage:9.142857142857142,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=55}] hotbar.0 golden_hoe{Damage:6.857142857142858,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=60}] hotbar.0 golden_hoe{Damage:4.571428571428573,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=65}] hotbar.0 golden_hoe{Damage:2.2857142857142847,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
replaceitem entity @s[scores={reload=70}] hotbar.0 golden_hoe{Damage:0,CustomModelData:11050000,display:{Name:"{\"translate\":\"reloading\"}"}}
effect give @s[scores={reload=1}] hunger 1 100 true
scoreboard players add @s[scores={reload=1..}] reload 1
scoreboard players set @s[scores={reload=70}] totalShots 0
execute if score @s reload matches 70 run playsound gun.reload hostile @a ~ ~ ~
scoreboard players set @s[scores={reload=70..}] reload 0