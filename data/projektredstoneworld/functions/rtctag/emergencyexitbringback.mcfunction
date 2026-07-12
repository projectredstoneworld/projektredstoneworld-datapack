execute if entity @s[x=-4,y=-9,z=696,dx=2,dy=2,dz=2] run return fail
execute at @s positioned -2.5 ~-1 697.5 run summon minecart ~ ~ ~ {Tags:["pontokarestoreemer"]}
execute at @s positioned -2.5 ~-1 697.5 run ride @s mount @e[type=minecart,tag=pontokarestoreemer,limit=1,sort=nearest,distance=..200]
tag @e[type=minecart,x=-4,y=-9,z=696,dx=2,dy=350,dz=2] remove pontokarestoreemer