# Runs every second when the reactor is loaded

# ==== STABILITY CALCULATION ====
scoreboard players set #rtcreactorstability info 97
# iodine delta
scoreboard players operation #rtcreactorintermediate info = #rtcreactoriodine info
scoreboard players operation #rtcreactorintermediate info -= #rtcreactoriodinep info
scoreboard players operation #rtcreactoriodinep info = #rtcreactoriodine info
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players operation #rtcreactorintermediate info *= -1 CONSTANTS
execute if score #rtcreactorintermediate info matches 0 run scoreboard players add #rtcreactorstability info 1
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
execute if score #rtcreactorintermediate info matches ..-24 run scoreboard players set #rtcreactorintermediate info -24
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info
# water pressure delta
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players operation #rtcreactorintermediate info -= #rtcreactorwaterpressurep info
scoreboard players operation #rtcreactorwaterpressurep info = #rtcreactorwaterpressure info
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players operation #rtcreactorintermediate info *= -1 CONSTANTS
execute if score #rtcreactorintermediate info matches 0 run scoreboard players add #rtcreactorstability info 1
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
execute if score #rtcreactorintermediate info matches ..-24 run scoreboard players set #rtcreactorintermediate info -24
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info
# xenon delta
scoreboard players operation #rtcreactorintermediate info = #rtcreactorxenon info
scoreboard players operation #rtcreactorintermediate info -= #rtcreactorxenonp info
scoreboard players operation #rtcreactorxenonp info = #rtcreactorxenon info
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players operation #rtcreactorintermediate info *= -1 CONSTANTS
execute if score #rtcreactorintermediate info matches 0 run scoreboard players add #rtcreactorstability info 1
scoreboard players operation #rtcreactorintermediate info /= 50 CONSTANTS
execute if score #rtcreactorintermediate info matches ..-12 run scoreboard players set #rtcreactorintermediate info -12
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info
# if water pressure >19000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players remove #rtcreactorintermediate info 19000
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 40 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info

# if water pressure <14000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players remove #rtcreactorintermediate info 14000
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info

# if xenon >7000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorxenon info
scoreboard players remove #rtcreactorintermediate info 7000
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 100 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info

# if xenon <3000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorxenon info
scoreboard players remove #rtcreactorintermediate info 3000
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players set #rtcreactorintermediate info 0
execute if score #rtcreactorcoretemp info matches ..250 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 100 CONSTANTS
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info

# if core temperature >400 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players remove #rtcreactorintermediate info 400
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 2 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info

# if turbine power >1700 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorturbinepower info
scoreboard players remove #rtcreactorintermediate info 1700
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info

# final clamping
execute if score #rtcreactorstability info matches ..0 run scoreboard players set #rtcreactorstability info 0
# reward sound for reaching 100
execute if score #rtcreactorstability info matches 100 if score #rtcreactorstable info matches 0 run playsound minecraft:block.beacon.ambient master @a[tag=inrtcreactor] ~ ~ ~ 1 2 1
execute if score #rtcreactorstability info matches 100 if score #rtcreactorstable info matches 0 run tellraw @a[tag=inrtcreactor] [{"text":"THE REACTOR JUST STABILIZED","bold":true,"color":"#00FF00"}]
execute if score #rtcreactorstability info matches 100 run scoreboard players set #rtcreactorstable info 1
execute if score #rtcreactorstability info matches ..99 if score #rtcreactorstable info matches 1 run tellraw @a[tag=inrtcreactor] [{"text":"THE REACTOR IS NO LONGER FULLY STABLE","bold":true,"color":"#ff9900"}]
execute unless score #rtcreactorstability info matches 100 run scoreboard players set #rtcreactorstable info 0

# ==== AI ====
execute unless score #rtcreactorai info matches 0 unless score #rtcreactorstability info matches 100 run function projektredstoneworld:rtcreac/ai
execute if score #rtcreactorai info matches 1 if score #rtcreactorstability info matches 100 if score #rtcreactorcoretemp info matches ..140 run function projektredstoneworld:rtcreac/ai
execute if score #rtcrectorcoretemp info matches 51.. if score #rtcreactorai info matches 1 run scoreboard players set #rtcreactorusedai info 1
execute if score #rtcreactorcoretemp info matches ..50 if score #rtcreactorai info matches 0 run scoreboard players set #rtcreactorusedai info 0

