if global.moved == true{
	pause = false	
}

if reachedbottom == false{
	vsp = vsp + grv;
}

if place_meeting(x, y + 1, obj_startfloor)
{
	vsp = 0
} 
y+=vsp

if obj_player.hearts == 0 or hearts == 0 or obj_player.canmove = false{
	canmove = false	
}else{
	canmove = true	
}

if canmove{

//grav



//animation
if sprite_index == spr_climbhench{
	image_speed = .25	
}else if sprite_index == spr_throwhenchmanleft{
	image_speed = .25
	if image_index == 2{
		image_speed = 0	
	}
}else if sprite_index == spr_broomdown{
	image_speed = .1
	if image_index >0{
		image_speed = 0	
	}
}else{
	image_speed = .5	
}
if hspeed<0 and sprite_index != spr_climbhench{
	sprite_index = spr_walklefthench	
}if hspeed>0 and sprite_index != spr_climbhench{
	sprite_index = spr_walkrighthench	
}if hspeed = 0 and sprite_index != spr_climbhench{
	if sprite_index = spr_walkrighthench{
		sprite_index = spr_idlerighthench	
	}else if sprite_index = spr_walklefthench{
		sprite_index = spr_idleleft2hench
	}
}


if hearts>=3{
	image_blend = c_white
}else{
	image_blend = c_red
	heartflag = true
}

//ALL collisions
onepixelh = sign(hsp) //moving left or right? right = 1, left = -1.
onepixelv = sign(vsp)




depth = -1

//AI code to shoot player
/*

*/
if bosstimer<1000{
	bosstimer+=1	
}else{
	bosstimer = 0	
}

if justhit == false{
	if curlevel == 0{
		invincible = false
		if timestart == false{
			randomtime = irandom(ds_list_size(timestomove) -1);
			nexttime = ds_list_find_value(timestomove, randomtime);
			timestart = true
		}
	
		if bosstimer<nexttime{
			if started == false{
				randomcheck = irandom(ds_list_size(floor1checkpoints) - 1);
				nextcheck = ds_list_find_value(floor1checkpoints, randomcheck);
				started = true
				inplace = false
			}
			if started == true and inplace = false{
				if x!=nextcheck{
					if (distance_to_point(nextcheck, y) < 3) {
						speed = 0;
						inplace = true
						started = false
					}else{
						move_towards_point(nextcheck, y, 3)
					}
				}
			}
		}else{
			if timeswitch == false{
				time1 = bosstimer
				timeswitch = true
			}
			if (bosstimer - time1) >= 15{
				if reachedbottom == false{
					if x!= ladder1.x + 8{
						if (distance_to_point(ladder1.x + 8, y) < 3) {
							speed = 0;
							reachedbottom = true	
						}else{
							move_towards_point(ladder1.x +8 , y, 3)
						}
					}
				}
			}else{
				speed = 0
				sprite_index = spr_throwhenchmanleft
				if canshoot = true and heartflag == false{
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)	
					a1.which = 0
					canshoot = false
				}else if canshoot = true and heartflag == true{
					othershottriggered = 1;
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)
					a2 = instance_create_depth(x-15, y, 1, obj_arrow)
					a3 = instance_create_depth(x-15, y, 1, obj_arrow)
					a1.which = 0
					a2.which = 1
					a3.which = 2
					canshoot = false
					shoottimer = 0
				}
			}	
		}
	}

	if reachedbottom == true and curlevel = 0{
		if (distance_to_point(ladder1.x + 8, ladder1.y - 180) < 3) {
			speed = 0;
			reachedbottom = false
			curlevel = 1
			timestart = false
			bosstimer = 0
			started = false
			inplace = false
			timeswitch = false
			canshoot = true
			sprite_index = spr_idleleft2hench
		}else{
			move_towards_point(ladder1.x + 8, ladder1.y - 180, 3)
			sprite_index = spr_climbhench
		}	
	}

	//level2


	if curlevel == 1 and retreating == false{
		if timestart == false{
			randomtime = irandom(ds_list_size(timestomove) -1);
			nexttime = ds_list_find_value(timestomove, randomtime);
			timestart = true
		}
	
		if bosstimer<nexttime{
			if started == false{
				randomcheck = irandom(ds_list_size(floor2checkpoints) - 1);
				nextcheck = ds_list_find_value(floor2checkpoints, randomcheck);
				started = true
				inplace = false
			}
			if started == true and inplace = false{
				if x!=nextcheck{
					if (distance_to_point(nextcheck, y) < 3) {
						speed = 0;
						inplace = true
						started = false
					}else{
						move_towards_point(nextcheck, y, 3)
					}
				}
			}
		}else{
			if timeswitch == false{
				time1 = bosstimer
				timeswitch = true
			}
			if (bosstimer - time1) >= 30{
				if reachedbottom == false{
					if x!= ladder1.x{
						if (distance_to_point(ladder1.x + 8, y) < 3) {
							speed = 0;
							reachedbottom = true	
						}else{
							move_towards_point(ladder1.x + 8, y, 3)
						}
					}
				}
			}else{
				speed = 0
				sprite_index = spr_throwhenchmanleft
				if canshoot = true and heartflag == false{
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)	
					a1.which = 0
					canshoot = false
				}else if canshoot = true and heartflag == true{
					othershottriggered = 1;
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)
					a2 = instance_create_depth(x-15, y, 1, obj_arrow)
					a3 = instance_create_depth(x-15, y, 1, obj_arrow)
					a1.which = 0
					a2.which = 1
					a3.which = 2
					canshoot = false
					shoottimer = 0
				}
			}	
		}
	}

	if reachedbottom == true and curlevel == 1 and retreating == false{
		if (distance_to_point(ladder1.x + 8, ladder1.y - 10) < 3) {
			speed = 0;
			sprite_index = spr_idleleft2hench
			reachedbottom = false
			curlevel = 0
			timestart = false
			bosstimer = 0
			started = false
			inplace = false
			timeswitch = false
			canshoot = true
		}else{
			move_towards_point(ladder1.x + 8, ladder1.y -10, 3)
			sprite_index = spr_climbhench
		}	
	}
}

