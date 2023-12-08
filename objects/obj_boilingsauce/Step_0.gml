if (room == rm_editor)
    return;
if (obj_player1.character == "V" && place_meeting(x, (y - 1), obj_player1))
    scr_hurtplayer(obj_player1)
else
{
    if (place_meeting(x, (y - 1), obj_player1) && obj_player1.state != (3 << 0) && obj_player1.state != (63 << 0) && obj_player1.state != (21 << 0))
    {
        obj_player1.state = (9 << 0)
        obj_player1.image_index = 0
        obj_player1.vsp = -25
        obj_player1.sprite_index = obj_player1.spr_fireass
        if (!audio_is_playing(sfx_scream5))
            scr_soundeffect(sfx_scream5)
    }
    if (place_meeting(x, (y - 1), obj_player2) && obj_player2.state != (63 << 0) && obj_player2.state != (21 << 0))
    {
        obj_player2.state = (9 << 0)
        obj_player2.image_index = 0
        obj_player2.vsp = -25
        obj_player2.sprite_index = obj_player2.spr_fireass
        if (!audio_is_playing(sfx_scream5))
            scr_soundeffect(sfx_scream5)
    }
}
