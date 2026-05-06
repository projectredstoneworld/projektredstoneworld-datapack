execute if score #rtcreactorautoscramtimer info matches ..999 run return fail
scoreboard players set #rtcreactorautoscramtimer info 0

# scram the reactor
scoreboard players set #rtcreactorscrammed info 1
scoreboard players set #rtcreactorai info 0
scoreboard players set #rtcreactorrodheight info 100
execute if score #rtcreactorpumprate info matches ..400 run scoreboard players set #rtcreactorpumprate info 500
scoreboard players set #rtcreactorfuelmode info 0
scoreboard players set #rtcreactorusepump info 1

# warn the players
tellraw @a {"text":"The RTC-Blakewood Reactor Complex has issued an automatic SCRAM due to unsafe conditions. All workers in the Reactor Complex are advised to listen for alarms and evacuate if necessary. In case of a meltdown, all players are encouraged to seek shelter in the closest bunker or underground facility. ","color":"#FF9900","bold":true}
# advancement
advancement grant @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] only redstoneworld:rtcbaddie
