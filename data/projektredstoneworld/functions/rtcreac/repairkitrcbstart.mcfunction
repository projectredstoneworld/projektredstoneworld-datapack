function projektredstoneworld:rtcreac/autoscram
tellraw @a [{"text":"RCB REPAIR UNDERWAY\n","color":"#FF00FF","bold":true},{"text":"A brief albeit powerful radioactive atmospheric purge is in effect. If you are in the FI-RTC compound, especially in the regions near reactor island, stop what you are doing and head to the FI bunker (or any bunker further west) IMMEDIATELY."}]
execute as @a at @s run playsound entity.ender_dragon.death master @s ~ ~ ~ 1 0 1
execute as @a at @s run playsound block.anvil.land master @s ~ ~ ~ 1 0 1
scoreboard players add #radrtcreactoraddmsv info 2000
scoreboard players set #rtcreactorrepairmode info 1

scoreboard players set #rtcreactorrepairkit info 0

scoreboard players set #rtcreactorspewmode info 1
scoreboard players add #rtcreactorspew info 100000000
scoreboard players set #rtcreactorspewtime info 40
