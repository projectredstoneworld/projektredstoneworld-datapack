execute if score #rtcreactorwaterpressure info matches 5000.. run scoreboard players remove #rtcreactorwaterpressure info 300
execute if score #rtcreactorcoretemp info matches 400.. run scoreboard players remove #rtcreactorcoretemp info 30

scoreboard players add #radrtcreactoraddmsv info 1

playsound minecraft:entity.generic.extinguish_fire master @a[tag=inrtcreactor] ~ ~ ~ 360 2 1
