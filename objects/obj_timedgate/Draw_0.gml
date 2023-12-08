if (global.timedgate == 1)
    draw_sprite_ext(sprite_index, image_index, xstart, ystart, image_xscale, image_yscale, 0, c_white, 0.25)
else
    draw_sprite_ext(sprite_index, image_index, xstart, ystart, image_xscale, image_yscale, 0, c_white, 1)
