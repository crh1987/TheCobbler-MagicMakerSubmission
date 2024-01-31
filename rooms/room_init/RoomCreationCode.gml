//room_goto(room_chooselevel)
window_set_fullscreen(true)
global.timer = 0
global.moved = 0
draw_set_font(Font1)
// Generate a random seed value between 0 and 65535
audio_play_sound(titlemusic, 1, true)

// Seed the random number generator with the random seed value
randomize();