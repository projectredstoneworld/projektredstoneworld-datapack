# Runs if player is in control room or LBS

# Control rod display modes
execute if score #rtcreactorrodheight info matches 70.. run scoreboard players set #rtcreactorctrlrodmode info 1
execute if score #rtcreactorrodheight info matches 30..69 run scoreboard players set #rtcreactorctrlrodmode info 2
execute if score #rtcreactorrodheight info matches 10..29 run scoreboard players set #rtcreactorctrlrodmode info 3
execute if score #rtcreactorrodheight info matches 0..9 run scoreboard players set #rtcreactorctrlrodmode info 4
execute if score #rtcreactorrodheight info matches 10..29 if score #rtcreactorcoretemp info matches 700.. run scoreboard players set #rtcreactorctrlmode info 4

# Fuel rod display modes
execute if score #rtcreactorcoretemp info matches ..500 run scoreboard players set #rtcreactorfuelrodmode info 1
execute if score #rtcreactorcoretemp info matches 501..900 run scoreboard players set #rtcreactorfuelrodmode info 2
execute if score #rtcreactorcoretemp info matches 901.. run scoreboard players set #rtcreactorfuelrodmode info 3

# Meter display modes
scoreboard players set #rtcreactormetermode info 1
execute if score #rtcreactorcoretemp info matches 400.. run scoreboard players set #rtcreactormetermode info 2
execute if score #rtcreactorwaterpressure info matches ..12000 run scoreboard players set #rtcreactormetermode info 2
execute if score #rtcreactorturbinepower info matches 2000.. run scoreboard players set #rtcreactormetermode info 2

# Only update displays if necessary
execute unless score #rtcreactorctrlrodmodep info = #rtcreactorctrlrodmode info run function projektredstoneworld:rtcreac/updfuelroddisp
execute unless score #rtcreactorfuelrodmodep info = #rtcreactorfuelrodmode info run function projektredstoneworld:rtcreac/updfuelroddisp
execute unless score #rtcreactormetermodep info = #rtcreactormetermode info run function projektredstoneworld:rtcreac/updfuelroddisp

