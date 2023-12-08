x = playerid.x
y = playerid.y
with (playerid)
{
    if (state != (54 << 0) && sprite_index != spr_player_breakdance && sprite_index != spr_player_breakdancestart)
        instance_destroy(other.id)
}
