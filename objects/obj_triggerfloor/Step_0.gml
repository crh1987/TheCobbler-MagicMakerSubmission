/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y-1, obj_player) and generated == 0{
	instance_destroy(obj_textbox)
	instance_create_depth(200, 50,-1,obj_textbox)
	obj_textbox.textnum=1
	global.tutorial = 1
	generated=1
}


