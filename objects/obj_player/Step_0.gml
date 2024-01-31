//Get Inputs
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up);
key_restart = keyboard_check_pressed(vk_enter);
key_shoot = keyboard_check_pressed(ord("X"));

//If restart is chosen reset variables and restart the level
if key_restart{
	global.done = false
	global.timer = 0
	global.moved = false
	audio_stop_all()
	room_restart()
	generated = 0	
}

//If return is chosen return to the choose level screen
if keyboard_check_pressed(ord("R")){
	room_goto(room_chooselevel)	
}

//Notify game that player has started playing
if key_right or key_left or key_jump{
	global.moved = true	
}

if hearts=0 canmove = false //if dead, can't move anymore

if room == room_boss and obj_henchman.hearts == 0{
	canmove = false	
}

//If canmove allow player input
if canmove{

	//Work out where to move horizontally
	hsp = (key_right - key_left) * hsp_walk;

	//Handle moving platform
	if place_meeting(x, y+1, obj_bluefloormove){
	
		hspeed = obj_bluefloormove.hspeed	
		wason = true
	}else{
		if wason == true{
			if obj_bluefloormove.hspeed = 3{
				hspeed -=3	
			}else{
				hspeed +=3	
			}
			wason = false
		}
	}

	//Work out where to move vertically
	vsp = vsp + grv;

	//If player got hurt
	if lasthearts!= hearts{
		if sprlast = noone{
			sprlast = sprite_index	
		}
		//For 15 frames show hurt animation
		if animateendcount<15{
			animateendcount+=1
			if sprlast == spr_walkright or sprlast == spr_idleright or sprlast == spr_jumpright{
				sprite_index = spr_hurtright
			}if sprlast == spr_walkleft or sprlast == spr_idleleft or sprlast == spr_jumpleft{
				sprite_index = spr_hurtleft
			}
		}else{
			lasthearts = hearts
			animateendcount = 0
			sprite_index = sprlast
			sprlast = noone
		}
	}

	//Hnadle animation on jump
	if sprite_index == spr_jumpright or sprite_index == spr_jumpleft{
		image_speed = 0
		if vsp>0 and image_index = 0{
			image_index = 1	
		}
	}else{
		image_speed = 1.5
	}
	//Handle Jumps
	whichwall = noone
	if obj_forjump.jumpcollision == true
	{
		with(obj_forjump){
			whichwall = noone
			whichwall = instance_place(x, y+1, obj_startfloor)
			obj_player.wallsolid = true
			if whichwall == noone{
				whichwall = instance_place(x, y+1, obj_redfloor)
				if global.curcolor == global.redorder obj_player.wallsolid = true
				else obj_player.wallsolid = false
			}
			if whichwall == noone{
				whichwall = instance_place(x, y+1, obj_yellowfloor)	
				if global.curcolor == global.yelloworder obj_player.wallsolid = true
				else obj_player.wallsolid = false
			}
			if whichwall == noone{
				whichwall = instance_place(x, y+1, obj_bluefloor)	
				if global.curcolor == global.blueorder obj_player.wallsolid = true
				else obj_player.wallsolid = false
			}
			obj_player.whichwall = whichwall
		}
		if whichwall != noone{
			if wallsolid == true{
				if key_jump{
					audio_play_sound(jump, 0, false)
					image_speed = 0
					image_index = 0
					vsp = vsp_jump; 
					if sprite_index == spr_idleright or sprite_index == spr_walkright{
						sprite_index = spr_jumpright
					}else if sprite_index == spr_idleleft or sprite_index == spr_walkleft{
						sprite_index = spr_jumpleft	
					}
				}else{
					if key_right{
						sprite_index = spr_walkright	
					}else if key_left{
						sprite_index = spr_walkleft	
					}else if hsp == 0{
						if sprite_index = spr_walkright{
							sprite_index = spr_idleright	
						}else if sprite_index = spr_walkleft{
							sprite_index = spr_idleleft	
						}
					}
				}
			}
		}	
	
	} else{
			if hsp>0 and sprite_index != spr_jumpright{
				sprite_index = spr_jumpright
				speed = 0
			}else if hsp<0 and sprite_index != spr_jumpleft{
				sprite_index = spr_jumpleft	
				speed = 0
			}else{
				if sprite_index = spr_idleright or sprite_index = spr_walkright and sprite_index != spr_jumpright{
					sprite_index = spr_jumpright	
					speed = 0
				}else if sprite_index = spr_idleleft or sprite_index = spr_walkleft and sprite_index != spr_jumpleft{
					sprite_index = spr_jumpleft	
					speed = 0
				}
			}
	}



	//Check for horizontal collisions and then move if we can
	onepixelh = sign(hsp) //moving left or right? right = 1, left = -1.
	onepixelv = sign(vsp)

	//hCollisions for white floor
	if place_meeting(x+hsp,y,obj_startfloor){
		while (!place_meeting(x+onepixelh, y, obj_startfloor))
		{
			x += onepixelh;
		}
		hsp = 0
	}
	//hCollisions for red floor
	if global.curcolor == global.redorder{
		if place_meeting(x+hsp,y,obj_redfloor) and hsp != 0{
			while (!place_meeting(x+onepixelh, y, obj_redfloor))
			{
				x += onepixelh;
			}
			hsp = 0
			w = instance_place(x+onepixelh, y, obj_redfloor)
			w.collided = true
		}	
	}
	//hCollisions for yellowfloor
	if global.curcolor == global.yelloworder{
		if place_meeting(x+hsp,y,obj_yellowfloor) and hsp != 0{
			while (!place_meeting(x+onepixelh, y, obj_yellowfloor))
			{
				x += onepixelh;
			}
			hsp = 0
			w = instance_place(x+onepixelh, y, obj_yellowfloor)
			w.collided = true
		}	
	}
	//hCollisions for blueorder
	if global.curcolor == global.blueorder{
		if place_meeting(x+hsp,y,obj_bluefloor) and hsp != 0{
			while (!place_meeting(x+onepixelh, y, obj_bluefloor))
			{
				x += onepixelh;
			}
			hsp = 0
			w = instance_place(x+onepixelh, y, obj_bluefloor)
			w.collided = true
		}	
	}	

	x+=hsp

	//Level1 ladder
	if room == room_lvl1 and place_meeting(x, y, obj_ladder){
		if keyboard_check(vk_up) or keyboard_check(ord("W")){
			x = 24
			vsp = -3
		}else if keyboard_check(vk_down) or keyboard_check(ord("S")) {
			x = 24
			vsp = 3	
		}
	}else{
		grv  = .45	
	}


	//vCollisions for white floor
	if place_meeting(x, y + vsp, obj_startfloor)
	{
		while (!place_meeting(x, y + onepixelv, obj_startfloor))
		{
			y += onepixelv;
		}
		vsp = 0
		if (sprite_index == spr_jumpright)
		{
			sprite_index = spr_idleright
		}
		else if (sprite_index == spr_jumpleft)
		{
			sprite_index = spr_idleleft
		}
	} 
	//vCollisions for red floor
	if global.curcolor == global.redorder{
		if place_meeting(x, y + vsp, obj_redfloor) and vsp != 0
		{
			while (!place_meeting(x, y + onepixelv, obj_redfloor))
			{
				y += onepixelv;
			}
			vsp = 0
			w = instance_place(x, y + onepixelv, obj_redfloor)
			w.collided = true
			if (sprite_index == spr_jumpright)
			{
				sprite_index = spr_idleright
			}
			else if (sprite_index == spr_jumpleft)
			{
				sprite_index = spr_idleleft
			}
		} 
	}
	//vCollisions for yellow floor
	if global.curcolor == global.yelloworder{
		if place_meeting(x, y + vsp, obj_yellowfloor) and vsp != 0
		{
			while (!place_meeting(x, y + onepixelv, obj_yellowfloor))
			{
				y += onepixelv;
			}
			vsp = 0
			w = instance_place(x, y + onepixelv, obj_yellowfloor)
			w.collided = true
			if (sprite_index == spr_jumpright)
			{
				sprite_index = spr_idleright
			}
			else if (sprite_index == spr_jumpleft)
			{
				sprite_index = spr_idleleft
			}
		} 
	}	
	//vCollisions for blue floor
	if global.curcolor == global.blueorder{
		if place_meeting(x, y + vsp, obj_bluefloor) and vsp != 0
		{
			while (!place_meeting(x, y + onepixelv, obj_bluefloor))
			{
				y += onepixelv;
			}
			vsp = 0
			w = instance_place(x, y + onepixelv, obj_bluefloor)
			w.collided = true
			if (sprite_index == spr_jumpright)
			{
				sprite_index = spr_idleright
			}
			else if (sprite_index == spr_jumpleft)
			{
				sprite_index = spr_idleleft
			}
		} 
	}	
	y+=vsp

	//lantern mechanics
	if place_meeting(x,y,obj_promptlantern){
		drawprompt = true	
	}else{
		drawprompt = false	
	}


	if keyboard_check_pressed(ord("C")){
		if lanterns<=1 and room == room_lvl7 {
			if sprite_index == spr_idleright or sprite_index == spr_walkright or sprite_index == spr_jumpright{
				if !place_meeting(x+15, y-10, obj_lantern){
					instance_create_depth(x + 15, y - 10, 0, obj_lantern)
					lanterns++
				}
			}else{
				if !place_meeting(x-15, y-10, obj_lantern){
					instance_create_depth(x - 15, y - 10, 0, obj_lantern)
					lanterns++
				}
			}
		
		}
	}




	//spotlight mechanics
	if place_meeting(x,y,obj_spotlight){
		drawprompt2 = true	
		if keyboard_check(ord("Z")){
			if obj_spotlight.image_angle == 50{
				moveback = true	
			}
			if moveback == true{
				obj_spotlight.image_angle -=5	
			}
			if obj_spotlight.image_angle == -50{
				moveback = false	
			}
			if moveback == false{
				obj_spotlight.image_angle += 5	
			}
		}
	}else{
		drawprompt2 = false	
	}

}

