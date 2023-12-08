scr_initinput()
global.saveroom = ds_list_create()
grav = 0.5
hsp = 0
vsp = 0
global.playerhealth = 100
xscale = 1
yscale = 1
facehurt = 0
steppy = 0
depth = -7
movespeed = 19
jumpstop = 0
visible = true
state = (14 << 0)
jumpAnim = 1
landAnim = 0
machslideAnim = 0
moveAnim = 1
stopAnim = 1
crouchslideAnim = 1
crouchAnim = 1
machhitAnim = 0
stompAnim = 0
inv_frames = 0
hurted = 0
autodash = 0
mach2 = 0
parry = 0
parry_inst = -4
taunt_to_parry_max = 10
parry_count = 0
parry_max = 8
input_buffer_jump = 8
input_buffer_secondjump = 8
input_buffer_highjump = 8
player_x = x
player_y = y
targetRoom = Realtitlescreen
targetDoor = "A"
flash = 0
global.key_inv = 0
global.shroomfollow = 0
global.cheesefollow = 0
global.tomatofollow = 0
global.sausagefollow = 0
global.pineapplefollow = 0
global.keyget = 0
global.collect = 0
global.collectN = 0
global.treasure = 0
global.combo = 0
global.combotime = 0
global.pizzacoin = 0
global.toppintotal = 1
global.hit = 0
global.baddieroom = ds_list_create()
global.old_baddieroom = ds_list_create()
global.old_saveroom = ds_list_create()
global.checkpointDoor = "A"
global.checkpointroom = hub_room1
global.checkpointCollect = 0
global.checkpointCollectN = 0
global.hp = 8
global.checkpoint_hp = 0
global.checkpoint_shroomfollow = 0
global.checkpoint_cheesefollow = 0
global.checkpoint_tomatofollow = 0
global.checkpoint_pineapplefollow = 0
global.checkpoint_sausagefollow = 0
global.checkpoint_key_inv = 0
global.checkpoint_pizzasdelivered = 0
global.checkpoint_gnomecheck0 = 0
global.checkpoint_gnomecheck1 = 0
global.checkpoint_gnomecheck2 = 0
global.checkpoint_gnomecheck3 = 0
global.checkpoint_gnomecheck4 = 0
global.gotshotgun = 0
global.showgnomelist = 1
key_particles = 0
barrel = 0
bounce = 0
a = 0
idle = 0
attacking = 0
slamming = 0
superslam = 0
grounded = 1
grinding = 0
machpunchAnim = 0
punch = 0
machfreefall = 0
shoot = 1
instakillmove = 0
windingAnim = 0
facestompAnim = 0
ladderbuffer = 0
toomuchalarm1 = 0
toomuchalarm2 = 0
idleanim = 0
momemtum = 0
cutscene = 0
grabbing = 0
dir = xscale
shotgunAnim = 0
goingdownslope = 0
goingupslope = 0
fallinganimation = 0
bombpeptimer = 100
suplexmove = 0
suplexhavetomash = 0
anger = 0
angry = 0
baddiegrabbedID = obj_slope
spr_palette = spr_peppalette
character = "P"
scr_characterspr()
paletteselect = 1
global.panic = 0
global.snickchallenge = 0
colorchange = 0
treasure_x = 0
treasure_y = 0
treasure_room = 0
wallspeed = 0
tauntstoredstate = (0 << 0)
tauntstoredmovespeed = 6
tauntstoredsprite = spr_player_idle
taunttimer = 20
global.golfhit = 0
ini_open("saveData.ini")
global.option_fullscreen = ini_read_real("Option", "fullscreen", 1)
global.option_resolution = ini_read_real("Option", "resolution", 1)
ini_close()
if (global.option_fullscreen == 0)
    window_set_fullscreen(true)
if (global.option_fullscreen == 1)
    window_set_fullscreen(false)
if (global.option_resolution == 0)
    window_set_size(480, 270)
if (global.option_resolution == 1)
    window_set_size(960, 540)
if (global.option_resolution == 2)
    window_set_size(1920, 1080)
