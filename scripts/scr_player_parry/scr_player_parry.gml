function scr_player_parry() {
    if (image_index > (image_number - 1))
    {
        taunttimer = 0
        parry = 0
        state = tauntstoredstate
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
    }
    if grounded
        movespeed -= 0.5
    if (movespeed <= 0)
        movespeed = 0
    if (!audio_is_playing(sfx_parry))
        scr_soundeffect(sfx_parry)
    hsp = (movespeed * (-xscale))
    var _grabbedby = 1
    if (object_index == obj_player2)
        _grabbedby = 2
    if (parry_count > 0)
    {
        parry_count--
        var parry_threshold = 64
        with (obj_baddie)
        {
            if (distance_to_object(other.id) < parry_threshold && state != (119 << 0) && parryable && (!((state == (109 << 0) && thrown == 1))))
            {
                grabbedby = _grabbedby
                state = (119 << 0)
            }
        }
    }
}