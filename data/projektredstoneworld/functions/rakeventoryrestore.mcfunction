# can only restore one player at a time, give entity restoretarget tag then execute this function as inv_store with same id as entity
# count the amount of items in the array so we know how often to repeat
execute store result score #restorerakeitems info run data get entity @s data.Inventory

# if there is at least one item, start the process.
execute if score #restorerakeitems info matches 1.. positioned 2484 66 663 run function projektredstoneworld:rakereturn_item

# GC marker entity
execute at @s run kill @s