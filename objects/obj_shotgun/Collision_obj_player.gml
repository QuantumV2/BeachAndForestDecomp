if (other.object_index == obj_player1)
{
    if (obj_player1.shotgunAnim == 0 && obj_player1.backupweapon == 0 && obj_player1.state == (29 << 0))
    {
        obj_player1.shotgunAnim = 1
        obj_player1.state = (46 << 0)
        obj_player1.image_index = 0
        obj_player1.sprite_index = obj_player1.spr_shotgunpullout
        global.gotshotgun = 1
        scr_soundeffect(sfx_shotgungot)
        instance_destroy()
        with (obj_tv)
        {
            image_speed = 0.25
            message = choose("ITS TIME TO KICK ASS", "...AND IM ALL OUT OF ASS", "KICKING ASS AND CHEWING ASS", "ITS TIME TO ASS", "IM ALL OUT OF BUBBLE GUM", "ITS TIME TO CHEW BUBBLE GUM AND KICK ASS", "ITS TIME TO KICK BUBBLE GUM", "ITS TIME FOR AN ASS KICKING", "ITS TIME FOR BUBBLE GUM", "ITS TIME TO CHEW ASS")
            alarm[0] = 200
            showtext = 1
            tvsprite = spr_tvdook
        }
    }
}
if (other.object_index == obj_player2)
{
    if (obj_player2.shotgunAnim == 0 && obj_player2.backupweapon == 0 && obj_player2.state == (29 << 0))
    {
        obj_player2.shotgunAnim = 1
        obj_player2.state = (46 << 0)
        obj_player2.image_index = 0
        obj_player2.sprite_index = obj_player2.spr_shotgunpullout
        global.gotshotgun = 1
        scr_soundeffect(sfx_shotgungot)
        instance_destroy()
        with (obj_tv)
        {
            image_speed = 0.25
            message = choose("ITS TIME TO KICK ASS", "...AND IM ALL OUT OF ASS", "KICKING ASS AND CHEWING ASS", "ITS TIME TO ASS", "IM ALL OUT OF BUBBLE GUM", "ITS TIME TO CHEW BUBBLE GUM AND KICK ASS", "ITS TIME TO KICK BUBBLE GUM", "ITS TIME FOR AN ASS KICKING", "ITS TIME FOR BUBBLE GUM", "ITS TIME TO CHEW ASS")
            alarm[0] = 200
            showtext = 1
            tvsprite = spr_tvdook
        }
    }
}
