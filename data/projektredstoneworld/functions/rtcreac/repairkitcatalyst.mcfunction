# Value is -1 if limbo repair kit not running
scoreboard players set #rtccatrepair info 0

execute if score #rtcreactorlimbo info matches 0 run tellraw @a[tag=inrtcreactor] {"text":"Repair kit error: Insufficient catalytic force found in limbo.","color":"#FF0000"}
execute if score #rtcreactorlimbo info matches 1..2 run tellraw @a[tag=inrtcreactor] {"text":"Catalytic repair kit inserted. Waiting for outcome... Re-evaluating in 15 seconds.","color":"#FFFFAA"}
execute if score #rtcreactorlimbo info matches 1..2 run scoreboard players add #rtcreactorevaluate info 1
execute if score #rtcreactorlimbo info matches 1..2 run schedule function projektredstoneworld:rtcreac/repairkitcatalyst 300t
execute if score #rtcreactorlimbo info matches 0..2 run return fail

execute if score #rtcreactorevaluate info matches 1.. run tellraw @a[tag=inrtcreactor] [{"text":"Evaluation success! Attempts: ","color":"#00FF00"},{"score":{"name":"#rtcreactorevaluate","objective":"info"}}]
scoreboard players set #rtcreactorevaluate info 0

scoreboard players set #rtcreactorrepairkit info 1

scoreboard players set #rtcralarm info 2
execute as @a at @s run playsound item.trident.thunder master @s ~ ~ ~ 360 0 1
execute as @a[tag=inrtcreactor] at @s run playsound entity.ender_dragon.death master @s ~ ~ ~ 360 0 1
effect give @a[tag=inrtcreactor] darkness 15 67 true
effect give @a[tag=inrtcreactor] nausea 8 0 true
# Resource pack only easter egg
execute as @a at @s run playsound music.doomsday master @s ~ ~ ~ 360 0 1

tellraw @a [{"text":"CRITICAL EVACUATION ALERT\n","color":"#FF00FF","bold":true},{"text":"A catalytic repair kit has been inserted into the RTC Reactor. There is an imminent risk of death to all exposed Redstoneworld citizens wiehin the FI-RTC complex. Immediate evacuation is necessary. The RTC-micro bunker WILL NOT BE SUFFICIENT to fully protect you from the dangers of the catalytic repair kit. This emergency alert is applicable until further notice. Radiation levels are expected to spike in approximately 2-3 minutes.","bold":false}]
tellraw @a {"text":"[Project 159-TCI Comms] Incoming power surge within the next 10-15 seconds.","color":"red","bold":true}
tellraw @a {"text":"Everything is covered by the catalyst initiative.","color":"#FF0000"}

scoreboard players set #rtccatrepair info 0
schedule function projektredstoneworld:rtcreac/repairkitcatalyst2 220t
