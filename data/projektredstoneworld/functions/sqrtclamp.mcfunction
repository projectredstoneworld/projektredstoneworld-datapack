# RECURSIVE CLAMPING :D
# Multiply by 4 if value is less than 2^29, double clamping factor
scoreboard players operation #sqrtclampfactor info += #sqrtclampfactor info
scoreboard players operation #sqrtin info *= 4 CONSTANTS

execute if score #sqrtin info matches ..536870911 run function projektredstoneworld:sqrtclamp
