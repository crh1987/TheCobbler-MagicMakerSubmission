//Movement Variables
grv = .45; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hsp_walk = 3; //walk speed
vsp_jump = -8; //jump speed

//Health
hearts = 8
lasthearts = hearts 

//Shooting
switchthrow = false
shotcooldown = 30
shootstrength = 0
shootdrawdex = -1

//Platforms
canmove = true
wason = false
global.curcolor = 0
global.moved = false
global.done = false
jumpcollision = false
whichwall = noone

//Prompts
drawprompt2 = false

//Spotlight
moveback = false

//Animation
sprlast = noone
animateendcount = 0
image_speed = 0

//Light Beam
drawbeam = 0
beamangle = 0
xlen = 0
ylen = 0

//Lanterns
lanterns = 0

//aurasize
aurasize = 30

//starting place
startx = x
starty = y


//Collisions
instance_create_depth(x,y,1,obj_forarrows)
instance_create_depth(x,y,1,obj_forjump)
pressedx = false

//Stop title music and create the colorwheel
audio_stop_sound(titlemusic)
instance_create_depth(480,45,0,obj_colorwheel)

//Configure color wheel based on the room
if room == room_lvl1 or room == room_lvl2 or room==room_test{
	obj_colorwheel.image_angle = 270
	obj_colorwheel.lastangle = 270
	obj_colorwheel.lastangle2 = 0
}
if room == room_lvl3{
	obj_colorwheel.image_angle = 90
	obj_colorwheel.lastangle = 90
	obj_colorwheel.lastangle2 = 0
}
if room == room_lvl4 or room == room_boss{
	obj_colorwheel.image_angle =  0
	obj_colorwheel.lastangle = 0
	obj_colorwheel.lastangle2 = 0
	obj_colorwheel.lastangle3 = 0
}