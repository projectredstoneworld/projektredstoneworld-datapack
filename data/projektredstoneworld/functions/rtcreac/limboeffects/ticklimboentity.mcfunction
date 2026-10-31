# Run as each level 3 jumpscare entity (armor stand)

scoreboard players remove @s limboeffecttime 1
execute if score @s limboeffecttime matches 0 run function projektredstoneworld:rtcreac/limboeffects/killlimboentity

# Maybe other particle effects here?
