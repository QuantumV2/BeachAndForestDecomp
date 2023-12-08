if (state == (69 << 0) && global.coop == 1 && (!(place_meeting(x, y, obj_exitgate))))
{
    if (object_index == obj_player1 && obj_player1.spotlight == 0)
        visible = false
    if (object_index == obj_player2 && obj_player1.spotlight == 1)
        visible = false
}
if (global.coop == 1)
    scr_changetoppings()
if (state == (54 << 0))
    state = (0 << 0)
if (object_index != obj_player2 || global.coop == 1)
{
    if (targetDoor == "A" && instance_exists(obj_doorA))
    {
        if (hallway == 1)
            x = (obj_doorA.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorA.x + 32)
        else
            x = (obj_doorA.x + 16)
        y = (obj_doorA.y - 14)
    }
    if (targetDoor == "B" && instance_exists(obj_doorB))
    {
        if (hallway == 1)
            x = (obj_doorB.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorB.x + 32)
        else
            x = (obj_doorB.x + 16)
        y = (obj_doorB.y - 14)
    }
    if (targetDoor == "C" && instance_exists(obj_doorC))
    {
        if (hallway == 1)
            x = (obj_doorC.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorC.x + 32)
        else
            x = (obj_doorC.x + 16)
        y = (obj_doorC.y - 14)
    }
    if (targetDoor == "D" && instance_exists(obj_doorD))
    {
        if (hallway == 1)
            x = (obj_doorD.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorD.x + 32)
        else
            x = (obj_doorD.x + 16)
        y = (obj_doorD.y - 14)
    }
    if (targetDoor == "E" && instance_exists(obj_doorE))
    {
        if (hallway == 1)
            x = (obj_doorE.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_doorE.x + 32)
        else
            x = (obj_doorE.x + 16)
        y = (obj_doorE.y - 14)
    }
    if (targetDoor == "CH" && instance_exists(obj_checkpoint))
    {
        if (hallway == 1)
            x = (obj_checkpoint.x + (hallwaydirection * 100))
        else if (box == 1)
            x = (obj_checkpoint.x + 32)
        else
            x = obj_checkpoint.x
        y = (obj_checkpoint.y - 50)
    }
}
hallway = 0
box = 0
if (global.shroomfollow == 1)
    instance_create(x, y, obj_pizzakinshroom)
if (global.cheesefollow == 1)
    instance_create(x, y, obj_pizzakincheese)
if (global.tomatofollow == 1)
    instance_create(x, y, obj_pizzakintomato)
if (global.sausagefollow == 1)
    instance_create(x, y, obj_pizzakinsausage)
if (global.pineapplefollow == 1)
    instance_create(x, y, obj_pizzakinpineapple)
roomstartx = x
roomstarty = y
