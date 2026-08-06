# can only restore one player at a time, give entity restoretargetlimbo tag then execute this function as limboinv_store with same id as entity
# count the amount of items in the array so we know how often to repeat
execute store result score #restorelimboitems info run data get entity @s data.Inventory

# if there is at least one item, start the process.
execute if score #restorelimboitems info matches 1.. positioned -259 48 386 run function projektredstoneworld:rtcreac/return_item_limbo

# GC marker entity
execute at @s run kill @s