if (room == rank_room || room == timesuproom || room == boss_room1 || room == Realtitlescreen || room == characterselect)
    visible = false
else
    visible = true
if (showtext == 1)
{
    xi = (500 + random_range(1, -1))
    if (yi > 500)
        yi -= 5
}
if (showtext == 0)
{
    xi = (500 + random_range(1, -1))
    if (yi < 600)
        yi += 1
}
if (!((obj_player.state == (31 << 0) && obj_player.state == (32 << 0) && obj_player.state == (25 << 0))))
    once = 0
if (obj_player.y < 200 && obj_player.x > (room_width - 200))
    alpha = 0.5
else if (!((room == rank_room || room == timesuproom || room == boss_room1 || room == Realtitlescreen || room == characterselect)))
    alpha = 1
if instance_exists(obj_itspizzatime)
{
    image_speed = 0.25
    message = "GET TO THE EXIT!!"
    alarm[0] = 200
    showtext = 1
    tvsprite = spr_tvexit
}
else if (global.collect > global.arank && shownranka == 0 && obj_player.character == "P")
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK A"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvranka
    shownranka = 1
}
else if (global.collect > global.brank && shownrankb == 0 && obj_player.character == "P")
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK B"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvrankb
    shownrankb = 1
}
else if (global.collect > global.crank && shownrankc == 0 && obj_player.character == "P")
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK C"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvrankc
    shownrankc = 1
}
else if (obj_player.sprite_index == spr_player_levelcomplete)
{
    image_speed = 0.1
    alarm[0] = 50
    chose = 1
    tvsprite = spr_tvclap
    once = 1
}
else if (obj_player.state == (81 << 0))
{
    image_speed = 0.1
    showtext = 1
    if (chose == 0)
        message = choose("OW!", "OUCH!", "OH!", "WOH!")
    alarm[0] = 50
    chose = 1
    tvsprite = spr_tvhurt
    once = 1
}
else if (obj_player.state == (44 << 0) || obj_player.state == (7 << 0))
{
    alarm[0] = 50
    image_speed = 0.1
    tvsprite = spr_tvskull
}
else if (global.miniboss == 1)
{
    alarm[0] = 50
    image_speed = 0.1
    tvsprite = spr_tvnoise
}
else if (global.hurtcounter >= global.hurtmilestone && obj_player.character == "P")
{
    alarm[0] = 150
    image_speed = 0.1
    if (obj_player.character == "P")
        character = "PEPPINO"
    else
        character = "THE NOISE"
    message = (((("YOU HAVE HURT " + string(character)) + " ") + string(global.hurtmilestone)) + " TIMES...")
    if (tvsprite != spr_tvtalking1 && tvsprite != spr_tvtalking2 && tvsprite != spr_tvtalking3 && tvsprite != spr_tvtalking4)
        tvsprite = choose(spr_tvtalking1, spr_tvtalking2, spr_tvtalking3, spr_tvtalking4)
    global.hurtmilestone += 3
}
else if (obj_player.state == (52 << 0))
{
    showtext = 1
    message = "SWEET DUDE!!"
    alarm[0] = 50
    tvsprite = spr_tvrad
    once = 1
}
else if (global.combo != 0 && global.combotime != 0 && (tvsprite == spr_tvdefault || tvsprite == spr_tvcombo || tvsprite == spr_tvescape))
{
    tvsprite = spr_tvcombo
    image_speed = 0
    if (global.combo >= 4)
        imageindexstore = 3
    else
        imageindexstore = (global.combo - 1)
}
else if (global.combotime == 0 && tvsprite == spr_tvcombo)
{
    tvsprite = spr_tvcomboresult
    image_index = imageindexstore
    alarm[0] = 50
}
else if (room == Realtitlescreen)
{
    image_speed = 0.1
    tvsprite = spr_tvbanana
    alarm[0] = 2
    if (obj_mainmenuselect.selected == 0)
    {
        if (obj_mainmenuselect.optionselected == 0)
        {
            showtext = 1
            message = "START GAME"
        }
        if (obj_mainmenuselect.optionselected == 1)
        {
            showtext = 1
            message = "OPTION"
        }
        if (obj_mainmenuselect.optionselected == 2)
        {
            showtext = 1
            message = "ERASE DATA"
        }
    }
    else
    {
        showtext = 1
        message = ""
    }
}
if (obj_player.state == (64 << 0))
{
    showtext = 1
    message = "GOT THE KEY!"
    alarm[0] = 50
}
if instance_exists(obj_noise_pushbutton)
{
    if (obj_noise_pushbutton.hsp != 0 && global.panic == 0)
    {
        showtext = 1
        message = "UH OH..."
        alarm[0] = 50
    }
}
