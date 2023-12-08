if (global.stylethreshold == 3)
{
    draw_sprite_ext(spr_heatmeter4, -1, 480, (44 + animationy), image_xscale, image_yscale, 0, c_white, alpha)
    draw_sprite_part_ext(spr_heatmeter4under, 0, 0, 0, (sprite_get_width(spr_heatmeter4under) - (global.style * 2)), sprite_get_height(spr_heatmeter4under), 562, (-56 + animationy), -1, image_yscale, c_white, alpha)
}
if (global.stylethreshold == 2)
{
    draw_sprite_ext(spr_heatmeter3, -1, 480, (44 + animationy), image_xscale, image_yscale, 0, c_white, alpha)
    draw_sprite_part_ext(spr_heatmeter3under, 0, 0, 0, (sprite_get_width(spr_heatmeter3under) - (global.style * 2)), sprite_get_height(spr_heatmeter3under), 562, (-56 + animationy), -1, image_yscale, c_white, alpha)
}
if (global.stylethreshold == 1)
{
    draw_sprite_ext(spr_heatmeter2, -1, 480, (44 + animationy), image_xscale, image_yscale, 0, c_white, alpha)
    draw_sprite_part_ext(spr_heatmeter2under, 0, 0, 0, (sprite_get_width(spr_heatmeter2under) - (global.style * 2)), sprite_get_height(spr_heatmeter2under), 562, (-56 + animationy), -1, image_yscale, c_white, alpha)
}
if (global.stylethreshold == 0)
{
    draw_sprite_ext(spr_heatmeter1, -1, 480, (44 + animationy), image_xscale, image_yscale, 0, c_white, alpha)
    draw_sprite_part_ext(spr_heatmeter1under, 0, 0, 0, (sprite_get_width(spr_heatmeter1under) - (global.style * 2)), sprite_get_height(spr_heatmeter1under), 562, (-56 + animationy), -1, image_yscale, c_white, alpha)
}