//Make the player press x before moving in the boss level
if room == room_boss and pressedx = false{
	canmove = false
	if sprite_index != spr_throwright and sprite_index!=spr_throwleft{
		sprite_index = spr_idleright
	}
}

if shotcooldown < 30{
	shotcooldown += 1
}

//Handle shooting the hammer animations
if keyboard_check(ord("X")) and shootstrength>=5 {
	if shootstrength < 15{
		shootstrength+=.5
		shootdrawdex+=1	
	}
	if sprite_index == spr_idleright or sprite_index == spr_hurtright or sprite_index == spr_jumpright or sprite_index == spr_walkright{
		sprite_index = spr_throwright	
	}else if sprite_index == spr_idleleft or sprite_index == spr_hurtleft or sprite_index == spr_jumpleft or sprite_index == spr_walkleft{
		sprite_index = spr_throwleft	
	}
	if sprite_index == spr_throwright or sprite_index == spr_throwleft{
		image_speed = 0
		if switchthrow == false{
			if image_index < 1{
				image_index += 1
			}else{
				switchthrow = true		
			}
		}else{
			if image_index >0{
				image_index -=1
			}else{
				switchthrow = false	
			}
		}
	}
}

//handle the actual shots
if key_shoot and shotcooldown == 30{
		shootstrength = 5	
		shootdrawdex = 0
	}
