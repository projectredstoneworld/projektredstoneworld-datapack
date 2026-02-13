execute as @e[x=-35,y=252,z=594,dx=6,dy=5,dz=6,type=item] run kill @s
execute store success score #t2mdfailure info run clear @s #projektredstoneworld:t2mdrestricteditems 0
execute if score #t2mdfailure info matches 1.. run tag @s add t2mdfailure
