/// @description Insert description here
// You can write your code in this editor
countdown --
depth = 0
if countdown <=0{
	if y>440{
		y-=5	
	}
}
if y <= 440{
	if image_alpha >= .9{
		fading = true
	}
	if fading == true{
		image_alpha-=.015
	}
	if image_alpha <= .1{
		fading = false	
	}
	if fading == false{
		image_alpha += .015
	}
}

