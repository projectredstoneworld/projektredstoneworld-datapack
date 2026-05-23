# CALLED FROM MACROBEAM

say greg

$particle dust $(r) $(g) $(b) $(scale) 0.15 0.15 0.15 0.1 1 force

say partiquel

$execute if score #macrobeamiterations info matches $(iterations) run say goon
$execute if score #macrobeamiterations info matches $(iterations) run kill @s
$execute if score #macrobeamiterations info matches $(iterations) run return fail

scoreboard players add #macrobeamiterations info 1

$tp @s ^ ^ ^$(density)

execute at @s run function projektredstoneworld:macrobeamloop with entity @s data
