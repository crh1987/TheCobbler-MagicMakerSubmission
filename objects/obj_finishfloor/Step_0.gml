/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y-1, obj_player){
	global.done = true	
	
	if generated == 0{
			leveltime = global.timer
			audio_play_sound(finishlevel, 0, false)
			instance_destroy(obj_textbox)
			instance_create_depth(700,50, -1,obj_textbox)
			obj_textbox.textnum=4
			generated = 1
		}
	/*
	if room== room_tutorial{
		room_goto(room_lvl2)	
	}else if room == room_lvl2{
		room_goto(room_lvl3)	
	}else if room == room_lvl3{
		room_goto(room_lvl4)	
	}else if room == room_lvl4{
		room_goto(room_lvl6)	
	}
	*/
}
if generated == 1{
	if keyboard_check_pressed(vk_enter){
		global.done = false
		global.timer = 0
		global.moved = false
		audio_stop_all()
		room_restart()
		generated = 0	
	}
	
}

if room == room_lvl1{
	sprite_index = spr_finishfloor	
}else{
	sprite_index = spr_floor
}



