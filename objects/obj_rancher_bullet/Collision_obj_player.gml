with (other.id)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if (state != (13 << 0) && state != (118 << 0))
    {
        scr_losepoints()
        grav /= 2
        state = (13 << 0)
        sprite_index = spr_player_ghostidle
        with (instance_create(x, y, obj_sausageman_dead))
        {
            hsp = (other.image_xscale * 3)
            image_xscale = (-other.image_xscale)
            sprite_index = spr_player_dead
        }
        instance_destroy(other.id)
    }
}
