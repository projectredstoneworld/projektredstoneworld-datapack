# Execute as player in minecart

execute store result score @s rcspeedxo run data get entity @s Pos[0] 1000
execute store result score @s rcspeedzo run data get entity @s Pos[2] 1000
tag @s add speedometertarget
schedule function projektredstoneworld:rcrailtransit/speedometerbuff 1t