function cutscene_taxi_end() {
    var player = argument[0]
    var target_room = argument[1]
    with (player)
    {
        var handler = other.id
        cutscene = 1
        state = (117 << 0)
        if (grounded && state != (81 << 0))
        {
            hsp = 0
            vsp = 0
            with (instance_create((x - 1000), y, obj_taxi_cutscene))
            {
                targetplayer = player
                depth = -127
                targetDoor = "E"
                targetRoom = target_room
            }
            with (handler)
            {
                global.failcutscene = 1
                cutscene_end_action()
            }
        }
    }
}