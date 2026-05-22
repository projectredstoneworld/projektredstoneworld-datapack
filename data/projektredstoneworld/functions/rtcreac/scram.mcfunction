# TODO: Make this fail when AI is in malware mode

execute if score #rtcreactorrodheight info matches 100 if score #rtcreactorusepump info matches 1 if score #rtcreactorpumprate info matches 400.. if score #rtcreactorfuelmode info matches 0 run return fail
execute if score #rtcreactorscrammed info matches 1 run return fail

# scram the reactor
scoreboard players set #rtcreactorscrammed info 1
scoreboard players set #rtcreactorai info 0
scoreboard players set #rtcreactorrodheight info 100
execute if score #rtcreactorpumprate info matches ..400 run scoreboard players set #rtcreactorpumprate info 500
scoreboard players set #rtcreactorfuelmode info 0
scoreboard players set #rtcreactorusepump info 1

# issue message
tellraw @a[tag=inrtcreactor] {"text":"The RTC-Blakewood Reactor Complex has issued a manual SCRAM.", "color":"#FF9900","bold":true}

# advancement
advancement grant @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] only redstoneworld:rtcscram

