# === CONTROL RODS ===
scoreboard players remove #rtcreactorrodheight info 20
execute unless score #rtcreactorrodheight info matches 2.. run scoreboard players set #rtcreactorrodheight info 0
# Update Physical Height
scoreboard players operation #rtcreactoroldrodblocks info = #rtcreactorrodblocks info
scoreboard players operation #rtcreactorrodblocks info = #rtcreactorrodheight info
scoreboard players operation #rtcreactorrodblocks info /= 3 CONSTANTS
execute if score #rtcreactorrodblocks info matches 32.. run scoreboard players set #rtcreactorrodblocks info 32
execute unless score #rtcreactoroldrodblocks info = #rtcreactorrodblocks info as @e[type=marker,tag=rtcreactorcrod] at @s positioned ~ ~1 ~ run function projektredstoneworld:rtcreac/updcontrolrod

# === WATER ===
execute if score #rtcreactorfuelhpwarn info matches 2 run scoreboard players set #rtcreactorusepump info 1
execute if score #rtcreactorfuelhpwarn info matches 2 run scoreboard players set #rtcreactorpumprate info 500
execute unless score #rtcreactorfuelhpwarn info matches 2 run scoreboard players set #rtcreactorpumprate info 0
execute unless score #rtcreactorfuelhpwarn info matches 2 run scoreboard players set #rtcreactorusepump info 0

# ==== OTHER ====
scoreboard players set #rtcreactorboric info 0
scoreboard players set #rtcreactorwatermode info 1
scoreboard players set #rtcreactorfuelmode info 1
scoreboard players set #rtcreactortitcover info 1

# Disable AI if both emergencies happened
execute if score #rtcreactorfuelhpwarn info matches 2 if score #rtcreactorrcbhpwarn info matches 2 if score #rtcreactorlimbo info matches 0 run scoreboard players set #rtcreactorai info 0
