# This should only execute if wattage is >= 1 MW

# Real function is V(t) = Vmax * (1-e^(-t/RC)) thankfully delta t is always just going to be 1 second so we can rewrite this function without needing to evaluate the exponential over and over again, and just have a charging base.

# Voltage is being used as a range 0 to 10000 to represent the percentage to charge, real voltage value is based on 100% = 500 kV
# V = Vmax - V
scoreboard players operation #rtcreactorintermediate info = 10000 CONSTANTS
scoreboard players operation #rtcreactorintermediate info -= #rtcreactorauxvoltpercent info

# Make sure we arent full!
execute unless score #rtcreactorintermediate info matches 1.. run return fail

# deltaV = (Vmax - V) * (1-e^(-1/RC)) / scale
# for charging we're using a constant value of that e part, set to 40.
scoreboard players operation #rtcreactorintermediate info *= 40 CONSTANTS
scoreboard players operation #rtcreactorintermediate info /= 10000 CONSTANTS

# Realistic wattage input would be changing max allowed voltage, however we decided it would make more sense to just change the charging speed, so we multiply the delta by the wattage over Pavg=200MW
scoreboard players operation #rtcreactorintermediate info *= #rtcreactorauxwattage info
scoreboard players operation #rtcreactorintermediate info /= 200 CONSTANTS

# Prevent rounding down to 0
execute if score #rtcreactorintermediate info matches 0 run scoreboard players set #rtcreactorintermediate info 1

# V = V + deltaV
scoreboard players operation #rtcreactorauxvoltpercent info += #rtcreactorintermediate info

# Cap at 100%
execute if score #rtcreactorauxvoltpercent info matches 10000.. run scoreboard players set #rtcreactorauxvoltpercent info 10000

function projektredstoneworld:rtcreac/auxupdvoltenergy
