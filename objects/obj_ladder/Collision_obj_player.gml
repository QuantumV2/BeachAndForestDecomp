with (obj_player1)
{
    if (key_up && place_meeting(x, y, other.id) && ladderbuffer == 0 && (state == (0 << 0) || state == (38 << 0) || state == (78 << 0) || state == (92 << 0) || state == (77 << 0) || state == (37 << 0) || state == (66 << 0) || state == (40 << 0)) && state != (81 << 0) && state != (79 << 0) && state != (82 << 0) && state != (85 << 0))
    {
        mach2 = 0
        state = (67 << 0)
        x = (other.x + 16)
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
}
if instance_exists(obj_player2)
{
    with (obj_player2)
    {
        if (key_up && place_meeting(x, y, other.id) && ladderbuffer == 0 && (state == (0 << 0) || state == (38 << 0) || state == (78 << 0) || state == (92 << 0) || state == (77 << 0) || state == (37 << 0) || state == (66 << 0) || state == (40 << 0)) && state != (81 << 0) && state != (79 << 0) && state != (82 << 0) && state != (85 << 0))
        {
            mach2 = 0
            state = (67 << 0)
            x = (other.x + 16)
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
    }
}
