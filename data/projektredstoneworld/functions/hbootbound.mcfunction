execute as @a[tag=hbootbound,x=0,y=65,z=564,dx=13,dy=1,dz=2] at @s run tp @s @e[type=boat,tag=hboot,limit=1,sort=nearest]

execute if block 1 64 573 minecraft:comparator[powered=true] run schedule function projektredstoneworld:hbootbound 2t