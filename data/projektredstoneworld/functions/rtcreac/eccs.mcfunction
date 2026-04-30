execute if score #rtcreactorcoretemp info matches 200.. run scoreboard players remove #rtcreactorcoretemp info 4
execute if score #rtcreactorcoretemp info matches 600.. run scoreboard players remove #rtcreactorcoretemp info 7
execute if score #rtcreactorcoretemp info matches 1000.. run scoreboard players remove #rtcreactorcoretemp info 10
execute if score #rtcreactorcoretemp info matches 2000.. run scoreboard players add #rtcreactorcoretemp info 20

execute if score #rtcreactorwaterpressure info matches ..18000 run scoreboard players add #rtcreactorwaterpressure info 15

scoreboard players set #rtcreactorai info 0
scoreboard players set #rtcreactorrodheight info 100
scoreboard players set #rtcreactorpumprate info 900
scoreboard players set #rtcreactorusepump info 1
scoreboard players set #rtcreactorwatermode info 0
scoreboard players set #rtcreactorfuelmode info 0

playsound minecraft:entity.generic.extinguish_fire master @a[tag=inrtcreactor] ~ ~ ~ 360 1 1

