draw_self()
if (image_alpha == 0)
{
    draw_set_color(c_red)
    draw_rectangle(x, y, (x + width), (y + height), true)
    draw_set_color(c_white)
}
