execute store result score @s vaultdonationsize run data get entity @s Item.Count
scoreboard players operation #rtcdiamonds info += @s vaultdonationsize
function projektredstoneworld:vault/updatedisplays
kill @s

