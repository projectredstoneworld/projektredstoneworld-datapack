execute if score #rtcreactorlimbo info matches 1 run scoreboard players set #rtcreactorlimbo info 2
execute if score #rtcreactorcoretemp info matches ..1500 run return fail
execute if score #rtcreactorboric info matches 1.. run return fail
execute if score #rtcreactorfuelmode info matches 0 run return fail
execute if score #rtcreactorwatermode info matches 0 run return fail

execute if score #rtcreactorlimbo info matches 0 run tellraw @a [{"text":"RTC REACTOR: DANGEROUS SUPERCRITICALITY","color":"#FF0055","bold":true},{"text":"\nSeveral back to back emergencies have severely damaged the RTC reactor, and may cause one of the biggest explosions seen not only on RW, but across both worlds. If this is not tended to within 20 seconds, the reactor may be irreversibly damaged. An entire FI-RTC evacuation is advised.","bold":false}]
execute if score #rtcreactorlimbo info matches 0 run scoreboard players set #rtcreactorlimbo info 1
execute if score #rtcreactorlimbo info matches 1 run schedule function projektredstoneworld:rtcreac/checklimbocond 400t

execute if score #rtcreactorlimbo info matches 2 run scoreboard players set #rtcreactorlimbo info 3
execute if score #rtcreactorlimbo info matches 3 run function projektredstoneworld:rtcreac/limbo
