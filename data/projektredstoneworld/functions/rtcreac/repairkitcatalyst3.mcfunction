# Called from big burst ending signal

execute if score #rtccatrepair info matches -1 run return fail

tellraw @a {"text":"[Project 159-TCI Comms] Catalyst probes finished firing. Now purging radioactive material into the atmosphere. Imminent radioactive danger to all people inside of the FI-RTC complex."}
tellraw @a {"text":"Skibidi rizzler enjoy this placeholder! REACHED FUNCTION 3!!!!!"}

scoreboard players set #rtcreactorrcbhp info 696969
scoreboard players set #rtcreactorfuelhp info 314159
scoreboard players set #rtcreactorlimbo info 0