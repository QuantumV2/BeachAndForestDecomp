if (hooked == 0)
{
    targetbaddie = other.id
    hooked = 1
    obj_player.state = (15 << 0)
}
x = targetbaddie.x
y = targetbaddie.y
