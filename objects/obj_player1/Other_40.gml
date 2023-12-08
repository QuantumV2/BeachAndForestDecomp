if ((distance_to_object(obj_player2) > 1000 || key_taunt2) && obj_player1.spotlight == 0)
{
    alarm[5] = 2
    alarm[7] = 60
    hurted = 1
    x = obj_player2.x
    y = obj_player2.y
    state = (0 << 0)
    if (global.collect >= 1000)
    {
        global.collect -= 1000
        global.collectN += 1000
        with (instance_create(obj_player2.x, obj_player2.y, obj_smallnumber))
            number = "1000"
    }
    else if (global.collect >= 100)
    {
        global.collect -= 100
        global.collectN += 100
        with (instance_create(obj_player2.x, obj_player2.y, obj_smallnumber))
            number = "100"
    }
}
