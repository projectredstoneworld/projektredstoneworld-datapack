# Called from big burst ending signal

execute if score #rtccatrepair info matches -1 run return fail

tellraw @a {"text":"[Project 159-TCI Comms] Catalyst probes finished firing. Now purging radioactive material into the atmosphere. Imminent radioactive danger to all people inside of the FI-RTC complex.","bold":true,"color":"red"}

execute as @a at @s run playsound minecraft:block.end_portal.spawn master @a ~ ~ ~ 1 0 1
effect give @a darkness 8 0 true
effect give @a nausea 14 0 true
tellraw @a {"text":"The white eyes. I can't tell if they are getting closer, or if they are getting further.","color":"#ff0000","italic":true,"bold":true}
tellraw @a {"text":"I'll show them. I'll show them that The Catalyst Initiative cannot cover everything. I'll show them that they DO have something to worry about.","color":"#50009f","italic":true,"bold":true}

tellraw @a {"text":"[EMERGENCY ALERT] Death can occur rapidly to anybody inside of the RTC complex. If you are anywhere near the FI-RTC complex, seek shelter IMMEDIATELY. This is NOT a drill. Radiation will begin in approximately 5 seconds.","color":"dark_red","bold":true}
execute as @a run function chasemusic:play

schedule function projektredstoneworld:rtcreac/repairkitcatalyst4 100t
