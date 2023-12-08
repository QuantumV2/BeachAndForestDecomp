with (instance_place(x, (y - 1), obj_player))
{
    if (state != (92 << 0) && sprite_index != spr_mach3boost)
    {
        scr_losepoints()
        image_index = 0
        state = (9 << 0)
        vsp = -21
        instance_create(x, (y + 20), obj_piranneapplewater)
        sprite_index = spr_player_scaredjump1
        with (instance_create(x, y, obj_superdashcloud))
            sprite_index = spr_watereffect
    }
}
with (instance_place(x, (y - 1), obj_baddie))
    instance_destroy()
