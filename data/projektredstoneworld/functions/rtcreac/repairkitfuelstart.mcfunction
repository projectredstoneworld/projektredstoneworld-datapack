function projektredstoneworld:rtcreac/autoscram
tellraw @a [{"text":"FUEL ROD REPAIR UNDERWAY\n","color":"#FF00FF","bold":true},{"text":"A radiation spike has occured in the RTC reactor. Furthermore, radioactive content is beginning to spew across the FI-RTC complex. Take shelter immediately if you are in the affected area."}]
execute as @a at @s run playsound entity.ender_dragon.death master @s ~ ~ ~ 1 0 1
scoreboard players add #radrtcreactoraddmsv info 1600
scoreboard players set #rtcreactorrepairmode info 1

scoreboard players set #rtcreactorrepairkit info 0

scoreboard players set #rtcreactorspewmode info 1
scoreboard players set #rtcreactorspew info 32000000
scoreboard players set #rtcreactorspewtime info 120
# TODO: Reactor spewing and external radiation
