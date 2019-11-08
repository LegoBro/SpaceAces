bossbar set main players @a[tag=awaiting]
scoreboard players set TotPlay Numbers 0
scoreboard players set RedPlay Numbers 0
execute as @a[tag=ready] run scoreboard players add RedPlay Numbers 1
execute as @a[tag=awaiting] run scoreboard players add TotPlay Numbers 1
execute if entity @a[tag=awaiting] store result bossbar main max run scoreboard players get TotPlay Numbers
execute if entity @a[tag=awaiting] store result bossbar main value run scoreboard players get RedPlay Numbers
