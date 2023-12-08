draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if (room != strongcold_endscreen)
    draw_sprite_ext(tvsprite, -1, 832, 74, 1, 1, 1, c_white, alpha)
draw_text(xi, yi, string_hash_to_newline(message))
if (global.combo != 0 && global.combotime != 0 && (tvsprite == spr_tvdefault || tvsprite == spr_tvcombo))
    draw_text(852, 75, string_hash_to_newline(global.combo))
if (tvsprite == spr_tvdefault && room != strongcold_endscreen && global.miniboss == 0)
{
    chose = 0
    if (global.coop == 0)
        draw_text(832, 60, string_hash_to_newline(global.collect))
    else
    {
        draw_text(832, 40, string_hash_to_newline(global.collect))
        draw_text(832, 80, string_hash_to_newline(global.collectN))
    }
}
else if (global.miniboss == 1)
    draw_text(832, 60, string_hash_to_newline(global.boxhp))
if instance_exists(obj_pizzaball)
    draw_text(832, 300, string_hash_to_newline(((string(global.golfhit) + " ") + "GOLF HIT")))
