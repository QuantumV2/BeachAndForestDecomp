image_xscale = obj_player.xscale
if (obj_player.state == (41 << 0))
{
    x = obj_player.x
    y = obj_player.y
}
if (obj_player.state == (36 << 0))
{
    x = (obj_player.x + ((-obj_player.image_xscale) * 20))
    y = (obj_player.y + 30)
}
if (obj_player.state != (41 << 0) && obj_player.state != (36 << 0))
    instance_destroy()
image_speed = 0.35