backtohubstartx = x
backtohubstarty = y
backtohubroom = Realtitlescreen
global.style = 0
slapcharge = 0
slaphand = 1
slapbuffer = 8
slapflash = 0
freefallsmash = 0
costumercutscenetimer = 0
heavy = 0
lastroom_x = 0
lastroom_y = 0
lastroom = Realtitlescreen
hallway = 0
hallwaydirection = 0
box = 0
roomstartx = 0
roomstarty = 0
global.secretfound = 0
global.shotgunammo = 0
swingdingbuffer = 0
lastmove = 0
backupweapon = 0
ini_open("saveData.ini")
if (!ini_section_exists("SAGE2019"))
{
    ini_write_string("SAGE2019", "shotgunsnick", 0)
    ini_write_string("SAGE2019", "dungeonbackup", 0)
    ini_write_string("SAGE2019", "srank", 0)
    ini_write_string("SAGE2019", "snicksrank", 0)
    ini_write_string("SAGE2019", "combo10", 0)
    ini_write_string("SAGE2019", "secret", 0)
    ini_write_string("SAGE2019", "knight", 0)
    ini_write_string("SAGE2019", "toppin", 0)
    ini_write_string("SAGE2019", "treasure", 0)
}
global.SAGEshotgunsnick = ini_read_string("SAGE2019", "shotgunsnick", 0)
global.SAGEshotgunsnicknumber = 0
global.SAGEdungeonbackup = ini_read_string("SAGE2019", "dungeonbackup", 0)
global.SAGEsrank = ini_read_string("SAGE2019", "srank", 0)
global.SAGEsnicksrank = ini_read_string("SAGE2019", "snicksrank", 0)
global.SAGEcombo10 = ini_read_string("SAGE2019", "combo10", 0)
global.SAGEsecret = ini_read_string("SAGE2019", "secret", 0)
global.SAGEknight = ini_read_string("SAGE2019", "knight", 0)
global.SAGEknighttaken = 0
global.SAGEtoppin = ini_read_string("SAGE2019", "toppin", 0)
global.SAGEtreasure = ini_read_string("SAGE2019", "treasure", 0)
ini_close()
stickpressed = 0
spotlight = 1
macheffect = 0
chargeeffectid = obj_null
dashcloudid = obj_null
crazyruneffectid = obj_null
fightball = 0
superslameffectid = obj_null
speedlineseffectid = obj_null
angryeffectid = obj_null
global.coop = 0
thrown = 0
mach1snd = -1
mach2snd = -1
mach3snd = -1
knightslide = -1
bombpep1snd = -1
mach4snd = -1
tumble2snd = -1
tumble1snd = -1
tumble3snd = -1
superjumpholdsnd = -1
superjumpprepsnd = -1
suplexdashsnd = -1
pogospeed = 2
pogocharge = 100
pogochargeactive = 0
wallclingcooldown = 10
bombcharge = 0
flashflicker = 0
flashflickertime = 0
kickbomb = 0
doublejump = 0
pogospeedprev = 0
fightballadvantage = 0
coopdelay = 0
supercharged = 0
superchargedeffectid = obj_null
pizzashield = 0
pizzashieldid = obj_null
pizzapepper = 0
transformation[0] = (34 << 0)
transformation[1] = (31 << 0)
transformation[2] = (25 << 0)
transformation[3] = (22 << 0)
transformation[4] = (17 << 0)
transformation[5] = (19 << 0)
transformation[6] = (20 << 0)
transformation[7] = (10 << 0)
transformation[8] = (9 << 0)
transformation[9] = (5 << 0)
transformation[10] = (39 << 0)
transformation[11] = (21 << 0)
transformation[12] = (63 << 0)
transformation[13] = (86 << 0)
transformation[14] = (13 << 0)
transformation[15] = (11 << 0)
global.giantkey = 0
c = 0
global.baddiespeed = 1
global.baddiepowerup = 0
global.baddierage = 0
global.style = 0
global.stylethreshold = 0
global.pizzadelivery = 0
global.failcutscene = 0
global.pizzasdelivered = 0
revolverbuffer = 0
breakdance = 50
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", 1, 0)
