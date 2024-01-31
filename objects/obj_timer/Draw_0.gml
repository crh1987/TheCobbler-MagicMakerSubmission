draw_set_color(c_white)
str = string("Best Time: ") + string(best)
str2 = string("Elapsed Time: ") + string(global.timer)
if room !=room_init and room != room_tutorial and room!= room_boss and room!=room_chooselevel{
	draw_text(700,0,str2)
	draw_text(850,0,str)
}


if room == room_chooselevel{
	if !audio_is_playing(titlemusic){
		audio_play_sound(titlemusic,0,true)
	}
	for (var i = 0; i < 7; i++){
		if besttimes[i] != 100{
			draw_text(30 + 140*i , 340, "Best: " + string(besttimes[i]))
		}else{
			draw_text(30 + 140*i , 340, "Best: " + string("--.--"))
		}
	}	
}

if room == room_boss{
	if instance_exists(obj_henchman){
	draw_set_font(Font12)
	if obj_player.hearts == 0{
		if !audio_is_playing(losemusic){
			audio_stop_all()
			audio_play_sound(losemusic,0,true)
		}

		depth = 0
		draw_sprite(spr_fade, 0, 0, 0)
		d = instance_create_depth(480, 270, -1, obj_deathoptions)
		d.image_index = 0
		obj_henchman.pause = true
		obj_henchman.speed = 0
		if keyboard_check_pressed(ord("R")){
			room_goto(room_chooselevel)
		}
	}
	if obj_henchman.hearts == 0{
		if !audio_is_playing(winloop){
			audio_stop_all()
			audio_play_sound(winloop,0,true)
		}

		depth = 0
		draw_sprite(spr_fade, 0, 0, 0)
		d = instance_create_depth(480, 270, -1, obj_deathoptions)
		d.image_index = 1
		obj_henchman.pause = true
		obj_henchman.speed = 0
		if keyboard_check_pressed(ord("R")){
			room_goto(room_chooselevel)
		}	
	}
	draw_set_font(Font1)
	}
}else{
	losestart = false	
}

if room == room_lvl1{
	depth = -1
	draw_sprite(spr_barrels,1,0,2)
}else{
	depth = 3
}

if clickedboss == true and room == room_chooselevel{
	if image_alpha < 1{
		image_alpha += .1
	}
	draw_sprite(spr_fade, 0, 0, 0)
}
if clickbosstimer>= 60 and room == room_boss{
	if image_alpha > 0{
		image_alpha -= .1	
	}else{
		clickbosstimer = 0	
	}
}

