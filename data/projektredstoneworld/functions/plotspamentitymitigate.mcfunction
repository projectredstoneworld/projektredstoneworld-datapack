# Called from rcrailschedule every 10t, delete this on world download preparations since plotworld will be gone
tag @a remove spammerdetected
execute in plotworld as @e[type=armor_stand,x=0] at @s store result score @s plotentityspamcheck if entity @e[type=armor_stand,distance=..3]
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s store result score @s plotentityspamcheck if entity @e[type=#projektredstoneworld:vehicles,distance=..3]

execute in plotworld as @e[type=armor_stand,x=0] at @s if score @s plotentityspamcheck matches 25.. run tag @a[distance=..20] add spammerdetected
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s if score @s plotentityspamcheck matches 25.. run tag @a[distance=..20] add spammerdetected

execute in plotworld if entity @a[tag=spammerdetected,x=0] in overworld run setblock -258 44 391 minecraft:redstone_block

execute in plotworld as @e[type=armor_stand,x=0] at @s if score @s plotentityspamcheck matches 25.. run tellraw @a[distance=..20] {"text":"Warning: Excessive entity spam nearby detected and reported to admins, this is a direct violation of plotworld rule P2. Prepare to provide an explanation, further violations will result in action.","color":"red"}
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s if score @s plotentityspamcheck matches 25.. run tellraw @a[distance=..20] {"text":"Warning: Excessive entity spam nearby detected and reported to admins, this is a direct violation of plotworld rule P2. Prepare to provide an explanation, further violations will result in action.","color":"red"}
execute in plotworld as @e[type=armor_stand,x=0] at @s if score @s plotentityspamcheck matches 25.. run kill @s
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s if score @s plotentityspamcheck matches 25.. run kill @s