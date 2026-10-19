# Executes when fuel HP reaches 0 (once)

# Moved code from reactortick
execute as @a[tag=inrtcreactor] at @s run playsound minecraft:entity.lightning_bolt.impact master @s ~ ~ ~ 1 0 1
execute as @a[tag=inrtcreactor] at @s run playsound minecraft:entity.ender_dragon.death master @s ~ ~ ~ 1 0 1
scoreboard players add #radrtcreactoraddmsv info 5000
execute if score #rtcreactorrcbhpwarn info matches 2 run scoreboard players add #radrtcreactoraddmsv info 10000
execute unless score #rtcreactorrcbhpwarn info matches 2 run tellraw @a [{"text":"WARNING: RTC REACTOR MELTDOWN\n","color":"#FF0033","bold":true},{"text":"The RTC reactor has melted down. As a result, a 5 Sv/h spike in radiation has been observed in the reactor complex. Reports from RID suggest that the mass of melted fuel rods is fairly contained within the reactor containment building, however it is still necessary to acquire a fuel rod repair kit to repair the rods. It will also be necessary to purge radioactive content into the atmosphere during the repair. Please be ready to go into a nearby bunker and stay tuned for updates.","bold":false}]
execute if score #rtcreactorrcbhpwarn info matches 2 run tellraw @a [{"text":"WARNING: RTC REACTOR MELTDOWN\n","color":"#FF0033","bold":true},{"text":"The RTC reactor has melted down. As a result, a 15 Sv/h spike in radiation has been observed in the reactor complex, partially caused by the already damaged RCB. Reports from RID suggest that the mass of melted fuel rods has slightly penetrated through the Reactor Containment Building, and that it is essential to repair the fuel rods ASAP. It will also be necessary to purge radioactive content into the atmosphere during the repair. Please be ready to go into a nearby bunker and stay tuned for updates.","bold":false}]
advancement grant @a[tag=inrtcreactor] only redstoneworld:rtcmeltdown
function projektredstoneworld:rtcreac/checkimmunity
execute if score #rtcreactorrcbhpwarn info matches 2 run function projektredstoneworld:rtcreac/checklimbocond

# For Ij: Code goes here


scoreboard players set #rtcreactorfuelhpwarn info 2