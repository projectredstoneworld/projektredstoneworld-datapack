execute in minecraft:redstoneworld2015totear run tp @s -314.5 63.0 406.5 -90 0
tellraw @s [{"text":"<"},{"selector":"@s"},{"text":"> What?? It was just a silly parkour game, I didn't think anything would happen! How... is this possible?"}]
execute as @s run function agoodman:play
effect give @s blindness 6 1 true
effect give @s darkness 3 1 true
effect give @s slowness 5 1 true
tellraw @s [{"text":"\n\nEPIC FAILURE!!! YOU ARE TRAPPED HERE!! Maybe Tower 0 will have a way out for you...","color":"red"}]
tellraw @s "On a more serious note, things in this archived world are broken since the command blocks have been removed (they interfered with scoreboards and other aspects of mainworld). Enjoy!"
tag @s add ttparkourtoreturn