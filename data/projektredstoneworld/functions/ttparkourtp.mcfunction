execute in minecraft:redstoneworld2015totear run tp @s -314.5 63.0 406.5 -90 0
tellraw @s [{"text":"<"},{"selector":"@s"},{"text":"> What?? It was just a silly parkour game, I didn't think anything would happen! How... is this possible?"}]
execute as @s run function agoodman:play
effect give @s blindness 6 1 true
effect give @s darkness 3 1 true
effect give @s slowness 5 1 true
tellraw @s "EPIC FAILURE!!! YOU ARE TRAPPED HERE FOR NOW!!! The only way to get back to spawn is to run the command."