# ==== ADVANCEMENT PROCESSING ====
# Area related
advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcreactorenter
advancement grant @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] only redstoneworld:rtcreacadmin
advancement grant @a[x=115,y=16,z=733,dx=67,dy=20,dz=15] only redstoneworld:rtcturbinehall
# Radiation levels
execute if score #radrtcreactor info matches 8 run advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcreacoff
execute if score #radrtcreactor info matches 15000000.. run advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcrad1
execute if score #radrtcreactor2 info matches 1001.. run advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcrad1
execute if score #radrtcreactor2 info matches 1001.. run advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcrad2
execute if score #radrtcreactor2 info matches 10000.. run advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcrad3
# Other metrics
execute if score #rtcreactorturbinepower info matches 5000.. run advancement grant @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] only redstoneworld:rtcpowerspike
execute if score #rtcreactorstability info matches 100 if score #rtcreactorcoretemp info matches 280..370 if score #rtcreactorturbinepower info matches 1000..1500 if score #rtcreactorai info matches 0 if score #rtcreactorusedai info matches 0 run advancement grant @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] only redstoneworld:rtcstable
execute if score #rtcreactorstability info matches 100 if score #rtcreactorcoretemp info matches 280..370 if score #rtcreactorturbinepower info matches 1000..1500 if score #rtcreactorai info matches 0 if score #rtcreactorusedai info matches 0 run scoreboard players set #rtcreactorusedai info 1
# Missing
# rtcaifailure - Lore meltdown, AI malicious code
# rtccoolantcover - Extreme water pressure
# rtclimboenter - Self explanatory
# rtcmeltdown - General meltdown

# ==== CALCULATE POWER DIST ====
function projektredstoneworld:rtcreac/distributeturbine


# ==== AUX POWER MANAGEMENT ====
# #rtcreactorauxinput should be set from wherever turbine power is split up from, #rtcreactorauxload is the load on the aux battery. Both should be in megawatts
scoreboard players operation #rtcreactorauxwattage info = #rtcreactorauxinput info
execute if score #rtcreactorauxallow info matches 1 run scoreboard players operation #rtcreactorauxwattage info -= #rtcreactorauxload info
# Block watts if full
execute if score #rtcreactorauxwattage info matches 1.. if score #rtcreactorauxvoltpercent info matches 10000.. run scoreboard players set #rtcreactorauxwattage info 0
execute if score #rtcreactorauxwattage info matches ..-1 if score #rtcreactorauxvoltpercent info matches ..0 run scoreboard players set #rtcreactorauxwattage info 0
# Commented out till done
execute if score #rtcreactorauxwattage info matches 1.. run function projektredstoneworld:rtcreac/auxcharge
execute if score #rtcreactorauxwattage info matches ..-1 run function projektredstoneworld:rtcreac/auxdischarge
#execute if score #rtcreactorauxwattage info matches 0 run function projektredstoneworld:rtcreac/auxneutral

# ==== AUTOSCRAM ====
# process scrammed variable
execute if score #rtcreactorrodheight info matches ..99 run scoreboard players set #rtcreactorscrammed info 0
# autoscram under certain conditions
execute if score #rtcreactorcoretemp info matches 500.. if score #rtcreactorrodheight info matches 30..99 run function projektredstoneworld:rtcreac/autoscram
execute if score #rtcreactorcoretemp info matches 700.. if score #rtcreactorrodheight info matches 10..29 run function projektredstoneworld:rtcreac/autoscram
execute if score #rtcreactorcoretemp info matches 950.. if score #rtcreactorrodheight info matches 0..9 if score #rtcreactorusepump info matches 1 run function projektredstoneworld:rtcreac/autoscram

# ==== HIGH XENON NOTIFICATION ====
execute if score #rtcreactorxenon info matches ..24999 run scoreboard players set #rtcreactorxenonnotif info 0
execute if score #rtcreactorxenon info matches 25000.. if score #rtcreactorxenonnotif info matches 0 run tellraw @a[tag=inrtcreactor] [{"text":"WARNING: ","color":"#ff0000","bold":true},{"text":"Xenon levels are exceptionally high. Do not atttempt to operate the reactor.","bold":false,"color":"#FF0000"}]
execute if score #rtcreactorxenon info matches 25000.. if score #rtcreactorxenonnotif info matches 0 run advancement grant @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] only redstoneworld:rtcxenon
execute if score #rtcreactorxenon info matches 25000.. run scoreboard players set #rtcreactorxenonnotif info 1

# ==== RADIJACULATE ====
execute if score #rtcreactorspew info matches 32000000.. run scoreboard players set #rtcreactorspew info 32000000
scoreboard players operation #rtcreactorintermediate info = #rtcreactorspew info
scoreboard players operation #rtcreactorintermediate info /= 67 CONSTANTS
execute if score #rtcreactorspewmode info matches 2 run scoreboard players operation #rtcreactorspew info -= #rtcreactorintermediate info
execute if score #rtcreactorspew info matches ..10000 run scoreboard players set #rtcreactorspewmode info 0
execute if score #rtcreactorspewmode info matches 0 run scoreboard players set #rtcreactorspew info 0
execute unless score #rtcreactorspew info matches 0 in overworld positioned 113.5 118 685.0 as @a[distance=..620] run function projektredstoneworld:rtcreac/spewradprocess
execute if score #rtcreactorspewtime info matches ..0 if score #rtcreactorspewmode info matches 1 run tellraw @a {"text":"The RTC reactor atmospheric purge has concluded. Radioactive material still remains in the atmosphere. Please proceed with caution","color":"#FF0000"}
execute if score #rtcreactorspewtime info matches ..0 if score #rtcreactorspewmode info matches 1 run scoreboard players set #rtcreactorspewmode info 2
execute if score #rtcreactorspewmode info matches 1 run scoreboard players remove #rtcreactorspewtime info 1
