if (obj_player1.spotlight == 1)
    playerid = obj_player1
else
    playerid = obj_player2
visible = playerid.visible
if (set == 0)
{
    switch toppinwarrior
    {
        case 1:
            depth = 10
            followid = playerid
            spr_idle = spr_twarrior1_idle
            spr_pose = spr_twarrior1_pose
            spr_run = spr_twarrior1_run
            spr_attack = spr_twarrior1_attack
            spr_hurt = spr_twarrior1_hurt
            global.toppinwarriorid1 = id
            set = 1
            break
        case 2:
            depth = 11
            if variable_global_exists("toppinwarriorid1")
                followid = global.toppinwarriorid1
            else
                followid = playerid
            spr_idle = spr_twarrior2_idle
            spr_pose = spr_twarrior2_pose
            spr_run = spr_twarrior2_run
            spr_attack = spr_twarrior2_attack
            spr_hurt = spr_twarrior2_hurt
            global.toppinwarriorid2 = id
            set = 1
            break
        case 3:
            depth = 12
            if variable_global_exists("toppinwarriorid2")
                followid = global.toppinwarriorid2
            else if variable_global_exists("toppinwarriorid1")
                followid = global.toppinwarriorid1
            else
                followid = playerid
            spr_idle = spr_twarrior3_idle
            spr_pose = spr_twarrior3_pose
            spr_run = spr_twarrior3_run
            spr_attack = spr_twarrior3_attack
            spr_hurt = spr_twarrior3_hurt
            global.toppinwarriorid3 = id
            set = 1
            break
        case 4:
            depth = 13
            if variable_global_exists("toppinwarriorid3")
                followid = global.toppinwarriorid3
            else if variable_global_exists("toppinwarriorid2")
                followid = global.toppinwarriorid2
            else if variable_global_exists("toppinwarriorid1")
                followid = global.toppinwarriorid1
            else
                followid = playerid
            spr_idle = spr_twarrior4_idle
            spr_pose = spr_twarrior4_pose
            spr_run = spr_twarrior4_run
            spr_attack = spr_twarrior4_attack
            spr_hurt = spr_twarrior4_hurt
            global.toppinwarriorid4 = id
            set = 1
            break
        case 5:
            depth = 14
            if variable_global_exists("toppinwarriorid4")
                followid = global.toppinwarriorid4
            else if variable_global_exists("toppinwarriorid3")
                followid = global.toppinwarriorid3
            else if variable_global_exists("toppinwarriorid2")
                followid = global.toppinwarriorid2
            else if variable_global_exists("toppinwarriorid1")
                followid = global.toppinwarriorid1
            else
                followid = playerid
            spr_idle = spr_twarrior5_idle
            spr_pose = spr_twarrior5_pose
            spr_run = spr_twarrior5_run
            spr_attack = spr_twarrior5_attack
            spr_hurt = spr_twarrior5_hurt
            global.toppinwarriorid5 = id
            set = 1
            break
    }

}
if (playerid.grounded == 1)
{
    if (space < 30 && dir == -1)
        space++
    if (space > -30 && dir == 1)
        space--
}
else if (space > 0)
    space--
else if (space < 0)
    space++
if instance_exists(followid)
{
    ds_queue_enqueue(followQueue, (followid.x + space))
    ds_queue_enqueue(followQueue, followid.y)
    LAG_STEPS = 10
    if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
    {
        x = ds_queue_dequeue(followQueue)
        y = ds_queue_dequeue(followQueue)
    }
}
if ((xprevious - x) != 0)
    image_xscale = (-(sign((xprevious - x))))
else if (playerid.hsp == 0)
    image_xscale = playerid.xscale
if (dir != playerid.xscale)
    dir = playerid.xscale
if (playerid.state != (59 << 0))
{
    if (x != xprevious || y != yprevious)
        sprite_index = spr_run
    else
        sprite_index = spr_idle
}
else
    sprite_index = spr_pose
if (sprite_index == spr_run && scr_solid(x, (y + 1)) && visible == true)
    steppy--
if (steppy == 0)
{
    instance_create(x, (y + 43), obj_cloudeffect)
    steppy = 20
}
