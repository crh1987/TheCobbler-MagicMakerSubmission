/// @description Insert description here
// You can write your code in this editor
if global.curcolor== global.yelloworder or wason == true{
	solid = true	
}else{
	solid = false	
}
if solid == true{
	if place_meeting(x, y+1, obj_player) or place_meeting(x, y-1, obj_player) or place_meeting(x + 1, y, obj_player) or place_meeting(x-1, y, obj_player){
		visible = true
		
		wason = true
	}else{
		if wason == true{
			global.curcolor = global.yellownext
			audio_play_sound(colorwheelmove, 0, false)
			wason = false
		}
	}
}    

if place_meeting(x, y+1, obj_player) or place_meeting(x, y-1, obj_player) or place_meeting(x + 1, y, obj_player) or place_meeting(x-1, y, obj_player){
		visible = true
		if generated == 0{
			instance_destroy(obj_textbox)
			instance_create_depth(200,50, -1,obj_textbox)
			obj_textbox.textnum=2
			generated = 1
			instance_create_depth(211, 418,1, obj_redfloortrigger)
		}
}

