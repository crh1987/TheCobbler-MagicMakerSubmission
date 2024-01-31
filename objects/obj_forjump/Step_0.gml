/// @description Insert description here
// You can write your code in this editor

x = obj_player.x
y = obj_player.y
visible = false
if place_meeting(x,y+1,obj_startfloor) or place_meeting(x,y+1,obj_redfloor) or place_meeting(x,y+1,obj_bluefloor) or place_meeting(x,y+1,obj_yellowfloor) 
{
	jumpcollision = true
}else{
	jumpcollision = false	
}
