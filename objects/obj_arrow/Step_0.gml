// apply gravity to the arrow
vspeed += grav
image_angle -= 10
image_xscale = 1.25
image_yscale = 1.25
if set == false{
	if which == 0 {
		hspeed = sign(_d) * (shootspeed - .5);
		vspeed = -(_g + _g * _t)  / 2 - _y / _t;
	}else if which == 1{
		hspeed = sign(_d) * (shootspeed - .5) * .7;
		vspeed =  (-(_g + _g * _t)  / 2 - _y / _t) * 1.3;
	}else if which == 2{
		hspeed = sign(_d) * (shootspeed - .5) * 1.3;
		vspeed =  (-(_g + _g * _t)  / 2 - _y / _t) * .7;
	}
	set = true
}
/*
// check for collision with the player
if collision_circle(x, y, sprite_width / 2, obj_player, false, false) {
    // collision with player detected, do something
    instance_destroy(); // destroy the arrow
}

// check if the arrow is out of bounds
if x < 0 || x > room_width || y < 0 || y > room_height {
    instance_destroy(); // destroy the arrow
}
*/