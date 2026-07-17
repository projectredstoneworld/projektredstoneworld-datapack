execute unless score #rtcreactorrepairkit info matches 0 run tellraw @p [{"text":"Error: There is already an active repair kit.","color":"#FF0000"}]
execute unless score #rtcreactorrepairkit info matches 0 run return fail

scoreboard players set #rtcreactorrepairkit info 1

execute as @a at @s run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 0 1
execute if score #rtcreactorfuelhp info matches 1.. run tellraw @a {"text":"The RTC reactor fuel rods have been repaired!","bold":true,"color":"#00FF00"}
execute if score #rtcreactorfuelhp info matches 1.. run scoreboard players set #rtcreactorfuelhp info 314159
execute if score #rtcreactorfuelhp info matches 1.. run return fail

scoreboard players set #rtcralarm info 2

tellraw @a [{"text":"IMMINENT RADIOACTIVE DANGER\n","color":"#FF0000","bold":true},{"text":"A fuel rod repair kit has been inserted into the RTC reactor. Everybody in the FI-RTC complex is advised to evacuate immediately or find the nearest bunker. A radiation spike in the reactor complex is imminent. The purge of radioactive material will also cause high technogenic doses to everyone who is unprotected.","bold":false}]
tellraw @a {"text":"There are 30 seconds until the repair kit becomes effective.","color":"#FF00FF"}

schedule function projektredstoneworld:rtcreac/repairkitfuelstart 600t