execute if score #rtcreactorwaterpressure info matches 5000.. run scoreboard players remove #rtcreactorwaterpressure info 300
execute if score #rtcreactorcoretemp info matches 400.. run scoreboard players remove #rtcreactorcoretemp info 20
execute if score #rtcreactorcoretemp info matches 80.. run scoreboard players remove #rtcreactorcoretemp info 10

execute if score #rtcreactorwaterpressure info matches 5000.. if score #rtcreactorcoretemp info matches 200.. run scoreboard players add #radrtcreactoraddmsv info 1

playsound minecraft:entity.generic.extinguish_fire master @a[tag=inrtcreactor] ~ ~ ~ 360 2 1

scoreboard players remove #rtcreactorturbinepower info 100
execute if score #rtcreactorturbinepower info matches ..0 run scoreboard players set #rtcreactorturbinepower info 0

scoreboard players remove #rtcreactorsteamrelease info 3
