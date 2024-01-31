grv = .45; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hsp_walk = 3; //walk speed
vsp_jump = -12; //jump speed
lanterns = 0
madeit = 0
passthrough = false
canshoot = true
shoottimer = 0
hearts = 6
image_speed = 0
pause = false
randomplat2 = noone
randomplat3 = noone
heartflag = false
othershottriggered = 0
shots = 0
bosstimer = 0
inplace = false
started = false
timestart = false
timeswitch = false
reachedbottom = false
curlevel = 0
justhit = false
flag = 0
shootspeed = 10
randomplatcolor = noone
randomplatcolor2 = noone
getrandoms = false
randcol = -1
randcol1 = -1
switchback = 0
invincible = false
retreating = false
flag1 = 0
sprite_index = spr_pointhenchman
depth = 0
global.curcolor = 0
global.moved = false
global.tutorial = 1
global.done = false

/// @description Insert description here
// You can write your code in this editor

reachedbottom = false
flag = 0
timeswitch = false
flag1 = 6
getrandoms = false
canmove = true
//make floors for level
bossFloorsConfiglowest = ds_list_create();
bossFloorsConfiglower = ds_list_create()
bossFloorsConfigupper = ds_list_create()
bossFloorsConfiguppest = ds_list_create()
id1 = instance_create_depth(295, 255, 1, obj_bluefloor)
ds_list_add(bossFloorsConfiguppest, id1)
id2 = instance_create_depth(215, 320, 1, obj_yellowfloor)
ds_list_add(bossFloorsConfigupper, id2)
id3 = instance_create_depth(335, 320, 1, obj_redfloor)
ds_list_add(bossFloorsConfigupper, id3)
id4 = instance_create_depth(135, 385, 1, obj_redfloor)
ds_list_add(bossFloorsConfiglower, id4)
id5 = instance_create_depth(255, 385, 1, obj_bluefloor)
ds_list_add(bossFloorsConfiglower, id5)
id6 = instance_create_depth(375, 385, 1, obj_yellowfloor)
ds_list_add(bossFloorsConfiglower, id6)
id7 = instance_create_depth(55, 450, 1, obj_bluefloor)
ds_list_add(bossFloorsConfiglowest, id7)
id8 = instance_create_depth(195, 450, 1, obj_yellowfloor)
ds_list_add(bossFloorsConfiglowest, id8)
id9 = instance_create_depth(315, 450, 1, obj_redfloor)
ds_list_add(bossFloorsConfiglowest, id9)


boss1 = instance_create_depth(600,410,1,obj_startfloor)
boss1.image_xscale = 5.5
ladder1 = instance_create_depth(725, 410, 1, obj_ladder)
boss2 = instance_create_depth(600,290,1,obj_startfloor)
boss2.image_xscale = 3
ladder2 = instance_create_depth(600, 290, 1, obj_ladder)
boss3 = instance_create_depth(540,170,1,obj_startfloor)
boss3.image_xscale = 1.5




floor1checkpoints = ds_list_create();
for (i = 45; i<=312; i+=89){
	ds_list_add(floor1checkpoints, i+600)	
}

floor2checkpoints = ds_list_create();
for (i = 30; i<=158; i+= 64){
	ds_list_add(floor2checkpoints, i+600)	
}

timestomove = ds_list_create();
for (i = 3; i<=6; i++){
	ds_list_add(timestomove, i*30)	
}

image_speed = .5