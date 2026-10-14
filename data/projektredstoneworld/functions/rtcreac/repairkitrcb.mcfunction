execute unless score #rtcreactorrepairkit info matches 0 run tellraw @p [{"text":"Error: There is already an active repair kit.","color":"#FF0000"}]
execute unless score #rtcreactorrepairkit info matches 0 run return fail

execute as @a at @s run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 0 1
execute if score #rtcreactorrcbhp info matches 1.. run tellraw @a {"text":"The RTC-Blakewood RCB has been repaired. Structural integrity has been ensured.","bold":true,"color":"#00FF00"}
execute if score #rtcreactorrcbhp info matches 1.. run scoreboard players set #rtcreactorrcbhp info 696969
execute if score #rtcreactorrcbhp info matches 1.. run return fail

scoreboard players set #rtcreactortitcover info 0
function projektredstoneworld:rtcreac/autoscram

tellraw @a [{"text":"IMMINENT RADIOACTIVE DANGER\n","color":"#FF0000","bold":true},{"text":"A reactor containment building (RCB) repair kit has been inserted into the RTC reactor. Everybody in the FI-RTC complex is advised to evacuate immediately or find the nearest bunker. A radiation spike in the reactor complex is imminent. The purge of radioactive material will also cause high technogenic doses to everyone who is unprotected.","bold":false}]
tellraw @a {"text":"There are 30 seconds until the repair kit becomes effective.","color":"#FF00FF"}

scoreboard players set #rtcreactorrepairkit info 1
scoreboard players set #rtcralarm info 2

schedule function projektredstoneworld:rtcreac/repairkitrcbstart 600t