/// @description Insert description here
// You can write your code in this editor

instance_destroy()
with (obj_player){
	if hearts>0{
		hearts -=1
		audio_play_sound(playerhit, 0, false)
	}
}


