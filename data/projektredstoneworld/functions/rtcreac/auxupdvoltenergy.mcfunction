# moved from auxcharge
# Calculate real voltage for display purposes
scoreboard players operation #rtcreactorauxvoltage info = #rtcreactorauxvoltpercent info
scoreboard players operation #rtcreactorauxvoltage info *= 500000 CONSTANTS
scoreboard players operation #rtcreactorauxvoltage info /= 10000 CONSTANTS
scoreboard players operation #rtcreactorauxkv info = #rtcreactorauxvoltage info
scoreboard players operation #rtcreactorauxkv info /= 1000 CONSTANTS
scoreboard players operation #rtcreactorauvkvdecimal info = #rtcreactorauxvoltage info
scoreboard players operation #rtcreactorauvkvdecimal info %= 1000 CONSTANTS
scoreboard players operation #rtcreactorauvkvdecimal info /= 100 CONSTANTS

# Calculate energy in MJ
# E = 1/2 * C * V^2, but with scaling this can be rewritten to E = ((V^2)/10000) * 150, stored in #rtcreactorauxlevel
scoreboard players operation #rtcreactorauxlevel info = #rtcreactorauxvoltpercent info
scoreboard players operation #rtcreactorauxlevel info *= #rtcreactorauxvoltpercent info
scoreboard players operation #rtcreactorauxlevel info /= 10000 CONSTANTS
scoreboard players operation #rtcreactorauxlevel info *= 150 CONSTANTS