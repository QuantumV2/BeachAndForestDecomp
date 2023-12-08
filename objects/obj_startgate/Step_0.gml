targetDoor = "A"
if (place_meeting(x, y, obj_player) && drawing == 0)
{
    ini_open("saveData.ini")
    drawing = 1
}
if ((!(place_meeting(x, y, obj_player))) && drawing == 1)
{
    ini_close()
    drawing = 0
}
if place_meeting(x, y, obj_player1)
    image_speed = 0.35
else
{
    image_speed = 0
    image_index = 0
}
if (distance_to_object(obj_player) < 50)
{
    switch level
    {
        case "medieval":
            with (obj_tv)
            {
                message = "PIZZASCAPE"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "chateau":
            with (obj_tv)
            {
                message = "PIZZASCARE"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "ruin":
            with (obj_tv)
            {
                message = "THE ANCIENT CHEESE"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "dungeon":
            with (obj_tv)
            {
                message = "BLOODSAUCE DUNGEON"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "floorroom":
            with (obj_tv)
            {
                message = "OREGANO DESERT"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "graveyard":
            with (obj_tv)
            {
                message = "THE WASTEYARD"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "farm":
            with (obj_tv)
            {
                message = "FUN FARM"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "ufo":
            with (obj_tv)
            {
                message = "SPACE PINBALL"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "entrance":
            with (obj_tv)
            {
                message = "ENTRANCE"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "strongcold":
            with (obj_tv)
            {
                message = "STRONGCOLD"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "forest":
            with (obj_tv)
            {
                message = "GNOME FOREST"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "beach":
            with (obj_tv)
            {
                message = "PINEAPPLE BEACH"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "dragonlair":
            with (obj_tv)
            {
                message = "DRAGON LAIR"
                showtext = 1
                alarm[0] = 2
            }
            break
        case "snickchallenge":
            with (obj_tv)
            {
                message = "SNICK CHALLENGE"
                showtext = 1
                alarm[0] = 2
            }
            break
    }

}
