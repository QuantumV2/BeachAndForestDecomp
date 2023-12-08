function live_room_loader_anim_speed() {
    var l_val = argument[0]
    if (argument[1] == "0")
        return (l_val / room_speed);
    else
        return l_val;
}