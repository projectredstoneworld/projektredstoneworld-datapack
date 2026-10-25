# can only restore one player at a time, give entity restoretargetrtcm tag then execute this function as rtcminv_store with same id as entity

# Restore radiationdose
execute if score @s radiationdose_save matches 1.. run scoreboard players operation @s radiationdose = @s radiationdose_save
scoreboard players reset @s radiationdose_save

# count the amount of items in the array so we know how often to repeat
execute store result score #restorertcmitems info run data get entity @s data.Inventory

# if there is at least one item, start the process.
execute if score #restorertcmitems info matches 1.. positioned -257 49 385 run function projektredstoneworld:return_item_rtcm

# GC marker entity
execute at @s run kill @s