# Opening
# Museum tunnel entrance
forceload add -156 603
fill -157 41 601 -158 43 602 air
tellraw @a "[Server] Museum tunnelsystem entrance has been opened"
# Museum main entrance
forceload add -135 910 -145 915
fill -136 70 911 -138 73 912 air replace barrier
fill -144 70 911 -146 73 912 air replace barrier
tellraw @a "[Server] Museum front entrance has been opened"
# Curator
forceload add -149 876
setblock -149 31 876 minecraft:redstone_block
tellraw @a "[Server] The Museum Curator is ready to give quests!"
# Minigame transporter
forceload add 2 682
setblock 2 273 682 minecraft:redstone_block
tellraw @a "[Server] The RTC Minigame Transporter has been enabled (Floor 15 of Tower 3.0)"

# FI Fireworks & Beacon
forceload add -315 499 -315 490
setblock -315 84 499 lever[face=wall,facing=east,powered=true]
tellraw @a "[Server] FI Fireworks & Beacons have been enabled!"
# Day count
scoreboard players set #tag info 24999
# Advancement
advancement grant @a only redstoneworld:rebornx
tellraw @a "[Server] Advancement has been distributed"
# FI local control reborn adv
forceload add -301 519
setblock -301 85 520 minecraft:redstone_block

playsound block.end_portal.spawn master @a ~ ~ ~ 6767 1 1
tellraw @a {"text":"HAPPY REBORN X","color":"#3367FF","bold":true}
tellraw @a {"text":"To celebrate 10 years of Reborn, a new video has been released on Ij's channel, the museum has been opened AND the minigame center is also open. Have fun!!!","color":"#FF3333"}

forceload remove all
