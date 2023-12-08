obj_player.state = (0 << 0)
with (instance_create(x, y, obj_smallnumber))
    number = "2000"
if (player == obj_solid)
    global.collect += 2000
else if (player == obj_player)
    global.collectN += 2000
instance_destroy()
