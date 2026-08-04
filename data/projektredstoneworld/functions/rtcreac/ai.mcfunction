# ==== CONTROL ROD CONTROL ====
# control rods down by 2 percent if core temp is < 320 and xenon is < 6600
execute if score #rtcreactorcoretemp info matches ..319 if score #rtcreactorxenon info matches ..6599 if score #rtcreactorrodheight info matches 2.. run scoreboard players remove #rtcreactorrodheight info 2
# control rods up by 2 percent if core temp is > 345
execute if score #rtcreactorcoretemp info matches 346.. if score #rtcreactorrodheight info matches ..98 run scoreboard players add #rtcreactorrodheight info 2
# Update Physical Height
scoreboard players operation #rtcreactoroldrodblocks info = #rtcreactorrodblocks info
scoreboard players operation #rtcreactorrodblocks info = #rtcreactorrodheight info
scoreboard players operation #rtcreactorrodblocks info /= 3 CONSTANTS
execute if score #rtcreactorrodblocks info matches 32.. run scoreboard players set #rtcreactorrodblocks info 32
execute unless score #rtcreactoroldrodblocks info = #rtcreactorrodblocks info as @e[type=marker,tag=rtcreactorcrod] at @s positioned ~ ~1 ~ run function projektredstoneworld:rtcreac/updcontrolrod
# activate scram if stuff is out of control
execute unless score #rtcreactorcoretemp info matches ..500 unless score #rtcreactorwaterpressure info matches 12000.. run scoreboard players set #rtcreactorrodheight info 100
execute unless score #rtcreactorcoretemp info matches ..500 unless score #rtcreactorwaterpressure info matches 12000.. run tellraw @a {"text":"WARNING: RTC REACTOR SCRAM AUTO ACTIVATED BY AI; AI HAS SHUT DOWN","color":"#FF0000","bold":true}
execute unless score #rtcreactorcoretemp info matches ..500 unless score #rtcreactorwaterpressure info matches 12000.. run scoreboard players set #rtcreactorai info 0


# ==== WATER PRESSURE CONTROLS ====
execute if score #rtcreactorcoretemp info matches 250..390 run scoreboard players set #rtcreactorpumprate info 500
execute if score #rtcreactorwaterpressure info matches ..14400 if score #rtcreactorpumprate info matches ..680 run scoreboard players add #rtcreactorpumprate info 20
execute if score #rtcreactorwaterpressure info matches 18000.. if score #rtcreactorpumprate info matches 20.. run scoreboard players remove #rtcreactorpumprate info 20
execute if score #rtcreactorturbinepower info matches 1300.. if score #rtcreactorpumprate info matches ..680 run scoreboard players add #rtcreactorpumprate info 20
execute if score #rtcreactorcoretemp info matches 390.. if score #rtcreactorpumprate info matches ..599 run scoreboard players set #rtcreactorpumprate info 600

# ==== OTHER ====
scoreboard players set #rtcreactorboric info 1
scoreboard players set #rtcreactorwatermode info 1
scoreboard players set #rtcreactorfuelmode info 0
scoreboard players set #rtcreactorusepump info 1

scoreboard players set #rtcreactorusedai info 1



# ==== SPECIAL DESTRUCTIVE CONTROL #1 THIS IS BY THE CATALYST PROBES IF IN FULL EMERGENCY AND NEED TURBINE POWER ====
execute if score #rtcreactorturbinerush info matches 1 run scoreboard players set #rtcreactorpumprate info 200
execute if score #rtcreactorturbinerush info matches 1 if score #rtcreactorrodheight info matches 78.. unless score #rtcreactorcoretemp info matches 400.. run scoreboard players set #rtcreactorrodheight info 76
execute if score #rtcreactorturbinerush info matches 1 if score #rtcreactorcoretemp info matches 400.. if score #rtcreactorrodheight info matches ..96 run scoreboard players add #rtcreactorrodheight info 4
execute if score #rtcreactorauxlevel info matches 676769.. run scoreboard players set #rtcreactorturbinerush info 0