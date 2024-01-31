/// @description Insert description here
// You can write your code in this editor
//obj_henchman



if room == room_chooselevel{
	visible = false
}else{
	visible = true	
}

//color orders
if room == room_tutorial or room == room_lvl3 or room == room_test{
	global.redorder = 0
	global.rednext = 1
	global.yelloworder = 1
	global.yellownext = 0
}else if room == room_lvl1 or room == room_lvl2{
	global.yelloworder = 0
	global.yellownext = 1
	global.redorder = 1
	global.rednext = 0
}else if room == room_lvl4 or room == room_boss or room == room_lvl6{
	global.blueorder = 2
	global.bluenext = 0
	global.redorder = 0
	global.rednext = 1
	global.yelloworder = 1
	global.yellownext = 2
}else if room == room_lvl5 or room == room_lvl7{
	global.blueorder = 0
	global.bluenext = 1
	global.redorder = 1
	global.rednext = 2
	global.yelloworder = 2
	global.yellownext = 0
}


if room == room_lvl1 or room == room_lvl2 or room == room_lvl3{
	if global.curcolor == global.redorder{
		if image_angle != lastangle - 180 and finish == 1{
			image_angle = lastangle - 180
			lastangle2 = image_angle
			finish = 0
		}
		if image_angle != lastangle2 - 180 and finish == 0{
			image_angle -= 30
		}else{
			lastangle = image_angle	
		}
		image_index = 4
	}else{
		if image_angle != lastangle2 - 180 and finish == 0{
			image_angle = lastangle2 - 180 
			lastangle = image_angle
			finish = 1
		}
		if image_angle != lastangle - 180 and (finish == 1 or finish == -1){
			image_angle -= 30
			
		}else{
			lastangle2 = image_angle	
			if finish == -1{
				finish = 1	
			}
		}
		image_index = 3
	}
}


if room == room_lvl4 or room == room_boss /*and colorvis == true*/{
	if global.curcolor == global.blueorder{
		if image_angle != -120 and flag == 2{
			image_angle -= 30	
		}else{
			image_index = 1
			image_angle = 0
			flag = 0
		}
		
	}else if global.curcolor == global.redorder{
		if image_angle != -120 and flag == 0{
			image_angle -= 30
		}else{
			image_index = 0
			image_angle = 0
			flag = 1
		}
	}else{
		if image_angle != -120 and flag == 1{
			image_angle -=30	
		}else{
			image_index = 2
			image_angle = 0			
			flag = 2
		}
		
	}
}

if room == room_lvl5 or room == room_lvl6 or room == room_lvl7 /*and colorvis == true*/{
	if global.curcolor == global.blueorder{
		image_index = 1
	}else if global.curcolor == global.redorder{
		image_index = 0
	}else{
		image_index = 2
	}
}



