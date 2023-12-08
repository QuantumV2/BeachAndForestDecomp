image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if ((playerid.image_index > 3 || playerid.state != (18 << 0)) && playerid.state != (29 << 0) && playerid.state != (15 << 0))
    instance_destroy()
