image_xscale = playerid.xscale
if (playerid.supercharged == 0)
    instance_destroy()
x = playerid.x
y = playerid.y
visible = playerid.visible
if (global.combotime == 0)
{
    playerid.supercharged = 0
    instance_destroy()
}
