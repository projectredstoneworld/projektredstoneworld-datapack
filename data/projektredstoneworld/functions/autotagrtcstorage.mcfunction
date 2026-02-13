execute positioned 24.39 -16.00 664.33 run summon armor_stand ~ ~ ~ {HandItems:[{},{}],Tags:["rtcisstagger"],ShowArms:1b,Marker:1b}
data modify entity @e[type=armor_stand,tag=rtcisstagger,limit=1,sort=nearest] HandItems[0] set from entity @s Item

execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcitems] run tag @s add rtcitem
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcbuilding] run tag @s add rtcbuilding
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtccolored] run tag @s add rtccolored
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcfood] run tag @s add rtcfood
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcfunctional] run tag @s add rtcfunctional
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcmaterials] run tag @s add rtcmaterial
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcnatural] run tag @s add rtcnatural
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcredstone] run tag @s add rtcredstone
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtctools] run tag @s add rtctool
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcshulkers,nbt={HandItems:[{tag:{BlockEntityTag:{Items:[{}]}}},{}]}] run tag @s add rtcshulker
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcshulkers,nbt={HandItems:[{tag:{BlockEntityTag:{Items:[{}]}}},{}]}] run tag @s remove rtccolored
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcshulkers] unless entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcshulkers,nbt={HandItems:[{tag:{BlockEntityTag:{Items:[{}]}}},{}]}] run tag @s add rtccolored
execute if entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcshulkers] unless entity @e[type=armor_stand,tag=rtcisstagger,limit=1,predicate=projektredstoneworld:is_rtcshulkers,nbt={HandItems:[{tag:{BlockEntityTag:{Items:[{}]}}},{}]}] run tag @s add rtcshulkerempty


execute as @e[type=armor_stand,tag=rtcisstagger,limit=1] run kill @s