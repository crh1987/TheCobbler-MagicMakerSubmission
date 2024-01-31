/// @description Insert description here
// You can write your code in this editor
if sqrt(((obj_player.x-x) * (obj_player.x-x)) + ((obj_player.y-y) * (obj_player.y-y))) < 15 and light_create == 0
{
	prompt = instance_create_depth(x,prompt_y,1,obj_prompt_e);
	light_create = 1
}
else 
{
	if sqrt(((obj_player.x-x) * (obj_player.x-x)) + ((obj_player.y-y) * (obj_player.y-y))) >= 15
	{
		instance_destroy(prompt)
		light_create = 0
	}
	
}
