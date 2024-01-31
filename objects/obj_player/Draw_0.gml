/// @description Insert description here
// You can write your code in this editor
draw_self()

//display power bar for shot
if shootdrawdex != -1{
	draw_sprite(spr_shootbar, shootdrawdex, x, y-20)
}

//explain lantern
if drawprompt == true{
	draw_text(obj_promptlantern.x, obj_promptlantern.y-15, "Press C to spawn a lantern")	
}

//explain spotlight
if drawprompt2 == true{
	draw_text(obj_spotlight.x + 25, obj_spotlight.y-20, "Press z to rotate the spotlight")
}

//shoot hammer before starting boss
if room == room_boss and pressedx == false{
	draw_sprite(spr_explainhammer,1,480,270)	
}
if room == room_lvl1{
	draw_set_color(c_red)
	draw_text(20,30, "Press enter to restart level at any time")	
	draw_text(20, 100, "Platforms are hidden, jump where you think they might be")
	draw_text(20, 150, "Pay mind to the color wheel at the top")
}

//light aura
/*
draw_set_alpha(.1)
draw_set_color(c_yellow)
draw_circle(x,y,aurasize,false)
draw_set_alpha(1)

//light beam
if drawbeam >0 and drawbeam <60{
	draw_sprite_ext(spr_lightbeamplayer, 0, x, y, 1, 100,beamangle,c_white,.5)
}
draw_text(100,100,string(xlen))
draw_text(100,200,string(ylen))
*/