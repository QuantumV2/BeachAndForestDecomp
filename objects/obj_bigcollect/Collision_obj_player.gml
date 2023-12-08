if (obj_player1.character == "V")
    global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
with (obj_camera)
    healthshaketime = 60
scr_soundeffect(sfx_collectpizza)
instance_destroy()
if (other.object_index == obj_player1)
    global.collect += 100
else
    global.collectN += 100
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(100)
