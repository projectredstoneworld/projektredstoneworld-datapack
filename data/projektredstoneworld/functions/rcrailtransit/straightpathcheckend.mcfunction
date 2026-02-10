tag @e[type=minecart,distance=..49,tag=minecartgayrcrail] remove minecartgayrcrail
#say i am here, yes, this is my name. Hello. I am here. Hi. I am marker.
#execute store result storage projektredstoneworld:gaydata rcrailpos0 int 
#data modify storage projektredstoneworld:gaydata gaymarkerpos set from entity @s Pos
#data modify storage projektredstoneworld:gaydata gaymarkerxyz set from entity @s data
#data modify storage projektredstoneworld:gaydata gaymarkerpapi set from entity @s "Paper.Origin"
#data modify storage projektredstoneworld:gaydata gayblock set from block ~ ~ ~

kill @s
