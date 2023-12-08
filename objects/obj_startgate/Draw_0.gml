draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_self()
if (drawing == 1)
{
    draw_text(x, (y - 150), ini_read_real("Highscore", string(level), 0))
    draw_text(x, (y - 200), (ini_read_string("Secret", string(level), 0) + " OF 6 SECRET"))
    if (ini_read_real("Toppin", (string(level) + "1"), 0) == 1)
        draw_sprite(spr_toppinshroom, -1, (x - 75), (y - 100))
    else
        draw_sprite(spr_toppinshroom_pause, -1, (x - 75), (y - 100))
    if (ini_read_real("Toppin", (string(level) + "2"), 0) == 1)
        draw_sprite(spr_toppincheese, -1, (x - 35), (y - 100))
    else
        draw_sprite(spr_toppincheese_pause, -1, (x - 35), (y - 100))
    if (ini_read_real("Toppin", (string(level) + "3"), 0) == 1)
        draw_sprite(spr_toppintomato, -1, x, (y - 100))
    else
        draw_sprite(spr_toppintomato_pause, -1, x, (y - 100))
    if (ini_read_real("Toppin", (string(level) + "4"), 0) == 1)
        draw_sprite(spr_toppinsausage, -1, (x + 35), (y - 100))
    else
        draw_sprite(spr_toppinsausage_pause, -1, (x + 35), (y - 100))
    if (ini_read_real("Toppin", (string(level) + "5"), 0) == 1)
        draw_sprite(spr_toppinpineapple, -1, (x + 75), (y - 100))
    else
        draw_sprite(spr_toppinpineapple_pause, -1, (x + 75), (y - 100))
}
