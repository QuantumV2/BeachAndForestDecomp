with (obj_player)
{
    if (other.image_yscale == 1)
    {
        if (((key_down && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other.id) && (state == (74 << 0) || character == "S" || state == (45 << 0))) || ((state == (76 << 0) || state == (82 << 0) || state == (85 << 0)) && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other.id))) && (!instance_exists(obj_fadeout)) && state != (86 << 0) && state != (69 << 0) && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
        {
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            other.depth = -10
            scr_soundeffect(sfx_box)
            obj_player1.box = 1
            obj_player2.box = 1
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            if (global.coop == 1)
            {
                obj_player1.x = other.x
                obj_player2.x = other.x
                if (obj_player1.spotlight == 1)
                    obj_player2.y = obj_player1.y
                if (obj_player1.spotlight == 0)
                    obj_player1.y = obj_player2.y
                obj_player1.sprite_index = obj_player1.spr_downpizzabox
                obj_player1.image_index = 0
                obj_player1.state = (86 << 0)
                obj_player2.sprite_index = obj_player2.spr_downpizzabox
                obj_player2.image_index = 0
                obj_player2.state = (86 << 0)
            }
            else
            {
                sprite_index = spr_downpizzabox
                image_index = 0
                state = (86 << 0)
            }
        }
    }
    if (other.image_yscale == -1)
    {
        if (((key_up && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 10), other.id) && (state == (0 << 0) || state == (38 << 0) || state == (66 << 0) || state == (77 << 0) || state == (78 << 0) || state == (92 << 0) || state == (73 << 0))) || ((state == (71 << 0) || state == (94 << 0)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 1), other.id))) && (!instance_exists(obj_fadeout)) && state != (86 << 0) && state != (69 << 0) && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
        {
            scr_soundeffect(sfx_box)
            other.depth = -10
            obj_player1.box = 1
            obj_player2.box = 1
            other.depth = -8
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            y = (other.y + 24)
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            if (global.coop == 1)
            {
                obj_player1.x = other.x
                obj_player2.x = other.x
                if (obj_player1.spotlight == 1)
                    obj_player2.y = obj_player1.y
                if (obj_player1.spotlight == 0)
                    obj_player1.y = obj_player2.y
                obj_player1.sprite_index = obj_player1.spr_uppizzabox
                obj_player1.image_index = 0
                obj_player1.state = (86 << 0)
                obj_player2.sprite_index = obj_player2.spr_uppizzabox
                obj_player2.image_index = 0
                obj_player2.state = (86 << 0)
            }
            else
            {
                sprite_index = spr_uppizzabox
                image_index = 0
                state = (86 << 0)
            }
        }
    }
}
if (place_meeting(x, (y + 1), obj_doorA) || place_meeting(x, (y - 1), obj_doorA))
    targetDoor = "A"
if (place_meeting(x, (y + 1), obj_doorB) || place_meeting(x, (y - 1), obj_doorB))
    targetDoor = "B"
if (place_meeting(x, (y + 1), obj_doorC) || place_meeting(x, (y - 1), obj_doorC))
    targetDoor = "C"
if (place_meeting(x, (y + 1), obj_doorD) || place_meeting(x, (y - 1), obj_doorD))
    targetDoor = "D"
if (place_meeting(x, (y + 1), obj_doorE) || place_meeting(x, (y - 1), obj_doorE))
    targetDoor = "E"
