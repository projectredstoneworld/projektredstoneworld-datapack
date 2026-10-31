# Run as checking marker

# Face the right way
$tp @s ~ ~ ~ $(rot) 0
$execute if score 1 CONSTANTS matches $(fwd) run tp @s ~ ~ ~ ~180 ~

scoreboard players set #rtcreactorintermediate2 info 3
function projektredstoneworld:rtcreac/limboeffects/spawnentitycheckloop