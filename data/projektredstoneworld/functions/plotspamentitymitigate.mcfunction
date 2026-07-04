# Called from rcrailschedule every 10t, delete this on world download preparations since plotworld will be gone
# spammerdetected will handle armor stand and vehicle spam, spammerdetected2 will handle other entity spam
tag @a remove spammerdetected
tag @a remove spammerdetected2
execute in plotworld as @e[type=armor_stand,x=0] at @s store result score @s plotentityspamcheck if entity @e[type=armor_stand,distance=..3]
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s store result score @s plotentityspamcheck if entity @e[type=#projektredstoneworld:vehicles,distance=..3]

execute in plotworld as @e[type=armor_stand,x=0] at @s if score @s plotentityspamcheck matches 25.. run tag @a[distance=..20] add spammerdetected
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s if score @s plotentityspamcheck matches 25.. run tag @a[distance=..20] add spammerdetected

execute in plotworld if entity @a[tag=spammerdetected,x=0] in overworld run setblock -258 44 391 minecraft:redstone_block

execute in plotworld as @e[type=armor_stand,x=0] at @s if score @s plotentityspamcheck matches 25.. run tellraw @a[distance=..20] {"text":"Warning: Excessive armor stand or vehicle spam nearby detected and reported to admins, this is a direct violation of plotworld rule P2. Prepare to provide an explanation, further violations will result in action.","color":"red"}
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s if score @s plotentityspamcheck matches 25.. run tellraw @a[distance=..20] {"text":"Warning: Excessive armor stand or vehicle spam nearby detected and reported to admins, this is a direct violation of plotworld rule P2. Prepare to provide an explanation, further violations will result in action.","color":"red"}
execute in plotworld as @e[type=armor_stand,x=0] at @s if score @s plotentityspamcheck matches 25.. run kill @s
execute in plotworld as @e[type=#projektredstoneworld:vehicles,x=0] at @s if score @s plotentityspamcheck matches 25.. run kill @s

# For pass 2: spammerdetected2
execute in plotworld as @a[x=0] at @s as @e[type=!player,type=!marker,distance=..20] at @s store result score @s plotentityspamcheck if entity @e[type=!player,type=!marker,distance=..15]
execute in plotworld as @a[x=0] at @s as @e[type=!player,type=!marker,distance=..20] at @s if score @s plotentityspamcheck matches 50.. run tag @a[distance=..20] add spammerdetected2

execute in plotworld if entity @a[tag=spammerdetected2,x=0] in overworld run setblock -257 44 391 minecraft:redstone_block

execute in plotworld as @a[x=0] at @s as @e[type=!player,type=!marker,distance=..20] at @s if score @s plotentityspamcheck matches 50.. run tag @e[type=!player,type=!marker,distance=..20,scores={plotentityspamcheck=25..}] add spammerdetected2tokill
execute in plotworld as @a[x=0] at @s as @e[type=!player,type=!marker,distance=..20,tag=spammerdetected2tokill] at @s run data modify entity @s DeathLootTable set value "minecraft:empty"
execute in plotworld as @a[x=0] at @s as @e[type=!player,type=!marker,distance=..20,tag=spammerdetected2tokill] at @s run kill @s