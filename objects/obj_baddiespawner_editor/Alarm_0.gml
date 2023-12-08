switch image_index
{
    case 0:
        contentEditor = obj_pizzagoblin
        break
    case 1:
        contentEditor = obj_pizzagoblinbomb
        break
    case 2:
        contentEditor = obj_pepgoblin
        break
    case 3:
        contentEditor = obj_pizzard
        break
    case 4:
        contentEditor = obj_swedishmonkey
        break
    case 5:
        contentEditor = obj_weeniesquire
        break
    case 6:
        contentEditor = obj_weeniemount
        break
}

with (instance_create_layer(x, y, "Level_structure", obj_baddiespawner))
    content = other.contentEditor
