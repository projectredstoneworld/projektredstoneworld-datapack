# Run bound function as the tag player

# === RTC2 ===
tag @s remove tagrtc2bound
# Inclusive areas --
# Main part of T3.0
execute if entity @s[x=-43,y=-43,z=642,dx=70,dy=643,dz=65] run tag @s add tagrtc2bound
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
# That one balcony
execute if entity @s[x=-53,y=98,z=663,dx=13,dy=11,dz=18] run tag @s add tagrtc2bound
# Exclusive areas --
# Bottom part of Tower 2
execute if entity @s[x=-35,y=22,z=562,dx=46,dy=40,dz=98] run tag @s remove tagrtc2bound
execute if entity @s[x=-35,y=62,z=572,dx=47,dy=35,dz=40] run tag @s remove tagrtc2bound
# Minigame center
execute if entity @s[x=-9,y=275,z=671,dx=19,dy=13,dz=12] run tag @s remove tagrtc2bound
# Reinclusive areas --
# Bottom part of Tower 3.0
execute if entity @s[x=-43,y=44,z=613,dx=58,dy=23,dz=57] run tag @s add tagrtc2bound
# Microbunker stairs
execute if entity @s[x=-12,y=11,z=644,dx=27,dy=23,dz=16] run tag @s add tagrtc2bound
execute if entity @s[x=-8,y=28,z=644,dx=32,dy=28,dz=5] run tag @s add tagrtc2bound

# === RTC ===
tag @s remove tagrtcbound
# Inclusive areas --
# Good hunk of T3.0 and T2
execute if entity @s[x=-69,y=17,z=533,dx=112,dy=600,dz=109] run tag @s add tagrtcbound
# Most of bridge
execute if entity @s[x=-50,y=82,z=109,dx=55,dy=64,dz=452] run tag @s add tagrtcbound
# Club
execute if entity @s[x=-50,y=-4,z=255,dx=63,dy=30,dz=91] run tag @s add tagrtcbound
# Secret mall
execute if entity @s[x=-99,y=-49,z=334,dx=163,dy=56,dz=295] run tag @s add tagrtcbound
# Mall to T2 stairs
execute if entity @s[x=-51,y=-45,z=602,dx=29,dy=65,dz=34] run tag @s add tagrtcbound
# Love you Ij <3
execute if entity @s[x=-25,y=47,z=406,dx=3,dy=52,dz=6] run tag @s add tagrtcbound
execute if entity @s[x=-35,y=47,z=398,dx=23,dy=13,dz=22] run tag @s add tagrtcbound
# Everything in RTC should be within RTC-2
tag @s[tag=tagrtc2bound] add tagrtcbound
# Forsaken quay
# Needs to be added

# === FI-RTC ===
tag @s remove tagfirtcbound
# Behemoth cuboid
execute if entity @s[x=-432,y=-66,z=6,dx=520,dy=1167,dz=821] run tag @s add tagfirtcbound
# Everything within FI-RTC should be within RTC
tag @s[tag=tagrtcbound] add tagfirtcbound
