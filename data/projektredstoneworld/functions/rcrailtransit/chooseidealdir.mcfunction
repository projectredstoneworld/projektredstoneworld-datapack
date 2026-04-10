# Get dest coords
function projektredstoneworld:rcrailtransit/applycoords

tag @s remove rcsidealnw
tag @s remove rcsidealse

execute unless score @s rchomex matches 255 run scoreboard players operation @s rcsxdiff = @s rcsx
execute unless score @s rchomex matches 255 run scoreboard players operation @s rcsxdiff -= @s rchomex

execute unless score @s rchomez matches 255 run scoreboard players operation @s rcszdiff = @s rcsz
execute unless score @s rchomez matches 255 run scoreboard players operation @s rcszdiff -= @s rchomez

# Handle Fringe Case: Forgotten Isle -> Spawn
execute if score @s rchomex matches 9 if score @s rcsx matches 9 run scoreboard players set @s rcsxdiff -1

execute unless score @s rchomex matches 255 if score @s rcsxdiff matches ..-1 run tag @s add rcsidealnw
execute unless score @s rchomex matches 255 if score @s rcsxdiff matches 0.. run tag @s add rcsidealse

execute unless score @s rchomez matches 255 if score @s rcszdiff matches ..-1 run tag @s add rcsidealnw
execute unless score @s rchomez matches 255 if score @s rcszdiff matches 0.. run tag @s add rcsidealse

