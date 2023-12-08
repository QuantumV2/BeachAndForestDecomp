if place_meeting(x, (y - 1), obj_player1)
{
    with (obj_player1)
    {
        if (place_meeting(x, (y + 1), obj_ladder) && key_down && (state == (74 << 0) || (character == "S" && (state == (0 << 0) || state == (77 << 0)))) && place_meeting(x, (y + 1), obj_platform))
        {
            other.hooked = 1
            other.playerid = object_index
            y += 5
            state = (67 << 0)
            x = (other.x + 16)
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
    }
}
if instance_exists(obj_player2)
{
    if place_meeting(x, (y - 1), obj_player2)
    {
        with (obj_player2)
        {
            if (place_meeting(x, (y + 1), obj_ladder) && key_down && (state == (74 << 0) || (character == "S" && (state == (0 << 0) || state == (77 << 0)))) && place_meeting(x, (y + 1), obj_platform))
            {
                other.hooked = 1
                other.playerid = object_index
                y += 5
                state = (67 << 0)
                x = (other.x + 16)
                y = floor(y)
                if ((y % 2) == 1)
                    y -= 1
            }
        }
    }
}
if place_meeting(x, (y - 50), obj_solid)
{
    repeat (3)
    {
        with (instance_create((x + 16), y, obj_debris))
            sprite_index = spr_wooddebris
    }
    instance_destroy()
    instance_create(startx, starty, obj_hookup)
}
if (place_meeting(x, (y - 200), obj_solid) && blinking == 0)
{
    blinking = 1
    alarm[0] = 1
}
if (hooked == 1)
{
    y -= 5
    if (playerid.state == (67 << 0) && place_meeting(x, y, playerid))
        playerid.y -= 5
    if (y < -50)
    {
        instance_destroy()
        instance_create(startx, starty, obj_hookup)
    }
}
