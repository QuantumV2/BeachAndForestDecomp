if (obj_player1.character == "V")
    global.playerhealth = clamp((global.playerhealth + 100), 0, 100)
with (obj_camera)
    healthshaketime = 120
scr_soundeffect(sfx_collectgiantpizza)
if (other.object_index == obj_player1)
    global.collect += 1000
else
    global.collectN += 1000
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(1000)
instance_destroy()
