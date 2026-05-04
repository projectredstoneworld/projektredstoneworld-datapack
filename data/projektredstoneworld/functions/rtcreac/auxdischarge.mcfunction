# This should only execute if wattage is <= 1 MW

# Real function is V(t) = V0 * (e^(-t/RC)) thankfully delta t is always just going to be 1 second so we can rewrite this function without needing to evaluate the exponential over and over again, and just have a charging base.

# Voltage is being used as a range 0 to 10000 to represent the percentage to charge, real voltage value is based on 100% = 500 kV
# We can use V = V - V * k * PowerFrac
scoreboard players operation #rtcreactorauxwattage info *= -1 CONSTANTS

scoreboard players operation #rtcreactorintermediate info = #rtcreactorauxvoltpercent info
scoreboard players operation #rtcreactorintermediate info *= 80 CONSTANTS
scoreboard players operation #rtcreactorintermediate info /= 10000 CONSTANTS

# Can tweak the base value of both the k and the fraction for watt if we want
scoreboard players operation #rtcreactorintermediate info *= #rtcreactorauxwattage info
scoreboard players operation #rtcreactorintermediate info /= 200 CONSTANTS

execute if score #rtcreactorauxvoltpercent info matches 1.. if score #rtcreactorintermediate info matches 0 run scoreboard players set #rtcreactorintermediate info 1

scoreboard players operation #rtcreactorauxvoltpercent info -= #rtcreactorintermediate info

execute if score #rtcreactorauxvoltpercent info matches ..0 run scoreboard players set #rtcreactorauxvoltpercent info 0

function projektredstoneworld:rtcreac/auxupdvoltenergy