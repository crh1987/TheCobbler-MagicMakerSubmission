window_set_fullscreen(true)
if !audio_is_playing(cavesounds){
	audio_play_sound(cavesounds, 0, true)
}
if !audio_is_playing(generallevelmusic){
	audio_play_sound(generallevelmusic, 0, true)
}