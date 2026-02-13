# can only restore one player at a time, give entity restoretarget tag then execute this function as inv_store with same id as entity
# count the amount of items in the array so we know how often to repeat
execute store result score #restoreitems info run data get entity @s data.Inventory

# if there is at least one item, start the process.
execute if score #restoreitems info matches 1.. positioned -292 84 458 run function projektredstoneworld:return_item

# GC marker entity
execute at @s run kill @s