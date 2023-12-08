with (other.id)
{
    if (instance_exists(baddieID) && baddieID.state != (119 << 0) && baddieID.object_index != obj_tank && (!baddieID.invincible))
    {
        if (other.playerid == obj_player1)
            baddieID.grabbedby = 1
        if (other.playerid == obj_player2)
            baddieID.grabbedby = 2
        instance_destroy()
        instance_destroy(baddieID)
    }
}
