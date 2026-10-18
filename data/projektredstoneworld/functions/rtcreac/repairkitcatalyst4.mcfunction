scoreboard players set #rtcreactorspewmode info 1
scoreboard players set #rtcreactorspew info 2147483647
scoreboard players set #rtcreactorspewtime info 56

tellraw @a [{"text":"CRITICAL SAFETY WARNING\n","color":"#FF00FF","bold":true},{"text":"An unprecedented radiation spike is now occuring, centered around the RTC reactor island. Anybody within a several hundred block radius will recieve a potentially lethal technogenic radiation dose. DISTANCE MATTERS!!! Keep distance from the reactor to avoid a high dose and SEEK SHELTER INSIDE OF THE BUNKERS!!!"}]

# Lore lines for chat
forceload add -121 53
setblock -121 33 53 redstone_block

# Fixaroo!
schedule function projektredstoneworld:rtcreac/repairkitcatalystfix 30t
