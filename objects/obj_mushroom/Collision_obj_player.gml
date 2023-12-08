if (other.vsp > 0 && other.cutscene == 0 && other.state != (82 << 0) && other.state != (93 << 0))
{
    sprite_index = spr_bigmushroom_bounce
    if (other.state == (66 << 0) || other.state == (0 << 0))
        other.sprite_index = spr_player_machfreefall
    image_index = 0
    other.vsp = -20
    other.jumpstop = 1
}
