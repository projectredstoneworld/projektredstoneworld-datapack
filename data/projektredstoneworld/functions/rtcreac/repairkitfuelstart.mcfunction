function projektredstoneworld:rtcreac/autoscram
function projektredstoneworld:rtcreac/eccs
tellraw @a [{"text":"FUEL ROD REPAIR UNDERWAY\n","color":"#FF00FF","bold":true},{"text":"A radiation spike has occured in the RTC reactor. Furthermore, radioactive content is beginning to spew across the FI-RTC complex. Take shelter immediately if you are in the affected area."}]
execute as @a at @s run playsound entity.ender_dragon.death master @s ~ ~ ~ 1 0 1
scoreboard players add #radrtcreactoraddmsv info 3000
scoreboard players set #rtcreactorrepairmode info 1
scoreboard players set #rtcreactoriodine info 800000

scoreboard players set #rtcreactorrepairkit info 0
# TODO: Reactor spewing and external radiation
