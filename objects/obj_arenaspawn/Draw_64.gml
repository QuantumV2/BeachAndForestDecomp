draw_set_halign(fa_center)
draw_set_color(c_white)
draw_set_font(global.bigfont)
if (state == (113 << 0) || state == (114 << 0))
{
    var text_yy = 65
    if (global.panic == 1)
        text_yy = ((65 + string_height("0:00")) + 8)
    if (wave_seconds < 10)
    {
        if (wave_minutes < 1)
            draw_set_color(c_red)
        else
            draw_set_color(c_white)
        draw_text((random_range(1, -1) + 480), (random_range(1, -1) + text_yy), ((string(wave_minutes) + ":0") + string(wave_seconds)))
    }
    else if (wave_seconds >= 10)
    {
        if (wave_minutes == 0 && wave_seconds <= 30)
            draw_set_color(c_red)
        else
            draw_set_color(c_white)
        draw_text((random_range(1, -1) + 480), (random_range(1, -1) + text_yy), ((string(wave_minutes) + ":") + string(wave_seconds)))
    }
}
if (state == (116 << 0))
    draw_text((random_range(1, -1) + 480), (random_range(1, -1) + 500), ("ROUND " + string((wave + 1))))
