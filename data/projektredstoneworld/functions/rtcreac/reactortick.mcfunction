# Runs every tick that the reactor is loaded

# ==== XENON AND IODINE ====
# Iodine production
scoreboard players set #rtcreactoriodinechange info 0
scoreboard players operation #rtcreactorintermediate2 info = #rtcreactorcoretemp info
scoreboard players remove #rtcreactorintermediate2 info 125
execute if score #rtcreactorintermediate2 info matches ..0 run scoreboard players set #rtcreactorintermediate2 info 0
scoreboard players operation #rtcreactoriodinechange info += #rtcreactorintermediate2 info
# Iodine decay
scoreboard players operation #rtcreactorintermediate info = #rtcreactoriodine info
scoreboard players operation #rtcreactorintermediate info /= #rtcreactorCiodinedecay info
scoreboard players operation #rtcreactoriodinechange info -= #rtcreactorintermediate info
execute unless score #rtcreactoriodinechange info matches -3..3 run scoreboard players operation #rtcreactoriodine info += #rtcreactoriodinechange info
execute if score #rtcreactorxenon info matches 6000.. if score #rtcreactoriodinechange info matches -3..3 run scoreboard players operation #rtcreactoriodine info += #rtcreactoriodinechange info
# Misc. iodine clamps for extreme cases
execute if score #rtcreactorcoretemp info matches 2000.. if score #rtcreactorrepairkit info matches 0 run scoreboard players set #rtcreactoriodine info 0
execute if score #rtcreactorfuelhpwarn info matches 2 run scoreboard players set #rtcreactoriodine info 0
execute if score #rtcreactoriodine info matches 1400000.. run scoreboard players set #rtcreactoriodine info 1400000
# Xenon production from iodine decay
scoreboard players operation #rtcreactorintermediate info *= #rtcreactorCxenonmultiplier info
scoreboard players operation #rtcreactorxedelta info = #rtcreactorintermediate info
# Xenon absorbing neutrons
scoreboard players operation #rtcreactorintermediate2 info *= #rtcreactorCxenonabsorbency info
scoreboard players operation #rtcreactorxedelta info -= #rtcreactorintermediate2 info
# Xenon decay
scoreboard players operation #rtcreactorintermediate info = #rtcreactoractualxenon info
scoreboard players operation #rtcreactorintermediate info /= #rtcreactorCxenondecay info
scoreboard players operation #rtcreactorxedelta info -= #rtcreactorintermediate info
execute if score #rtcreactorcoretemp info matches ..100 if score #rtcreactorxedelta info matches -300..0 run scoreboard players set #rtcreactorxedelta info -300 
# change xenon if delta is > 0.25 mg/t
execute unless score #rtcreactorxedelta info matches -250..250 run scoreboard players operation #rtcreactoractualxenon info += #rtcreactorxedelta info
execute unless score #rtcreactorxenon info matches 4500..6000 if score #rtcreactorxedelta info matches -250..250 run scoreboard players operation #rtcreactorxenon info += #rtcreactorxedelta info
# Clamp xenon and iodine values to positive
execute if score #rtcreactoriodine info matches ..0 run scoreboard players set #rtcreactoriodine info 0
execute if score #rtcreactoractualxenon info matches ..0 run scoreboard players set #rtcreactoractualxenon info 0
# Derive xenon from actual xenon
scoreboard players operation #rtcreactorxenon info = #rtcreactoractualxenon info
scoreboard players operation #rtcreactorxenon info /= 1000 CONSTANTS


