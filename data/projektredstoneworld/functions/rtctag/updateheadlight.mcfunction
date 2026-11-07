execute if score #taghead info matches ..9 run tellraw @a[x=281,y=2,z=649,dx=11,dy=8,dz=21] [{"text":"Head start has been set to the value of "},{"score":{"name":"#taghead","objective":"info"}},{"text":" minute(s)."}]
execute if score #taghead info matches 10.. run tellraw @a[x=281,y=2,z=649,dx=11,dy=8,dz=21] [{"text":"Head start has been set to the value of "},{"score":{"name":"#taghead","objective":"info"}},{"text":" seconds."}]

fill 283 5 662 283 5 659 minecraft:stone_button[powered=false,facing=east,face=wall]

fill 281 6 659 281 6 662 minecraft:pink_stained_glass

execute if score #taghead info matches 7 run setblock 281 6 662 minecraft:redstone_block
execute if score #taghead info matches 30 run setblock 281 6 661 minecraft:redstone_block
execute if score #taghead info matches 1 run setblock 281 6 660 minecraft:redstone_block
execute if score #taghead info matches 2 run setblock 281 6 659 minecraft:redstone_block
