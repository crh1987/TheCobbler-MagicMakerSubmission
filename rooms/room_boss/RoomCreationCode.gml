with(all){
	visible = true	
}

for(var i = 0; i<obj_player.hearts/2;i++){
		heart = instance_create_depth(25 + 25*i, 495, 1, obj_heart)
		heart.eyed = i
	}
	for(var i = 0; i<obj_henchman.hearts/2; i++){
		heart = instance_create_depth(850 + 25*i, 495, 1, obj_badheart)
		heart.eyed = i
	}
audio_stop_all()
if !audio_is_playing(bossbattle){
	audio_play_sound(bossbattle, 0, true)	
}