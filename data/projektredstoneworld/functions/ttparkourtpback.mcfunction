# Since it's a catalyst, one person is brought back at a time

# If initrestorertcm.mcfunction is done in mainworld
execute if entity @a[tag=parkourrestore] run return fail

tag @a[x=-158,y=139,z=455,dx=-14,dy=-2,dz=-11,gamemode=!spectator,sort=random,limit=1,tag=ttparkourtoreturn] add parkourrestore



# Teleport back to the tower 0 from mainworld whilst keeping the same relative position inside the room which we pick players from
execute as @a[tag=parkourrestore] at @s rotated as @s in minecraft:overworld run tp @s ~-242 ~-31 ~13 ~ ~

execute in minecraft:overworld as @a[tag=parkourrestore] run function projektredstoneworld:initrestoreparkour

tag @a[tag=parkourrestore] remove parkourrestore
tag @a[tag=parkourrestore] remove ttparkourtoreturn

execute if entity @a[x=-158,y=139,z=455,dx=-14,dy=-2,dz=-11,gamemode=!spectator,limit=1,tag=ttparkourtoreturn] run function projektredstoneworld:ttparkourtpback