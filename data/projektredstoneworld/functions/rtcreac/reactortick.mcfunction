# Runs every tick that the reactor is loaded

# Approach core temperature target
scoreboard players operation #rtcreactorcoretempdelta info = #rtcreactorcoretemptarget info
scoreboard players operation #rtcreactorcoretempdelta info -= #rtcreactorcoretemp info
scoreboard players operation #rtcreactorcoretempdelta info /= 30 CONSTANTS
execute if score #rtcreactorcoretempdelta info matches 0 if score #rtcreactorcoretemp info > #rtcreactorcoretempdelta info run scoreboard players remove #rtcreactorcoretemp info 1
execute if score #rtcreactorcoretempdelta info matches 0 if score #rtcreactorcoretemp info < #rtcreactorcoretempdelta info run scoreboard players add #rtcreactorcoretemp info 1
scoreboard players operation #rtcreactorcoretemp info += #rtcreactorcoretempdelta info

# Radiation calculations
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemptarget info
scoreboard players remove #rtcreactorintermediate info 175
scoreboard players operation #rtcreactorintermediate info *= 10 CONSTANTS
scoreboard players operation #radrtcreactoraddfrac info = #rtcreactorintermediate info

scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressuretarget info
scoreboard players operation #rtcreactorintermediate info /= -40 CONSTANTS
scoreboard players operation #radrtcreactoraddfrac info += #rtcreactorintermediate info

scoreboard players operation #rtcreactorintermediate info = #rtcreactorturbinepowertarget info
scoreboard players operation #rtcreactorintermediate info /= 7 CONSTANTS
scoreboard players operation #radrtcreactoraddfrac info += #rtcreactorintermediate info

execute if score #radrtcreactoraddfrac info matches ..-1 run scoreboard players set #radrtcreactoraddfrac info 0
