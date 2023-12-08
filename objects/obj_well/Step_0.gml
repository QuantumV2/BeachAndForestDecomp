if ((!instance_exists(ID)) && obj_player1.state != (11 << 0) && obj_player2.state != (11 << 0) && place_meeting(x, y, obj_player))
{
    instance_destroy(obj_mort)
    with (instance_create(x, (y - 50), obj_mort))
        other.ID = id
}
