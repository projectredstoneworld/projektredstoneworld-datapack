# Run bound function as the tag player

# === RTC2 ===
tag @s remove tagrtc2bound
# Inclusive areas --
# Main part of T3.0
execute if entity @s[x=-39,y=-43,z=642,dx=66,dy=643,dz=65] run tag @s add tagrtc2bound
# Houses outside T3.0
execute if entity @s[x=-1,y=69,z=621,dx=39,dy=17,dz=77] run tag @s add tagrtc2bound
execute if entity @s[x=12,y=71,z=555,dx=43,dy=33,dz=77] run tag @s add tagrtc2bound
# Underground tunnels
execute if entity @s[x=-21,y=57,z=575,dx=68,dy=16,dz=81] run tag @s add tagrtc2bound
# Reactor
execute if entity @s[x=5,y=-21,z=569,dx=164,dy=19,dz=72] run tag @s add tagrtc2bound
# Microbunker
execute if entity @s[x=-83,y=-13,z=610,dx=74,dy=14,dz=115] run tag @s add tagrtc2bound
# Microbunker stairs
execute if entity @s[x=-39,y=-11,z=630,dx=51,dy=72,dz=27] run tag @s add tagrtc2bound
# Floor -1
execute if entity @s[x=-115,y=2,z=653,dx=137,dy=22,dz=123] run tag @s add tagrtc2bound
# Exclusive areas --
# Bottom part of Tower 2
execute if entity @s[x=-35,y=22,z=562,dx=46,dy=55,dz=98] run tag @s remove tagrtc2bound
execute if entity @s[x=-35,y=77,z=572,dx=47,dy=20,dz=40] run tag @s remove tagrtc2bound
