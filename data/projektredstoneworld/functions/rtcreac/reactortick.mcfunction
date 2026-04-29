# Runs every tick that the reactor is loaded

# ==== WATER PRESSURE ====
scoreboard players set #rtcreactorwaterpressuretarget info 22000
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players operation #rtcreactorintermediate info *= 11100 CONSTANTS
execute if score #rtcreactorusepump info matches 0 run scoreboard players set #rtcreactorpumprate info 1
execute if score #rtcreactorpumprate info matches 0 run scoreboard players set #rtcreactorpumprate info 1
scoreboard players operation #rtcreactorintermediate info /= #rtcreactorpumprate info
execute if score #rtcreactorpumprate info matches 1 run scoreboard players set #rtcreactorpumprate info 0
scoreboard players operation #rtcreactorwaterpressuretarget info -= #rtcreactorintermediate info
# Clamp water pressure target
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players operation #rtcreactorintermediate info *= 48 CONSTANTS
scoreboard players add #rtcreactorintermediate info 12000
execute if score #rtcreactorintermediate info matches ..17000 run scoreboard players set #rtcreactorintermediate info 17000
execute if score #rtcreactorintermediate info < #rtcreactorwaterpressuretarget info run scoreboard players operation #rtcreactorwaterpressuretarget info = #rtcreactorintermediate info
execute if score #rtcreactorwaterpressuretarget info matches ..100 run scoreboard players set #rtcreactorwaterpressuretarget info 100
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
# Water pressure
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players add #rtcreactorintermediate info 45000
scoreboard players operation #rtcreactorcoretemptarget info *= 60000 CONSTANTS
scoreboard players operation #rtcreactorcoretemptarget info /= #rtcreactorintermediate info
# When you have no control rods (me wen me wen)
scoreboard players operation #rtcreactorintermediate info = #rtcreactorrodheight info
scoreboard players add #rtcreactorintermediate info 45
execute if score #rtcreactorintermediate info matches 70.. run scoreboard players set #rtcreactorintermediate info 70
scoreboard players operation #rtcreactorcoretemptarget info *= 70 CONSTANTS
scoreboard players operation #rtcreactorcoretemptarget info /= #rtcreactorintermediate info
# me wen no pumpe
scoreboard players operation #rtcreactorintermediate info = #rtcreactorpumprate info
scoreboard players add #rtcreactorintermediate info 250
# debuff this if core temp is above 1000
scoreboard players operation #rtcreactorintermediate2 info = #rtcreactorcoretemp info
scoreboard players remove #rtcreactorintermediate2 info 1000
execute if score #rtcreactorintermediate2 info matches 0.. run scoreboard players operation #rtcreactorintermediate info += #rtcreactoritermediate2 info
execute if score #rtcreactorintermediate info matches 650.. run scoreboard players set #rtcreactorintermediate info 650
scoreboard players operation #rtcreactorcoretemptarget info *= 650 CONSTANTS
scoreboard players operation #rtcreactorcoretemptarget info /= #rtcreactorintermediate info
# clamp core temp target minimum based off pump rate
scoreboard players set #rtcreactorintermediate2 info 1000
scoreboard players operation #rtcreactorintermediate info = #rtcreactorpumprate info
scoreboard players operation #rtcreactorintermediate info *= 4 CONSTANTS
scoreboard players operation #rtcreactorintermediate2 info -= #rtcreactorintermediate info
execute if score #rtcreactorcoretemptarget info < #rtcreactorintermediate2 info run scoreboard players operation #rtcreactorcoretemptarget info = #rtcreactorintermediate2 info


# Clamp core temperature target
execute if score #rtcreactorcoretemptarget info matches ..50 run scoreboard players set #rtcreactorcoretemptarget info 50

# Approach core temperature target
scoreboard players operation #rtcreactorcoretempdelta info = #rtcreactorcoretemptarget info
scoreboard players operation #rtcreactorcoretempdelta info -= #rtcreactorcoretemp info
execute if score #rtcreactorcoretemp info > #rtcreactorcoretemptarget info run scoreboard players remove #rtcreactorcoretemp info 1
execute if score #rtcreactorcoretemp info < #rtcreactorcoretemptarget info run scoreboard players add #rtcreactorcoretemp info 1
execute if score #rtcreactorcoretempdelta info matches 800.. run scoreboard players add #rtcreactorcoretemp info 4

# Clamp core temperature to a maximum of 2600
execute if score #rtcreactorcoretemp info matches 2600.. run scoreboard players set #rtcreactorcoretemp info 2600

# ==== TURBINE POWER ====
# Turbine power increases when reactor temperature goes up
# Turbine power decreases when pressure goes up (boiling point of water increases, so less steam is produced)
scoreboard players operation #rtcreactorturbinepowertarget info = #rtcreactorcoretemp info
scoreboard players remove #rtcreactorturbinepowertarget info 125
scoreboard players operation #rtcreactorturbinepowertarget info *= 86000 CONSTANTS
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players add #rtcreactorintermediate info 1000
scoreboard players operation #rtcreactorturbinepowertarget info /= #rtcreactorintermediate info
# Not enough pressure to generate steam
execute if score #rtcreactorwaterpressure info matches ..4000 run scoreboard players set #rtcreactorturbinepowertarget info 0
# Clamp turbine power to 0-6000
execute if score #rtcreactorturbinepowertarget info matches 6000.. run scoreboard players set #rtcreactorturbinepowertarget info 6000
execute if score #rtcreactorturbinepowertarget info matches ..0 run scoreboard players set #rtcreactorturbinepowertarget info 0
# Make turbine power approach target thru use of delta
scoreboard players operation #rtcreactorturbinepowerdelta info = #rtcreactorturbinepowertarget info
scoreboard players operation #rtcreactorturbinepowerdelta info -= #rtcreactorturbinepower info
scoreboard players operation #rtcreactorturbinepowerdelta info /= 100 CONSTANTS
execute if score #rtcreactorturbinepowerdelta info matches 0 if score #rtcreactorturbinepower info > #rtcreactorturbinepowertarget info run scoreboard players remove #rtcreactorturbinepower info 1
execute if score #rtcreactorturbinepowerdelta info matches 0 if score #rtcreactorturbinepower info < #rtcreactorturbinepowertarget info run scoreboard players add #rtcreactorturbinepower info 1
scoreboard players operation #rtcreactorturbinepower info += #rtcreactorturbinepowerdelta info


# ==== RADIATION ====
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
