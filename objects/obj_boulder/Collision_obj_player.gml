with (other.id)
{
    if scr_transformationcheck()
    {
        if ((!grounded) && state != (39 << 0))
        {
            scr_losepoints()
            state = (80 << 0)
            hsp = 0
            vsp = 10
        }
    }
}
