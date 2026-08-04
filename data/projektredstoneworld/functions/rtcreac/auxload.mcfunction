# This Function will set #rtcreactorauxload info
scoreboard players set #rtcreactorauxload info 0
scoreboard players set #rtcprobepower info 0
scoreboard players set #fibunkerpower info 0
# The rest below requires "Low" state 100-300k Megajoules
execute if score #rtcreactorauxallow info matches 0 run return fail
execute if score #rtcreactorpowered info matches 0 unless score #rtcreactorauxlevel info matches ..10000 run scoreboard players add #rtcreactorauxload info 35
execute if score #rtcreactorpowered info matches 0 unless score #rtcreactorauxlevel info matches ..10000 if score #rtcreactorauxallow info matches 1 run scoreboard players set #rtcreactorpowered info 1
execute if score #rtcreactorauxlevel info matches ..99999 run return fail

# Calculate RTC - Full if no power provided
execute store result score #rtcplayercount info if entity @a[x=-63,y=-64,z=54,dx=267,dy=400,dz=761]
execute if score #rtcpower info matches 0 run scoreboard players set #rtcreactorintermediate2 info 60
execute if score #rtcpower info matches 0 run execute if score #time info matches 23000.. run scoreboard players add #rtcreactorintermediate2 info 25
execute if score #rtcpower info matches 0 run execute if score #time info matches 0..5000 run scoreboard players add #rtcreactorintermediate2 info 25
execute if score #rtcpower info matches 0 run execute if score #time info matches 5001..11999 run scoreboard players add #rtcreactorintermediate2 info 35
execute if score #rtcpower info matches 0 run execute if score #time info matches 12000..17999 run scoreboard players add #rtcreactorintermediate2 info 10
execute if score #rtcpower info matches 0 run scoreboard players operation #rtcreactorintermediate info = #rtcplayercount info
execute if score #rtcpower info matches 0 run scoreboard players operation #rtcreactorintermediate info *= 7 CONSTANTS
execute if score #rtcpower info matches 0 run scoreboard players operation #rtcreactorintermediate2 info += #rtcreactorintermediate info
execute if score #rtcpower info matches 0 run execute if score #rtcreactorintermediate2 info matches 161.. run scoreboard players set #rtcreactorintermediate2 info 160
execute if score #rtcpower info matches 0 run scoreboard players operation #rtcreactorauxload info += #rtcreactorintermediate2 info
execute if score #rtcpower info matches 0 run scoreboard players operation #rtcpower info += #rtcreactorintermediate2 info
execute if score #fibunkersurge info matches 1 if score #fibunkertemp info matches 8.. run scoreboard players add #rtcreactorauxload info 1210



# The rest below requires "Ready" state >= 300k Megajoules
execute if score #rtcreactorauxlevel info matches ..299999 unless score #rtcprobeburst info matches 1.. run return fail

# FI Bunker can turn on with the jump start button which is accessible with level 3 keycard from rtc or fi control so we dont need to worry about that, only explosion state
execute unless score #fibunkersurge info matches 1 if score #fibunkertemp info matches 8.. run scoreboard players add #rtcreactorauxload info 1210
execute if score #fibunkertemp info matches 8.. run scoreboard players add #fibunkerpower info 1210
execute if score #fibunkertemp info matches 8.. unless score #fibunkersurge info matches 1 run function projektredstoneworld:rtcreac/fibunkersurge

# Probes
execute if score #rtcprobes info matches 0 run return fail
# Probe Ready Mode
execute if score #rtcprobes info matches 1.. run scoreboard players add #rtcprobepower info 12
# Probe Small Burst
execute if score #rtcprobeburst info matches 1..4 run scoreboard players add #rtcprobepower info 710
execute if score #rtcprobeburst info matches 1..3 run scoreboard players add #rtcprobeburst info 1
execute if score #rtcprobeburst info matches 4..5 run scoreboard players set #rtcprobeburst info 0
# Probe Large Burst
execute if score #rtcprobeburst info matches 7.. run scoreboard players operation #rtcprobepower info += #rtcburstconst info
execute if score #rtcprobeburst info matches 7.. run scoreboard players add #rtcprobeburst info 1
# Trigger reactor turbine rush to save catalyst
execute if score #rtcreactorauxvoltpercent info matches ..6067 if score #rtcprobeburst info matches 8 run scoreboard players set #rtcreactorai info 1
execute if score #rtcreactorauxvoltpercent info matches ..6067 if score #rtcprobeburst info matches 8 run scoreboard players set #rtcreactorturbinerush info 1
execute if score #rtcprobeburst info matches 16.. run scoreboard players set #rtcprobeburst info 0
scoreboard players operation #rtcreactorauxload info += #rtcprobepower info
