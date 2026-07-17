# This function serves to distribute the turbine power across the redstoneworld 
# Handle lowest power first
execute if score #rtcreactorturbinepower info matches ..599 run scoreboard players set #rtcreactorpowerdist info 0
# Turn off diesel / aux use if power is high enough to power complex
execute if score #rtcreactorturbinepower info matches ..599 if score #rtcreactorturbinepower info matches 40.. run scoreboard players set #rtcreactorpowered info 1
# Turn on diesel / aux
execute if score #rtcreactorturbinepower info matches ..599 if score #rtcreactorturbinepower info matches ..39 run scoreboard players set #rtcreactorpowered info 0
# Power Outages
execute if score #rtcreactorturbinepower info matches ..599 run scoreboard players set #rtcpower info 0
execute if score #rtcreactorturbinepower info matches ..599 run scoreboard players set #fipower info 0
execute if score #rtcreactorturbinepower info matches ..599 run scoreboard players set #blakewoodpower info 0
execute if score #rtcreactorturbinepower info matches ..599 run scoreboard players set #dosbackuppower info 0
execute if score #rtcreactorturbinepower info matches ..599 run scoreboard players set #rtcreactorauxinput info 0

execute if score #rtcreactorturbinepower info matches ..599 run return fail

# Get Player Counts
execute store result score #rtcplayercount info if entity @a[x=-63,y=-64,z=54,dx=267,dy=400,dz=761]
execute store result score #fiplayercount info if entity @a[x=-399,y=-64,z=350,dx=329,dy=400,dz=350]
execute store result score #time info run time query daytime

# Handle low power, only power the reactor, rtc, and aux
execute if score #rtcreactorturbinepower info matches 600..999 run scoreboard players operation #rtcreactorpowerdist info = #rtcreactorturbinepower info
execute if score #rtcreactorpowerdist info matches 600..999 run scoreboard players remove #rtcreactorpowerdist info 35
# Calculate RTC - Low
scoreboard players operation #rtcreactorintermediate info = #rtcplayercount info
scoreboard players operation #rtcreactorintermediate info *= 5 CONSTANTS
scoreboard players add #rtcreactorintermediate info 15
execute if score #rtcreactorintermediate info matches 61.. run scoreboard players set #rtcreactorintermediate info 60
scoreboard players operation #rtcpower info = #rtcreactorpowerdist info
scoreboard players operation #rtcpower info *= #rtcreactorintermediate info
scoreboard players operation #rtcpower info /= 100 CONSTANTS

scoreboard players operation #rtcreactorpowerdist info -= #rtcpower info
scoreboard players operation #rtcreactorauxinput info = #rtcreactorpowerdist info

execute if score #rtcreactorturbinepower info matches 600..999 run return fail

# Handle Full Power
execute if score #rtcreactorturbinepower info matches 1000.. run scoreboard players operation #rtcreactorpowerdist info = #rtcreactorturbinepower info
scoreboard players remove #rtcreactorpowerdist info 35

# Calculate RTC - Full
scoreboard players set #rtcpower info 60
execute if score #time info matches 23000.. run scoreboard players add #rtcpower info 25
execute if score #time info matches 0..5000 run scoreboard players add #rtcpower info 25
execute if score #time info matches 5001..11999 run scoreboard players add #rtcpower info 35
execute if score #time info matches 12000..17999 run scoreboard players add #rtcpower info 10
scoreboard players operation #rtcreactorintermediate info = #rtcplayercount info
scoreboard players operation #rtcreactorintermediate info *= 7 CONSTANTS
scoreboard players operation #rtcpower info += #rtcreactorintermediate info
execute if score #rtcpower info matches 161.. run scoreboard players set #rtcpower info 160
# This should never make it negative
scoreboard players operation #rtcpower info < #rtcreactorpowerdist info
scoreboard players operation #rtcreactorpowerdist info -= #rtcpower info

# Calculate FI - Full
scoreboard players set #fipower info 40
execute if score #time info matches 23000.. run scoreboard players add #fipower info 20
execute if score #time info matches 0..5000 run scoreboard players add #fipower info 20
execute if score #time info matches 5001..11999 run scoreboard players add #fipower info 30
execute if score #time info matches 12000..17999 run scoreboard players add #fipower info 5
scoreboard players operation #rtcreactorintermediate info = #fiplayercount info
scoreboard players operation #rtcreactorintermediate info *= 4 CONSTANTS
scoreboard players operation #fipower info += #rtcreactorintermediate info
execute if score #fipower info matches 101.. run scoreboard players set #fipower info 100
# This should never make it negative
scoreboard players operation #fipower info < #rtcreactorpowerdist info
scoreboard players operation #rtcreactorpowerdist info -= #fipower info

# Blakewood should actually increase at night due to the rakegame
execute if score #time info matches 23000.. run scoreboard players set #blakewoodpowerpercent info 20
execute if score #time info matches 23000.. run scoreboard players set #dosbackuppowerpercent info 50
execute if score #time info matches 0..5000 run scoreboard players set #blakewoodpowerpercent info 20
execute if score #time info matches 0..5000 run scoreboard players set #dosbackuppowerpercent info 50
execute if score #time info matches 5001..11999 run scoreboard players set #blakewoodpowerpercent info 25
execute if score #time info matches 5001..11999 run scoreboard players set #dosbackuppowerpercent info 60
execute if score #time info matches 12000..17999 run scoreboard players set #blakewoodpowerpercent info 35
execute if score #time info matches 12000..17999 run scoreboard players set #dosbackuppowerpercent info 45
execute if score #time info matches 18000..22999 run scoreboard players set #blakewoodpowerpercent info 30
execute if score #time info matches 18000..22999 run scoreboard players set #dosbackuppowerpercent info 40

scoreboard players operation #blakewoodpower info = #rtcreactorpowerdist info
scoreboard players operation #blakewoodpower info *= #blakewoodpowerpercent info
scoreboard players operation #blakewoodpower info /= 100 CONSTANTS

scoreboard players operation #blakewoodpower info < #rtcreactorpowerdist info
scoreboard players operation #rtcreactorpowerdist info -= #blakewoodpower info

scoreboard players set #dosbackuppower info 0
# Theme Park Reactor active if reactortemp info >= 300
execute unless score #reactortemp info matches 300.. run scoreboard players operation #dosbackuppower info = #rtcreactorpowerdist info
execute unless score #reactortemp info matches 300.. run scoreboard players operation #dosbackuppower info *= #dosbackuppowerpercent info
execute unless score #reactortemp info matches 300.. run scoreboard players operation #dosbackuppower info /= 100 CONSTANTS

scoreboard players operation #dosbackuppower info < #rtcreactorpowerdist info
scoreboard players operation #rtcreactorpowerdist info -= #dosbackuppower info

scoreboard players operation #rtcreactorauxinput info = #rtcreactorpowerdist info