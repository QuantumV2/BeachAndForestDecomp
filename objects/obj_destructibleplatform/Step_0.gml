if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheeseblock && falling == 1)
{
    x = -100
    y = -100
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheeseblock && falling == 1)
{
    image_speed = 0
    visible = false
}
if (visible == false)
    reset--
if (reset < 0 && (!(place_meeting(x, y, obj_player))))
{
    reset = 100
    visible = true
    image_speed = 0.35
    falling = 0
    x = xstart
    y = ystart
    sprite_index = spr_cheeseblockreform
}
if (sprite_index == spr_cheeseblockreform && floor(image_index) == (image_number - 1))
{
    sprite_index = spr_cheeseblock
    image_speed = 0
    image_index = 0
}