//getting hit and running:
if justhit == true{
	speed = 0
	if curlevel == 0{
		if reachedbottom == false{
			if x!= ladder1.x + 8{
				if (distance_to_point(ladder1.x + 8, y) < 3) {
					speed = 0;
					reachedbottom = true
				}else{
					move_towards_point(ladder1.x +8 , y, 3)
				}
			}
		}else{
			if (distance_to_point(ladder1.x + 8, ladder1.y - 180) < 3) {
				speed = 0;
				reachedbottom = false
				curlevel = 1
				sprite_index = spr_idleleft2hench
			}else{
				sprite_index = spr_climbhench
				move_towards_point(ladder1.x + 8, ladder1.y -180, 3)
			}		
		}
	}
	if curlevel == 1{
		if reachedbottom == false{
			if x!= ladder2.x{
				if (distance_to_point(ladder2.x + 8, y) < 3) {
					speed = 0;
					reachedbottom = true	
				}else{
					move_towards_point(ladder2.x + 8 , y, 3)
				}
			}
		}else{
			if (distance_to_point(ladder2.x + 8, ladder2.y - 180) < 3) {
				speed = 0;
				reachedbottom = false
				curlevel = 2
				flag = 0
				justhit = false
				sprite_index = spr_idleleft2hench
			}else{
				sprite_index = spr_climbhench
				move_towards_point(ladder2.x + 8, ladder2.y -180, 3)
			}
		}
	}
}

