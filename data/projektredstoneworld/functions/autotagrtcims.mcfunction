execute positioned 24.39 -16.00 664.33 run summon armor_stand ~ ~ ~ {HandItems:[{},{}],Tags:["rtcimstagger"],ShowArms:1b,Marker:1b}
data modify entity @e[type=armor_stand,tag=rtcimstagger,limit=1,sort=nearest] HandItems[0] set from entity @s Items[0]

#execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtcitems] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtctool"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtcbuilding] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtcbuilding"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtccolored] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtccolor"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtcfood] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtcfood"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtcfunctional] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtcfunc"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtcmaterials] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtcmisc"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtcnatural] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtcnatural"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtcredstone] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtcredstone"]}'}}}}
execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,predicate=projektredstoneworld:is_rtctools] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtctool"]}'}}}}

execute if entity @e[type=armor_stand,tag=rtcimstagger,limit=1,nbt={HandItems:[{id: "minecraft:paper", tag: {display: {Name: '{"text":"","extra":["shulkerbox"]}'}}}]}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"","extra":["rtccolor"]}'}}}}


execute as @e[type=armor_stand,tag=rtcimstagger,limit=1] run kill @s