# ==== WATER PRESSURE ====
scoreboard players set #rtcreactorwaterpressuretarget info 22000
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players operation #rtcreactorintermediate info *= 11100 CONSTANTS
execute if score #rtcreactorusepump info matches 0 run scoreboard players set #rtcreactorpumprate info 1
execute if score #rtcreactorpumprate info matches 0 run scoreboard players set #rtcreactorpumprate info 1
scoreboard players operation #rtcreactorintermediate info /= #rtcreactorpumprate info
execute if score #rtcreactorpumprate info matches 1 run scoreboard players set #rtcreactorpumprate info 0
scoreboard players operation #rtcreactorwaterpressuretarget info -= #rtcreactorintermediate info
# Coolant tower cover causes huge pressure increase while reactor is on
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players remove #rtcreactorintermediate info 100
scoreboard players operation #rtcreactorintermediate info *= 300 CONSTANTS
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
execute if score #rtcreactortitcover info matches 1 run scoreboard players operation #rtcreactorwaterpressuretarget info += #rtcreactorintermediate info
# Clamp water pressure target
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players operation #rtcreactorintermediate info *= 48 CONSTANTS
scoreboard players add #rtcreactorintermediate info 12000
execute if score #rtcreactorintermediate info matches ..17000 run scoreboard players set #rtcreactorintermediate info 17000
execute if score #rtcreactorintermediate info < #rtcreactorwaterpressuretarget info if score #rtcreactortitcover info matches 0 run scoreboard players operation #rtcreactorwaterpressuretarget info = #rtcreactorintermediate info
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
# xenon effect
scoreboard players set #rtcreactorintermediate info 20000
scoreboard players operation #rtcreactorintermediate info -= #rtcreactorxenon info
scoreboard players operation #rtcreactorcoretemptarget info *= #rtcreactorintermediate info
scoreboard players operation #rtcreactorcoretemptarget info /= 14500 CONSTANTS
# side character controls
# scale 1
execute if score #rtcreactorfuelmode info matches 0 run scoreboard players set #rtcreactorintermediate info 1
execute if score #rtcreactorfuelmode info matches 1 run scoreboard players set #rtcreactorintermediate info 3
scoreboard players operation #rtcreactorcoretemptarget info *= #rtcreactorintermediate info
# scale 4
execute if score #rtcreactorboric info matches 0 run scoreboard players set #rtcreactorintermediate info 5
execute if score #rtcreactorboric info matches 1 run scoreboard players set #rtcreactorintermediate info 4
execute if score #rtcreactorboric info matches 2 run scoreboard players set #rtcreactorintermediate info 3
scoreboard players operation #rtcreactorcoretemptarget info *= #rtcreactorintermediate info
# scale 5
execute if score #rtcreactorwatermode info matches 0 run scoreboard players set #rtcreactorintermediate info 1
execute if score #rtcreactorwatermode info matches 1 run scoreboard players set #rtcreactorintermediate info 5
scoreboard players operation #rtcreactorcoretemptarget info *= #rtcreactorintermediate info
# scale back down by 20
scoreboard players operation #rtcreactorcoretemptarget info /= 20 CONSTANTS


# clamp core temp target minimum based off pump rate
scoreboard players set #rtcreactorintermediate2 info 1000
scoreboard players operation #rtcreactorintermediate info = #rtcreactorpumprate info
scoreboard players operation #rtcreactorintermediate info *= 4 CONSTANTS
scoreboard players operation #rtcreactorintermediate2 info -= #rtcreactorintermediate info
execute if score #rtcreactorcoretemptarget info < #rtcreactorintermediate2 info run scoreboard players operation #rtcreactorcoretemptarget info = #rtcreactorintermediate2 info


# Clamp core temperature target
execute if score #rtcreactorcoretemptarget info matches ..50 run scoreboard players set #rtcreactorcoretemptarget info 50
execute if score #rtcreactorfuelhpwarn info matches 2 if score #rtcreactorcoretemptarget info matches ..1200 if score #rtcreactorrepairmode info matches 0 run scoreboard players set #rtcreactorcoretemptarget info 1200

# Approach core temperature target
scoreboard players operation #rtcreactorcoretempdelta info = #rtcreactorcoretemptarget info
scoreboard players operation #rtcreactorcoretempdelta info -= #rtcreactorcoretemp info
execute if score #rtcreactorcoretemp info > #rtcreactorcoretemptarget info run scoreboard players remove #rtcreactorcoretemp info 1
execute if score #rtcreactorcoretemp info < #rtcreactorcoretemptarget info run scoreboard players add #rtcreactorcoretemp info 1
execute if score #rtcreactorcoretempdelta info matches 800.. run scoreboard players add #rtcreactorcoretemp info 4
execute if score #rtcreactorcoretempdelta info matches 2000.. run scoreboard players add #rtcreactorcoretemp info 9
execute if score #rtcreactorcoretempdelta info matches ..-1200 run scoreboard players remove #rtcreactorcoretemp info 6

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
execute if score #rtcreactorwaterpressure info matches ..2000 run scoreboard players set #rtcreactorturbinepowertarget info 0
# Clamp turbine power to 0-6000
execute if score #rtcreactorturbinepowertarget info matches 6000.. run scoreboard players set #rtcreactorturbinepowertarget info 6000
execute if score #rtcreactorturbinepowertarget info matches ..0 run scoreboard players set #rtcreactorturbinepowertarget info 0
execute if score #rtcreactorrodheight info matches 80.. if score #rtcreactorfuelmode info matches 0 run scoreboard players operation #rtcreactorturbinepowertarget info /= 4 CONSTANTS
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

# water and fuel modes affect radiation
execute if score #rtcreactorfuelmode info matches 1 run scoreboard players operation #rtcreactorintermediate info *= 2 CONSTANTS
execute if score #rtcreactorwatermode info matches 0 run scoreboard players operation #rtcreactorintermediate info *= 2 CONSTANTS

scoreboard players operation #radrtcreactoraddfrac info += #rtcreactorintermediate info

execute if score #radrtcreactoraddfrac info matches ..-1 run scoreboard players set #radrtcreactoraddfrac info 0

# ==== ECCS ====
execute if score #rtcreactoreccstime info matches 1.. run scoreboard players remove #rtcreactoreccstime info 1
execute if score #rtcreactoreccscooldown info matches 1.. run scoreboard players remove #rtcreactoreccscooldown info 1
execute if score #rtcreactoreccstime info matches 1.. run function projektredstoneworld:rtcreac/eccs