//after retreating, shoot balls
if curlevel == 2{
	if timeswitch == false{
		time1 = bosstimer
		timeswitch = true
	}
	if (bosstimer - time1) <200{
		if x!= 560{
			if (distance_to_point(560, y) < 1) {
				speed = 0;
				//x = 560
			}else{
				move_towards_point(560, y, 1)
			}
		}	
	}
	
	
	if (bosstimer-time1) >= 135 and flag1 == 6{
		if sprite_index != spr_throwhenchmanleft{
			sprite_index = spr_throwhenchmanleft
			image_index = 0
		}
		a1 = instance_create_depth(x-15, y, 1, obj_arrow)
		if heartflag == true{
			a2 = instance_create_depth(x-15, y, 1, obj_arrow)
			a2.which = 2
		}
		flag1 = 7
	}
	if (bosstimer-time1) >= 165 and flag1 == 7{
		if sprite_index != spr_throwhenchmanleft{
			sprite_index = spr_throwhenchmanleft
			image_index = 0
		}
		a1 = instance_create_depth(x-15, y, 1, obj_arrow)
		
		flag1 = 8
	}
	if (bosstimer-time1) = 195 and flag1 == 8{
		if sprite_index != spr_throwhenchmanleft{
			sprite_index = spr_throwhenchmanleft
			image_index = 0
		}
		a1 = instance_create_depth(x-15, y, 1, obj_arrow)
		
		flag1 = 0
	}
	if (bosstimer - time1) > 60 and (bosstimer - time1) <250 and heartflag == false{
		if (bosstimer - time1) <90{
			image_speed = .1
			sprite_index = spr_broomdown
		}
		if getrandoms == false{
			randomplatindex = irandom(ds_list_size(bossFloorsConfigupper) -1);
			randomplat = ds_list_find_value(bossFloorsConfigupper, randomplatindex);
			randomplatcolor = object_get_name(randomplat.object_index)
		
			randomplatindex1 = irandom(ds_list_size(bossFloorsConfiglower) -1);
			randomplat2 = ds_list_find_value(bossFloorsConfiglower, randomplatindex1);
			randomplatcolor2 = object_get_name(randomplat2.object_index)
			
			randomplatindex2 = randomplatindex1
			
			getrandoms = true
		}
		while randomplatindex2 == randomplatindex1{
			randomplatindex2 = irandom(ds_list_size(bossFloorsConfiglower) -1);
			randomplat3 = ds_list_find_value(bossFloorsConfiglower, randomplatindex2);
			randomplatcolor3 = object_get_name(randomplat3.object_index)
		}
		if flag == 0{
			randcol = irandom(1)
			ballid = instance_create_depth(x,y,0,obj_henchmanball)	
			ballid.randomplatx = randomplat.x + 32
			ballid.randomplaty = randomplat.y
			ballid.randomplatid = randomplat
			with(ballid) {move_towards_point(randomplatx, 50, 4)}
			if randomplatcolor == "obj_redfloor"{
				if randcol == 0{
					ballid.sprite_index = spr_hballyellow	
					ballid.col = obj_yellowfloor
				}else{
					ballid.sprite_index = spr_hballblue
					ballid.col = obj_bluefloor
				}
			}else if randomplatcolor == "obj_yellowfloor"{
				if randcol == 0{
					ballid.sprite_index = spr_hballred
					ballid.col = obj_redfloor
				}else{
					ballid.sprite_index = spr_hballblue
					ballid.col = obj_bluefloor
				}
			}else if randomplatcolor == "obj_bluefloor"{
				if randcol == 0{
					ballid.sprite_index = spr_hballyellow	
					ballid.col = obj_yellowfloor
				}else{
					ballid.sprite_index = spr_hballred
					ballid.col = obj_redfloor
				}
			}
			ballid.image_xscale = .75
			ballid.image_yscale = .75
			flag = 1
		}if flag==1{
			randcol1 = irandom(1)
			ballid = instance_create_depth(x,y,0,obj_henchmanball)	
			ballid.randomplatx = randomplat2.x + 32
			ballid.randomplaty = randomplat2.y
			ballid.randomplatid = randomplat2
			with(ballid) {move_towards_point(randomplatx, 50, 4)}
			if randomplatcolor2 == "obj_redfloor"{
				if randcol1 == 0{
					ballid.sprite_index = spr_hballyellow	
					ballid.col = obj_yellowfloor
				}else{
					ballid.sprite_index = spr_hballblue
					ballid.col = obj_bluefloor
				}
			}else if randomplatcolor2 == "obj_yellowfloor"{
				if randcol1 == 0{
					ballid.sprite_index = spr_hballred	
					ballid.col = obj_redfloor
				}else{
					ballid.sprite_index = spr_hballblue
					ballid.col = obj_bluefloor
				}
			}else if randomplatcolor2 == "obj_bluefloor"{
				if randcol1 == 0{
					ballid.sprite_index = spr_hballred	
					ballid.col = obj_redfloor
				}else{
					ballid.sprite_index = spr_hballyellow
					ballid.col = obj_yellowfloor
				}
			}
			ballid.image_xscale = .75
			ballid.image_yscale = .75
			flag = 2
		}if flag==2{
			randcol2 = irandom(1)
			ballid = instance_create_depth(x,y,0,obj_henchmanball)	
			ballid.randomplatx = randomplat3.x + 32
			ballid.randomplaty = randomplat3.y
			ballid.randomplatid = randomplat3
			with(ballid) {move_towards_point(randomplatx, 50, 4)}
			if randomplatcolor3 == "obj_redfloor"{
				if randcol2 == 0{
					ballid.sprite_index = spr_hballyellow	
					ballid.col = obj_yellowfloor
				}else{
					ballid.sprite_index = spr_hballblue
					ballid.col = obj_bluefloor
				}
			}else if randomplatcolor3 == "obj_yellowfloor"{
				if randcol2 == 0{
					ballid.sprite_index = spr_hballred	
					ballid.col = obj_redfloor
				}else{
					ballid.sprite_index = spr_hballblue
					ballid.col = obj_bluefloor
				}
			}else if randomplatcolor3 == "obj_bluefloor"{
				if randcol2 == 0{
					ballid.sprite_index = spr_hballyellow	
					ballid.col = obj_yellowfloor
				}else{
					ballid.sprite_index = spr_hballred
					ballid.col = obj_redfloor
				}
			}
			ballid.image_xscale = .75
			ballid.image_yscale = .75
			flag = 3
			reachedbottom = false
		}
	}
	if (bosstimer - time1) > 60 and (bosstimer - time1) <250 and heartflag == true{
		sprite_index = spr_broomdown
		if flag = 0{
			
			rand = irandom(2)
	
			if rand == 0{
				for(var i = 0; i<=ds_list_size(obj_henchman.bossFloorsConfiguppest)-1;i++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiguppest,i)
						if floor1.object_index != obj_redfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballred
							ballid.col = obj_redfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					for(var j = 0; j<=ds_list_size(obj_henchman.bossFloorsConfigupper)-1;j++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfigupper,j)
						if floor1.object_index != obj_redfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballred
							ballid.col = obj_redfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
					for(var k = 0; k<=ds_list_size(obj_henchman.bossFloorsConfiglower)-1;k++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglower,k)
						if floor1.object_index != obj_redfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballred
							ballid.col = obj_redfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
					for(var l = 0; l<=ds_list_size(obj_henchman.bossFloorsConfiglowest)-1;l++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglowest,l)
						if floor1.object_index != obj_redfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballred
							ballid.col = obj_redfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
				}
			}else if rand == 1{
				for(var i = 0; i<=ds_list_size(obj_henchman.bossFloorsConfiguppest)-1;i++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiguppest,i)
						if floor1.object_index != obj_yellowfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballyellow
							ballid.col = obj_yellowfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					for(var j = 0; j<=ds_list_size(obj_henchman.bossFloorsConfigupper)-1;j++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfigupper,j)
						if floor1.object_index != obj_yellowfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballyellow
							ballid.col = obj_yellowfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
					for(var k = 0; k<=ds_list_size(obj_henchman.bossFloorsConfiglower)-1;k++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglower,k)
						if floor1.object_index != obj_yellowfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballyellow
							ballid.col = obj_yellowfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
					for(var l = 0; l<=ds_list_size(obj_henchman.bossFloorsConfiglowest)-1;l++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglowest,l)
						if floor1.object_index != obj_yellowfloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballyellow
							ballid.col = obj_yellowfloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
				}
			}else if rand == 2{
				for(var i = 0; i<=ds_list_size(obj_henchman.bossFloorsConfiguppest)-1;i++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiguppest,i)
						if floor1.object_index != obj_bluefloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballblue
							ballid.col = obj_bluefloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					for(var j = 0; j<=ds_list_size(obj_henchman.bossFloorsConfigupper)-1;j++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfigupper,j)
						if floor1.object_index != obj_bluefloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballblue
							ballid.col = obj_bluefloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
					for(var k = 0; k<=ds_list_size(obj_henchman.bossFloorsConfiglower)-1;k++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglower,k)
						if floor1.object_index != obj_bluefloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballblue
							ballid.col = obj_bluefloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
					for(var l = 0; l<=ds_list_size(obj_henchman.bossFloorsConfiglowest)-1;l++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglowest,l)
						if floor1.object_index != obj_bluefloor{
							ballid = instance_create_depth(x,y,0,obj_henchmanball)
							ballid.image_xscale = 1.5
							ballid.image_yscale = 1.5
							ballid.randomplatx = floor1.x + 32
							ballid.randomplaty = floor1.y
							ballid.sprite_index = spr_hballblue
							ballid.col = obj_bluefloor
							ballid.randomplatid = floor1
							with (ballid) { move_towards_point(randomplatx, 50, 4) }
						}
					}
				}
			}
			
			flag = 1
		}
	}
	
	if (bosstimer - time1) >= 250{
		canshoot = false
		retreating = true
		if reachedbottom == false{
			if x!= ladder2.x + 8{
				if (distance_to_point(ladder2.x + 8, y) < 3) {
					speed = 0;
					reachedbottom = true	
				}else{
					hspeed = 3
				}
			}
		}
		if reachedbottom == true{
			if (distance_to_point(ladder2.x + 8, ladder2.y - 10) < 3) {
				speed = 0;
				sprite_index = spr_idleleft2hench
				reachedbottom = false
				curlevel = 1
				timestart = false
				bosstimer = 0
				started = false
				inplace = false
				timeswitch = false
				canshoot = true
				getrandoms = false
			}else{
				move_towards_point(ladder2.x + 8, ladder2.y -10, 3)
				sprite_index = spr_climbhench
			}	
		}
	}
}

//complete retreating to bottom code after hit
if reachedbottom == false and curlevel == 1 and retreating == true{
	if x!= ladder1.x + 8{
		if (distance_to_point(ladder1.x + 8, y) < 3) {
			speed = 0;
			reachedbottom = true	
		}else{
			move_towards_point(ladder1.x + 8, y, 3)
		}
	}
}
if reachedbottom == true and curlevel == 1 and retreating == true{
	if (distance_to_point(ladder1.x + 8, ladder1.y - 10) < 3) {
		speed = 0;
		sprite_index = spr_idleleft2hench
		reachedbottom = false
		curlevel = 0
		timestart = false
		bosstimer = 0
		started = false
		inplace = false
		timeswitch = false
		canshoot = true
		getrandoms = false
		invincible = false
		retreating = false
	}else{
		move_towards_point(ladder1.x + 8, ladder1.y -10, 3)
		sprite_index = spr_climbhench
	}	
}

}else{
	speed = 0
	image_speed = 0
}