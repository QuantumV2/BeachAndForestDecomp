if (place_meeting(x, (y - 1), other.id) && other.vsp > 1)
{
    with (other.id)
    {
        state = (87 << 0)
        image_index = 0
        sprite_index = spr_player_barrelcrouch
    }
    instance_destroy()
}
