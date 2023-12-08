if (object_index != obj_pizzaball)
{
    with (other.id)
    {
        if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID != other.id && other.baddieID.killbyenemy)
        {
            if (baddieID.state == (109 << 0) && baddieID.thrown == 1)
                instance_destroy(other.baddieID)
        }
    }
}
