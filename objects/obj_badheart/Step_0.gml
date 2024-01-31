/// @description Insert description here
// You can write your code in this editor


if obj_henchman.hearts == 5{
	if eyed = 2{
		image_index = 1	
	}
}
if obj_henchman.hearts == 4{
	if eyed = 2{
		instance_destroy()
	}
}
if obj_henchman.hearts == 3{
	if eyed = 1{
		image_index = 1	
	}
}
if obj_henchman.hearts == 2{
	if eyed = 1{
		instance_destroy()
	}
}
if obj_henchman.hearts == 1{
	if eyed = 0{
		image_index = 1	
	}
}
if obj_henchman.hearts == 0{
	if eyed = 0{
		instance_destroy()
	}
}

if image_index == 7{
	image_speed = 0
	instance_destroy()	
	
}


