if (room == rm_editor)
    return;
if (index < 0)
    return;
if (sprite_index == spr_taximove)
{
    with (obj_player1)
    {
        x = other.xx
        y = other.yy
        if (global.coop == 1)
        {
            obj_player2.x = other.xx
            obj_player2.y = other.yy
        }
    }
    alarm[0] = 10
    sprite_index = spr_taxiidle
    with (instance_create((xx - 480), yy, obj_taxidud))
    {
        playerid = other.playerid
        sign_id = other.sign_id
    }
}
