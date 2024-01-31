image_xscale = 2
image_yscale = 2

if place_meeting(x, y+ 15, randomplatid){
	image_speed = 1.75
	vspeed = 3
}

if image_index >=6{
	image_index = 6	
	image_speed = 0
	
}
if setspeed0 == true{
	speed = 0	
}
if place_meeting(x,y,randomplatid){

	if done == 0{
		setspeed0 = true

		inst = instance_place(x,y,obj_redfloor)
		if inst == noone inst = instance_place(x,y,obj_yellowfloor)
		if inst == noone inst = instance_place(x,y,obj_bluefloor)
	
		inst3 = instance_create_depth(inst.x,inst.y,0,col)
		inst3.visible = true
		inst3.previouscolor = inst.object_index
		inst2 = instance_place(x,y,obj_replacefloor)
		instance_destroy(inst2)
		ind = ds_list_find_index(obj_henchman.bossFloorsConfiguppest, inst)
		whenfound = 0
		if ind == -1{
			ind = ds_list_find_index(obj_henchman.bossFloorsConfigupper, inst)
			whenfound = 1
		}if ind == -1{
			ind = ds_list_find_index(obj_henchman.bossFloorsConfiglower, inst)
			whenfound = 2
		}if ind == -1{
			ind = ds_list_find_index(obj_henchman.bossFloorsConfiglowest, inst)
			whenfound = 3
		}
		
		if whenfound == 0{
			ds_list_replace(obj_henchman.bossFloorsConfiguppest, ind, inst3)	
			inst3.layerlist = obj_henchman.bossFloorsConfiguppest
			inst3.idx = ind
		}if whenfound == 1{
			ds_list_replace(obj_henchman.bossFloorsConfigupper, ind, inst3)	
			inst3.layerlist = obj_henchman.bossFloorsConfigupper
			inst3.idx = ind
		}if whenfound == 2{
			ds_list_replace(obj_henchman.bossFloorsConfiglower, ind, inst3)	
			inst3.layerlist = obj_henchman.bossFloorsConfiglower
			inst3.idx = ind
		}if whenfound == 3{
			ds_list_replace(obj_henchman.bossFloorsConfiglowest, ind, inst3)	
			inst3.layerlist = obj_henchman.bossFloorsConfiglowest
			inst3.idx = ind
		}
		
		with (inst){
			instance_destroy()	
		}
		inst = noone

		instance_destroy(ex)
		done = 1
	}
	
	
}
if done>=1{
	done+=1	
}
if image_index >= 6 and done >= 6 {
	instance_destroy()
}

show_debug_message("done is: " + string(done))
show_debug_message("image_index is: " + string(image_index))

if x <= randomplatx and reachedtop = false{
	speed = 0	
	reachedtop = true
	drawindicators = true
}
if reachedtop == true{
	if time1 < 60{
		time1 +=1
		if first == false{
			x += 1.5
			first = true
		}else{
			if sec == false{
				x-=3
				sec = true
			}else{
				x +=3
				sec = false
			}
		}
	}else{
		if big == false and !place_meeting(x, y, randomplatid){
			vspeed += .45
		}else{
			if y>=330{
				speed = 0
				if image_xscale<5{
					//image_xscale+=.5
					//image_yscale+=.5
				}else{
					for(var i = 0; i<=ds_list_size(obj_henchman.bossFloorsConfiguppest)-1;i++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiguppest,i)
						if floor1.object_index != col{
							inst = instance_place(floor1.x, floor1.y, obj_replacefloor)
							//instance_destroy(inst)
							inst1 = instance_create_depth(floor1.x, floor1.y,0, col)
							inst1.visible = true
							inst1.previouscolor = floor1.object_index
							inst1.layerlist = obj_henchman.bossFloorsConfiguppest
							inst1.idx = i
							ds_list_replace(obj_henchman.bossFloorsConfiguppest, i, inst1)
							instance_destroy(floor1)
						}
					}
					for(var j = 0; j<=ds_list_size(obj_henchman.bossFloorsConfigupper)-1;j++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfigupper,j)
						if floor1.object_index != col{
							inst = instance_place(floor1.x, floor1.y, obj_replacefloor)
							//instance_destroy(inst)
							inst1 = instance_create_depth(floor1.x, floor1.y, 1, col)
							inst1.previouscolor = floor1.object_index
							inst1.visible = true
							inst1.layerlist = obj_henchman.bossFloorsConfigupper
							inst1.idx = j
							ds_list_replace(obj_henchman.bossFloorsConfigupper, j, inst1)
							instance_destroy(floor1)
						}
					}
					for(var k = 0; k<=ds_list_size(obj_henchman.bossFloorsConfiglower)-1;k++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglower,k)
						if floor1.object_index != col{
							inst = instance_place(floor1.x, floor1.y, obj_replacefloor)
							//instance_destroy(inst)
							inst1 = instance_create_depth(floor1.x, floor1.y, 1, col)
							inst1.previouscolor = floor1.object_index
							inst1.visible = true
							inst1.layerlist = obj_henchman.bossFloorsConfiglower
							inst1.idx = k
							ds_list_replace(obj_henchman.bossFloorsConfiglower, k, inst1)
							instance_destroy(floor1)
						}
					}
					for(var l = 0; l<=ds_list_size(obj_henchman.bossFloorsConfiglowest)-1;l++){
						floor1 = ds_list_find_value(obj_henchman.bossFloorsConfiglowest,l)
						if floor1.object_index != col{
							inst = instance_place(floor1.x, floor1.y, obj_replacefloor)
							//instance_destroy(inst)
							inst1 = instance_create_depth(floor1.x, floor1.y, 1, col)
							inst1.previouscolor = floor1.object_index
							inst1.visible = true
							inst1.layerlist = obj_henchman.bossFloorsConfiglowest
							inst1.idx = l
							ds_list_replace(obj_henchman.bossFloorsConfiglowest, l, inst1)
							instance_destroy(floor1)
						}
					}
					instance_destroy(ex)
					instance_destroy()
					
				}
			}else{
				if !place_meeting(x,y,randomplatid){
				vspeed+=.45	
				}
			}
		}
	}
}

if sprite_index == spr_hballyellow and createdflag == false{
	ex = instance_create_depth(randomplatx, randomplaty - 16, 0, obj_yellowex)
	createdflag = true
}
if sprite_index == spr_hballred and createdflag == false{
	ex = instance_create_depth(randomplatx, randomplaty - 16, 0, obj_redex)
	createdflag = true
}
if sprite_index == spr_hballblue and createdflag == false{
	ex = instance_create_depth(randomplatx, randomplaty - 16, 0, obj_blueex)
	createdflag = true
}