# ==== STEAM RELEASE ====
execute if score #rtcreactorsteamrelease info matches 1.. run function projektredstoneworld:rtcreac/steamrelease

# ==== FUEL ROD INTEGRITY ====
# Fuel rods are fully repaired using repair kits -- Default value 314159
# Fuel rod loses 1 hp per tick per degree above 450 (max. 700/t -- meltdown in ~22 seconds)
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players remove #rtcreactorintermediate info 450
execute if score #rtcreactorintermediate info matches 700.. run scoreboard players set #rtcreactorintermediate info 500
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players operation #rtcreactorfuelhp info -= #rtcreactorintermediate info
execute if score #rtcreactorfuelhpwarn info matches 0 if score #rtcreactorfuelhp info matches ..69420 run tellraw @a {"text":"Imminent danger: The RTC reactor's fuel rods are melting! The reactor is advised to scram immediately. A radiation spike has been detected in the reactor, rendering the complex unsafe. The fuel has the potential to melt and spike the radiation levels even further, the military warns.","color":"#FF0000"}
execute if score #rtcreactorfuelhpwarn info matches 0 if score #rtcreactorfuelhp info matches ..69420 run scoreboard players add #radrtcreactoraddmsv info 100
execute if score #rtcreactorfuelhpwarn info matches 0 if score #rtcreactorfuelhp info matches ..69420 run scoreboard players set #rtcralarm info 2
execute if score #rtcreactorfuelhpwarn info matches 0 if score #rtcreactorfuelhp info matches ..69420 as @a[tag=inrtcreactor] at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 1 2 1
execute if score #rtcreactorfuelhpwarn info matches 0 if score #rtcreactorfuelhp info matches ..69420 run scoreboard players set #rtcreactorfuelhpwarn info 1
execute if score #rtcreactorfuelhpwarn info matches 1 if score #rtcreactorfuelhp info matches ..0 as @a[tag=inrtcreactor] at @s run playsound minecraft:entity.lightning_bolt.impact master @s ~ ~ ~ 1 0 1
execute if score #rtcreactorfuelhpwarn info matches 1 if score #rtcreactorfuelhp info matches ..0 as @a[tag=inrtcreactor] at @s run playsound minecraft:entity.ender_dragon.death master @s ~ ~ ~ 1 0 1
execute if score #rtcreactorfuelhpwarn info matches 1 if score #rtcreactorfuelhp info matches ..0 run scoreboard players add #radrtcreactoraddmsv info 5000
execute if score #rtcreactorfuelhpwarn info matches 1 if score #rtcreactorfuelhp info matches ..0 run tellraw @a [{"text":"WARNING: RTC REACTOR MELTDOWN\n","color":"#FF0000","bold":true},{"text":"The RTC reactor has melted down. As a result, a 5 Sv/h spike in radiation has been observed in the reactor complex. Reports from RID suggest that the mass of melted fuel rods is fairly contained within the reactor containment building, however it is still necessary to acquire a fuel rod repair kit to repair the rods. It will also be necessary to purge radioactive content into the atmosphere during the repair. Please be ready to go into a nearby bunker and stay tuned for updates.","bold":false}]
execute if score #rtcreactorfuelhpwarn info matches 1 if score #rtcreactorfuelhp info matches ..0 run advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcmeltdown
execute if score #rtcreactorfuelhpwarn info matches 1 if score #rtcreactorfuelhp info matches ..0 run scoreboard players set #rtcreactorfuelhpwarn info 2
execute if score #rtcreactorfuelhp info matches ..-1 run scoreboard players set #rtcreactorfuelhp info 0
execute if score #rtcreactorfuelhp info matches 69421.. run scoreboard players set #rtcreactorfuelhpwarn info 0
execute if score #rtcreactorfuelhpwarn info matches 2 run scoreboard players add #radrtcreactoraddfrac info 22000
execute if score #rtcreactorrepairmode info matches 1 run scoreboard players set #rtcreactorfuelhp info 314159
execute if score #rtcreactorrepairmode info matches 1 run scoreboard players set #rtcreactorrodheight info 100
execute if score #rtcreactorrepairmode info matches 1 run scoreboard players set #rtcreactorpumprate info 500
execute if score #rtcreactorrepairmdoe info matches 1 run scoreboard players set #rtcreactorusepump info 1
execute if score #rtcreactorcoretemp info matches ..100 if score #rtcreactorrepairmode info matches 1 run scoreboard players set #rtcreactoriodine info 1400000
execute if score #rtcreactorcoretemp info matches ..100 run scoreboard players set #rtcreactorrepairmode info 0

# Forceload itself if the reactor is in critical state, core temp >500 or radiation > 1 Sv/h or forceload variable on
forceload remove 90 600
execute if score #rtcreactorcoretemp info matches 501.. run forceload add 90 600
execute if score #radrtcreactor2 info matches 1001.. run forceload add 90 600
execute if score #rtcreactorforceload info matches 1 run forceload add 90 600

# autoscram timer
execute unless score #rtcreactorautoscramtimer info matches 1000 run scoreboard players add #rtcreactorautoscramtimer info 1
