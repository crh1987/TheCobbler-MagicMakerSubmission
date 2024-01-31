/// @description Insert description here
// You can write your code in this editor
if flagtime < 30{
	flagtime +=1	
}else{
	if up == false{
		y-=1
		up = true
	}else{
		y+=1
		up = false
	}
	flagtime = 0
}

