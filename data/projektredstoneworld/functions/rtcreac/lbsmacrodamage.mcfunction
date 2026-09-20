# Smallest subnormal value approx via 0.000000000000000000000000000000000000000000001
# Called from reactorsecond
# far = Damage for players < 56 blocks
# near = Damage for players < 36 blocks

# Set up death message (there is an insanely small chance this gives the slain message but who cares lmfao)
execute as @a[distance=..56] run damage @s 0.000000000000000000000000000000000000000000001 mob_attack by @e[type=vindicator,name="by their own incompetence",limit=1,x=82,y=-55,z=600,dx=4,dy=4,dz=4]

$execute as @a[distance=..36] run damage @s $(near) minecraft:hot_floor
$execute as @a[distance=..56] run damage @s $(far) minecraft:hot_floor
