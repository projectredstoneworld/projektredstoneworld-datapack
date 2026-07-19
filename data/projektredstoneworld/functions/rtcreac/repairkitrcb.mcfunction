execute unless score #rtcreactorrepairkit info matches 0 run tellraw @p [{"text":"Error: There is already an active repair kit.","color":"#FF0000"}]
execute unless score #rtcreactorrepairkit info matches 0 run return fail

execute as @a at @s run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 0 1
execute if score #rtcreactorrcbhp info matches 1.. run tellraw @a {"text":"The RTC-Blakewood RCB has been repaired. Structural integrity has been ensured.","bold":true,"color":"#00FF00"}
execute if score #rtcreactorrcbhp info matches 1.. run scoreboard players set #rtcreactorfuelhp info 696969
execute if score #rtcreactorrcbhp info matches 1.. run return fail

scoreboard players set #rtcreactorrcbhp info 696969
scoreboard players set #rtcreactortitcover info 0
function projektredstoneworld:rtcreac/autoscram
tellraw @a {"text":"Hello! RTC reactor RCB HE IS REPARO!!!!! Please skibidi rizzler enjoy this placeholder! PONTOKAAAAAAA IN MY BOKAAAA"}
