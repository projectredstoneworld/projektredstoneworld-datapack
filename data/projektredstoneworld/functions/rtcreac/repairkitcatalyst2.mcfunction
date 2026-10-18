execute if score #rtccatrepair info matches 0 run tellraw @a {"text":"[Project 159-TCI Comms] Power surge detected around RTC reactor. Charging aux battery and enabling anti-catalyst elimination protocol.","color":"red","bold":true}

forceload add 186 606 187 607
execute in overworld run summon lightning_bolt 186.5 53.5 606.5
execute as @a at @s run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 1 0 1

scoreboard players set #rtcreactorauxvoltpercent info 10000
function projektredstoneworld:rtcreac/auxupdvoltenergy

# Minigame center
forceload add -20 664 -4 664

scoreboard players set #rtcprobes info 1

scoreboard players add #rtccatrepair info 1
execute if score #rtccatrepair info matches ..99 run schedule function projektredstoneworld:rtcreac/repairkitcatalyst2 1t
execute if score #rtccatrepair info matches 100 run forceload add 186 606 187 607
execute if score #rtccatrepair info matches 100 in overworld run setblock -11 288 664 redstone_block
weather thunder
