# Are Generators needed?
execute if score #rtcreactorpowered info matches 1 run return fail

# Let's Count Diesel!
scoreboard players set #rtcreactordiesel info 0
execute if data block 89 -13 620 Items[0].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[1].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[2].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[3].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[4].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[5].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[6].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[7].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[8].tag.diesel run scoreboard players add #rtcreactordiesel info 1
execute if data block 89 -13 620 Items[{Slot:0b}] unless data block 89 -13 620 Items[{Slot:0b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.0 with air
execute if data block 89 -13 620 Items[{Slot:1b}] unless data block 89 -13 620 Items[{Slot:1b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.1 with air
execute if data block 89 -13 620 Items[{Slot:2b}] unless data block 89 -13 620 Items[{Slot:2b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.2 with air
execute if data block 89 -13 620 Items[{Slot:3b}] unless data block 89 -13 620 Items[{Slot:3b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.3 with air
execute if data block 89 -13 620 Items[{Slot:4b}] unless data block 89 -13 620 Items[{Slot:4b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.4 with air
execute if data block 89 -13 620 Items[{Slot:5b}] unless data block 89 -13 620 Items[{Slot:5b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.5 with air
execute if data block 89 -13 620 Items[{Slot:6b}] unless data block 89 -13 620 Items[{Slot:6b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.6 with air
execute if data block 89 -13 620 Items[{Slot:7b}] unless data block 89 -13 620 Items[{Slot:7b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.7 with air
execute if data block 89 -13 620 Items[{Slot:8b}] unless data block 89 -13 620 Items[{Slot:8b,id:"minecraft:splash_potion",tag:{diesel:1b}}] run item replace block 89 -13 620 container.8 with air

execute unless score #rtcreactordiesel info matches 1.. unless score #rtcreactordieseltime info matches 1.. run return fail

execute if score #rtcreactordiesel info matches 1.. if score #rtcreactordieseltime info matches 0 run playsound minecraft:block.brewing_stand.brew master @a[distance=..25] 90.00 -12.46 620.36 360 1 1
execute if score #rtcreactordiesel info matches 1.. if score #rtcreactordieseltime info matches 0 run clone 89 -13 620 89 -13 620 83 -13 620
execute if score #rtcreactordiesel info matches 1.. if score #rtcreactordieseltime info matches 0 run setblock 83 -15 617 minecraft:redstone_block
execute if score #rtcreactordiesel info matches 1.. if score #rtcreactordieseltime info matches 0 run scoreboard players set #rtcreactordieseltime info 30


execute positioned 89.60 -15.00 617.50 run playsound minecraft:entity.minecart.riding master @a[distance=..25] ~ ~ ~ 2 0 0.1
execute if score #rtcreactordieseltime info matches 1.. run scoreboard players remove #rtcreactordieseltime info 1
scoreboard players set #rtcreactorpowered info 1
execute unless score #rtcreactordiesel info matches 1.. unless score #rtcreactordieseltime info matches 1.. run tellraw @a {"text":"The RTC Reactor has ran out of emergency diesel fuel and the aux battery is depleted. No controls will be functioning, please add diesel from the Science Lab to the reactor to restore power.","color":"yellow"}
