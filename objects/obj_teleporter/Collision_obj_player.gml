player = other.object_index
if (start == 1)
{
    if (player.state != (59 << 0))
    {
        player.visible = false
        storedstate = player.state
        storedmovespeed = player.movespeed
        storedgrav = player.grav
        storedimageindex = player.image_index
        storedspriteindex = player.sprite_index
        storedfreefallsmash = player.freefallsmash
        repeat (8)
        {
            with (instance_create((x + random_range(50, -50)), (y + random_range(50, -50)), obj_cloudeffect))
                sprite_index = spr_teleporteffect
        }
        alarm[0] = 25
        player.hsp = 0
        player.vsp = 0
        player.grav = 0
        player.alarm[8] = 100
        player.alarm[7] = 50
        player.alarm[5] = 2
        player.hurted = 1
        player.state = (59 << 0)
    }
}
