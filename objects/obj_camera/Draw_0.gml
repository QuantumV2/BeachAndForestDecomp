if (room == custom_lvl_room)
    return;
draw_set_color(c_black)
draw_rectangle(0, 0, -50, room_height, false)
draw_rectangle(room_width, 0, (room_width + 50), room_height, false)
draw_rectangle(0, 0, room_width, -50, false)
draw_rectangle(0, room_height, room_width, (room_height + 50), false)
