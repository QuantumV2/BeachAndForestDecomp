with (obj_peasanto)
{
    if (place_meeting((x + hsp), y, other.id) && state == (99 << 0) && other.sprite_index != spr_haystackburning && other.sprite_index != spr_haystackburningup)
        other.sprite_index = spr_haystackburningup
}
if (place_meeting((x + 1), y, obj_haystack) && sprite_index == spr_haystackburning)
{
    with (instance_place((x + 1), y, obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
}
if (place_meeting((x - 1), y, obj_haystack) && sprite_index == spr_haystackburning)
{
    with (instance_place((x - 1), y, obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
}
if (place_meeting(x, (y + 1), obj_haystack) && sprite_index == spr_haystackburning)
{
    with (instance_place(x, (y + 1), obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
}
if (place_meeting(x, (y - 1), obj_haystack) && sprite_index == spr_haystackburning)
{
    with (instance_place(x, (y - 1), obj_haystack))
    {
        if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
            sprite_index = spr_haystackburningup
    }
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_haystackburningup)
    sprite_index = spr_haystackburning
if (sprite_index == spr_haystackburning && obj_player.state != (9 << 0) && obj_player.state != (31 << 0) && place_meeting(x, (y - 1), obj_player))
{
    with (obj_player1)
    {
        if (character == "V")
            scr_hurtplayer(obj_player1)
        else if scr_transformationcheck()
        {
            scr_losepoints()
            scr_soundeffect(sfx_scream3)
            state = (9 << 0)
            image_index = 0
            vsp = -5
            sprite_index = spr_fireass
        }
    }
}
with (instance_place(x, (y - 1), obj_player))
{
    if (state == (9 << 0) && other.sprite_index != spr_haystackburningup && other.sprite_index != spr_haystackburning)
        other.sprite_index = spr_haystackburningup
}
