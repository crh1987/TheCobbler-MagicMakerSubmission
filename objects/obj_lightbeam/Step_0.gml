/// @description Insert description here
// You can write your code in this editor


image_angle = obj_spotlight.image_angle
if place_meeting(x, y, obj_redfloor) and newfloor = noone{
	oldfloor = instance_place(x,y,obj_redfloor)
	newfloor = instance_create_depth(oldfloor.x,oldfloor.y, 1,obj_bluefloor)
	newfloor.visible = true
	instance_destroy(oldfloor)
}

if newfloor != noone and !place_meeting(x,y,newfloor){
	d = instance_create_depth(newfloor.x,newfloor.y,1,obj_redfloor)
	d.visible = true
	instance_destroy(newfloor)
	newfloor = noone
	oldfloor = noone
}

