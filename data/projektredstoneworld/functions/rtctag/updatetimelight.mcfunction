tellraw @a[x=281,y=2,z=649,dx=11,dy=8,dz=21] [{"text":"Tag time limit has been set to: "},{"score":{"name":"#tagtime","objective":"info"}},{"text":" minutes."}]

fill 283 5 657 283 5 654 minecraft:stone_button[powered=false,facing=east,face=wall]

fill 281 6 654 281 6 657 minecraft:pink_stained_glass

execute if score #tagtime info matches 10 run setblock 281 6 657 minecraft:redstone_block
execute if score #tagtime info matches 20 run setblock 281 6 656 minecraft:redstone_block
execute if score #tagtime info matches 35 run setblock 281 6 655 minecraft:redstone_block
execute if score #tagtime info matches 45 run setblock 281 6 654 minecraft:redstone_block
