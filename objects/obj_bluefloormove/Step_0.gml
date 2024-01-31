/// @description Insert description here
// You can write your code in this editor
if image_index >=3{
	image_index = 3
	image_speed = 0
}

if x<=430{
	hspeed = 3	
	
}else if x>=525{
	hspeed = -3
	
}




if count != -1 and count<=2{
	count+=.1	
}
if place_meeting(x, y, obj_player){
	visible = true	
}

if collided and wason == false{
	if global.curcolor == global.blueorder{
		visible = true
		wason = true
		count = 0
		if switchback>=300{
			replacevar = true	
		}
		replacewall = instance_create_depth(x,y, 10, obj_replacefloor).id
		replacewall.image_xscale = image_xscale
		replacewall.image_yscale = image_yscale
		replacewall.image_angle = image_angle
		global.curcolor = global.bluenext
		audio_play_sound(colorwheelmove, 0, false)
	}
}

if wason == true and !place_meeting(x, y-1, obj_player) and !place_meeting(x+1, y, obj_player) and !place_meeting(x-1, y, obj_player) and count> 2 {
	instance_destroy(replacewall)
	wason = false
	collided = false
	count = -1
}
if previouscolor != noone{
	switchback+=1
	if switchback == 300{
		mask_index = spr_nocollide
		
		inst2 = instance_create_depth(x,y,3, previouscolor)
		inst2.image_index = 3
		inst2.image_speed = 0
		image_speed = -.1
		inst2.visible = true
		ds_list_replace(layerlist, idx, inst2)
		
	}
	if image_index>=0 and image_index <1 and switchback > 300{
		inst1 = instance_place(x,y,obj_replacefloor)
		
		if inst1!=noone and replacevar = false{
			instance_destroy(inst1)
		}
		instance_destroy()	
	}
}

if place_meeting(x,y,obj_player) and instance_exists(replacewall){
	instance_destroy(replacewall)	
}