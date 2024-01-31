if place_meeting(x, y-1, obj_player) or place_meeting(x, y+1, obj_player) or place_meeting(x-1, y-1, obj_player) or place_meeting(x+1, y, obj_player){
	visible = true	
}

if collided and wason == false{
	if global.curcolor = global.redorder{
		if generated == 0{
			instance_destroy(obj_textbox)
			instance_create_depth(200, 50, -1, obj_textbox)
			obj_textbox.textnum+=3
			generated+=1
			obj_timer.colorvis = true
		}
		wason = true
		replacewall = instance_create_depth(x,y, 100, obj_replacefloor).id
		replacewall.image_xscale = image_xscale
		replacewall.image_yscale = image_yscale
		global.curcolor = global.rednext
		audio_play_sound(colorwheelmove, 0, false)
	}
}

if wason == true and !place_meeting(x, y-1, obj_player) and !place_meeting(x, y+1, obj_player) and !place_meeting(x+1, y, obj_player) and !place_meeting(x-1, y, obj_player){
	instance_destroy(replacewall)
	wason = false
	collided = false
}
