# Runs every tick that the reactor is loaded

# ==== WATER PRESSURE ====
scoreboard players set #rtcreactorwaterpressuretarget info 28000
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players operation #rtcreactorintermediate info *= #rtcreactorpumprate info
scoreboard players operation #rtcreactorintermediate info *= -37 CONSTANTS
scoreboard players operation #rtcreactorintermediate info /= 500 CONSTANTS
scoreboard players operation #rtcreactorwaterpressuretarget info += #rtcreactorintermediate info
# Clamp water pressure target
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressuretarget info
scoreboard players operation #rtcreactorintermediate info *= 48 CONSTANTS
execute if score #rtcreactorintermediate info < #rtcreactorwaterpressuretarget info run scoreboard players operation #rtcreactorwaterpressuretarget info = #rtcreactorintermediate info
execute if score #rtcreactorwaterpressuretarget info matches ..0 run scoreboard players set #rtcreactorwaterpressuretarget info 0
# Approach water pressure target
scoreboard players operation #rtcreactorwaterpressuredelta info = #rtcreactorwaterpressuretarget info
scoreboard players operation #rtcreactorwaterpressuredelta info -= #rtcreactorwaterpressure info
scoreboard players operation #rtcreactorwaterpressuredelta info /= 100 CONSTANTS
execute if score #rtcreactorwaterpressuredelta info matches 0 if score #rtcreactorwaterpressure info > #rtcreactorwaterpressuretarget info run scoreboard players remove #rtcreactorwaterpressure info 1
execute if score #rtcreactorwaterpressuredelta info matches 0 if score #rtcreactorwaterpressure info < #rtcreactorwaterpressuretarget info run scoreboard players add #rtcreactorwaterpressure info 1
scoreboard players operation #rtcreactorwaterpressure info += #rtcreactorwaterpressuredelta info


# ==== CORE TEMPERATURE ====
# Default core temperature
scoreboard players set #rtcreactorcoretemptarget info 650
# Control rods affect core temperature
scoreboard players operation #rtcreactorintermediate info = #rtcreactorrodheight info
scoreboard players operation #rtcreactorintermediate info *= -13 CONSTANTS
scoreboard players operation #rtcreactorintermediate info /= 2 CONSTANTS
scoreboard players operation #rtcreactorcoretemptarget info += #rtcreactorintermediate info

# Clamp core temperature target
execute if score #rtcreactorcoretemptarget info matches ..50 run scoreboard players set #rtcreactorcoretemptarget info 50

# Approach core temperature target
scoreboard players operation #rtcreactorcoretempdelta info = #rtcreactorcoretemptarget info
scoreboard players operation #rtcreactorcoretempdelta info -= #rtcreactorcoretemp info
scoreboard players operation #rtcreactorcoretempdelta info /= 100 CONSTANTS
execute if score #rtcreactorcoretempdelta info matches 0 if score #rtcreactorcoretemp info > #rtcreactorcoretemptarget info run scoreboard players remove #rtcreactorcoretemp info 1
execute if score #rtcreactorcoretempdelta info matches 0 if score #rtcreactorcoretemp info < #rtcreactorcoretemptarget info run scoreboard players add #rtcreactorcoretemp info 1
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
