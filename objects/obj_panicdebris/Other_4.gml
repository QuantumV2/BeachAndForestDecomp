var lay_id = layer_get_id("Backgrounds_1")
var back_id = layer_background_get_id(lay_id)
var lay_id2 = layer_get_id("Backgrounds_2")
var back_id2 = layer_background_get_id(lay_id2)
var lay_id3 = layer_get_id("Backgrounds_3")
var back_id3 = layer_background_get_id(lay_id3)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 1421)
    layer_background_sprite(back_id, bg_castle3escape)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 1418)
    layer_background_sprite(back_id, bg_castle4escape)
if (global.panic == 1 && layer_background_get_sprite(back_id3) == 1423)
    layer_background_sprite(back_id3, bg_castle1escape)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 1388)
    layer_background_sprite(back_id, bg_factory3escape)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 1391)
    layer_background_sprite(back_id, bg_factory1escape)
if (global.panic == 1 && layer_background_get_sprite(back_id2) == 1393)
    layer_background_sprite(back_id2, bg_factory2escape)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 1459)
    layer_background_sprite(back_id, bg_sewer1escape)
if (global.panic == 1 && layer_background_get_sprite(back_id2) == 1457)
    layer_background_sprite(back_id2, bg_sewer2escape)
if (global.panic == 1 && layer_background_get_sprite(back_id3) == 1455)
    layer_background_sprite(back_id3, bg_sewer3escape)