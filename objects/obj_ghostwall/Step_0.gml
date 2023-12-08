if ((obj_player1.state == (13 << 0) || obj_player2.state == (13 << 0)) && away == 0)
{
    away = 1
    x = -200
    y = 100
}
else if (away == 1 && obj_player1.state != (13 << 0) && obj_player2.state != (13 << 0))
{
    away = 0
    x = xstart
    y = ystart
}