if keyboard_check_released(ord("X")) and shootdrawdex>0{
	shotcooldown = 0
	if canmove = false and pressedx = false{
		canmove = true
		pressedx = true
	}
	image_speed = .05
	if sprite_index == spr_throwright{
		shot = instance_create_depth(x + 15, y - 10, 0, obj_hammer)
		shot.direction = 30
		shot.speed = shootstrength
		shot.dir = 1
	}else{
		shot = instance_create_depth(x - 15, y - 10, 0, obj_hammer)
		shot.direction = 135
		shot.speed = shootstrength
		shot.dir = 0
	}
	shootdrawdex = -1
}

//throw animation
if sprite_index == spr_throwright or sprite_index == spr_throwleft{
	if image_index >= 4{
		image_speed = 0	
	}
}

//if fall off map restart
if y>room_height{
	if room != room_boss{
		global.timer = 0
		instance_destroy(obj_colorwheel)
		instance_create_depth(480,45,0,obj_colorwheel)
		global.curcolor = 0
		x = startx
		y = starty
	}else{
		obj_player.hearts = 0	
	}
}
depth = -1

//light aura
with (all){
	if collision_circle(obj_player.x,obj_player.y,obj_player.aurasize,self,false, false){
		visible = true	
	}
}

//shoot light beam
/*
if mouse_check_button_pressed(mb_left){
	drawbeam += 1
	beamangle = point_direction(x,y,mouse_x, mouse_y) - 90
}
if drawbeam > 0{
	xlen = lengthdir_x(100,beamangle)
	ylen = lengthdir_y(100,beamangle)
	with (all){
		if collision_line(obj_player.x, obj_player.y, obj_player.xlen, obj_player.ylen, self, false, false){
			visible = true	
		}
	}
	drawbeam += 1
	if drawbeam == 60{
		drawbeam = 0	
	}
}
*/


