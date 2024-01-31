if room != roomlast{
	if room == room_chooselevel and roomlast == room_boss and clickedboss = true{
		audio_stop_all()
		room_restart()	
	clickedboss = false
	}
	roomlast = room
}

if global.moved == true and global.done == false and room != room_boss{
	global.timer+=(1/30)
}
if global.done == true{
	if best == "N/A" or global.timer<best{
		best = global.timer	
		if room == room_lvl1{
			if best < besttimes[0] besttimes[0] = best	
		}
		if room == room_lvl2{
			if best < besttimes[1] besttimes[1] = best	
		}
		if room == room_lvl3{
			if best < besttimes[2] besttimes[2] = best	
		}
		if room == room_lvl4{
			if best < besttimes[5]{
				besttimes[5] = best
			}
		}
		if room == room_lvl5{
			if best < besttimes[6] besttimes[6] = best	
		}
		if room == room_lvl6{
			if best < besttimes[3] besttimes[3] = best
		}
		if room == room_lvl7{
			if best < besttimes[4] besttimes[4] = best
		}
	}
	global.done = false
}
if room_get_name(room) != curroom {
	best = "N/A"
	global.timer = 0
	curroom = room_get_name(room)
}

if room == room_chooselevel{
	levelselectheader = true	
}else{
	levelselectheader = false	
}
if room == room_init and (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_anykey)) {
	room_goto(room_chooselevel)	
}
if collision_point(mouse_x, mouse_y, obj_lvl1but, false, false) and mouse_check_button_pressed(mb_left){
	audio_play_sound(blipselect,0, false)
	room_goto(room_lvl1)
		
}

if collision_point(mouse_x, mouse_y, obj_lvl2but, false, false) and mouse_check_button_pressed(mb_left){
	audio_play_sound(blipselect,0, false)	
	room_goto(room_lvl2)
	
}

if collision_point(mouse_x, mouse_y, obj_lvl3but, false, false) and mouse_check_button_pressed(mb_left){
	audio_play_sound(blipselect,0, false)
	room_goto(room_lvl3)	
		
}

if collision_point(mouse_x, mouse_y, obj_lvl4but, false, false) and mouse_check_button_pressed(mb_left){
	audio_play_sound(blipselect,0, false)
	room_goto(room_lvl6)
		
}
if collision_point(mouse_x, mouse_y, obj_lvl5but, false, false) and mouse_check_button_pressed(mb_left){
	audio_play_sound(blipselect,0, false)
	room_goto(room_lvl7)
		
}
if collision_point(mouse_x, mouse_y, obj_lvl6but, false, false) and mouse_check_button_pressed(mb_left){
	audio_play_sound(blipselect,0, false)
	room_goto(room_lvl4)
		
}
if collision_point(mouse_x, mouse_y, obj_lvl7but, false, false) and mouse_check_button_pressed(mb_left){
	audio_play_sound(blipselect,0, false)
	room_goto(room_lvl5)
		
}
if clickedboss == false and collision_point(mouse_x, mouse_y, obj_boss1button, false, false) and mouse_check_button_pressed(mb_left){
	audio_sound_gain(titlemusic, 0, 100);
	audio_play_sound(clickboss,0, false)
	clickedboss = true
	image_alpha = 0
	clickbosstimer = 0
	with obj_boss1button{
		move_towards_point(x, 270, 10)
	}

}

if clickedboss == true and room == room_chooselevel{
	if clickbosstimer < 60{
		clickbosstimer += 1	
	}
	obj_boss1button.image_index = 1	
}

if clickbosstimer >= 60 and room == room_chooselevel{
	room_goto(room_boss)
}


if room == room_init and (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_anykey)){
	audio_play_sound(blipselect,0, false)	
}

