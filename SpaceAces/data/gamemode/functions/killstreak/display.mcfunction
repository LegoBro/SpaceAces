#Displays the current maps and creates signs for them
    data merge block 8 205 40 {Text2:"{\"text\":\"Moon Base\",\"color\":\"dark_blue\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"tellraw @a [\\\"\\\",{\\\"text\\\":\\\"Selected Map Moon Base\\\",\\\"color\\\":\\\"dark_green\\\",\\\"bold\\\":true}]\"}}"}
    replaceitem entity @e[tag=map_display_0,type=armor_stand] armor.head player_head{SkullOwner:{Id:"8a13128f-35a9-4698-8b05-e834689bd240",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMjdhZDk2Y2IyYTRiMTRkMDE2MWYyODc5OTRkM2RiMTg3YWZkODcxNjRmMzk4N2I4N2U3ZjExOGQxZjU4NzkifX19"}]}}}
    data merge block 9 205 40 {Text2:"{\"text\":\"Magma Forge\",\"color\":\"dark_blue\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"tellraw @a [\\\"\\\",{\\\"text\\\":\\\"Selected Map Magma Forge\\\",\\\"color\\\":\\\"dark_green\\\",\\\"bold\\\":true}]\"}}"}
    replaceitem entity @e[tag=map_display_1,type=armor_stand] armor.head player_head{SkullOwner:{Id:"f2690158-fdfc-4c24-8b3d-f0dfdfe520b0",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDRiY2NmYmRhZmRlNDk1YjU3NDhiYzg0YTU0NzczNWU5MGYwNzYzODFhMTBjZmQxYzkyZGJiMDdjMWZkNWIifX19"}]}}}
    data merge block 7 205 40 {Text2:"{\"text\":\"Broken City\",\"color\":\"dark_blue\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"tellraw @a [\\\"\\\",{\\\"text\\\":\\\"Selected Map Broken City\\\",\\\"color\\\":\\\"dark_green\\\",\\\"bold\\\":true}]\"}}"}
    replaceitem entity @e[tag=map_display_2,type=armor_stand] armor.head player_head{SkullOwner:{Id:"efd4fef7-2b20-4b40-88f4-ff2c81d891ce",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZmE0YzRhZGZmYWJiNjM4ZTNlNDFhOTM5YjRkZjE1ZWYzODA4MGMxNmMzNzkwODExOTExZGFkZjYyNjEzZDYifX19"}]}}}
    data merge block 11 205 38 {Text2:"{\"text\":\"Dark Lair\",\"color\":\"dark_blue\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"tellraw @a [\\\"\\\",{\\\"text\\\":\\\"Selected Map Dark Lair\\\",\\\"color\\\":\\\"dark_green\\\",\\\"bold\\\":true}]\"}}"}
    replaceitem entity @e[tag=map_display_3,type=armor_stand] armor.head player_head{SkullOwner:{Id:"df238c0d-d61c-4d4f-84e7-fb6d52e4358e",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZmFhZDZmZmFmNmZiOWE4ZWVhOGYzZGJlYTZkZGYzNDcyYTBhNTQ2YjVlMTk0YmQ1NWI0MzNiZDlkMTU4OTMwIn19fQ=="}]}}}
    data merge block 5 205 38 {Text2:"{\"text\":\"Reef Bunker\",\"color\":\"dark_blue\",\"bold\":true,\"clickEvent\":{\"action\":\"run_command\",\"value\":\"tellraw @a [\\\"\\\",{\\\"text\\\":\\\"Selected Map Reef Bunker\\\",\\\"color\\\":\\\"dark_green\\\",\\\"bold\\\":true}]\"}}"}
    replaceitem entity @e[tag=map_display_4,type=armor_stand] armor.head player_head{SkullOwner:{Id:"0126ad57-6132-45cf-ab77-a62129326aaf",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvN2RiYWMxYmUwOWNiNGI1MzQzZGFiOTM0NTA4MDI3NzQ2MmZiOGQxYmIxOTEwOTg0YTM0NDQ3NzExYTRiMGMzNCJ9fX0="}]}}}
    setblock 5 205 36 air
    setblock 11 205 36 air
    setblock 5 205 37 air
    setblock 11 205 37 air