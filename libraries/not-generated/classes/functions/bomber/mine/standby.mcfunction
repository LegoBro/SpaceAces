execute if entity @s[team=blue] if entity @e[team=red,distance=..1.95] unless entity @a[team=blue,distance=..1] positioned ~ ~1 ~ run function classes:bomber/mine/explode
execute if entity @s[team=red] if entity @e[team=blue,distance=..1.95] unless entity @a[team=red,distance=..1] positioned ~ ~1 ~ run function classes:bomber/mine/explode
