# Executes when RCB HP reaches 0 (once)

# Moved code from reactortick
execute as @a[tag=inrtcreactor] at @s run playsound minecraft:entity.lightning_bolt.impact master @s ~ ~ ~ 1 0 1
execute as @a[tag=inrtcreactor] at @s run playsound minecraft:entity.ender_dragon.death master @s ~ ~ ~ 1 0 1
scoreboard players add #radrtcreactoraddmsv info 2500
execute if score #rtcreactorfuelhpwarn info matches 2 run scoreboard players add #radrtcreactoraddmsv info 10000
tellraw @a [{"text":"WARNING: RTC REACTOR RCB BREACH\n","bold":true,"color":"#FF0033"},{"text":"The RTC-Blakewood Nuclear Power Plant's RCB (Reactor Containment Building) has been breached. This is either caused due to a build up of excess pressure or an extreme power surge in the turbines. A very high amount of radiation has been ejected into the atmosphere. If you are in the FI-RTC complex: Please seek immediate shelter in the FI bunker (or any bunker further to the west), as the RTC microbunker will not provide sufficient protection. The RTC-Blakewood reactor will not produce any more power until it has been repaired using a repair kit. Stay safe and stay tuned for updates.","bold":false}]
scoreboard players add #rtcreactorspew info 60000000
scoreboard players set #rtcreactorspewtime info 10
scoreboard players set #rtcreactorspewmode info 1
execute if score #rtcreactortitcover info matches 1 run advancement grant @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] only redstoneworld:rtccoolantcover
execute as @a[tag=inrtcreactor] run damage @s 16 on_fire
function projektredstoneworld:rtcreac/checkimmunity
execute if score #rtcreactorfuelhpwarn info matches 2 run function projektredstoneworld:rtcreac/checklimbocond

# For Ij: Code goes here


scoreboard players set #rtcreactorrcbhpwarn info 2