tellraw @a "very scary limbo trigged this is a placeholder 1 KILOSIEVERT VERY SCARY"

scoreboard players set #rtcreactorai info 0
scoreboard players set #rtcreactorpumprate info 0
scoreboard players set #rtcreactorusepump info 0

# 1 kSv/h!!!
scoreboard players add #radrtcreactoraddmsv info 1000000

# advancemente for ai failure
advancement grant @a[tag=rtcaiadv] only redstoneworld:rtcaifailure

# tag admin temp for testing
execute as @a[tag=inrtcreactor,tag=admin,gamemode=!spectator] run function projektredstoneworld:rtcreac/limboenter
